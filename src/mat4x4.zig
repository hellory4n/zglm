const zglm = @import("zglm.zig");

/// Column-major 4x4 matrix
pub const Mat4x4 = struct {
    pub const T = f32;
    pub const RowVec = zglm.Vec4f;
    pub const ColVec = zglm.Vec4f;
    pub const cols = 4;
    pub const rows = 4;

    raw: [4]zglm.Vec4f,

    /// Initializes the matrices from the given row vectors. Note that matrices and vectors
    /// are column-major.
    pub fn init(r0: RowVec, r1: RowVec, r2: RowVec, r3: RowVec) Mat4x4 {
        return .{ .raw = .{
            zglm.vec4f(r0.x(), r1.x(), r2.x(), r3.x()),
            zglm.vec4f(r0.y(), r1.y(), r2.y(), r3.y()),
            zglm.vec4f(r0.z(), r1.z(), r2.z(), r3.z()),
            zglm.vec4f(r0.w(), r1.w(), r2.w(), r3.w()),
        } };
    }

    /// Returns an identity matrix.
    pub fn identity() Mat4x4 {
        return init(
            zglm.vec4f(1, 0, 0, 0),
            zglm.vec4f(0, 1, 0, 0),
            zglm.vec4f(0, 0, 1, 0),
            zglm.vec4f(0, 0, 0, 1),
        );
    }

    /// Returns a zero/null matrix.
    pub fn zero() Mat4x4 {
        return init(
            zglm.Vec4f.zero(),
            zglm.Vec4f.zero(),
            zglm.Vec4f.zero(),
            zglm.Vec4f.zero(),
        );
    }

    pub fn nth(mat: Mat4x4, i: usize, j: usize) T {
        return mat.raw[i].raw[j];
    }

    /// Returns the row `i` of the matrix.
    pub fn row(mat: Mat4x4, i: usize) RowVec {
        return RowVec.init(
            mat.raw[0].raw[i],
            mat.raw[1].raw[i],
            mat.raw[2].raw[i],
            mat.raw[3].raw[i],
        );
    }

    /// Returns the column `i` of the matrix.
    pub fn col(mat: Mat4x4, i: usize) ColVec {
        return ColVec.init(
            mat.raw[i].raw[0],
            mat.raw[i].raw[1],
            mat.raw[i].raw[2],
            mat.raw[i].raw[3],
        );
    }

    /// Returns the matrix as a 2 dimensional array
    pub fn toArray2D(mat: Mat4x4) [4][4]f32 {
        return .{
            mat.raw[0].toArray(),
            mat.raw[1].toArray(),
            mat.raw[2].toArray(),
            mat.raw[3].toArray(),
        };
    }

    /// Returns the matrix as a 1 dimensional array
    pub fn toArray1D(mat: Mat4x4) [16]f32 {
        return @bitCast(mat.toArray2D());
    }

    /// Returns the transposed matrix.
    pub fn transpose(mat: Mat4x4) Mat4x4 {
        var dst: Mat4x4 = undefined;
        inline for (0..4) |j| inline for (0..4) |i| {
            dst.raw[i].raw[j] = mat.raw[j].raw[i];
        };
        return dst;
    }

    /// Returns a matrix that scales each dimension by the given vector.
    pub fn scale(s: zglm.Vec3f) Mat4x4 {
        return init(
            RowVec.init(s.x(), 0, 0, 0),
            RowVec.init(0, s.y(), 0, 0),
            RowVec.init(0, 0, s.z(), 0),
            RowVec.init(0, 0, 0, 1),
        );
    }

    /// Multiplies 2 matrices together.
    pub fn mul(a: Mat4x4, b: Mat4x4) Mat4x4 {
        var new: Mat4x4 = undefined;
        inline for (0..4) |c| inline for (0..4) |r| {
            new.raw[c].raw[r] = 0;
            inline for (0..4) |k| {
                new.raw[c].raw[r] += a.nth(k, r) * b.nth(c, k);
            }
        };
        return new;
    }

    /// Returns a matrix that translates each dimension by the given vector.
    pub fn translate(t: zglm.Vec3f) Mat4x4 {
        return init(
            RowVec.init(1, 0, 0, t.x()),
            RowVec.init(0, 1, 0, t.y()),
            RowVec.init(0, 0, 1, t.z()),
            RowVec.init(0, 0, 0, 1),
        );
    }

    /// Returns a matrix rotated on the X (pitch) axis
    pub fn rotateX(rad: f32) Mat4x4 {
        const s = zglm.sin(rad);
        const c = zglm.cos(rad);
        return init(
            RowVec.init(1, 0, 0, 0),
            RowVec.init(0, c, s, 0),
            RowVec.init(0, -s, c, 0),
            RowVec.init(0, 0, 0, 1),
        );
    }

    /// Returns a matrix rotated on the Y (yaw) axis
    pub fn rotateY(rad: f32) Mat4x4 {
        const s = zglm.sin(rad);
        const c = zglm.cos(rad);
        return init(
            RowVec.init(c, 0, -s, 0),
            RowVec.init(0, 1, 0, 0),
            RowVec.init(s, 0, c, 0),
            RowVec.init(0, 0, 0, 1),
        );
    }

    /// Returns a matrix rotated on the Z (roll) axis
    pub fn rotateZ(rad: f32) Mat4x4 {
        const s = zglm.sin(rad);
        const c = zglm.cos(rad);
        return init(
            RowVec.init(c, s, 0, 0),
            RowVec.init(-s, c, 0, 0),
            RowVec.init(0, 0, 1, 0),
            RowVec.init(0, 0, 0, 1),
        );
    }

    /// Returns the inverse of the matrix
    pub fn invert(mat: Mat4x4) Mat4x4 {
        // :(
        var s: [6]f32 = undefined;
        var c: [6]f32 = undefined;
        s[0] = mat.nth(0, 0) * mat.nth(1, 1) - mat.nth(1, 0) * mat.nth(0, 1);
        s[1] = mat.nth(0, 0) * mat.nth(1, 2) - mat.nth(1, 0) * mat.nth(0, 2);
        s[2] = mat.nth(0, 0) * mat.nth(1, 3) - mat.nth(1, 0) * mat.nth(0, 3);
        s[3] = mat.nth(0, 1) * mat.nth(1, 2) - mat.nth(1, 1) * mat.nth(0, 2);
        s[4] = mat.nth(0, 1) * mat.nth(1, 3) - mat.nth(1, 1) * mat.nth(0, 3);
        s[5] = mat.nth(0, 2) * mat.nth(1, 3) - mat.nth(1, 2) * mat.nth(0, 3);

        c[0] = mat.nth(2, 0) * mat.nth(3, 1) - mat.nth(3, 0) * mat.nth(2, 1);
        c[1] = mat.nth(2, 0) * mat.nth(3, 2) - mat.nth(3, 0) * mat.nth(2, 2);
        c[2] = mat.nth(2, 0) * mat.nth(3, 3) - mat.nth(3, 0) * mat.nth(2, 3);
        c[3] = mat.nth(2, 1) * mat.nth(3, 2) - mat.nth(3, 1) * mat.nth(2, 2);
        c[4] = mat.nth(2, 1) * mat.nth(3, 3) - mat.nth(3, 1) * mat.nth(2, 3);
        c[5] = mat.nth(2, 2) * mat.nth(3, 3) - mat.nth(3, 2) * mat.nth(2, 3);

        // assumes it is invertible
        const idet: f32 = 1 / (s[0] * c[5] - s[1] * c[4] + s[2] * c[3] + s[3] * c[2] - s[4] * c[1] + s[5] * c[0]);

        var new: Mat4x4 = undefined;
        new.raw[0].raw[0] = (mat.nth(1, 1) * c[5] - mat.nth(1, 2) * c[4] + mat.nth(1, 3) * c[3]) * idet;
        new.raw[0].raw[1] = (-mat.nth(0, 1) * c[5] + mat.nth(0, 2) * c[4] - mat.nth(0, 3) * c[3]) * idet;
        new.raw[0].raw[2] = (mat.nth(3, 1) * s[5] - mat.nth(3, 2) * s[4] + mat.nth(3, 3) * s[3]) * idet;
        new.raw[0].raw[3] = (-mat.nth(2, 1) * s[5] + mat.nth(2, 2) * s[4] - mat.nth(2, 3) * s[3]) * idet;

        new.raw[1].raw[0] = (-mat.nth(1, 0) * c[5] + mat.nth(1, 2) * c[2] - mat.nth(1, 3) * c[1]) * idet;
        new.raw[1].raw[1] = (mat.nth(0, 0) * c[5] - mat.nth(0, 2) * c[2] + mat.nth(0, 3) * c[1]) * idet;
        new.raw[1].raw[2] = (-mat.nth(3, 0) * s[5] + mat.nth(3, 2) * s[2] - mat.nth(3, 3) * s[1]) * idet;
        new.raw[1].raw[3] = (mat.nth(2, 0) * s[5] - mat.nth(2, 2) * s[2] + mat.nth(2, 3) * s[1]) * idet;

        new.raw[2].raw[0] = (mat.nth(1, 0) * c[4] - mat.nth(1, 1) * c[2] + mat.nth(1, 3) * c[0]) * idet;
        new.raw[2].raw[1] = (-mat.nth(0, 0) * c[4] + mat.nth(0, 1) * c[2] - mat.nth(0, 3) * c[0]) * idet;
        new.raw[2].raw[2] = (mat.nth(3, 0) * s[4] - mat.nth(3, 1) * s[2] + mat.nth(3, 3) * s[0]) * idet;
        new.raw[2].raw[3] = (-mat.nth(2, 0) * s[4] + mat.nth(2, 1) * s[2] - mat.nth(2, 3) * s[0]) * idet;

        new.raw[3].raw[0] = (-mat.nth(1, 0) * c[3] + mat.nth(1, 1) * c[1] - mat.nth(1, 2) * c[0]) * idet;
        new.raw[3].raw[1] = (mat.nth(0, 0) * c[3] - mat.nth(0, 1) * c[1] + mat.nth(0, 2) * c[0]) * idet;
        new.raw[3].raw[2] = (-mat.nth(3, 0) * s[3] + mat.nth(3, 1) * s[1] - mat.nth(3, 2) * s[0]) * idet;
        new.raw[3].raw[3] = (mat.nth(2, 0) * s[3] - mat.nth(2, 1) * s[1] + mat.nth(2, 2) * s[0]) * idet;
    }

    /// Returns an orthographic projection matrix with OpenGL conventions.
    pub fn ortho(left: f32, right: f32, bottom: f32, top: f32, near: f32, far: f32) Mat4x4 {
        var mat = zero();
        mat.raw[0].raw[0] = 2 / (right - left);

        mat.raw[1].raw[1] = 2 / (top - bottom);

        mat.raw[2].raw[2] = -2 / (far - near);

        mat.raw[3].raw[0] = -(right + left) / (right - left);
        mat.raw[3].raw[1] = -(top + bottom) / (top - bottom);
        mat.raw[3].raw[2] = -(far + near) / (far - near);
        mat.raw[3].raw[3] = 1;
        return mat;
    }

    /// Returns a perspective projection matrix with OpenGL conventions.
    pub fn perspective(fovy_rad: f32, aspect: f32, near: f32, far: f32) Mat4x4 {
        const a: f32 = 1 / zglm.tan(fovy_rad / 2);
        var mat: Mat4x4 = undefined;

        mat.raw[0].raw[0] = a / aspect;
        mat.raw[0].raw[1] = 0;
        mat.raw[0].raw[2] = 0;
        mat.raw[0].raw[3] = 0;

        mat.raw[1].raw[0] = 0;
        mat.raw[1].raw[1] = a;
        mat.raw[1].raw[2] = 0;
        mat.raw[1].raw[3] = 0;

        mat.raw[2].raw[0] = 0;
        mat.raw[2].raw[1] = 0;
        mat.raw[2].raw[2] = -((far + near) / (far - near));
        mat.raw[2].raw[3] = -1;

        mat.raw[3].raw[0] = 0;
        mat.raw[3].raw[1] = 0;
        mat.raw[3].raw[2] = -((2 * far * near) / (far - near));
        mat.raw[3].raw[3] = 0;
        return mat;
    }
};

// TODO consider testing this dumbass
