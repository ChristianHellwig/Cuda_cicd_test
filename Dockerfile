FROM nvidia/cuda:11.6.0-devel-ubuntu20.04 

# Install required tools
RUN apt-get update
RUN apt-get install -y python3 python3-pip gcc-10 g++-10 wget

# Set compiler variables
RUN export CC=/usr/bin/gcc-10
RUN export CXX=/usr/bin/g++-10
RUN export CUDAHOSTCXX=/usr/bin/g++-10

# Install Test environement
RUN python3 -m pip install pytest

# Install CMAKE
RUN wget -O /cmake.sh https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.sh
RUN mkdir /opt/cmake
RUN sh /cmake.sh --prefix=/opt/cmake --skip-license
RUN ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
RUN cmake --version

# Check nvcc version
RUN nvcc --version
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
# Copy the host directory to the container
COPY . / $HOME/src/
WORKDIR $HOME/src/ 
RUN mkdir build;

# Build and install the library
RUN pip install ./ -v

# Run tests
RUN python3 -m pytest test/test.py

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT echo "Hello world"