const std = @import("std");

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

const vec2 = @import("vec2.zig");
pub const Vec2 = vec2.Vec2;
pub const Vec2f = vec2.Vec2f;
pub const Vec2d = vec2.Vec2d;
pub const Vec2i = vec2.Vec2i;
pub const Vec2l = vec2.Vec2l;
pub const vec2f = vec2.vec2f;
pub const vec2d = vec2.vec2d;
pub const vec2i = vec2.vec2i;
pub const vec2l = vec2.vec2l;

test {
    std.testing.refAllDecls(@This());
}
