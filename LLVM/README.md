# Modifying LLVM
## Motivation
AutoPatch uses a custom version of LLVM to instrument and compile patches for C files. In particular, AutoPatch uses branch [`release/13.x`](https://github.com/llvm/llvm-project/tree/release/13.x) of LLVM but with additional functions necessary to instrument and compile into LLVM IR. For example, AutoPatch uses `BasicBlock::getFirstNonPHIOrDbgOrAlloca()`, which was added in [`release/16.x`](https://github.com/llvm/llvm-project/tree/release/16.x). However, we cannot use these newer versions due to backwards incompatibility. As such, to run AutoPatch, LLVM must be modified by hand to include these additional functions. This document describes how to modify LLVM to include these additional functions.

## Modifications
As mentioned in the main [`README`](../README.md), the following files must be modified:  
    `llvm-project/llvm/include/llvm/IR/BasicBlock.h`  
    `llvm-project/llvm/include/llvm/IR/IRBuilder.h`  
    `llvm-project/llvm/lib/IR/BasicBlock.cpp`  

To do so, simply copy the 3 files from this directory into the corresponding files in your local LLVM directory.