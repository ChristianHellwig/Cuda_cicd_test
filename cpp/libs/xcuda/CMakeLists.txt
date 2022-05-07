cmake_minimum_required(VERSION 3.21 FATAL_ERROR)
project(cmake_cuda LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -pedantic")
set(CMAKE_CXX_FLAGS_DEBUG "-Werror -Og")
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_FLAGS_DEBUG "-g -lineinfo")

file(GLOB SOURCE_FILES
    src/*.cu
)

add_library(cmake_cuda STATIC "${SOURCE_FILES}")
set_target_properties(cmake_cuda PROPERTIES CUDA_RESOLVE_DEVICE_SYMBOLS ON POSITION_INDEPENDENT_CODE TRUE CUDA_ARCHITECTURES "50;72")

# Include directories
target_include_directories(cmake_cuda PUBLIC src)