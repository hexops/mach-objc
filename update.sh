#!/usr/bin/env bash
set -euo pipefail

# TODO: delete this shell script and move all this logic into generator.zig

# `git clone --depth 1` but at a specific revision
git_clone_rev() {
    repo=$1
    rev=$2
    dir=$3

    rm -rf "$dir"
    mkdir "$dir"
    pushd "$dir"
    git init -q
    git fetch "$repo" "$rev" --depth 1
    git checkout -q FETCH_HEAD
    popd
}

git_clone_rev https://github.com/hexops/xcode-frameworks a6bf82e032d4d9923ad5c222d466710fcc05f249 xcode-frameworks

zig build -Doptimize=ReleaseFast

rm -f src/metal.zig
echo "Generating Metal"
echo "
#include <Metal/Metal.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
cat metal_manual.zig > src/metal.zig
./zig-out/bin/generator --framework Metal >> src/metal.zig
rm headers.json headers.m

rm -f src/avf_audio.zig
echo "Generating AVFAudio"
cp avf_audio_headers.m headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
cat avf_audio_manual.zig > src/avf_audio.zig
./zig-out/bin/generator --framework AVFAudio >> src/avf_audio.zig
rm headers.json headers.m

rm -f src/core_midi.zig
echo "Generating CoreMIDI"
echo "
#include <CoreMIDI/MidiServices.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
cat core_midi_manual.zig > src/core_midi.zig
./zig-out/bin/generator --framework CoreMIDI >> src/core_midi.zig
rm headers.json headers.m

rm -f src/app_kit.zig
echo "Generating AppKit"
echo "
#include <AppKit/AppKit.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations -Wno-availability > headers.json
cat app_kit_manual.zig > src/app_kit.zig
./zig-out/bin/generator --framework AppKit >> src/app_kit.zig
rm headers.json headers.m

rm -f src/screen_capture_kit.zig
echo "Generating ScreenCaptureKit"
echo "
#include <ScreenCaptureKit/ScreenCaptureKit.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations -Wno-availability > headers.json
cat screen_capture_kit_manual.zig > src/screen_capture_kit.zig
./zig-out/bin/generator --framework ScreenCaptureKit >> src/screen_capture_kit.zig
rm headers.json headers.m

rm -f src/core_media.zig
echo "Generating CoreMedia"
echo "
#include <CoreMedia/CoreMedia.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations -Wno-availability > headers.json
cat core_media_manual.zig > src/core_media.zig
./zig-out/bin/generator --framework CoreMedia >> src/core_media.zig
rm headers.json headers.m

rm -f src/core_video.zig
echo "Generating CoreVideo"
echo "
#include <CoreVideo/CoreVideo.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations -Wno-availability > headers.json
cat core_video_manual.zig > src/core_video.zig
./zig-out/bin/generator --framework CoreVideo >> src/core_video.zig
rm headers.json headers.m

zig fmt .

# TODO: generate src/foundation/ns.zig
# TODO: generate src/quartz_core/ca.zig

# Generate assembly. We currently target iOS 15+ and macOS 12+.
# TODO: Add arm64-apple-ios15 and x86_64-apple-ios15-simulator to the targets once we get their SDKs in xcode-frameworks
for pair in \
    'MACHAppDelegate_aarch64-macos.s aarch64-macos.12.0' \
    'MACHAppDelegate_x86_64-macos.s x86_64-macos.12.0'
do
    dst=${pair%% *}
    target=${pair#* }

    zig cc -c MACHAppDelegate.m \
        -target "$target" \
        -S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions \
        -o "$dst" \
        -iframework ./xcode-frameworks/Frameworks \
        -isystem ./xcode-frameworks/include

    cat "$dst" |
        sed 's/\x01/\\x01/g' |
        sed 's/  *; .*//g' | # Strip comments at the end of lines
        sed 's/  *## .*//g' |
        sed '/^    \.build_version .*/d' | # Strip OS-specific version info
        sed '/^; .*/d' | # Strip whole-line comments
        sed '/^## .*/d' > "$dst.tmp"

    mv "$dst.tmp" "$dst"
done

mv MACHAppDelegate_aarch64-macos.s MACHAppDelegate_arm64_apple_macos12.s
mv MACHAppDelegate_x86_64-macos.s MACHAppDelegate_x86_64_apple_macos12.s
