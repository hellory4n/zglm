# zglm (wip)

[Zig](https://ziglang.org) OpenGL Mathematics library. Only tested on Zig v0.15.2.

As the GL in the name implies, zglm is intended to be similar to GLSL, [GLM](https://github.com/g-truc/glm), and work with OpenGL conventions, that is, column-major matrices, right-handed coordinates, +Y up, and NDC ranging from -1 to 1. All rotations are in radians unless otherwise noted.

## Getting started

Run `zig fetch --save git+https://github.com/hellory4n/zglm.git`

And add this (for example) to your `build.zig`:

```zig
const zglm = b.dependency("zglm", .{});
exe.root_module.addImport("zglm", zglm.module("zglm"));
```

## Vectors

Vectors are just Zig's [`@Vector`](https://ziglang.org/documentation/0.15.2/#Vectors) but fancier.

```zig
const zglm = @import("zglm");

const a = zglm.Vec3f{1, 2, 3};
const b = @splat(1);
const c = zglm.cross(b, zglm.zyx(a));
```

## Matrices

```zig
const zglm = @import("zglm");

const model = zglm.identity4x4f().rotate(zglm.radians(45), .{ 1, 0, 0 });
const view_rot = zglm.identity4x4f().rotate(zglm.radians(78), .{ 0, 1, 0 });
const view_pos = zglm.identity4x4f().translate(.{ 14, 4, -58 });
const view = view_rot.mul(view_pos);
const proj = zglm.perspectivef(.{
    .fovy_rad = zglm.radians(70),
    .aspect_ratio = 16.0 / 9.0,
    .z_near = 0.001,
    .z_far = 1000,
});
const mvp = proj.mul(view).mul(model);
```