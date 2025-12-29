const zglm = @import("zglm.zig");

/// A 4x4 column-major matrix of float32s.
pub const Mat4x4f = struct {
    raw: [4]zglm.Vec4f,
};
