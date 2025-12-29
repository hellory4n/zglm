pub const Vec2f = @Vector(2, f32);
pub const Vec2d = @Vector(2, f64);
pub const Vec2i = @Vector(2, i32);
pub const Vec2l = @Vector(2, i64);

pub const Vec3f = @Vector(3, f32);
pub const Vec3d = @Vector(3, f64);
pub const Vec3i = @Vector(3, i32);
pub const Vec3l = @Vector(3, i64);

pub const Vec4f = @Vector(4, f32);
pub const Vec4d = @Vector(4, f64);
pub const Vec4i = @Vector(4, i32);
pub const Vec4l = @Vector(4, i64);

pub const Rgbf = Vec3f;
pub const Rgb8 = Vec3i;
pub const Rgbaf = Vec4f; // rgb as fuck
pub const Rgba8 = Vec4i;

/// Raises a compile-time error if the type isn't a vector
pub fn assertVec(comptime T: type) void {
    if (@typeInfo(T) != .vector) {
        @compileError("expected vector, got " ++ @typeName(T));
    }
}

/// Returns the amount of elements in a vector
pub fn countOfVec(comptime T: type) comptime_int {
    assertVec(T);
    return @typeInfo(T).vector.len;
}

/// Returns the underlying type of a vector
pub fn childOfVec(comptime T: type) type {
    assertVec(T);
    return @typeInfo(T).vector.child;
}
