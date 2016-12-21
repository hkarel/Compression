import qbs
import GccUtl

Product {
    type: "staticlibrary"

    name: "Compression"
    targetName: "compression"

    Depends { name: "cpp" }

    cpp.archiverName: GccUtl.ar(cpp.toolchainPathPrefix)
    cpp.defines: [
        "_7ZIP_ST",
        "_7ZIP_ASM",
    ]
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
    }
}