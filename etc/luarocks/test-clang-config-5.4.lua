variables = {
    CC = "clang",
    LD = "clang",

    LIBFLAG = "-shared -Wl,--export-all-symbols",
    CFLAGS = "-O2 -fPIC",

    LDFLAGS = "-fuse-ld=lld -Wl,/DEF:C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/lib/exports.def"

    AR = "llvm-ar",
    RANLIB = "llvm-ranlib"

    LUA_INCDIR = "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/include",
    LUA_LIBDIR = "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/lib",
    LUA_BINDIR = "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/bin",
    
 
    OPENSSL_INCDIR = "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/include",
    OPENSSL_LIBDIR = "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64/lib",
    
    
    MAKE = "mingw32-make"
}

external_deps_dirs = {
    "C:/Users/Administrator/Documents/lua-for-win-stable/engin/llvm-mingw-20260224-msvcrt-x86_64"
}

rocks_trees = {
    { name = "system", root = "C:/Users/Administrator/Documents/lua-for-win-stable" }
}