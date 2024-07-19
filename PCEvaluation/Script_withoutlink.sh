#!/bin/bash -e

echo "Welcome to AutoPatch Artifact"
echo "Compiling main program to bytecode ..."
clang -emit-llvm -c test.c -o test.bc
# llvm-link test.bc Hotpatch_CVE_10021.bc -o linked.bc
llc -filetype=obj test.bc -o linked.o
echo "Generating executable file ..."
clang linked.o -o my_program
./my_program

