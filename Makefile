# Toolchain
PREFIX = riscv32-none-elf-
AS = $(PREFIX)as
LD = $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy

TARGET = main
SRC = $(TARGET).s
ELF = $(TARGET).out
BIN = $(TARGET).bin

BLOCKS = block0.bin block1.bin block2.bin block3.bin

all: $(BLOCKS)

# Make an elf
$(ELF): $(SRC)
	$(AS) -o $(TARGET).o $<
	$(LD) -T linker.ld -o $@ $(TARGET).o

# ELF to raw binary
$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@

# Split binary
$(BLOCKS): $(BIN)
	$(OBJCOPY) -I binary -O binary --interleave=4 --interleave-width=1 --byte=0 $(BIN) block0.bin
	$(OBJCOPY) -I binary -O binary --interleave=4 --interleave-width=1 --byte=1 $(BIN) block1.bin
	$(OBJCOPY) -I binary -O binary --interleave=4 --interleave-width=1 --byte=2 $(BIN) block2.bin
	$(OBJCOPY) -I binary -O binary --interleave=4 --interleave-width=1 --byte=3 $(BIN) block3.bin

clean:
	rm -f $(ELF) $(BIN) $(BLOCKS)

.PHONY: all clean
