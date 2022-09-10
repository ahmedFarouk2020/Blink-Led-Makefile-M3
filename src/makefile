# Tool chain Commands
CC = E:/ArmGCC/bin/arm-none-eabi-gcc.exe
AS = E:/ArmGCC/bin/arm-none-eabi-as.exe

# C Flags
CFLAGS  = -g -O2 -Wall $(INC)
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m3 -mthumb-interwork -std=gnu11
CFLAGS += -DSTM32F10X_MD 
CFLAGS += -Wl,--gc-sections


SRCS = $(wildcard *.c)
AS_FILES = $(wildcard *.s)
INC = ../include


Ofiles:
	$(foreach file,$(SRCS), $(call GenerateObjFile, $(file)))
	$(AS) $(AS_FILES) -o $(AS_FILES:.s=.o)


define GenerateObjFile
	$(CC) $(CFLAGS) -I$(INC) -c $1
endef


clean:
	@echo "Cleaning src folder..."
	rm -f $(wildcard *.o)
