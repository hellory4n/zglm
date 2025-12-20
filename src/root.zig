const std = @import("std");
pub const Vec2 = @import("Vec2.zig");

test {
    std.testing.refAllDecls(@This());
}
