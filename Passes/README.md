# LLVM Passes
## Purpose
AutoPatch relies on 2 LLVM passes to perform its instrumentation and compilation. The first pass, `AutoPatchFirstPass`, is responsible for instrumentation and is used in the [`instrument.sh`](../Scripts/instrument.sh) script. It adds trampolines in four areas of the function: the function entrance, after/inside complex loops, after/inside complex branches, and after the the function call. It is meant to be run after the function/program is completed, and ahead of time before any security vulnerability (CVE) is discovered.

The second pass, `AutoPatchSecondPass`, generates the hotpatch. It is meant to be run after a security vulnerability is discovered in the function. Taking in the patched function, it selects the best trampoline to generate the hotpatch will. The resulting hotpatch is an executable that can be hotpatched into the running program.

Both passes are written in C++ and are located in the `Passes` directory.
## Adding passes to LLVM
To add the passes to LLVM, copy the [`AutoPatchFirstPass`](AutoPatchFirstPass) and [`AutoPatchSecondPass`](AutoPatchSecondPass) directories to your local `llvm/lib/Transforms` directory. Then, update the `CMakeLists.txt` file to include the passes. This can be done by adding the following lines to the `llvm/lib/Transforms/CMakeLists.txt` file:
```
add_subdirectory(AutoPatchFirstPass)
add_subdirectory(AutoPatchSecondPass)
```
This ensures LLVM will build these passes, allowing them to be used in the scripts.