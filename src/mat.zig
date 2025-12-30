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

    /// Returns the transpose of X.
    pub fn transpose(x: Mat4x4f) Mat4x4f {
        var new: Mat4x4f = undefined;
        inline for (0..4) |i| inline for (0..4) |j| {
            new.raw[i][j] = x.raw[j][i];
        };
        return new;
    }

    /// Multiplies two matrices together. Order is the same as `x * y` in glm.
    pub fn mul(x: Mat4x4f, y: Mat4x4f) Mat4x4f {
        var new: Mat4x4f = zero();
        inline for (0..4) |i| inline for (0..4) |j| inline for (0..4) |k| {
            new.raw[i][j] += y.raw[i][k] * x.raw[k][j];
        };
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

    /// Scales X by Y.
    pub fn muls(x: Mat4x4f, y: f32) Mat4x4f {
        var new: Mat4x4f = undefined;
        inline for (0..4) |i| {
            new.raw[i] = x.raw[i] * @as(Vec4f, @splat(y));
        }
        return new;
    }

    /// Returns the determinant of X
    pub fn determinant(x: Mat4x4f) f32 {
        var det: f32 = 0.0;

        det += x.raw[0][0] * (x.raw[1][1] * (x.raw[2][2] * x.raw[3][3] - x.raw[2][3] * x.raw[3][2]) -
            x.raw[1][2] * (x.raw[2][1] * x.raw[3][3] - x.raw[2][3] * x.raw[3][1]) +
            x.raw[1][3] * (x.raw[2][1] * x.raw[3][2] - x.raw[2][2] * x.raw[3][1]));

        det -= x.raw[1][0] * (x.raw[0][1] * (x.raw[2][2] * x.raw[3][3] - x.raw[2][3] * x.raw[3][2]) -
            x.raw[0][2] * (x.raw[2][1] * x.raw[3][3] - x.raw[2][3] * x.raw[3][1]) +
            x.raw[0][3] * (x.raw[2][1] * x.raw[3][2] - x.raw[2][2] * x.raw[3][1]));

        det += x.raw[2][0] * (x.raw[0][1] * (x.raw[1][2] * x.raw[3][3] - x.raw[1][3] * x.raw[3][2]) -
            x.raw[0][2] * (x.raw[1][1] * x.raw[3][3] - x.raw[1][3] * x.raw[3][1]) +
            x.raw[0][3] * (x.raw[1][1] * x.raw[3][2] - x.raw[1][2] * x.raw[3][1]));

        det -= x.raw[3][0] * (x.raw[0][1] * (x.raw[1][2] * x.raw[2][3] - x.raw[1][3] * x.raw[2][2]) -
            x.raw[0][2] * (x.raw[1][1] * x.raw[2][3] - x.raw[1][3] * x.raw[2][1]) +
            x.raw[0][3] * (x.raw[1][1] * x.raw[2][2] - x.raw[1][2] * x.raw[2][1]));

        return det;
    }

    /// Returns the inverse of X.
    pub fn inverse(x: Mat4x4f) Mat4x4f {
        const coef00 = x.raw[2][2] * x.raw[3][3] - x.raw[3][2] * x.raw[2][3];
        const coef02 = x.raw[1][2] * x.raw[3][3] - x.raw[3][2] * x.raw[1][3];
        const coef03 = x.raw[1][2] * x.raw[2][3] - x.raw[2][2] * x.raw[1][3];

        const coef04 = x.raw[2][1] * x.raw[3][3] - x.raw[3][1] * x.raw[2][3];
        const coef06 = x.raw[1][1] * x.raw[3][3] - x.raw[3][1] * x.raw[1][3];
        const coef07 = x.raw[1][1] * x.raw[2][3] - x.raw[2][1] * x.raw[1][3];

        const coef08 = x.raw[2][1] * x.raw[3][2] - x.raw[3][1] * x.raw[2][2];
        const coef10 = x.raw[1][1] * x.raw[3][2] - x.raw[3][1] * x.raw[1][2];
        const coef11 = x.raw[1][1] * x.raw[2][2] - x.raw[2][1] * x.raw[1][2];

        const coef12 = x.raw[2][0] * x.raw[3][3] - x.raw[3][0] * x.raw[2][3];
        const coef14 = x.raw[1][0] * x.raw[3][3] - x.raw[3][0] * x.raw[1][3];
        const coef15 = x.raw[1][0] * x.raw[2][3] - x.raw[2][0] * x.raw[1][3];

        const coef16 = x.raw[2][0] * x.raw[3][2] - x.raw[3][0] * x.raw[2][2];
        const coef18 = x.raw[1][0] * x.raw[3][2] - x.raw[3][0] * x.raw[1][2];
        const coef19 = x.raw[1][0] * x.raw[2][2] - x.raw[2][0] * x.raw[1][2];

        const coef20 = x.raw[2][0] * x.raw[3][1] - x.raw[3][0] * x.raw[2][1];
        const coef22 = x.raw[1][0] * x.raw[3][1] - x.raw[3][0] * x.raw[1][1];
        const coef23 = x.raw[1][0] * x.raw[2][1] - x.raw[2][0] * x.raw[1][1];

        const fac0 = Vec4f{ coef00, coef00, coef02, coef03 };
        const fac1 = Vec4f{ coef04, coef04, coef06, coef07 };
        const fac2 = Vec4f{ coef08, coef08, coef10, coef11 };
        const fac3 = Vec4f{ coef12, coef12, coef14, coef15 };
        const fac4 = Vec4f{ coef16, coef16, coef18, coef19 };
        const fac5 = Vec4f{ coef20, coef20, coef22, coef23 };

        const vec0 = Vec4f{ x.raw[1][0], x.raw[0][0], x.raw[0][0], x.raw[0][0] };
        const vec1 = Vec4f{ x.raw[1][1], x.raw[0][1], x.raw[0][1], x.raw[0][1] };
        const vec2 = Vec4f{ x.raw[1][2], x.raw[0][2], x.raw[0][2], x.raw[0][2] };
        const vec3 = Vec4f{ x.raw[1][3], x.raw[0][3], x.raw[0][3], x.raw[0][3] };

        const inv0 = vec1 * fac0 - vec2 * fac1 + vec3 * fac2;
        const inv1 = vec0 * fac0 - vec2 * fac3 + vec3 * fac4;
        const inv2 = vec0 * fac1 - vec1 * fac3 + vec3 * fac5;
        const inv3 = vec0 * fac2 - vec1 * fac4 + vec2 * fac5;

        const sign_a = Vec4f{ 1, -1, 1, -1 };
        const sign_b = Vec4f{ -1, 1, -1, 1 };
        const inv = init(inv0 * sign_a, inv1 * sign_b, inv2 * sign_a, inv3 * sign_b);

        const row0 = Vec4f{ inv.raw[0][0], inv.raw[1][0], inv.raw[2][0], inv.raw[3][0] };

        const dot0 = x.raw[0] * row0;
        const dot1 = (dot0[0] + dot0[1]) + (dot0[2] + dot0[3]);

        const one_over_determinant = 1 / dot1;

        return inv.muls(one_over_determinant);
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

// expected values are from doing the same operation in glm

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

test "matrix determinant" {
    const a = Mat4x4f.init(
        .{ 6.7, 0, 0, 0 },
        .{ 0, 6.7, 0, 0 },
        .{ 0, 0, 6.7, 0 },
        .{ 0, 0, 0, 6.7 },
    );
    try t.expectApproxEqAbs(2015.1118, a.determinant(), eps);
}

test "matrix inverse" {
    const a = Mat4x4f.init(
        .{ 3.8, 0, 0, 0 },
        .{ 0, 3.8, 0, 0 },
        .{ 0, 0, 3.8, 0 },
        .{ 0, 0, 0, 3.8 },
    );
    const expected = Mat4x4f.init(
        .{ 0.263158, 0, 0, 0 },
        .{ 0, 0.263158, 0, 0 },
        .{ 0, 0, 0.263158, 0 },
        .{ 0, 0, 0, 0.263158 },
    );
    try expectMatEql(a.inverse(), expected);
}

test "matrix transpose" {
    const a = Mat4x4f.init(
        .{ 0, 1, 2, 3 },
        .{ 4, 5, 6, 7 },
        .{ 8, 9, 10, 11 },
        .{ 12, 13, 14, 15 },
    );
    const expected = Mat4x4f.init(
        .{ 0, 4, 8, 12 },
        .{ 1, 5, 9, 13 },
        .{ 2, 6, 10, 14 },
        .{ 3, 7, 11, 15 },
    );
    try expectMatEql(a.transpose(), expected);
}
