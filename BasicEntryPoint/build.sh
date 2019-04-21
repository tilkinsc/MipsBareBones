
# Simple compile and link script

# Compiles as mips big endian elf format, as qemu requires this, so objdump
# 	will match accordingly
# Links to same target

# Due to how linker.ld works, the .multiboot will head the elf and make
#		it multibootable for `qemu-system-mips -kernel main.elf`


CARGS="-O2 -Wall -ffreestanding -nostdlib"

mips-img-elf-gcc $CARGS -c main.s
mips-img-elf-gcc $CARGS -T linker.ld -o main.elf main.o

# qemu-system-mips -kernel main.s


