const t = @import("std").testing;
const zglm = @import("zglm.zig");

/// A 4x4 column-major matrix of floats.
pub fn Mat4x4(comptime Type: type) type {
    return struct {
        const T = Type;
        const Matrix = @This();
        raw: [4]@Vector(4, T),

        pub fn init(v0: @Vector(4, T), v1: @Vector(4, T), v2: @Vector(4, T), v3: @Vector(4, T)) Matrix {
            return .{ .raw = .{ v0, v1, v2, v3 } };
        }

        pub fn zero() Matrix {
            return init(@splat(0), @splat(0), @splat(0), @splat(0));
        }

        pub fn identity() Matrix {
            return init(
                .{ 1, 0, 0, 0 },
                .{ 0, 1, 0, 0 },
                .{ 0, 0, 1, 0 },
                .{ 0, 0, 0, 1 },
            );
        }

        /// Returns the transpose of X.
        pub fn transpose(x: Matrix) Matrix {
            var new: Matrix = undefined;
            inline for (0..4) |i| inline for (0..4) |j| {
                new.raw[i][j] = x.raw[j][i];
            };
            return new;
        }

        /// Multiplies two matrices together. Order is the same as `x * y` in glm.
        pub fn mul(x: Matrix, y: Matrix) Matrix {
            var new = zero();
            inline for (0..4) |i| inline for (0..4) |j| inline for (0..4) |k| {
                new.raw[i][j] += y.raw[i][k] * x.raw[k][j];
            };
            return new;
        }

        /// Multiplies a vector by a matrix. Order is the same as `m * v` in glm.
        pub fn mulv(x: Matrix, y: @Vector(4, T)) @Vector(4, T) {
            var new: @Vector(4, T) = @splat(0);
            inline for (0..4) |j| inline for (0..4) |i| {
                new[j] += x.raw[i][j] * y[i];
            };
            return new;
        }

        /// Scales X by Y.
        pub fn muls(x: Matrix, y: T) Matrix {
            var new: Matrix = undefined;
            inline for (0..4) |i| {
                new.raw[i] = x.raw[i] * @as(@Vector(4, T), @splat(y));
            }
            return new;
        }

        /// Returns the determinant of X
        pub fn determinant(x: Matrix) T {
            var det: T = 0.0;

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
        pub fn inverse(x: Matrix) Matrix {
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

            const fac0 = @Vector(4, T){ coef00, coef00, coef02, coef03 };
            const fac1 = @Vector(4, T){ coef04, coef04, coef06, coef07 };
            const fac2 = @Vector(4, T){ coef08, coef08, coef10, coef11 };
            const fac3 = @Vector(4, T){ coef12, coef12, coef14, coef15 };
            const fac4 = @Vector(4, T){ coef16, coef16, coef18, coef19 };
            const fac5 = @Vector(4, T){ coef20, coef20, coef22, coef23 };

            const vec0 = @Vector(4, T){ x.raw[1][0], x.raw[0][0], x.raw[0][0], x.raw[0][0] };
            const vec1 = @Vector(4, T){ x.raw[1][1], x.raw[0][1], x.raw[0][1], x.raw[0][1] };
            const vec2 = @Vector(4, T){ x.raw[1][2], x.raw[0][2], x.raw[0][2], x.raw[0][2] };
            const vec3 = @Vector(4, T){ x.raw[1][3], x.raw[0][3], x.raw[0][3], x.raw[0][3] };

            const inv0 = vec1 * fac0 - vec2 * fac1 + vec3 * fac2;
            const inv1 = vec0 * fac0 - vec2 * fac3 + vec3 * fac4;
            const inv2 = vec0 * fac1 - vec1 * fac3 + vec3 * fac5;
            const inv3 = vec0 * fac2 - vec1 * fac4 + vec2 * fac5;

            const sign_a = @Vector(4, T){ 1, -1, 1, -1 };
            const sign_b = @Vector(4, T){ -1, 1, -1, 1 };
            const inv = init(inv0 * sign_a, inv1 * sign_b, inv2 * sign_a, inv3 * sign_b);

            const row0 = @Vector(4, T){ inv.raw[0][0], inv.raw[1][0], inv.raw[2][0], inv.raw[3][0] };

            const dot0 = x.raw[0] * row0;
            const dot1 = (dot0[0] + dot0[1]) + (dot0[2] + dot0[3]);

            const one_over_determinant = 1 / dot1;

            return inv.muls(one_over_determinant);
        }

        /// Returns base translated by pos
        pub fn translate(base: Matrix, pos: @Vector(3, T)) Matrix {
            var new = base;
            new.raw[3] =
                base.raw[0] * @as(@Vector(4, T), @splat(pos[0])) +
                base.raw[1] * @as(@Vector(4, T), @splat(pos[1])) +
                base.raw[2] * @as(@Vector(4, T), @splat(pos[2])) +
                base.raw[3];
            return new;
        }

        /// Returns base rotated by angle at the axis specified (axis should be normalized)
        pub fn rotate(base: Matrix, angle: T, axis: @Vector(3, T)) Matrix {
            const c = zglm.cos(angle);
            const s = zglm.sin(angle);

            const axisreal = zglm.normalize(axis);
            const temp = axisreal * @as(@Vector(3, T), @splat(1 - c));

            var rot: Matrix = undefined;
            rot.raw[0][0] = c + temp[0] * axisreal[0];
            rot.raw[0][1] = temp[0] * axisreal[1] + s * axisreal[2];
            rot.raw[0][2] = temp[0] * axisreal[2] - s * axisreal[1];

            rot.raw[1][0] = temp[1] * axisreal[0] - s * axisreal[2];
            rot.raw[1][1] = c + temp[1] * axisreal[1];
            rot.raw[1][2] = temp[1] * axisreal[2] + s * axisreal[0];

            rot.raw[2][0] = temp[2] * axisreal[0] + s * axisreal[1];
            rot.raw[2][1] = temp[2] * axisreal[1] - s * axisreal[0];
            rot.raw[2][2] = c + temp[2] * axisreal[2];

            var result: Matrix = undefined;
            result.raw[0] =
                base.raw[0] * @as(@Vector(4, T), @splat(rot.raw[0][0])) +
                base.raw[1] * @as(@Vector(4, T), @splat(rot.raw[0][1])) +
                base.raw[2] * @as(@Vector(4, T), @splat(rot.raw[0][2]));
            result.raw[1] =
                base.raw[0] * @as(@Vector(4, T), @splat(rot.raw[1][0])) +
                base.raw[1] * @as(@Vector(4, T), @splat(rot.raw[1][1])) +
                base.raw[2] * @as(@Vector(4, T), @splat(rot.raw[1][2]));
            result.raw[2] =
                base.raw[0] * @as(@Vector(4, T), @splat(rot.raw[2][0])) +
                base.raw[1] * @as(@Vector(4, T), @splat(rot.raw[2][1])) +
                base.raw[2] * @as(@Vector(4, T), @splat(rot.raw[2][2]));
            result.raw[3] = base.raw[3];
            return result;
        }

        /// Returns an OpenGL-style perspective projection matrix.
        pub fn perspectiveRhNo(v: struct {
            fovy_rad: T,
            aspect_ratio: T,
            z_near: T,
            z_far: T,
        }) Matrix {
            const tan_half_fovy = zglm.tan(v.fovy_rad / 2);

            var result = Matrix.zero();
            result.raw[0][0] = 1.0 / (v.aspect_ratio * tan_half_fovy);
            result.raw[1][1] = 1.0 / tan_half_fovy;
            result.raw[2][2] = -(v.z_far + v.z_near) / (v.z_far - v.z_near);
            result.raw[2][3] = -1.0;
            result.raw[3][2] = -(2.0 * v.z_far * v.z_near) / (v.z_far - v.z_near);
            return result;
        }
        pub const perspective = perspectiveRhNo;

        /// Returns an OpenGL-style orthographic projection matrix.
        pub fn orthoRhNo(v: struct {
            left: T,
            right: T,
            bottom: T,
            top: T,
            z_near: T,
            z_far: T,
        }) Matrix {
            var result = Matrix.identity();
            result.raw[0][0] = 2 / (v.right - v.left);
            result.raw[1][1] = 2 / (v.top - v.bottom);
            result.raw[2][2] = -2 / (v.z_far - v.z_near);
            result.raw[3][0] = -(v.right + v.left) / (v.right - v.left);
            result.raw[3][1] = -(v.top + v.bottom) / (v.top - v.bottom);
            result.raw[3][2] = -(v.z_far + v.z_near) / (v.z_far - v.z_near);
            return result;
        }
        pub const ortho = orthoRhNo;

        /// Maps object coordinates to window coordinates
        pub fn project(v: struct {
            pos: @Vector(3, T),
            mvp: Matrix,
            viewport_pos: @Vector(2, T),
            viewport_size: @Vector(2, T),
        }) @Vector(3, T) {
            const viewport = @Vector(4, T){
                v.viewport_pos[0],
                v.viewport_pos[1],
                v.viewport_size[0],
                v.viewport_size[1],
            };
            var pos4 = @Vector(4, T){ v.pos[0], v.pos[1], v.pos[2], 1 };

            pos4 = v.mvp.mulv(pos4);
            pos4 *= @splat(1.0 / pos4[3]);
            pos4 *= @splat(0.5);
            pos4 += @splat(0.5);

            return .{
                pos4[0] * viewport[2] + viewport[0],
                pos4[1] * viewport[3] + viewport[1],
                pos4[2],
            };
        }

        /// Maps the specified viewport coordinates into the specified space, depending on the matrix:
        /// - inverse projection matrix = view space
        /// - inverse view projection matrix = world space
        /// - inverse mvp matrix = object space
        pub fn unproject(v: struct {
            pos: @Vector(3, T),
            inv_mat: Matrix,
            viewport_pos: @Vector(2, T),
            viewport_size: @Vector(2, T),
        }) @Vector(3, T) {
            const viewport = @Vector(4, T){
                v.viewport_pos[0],
                v.viewport_pos[1],
                v.viewport_size[0],
                v.viewport_size[1],
            };

            var vec = @Vector(4, T){
                2.0 * (v.pos[0] - viewport[0]) / viewport[2] - 1.0,
                2.0 * (v.pos[1] - viewport[1]) / viewport[3] - 1.0,
                2.0 * v.pos[2] - 1.0,
                1.0,
            };
            vec = v.inv_mat.mulv(vec);
            vec *= @splat(1.0 / vec[3]);
            return @Vector(3, T){ vec[0], vec[1], vec[2] };
        }

        /// Converts the matrix to a 2D array
        pub fn toArray2D(mat: Matrix) [4][4]T {
            return .{ mat.raw[0], mat.raw[1], mat.raw[2], mat.raw[3] };
        }

        /// Converts the matrix to a 1D array
        pub fn toArray1D(mat: Matrix) [16]T {
            // yes this is valid
            return @bitCast(mat.toArray2D());
        }
    };
}

pub const Mat4x4f = Mat4x4(f32);
pub const Mat4x4d = Mat4x4(f64);

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
    const b = zglm.Vec4f{ 5.7, 7.3, 6.8, 1.4 };
    const expected = zglm.Vec4f{ 100.4, 121.6, 142.8, 164 };
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

test "translate matrix" {
    const a = Mat4x4f.identity();
    const b = zglm.Vec3f{ 4.9, 2.2, 6.5 };
    const expected = Mat4x4f.init(
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 4.9, 2.2, 6.5, 1 },
    );
    try expectMatEql(a.translate(b), expected);
}

