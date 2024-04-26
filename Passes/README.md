# LLVM Passes

AutoPatch relies on 2 LLVM passes to perform its instrumentation and compilation. The first pass, `AutoPatchFirstPass`, is responsible for instrumentation and is used in the [`instrument.sh`](../Scripts/instrument.sh) script. 
It adds trampolines in four locations (i.e., **Instrumentation Locations**) of the function: 
1) Function entrance
2) After function calls
3) Inside and after complex loops
4) Inside and after complex branches
   
The second pass, `AutoPatchSecondPass`, generates the hotpatch. It is meant to be run after a security vulnerability is discovered in the vulnerable function. Taking in the patched function, it selects the best trampoline to generate the hotpatch will. The resulting hotpatch is an executable that can be stored into the running embedded device.

Both passes are written in C++ and are located in the `LLVM Passes` directory.

## Adding passes to LLVM
To add the passes to LLVM, copy the [`AutoPatchFirstPass`](AutoPatchFirstPass) and [`AutoPatchSecondPass`](AutoPatchSecondPass) directories to your local `llvm/lib/Transforms` directory. Then, update the `CMakeLists.txt` file to include the passes. This can be done by adding the following lines to the `llvm/lib/Transforms/CMakeLists.txt` file:
```
add_subdirectory(AutoPatchFirstPass)
add_subdirectory(AutoPatchSecondPass)
```
This ensures LLVM will build these passes, allowing them to be used in the scripts.
