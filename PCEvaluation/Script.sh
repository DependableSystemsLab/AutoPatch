#!/bin/bash -e

echo "Welcome to AutoPatch Artifact"
echo "Compiling main program to bytecode ..."
clang -emit-llvm -c test.c -o test.bc
echo "Lininkg main and generated hotpatch ..." 
llvm-link test.bc Hotpatch_CVE_10021.bc -o linked.bc
llc -filetype=obj linked.bc -o linked.o
echo "Generating executable file ..."
clang linked.o -o my_program
echo "Executing the final program"
./my_program
echo "Congratulations! :) Process is successful!"
