
	.data
var1: 	.word 0
 	msg: .asciiz "Enter a number:"
	
	.text

main:
	addi $v0,$0,4	#for write msg to screen
	la $a0, msg
	syscall

	li $v0,5	#for read user value 
	syscall
	sw $v0,var1


	li $v0,1
	lw $a0,var1	#for write var1 to screen
	syscall
