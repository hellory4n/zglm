const vec4 = @import("vec4.zig");

/// Column-major 4x4 matrix
pub const Mat4x4 = struct {
    pub const T = f32;
    pub const RowVec = vec4.Vec4f;
    pub const ColVec = vec4.Vec4f;
    pub const cols = 4;
    pub const rows = 4;

    raw: [4]vec4.Vec4f,

    /// Initializes the matrices from the given row vectors. Note that matrices and vectors
    /// are column-major.
    pub fn init(r0: RowVec, r1: RowVec, r2: RowVec, r3: RowVec) Mat4x4 {
        return .{ .raw = .{
            vec4.vec4f(r0.x(), r1.x(), r2.x(), r3.x()),
            vec4.vec4f(r0.y(), r1.y(), r2.y(), r3.y()),
            vec4.vec4f(r0.z(), r1.z(), r2.z(), r3.z()),
            vec4.vec4f(r0.w(), r1.w(), r2.w(), r3.w()),
        } };
    }

    /// Returns an identity matrix.
    pub fn identity() Mat4x4 {
        return init(
            vec4.vec4f(1, 0, 0, 0),
            vec4.vec4f(0, 1, 0, 0),
            vec4.vec4f(0, 0, 1, 0),
            vec4.vec4f(0, 0, 0, 1),
        );
    }

    /// Returns a zero/null matrix.
    pub fn zero() Mat4x4 {
        return init(
            vec4.Vec4f.zero(),
            vec4.Vec4f.zero(),
            vec4.Vec4f.zero(),
            vec4.Vec4f.zero(),
        );
    }

    // TODO everything else lmao
};
