#!/bin/bash -e

clang -emit-llvm -c test.c -o test.bc
llvm-link test.bc Hotpatch_CVE_10021.bc -o linked.bc
llc -filetype=obj linked.bc -o linked.o
clang linked.o -o my_program
./my_program
