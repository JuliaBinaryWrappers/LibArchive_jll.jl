# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule LibArchive_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("LibArchive")
JLLWrappers.@generate_main_file("LibArchive", UUID("1e303b3e-d4db-56ce-88c4-91e52606a1a8"))
end  # module LibArchive_jll
