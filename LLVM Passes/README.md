# LLVM Passes

AutoPatch relies on 2 LLVM passes to perform its instrumentation and generate the hotpatch. 
The first pass, `AutoPatchFirstPass`, is responsible for instrumentation and is used in the [`instrument.sh`](../Scripts/instrument.sh) script. 
This pass adds trampolines in the four locations (i.e., **Instrumentation Locations**) of each function: 
1) Function entrance
2) After function calls
3) Inside and after complex loops
4) Inside and after complex branches
   
The second pass, `AutoPatchSecondPass`, generates the hotpatch. It is meant to be run after a security vulnerability is discovered in the vulnerable function. Taking in the patched function, it selects the best trampoline to generate the hotpatch will. The resulting hotpatch is an executable that can be stored into the running embedded device.

Both passes are written in C++ and are located in the `LLVM Passes` directory.

## Installing LLVM

1. Install and build LLVM using the following code:  
```
git clone https://github.com/llvm/llvm-project.git
cd llvm-project && git checkout release/13.x && cd ..
mkdir llvm-project/build
cd llvm-project/build
cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt" -DLLVM_TARGETS_TO_BUILD="X86;ARM"  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_RTTI=ON-DLLVM_OPTIMIZED_TABLEGEN=ON -DCMAKE_BUILD_TYPE=Release
ninja -j4
sudo ninja install  
```
*The `DLLVM_TARGETS_TO_BUILD` cmake flag can be modified to build patches targeting other architectures.  

2. Add the `AutoPatchFirstPass` and `AutoPatchSecondPass` folders to the `llvm-project/lib/Transforms` directory. Update `CMakeLists.txt` to include the new passes.

3. Ensure `llvm` is on branch `release/13.x`. Since AutoPatch uses specific functionality not found in this version of `llvm`, update the following files:  
    `llvm-project/llvm/include/llvm/IR/BasicBlock.h`  
    `llvm-project/llvm/include/llvm/IR/IRBuilder.h`  
    `llvm-project/llvm/lib/IR/BasicBlock.cpp`  
  with the versions found in the [`LLVM`](LLVM) directory of this repository.



### Adding passes to LLVM
To add the passes to LLVM, copy the [`AutoPatchFirstPass`](AutoPatchFirstPass) and [`AutoPatchSecondPass`](AutoPatchSecondPass) directories to your local `llvm/lib/Transforms` directory. Then, update the `CMakeLists.txt` file to include the passes. This can be done by adding the following lines to the `llvm/lib/Transforms/CMakeLists.txt` file:
```
add_subdirectory(AutoPatchFirstPass)
add_subdirectory(AutoPatchSecondPass)
```
This ensures LLVM will build these passes, allowing them to be used in the scripts.
