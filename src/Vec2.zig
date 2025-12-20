//! A vector of float32s
pub const c = @import("c.zig").glm;

pub const Vec2 = @This();
pub const T = f32;

raw: c.vec2,

/// 1st element
pub fn x(self: @This()) T {
    return self.raw[0];
}

/// 2nd element
pub fn y(self: @This()) T {
    return self.raw[1];
}

/// 1st element
pub fn r(self: @This()) T {
    return self.raw[0];
}

/// 2nd element
pub fn i(self: @This()) T {
    return self.raw[1];
}

/// 1st element
pub fn u(self: @This()) T {
    return self.raw[0];
}

/// 2nd element
pub fn v(self: @This()) T {
    return self.raw[1];
}

/// 1st element
pub fn s(self: @This()) T {
    return self.raw[0];
}

/// 2nd element
pub fn t(self: @This()) T {
    return self.raw[1];
}

pub fn nth(self: @This(), idx: usize) T {
    return self.raw[idx];
}

/// Returns the vec2 as an array
pub fn toArray(self: @This()) [2]T {
    return .{ self.raw[0], self.raw[1] };
}

/// Returns the vec2 as a Zig `@Vector`
pub fn toStdVector(self: @This()) @Vector(2, T) {
    return .{ self.raw[0], self.raw[1] };
}

/// Initializes a Vec2
pub fn init(first: T, second: T) @This() {
    return .{ .raw = .{ first, second } };
}

/// Makes all members 0.0f (zero)
pub fn initZero() @This() {
    return init(0, 0);
}

/// Makes all members 1.0f (one)
pub fn initOne() @This() {
    return init(1, 1);
}

/// Initializes a Vec2 from an array
pub fn fromArray(array: [2]T) @This() {
    return init(array[0], array[1]);
}

/// Initializes a Vec2 from a zig `@Vector`
pub fn fromStdVector(vec: @Vector(2, T)) @This() {
    return init(vec[0], vec[1]);
}

/// Vec2 dot product
pub fn dot(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    return c.glm_vec2_dot(&acpy.raw, &bcpy.raw);
}

/// Vec2 cross product
///
/// REF: http://allenchou.net/2013/07/cross-product-of-2d-vectors
///
/// returns the Z component of the cross product
pub fn cross(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    return c.glm_vec2_cross(&acpy.raw, &bcpy.raw);
}

/// norm * norm (magnitude) of vec
///
/// we can use this func instead of calling norm * norm, because it would call
/// sqrtf function twice but with this func we can avoid func call, maybe this is
/// not good name for this func
pub fn norm2(a: @This()) T {
    var acpy = a;
    return c.glm_vec2_norm2(&acpy.raw);
}

/// norm (magnitude) of vec2
pub fn norm(a: @This()) T {
    var acpy = a;
    return c.glm_vec2_norm(&acpy.raw);
}

/// add a vector to b vector store result in dest
pub fn add(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    var new: @This() = undefined;
    c.glm_vec2_add(&acpy.raw, &bcpy.raw, &new.raw);
    return new;
}

/// add scalar to v vector store result in dest (d = v + s)
pub fn adds(a: @This(), b: T) T {
    var acpy = a;
    var new: @This() = undefined;
    c.glm_vec2_adds(&acpy.raw, b, &new.raw);
    return new;
}

/// subtract b vector from a vector store result in dest
pub fn sub(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    var new: @This() = undefined;
    c.glm_vec2_sub(&acpy.raw, &bcpy.raw, &new.raw);
    return new;
}

/// subtract scalar from v vector store result in dest (d = v - s)
pub fn subs(a: @This(), b: T) T {
    var acpy = a;
    var new: @This() = undefined;
    c.glm_vec2_subs(&acpy.raw, b, &new.raw);
    return new;
}

/// multiply two vectors (component-wise multiplication)
pub fn mul(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    var new: @This() = undefined;
    c.glm_vec2_mul(&acpy.raw, &bcpy.raw, &new.raw);
    return new;
}

/// multiply/scale vector with scalar: result = v * s
pub fn scale(a: @This(), b: T) T {
    var acpy = a;
    var new: @This() = undefined;
    c.glm_vec2_scale(&acpy.raw, b, &new.raw);
    return new;
}

/// scale as vector specified: result = unit(v) * s
pub fn scaleAs(a: @This(), b: T) T {
    var acpy = a;
    var new: @This() = undefined;
    c.glm_vec2_scale_as(&acpy.raw, b, &new.raw);
    return new;
}

/// div vector with another component-wise division: d = a / b
pub fn div(a: @This(), b: @This()) T {
    var acpy = a;
    var bcpy = b;
    var new: @This() = undefined;
    c.glm_vec2_div(&acpy.raw, &bcpy.raw, &new.raw);
    return new;
}

/// div vector with scalar: d = v / s
pub fn divs(a: @This(), b: T) T {
    var acpy = a;
    var new: @This() = undefined;
    c.glm_vec2_divs(&acpy.raw, b, &new.raw);
    return new;
}

// TODO more tests dumbass
test "vec2 dot product" {
    const a = Vec2.init(10, 9);
    const b = Vec2.init(1, 2);
    const dot1 = Vec2.dot(a, b);
    const dot2 = a.nth(0) * b.nth(0) + a.nth(1) * b.nth(1);

    try @import("std").testing.expectApproxEqAbs(dot1, dot2, 0.001);
}
