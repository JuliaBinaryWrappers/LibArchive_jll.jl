# Autogenerated wrapper script for LibArchive_jll for x86_64-unknown-freebsd11.1
export bsdcat, bsdcpio, bsdtar, libarchive

using Bzip2_jll
using Expat_jll
using Libiconv_jll
using Lz4_jll
using XZ_jll
using Zlib_jll
using Zstd_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `bsdcat`
const bsdcat_splitpath = ["bin", "bsdcat"]

# This will be filled out by __init__() for all products, as it must be done at runtime
bsdcat_path = ""

# bsdcat-specific global declaration
function bsdcat(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(bsdcat_path)
    end
end


# Relative path to `bsdcpio`
const bsdcpio_splitpath = ["bin", "bsdcpio"]

# This will be filled out by __init__() for all products, as it must be done at runtime
bsdcpio_path = ""

# bsdcpio-specific global declaration
function bsdcpio(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(bsdcpio_path)
    end
end


# Relative path to `bsdtar`
const bsdtar_splitpath = ["bin", "bsdtar"]

# This will be filled out by __init__() for all products, as it must be done at runtime
bsdtar_path = ""

# bsdtar-specific global declaration
function bsdtar(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(bsdtar_path)
    end
end


# Relative path to `libarchive`
const libarchive_splitpath = ["lib", "libarchive.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libarchive_path = ""

# libarchive-specific global declaration
# This will be filled out by __init__()
libarchive_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libarchive = "libarchive.so.13"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LibArchive")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Bzip2_jll.PATH_list, Expat_jll.PATH_list, Libiconv_jll.PATH_list, Lz4_jll.PATH_list, XZ_jll.PATH_list, Zlib_jll.PATH_list, Zstd_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Bzip2_jll.LIBPATH_list, Expat_jll.LIBPATH_list, Libiconv_jll.LIBPATH_list, Lz4_jll.LIBPATH_list, XZ_jll.LIBPATH_list, Zlib_jll.LIBPATH_list, Zstd_jll.LIBPATH_list,))

    # Lastly, we need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global bsdcat_path = normpath(joinpath(artifact_dir, bsdcat_splitpath...))

    push!(PATH_list, dirname(bsdcat_path))
    global bsdcpio_path = normpath(joinpath(artifact_dir, bsdcpio_splitpath...))

    push!(PATH_list, dirname(bsdcpio_path))
    global bsdtar_path = normpath(joinpath(artifact_dir, bsdtar_splitpath...))

    push!(PATH_list, dirname(bsdtar_path))
    global libarchive_path = normpath(joinpath(artifact_dir, libarchive_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libarchive_handle = dlopen(libarchive_path)
    push!(LIBPATH_list, dirname(libarchive_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

