const t = @import("std").testing;
const zglm = @import("zglm.zig");

// c naming conventions my beloved
pub const Vec2hf = @Vector(2, f16);
pub const Vec2f = @Vector(2, f32);
pub const Vec2d = @Vector(2, f64);
pub const Vec2c = @Vector(2, i8);
pub const Vec2h = @Vector(2, i16);
pub const Vec2i = @Vector(2, i32);
pub const Vec2l = @Vector(2, i64);
pub const Vec2cu = @Vector(2, u8);
pub const Vec2hu = @Vector(2, u16);
pub const Vec2iu = @Vector(2, u32);
pub const Vec2lu = @Vector(2, u64);

pub const Vec3hf = @Vector(3, f16);
pub const Vec3f = @Vector(3, f32);
pub const Vec3d = @Vector(3, f64);
pub const Vec3c = @Vector(3, i8);
pub const Vec3h = @Vector(3, i16);
pub const Vec3i = @Vector(3, i32);
pub const Vec3l = @Vector(3, i64);
pub const Vec3cu = @Vector(3, u8);
pub const Vec3hu = @Vector(3, u16);
pub const Vec3iu = @Vector(3, u32);
pub const Vec3lu = @Vector(3, u64);

pub const Vec4hf = @Vector(4, f16);
pub const Vec4f = @Vector(4, f32);
pub const Vec4d = @Vector(4, f64);
pub const Vec4c = @Vector(4, i8);
pub const Vec4h = @Vector(4, i16);
pub const Vec4i = @Vector(4, i32);
pub const Vec4l = @Vector(4, i64);
pub const Vec4cu = @Vector(4, u8);
pub const Vec4hu = @Vector(4, u16);
pub const Vec4iu = @Vector(4, u32);
pub const Vec4lu = @Vector(4, u64);

pub const Rgbaf = Vec4f; // rgb as fuck
pub const Rgba8 = Vec4cu;
pub const Rgbf = Vec3f;
pub const Rgb8 = Vec3cu;

/// Raises a compile-time error if the type isn't a vector
pub fn assertVec(comptime T: type) void {
    if (@typeInfo(T) != .vector) {
        @compileError("expected vector, got " ++ @typeName(T));
    }
}

/// Returns the amount of elements in a vector
pub fn countOfVec(comptime T: type) comptime_int {
    assertVec(T);
    return @typeInfo(T).vector.len;
}

/// Returns the underlying type of a vector
pub fn childOfVec(comptime T: type) type {
    assertVec(T);
    return @typeInfo(T).vector.child;
}

/// Raises a compile-time error if the type isn't a vector of floats
pub fn assertFloatVec(comptime T: type) void {
    if (@typeInfo(childOfVec(T)) != .float and @typeInfo(childOfVec(T)) != .comptime_float) {
        @compileError("expected vector of floats, got " ++ @typeName(T));
    }
}

/// Returns true if X and Y are exactly equal. On vectors of floats that means precision errors
/// will lead this to return false when it should be true. For that, use `approxEql`.
pub fn exactlyEql(x: anytype, y: anytype) bool {
    assertVec(@TypeOf(x, y));
    return @reduce(.And, x == y);
}

/// Returns true if X and Y are approximately equal. This means that precision errors on vectors
/// of floats will be handled properly. For vectors of other types, use `exactlyEql`.
pub fn approxEql(x: anytype, y: anytype) bool {
    assertVec(@TypeOf(x, y));
    inline for (0..countOfVec(@TypeOf(x, y))) |i| {
        if (!zglm.approxEql(x[i], y[i])) {
            return false;
        }
    }
    return true;
}

