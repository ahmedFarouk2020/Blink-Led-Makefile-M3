# Blink-Led-Makefile-M3
This is a Simple project to test makefile on an ARM Cortex M3 Target

## How to get started?
1. Add your Toolchain paths into make files in `Tool chain Commands` section in makefile (there are 2 makefiles in main dir and in src dir)
2. Make your Project Structure as this sample project

## Available Commands
1. `make all` to build and extract the binaries `.hex` , `.elf` and `.bin`
2. `make clean` to remove binaries and `.o` files
3. `make flash` to upload the code to MCU -- NOT TESTED
4. `make erase` to make full memory erase -- NOT TESTED

## IMPORTANT NOTE
If you want to use this on ARM-CORTEX M4, You have to change toolchain options, in `C Flags` section, according to your target architecture 
> Example:
change -mcpu=cortex-m3 to -mcpu=cortex-m4
