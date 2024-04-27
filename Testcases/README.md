# Testcases

This folder includes two subfolder named *CVE Dataset* and *Results*.  

## CVE Dataset
This subfolder contains the real-world CVEs dataset used for evaluating the AutoPatch paper. The CVEs are sorted by their year of publication and their CVE number. Each CVE folder contains the source code `.c` file, the LLVM IR files (`.bc` and `.ll`). The `-inst` suffix on the LLVM IR files indicates that the file has been instrumented with [`AutoPatchFirstPass`](../LLVM%20Passes/AutoPatchFirstPass). 

## Results
This subfolder contains the results of running [`AutoPatchSecondPass`](../LLVM%20Passes/AutoPatchSecondPass) on the CVEs dataset. For each CVE, you'll find LLVM IR files (`.bc` and `.ll`) along with executable object files (`.o`). These object files can be stored on the device and executed alongside the firmware, such as Zephyr OS. 
