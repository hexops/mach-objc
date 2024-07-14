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

# Delete generated files
rm -rf src/metal/mtl.zig
rm -rf src/avf_audio/avaudio.zig
rm -rf src/core_midi/coremidi.zig

echo "Generating Metal"
echo "
#include <Metal/Metal.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/metal/
cat mtl_manual.zig > src/metal/mtl.zig
./zig-out/bin/generator --framework Metal >> src/metal/mtl.zig
zig fmt src/metal/mtl.zig
rm headers.json headers.m

echo "Generating AVFAudio"
cp avf_audio_headers.m headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/avf_audio/
cat avf_audio_manual.zig > src/avf_audio/avaudio.zig
./zig-out/bin/generator --framework AVFAudio >> src/avf_audio/avaudio.zig
zig fmt src/avf_audio/avaudio.zig
rm headers.json headers.m

echo "Generating CoreMIDI"
echo "
#include <CoreMIDI/MidiServices.h>
" > headers.m
clang headers.m -F ./xcode-frameworks/Frameworks -Xclang -ast-dump=json -fsyntax-only -Wno-deprecated-declarations > headers.json
mkdir -p src/core_midi/
cat core_midi_manual.zig > src/core_midi/coremidi.zig
./zig-out/bin/generator --framework CoreMIDI >> src/core_midi/coremidi.zig
zig fmt src/core_midi/coremidi.zig
rm headers.json headers.m

# TODO: generate src/foundation/ns.zig
# TODO: generate src/quartz_core/ca.zig
