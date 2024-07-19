# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)
# set(CONF_FILE ***.conf)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(hello_world)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10062_1.o)
# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10062_2.o)

add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10021.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10063.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10024.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10028.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16524.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16603.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_17443.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_17445.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10023.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_2784.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16528_1.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16528_2.o)



# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16522.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16526.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16525.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16599.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16523.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16602.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16600.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16527.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16598.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_14199.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10019.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10060.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10061.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10066.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10067.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10069.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10070.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_10071.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_13602.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_3336.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_24338.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_24338.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_13600.o)

# add_library(myac_obj OBJECT src/LocalPatches/Hotpatch_CVE_16748.o)


set_target_properties(myac_obj PROPERTIES LINKER_LANGUAGE C)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10062_1.o)
# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10062_2.o)

target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10021.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10063.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10024.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10028.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16524.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16603.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_17443.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_17445.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10023.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_2784.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16528_1.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16528_2.o)

# target_sources(app PUBLIC src/main.c)


# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16522.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16526.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16525.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16599.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16523.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16602.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16600.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16527.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16598.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_14199.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10019.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10060.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10061.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10066.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10067.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10069.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10070.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_10071.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_13602.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_3336.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_24338.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_17442.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_13600.o)

# target_sources(app PRIVATE src/main.c src/LocalPatches/Hotpatch_CVE_16748.o)


target_link_libraries(app PRIVATE myac_obj)

set(LLVM_TOOLCHAIN_PATH "~/llvm-project/build" CACHE PATH "Path to LLVM toolchain")
set(ZEPHYR_TOOLCHAIN_VARIANT "llvm" CACHE STRING "Zephyr toolchain variant")

zephyr_include_directories(
  include
  src
)

