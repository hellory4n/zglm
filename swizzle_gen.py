import itertools

def gen_swizzles(components):
    code = ""

    for length in range(1, 5):
        for combo in itertools.product(components, repeat=length):
            name = ''.join(combo)
            ret_type = ''
            if length == 1:
                ret_type='childOfVec(@TypeOf(src))'
            else:
                ret_type = f"@Vector({length}, childOfVec(@TypeOf(src)))"

            args = ', '.join(f"src[{components.index(c)}]" for c in combo)
            body = f"return .{{{args}}};"

            code += f"pub fn {name}(src: anytype) {ret_type} {{ {body} }}\n"
    return code

def gen_usingnamespace(components):
    code = ""
    for length in range(1,5):
        for combo in itertools.product(components,repeat=length):
            name = ''.join(combo)
            code += f"pub const {name} = vec.{name};\n"
    return code

print(gen_swizzles(['x', 'y', 'z', 'w']))
print(gen_swizzles(['r', 'g', 'b', 'a']))
print(gen_usingnamespace(['x','y','z','w']))
print(gen_usingnamespace(['r','g','b','a']))
