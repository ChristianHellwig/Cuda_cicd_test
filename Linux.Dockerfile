FROM quay.io/pypa/manylinux_2_24_x86_64

RUN apt-get update
# RUN apt-get install -y python3 python3-pip
RUN python3.7 -m pip install pytest


# Install cmake
# RUN wget -O /cmake.sh https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.sh
# RUN mkdir /opt/cmake
# RUN sh /cmake.sh --prefix=/opt/cmake --skip-license
# RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
# RUN cmake --version


# Install required tools
ENV cuda=11.3
ENV built_tool_version=10     

# ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

ADD scripts /scripts

RUN ls /scripts
RUN chmod +x /scripts/install_build_environment_linux.sh
RUN ./scripts/install_build_environment_linux.sh
RUN . ~/.bashrc

ENV CUDA_PATH="/usr/local/cuda-$cuda"
ENV PATH="$CUDA_PATH/bin:/usr/bin/cmake:$PATH"
ENV LD_LIBRARY_PATH="$CUDA_PATH/lib:$LD_LIBRARY_PATH"
ENV LD_LIBRARY_PATH="$CUDA_PATH/lib64:$LD_LIBRARY_PATH"

# RUN wget "http://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-10.3.0/gcc-10.3.0.tar.gz" 
# RUN tar -xzf gcc-10.3.0.tar.gz
# RUN cd gcc-10.3.0
# RUN ./contrib/download_prerequisites


# Install Test environement

# RUN echo $PATH
# # Check nvcc version
RUN nvcc --version

COPY . / $HOME/src/
WORKDIR $HOME/src/ 
# RUN mkdir build;

# # Build and install the library
ENV INCLUDE_CUDA=ON
RUN python3.7 -m pip install ./ -v

RUN python3.7 -m pytest test/test.py

ENTRYPOINT ["tail", "-f", "/dev/null"]
# ENTRYPOINT echo "Hello world"
# Trigger