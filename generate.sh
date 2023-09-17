git clone https://github.com/hexops/mach-objc-generator.git

echo "
#include <Metal/Metal.h>
" >> headers.m

clang headers.m -Xclang -ast-dump=json -fsyntax-only > headers.json
cat mtl_manual.zig > src/metal/mtl.zig
zig run mach-objc-generator/src/main.zig >> src/metal/mtl.zig
zig fmt src/metal/mtl.zig
rm headers.json headers.m
rm -rf mach-objc-generator
