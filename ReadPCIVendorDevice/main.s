
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


.text

.global _start
_start:
	
	xor $t0, $t0
	xor $t1, $t1
	xor $t2, $t2
	xor $t3, $t3
	
	/* write enable bit to address 0x1800:0CF8 */
	or $t0, 0x80000000
	or $t1, 0x18000CF8
	
	sw $t0, 0($t1)
	
	
	/* read vendor */
	or $t2, 0x18000CFC
	
	/* 16-bit read */
	lh $t3, 0($t2)
	nop
	
	/* $t3 should have 0xF... if device not found */
	
	
.hang:
	
	wait
	j .hang


