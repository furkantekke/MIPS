
.data 
  sayi1: .asciiz "Num1="
  sayi2: .asciiz "Num2="
  toplam: .asciiz "Result="
  islem: .asciiz "operation="
  newLine: .asciiz "\n"
.text 

  main :
      
      addi $t0,$zero,0 #Num1
      addi $t1,$zero,0 #Num2
      addi $t2,$zero,0 #operation
      addi $t3,$zero,0 #result
     
      li $v0 ,4
      la $a0,sayi1
      syscall  #write sayi1 to screen
      
      li $v0 , 5
      syscall #read value $s0a ata 
      move $t0,$v0
      
      #li $v0 , 1
      #move $a0,$t0
      #syscall #write $to to screen 
      
      li $v0 ,4
      la $a0,sayi2
      syscall  #Write Sayi2 to screen
      
      li $v0 , 5
      syscall #read value from screen $s1a ata
      move $t1,$v0
      
      #li $v0 , 1
      #move $a0,$t1
      #syscall # write $t1 to screen
      
      li $v0,4
      la $a0,islem
      syscall #write operation to screen
      
      li $v0 , 5
      syscall #read operation from screen and move to $t2
      move $t2,$v0
      
      
      li $v0,4
      la $a0,newLine
      syscall
      
      addi $s3,$zero,1
      addi $s4,$zero,2
      addi $s5,$zero,3
      addi $s6,$zero,4
      
      
      beq  $t2,$s3,sum
      beq  $t2,$s4,sub
      beq  $t2,$s5,multiplication
      beq  $t2,$s6,division
      
      
     sum:
         add $t3,$t0,$t1
         li $v0 , 1
         move $a0,$t3
         syscall #write $t3 to screen
         j exit
      
      sub:
         sub $t3,$t0,$t1
         li $v0 , 1
         move $a0,$t3
         syscall #write $t3 to screen
         j exit
         
       multiplication:
       mult $t0,$t1 # t0 * t1 then move lo 
       mflo $t6     # mflo is moving  value to $t6 from lo  
       li $v0 , 1
         move $a0,$t6
         syscall #write $t6 to screen
       j exit
       
       division:
       div $t0,$t1
       mfhi $t6  #remained
       mflo $t7  #division to division operation
       li $v0 , 1
       move $a0,$t7
       syscall #write $t7 to screen 
       j exit
       
       
      exit:
       li $v0,10
       syscall

      
       
       
