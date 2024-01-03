# This dockerfile is meant to be run from the root directory of AutoPatchCode, not as a standalone file.

# Use an official Ubuntu 20.04 image as a base
FROM ubuntu:20.04

# Set the DEBIAN_FRONTEND to noninteractive
ARG DEBIAN_FRONTEND="noninteractive"

# Install required dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        curl \
        git \
        libcap-dev \
        libncurses5-dev \
        python2-minimal \
        python3-pip \
        unzip \
        libtcmalloc-minimal4 \
        libgoogle-perftools-dev \
        libsqlite3-dev \
        doxygen \
        ninja-build \
        gcc \
        g++ \
        clang-9 \
        cmake \
        llvm-9 \
        llvm-9-dev \
        llvm-9-tools \
        autoconf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set up SSH keys and clone Git repository
RUN mkdir ~/.ssh


# Set the working directory
WORKDIR /AutoPatchCode

# Make sure the local environment patch points to the root directory of AutoPatchCode
COPY . .

RUN git clone --depth 1 --branch release/13.x https://github.com/llvm/llvm-project.git && \
    cd llvm-project && \
    mkdir build && cd build && \
    cmake -G Ninja ../llvm \
        -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt" \
        -DLLVM_TARGETS_TO_BUILD="X86;ARM" \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_OPTIMIZED_TABLEGEN=ON \
        -DCMAKE_BUILD_TYPE=Release

RUN cp LLVM/BasicBlock.cpp llvm-project/llvm/lib/IR/BasicBlock.cpp && \
    cp LLVM/BasicBlock.h llvm-project/llvm/include/llvm/IR/BasicBlock.h && \
    cp LLVM/IRBuilder.h llvm-project/llvm/include/llvm/IR/IRBuilder.h

RUN cp -r Passes/AutoPatchFirstPass llvm-project/llvm/lib/Transforms && \
    cp -r Passes/AutoPatchSecondPass llvm-project/llvm/lib/Transforms && \
    cp Passes/CMakeLists.txt llvm-project/llvm/lib/Transforms

RUN cd llvm-project/build && \
    ninja -j4

CMD ["/bin/bash"]