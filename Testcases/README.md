# Testcases

This folder includes two subfolder named *CVE Dataset* and *Results*.  

## CVE Dataset
This subfolder contains the real-world CVEs dataset used for evaluating the AutoPatch paper. As mentioned in the paper, we used the RapidPatch CVE dataset stored in [their github repo](https://github.com/IoTAccessControl/RapidPatch.git). The CVEs are sorted by their year of publication and their CVE number. Each CVE folder contains the source code `.c` file. 
Furthermore, if the [instrumentaion script](https://github.com/Moh3nsalehi/AutoPatchCode/blob/main/Scripts/instrument.sh) is executed on each of them, two LLVM IR files (`.bc` and `.ll`), which include the instrumented file, will be generated next to them.  

## Results
This subfolder contains the results of running [`AutoPatchSecondPass`](../LLVM%20Passes/AutoPatchSecondPass) on the CVEs dataset. For each CVE, you'll find LLVM IR files (`.bc` and `.ll`) along with executable object files (`.o`). These object files can be stored on the device and executed alongside the firmware, such as Zephyr OS. 
