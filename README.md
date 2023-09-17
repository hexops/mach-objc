# mach-objc: Generated Objective-C bindings for Zig

Zig bindings to various Objective-C APIs, e.g. Metal, using [mach-objc-generator](https://github.com/hexops/mach-objc-generator). Features:

- Zero-fuss installation, cross compilation, and no system dependencies.

## Usage

See https://machengine.org/pkg/mach-objc

Use `generate.sh` to regenerate the source files. Only `metal/mtl.zig` can be regenerated at this point, but other frameworks may be added later.

Methods using generic types (e.g. `ns.Array`) or inline block types are not being translated correctly and are currently commented out by hand. This will be updated soon in mach-objc-generator.

## Issues

Issues are tracked in the [main Mach repository](https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Aobjc).

## Community

Join the Mach engine community [on Discord](https://discord.gg/XNG3NZgCqp) to discuss this project, ask questions, get help, etc.

## Special thanks

Special thanks to @pdoane who did all of the initial work on the generator and generously contributed this to the Mach ecosystem.
