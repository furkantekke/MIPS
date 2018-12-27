
.data
 mesaj: .asciiz "Result="
.text
main:
   addi $s0,$zero,5  #g
   addi $s1,$zero,6  #h
   addi $s2,$zero,10 #i
   addi $s3,$zero,7 #j
   addi $t0,$zero,0	#f=(g+h)-(i+j)
   addi $t1,$zero,0   #g+h
   addi $t2,$zero,0   #i+j 
 
   jal fonk
   
   li $v0,4
   la $a0,mesaj
   syscall
   
   li $v0,1
   move $a0,$v1
   syscall
   
   
   li $v0,10
   syscall

fonk:
   addi $sp,$sp,-12
   sw $t0,8($sp)
   sw $t1,4($sp)
   sw $t2,0($sp)
   
   add $t1,$s0,$s1
   add $t2,$s2,$s3
   sub $t0,$t1,$t2
   
   add $v1, $t0,$zero
   
   lw $t0,0($sp)
   lw $t1,4($sp)
   lw $t2,8($sp)
   addi $sp,$sp,12
   
   jr $ra
   
  
