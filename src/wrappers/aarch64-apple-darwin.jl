# Autogenerated wrapper script for LibArchive_jll for aarch64-apple-darwin
export bsdcat, bsdcpio, bsdtar, libarchive

using Bzip2_jll
using Expat_jll
using Libiconv_jll
using Lz4_jll
using OpenSSL_jll
using XZ_jll
using Zlib_jll
using Zstd_jll
JLLWrappers.@generate_wrapper_header("LibArchive")
JLLWrappers.@declare_library_product(libarchive, "@rpath/libarchive.13.dylib")
JLLWrappers.@declare_executable_product(bsdcat)
JLLWrappers.@declare_executable_product(bsdcpio)
JLLWrappers.@declare_executable_product(bsdtar)
function __init__()
    JLLWrappers.@generate_init_header(Bzip2_jll, Expat_jll, Libiconv_jll, Lz4_jll, OpenSSL_jll, XZ_jll, Zlib_jll, Zstd_jll)
    JLLWrappers.@init_library_product(
        libarchive,
        "lib/libarchive.13.dylib",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        bsdcat,
        "bin/bsdcat",
    )

    JLLWrappers.@init_executable_product(
        bsdcpio,
        "bin/bsdcpio",
    )

    JLLWrappers.@init_executable_product(
        bsdtar,
        "bin/bsdtar",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()