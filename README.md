# AutoPatchCode

## Setting up LLVM/Nordic Semiconductors Development Environment

### Configure ECE Department Linux Machine

- Use ECE login for department machines or a private login for other lab machines.
- Install the following packages (any modern version) with admin privileges:
  - git
  - gcc
  - cmake
  - ninja
  - vim
  - j-link

### Download Software Applications

Download the following software applications (may need admin privileges):

- [VSCode](https://code.visualstudio.com/)
- Nordic Semiconductor SDK (full suite)

### Configuring LLVM

1. Install and build LLVM using the following code:
`git clone https://github.com/llvm/llvm-project.git`  
`cd llvm-project && git checkout release/13.x && cd ..`  
`mkdir llvm-project/build`  
`cd llvm-project/build`  
`cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt" -DLLVM_TARGETS_TO_BUILD="X86;ARM"  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_OPTIMIZED_TABLEGEN=ON -DCMAKE_BUILD_TYPE=Release`  
`ninja -j4`  
`sudo ninja install`  

2. Add the `AutoPatchFirstPass` and `AutoPatchSecondPass` folders to the `llvm-project/lib/Transforms` directory. Update `CMakeLists.txt` to include the new passes.

3. Ensure `llvm` is on branch `release/13.x`. Since AutoPatch uses specific functionality not found in this version of `llvm`, update the following files with:  
    `llvm-project/llvm/include/IR/BasicBlock.h`  
    `llvm-project/llvm/include/IR/IRBuilder.h`  
    `llvm-project/llvm/lib/IR/BasicBlock.cpp`  


### VSCode Extensions

Download the following VSCode extensions for Zephyr and Nordic Semiconductor (found in the VSCode extension marketplace and can be installed without admin privileges):

- DeviceTree for the Zephyr Project
- Kconfig for the Zephyr Project
- nRF Connect for VSCode
- nRF Terminal

### Connecting Nordic Semiconductor ARM Board

Connect the Nordic Semiconductor ARM board to the desktop computer. If the board does not automatically show up, make sure you have installed J-Link.

Follow the instructions [here](https://www.zephyrproject.org/getting-started-with-nrf-connect-for-visual-studio-code/) to create a project, build, and flash example code onto the board.

### Run LLVM Passes Using Shell Scripts

- Change the file path constants within the shell scripts to match the local file structure.
- Choose a test C file from the examples.
- Change the file names, function names, patch type, and line numbers in the `instrument.sh` and `analysis.sh` file to match the C file.
- Run `instrument.sh`, get the `.bc` file, then use that to run `analysis.sh` to get the `.o` file.

### Flash and Execute

Flash the `.o` file onto the Nordic board and execute it.
Forward the serial port into VSCode to see printed messages in the terminal and verify correctness.


