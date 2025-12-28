const std = @import("std");
const testing = std.testing;
const zglm = @import("zglm.zig");
const vec_ops = @import("vec_ops.zig");

/// A vector of 4 Ts. W/alpha is the last component.
pub fn Vec4(comptime Type: type) type {
    return struct {
        raw: @Vector(4, T),
        pub const T = Type;
        pub const n = 4;

        /// Initializes a vector from 4 elements
        pub fn init(first: T, second: T, third: T, fourth: T) @This() {
            return .{ .raw = .{ first, second, third, fourth } };
        }

        /// Initializes a vector from an array
        pub fn fromArray(arr: [n]T) @This() {
            return .{ .raw = arr };
        }

        /// Initializes a vector from a standard Zig `@Vector`
        pub fn fromStdVector(vec: @Vector(n, T)) @This() {
            return .{ .raw = vec };
        }

        /// Initializes a vector with all components being the same value
        pub fn splat(scalar: T) @This() {
            return .{ .raw = @splat(scalar) };
        }

        /// Initializes a vector with all components set to 0
        pub fn zero() @This() {
            return splat(0);
        }

        /// Initializes a vector with all components set to 1
        pub fn one() @This() {
            return splat(1);
        }

        /// Returns the first element
        pub fn x(left: @This()) T {
            return left.raw[0];
        }

        /// Returns the second element
        pub fn y(left: @This()) T {
            return left.raw[1];
        }

        /// Returns the third element
        pub fn z(left: @This()) T {
            return left.raw[2];
        }

        /// Returns the fourth element
        pub fn w(left: @This()) T {
            return left.raw[3];
        }

        /// Returns the first element
        pub fn r(left: @This()) T {
            return left.raw[0];
        }

        /// Returns the second element
        pub fn g(left: @This()) T {
            return left.raw[1];
        }

        /// Returns the third element
        pub fn b(left: @This()) T {
            return left.raw[2];
        }

        /// Returns the fourth element
        pub fn a(left: @This()) T {
            return left.raw[3];
        }

        /// Returns the nth element
        pub fn nth(left: @This(), idx: usize) T {
            return left.raw[idx];
        }

        // Converts the vector to an array
        pub fn toArray(left: @This()) [n]T {
            return left.raw;
        }

        // Converts the vector to a standard Zig `@Vector`
        pub fn toStdVector(left: @This()) @Vector(n, T) {
            return left.raw;
        }

        /// Component-wise addition
        pub fn add(left: @This(), right: @This()) @This() {
            return .{ .raw = left.raw + right.raw };
        }

        /// Component-wise subtraction
        pub fn sub(left: @This(), right: @This()) @This() {
            return .{ .raw = left.raw - right.raw };
        }

        /// Component-wise multiplication
        pub fn mul(left: @This(), right: @This()) @This() {
            return .{ .raw = left.raw * right.raw };
        }

        /// Component-wise multiplication/scale by a scalar
        pub fn muls(left: @This(), right: T) @This() {
            return .{ .raw = left.raw * splat(right).raw };
        }

        /// Component-wise division
        pub fn div(left: @This(), right: @This()) @This() {
            return .{ .raw = left.raw / right.raw };
        }

        /// Component-wise division by a scalar
        pub fn divs(left: @This(), right: T) @This() {
            return .{ .raw = left.raw / splat(right).raw };
        }

        /// Component-wise modulo
        pub fn mod(left: @This(), right: @This()) @This() {
            return .{ .raw = left.raw % right.raw };
        }

        /// Component-wise modulo by a scalar
        pub fn mods(left: @This(), right: T) @This() {
            return .{ .raw = left.raw % splat(right).raw };
        }

        /// Negates the vector.
        pub fn neg(left: @This()) @This() {
            return .{ .raw = -left.raw };
        }

        /// Returns true if the vectors are exactly equal, which probably isn't what you want
        /// for float vectors. For that, use `approxEq` instead.
        pub fn exactlyEq(left: @This(), right: @This()) bool {
            return @reduce(.And, left.raw == right.raw);
        }

        /// Returns true if the vectors are approximately equal, which handles weird float stuff.
        /// For integer vectors, does the same as `exactlyEq`.
        pub fn approxEq(left: @This(), right: @This()) bool {
            return vec_ops.approxEq(n, T, left.raw, right.raw);
        }

        /// Element wise a < b
        pub fn less(left: @This(), right: @This()) bool {
            return @reduce(.And, left.raw < right.raw);
        }

        /// Element wise a <= b
        pub fn lessEq(left: @This(), right: @This()) bool {
            return @reduce(.And, left.raw <= right.raw);
        }

        /// Element wise a > b
        pub fn greater(left: @This(), right: @This()) bool {
            return @reduce(.And, left.raw > right.raw);
        }

        /// Element wise a >= b
        pub fn greaterEq(left: @This(), right: @This()) bool {
            return @reduce(.And, left.raw >= right.raw);
        }

        /// Returns the dot product of vectors
        pub fn dot(left: @This(), right: @This()) T {
            return vec_ops.dot(n, T, left.raw, right.raw);
        }

        /// Returns the squared magnitude of a vector. Faster than regular `len()`.
        pub fn len2(left: @This()) T {
            return vec_ops.len2(n, T, left.raw);
        }

        /// Returns the magnitude of a vector.
        pub fn len(left: @This()) f32 {
            return vec_ops.len(n, T, left.raw);
        }

        /// Normalizes a vector. Only works on float vectors.
        pub fn normalize(left: @This()) @This() {
            switch (@typeInfo(T)) {
                .float, .comptime_float => {},
                else => @compileError("expected vector of floats, got vector of " ++ @typeName(T)),
            }
            return fromStdVector(vec_ops.normalize(n, T, left.raw));
        }

        /// Returns the squared distance between vectors.
        pub fn distance2(left: @This(), right: @This()) T {
            return vec_ops.distanceSquared(n, T, left.raw, right.raw);
        }

        /// Returns the distance between vectors.
        pub fn distance(left: @This(), right: @This()) f32 {
            return vec_ops.distance(n, T, left.raw, right.raw);
        }
    };
}

