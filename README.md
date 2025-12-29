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

```zig
const zglm = @import("zglm");

const a = zglm.vec3f(1, 2, 3);
const b = zglm.Vec3f.one();
const c = a.cross(zglm.swizzle(b, .zyx));
```

## Matrices

```zig
const zglm = @import("zglm");
const pos = zglm.Mat4x4.translate(zglm.vec3f(1, 2, 3));
const rot = zglm.Mat4x4.rotateX(1).mul(zglm.Mat4x4.rotateY(2));

const model = zglm.Mat4x4.identity();
const view = rot.mul(pos);
const projection = zglm.Mat4x4.perspective(zglm.deg2rad(45), 16 / 9, 0.001, 1000);
const mvp = projection.mul(view).mul(model);
```