# LLVM Passes
## Purpose
AutoPatch relies on 2 LLVM passes to perform its instrumentation and compilation. The first pass, `AutoPatchFirstPass`, is responsible for instrumentation and is used in the [`instrument.sh`](../Scripts/instrument.sh) script. The second pass, `AutoPatchSecondPass`, completes the instrumentation and prepares the LLVM IR for compilation, all of which is done in the [`analysis.sh`](../Scripts/analysis.sh) script.

Both passes are written in C++ and are located in the `Passes` directory.
## Adding passes to LLVM
To add the passes to LLVM, copy the [`AutoPatchFirstPass`](AutoPatchFirstPass) and [`AutoPatchSecondPass`](AutoPatchSecondPass) directories to your local `llvm/lib/Transforms` directory. Then, update the `CMakeLists.txt` file to include the passes. This can be done by adding the following lines to the `llvm/lib/Transforms/CMakeLists.txt` file:
```
add_subdirectory(AutoPatchFirstPass)
add_subdirectory(AutoPatchSecondPass)
```
This ensures LLVM will build these passes, allowing them to be used in the scripts.