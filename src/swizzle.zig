const childOfVec = @import("vec.zig").childOfVec;

// making this part of the build process would be overkill
// zig fmt: off
pub fn x(src: anytype) childOfVec(@TypeOf(src)) { return .{src[0]}; }
pub fn y(src: anytype) childOfVec(@TypeOf(src)) { return .{src[1]}; }
pub fn z(src: anytype) childOfVec(@TypeOf(src)) { return .{src[2]}; }
pub fn w(src: anytype) childOfVec(@TypeOf(src)) { return .{src[3]}; }
pub fn xx(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[0]}; }
pub fn xy(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[1]}; }
pub fn xz(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[2]}; }
pub fn xw(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[3]}; }
pub fn yx(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[0]}; }
pub fn yy(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[1]}; }
pub fn yz(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[2]}; }
pub fn yw(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[3]}; }
pub fn zx(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[0]}; }
pub fn zy(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[1]}; }
pub fn zz(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[2]}; }
pub fn zw(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[3]}; }
pub fn wx(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[0]}; }
pub fn wy(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[1]}; }
pub fn wz(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[2]}; }
pub fn ww(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[3]}; }
pub fn xxx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0]}; }
pub fn xxy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1]}; }
pub fn xxz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2]}; }
pub fn xxw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3]}; }
pub fn xyx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0]}; }
pub fn xyy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1]}; }
pub fn xyz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2]}; }
pub fn xyw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3]}; }
pub fn xzx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0]}; }
pub fn xzy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1]}; }
pub fn xzz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2]}; }
pub fn xzw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3]}; }
pub fn xwx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0]}; }
pub fn xwy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1]}; }
pub fn xwz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2]}; }
pub fn xww(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3]}; }
pub fn yxx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0]}; }
pub fn yxy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1]}; }
pub fn yxz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2]}; }
pub fn yxw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3]}; }
pub fn yyx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0]}; }
pub fn yyy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1]}; }
pub fn yyz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2]}; }
pub fn yyw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3]}; }
pub fn yzx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0]}; }
pub fn yzy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1]}; }
pub fn yzz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2]}; }
pub fn yzw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3]}; }
pub fn ywx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0]}; }
pub fn ywy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1]}; }
pub fn ywz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2]}; }
pub fn yww(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3]}; }
pub fn zxx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0]}; }
pub fn zxy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1]}; }
pub fn zxz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2]}; }
pub fn zxw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3]}; }
pub fn zyx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0]}; }
pub fn zyy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1]}; }
pub fn zyz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2]}; }
pub fn zyw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3]}; }
pub fn zzx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0]}; }
pub fn zzy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1]}; }
pub fn zzz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2]}; }
pub fn zzw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3]}; }
pub fn zwx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0]}; }
pub fn zwy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1]}; }
pub fn zwz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2]}; }
pub fn zww(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3]}; }
pub fn wxx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0]}; }
pub fn wxy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1]}; }
pub fn wxz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2]}; }
pub fn wxw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3]}; }
pub fn wyx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0]}; }
pub fn wyy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1]}; }
pub fn wyz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2]}; }
pub fn wyw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3]}; }
pub fn wzx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0]}; }
pub fn wzy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1]}; }
pub fn wzz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2]}; }
pub fn wzw(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3]}; }
pub fn wwx(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0]}; }
pub fn wwy(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1]}; }
pub fn wwz(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2]}; }
pub fn www(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3]}; }
pub fn xxxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[0]}; }
pub fn xxxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[1]}; }
pub fn xxxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[2]}; }
pub fn xxxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[3]}; }
pub fn xxyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[0]}; }
pub fn xxyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[1]}; }
pub fn xxyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[2]}; }
pub fn xxyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[3]}; }
pub fn xxzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[0]}; }
pub fn xxzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[1]}; }
pub fn xxzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[2]}; }
pub fn xxzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[3]}; }
pub fn xxwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[0]}; }
pub fn xxwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[1]}; }
pub fn xxwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[2]}; }
pub fn xxww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[3]}; }
pub fn xyxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[0]}; }
pub fn xyxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[1]}; }
pub fn xyxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[2]}; }
pub fn xyxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[3]}; }
pub fn xyyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[0]}; }
pub fn xyyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[1]}; }
pub fn xyyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[2]}; }
pub fn xyyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[3]}; }
pub fn xyzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[0]}; }
pub fn xyzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[1]}; }
pub fn xyzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[2]}; }
pub fn xyzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[3]}; }
pub fn xywx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[0]}; }
pub fn xywy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[1]}; }
pub fn xywz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[2]}; }
pub fn xyww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[3]}; }
pub fn xzxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[0]}; }
pub fn xzxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[1]}; }
pub fn xzxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[2]}; }
pub fn xzxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[3]}; }
pub fn xzyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[0]}; }
pub fn xzyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[1]}; }
pub fn xzyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[2]}; }
pub fn xzyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[3]}; }
pub fn xzzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[0]}; }
pub fn xzzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[1]}; }
pub fn xzzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[2]}; }
pub fn xzzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[3]}; }
pub fn xzwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[0]}; }
pub fn xzwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[1]}; }
pub fn xzwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[2]}; }
pub fn xzww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[3]}; }
pub fn xwxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[0]}; }
pub fn xwxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[1]}; }
pub fn xwxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[2]}; }
pub fn xwxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[3]}; }
pub fn xwyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[0]}; }
pub fn xwyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[1]}; }
pub fn xwyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[2]}; }
pub fn xwyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[3]}; }
pub fn xwzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[0]}; }
pub fn xwzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[1]}; }
pub fn xwzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[2]}; }
pub fn xwzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[3]}; }
pub fn xwwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[0]}; }
pub fn xwwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[1]}; }
pub fn xwwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[2]}; }
pub fn xwww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[3]}; }
pub fn yxxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[0]}; }
pub fn yxxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[1]}; }
pub fn yxxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[2]}; }
pub fn yxxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[3]}; }
pub fn yxyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[0]}; }
pub fn yxyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[1]}; }
pub fn yxyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[2]}; }
pub fn yxyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[3]}; }
pub fn yxzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[0]}; }
pub fn yxzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[1]}; }
pub fn yxzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[2]}; }
pub fn yxzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[3]}; }
pub fn yxwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[0]}; }
pub fn yxwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[1]}; }
pub fn yxwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[2]}; }
pub fn yxww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[3]}; }
pub fn yyxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[0]}; }
pub fn yyxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[1]}; }
pub fn yyxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[2]}; }
pub fn yyxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[3]}; }
pub fn yyyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[0]}; }
pub fn yyyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[1]}; }
pub fn yyyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[2]}; }
pub fn yyyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[3]}; }
pub fn yyzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[0]}; }
pub fn yyzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[1]}; }
pub fn yyzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[2]}; }
pub fn yyzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[3]}; }
pub fn yywx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[0]}; }
pub fn yywy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[1]}; }
pub fn yywz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[2]}; }
pub fn yyww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[3]}; }
pub fn yzxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[0]}; }
pub fn yzxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[1]}; }
pub fn yzxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[2]}; }
pub fn yzxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[3]}; }
pub fn yzyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[0]}; }
pub fn yzyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[1]}; }
pub fn yzyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[2]}; }
pub fn yzyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[3]}; }
pub fn yzzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[0]}; }
pub fn yzzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[1]}; }
pub fn yzzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[2]}; }
pub fn yzzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[3]}; }
pub fn yzwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[0]}; }
pub fn yzwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[1]}; }
pub fn yzwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[2]}; }
pub fn yzww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[3]}; }
pub fn ywxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[0]}; }
pub fn ywxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[1]}; }
pub fn ywxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[2]}; }
pub fn ywxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[3]}; }
pub fn ywyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[0]}; }
pub fn ywyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[1]}; }
pub fn ywyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[2]}; }
pub fn ywyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[3]}; }
pub fn ywzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[0]}; }
pub fn ywzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[1]}; }
pub fn ywzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[2]}; }
pub fn ywzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[3]}; }
pub fn ywwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[0]}; }
pub fn ywwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[1]}; }
pub fn ywwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[2]}; }
pub fn ywww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[3]}; }
pub fn zxxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[0]}; }
pub fn zxxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[1]}; }
pub fn zxxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[2]}; }
pub fn zxxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[3]}; }
pub fn zxyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[0]}; }
pub fn zxyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[1]}; }
pub fn zxyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[2]}; }
pub fn zxyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[3]}; }
pub fn zxzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[0]}; }
pub fn zxzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[1]}; }
pub fn zxzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[2]}; }
pub fn zxzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[3]}; }
pub fn zxwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[0]}; }
pub fn zxwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[1]}; }
pub fn zxwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[2]}; }
pub fn zxww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[3]}; }
pub fn zyxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[0]}; }
pub fn zyxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[1]}; }
pub fn zyxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[2]}; }
pub fn zyxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[3]}; }
pub fn zyyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[0]}; }
pub fn zyyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[1]}; }
pub fn zyyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[2]}; }
pub fn zyyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[3]}; }
pub fn zyzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[0]}; }
pub fn zyzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[1]}; }
pub fn zyzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[2]}; }
pub fn zyzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[3]}; }
pub fn zywx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[0]}; }
pub fn zywy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[1]}; }
pub fn zywz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[2]}; }
pub fn zyww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[3]}; }
pub fn zzxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[0]}; }
pub fn zzxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[1]}; }
pub fn zzxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[2]}; }
pub fn zzxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[3]}; }
pub fn zzyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[0]}; }
pub fn zzyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[1]}; }
pub fn zzyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[2]}; }
pub fn zzyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[3]}; }
pub fn zzzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[0]}; }
pub fn zzzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[1]}; }
pub fn zzzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[2]}; }
pub fn zzzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[3]}; }
pub fn zzwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[0]}; }
pub fn zzwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[1]}; }
pub fn zzwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[2]}; }
pub fn zzww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[3]}; }
pub fn zwxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[0]}; }
pub fn zwxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[1]}; }
pub fn zwxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[2]}; }
pub fn zwxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[3]}; }
pub fn zwyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[0]}; }
pub fn zwyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[1]}; }
pub fn zwyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[2]}; }
pub fn zwyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[3]}; }
pub fn zwzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[0]}; }
pub fn zwzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[1]}; }
pub fn zwzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[2]}; }
pub fn zwzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[3]}; }
pub fn zwwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[0]}; }
pub fn zwwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[1]}; }
pub fn zwwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[2]}; }
pub fn zwww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[3]}; }
pub fn wxxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[0]}; }
pub fn wxxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[1]}; }
pub fn wxxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[2]}; }
pub fn wxxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[3]}; }
pub fn wxyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[0]}; }
pub fn wxyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[1]}; }
pub fn wxyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[2]}; }
pub fn wxyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[3]}; }
pub fn wxzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[0]}; }
pub fn wxzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[1]}; }
pub fn wxzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[2]}; }
pub fn wxzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[3]}; }
pub fn wxwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[0]}; }
pub fn wxwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[1]}; }
pub fn wxwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[2]}; }
pub fn wxww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[3]}; }
pub fn wyxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[0]}; }
pub fn wyxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[1]}; }
pub fn wyxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[2]}; }
pub fn wyxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[3]}; }
pub fn wyyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[0]}; }
pub fn wyyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[1]}; }
pub fn wyyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[2]}; }
pub fn wyyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[3]}; }
pub fn wyzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[0]}; }
pub fn wyzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[1]}; }
pub fn wyzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[2]}; }
pub fn wyzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[3]}; }
pub fn wywx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[0]}; }
pub fn wywy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[1]}; }
pub fn wywz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[2]}; }
pub fn wyww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[3]}; }
pub fn wzxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[0]}; }
pub fn wzxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[1]}; }
pub fn wzxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[2]}; }
pub fn wzxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[3]}; }
pub fn wzyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[0]}; }
pub fn wzyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[1]}; }
pub fn wzyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[2]}; }
pub fn wzyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[3]}; }
pub fn wzzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[0]}; }
pub fn wzzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[1]}; }
pub fn wzzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[2]}; }
pub fn wzzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[3]}; }
pub fn wzwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[0]}; }
pub fn wzwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[1]}; }
pub fn wzwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[2]}; }
pub fn wzww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[3]}; }
pub fn wwxx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[0]}; }
pub fn wwxy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[1]}; }
pub fn wwxz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[2]}; }
pub fn wwxw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[3]}; }
pub fn wwyx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[0]}; }
pub fn wwyy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[1]}; }
pub fn wwyz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[2]}; }
pub fn wwyw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[3]}; }
pub fn wwzx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[0]}; }
pub fn wwzy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[1]}; }
pub fn wwzz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[2]}; }
pub fn wwzw(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[3]}; }
pub fn wwwx(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[0]}; }
pub fn wwwy(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[1]}; }
pub fn wwwz(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[2]}; }
pub fn wwww(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[3]}; }

