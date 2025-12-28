const std = @import("std");
const testing = std.testing;

// 2 math namespaces is a bit obnoxious
// instead we export some std.math stuff here so that you only have to use the zglm namespace
// for math
// also changed some names and made some wrapper things to make it nicer
pub const eps = std.math.floatEps;
pub const e = std.math.e;
pub const pi = std.math.pi;
pub const phi = std.math.phi;
pub const tau = std.math.tau;
pub const rad_per_deg = std.math.rad_per_deg;
pub const deg_per_rad = std.math.deg_per_rad;

// TODO vector versions for these
pub const nan = std.math.nan;
pub const inf = std.math.inf;
pub const isNan = std.math.isNan;
pub const isFinite = std.math.isFinite;
pub const isNormal = std.math.isNormal;
pub const isInf = std.math.isInf;
pub const acos = std.math.acos;
pub const acosh = std.math.acosh;
pub const asin = std.math.asin;
pub const asinh = std.math.asinh;
pub const atan = std.math.atan;
pub const atan2 = std.math.atan2;
pub const atanh = std.math.atanh;
pub const ceil = std.math.ceil;
pub const clamp = std.math.clamp;
pub const cos = std.math.cos;
pub const cosh = std.math.cosh;
pub const deg2rad = std.math.degreesToRadians;
pub const rad2deg = std.math.radiansToDegrees;
pub const exp = std.math.exp;
pub const exp2 = std.math.exp2;
pub const expm1 = std.math.expm1;
pub const floatMax = std.math.floatMax;
pub const floatMin = std.math.floatMin;
pub const floatTrueMin = std.math.floatTrueMin;
pub const floor = std.math.floor;
pub const lerp = std.math.lerp;
pub const log = std.math.log;
pub const maxInt = std.math.maxInt;
pub const minInt = std.math.minInt;
pub const pow = std.math.pow;
pub const powi = std.math.powi;
pub const round = std.math.round;
pub const sin = std.math.sin;
pub const sinh = std.math.sinh;
pub const sqrt = std.math.sqrt;
pub const tan = std.math.tan;
pub const tanh = std.math.tanh;

/// Performs an approximate comparison of two floating point values x and y. Returns true if the
/// absolute difference between them is less or equal than `zglm.eps(T)`.
///
/// NaN values are never considered equal to any value.
pub fn approxEq(a: anytype, b: anytype) bool {
    if (@TypeOf(a) != @TypeOf(b)) {
        @compileError("a and b must be the same type");
    }

    const epsilon = switch (@typeInfo(@TypeOf(a))) {
        .float => eps(@TypeOf(a)),
        .comptime_float => eps(comptime_float),
        else => @compileError("expected float, got " ++ @typeName(@TypeOf(a))),
    };
    return std.math.approxEqAbs(@TypeOf(a), a, b, epsilon);
}

const vec2_mod = @import("vec2.zig");
pub const Vec2 = vec2_mod.Vec2;
pub const Vec2f = vec2_mod.Vec2f;
pub const Vec2d = vec2_mod.Vec2d;
pub const Vec2i = vec2_mod.Vec2i;
pub const Vec2l = vec2_mod.Vec2l;
pub const vec2f = vec2_mod.vec2f;
pub const vec2d = vec2_mod.vec2d;
pub const vec2i = vec2_mod.vec2i;
pub const vec2l = vec2_mod.vec2l;

const vec3_mod = @import("vec3.zig");
pub const Vec3 = vec3_mod.Vec3;
pub const Vec3f = vec3_mod.Vec3f;
pub const Vec3d = vec3_mod.Vec3d;
pub const Vec3i = vec3_mod.Vec3i;
pub const Vec3l = vec3_mod.Vec3l;
pub const vec3f = vec3_mod.vec3f;
pub const vec3d = vec3_mod.vec3d;
pub const vec3i = vec3_mod.vec3i;
pub const vec3l = vec3_mod.vec3l;

const vec4_mod = @import("vec4.zig");
pub const Vec4 = vec4_mod.Vec4;
pub const Vec4f = vec4_mod.Vec4f;
pub const Vec4d = vec4_mod.Vec4d;
pub const Vec4i = vec4_mod.Vec4i;
pub const Vec4l = vec4_mod.Vec4l;
pub const vec4f = vec4_mod.vec4f;
pub const vec4d = vec4_mod.vec4d;
pub const vec4i = vec4_mod.vec4i;
pub const vec4l = vec4_mod.vec4l;

const vec_ops = @import("vec_ops.zig");

fn SwizzleLiteralToZglmVector(comptime Src: type, comptime comps: @TypeOf(.enum_literal)) type {
    const vec_type = @typeInfo(Src).vector.child;
    const vec_len = @typeInfo(vec_ops.TypeFromSwizzleLiteral(vec_type, comps)).vector.len;
    return switch (vec_len) {
        2 => Vec2(vec_type),
        3 => Vec3(vec_type),
        4 => Vec4(vec_type),
        else => unreachable,
    };
}

