cmake_minimum_required(VERSION 3.21)
project(cmake_python)

add_subdirectory(extern/pybind11)
pybind11_add_module(cmake_python src/main.cpp)




# EXAMPLE_VERSION_INFO is defined by setup.py and passed into the C++ code as a
# define (VERSION_INFO) here.
target_compile_definitions(cmake_python
                           PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})

target_link_libraries(cmake_python PRIVATE cmake_cpp)
target_include_directories(cmake_python PUBLIC ../cpp/src)
# include_directories("../cpp/src")