test "rotate matrix" {
    const a = Mat4x4f.identity();
    const b = zglm.degrees(45);
    const c = zglm.Vec3f{ 1, 0, 0 };
    const expected = Mat4x4f.init(
        .{ 1, 0, 0, 0 },
        .{ 0, -0.591797, 0.806087, 0 },
        .{ 0, -0.806087, -0.591797, 0 },
        .{ 0, 0, 0, 1 },
    );
    try expectMatEql(a.rotate(b, c), expected);
}

test "perspective matrix" {
    const expected = Mat4x4f.init(
        .{ 0.803333, 0, 0, 0 },
        .{ 0, 1.42815, 0, 0 },
        .{ 0, 0, -1, -1 },
        .{ 0, 0, -0.002, 0 },
    );
    try expectMatEql(Mat4x4f.perspective(.{
        .fovy_rad = zglm.radians(70),
        .aspect_ratio = 16.0 / 9.0,
        .z_near = 0.001,
        .z_far = 1000,
    }), expected);
}

test "orthographic matrix" {
    const expected = Mat4x4f.init(
        .{ 0.2, 0, 0, 0 },
        .{ 0, 0.2, 0, 0 },
        .{ 0, 0, -0.002, 0 },
        .{ 0, 0, -1, 1 },
    );
    try expectMatEql(Mat4x4f.ortho(.{
        .left = -5,
        .right = 5,
        .bottom = -5,
        .top = 5,
        .z_near = 0.001,
        .z_far = 1000,
    }), expected);
}

