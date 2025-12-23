# zglm (wip)

[Zig](https://ziglang.org) OpenGL Mathematics library. Heavily based on the [linmath](https://github.com/datenwolf/linmath.h) and [mach/math](https://github.com/hexops/mach/tree/main/src/math) libraries. Only tested on Zig v0.15.2.

## Conventions

All matrices and vectors are column-major. While most math libraries provide both left-handed and right-handed variants for each operation (e.g. `doThingLh`, `doThingRh`), zglm chooses a default of right-handed coordinates with +Y being up, NDC coordinates being -1 to 1, and the origin point being at the bottom left. This is consistent with OpenGL conventions.

## Vectors

```zig
const zglm = @import("zglm");

const a = zglm.vec3f(1, 2, 3);
const b = zglm.Vec3f.one();
const c = a.cross(zglm.swizzle(b, .zyx));
```