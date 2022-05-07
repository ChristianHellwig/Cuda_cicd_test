cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(cmake_cpp LANGUAGES CXX VERSION 0.1.0)
add_subdirectory(libs/xcuda)

file(GLOB SOURCE_FILES
     "src/*.cpp"
     "src/*.hpp"
)

# Add library
add_library(cmake_cpp STATIC ${SOURCE_FILES})
# target_include_directories(cmake_cpp PUBLIC src libs/xcuda/src)


# ADD_DEFINITIONS(-DINCLUDE_CUDA)
# target_link_libraries(cmake_cpp PUBLIC cmake_cuda)
set_target_properties(cmake_cpp PROPERTIES POSITION_INDEPENDENT_CODE ON)


# Include directories
option(INCLUDE_CUDA "Compile with CUDA compentents" OFF) #OFF by default
if(INCLUDE_CUDA)
     message("CMAKE: INCLUDE_CUDA is set. CUDA will be included")
     ADD_DEFINITIONS(-DINCLUDE_CUDA)
     target_link_libraries(cmake_cpp PUBLIC cmake_cuda)
     target_include_directories(cmake_cpp PUBLIC src libs/xcuda/src)
else()
     message("CMAKE: INCLUDE_CUDA not set. CUDA will not be included")
     target_include_directories(cmake_cpp PUBLIC src)
endif(INCLUDE_CUDA)
unset(INCLUDE_CUDA CACHE)
