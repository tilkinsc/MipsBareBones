
.set ALIGN, 1 << 0
.set MEMINFO, 1 << 1
.set FLAGS, ALIGN | MEMINFO
.set MAGIC, 0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM



.section .rodata
ASCIIBAR: .ascii "ABCDEFGH"


.text

.global _start
_start:
	
	xor $t0, $t0
	xor $t1, $t1
	xor $t2, $t2
	
	
	/* Write a word to this memory address for displaying HEX number */
	/* or write to subsequent 8-delim memory addresses for characters */
	or $t0, 0x1F000410
	
	/* Load the address of the non-zero terminated string */
	la $t1, ASCIIBAR
	
	
	/* Write out the string byte by byte */
	lb $t2, 0($t1)
	sb $t2, 8($t0)
	
	lb $t2, 1($t1)
	sb $t2, 16($t0)
	
	lb $t2, 2($t1)
	sb $t2, 24($t0)
	
	lb $t2, 3($t1)
	sb $t2, 32($t0)
	
	lb $t2, 4($t1)
	sb $t2, 40($t0)
	
	lb $t2, 5($t1)
	sb $t2, 48($t0)
	
	lb $t2, 6($t1)
	sb $t2, 56($t0)
	
	lb $t2, 7($t1)
	sb $t2, 64($t0)
	
	
.hang:
	
	wait
	j .hang