pub fn r(src: anytype) childOfVec(@TypeOf(src)) { return .{src[0]}; }
pub fn g(src: anytype) childOfVec(@TypeOf(src)) { return .{src[1]}; }
pub fn b(src: anytype) childOfVec(@TypeOf(src)) { return .{src[2]}; }
pub fn a(src: anytype) childOfVec(@TypeOf(src)) { return .{src[3]}; }
pub fn rr(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[0]}; }
pub fn rg(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[1]}; }
pub fn rb(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[2]}; }
pub fn ra(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[0], src[3]}; }
pub fn gr(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[0]}; }
pub fn gg(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[1]}; }
pub fn gb(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[2]}; }
pub fn ga(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[1], src[3]}; }
pub fn br(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[0]}; }
pub fn bg(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[1]}; }
pub fn bb(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[2]}; }
pub fn ba(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[2], src[3]}; }
pub fn ar(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[0]}; }
pub fn ag(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[1]}; }
pub fn ab(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[2]}; }
pub fn aa(src: anytype) @Vector(2, childOfVec(@TypeOf(src))) { return .{src[3], src[3]}; }
pub fn rrr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0]}; }
pub fn rrg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1]}; }
pub fn rrb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2]}; }
pub fn rra(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3]}; }
pub fn rgr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0]}; }
pub fn rgg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1]}; }
pub fn rgb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2]}; }
pub fn rga(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3]}; }
pub fn rbr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0]}; }
pub fn rbg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1]}; }
pub fn rbb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2]}; }
pub fn rba(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3]}; }
pub fn rar(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0]}; }
pub fn rag(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1]}; }
pub fn rab(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2]}; }
pub fn raa(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3]}; }
pub fn grr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0]}; }
pub fn grg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1]}; }
pub fn grb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2]}; }
pub fn gra(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3]}; }
pub fn ggr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0]}; }
pub fn ggg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1]}; }
pub fn ggb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2]}; }
pub fn gga(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3]}; }
pub fn gbr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0]}; }
pub fn gbg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1]}; }
pub fn gbb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2]}; }
pub fn gba(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3]}; }
pub fn gar(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0]}; }
pub fn gag(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1]}; }
pub fn gab(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2]}; }
pub fn gaa(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3]}; }
pub fn brr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0]}; }
pub fn brg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1]}; }
pub fn brb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2]}; }
pub fn bra(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3]}; }
pub fn bgr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0]}; }
pub fn bgg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1]}; }
pub fn bgb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2]}; }
pub fn bga(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3]}; }
pub fn bbr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0]}; }
pub fn bbg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1]}; }
pub fn bbb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2]}; }
pub fn bba(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3]}; }
pub fn bar(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0]}; }
pub fn bag(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1]}; }
pub fn bab(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2]}; }
pub fn baa(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3]}; }
pub fn arr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0]}; }
pub fn arg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1]}; }
pub fn arb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2]}; }
pub fn ara(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3]}; }
pub fn agr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0]}; }
pub fn agg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1]}; }
pub fn agb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2]}; }
pub fn aga(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3]}; }
pub fn abr(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0]}; }
pub fn abg(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1]}; }
pub fn abb(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2]}; }
pub fn aba(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3]}; }
pub fn aar(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0]}; }
pub fn aag(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1]}; }
pub fn aab(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2]}; }
pub fn aaa(src: anytype) @Vector(3, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3]}; }
pub fn rrrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[0]}; }
pub fn rrrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[1]}; }
pub fn rrrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[2]}; }
pub fn rrra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[0], src[3]}; }
pub fn rrgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[0]}; }
pub fn rrgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[1]}; }
pub fn rrgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[2]}; }
pub fn rrga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[1], src[3]}; }
pub fn rrbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[0]}; }
pub fn rrbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[1]}; }
pub fn rrbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[2]}; }
pub fn rrba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[2], src[3]}; }
pub fn rrar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[0]}; }
pub fn rrag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[1]}; }
pub fn rrab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[2]}; }
pub fn rraa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[0], src[3], src[3]}; }
pub fn rgrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[0]}; }
pub fn rgrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[1]}; }
pub fn rgrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[2]}; }
pub fn rgra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[0], src[3]}; }
pub fn rggr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[0]}; }
pub fn rggg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[1]}; }
pub fn rggb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[2]}; }
pub fn rgga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[1], src[3]}; }
pub fn rgbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[0]}; }
pub fn rgbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[1]}; }
pub fn rgbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[2]}; }
pub fn rgba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[2], src[3]}; }
pub fn rgar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[0]}; }
pub fn rgag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[1]}; }
pub fn rgab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[2]}; }
pub fn rgaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[1], src[3], src[3]}; }
pub fn rbrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[0]}; }
pub fn rbrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[1]}; }
pub fn rbrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[2]}; }
pub fn rbra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[0], src[3]}; }
pub fn rbgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[0]}; }
pub fn rbgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[1]}; }
pub fn rbgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[2]}; }
pub fn rbga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[1], src[3]}; }
pub fn rbbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[0]}; }
pub fn rbbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[1]}; }
pub fn rbbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[2]}; }
pub fn rbba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[2], src[3]}; }
pub fn rbar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[0]}; }
pub fn rbag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[1]}; }
pub fn rbab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[2]}; }
pub fn rbaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[2], src[3], src[3]}; }
pub fn rarr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[0]}; }
pub fn rarg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[1]}; }
pub fn rarb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[2]}; }
pub fn rara(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[0], src[3]}; }
pub fn ragr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[0]}; }
pub fn ragg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[1]}; }
pub fn ragb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[2]}; }
pub fn raga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[1], src[3]}; }
pub fn rabr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[0]}; }
pub fn rabg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[1]}; }
pub fn rabb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[2]}; }
pub fn raba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[2], src[3]}; }
pub fn raar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[0]}; }
pub fn raag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[1]}; }
pub fn raab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[2]}; }
pub fn raaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[0], src[3], src[3], src[3]}; }
pub fn grrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[0]}; }
pub fn grrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[1]}; }
pub fn grrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[2]}; }
pub fn grra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[0], src[3]}; }
pub fn grgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[0]}; }
pub fn grgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[1]}; }
pub fn grgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[2]}; }
pub fn grga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[1], src[3]}; }
pub fn grbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[0]}; }
pub fn grbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[1]}; }
pub fn grbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[2]}; }
pub fn grba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[2], src[3]}; }
pub fn grar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[0]}; }
pub fn grag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[1]}; }
pub fn grab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[2]}; }
pub fn graa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[0], src[3], src[3]}; }
pub fn ggrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[0]}; }
pub fn ggrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[1]}; }
pub fn ggrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[2]}; }
pub fn ggra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[0], src[3]}; }
pub fn gggr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[0]}; }
pub fn gggg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[1]}; }
pub fn gggb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[2]}; }
pub fn ggga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[1], src[3]}; }
pub fn ggbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[0]}; }
pub fn ggbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[1]}; }
pub fn ggbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[2]}; }
pub fn ggba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[2], src[3]}; }
pub fn ggar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[0]}; }
pub fn ggag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[1]}; }
pub fn ggab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[2]}; }
pub fn ggaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[1], src[3], src[3]}; }
pub fn gbrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[0]}; }
pub fn gbrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[1]}; }
pub fn gbrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[2]}; }
pub fn gbra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[0], src[3]}; }
pub fn gbgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[0]}; }
pub fn gbgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[1]}; }
pub fn gbgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[2]}; }
pub fn gbga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[1], src[3]}; }
pub fn gbbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[0]}; }
pub fn gbbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[1]}; }
pub fn gbbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[2]}; }
pub fn gbba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[2], src[3]}; }
pub fn gbar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[0]}; }
pub fn gbag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[1]}; }
pub fn gbab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[2]}; }
pub fn gbaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[2], src[3], src[3]}; }
pub fn garr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[0]}; }
pub fn garg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[1]}; }
pub fn garb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[2]}; }
pub fn gara(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[0], src[3]}; }
pub fn gagr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[0]}; }
pub fn gagg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[1]}; }
pub fn gagb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[2]}; }
pub fn gaga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[1], src[3]}; }
pub fn gabr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[0]}; }
pub fn gabg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[1]}; }
pub fn gabb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[2]}; }
pub fn gaba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[2], src[3]}; }
pub fn gaar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[0]}; }
pub fn gaag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[1]}; }
pub fn gaab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[2]}; }
pub fn gaaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[1], src[3], src[3], src[3]}; }
pub fn brrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[0]}; }
pub fn brrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[1]}; }
pub fn brrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[2]}; }
pub fn brra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[0], src[3]}; }
pub fn brgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[0]}; }
pub fn brgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[1]}; }
pub fn brgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[2]}; }
pub fn brga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[1], src[3]}; }
pub fn brbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[0]}; }
pub fn brbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[1]}; }
pub fn brbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[2]}; }
pub fn brba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[2], src[3]}; }
pub fn brar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[0]}; }
pub fn brag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[1]}; }
pub fn brab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[2]}; }
pub fn braa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[0], src[3], src[3]}; }
pub fn bgrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[0]}; }
pub fn bgrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[1]}; }
pub fn bgrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[2]}; }
pub fn bgra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[0], src[3]}; }
pub fn bggr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[0]}; }
pub fn bggg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[1]}; }
pub fn bggb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[2]}; }
pub fn bgga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[1], src[3]}; }
pub fn bgbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[0]}; }
pub fn bgbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[1]}; }
pub fn bgbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[2]}; }
pub fn bgba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[2], src[3]}; }
pub fn bgar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[0]}; }
pub fn bgag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[1]}; }
pub fn bgab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[2]}; }
pub fn bgaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[1], src[3], src[3]}; }
pub fn bbrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[0]}; }
pub fn bbrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[1]}; }
pub fn bbrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[2]}; }
pub fn bbra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[0], src[3]}; }
pub fn bbgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[0]}; }
pub fn bbgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[1]}; }
pub fn bbgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[2]}; }
pub fn bbga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[1], src[3]}; }
pub fn bbbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[0]}; }
pub fn bbbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[1]}; }
pub fn bbbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[2]}; }
pub fn bbba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[2], src[3]}; }
pub fn bbar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[0]}; }
pub fn bbag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[1]}; }
pub fn bbab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[2]}; }
pub fn bbaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[2], src[3], src[3]}; }
pub fn barr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[0]}; }
pub fn barg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[1]}; }
pub fn barb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[2]}; }
pub fn bara(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[0], src[3]}; }
pub fn bagr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[0]}; }
pub fn bagg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[1]}; }
pub fn bagb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[2]}; }
pub fn baga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[1], src[3]}; }
pub fn babr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[0]}; }
pub fn babg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[1]}; }
pub fn babb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[2]}; }
pub fn baba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[2], src[3]}; }
pub fn baar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[0]}; }
pub fn baag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[1]}; }
pub fn baab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[2]}; }
pub fn baaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[2], src[3], src[3], src[3]}; }
pub fn arrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[0]}; }
pub fn arrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[1]}; }
pub fn arrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[2]}; }
pub fn arra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[0], src[3]}; }
pub fn argr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[0]}; }
pub fn argg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[1]}; }
pub fn argb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[2]}; }
pub fn arga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[1], src[3]}; }
pub fn arbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[0]}; }
pub fn arbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[1]}; }
pub fn arbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[2]}; }
pub fn arba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[2], src[3]}; }
pub fn arar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[0]}; }
pub fn arag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[1]}; }
pub fn arab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[2]}; }
pub fn araa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[0], src[3], src[3]}; }
pub fn agrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[0]}; }
pub fn agrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[1]}; }
pub fn agrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[2]}; }
pub fn agra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[0], src[3]}; }
pub fn aggr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[0]}; }
pub fn aggg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[1]}; }
pub fn aggb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[2]}; }
pub fn agga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[1], src[3]}; }
pub fn agbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[0]}; }
pub fn agbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[1]}; }
pub fn agbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[2]}; }
pub fn agba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[2], src[3]}; }
pub fn agar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[0]}; }
pub fn agag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[1]}; }
pub fn agab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[2]}; }
pub fn agaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[1], src[3], src[3]}; }
pub fn abrr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[0]}; }
pub fn abrg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[1]}; }
pub fn abrb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[2]}; }
pub fn abra(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[0], src[3]}; }
pub fn abgr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[0]}; }
pub fn abgg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[1]}; }
pub fn abgb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[2]}; }
pub fn abga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[1], src[3]}; }
pub fn abbr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[0]}; }
pub fn abbg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[1]}; }
pub fn abbb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[2]}; }
pub fn abba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[2], src[3]}; }
pub fn abar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[0]}; }
pub fn abag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[1]}; }
pub fn abab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[2]}; }
pub fn abaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[2], src[3], src[3]}; }
pub fn aarr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[0]}; }
pub fn aarg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[1]}; }
pub fn aarb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[2]}; }
pub fn aara(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[0], src[3]}; }
pub fn aagr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[0]}; }
pub fn aagg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[1]}; }
pub fn aagb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[2]}; }
pub fn aaga(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[1], src[3]}; }
pub fn aabr(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[0]}; }
pub fn aabg(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[1]}; }
pub fn aabb(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[2]}; }
pub fn aaba(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[2], src[3]}; }
pub fn aaar(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[0]}; }
pub fn aaag(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[1]}; }
pub fn aaab(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[2]}; }
pub fn aaaa(src: anytype) @Vector(4, childOfVec(@TypeOf(src))) { return .{src[3], src[3], src[3], src[3]}; }
// zig fmt: on
