#include <pybind11/pybind11.h>
#include "mathx.h"

#define STRINGIFY(x) #x
#define MACRO_STRINGIFY(x) STRINGIFY(x)

namespace py = pybind11;

int addx(int i, int j) {
    return add(i, j);
}

int addxCuda(int i, int j) {
    return addCuda(i, j);
}


#if defined(INCLUDE_CUDA)
    PYBIND11_MODULE(cmake_python_gpu, m) 
#else
    PYBIND11_MODULE(cmake_python_cpu, m) 
#endif
{
    m.doc() = R"pbdoc(
        Pybind11 example plugin
        -----------------------

        .. currentmodule:: cmake_example

        .. autosummary::
           :toctree: _generate

           add
           subtract
    )pbdoc";

    m.def("addx", &addx, R"pbdoc(
        Add two numbers

        Some other explanation about the add function.
    )pbdoc");

    m.def("addx_cuda", &addxCuda, R"pbdoc(
        Add two numbers

        Some other explanation about the add function.
    )pbdoc");

    m.def("subtract", [](int i, int j) { return i - j; }, R"pbdoc(
        Subtract two numbers

        Some other explanation about the subtract function.
    )pbdoc");

#ifdef VERSION_INFO
    m.attr("__version__") = MACRO_STRINGIFY(VERSION_INFO);
#else
    m.attr("__version__") = "dev";
#endif
}
