import qbs
import GccUtl

Product {
    type: "staticlibrary"

    name: "Compression"
    targetName: "compression"

    Depends { name: "cpp" }

    cpp.archiverName: GccUtl.ar(cpp.toolchainPathPrefix)
    cpp.defines: {
        var def = ["_7ZIP_ST"];
        if (!qbs.toolchain.contains("mingw"))
            def.push("_7ZIP_ASM");

        def.push("LZMA_COMPRESSION");
        def.push("PPMD_COMPRESSION");
        return def;
    }
    cpp.cFlags: [
        "-ggdb3",
        "-Wall",
        "-Wextra",
        "-Wno-unused-parameter",
        "-Wno-unused-but-set-variable",
    ]
    cpp.cxxFlags: [
        "-std=c++11",
        "-ggdb3",
        "-Wall",
        "-Wextra",
        "-Wno-unused-parameter",
    ]
    cpp.includePaths: [
        "./src",
    ]
    files: [
        "src/p7zip/C/*.c",
        "src/p7zip/C/*.h",
    ]
    Export {
        Depends { name: "cpp" }
        cpp.includePaths: product.cpp.includePaths
        cpp.defines: product.cpp.defines
    }
}