test "mvp like" {
    const model = Mat4x4f.identity().rotate(zglm.radians(45), .{ 1, 0, 0 });
    const view_rot = Mat4x4f.identity().rotate(zglm.radians(78), .{ 0, 1, 0 });
    const view_pos = Mat4x4f.identity().translate(.{ 14, 4, -58 });
    const view = view_rot.mul(view_pos);
    const proj = Mat4x4f.perspective(.{
        .fovy_rad = zglm.radians(70),
        .aspect_ratio = 16.0 / 9.0,
        .z_near = 0.001,
        .z_far = 1000,
    });
    const mvp = proj.mul(view).mul(model);

    const expected = Mat4x4f.init(
        .{ 0.167022, 0, 0.978149, 0.978148 },
        .{ 0.555629, 1.00985, -0.147016, -0.147016 },
        .{ 0.555629, -1.00985, -0.147016, -0.147016 },
        .{ -43.2368, 5.71259, 25.751, 25.7529 },
    );
    try expectMatEql(mvp, expected);
}

test "unprojected -> projected -> unprojected" {
    const model = Mat4x4f.identity().rotate(zglm.radians(45), .{ 1, 0, 0 });
    const view_rot = Mat4x4f.identity().rotate(zglm.radians(78), .{ 0, 1, 0 });
    const view_pos = Mat4x4f.identity().translate(.{ 14, 4, -58 });
    const view = view_rot.mul(view_pos);
    const proj = Mat4x4f.perspective(.{
        .fovy_rad = zglm.radians(70),
        .aspect_ratio = 16.0 / 9.0,
        .z_near = 0.001,
        .z_far = 1000,
    });
    const mvp = proj.mul(view).mul(model);

    // projected to unprojected should be the same as the original
    const src = zglm.Vec3f{ 1.2, 3.4, 5.6 };
    const projected = Mat4x4f.project(.{
        .pos = src,
        .mvp = mvp,
        .viewport_pos = @splat(0),
        .viewport_size = .{ 1920, 1080 },
    });
    const unprojected = Mat4x4f.unproject(.{
        .pos = projected,
        .inv_mat = mvp.inverse(),
        .viewport_pos = @splat(0),
        .viewport_size = .{ 1920, 1080 },
    });
    // a lot of precision is lost
    try t.expect(zglm.vecApproxEqlEps(src, unprojected, 0.2));
}

