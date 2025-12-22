//! Generic vector operations
const std = @import("std");
const zglm = @import("zglm.zig");

/// TODO this sucks
pub fn PreferFloat(comptime T: type) type {
    return switch (@typeInfo(T)) {
        .float => T,
        .int => |int_type| if (int_type.bits > 32) f64 else f32,
        else => @compileError("what?"),
    };
}

/// Returns the dot product of 2 vectors
pub fn dot(comptime n: comptime_int, comptime T: type, a: @Vector(n, T), b: @Vector(n, T)) T {
    return @reduce(.Add, a * b);
}

/// Returns the squared magnitude of a vector. Faster than regular `len()`.
pub fn len2(comptime n: comptime_int, comptime T: type, a: @Vector(n, T)) T {
    return dot(n, T, a, a);
}

/// Returns the magnitude of a vector
pub fn len(comptime n: comptime_int, comptime T: type, a: @Vector(n, T)) f32 {
    return @sqrt(dot(n, T, a, a));
}

pub fn normalize(
    comptime n: comptime_int,
    comptime T: type,
    a: @Vector(n, T),
) @Vector(n, PreferFloat(T)) {
    const length = len(n, T, a);
    // division by 0 would be unfortunate
    if (length == 0) {
        return @splat(0);
    }

    var new: @Vector(n, PreferFloat(T)) = undefined;
    if (@typeInfo(T) == .float) {
        new = a;
    } else {
        inline for (0..n) |i| {
            new[i] = @floatFromInt(a[i]);
        }
    }

    return new / @as(@Vector(n, PreferFloat(T)), @splat(length));
}

/// Returns the squared distance between 2 vectors
pub fn distanceSquared(
    comptime n: comptime_int,
    comptime T: type,
    a: @Vector(n, T),
    b: @Vector(n, T),
) T {
    var out: T = 0;
    inline for (0..n) |i| {
        out += std.math.pow(T, b[i] - a[i], 2);
    }
    return out;
}

/// Returns the distance between 2 vectors
pub fn distance(
    comptime n: comptime_int,
    comptime T: type,
    a: @Vector(n, T),
    b: @Vector(n, T),
) f32 {
    return @sqrt(distanceSquared(n, T, a, b));
}

pub fn approxEq(
    comptime n: comptime_int,
    comptime T: type,
    a: @Vector(n, T),
    b: @Vector(n, T),
) bool {
    if (@typeInfo(T) == .float or @typeInfo(T) == .comptime_float) {
        inline for (0..n) |i| {
            if (!zglm.approxEq(a[i], b[i])) {
                return false;
            }
            return true;
        }
    } else {
        @reduce(.And, a == b);
    }
}
