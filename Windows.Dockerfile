FROM mcr.microsoft.com/windows/servercore:ltsc2019

# https://github.com/StefanScherer/dockerfiles-windows/blob/master/chocolatey/Dockerfile
ENV chocolateyUseWindowsCompression false

# This requires working DNS in Docker daemon. On Windows I had to add this to docker/daemon.json: "dns": ["8.8.8.8"]
# RUN powershell -Command \
#     iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
#     choco feature disable --name showDownloadProgress

# # Install required tools
# ENV cuda=11.3
# ENV built_tool_version=10     

# # ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

# ADD scripts C:/Temp/scripts
# RUN DIR C:/Temp/scripts

# SHELL ["cmd", "/S", "/C"]    
# RUN powershell -noexit "& ""C:/Temp/scripts/install_build_environment_windows.ps"""
# # Install Test environement

# RUN echo $PATH
# # Check nvcc version
# RUN nvcc --version

# COPY . / $HOME/src/
# WORKDIR $HOME/src/ 
# RUN mkdir build;

# # Build and install the library
# RUN python3.7 -m pip install ./ -v


#ENTRYPOINT ["tail", "-f", "/dev/null"]

ENTRYPOINT ["ping", "-t", "localhost"]
# ENTRYPOINT echo "Hello world"