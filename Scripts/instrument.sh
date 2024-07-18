#!/bin/bash

# Before using this script, please set the LLVM_BUILD_DIR environment variable.
# example: export LLVM_BUILD_DIR=~/llvm-project/build

# Variables - modify as needed
AUTOPATCH_INSTRUMENT_REPO=~/test/AutoPatch/AutoPatchFirstPass #Includes AutoPatch source code
LLVM_PASS_SRC_FOLDER=~/llvm-project/llvm/lib/Transforms/AutoPatch
# HEADER_DIR=~/AutoPatch/zephyr-main/include/

# Check if LLVM_BUILD_DIR is set
if [[ -z "${LLVM_BUILD_DIR}" ]]; then
    echo "Please set the LLVM_BUILD_DIR environment variable."
    exit 1
fi

# Check if input file is provided
if [[ $# -lt 1 ]]; then
    echo "Please provide the input C source file."
    exit 1
fi

# Define variables
SRC_FILE=$(readlink -f "$1")
SRC_DIR=$(dirname "$SRC_FILE")
BASENAME=$(basename -- "$SRC_FILE")
FILENAME="${BASENAME%.*}"
LL_FILE="${SRC_DIR}/${FILENAME}.ll"
INST_LL_FILE="${SRC_DIR}/${FILENAME}-inst.ll"
INST_BC_FILE="${SRC_DIR}/${FILENAME}-inst.bc"
LLVMAUTOPATCHFIRST="${LLVM_BUILD_DIR}/lib/LLVMAutoPatchFirst.so"
OPT="${LLVM_BUILD_DIR}/bin/opt"
LLVM_AS="${LLVM_BUILD_DIR}/bin/llvm-as"
LLVM_CLANG="${LLVM_BUILD_DIR}/bin/clang-13"

read -p "Is it patched? (true/false): " isPatchedInput

if [[ "$isPatchedInput" == "false" ]]; then
  isPatched=false
else
  isPatched=true
  read -p "Enter line number patch (separate multiple lines with commas): " lineNumPatchStr
  IFS=',' read -r -a lineNumPatch <<< "$lineNumPatchStr"
  read -p "Enter function patch name (if the patch has): " funcPatchName
fi




# Compile C code to ll file
# clang -O0 -g -S -emit-llvm -I"${HEADER_DIR}" -o "${LL_FILE}" -c "${SRC_FILE}"
"${LLVM_CLANG}" -O0 -g -S -emit-llvm -o "${LL_FILE}" -c "${SRC_FILE}"

# Build LLVM with LLVMAutoPatchFirst
cp $AUTOPATCH_INSTRUMENT_REPO/AutoPatchFirstPass.cpp $LLVM_PASS_SRC_FOLDER/AutoPatchFirstPass/AutoPatchFirstPass.cpp
cd "${LLVM_BUILD_DIR}"
ninja

# echo "HEADER_DIR=${HEADER_DIR}"

# Record start time
start=$(date +%s.%N)

# Run Instrumentation tool on ll file
# "${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHFIRST}" -instrumentcode -I"${HEADER_DIR}" "${LL_FILE}" -o "${INST_LL_FILE}"
# "${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHFIRST}" -instrumentcode -is-patched="${isPatchedInput}" -line-num-patch="${lineNumPatchStr}" -func-patch-name="${funcPatchName}" "${LL_FILE}" -o "${INST_LL_FILE}"

# Pass the --line-num-patch option only if isPatchedInput is true and lineNumPatchStr is not empty
if [[ "$isPatched" == "true" && -n "$lineNumPatchStr" ]]; then
  "${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHFIRST}" -time-passes -instrumentcode -is-patched="${isPatchedInput}" -line-num-patch="${lineNumPatchStr}" -func-patch-name="${funcPatchName}" "${LL_FILE}" -o "${INST_LL_FILE}"
else
  "${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHFIRST}" -time-passes -instrumentcode -is-patched="${isPatchedInput}" -func-patch-name="${funcPatchName}" "${LL_FILE}" -o "${INST_LL_FILE}"
fi
#Record end time
end=$(date +%s.%N)

total_time=$(echo "$end - $start" | bc)


# Compile generated ll file by IC to bc
"${LLVM_AS}" "${INST_LL_FILE}" -o "${INST_BC_FILE}"


echo "Total CPU time taken: ${total_time} seconds"
