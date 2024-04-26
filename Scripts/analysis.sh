#!/bin/bash

# Before using this script, please set the LLVM_BUILD_DIR environment variable.
# example: export LLVM_BUILD_DIR=~/llvm-project/build

# Variables - modify as needed
AUTOPATCH_ANALYSIS_REPO=~/test/AutoPatch/AutoPatchSecondPass
LLVM_PASS_SRC_FOLDER=~/llvm-project/llvm/lib/Transforms/AutoPatch

# Please also change the directory of "HOTPATCH_DIRECTORY" if needed.

# Check if LLVM_BUILD_DIR is set
if [[ -z "${LLVM_BUILD_DIR}" ]]; then
    echo "Please set the LLVM_BUILD_DIR environment variable."
    exit 1
fi

# Check if input file is provided
if [[ $# -lt 1 ]]; then
    echo "Please provide the input LLVM bitcode file."
    exit 1
fi

# Define variables
BC_FILE=$(readlink -f "$1")
BC_DIR=$(dirname "$BC_FILE")
BASENAME=$(basename -- "$BC_FILE")
FILENAME="${BASENAME%.*}"
LL_FILE="${BC_DIR}/${FILENAME}.ll"
INST_BC_FILE="${BC_DIR}/Hotpatch.bc"
LLVMAUTOPATCHSECOND="${LLVM_BUILD_DIR}/lib/LLVMAutoPatchSecond.so"
OPT="${LLVM_BUILD_DIR}/bin/opt"
LLVM_AS="${LLVM_BUILD_DIR}/bin/llvm-as"

# Ask user for function patch name and line number patch
read -p "Enter function patch name: " funcPatchName
read -p "Enter line number patch (separate multiple lines with commas): " lineNumPatchStr
IFS=',' read -r -a lineNumPatch <<< "$lineNumPatchStr"

read -p "Which Type? (filter/replace): " typeOfficialPatch

if [[ "$typeOfficialPatch" == "filter" ]]; then
 type=filter
elif [[ "$typeOfficialPatch" == "replace" ]]; then
  type=replace
  read -p "Enter offset with pc: " offsetPC
else
  echo "Invalid option: $typeOfficialPatch. Please enter either filter or replace."
  exit 1
fi

read -p "Which Type? (redirect/drop/none): " typePatch

if [[ "$typePatch" == "drop" ]]; then
 type=drop
elif [[ "$typePatch" == "redirect" ]]; then
  type=redirect
  read -p "Enter offset with pc: " lineNumPatchStr
  IFS=',' read -r -a lineNumPatch <<< "$lineNumPatchStr"
  read -p "Enter function patch name (if the patch has): " funcPatchName
elif [[ "$typePatch" == "none" ]]; then
  type=none
else
  echo "Invalid option: $typePatch. Please enter either none, redirect or drop."
  exit 1
fi

read -p "Enter CVE id: " CVEid
read -p "Enter CVE year: " CVEyear

#Please change this directory if needed.
HOTPATCH_DIRECTORY=~/AutoPatch/Testcases/Results/Hotpatch_CVE_${CVEid}.ll

# Build LLVM with LLVMAutoPatchSecond
cp $AUTOPATCH_ANALYSIS_REPO/AutoPatchSecondPass.cpp $LLVM_PASS_SRC_FOLDER/AutoPatchSecondPass/AutoPatchSecondPass.cpp
cd "${LLVM_BUILD_DIR}"
ninja

# Record start time
start=$(date +%s.%N)

# Run Analysis tool on bc file
"${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHSECOND}" -time-passes -patching -func-patch-name="${funcPatchName}" -line-num-patch="${lineNumPatchStr}" -output-dir=$HOTPATCH_DIRECTORY -cve-id="${CVEid}" -type-offpatch="${typeOfficialPatch}" -type-patch="${typePatch}" <"${BC_FILE}"> /dev/null

#NEW (AFTER EVALUATION BACK TO THE ABOVE CODE)
#"${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHSECOND}" -O1 -time-passes -patching -func-patch-name="${funcPatchName}" -line-num-patch="${lineNumPatchStr}" -output-dir=$HOTPATCH_DIRECTORY -cve-id="${CVEid}" -type-offpatch="${typeOfficialPatch}" -type-patch=$"{typePatch}" <"${BC_FILE}"> /dev/null


# Record end time
end=$(date +%s.%N)

BC_DIR2=$(dirname "${HOTPATCH_DIRECTORY}")
BASENAME2=$(basename -- "${HOTPATCH_DIRECTORY}")
INST_BC_FILE2="${BC_DIR2}/${BASENAME2%.*}.bc"

# Now you can compile the ll file to bc file
"${LLVM_AS}" "${HOTPATCH_DIRECTORY}" -o "${INST_BC_FILE2}"


# Compile generated bc file to object file
CLANG="${LLVM_BUILD_DIR}/bin/clang"
TARGET="arm-none-eabi"
MARCH="armv7e-m"
MCPU="cortex-m4"
OBJECT_FILE="${AUTOPATCHCODE_DIR}/Results/Hotpatch_CVE_${CVEid}.o"
#"$CLANG" "--target=${TARGET}" "-march=${MARCH}" "-mcpu=${MCPU}" "${INST_BC_FILE2}" "-c" "-o" "${OBJECT_FILE}"
"$CLANG" "--target=${TARGET}" "-march=${MARCH}" "-mcpu=${MCPU}" "${INST_BC_FILE2}" "-c" "-o" "${OBJECT_FILE}" "-Os"

total_time=$(echo "$end - $start" | bc)

echo "Total CPU time taken: ${total_time} seconds"
