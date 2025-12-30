const t = @import("std").testing;
const zglm = @import("zglm.zig");
const Vec4f = zglm.Vec4f;
const Vec3f = zglm.Vec3f;

/// A 4x4 column-major matrix of float32s.
pub const Mat4x4f = struct {
    raw: [4]Vec4f,

    pub fn init(v0: Vec4f, v1: Vec4f, v2: Vec4f, v3: Vec4f) Mat4x4f {
        return .{ .raw = .{ v0, v1, v2, v3 } };
    }

    pub fn zero() Mat4x4f {
        return init(@splat(0), @splat(0), @splat(0), @splat(0));
    }

    pub fn identity() Mat4x4f {
        return init(
            .{ 1, 0, 0, 0 },
            .{ 0, 1, 0, 0 },
            .{ 0, 0, 1, 0 },
            .{ 0, 0, 0, 1 },
        );
    }

    /// Multiplies two matrices together. Order is the same as `x * y` in glm.
    pub fn mul(x: Mat4x4f, y: Mat4x4f) Mat4x4f {
        var new: Mat4x4f = zero();
        for (0..4) |i| {
            for (0..4) |j| {
                for (0..4) |k| {
                    new.raw[i][j] += y.raw[i][k] * x.raw[k][j];
                }
            }
        }
        return new;
    }

    /// Multiplies a vector by a matrix. Order is the same as `m * v` in glm.
    pub fn mulv(x: Mat4x4f, y: Vec4f) Vec4f {
        var new: Vec4f = @splat(0);
        inline for (0..4) |j| inline for (0..4) |i| {
            new[j] += x.raw[i][j] * y[i];
        };
        return new;
    }
};

const eps = 0.0001;

/// test util
fn expectMatEql(x: Mat4x4f, y: Mat4x4f) !void {
    try t.expectApproxEqAbs(x.raw[0][0], y.raw[0][0], eps);
    try t.expectApproxEqAbs(x.raw[0][1], y.raw[0][1], eps);
    try t.expectApproxEqAbs(x.raw[0][2], y.raw[0][2], eps);
    try t.expectApproxEqAbs(x.raw[0][3], y.raw[0][3], eps);

    try t.expectApproxEqAbs(x.raw[1][0], y.raw[1][0], eps);
    try t.expectApproxEqAbs(x.raw[1][1], y.raw[1][1], eps);
    try t.expectApproxEqAbs(x.raw[1][2], y.raw[1][2], eps);
    try t.expectApproxEqAbs(x.raw[1][3], y.raw[1][3], eps);

    try t.expectApproxEqAbs(x.raw[2][0], y.raw[2][0], eps);
    try t.expectApproxEqAbs(x.raw[2][1], y.raw[2][1], eps);
    try t.expectApproxEqAbs(x.raw[2][2], y.raw[2][2], eps);
    try t.expectApproxEqAbs(x.raw[2][3], y.raw[2][3], eps);

    try t.expectApproxEqAbs(x.raw[3][0], y.raw[3][0], eps);
    try t.expectApproxEqAbs(x.raw[3][1], y.raw[3][1], eps);
    try t.expectApproxEqAbs(x.raw[3][2], y.raw[3][2], eps);
    try t.expectApproxEqAbs(x.raw[3][3], y.raw[3][3], eps);
}

test "testing that the test works" {
    try expectMatEql(.identity(), .identity());
}

test "identity * identity" {
    try expectMatEql(Mat4x4f.identity().mul(.identity()), .identity());
}

test "a * b" {
    const a = Mat4x4f.init(
        .{ 0, 1, 2, 3 },
        .{ 4, 5, 6, 7 },
        .{ 8, 9, 10, 11 },
        .{ 12, 13, 14, 15 },
    );
    const b = Mat4x4f.init(
        .{ 16, 17, 18, 19 },
        .{ 20, 21, 22, 23 },
        .{ 24, 25, 26, 27 },
        .{ 28, 29, 30, 31 },
    );
    const expected = Mat4x4f.init(
        .{ 440, 510, 580, 650 },
        .{ 536, 622, 708, 794 },
        .{ 632, 734, 836, 938 },
        .{ 728, 846, 964, 1082 },
    );
    try expectMatEql(a.mul(b), expected);
}

test "mat * vec" {
    const a = Mat4x4f.init(
        .{ 0, 1, 2, 3 },
        .{ 4, 5, 6, 7 },
        .{ 8, 9, 10, 11 },
        .{ 12, 13, 14, 15 },
    );
    const b = Vec4f{ 5.7, 7.3, 6.8, 1.4 };
    const expected = Vec4f{ 100.4, 121.6, 142.8, 164 };
    try t.expect(zglm.vecApproxEqlEps(a.mulv(b), expected, eps));
}
