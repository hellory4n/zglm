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

const VecComponents = enum { unused, x, y, z, w, @"0", @"1" };

fn getSwizzleComps(comps: @TypeOf(.enum_literal)) [4]VecComponents {
    const comp_str = @tagName(comps);
    if (comp_str.len > 4) {
        @compileError("swizzle literal '." ++ comp_str ++ " too long");
    }

    var components: [4]VecComponents = .{ .unused, .unused, .unused, .unused };
    inline for (comp_str, 0..comp_str.len) |comp, i| {
        components[i] = switch (comp) {
            'x', 'r' => .x,
            'y', 'g' => .y,
            'z', 'b' => .z,
            'w', 'a' => .w,
            '0' => .@"0",
            '1' => .@"1",
            else => @compileError("invalid swizzle literal '." ++ comp_str ++ "'"),
        };
    }
    return components;
}

pub fn TypeFromSwizzleLiteral(comptime T: type, comptime comps: @TypeOf(.enum_literal)) type {
    const components = getSwizzleComps(comps);
    var component_count = 0;
    inline for (components) |comp| {
        if (comp == .unused) {
            break;
        }
        component_count += 1;
    }
    return @Vector(component_count, T);
}

/// additional fuckery is required to turn it into a zglm vector
pub fn swizzleImpl(
    src: anytype,
    comptime components: @TypeOf(.enum_literal),
) TypeFromSwizzleLiteral(@typeInfo(@TypeOf(src)).vector.child, components) {
    // TODO this parses the swizzle literal 3 times who gives a shit
    const comps = comptime getSwizzleComps(components);
    var dst: TypeFromSwizzleLiteral(@typeInfo(@TypeOf(src)).vector.child, components) = undefined;
    const leng: usize = @typeInfo(@TypeOf(dst)).vector.len;

    inline for (comps, 0..comps.len) |comp, i| {
        if (i >= leng) break;
        switch (comp) {
            .x => dst[i] = src[0],
            .y => dst[i] = src[1],
            .z => dst[i] = src[2],
            .w => dst[i] = src[3],
            .@"0" => dst[i] = 0,
            .@"1" => dst[i] = 1,
            .unused => break,
        }
    }

    return dst;
}
