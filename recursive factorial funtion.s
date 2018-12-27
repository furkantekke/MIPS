
	.data
 msg: .asciiz "Result="
	.text
main:
   addi $s0,$zero,5 
 
   jal fak
   
   li $v0,4
   la $a0,msg
   syscall
   
   li $v0,1
   move $a0,$v1
   syscall
   
   
   li $v0,10
   syscall

fak:
   addi $sp,$sp,-8
   sw $ra,4($sp)
   sw $s0,0($sp)
   
   slti $t0,$s0,1
   beq $t0,$zero,L1
   
   addi $v1,$zero,1
   addi $sp,$sp,8
   jr $ra
   
   L1:
   addi $s0,$s0,-1
   jal fak

   lw $s0,0($sp)
   lw $ra,4($sp)
   addi $sp,$sp,8
   
   mul $v1,$s0,$v1
   
   jr $ra