// shorthands because i'm a lazy bum
pub const Vec4f = Vec4(f32);
pub const Vec4d = Vec4(f64);
pub const Vec4i = Vec4(i32);
pub const Vec4l = Vec4(i64);
pub const vec4f = Vec4f.init;
pub const vec4d = Vec4d.init;
pub const vec4i = Vec4i.init;
pub const vec4l = Vec4l.init;

/// just to make things a bit less painful
fn approxEqVec4f(a: Vec4f, b: Vec4f) !void {
    try testing.expect(Vec4f.approxEq(a, b));
}

test "vec4f approximately equal" {
    try approxEqVec4f(vec4f(1, 1, 1, 1), vec4f(1, 1, 1, 1));
    try approxEqVec4f(vec4f(1.5, 1.5, 1.5, 1.5), vec4f(1.5, 1.5, 1.5, 1.5));
    try approxEqVec4f(
        vec4f(0.1, 0.1, 0.1, 0.1).add(vec4f(0.2, 0.2, 0.2, 0.2)),
        vec4f(0.5, 0.5, 0.5, 0.5).sub(vec4f(0.2, 0.2, 0.2, 0.2)),
    );
}

test "vec4f dot product" {
    // the dot product of a vector of ones with itself must equal 'VecN.n'.
    try testing.expectApproxEqAbs(Vec4f.n, Vec4f.dot(vec4f(1, 1, 1, 1), vec4f(1, 1, 1, 1)), zglm.eps(f32));
}

test "vec4f length" {
    // the length of a vector of ones must equal 'sqrt(VecN.n)'
    try testing.expectApproxEqAbs(
        zglm.sqrt(@as(f32, Vec4f.n)),
        Vec4f.len(vec4f(1, 1, 1, 1)),
        zglm.eps(f32),
    );
}

test "vec4f normalize" {
    // the length of a normalized vector must be 1
    const seed: u64 = @truncate(@as(u128, @bitCast(std.time.nanoTimestamp())));
    var prng = std.Random.DefaultPrng.init(seed);

    var vec = Vec4f.zero();
    inline for (0..Vec4f.n) |i| {
        vec.raw[i] = @as(f32, @floatFromInt(prng.next())) / @as(f32, @floatFromInt(zglm.maxInt(u64)));
    }

    try testing.expectApproxEqAbs(1.0, vec.normalize().len(), zglm.eps(f32));
}