test "unprojected -> projected -> unprojected but 64-bits" {
    const model = Mat4x4d.identity().rotate(zglm.radians(45), .{ 1, 0, 0 });
    const view_rot = Mat4x4d.identity().rotate(zglm.radians(78), .{ 0, 1, 0 });
    const view_pos = Mat4x4d.identity().translate(.{ 14, 4, -58 });
    const view = view_rot.mul(view_pos);
    const proj = Mat4x4d.perspective(.{
        .fovy_rad = zglm.radians(70),
        .aspect_ratio = 16.0 / 9.0,
        .z_near = 0.001,
        .z_far = 1000,
    });
    const mvp = proj.mul(view).mul(model);

    // projected to unprojected should be the same as the original
    const src = zglm.Vec3d{ 1.2, 3.4, 5.6 };
    const projected = Mat4x4d.project(.{
        .pos = src,
        .mvp = mvp,
        .viewport_pos = @splat(0),
        .viewport_size = .{ 1920, 1080 },
    });
    const unprojected = Mat4x4d.unproject(.{
        .pos = projected,
        .inv_mat = mvp.inverse(),
        .viewport_pos = @splat(0),
        .viewport_size = .{ 1920, 1080 },
    });
    // note the non-insignificant epsilon
    try t.expect(zglm.vecApproxEqlEps(src, unprojected, eps));
}

test "mat to array2d" {
    const src = Mat4x4f.init(
        .{ 1, 2, 3, 4 },
        .{ 5, 6, 7, 8 },
        .{ 9, 10, 11, 12 },
        .{ 13, 14, 15, 16 },
    );
    const expected = [4][4]f32{
        .{ 1, 2, 3, 4 },
        .{ 5, 6, 7, 8 },
        .{ 9, 10, 11, 12 },
        .{ 13, 14, 15, 16 },
    };
    try t.expectEqual(expected, src.toArray2D());
}

test "mat to array1d" {
    const src = Mat4x4f.init(
        .{ 1, 2, 3, 4 },
        .{ 5, 6, 7, 8 },
        .{ 9, 10, 11, 12 },
        .{ 13, 14, 15, 16 },
    );
    const expected = [16]f32{
        // zig fmt: off
        1, 2, 3, 4,
        5, 6, 7, 8,
        9, 10, 11, 12,
        13, 14, 15, 16,
        // zig fmt: on
    };
    try t.expectEqual(expected, src.toArray1D());
}
