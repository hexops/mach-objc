git clone https://github.com/hexops/mach-objc-generator.git

echo "
#include <Metal/Metal.h>
" > headers.m
clang headers.m -Xclang -ast-dump=json -fsyntax-only > headers.json
cat mtl_manual.zig > src/metal/mtl.zig
zig run mach-objc-generator/src/main.zig -- --framework Metal >> src/metal/mtl.zig
zig fmt src/metal/mtl.zig
rm headers.json headers.m

cp avf_audio_headers.m headers.m
clang headers.m -Xclang -ast-dump=json -fsyntax-only > headers.json
cat avf_audio_manual.zig > src/avf_audio/avaudio.zig
zig run mach-objc-generator/src/main.zig -- --framework AVFAudio >> src/avf_audio/avaudio.zig
zig fmt src/avf_audio/avaudio.zig
rm headers.json headers.m

echo "
#include <CoreMIDI/MidiServices.h>
" > headers.m
clang headers.m -Xclang -ast-dump=json -fsyntax-only > headers.json
cat core_midi_manual.zig > src/core_midi/coremidi.zig
zig run mach-objc-generator/src/main.zig -- --framework CoreMIDI >> src/core_midi/coremidi.zig
zig fmt src/core_midi/coremidi.zig
rm headers.json headers.m

rm -rf mach-objc-generator
