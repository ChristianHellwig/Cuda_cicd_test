cmake_minimum_required(VERSION 3.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(cmake_cpp VERSION 0.1.0)

file(GLOB SOURCE_FILES
     "src/*.cpp"
     "src/*.hpp"
)

# Add library
add_library(cmake_cpp STATIC ${SOURCE_FILES})

# Include directories
target_include_directories(cmake_cpp PRIVATE src)