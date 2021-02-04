.data
     prompt: .asciiz "Enter a value of X; "
.text
.globl main

main: 
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall

addi $t0, $v0, 0
	
add $a0, $zero, $t0     
jal Recursive_add     
addi $t0, $v0, 0



li $v0, 1
addi $a0, $t0, 0
syscall

li $v0, 10
syscall

Recursive_add:
   addi $sp, $sp, -8     
   sw   $ra, 4($sp)     
   sw   $a0, 0($sp)    
   bne $a0, $zero, Loop_1
   addi $v0, $zero, 0   
   addi $sp, $sp, 8     
   jr   $ra             
Loop_1: addi $a0, $a0, -1      
   jal Recursive_add             
   lw   $a0, 0($sp)     
   lw   $ra, 4($sp)     
   addi $sp, $sp, 8     
   add $v0, $a0, $v0  
   jr   $ra            



   