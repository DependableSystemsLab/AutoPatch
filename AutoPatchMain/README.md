# AutoPatch Main Project

This is the main project of AutoPatch that is used in Zephyr OS for evaluating the generated hotpatches. Note that part of these files, including ebpf_allocator.c, profiling.c, etc., were taken from the RapidPatch repository to evaluate the overhead and run RapidPatch.

## Structure of Project

This project consists of various files, but you only need its three main files, which include `src/LocalPatches/`, `CMakeLists.txt`, and `src/main.c`.

- src/LocalPatches: This folder is located in `src` directory and contains all of the *generated hotpatches* in *object file* format. When [`analysis.sh`](../Scripts) (AutoPatchSecondPass pass)

  
- CMakeLists.txt: To link the generated hotpatch to the OS, you must put its information in this file. For each patch, two lines should be added to this file.
  For instance: `add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10021.o)` and
                `target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10021.o)`

  We have already prepared this file for generated hotpatches and you just need to uncomment it. Note that only one of the hotpatches should be uncommented for each run. For example, if you uncomment the lines for CVE-2020-10021, the rest of the patches must be commented.

- src/main.c: This file is used to evaluate **online overheads** (see section 6 in the paper to understand how we measure these overheads). To evaluate the overhead of hotpatch execution, you need to uncomment the function `test_c()` corresponding to that hotpatch after changing the **CMakeList** file. Note again that only one of the functions shoud be uncomment.

  In each `test_c()` function, the required parameters of the hotpatch are set and the desired function located in the object file is called.