/// Returns true if X and Y are approximately equal using a custom epsilon value. This means that
/// precision errors on vectors of floats will be handled properly. For vectors of other types,
/// use `exactlyEql`.
pub fn approxEqlEps(x: anytype, y: anytype, epsilon: childOfVec(@TypeOf(x, y))) bool {
    assertVec(@TypeOf(x, y));
    inline for (0..countOfVec(@TypeOf(x, y))) |i| {
        if (!zglm.approxEqlEps(x[i], y[i], epsilon)) {
            return false;
        }
    }
    return true;
}

/// Returns the dot product of X and Y.
pub fn dot(x: anytype, y: anytype) childOfVec(@TypeOf(x, y)) {
    return @reduce(.Add, x * y);
}

/// Returns the length/magnitude of X. Must be a vector of floats.
pub fn length(x: anytype) childOfVec(@TypeOf(x)) {
    assertFloatVec(@TypeOf(x));
    return zglm.sqrt(dot(x, x));
}

/// Returns the distance between X and Y. Must be vectors of floats.
pub fn distance(x: anytype, y: anytype) childOfVec(@TypeOf(x, y)) {
    return length(x - y);
}

/// Returns the cross product of X and Y. Must be vectors of floats with 3 components.
pub fn cross(x: anytype, y: anytype) @TypeOf(x, y) {
    if (countOfVec(@TypeOf(x)) != 3) {
        @compileError("expected vector of 3 components, got " ++ @typeName(@TypeOf(x)));
    }
    if (countOfVec(@TypeOf(y)) != 3) {
        @compileError("expected vector of 3 components, got " ++ @typeName(@TypeOf(y)));
    }

    return .{
        x[1] * y[2] - y[1] * x[2],
        x[2] * y[0] - y[2] * x[0],
        x[0] * y[1] - y[0] * x[1],
    };
}

/// Returns a vector in the same direction as X but with a length of 1. Must be a vector of floats.
pub fn normalize(x: anytype) @TypeOf(x) {
    assertFloatVec(@TypeOf(x));

    const len = length(x);
    // consider not dividing by 0
    if (len == 0) {
        return @splat(0);
    }
    return x / @as(@TypeOf(x), @splat(len));
}

// test values are random
// expected values are from doing the same operation in glm
// TODO i require more testing it
const mate2 = Vec2f{ 2.6, 8.8 };
const mate3 = Vec3f{ 4.9, 2.2, 6.5 };
const mate4 = Vec4f{ 5.7, 7.3, 6.8, 1.4 };
const eps = 0.0001;

test "vectors approximately equal" {
    const a: Vec2f = @splat(0.1);
    const b: Vec2f = @splat(0.2);

    try t.expect(!approxEql(a, b));
    try t.expect(approxEql(a, a));
    try t.expect(approxEql(b, b));
    try t.expect(approxEql(a + b, @as(Vec2f, @splat(0.3))));
}

test "vector dot product" {
    try t.expectApproxEqAbs(dot(mate2, -mate2), -84.2, eps);
    try t.expectApproxEqAbs(dot(mate3, -mate3), -71.1, eps);
    try t.expectApproxEqAbs(dot(mate4, -mate4), -133.98, eps);
}

test "vector length" {
    try t.expectApproxEqAbs(length(mate2), 9.17606, eps);
    try t.expectApproxEqAbs(length(mate3), 8.43208, eps);
    try t.expectApproxEqAbs(length(mate4), 11.575, eps);
}

test "vector normalize" {
    try t.expectApproxEqAbs(length(normalize(mate2)), 1, eps);
    try t.expectApproxEqAbs(length(normalize(mate3)), 1, eps);
    try t.expectApproxEqAbs(length(normalize(mate4)), 1, eps);
}

test "vector cross product" {
    try t.expect(approxEqlEps(
        cross(mate3, Vec3f{ 6.5, 2.2, 4.9 }),
        Vec3f{ -3.52, 18.24, -3.52 },
        eps,
    ));
}

test "vector distance" {
    try t.expectApproxEqAbs(distance(mate3, Vec3f{ 6.5, 2.2, 4.9 }), 2.26274, eps);
}
