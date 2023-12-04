# Scripts
Before running any scripts, ensure the `LLVM_BUILD_DIR` environment variable is set.
## instrument.sh
### Overview
instrument.sh generates the LLVM IR for the patched C file. This is done by running [AutoPatchFirstPass](Passes/AutoPatchFirstPass/) in llvm.
### Operation
Run instrument.sh in the shell. Provide the patched C file, indicate that it is a patched function, and provide the line numbers containing the patch.

## analysis.sh
### Overview
analysis.sh generates the executable object file targetting specific hardware.  This is done by running [AutoPatchSecondPass](Passes/AutoPatchSecondPass/) in llvm.
### Operation
Run analysis.sh in the shell. Provide the `.bc` IR file generated after `instrument.sh`. Provide the name of the function that was patched, and the line numbers of the patch once again. Provide the CVE-id. Provide the type of the patch. 