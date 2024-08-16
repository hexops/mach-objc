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

git_clone_rev https://github.com/hexops/xcode-frameworks 3d1d9613c39bfc2ebfa2551626e87b7f38e0a29f xcode-frameworks

zig build -Doptimize=ReleaseFast

rm -rf src/metal/mtl.zig
echo "Generating Metal"
echo "
#include <Metal/Metal.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/metal/
cat mtl_manual.zig > src/metal/mtl.zig
./zig-out/bin/generator --framework Metal >> src/metal/mtl.zig
rm headers.json headers.m

rm -rf src/avf_audio/avaudio.zig
echo "Generating AVFAudio"
cp avf_audio_headers.m headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/avf_audio/
cat avf_audio_manual.zig > src/avf_audio/avaudio.zig
./zig-out/bin/generator --framework AVFAudio >> src/avf_audio/avaudio.zig
rm headers.json headers.m

rm -rf src/core_midi/coremidi.zig
echo "Generating CoreMIDI"
echo "
#include <CoreMIDI/MidiServices.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/core_midi/
cat core_midi_manual.zig > src/core_midi/coremidi.zig
./zig-out/bin/generator --framework CoreMIDI >> src/core_midi/coremidi.zig
rm headers.json headers.m

rm -rf src/appkit/appkit.zig
echo "Generating AppKit"
echo "
#include <AppKit/AppKit.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations -Wno-availability > headers.json
mkdir -p src/appkit/
cat appkit_manual.zig > src/appkit/appkit.zig
./zig-out/bin/generator --framework AppKit >> src/appkit/appkit.zig
rm headers.json headers.m

zig fmt .

# TODO: generate src/foundation/ns.zig
# TODO: generate src/quartz_core/ca.zig

# Generate assembly. We currently target iOS 15+ and macOS 12+.
# TODO: Add arm64-apple-ios15 and x86_64-apple-ios15-simulator to the targets once we get their SDKs in xcode-frameworks
CFLAGS=(-S -Os -fomit-frame-pointer -fobjc-arc -fno-objc-exceptions -iframework ./xcode-frameworks/Frameworks -isystem ./xcode-frameworks/include)
for target in arm64-apple-macos12 x86_64-apple-macos12
do
    cc -c MACHAppDelegate.m -target "$target" -o - $CFLAGS |
        sed 's/\x01/\\x01/g' |
        sed 's/  *; .*//g' | # Strip comments at the end of lines
        sed 's/  *## .*//g' |
        sed '/^    \.build_version .*/d' | # Strip OS-specific version info
        sed '/^; .*/d' | # Strip whole-line comments
        sed '/^## .*/d' > "MACHAppDelegate_${target//-/_}.s"
done

