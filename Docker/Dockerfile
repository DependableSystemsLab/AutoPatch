FROM ubuntu:20.04
LABEL Description="Image for building and testing AutoPatch"

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        curl \
        libcap-dev \
        git \
        libncurses5-dev \
        python2-minimal \
        python3-pip \
        unzip 
        libtcmalloc-minimal4 \
        libgoogle-perftools-dev \
        libsqlite3-dev \
        doxygen \
        ninja-build \
        gcc \
        g++ clang-9 llvm-9 \
        llvm-9-dev llvm-9-tools autoconf && \

RUN git clone https://github.com/llvm/llvm-project.git
RUN cd llvm-project && git checkout release/13.x && cd .. && \
    mkdir llvm-project/build && cd llvm-project/build && \
    cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt" -DLLVM_TARGETS_TO_BUILD="X86;ARM"  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_RTTI=ON-DLLVM_OPTIMIZED_TABLEGEN=ON -DCMAKE_BUILD_TYPE=Release && \
    ninja -j4 && ninja install && \

RUN git clone https://github.com/Moh3nsalehi/AutoPatchCode.git

# copy the custom LLVM files from AutoPatchCode to the llvm-project

RUN cd ../..
RUN cp AutoPatchCode/LLVM/BasicBlock.cpp llvm-project/llvm/lib/IR/BasicBlock.cpp && \
    cp AutoPatchCode/LLVM/BasicBlock.h llvm-project/llvm/include/llvm/IR/BasicBlock.h && \
    cp AutoPatchCode/LLVM/IRBuilder.h llvm-project/llvm/include/llvm/IR/IRBuilder.h && \

# copy the passes from AutoPatchCode to the llvm-project

RUN cp -r AutoPatchCode/LLVM/Passes/AutoPatchFirstPass llvm-project/llvm/lib/Transforms && \
    cp -r AutoPatchCode/LLVM/Passes/AutoPatchSecondPass llvm-project/llvm/lib/Transforms && \
    cp AutoPatchCode/LLVM/Passes/CMakeLists.txt llvm-project/llvm/lib/Transforms

# give users shell access to the container

CMD ["/bin/bash"]






