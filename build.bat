
REM Simple compile and link script

REM Compiles as mips big endian elf format, as qemu requires this, so objdump
REM 	will match accordingly
REM Links to same target

REM Due to how linker.ld works, the .multiboot will head the elf and make
REM		it multibootable for `qemu-system-mips -kernel main.elf`


setlocal
	
	REM set PATH=C:\Progra~1\Imagin~1\Toolchains\mips-img-elf\2017.10-05\bin;%path%
	
	set CARGS=-O2 -Wall -ffreestanding -nostdlib
	
	mips-img-elf-gcc.exe %CARGS% -c main.s
	mips-img-elf-gcc.exe %CARGS% -T linker.ld -o main.elf main.o
	
	REM set PATH=C:\Progra~1\qemu;%path%
	REM qemu-system-mips.exe -kernel main.s
	
endlocal

