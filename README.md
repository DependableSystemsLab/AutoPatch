# AutoPatchCode

### Configure the working directory

- Install the following packages (any modern version):
  - git
  - gcc
  - cmake
  - ninja
  - vim
  - j-link
- Run the following script:  
```shell
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install build-essential curl libcap-dev git libncurses5-dev python2-minimal python3-pip unzip libtcmalloc-minimal4 libgoogle-perftools-dev libsqlite3-dev doxygen ninja-build gcc g++ clang-9 llvm-9 llvm-9-dev llvm-9-tools autoconf  
```
### Download Software Applications

Download the following software applications:

- [VSCode](https://code.visualstudio.com/)
- [Nordic Semiconductor SDK (full suite)](https://www.nordicsemi.com/Products/Development-software/nrf5-sdk)

### Configuring LLVM

1. Install and build LLVM using the following code:  
```git clone https://github.com/llvm/llvm-project.git
cd llvm-project && git checkout release/13.x && cd ..
mkdir llvm-project/build
cd llvm-project/build
cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt" -DLLVM_TARGETS_TO_BUILD="X86;ARM"  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_RTTI=ON-DLLVM_OPTIMIZED_TABLEGEN=ON -DCMAKE_BUILD_TYPE=Release
ninja -j4
sudo ninja install  
```  

2. Add the `AutoPatchFirstPass` and `AutoPatchSecondPass` folders to the `llvm-project/lib/Transforms` directory. Update `CMakeLists.txt` to include the new passes.

3. Ensure `llvm` is on branch `release/13.x`. Since AutoPatch uses specific functionality not found in this version of `llvm`, update the following files:  
    `llvm-project/llvm/include/llvm/IR/BasicBlock.h`  
    `llvm-project/llvm/include/llvm/IR/IRBuilder.h`  
    `llvm-project/llvm/lib/IR/BasicBlock.cpp`  
  with the versions found in the [`LLVM`](LLVM) directory of this repository.


### VSCode Extensions

Download the following VSCode extensions for Zephyr and Nordic Semiconductor (found in the VSCode extension marketplace):

- DeviceTree for the Zephyr Project
- Kconfig for the Zephyr Project
- nRF Connect for VSCode
- nRF Terminal

### Connecting Nordic Semiconductor ARM Board

Connect the Nordic Semiconductor ARM board (nRF52840-DK) to the desktop computer. If the board does not automatically show up, make sure you have installed J-Link.

Follow the instructions [here](https://www.zephyrproject.org/getting-started-with-nrf-connect-for-visual-studio-code/) to create a project, build, and flash example code onto the board.

### Run LLVM Passes Using Shell Scripts

- Change the file path constants within the shell scripts to match the local file structure.
- Choose a test C file from the example CVEs in [`Testcases`](Testcases).
- Change the file names, function names, patch type, and line numbers in the `instrument.sh` and `analysis.sh` file to match the C file.
- Run `instrument.sh`, get the `.bc` file, then use that to run `analysis.sh` to get the `.o` file.

### Flash and Execute

Flash the `.o` file onto the Nordic board and execute it.
Forward the serial port into VSCode to see printed messages in the terminal and verify correctness.


