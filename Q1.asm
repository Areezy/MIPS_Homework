.data
     prompt: .asciiz "Enter a positive number; "
     star:.asciiz "*"
     new_line: .asciiz "\n"
.text
.globl main

main:
li $v0, 4
la $a0, prompt
syscall
	
li $v0, 5
syscall
	
addi $t0, $v0, 0
	
addi $t1, $t1, 0
	
addi $t2, $t2, 0
Loop_2:	
	Loop_1: li $v0, 4
		la $a0, star
		addi $t1, $t1, 1
		syscall
		bne $t1, $t0 Loop_1
		li $v0, 4
		la $a0, new_line
		syscall
		addi $t2, $t2, 1
		mul $t1, $t1, $zero
		bne $t2, $t0, Loop_2
li $v0, 10
syscall		
	


	
