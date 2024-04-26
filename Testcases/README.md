# Testcases

This folder includes two subfolder named *CVE Dataset* and *Results*.  

## CVE Dataset
This subfolder contains the real-world CVEs dataset used for evaluating the AutoPatch paper. The CVEs are sorted by their year of publication and their CVE number. Each CVE folder contains the source code `.c` file, the LLVM IR files (`.bc` and `.ll`). The `-inst` suffix on the LLVM IR files indicates that the file has been instrumented with [`AutoPatchFirstPass`](../LLVM%20Passes/AutoPatchFirstPass). 

## Results
The default location of the final executable object file is in the [`Results`](../Results/) folder.