/// Implements vector swizzling through major amounts of tomfoolery. For example `.xy`, `.zxy`,
/// `.zzzw`, really any combination of xyzw that comes to mind. RGBA is also supported, for
/// example `.abgr`.
pub fn swizzle(
    src: anytype,
    comptime comps: @TypeOf(.enum_literal),
) SwizzleLiteralToZglmVector(@TypeOf(src.raw), comps) {
    const vec = vec_ops.swizzleImpl(src.raw, comps);
    const vec_type = @typeInfo(@TypeOf(vec)).vector.child;
    const vec_len = @typeInfo(@TypeOf(vec)).vector.len;

    return switch (vec_len) {
        2 => Vec2(vec_type).fromStdVector(vec),
        3 => Vec3(vec_type).fromStdVector(vec),
        4 => Vec4(vec_type).fromStdVector(vec),
        else => unreachable,
    };
}

test "vec2 -> vec2 swizzle" {
    const v = vec2i(1, 2);
    try testing.expectEqual(vec2i(1, 2), swizzle(v, .xy));
    try testing.expectEqual(vec2i(2, 1), swizzle(v, .yx));
    try testing.expectEqual(vec2i(1, 1), swizzle(v, .xx));
    try testing.expectEqual(vec2i(2, 2), swizzle(v, .yy));
}

test "vec2 -> vec3 swizzle" {
    const v = vec2i(2, 3);
    const swizzelma = swizzle(v, .yxx);
    try testing.expectEqual(vec3i(3, 2, 2), swizzelma);
    try testing.expectEqual(vec3i(2, 3, 2), swizzle(v, .xyx));
    try testing.expectEqual(vec3i(3, 3, 2), swizzle(v, .yyx));
    try testing.expectEqual(vec3i(2, 3, 0), swizzle(v, .xy0));
    try testing.expectEqual(vec3i(2, 3, 1), swizzle(v, .xy1));
}

test "vec3 -> vec2 swizzle" {
    const v = vec3i(4, 5, 6);
    try testing.expectEqual(vec2i(4, 5), swizzle(v, .xy));
    try testing.expectEqual(vec2i(6, 4), swizzle(v, .zx));
    try testing.expectEqual(vec2i(5, 5), swizzle(v, .yy));
}

test "vec3 -> vec3 swizzle" {
    const v = vec3i(7, 8, 9);
    try testing.expectEqual(vec3i(7, 8, 9), swizzle(v, .xyz));
    try testing.expectEqual(vec3i(9, 8, 7), swizzle(v, .zyx));
    try testing.expectEqual(vec3i(8, 7, 8), swizzle(v, .yxy));
}

test "vec3 -> vec4 swizzle" {
    const v = vec3i(1, 2, 3);
    try testing.expectEqual(vec4i(1, 2, 3, 1), swizzle(v, .xyzx));
    try testing.expectEqual(vec4i(3, 3, 2, 1), swizzle(v, .zzyx));
}

test "vec4 swizzle" {
    const v = vec4i(10, 20, 30, 40);
    try testing.expectEqual(
        vec4i(10, 20, 30, 40),
        swizzle(v, .xyzw),
    );
    try testing.expectEqual(
        vec4i(40, 30, 20, 10),
        swizzle(v, .wzyx),
    );
    try testing.expectEqual(
        vec3i(20, 20, 40),
        swizzle(v, .yyw),
    );
}

test "rgba swizzle" {
    const v = vec4i(10, 20, 30, 40);
    try testing.expectEqual(
        vec4i(40, 30, 20, 10),
        swizzle(v, .abgr),
    );
}

// just making sure it compiles
test "the vector section from the readme" {
    const zglm = @This();

    const a = zglm.vec3f(1, 2, 3);
    const b = zglm.Vec3f.one();
    const c = a.cross(zglm.swizzle(b, .zyx));

    // "unused local constant" shut up
    _ = c;
}

const mat4x4_mod = @import("mat4x4.zig");
pub const Mat4x4 = mat4x4_mod.Mat4x4;

// just making sure it compiles
test "the matrix section from the readme" {
    const zglm = @This();

    const pos = zglm.Mat4x4.translate(zglm.vec3f(1, 2, 3));
    const rot = zglm.Mat4x4.rotateX(1).mul(zglm.Mat4x4.rotateY(2));

    const model = zglm.Mat4x4.identity();
    const view = rot.mul(pos);
    const projection = zglm.Mat4x4.perspective(zglm.deg2rad(45), 16 / 9, 0.001, 1000);
    const mvp = projection.mul(view).mul(model);

    // "unused local constant" shut up
    _ = mvp;
}

test {
    std.testing.refAllDecls(@This());
}
