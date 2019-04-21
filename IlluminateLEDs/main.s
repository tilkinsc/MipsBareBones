
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
	
	or $t0, 0x1F000408
	
	/* Set to which LED you want to illuminate 0-7 */
	or $t1, 1 << 7
	
	sw $t1, 0($t0)
	
	
.hang:
	
	wait
	j .hang


