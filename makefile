# Tool chain Commands
CC = E:/ArmGCC/bin/arm-none-eabi-gcc.exe
SIZE = E:/ArmGCC/bin/arm-none-eabi-size
BIN = E:/ArmGCC/bin/arm-none-eabi-objcopy
STL = ST-LINK_CLI.exe


# C Flags
CFLAGS  = -g -O2 -Wall $(INC)
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m3 -mthumb-interwork -std=gnu11
CFLAGS += -DSTM32F10X_MD 
CFLAGS += -Wl,--gc-sections

# List of all .c files and .s files
SRCS = $(wildcard ./src/*.c)

# Include Directories
INC = -I./include

# Project Name
ProjectName := app

# Binaries stored here
BIN_DIR = Binaries


# Generate .o file from each .c and .s file
Ofiles:
	make -C ./src $@



SIZE:
	$(SIZE) --format=berkeley $(BIN_DIR)/$(ProjectName).elf

$(BIN_DIR)/$(ProjectName).elf: Ofiles
	$(CC) $(CFLAGS) $(INC) -T./include/stm32_flash.ld -o $(BIN_DIR)/$(ProjectName).elf $(wildcard ./src/*.o)

$(ProjectName).bin: $(BIN_DIR)/$(ProjectName).elf
	$(BIN) -O binary $(BIN_DIR)/$(ProjectName).elf $(BIN_DIR)/$(ProjectName).bin


$(ProjectName).hex: $(BIN_DIR)/$(ProjectName).elf
	arm-none-eabi-objcopy -O ihex $(BIN_DIR)/$(ProjectName).elf $(BIN_DIR)/$(ProjectName).hex


BUILD:
	mkdir -p $(BIN_DIR)
#-------------------------------------
# -------------- User Targets --------
#-------------------------------------
all: BUILD $(ProjectName).hex $(ProjectName).bin SIZE

clean:
	@echo "Cleaning..."
	make -C ./src $@
	rm -f $(wildcard *.hex *.o *.elf *.bin)
	rm -f $(BIN_DIR)/*


flash: $(ProjectName).bin
	$(STL) write $(ProjectName).bin 0x8000000


erase:
	$(STL) erase