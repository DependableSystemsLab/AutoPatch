# AutoPatch Main Project

This is the main project of AutoPatch that is used in Zephyr OS for evaluating the generated hotpatches. Note that part of these files, including ebpf_allocator.c, profiling.c, etc., were taken from the RapidPatch repository to evaluate the overhead and run RapidPatch.

## Structure of Project

This project consists of various files, but you only need its three main files, which include `CMakeLists.txt`, `src/main.c`, and `src/LocalPatches/`.

- CMakeLists.txt: To link the generated hotpatch to the OS, you must put its information in this file. For each patch, two lines should be added to this file.
  For instance: `add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10021.o)`
  
                `target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10021.o)`

  We have already prepared this file for generated hotpatches and you just need to uncomment it. Note that only one of the hotpatches should be uncommented for each run. For example, if you uncomment the lines for CVE-2020-10021, the rest of the patches must be commented.

- src/main.c: 

- src/LocalPatches




