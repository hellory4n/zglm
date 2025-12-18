const std = @import("std");
const testing = std.testing;
const cglm = @cImport({
    @cInclude("cglm/cglm.h");
});

pub fn fuck() [2]f32 {
    var a = [2]f32{ 1, 2 };
    var b = [2]f32{ 3, 4 };
    var dst: [2]f32 = undefined;
    cglm.glm_vec2_add(&a, &b, &dst);
    return dst;
}

test "fuck" {
    try testing.expectEqual([2]f32{ 4, 6 }, fuck());
}
