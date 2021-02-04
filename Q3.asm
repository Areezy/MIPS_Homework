.data
prompt: .asciiz "Enter the size of the array "
index: .asciiz "Enter index "
space: .asciiz " :"
space_2: .asciiz " "
sorted: .asciiz "Your sorted array is "
.text
.globl main

main:
 
la $a0 prompt
li $v0 4
syscall


li $v0 5
syscall


addi $s0, $v0, 0


sll $a0, $v0, 2
li $v0, 9
syscall


addi $s1, $v0, 0


addi $s2, $s1, 0



Get_Int:
	beq $t1, $s0 Initialize	
	la $a0 index
	li $v0 4
	syscall	
	li $v0, 1
	addi $a0, $t1, 0
	syscall	
	la $a0, space
	li $v0 4
	syscall	
	li $v0 5
        syscall
        sw $v0, 0($s1)       
        addi $t1 $t1 1
    	addi $s1 $s1 4
    	j Get_Int

Initialize:
	addi $t1, $s0, -1
	addi $t2, $s0, -1
	add $s1, $s2, 0  
	j Sort_1


Sort_1:
	beqz $t2,Sort_2 
	addi $t2,$t2,-1
	lw $t5,0($s1)  
	lw $t6,4($s1)
	addi $s1,$s1,4
	ble $t5,$t6,Sort_1
	sw $t5,0($s1) 
	sw $t6,-4($s1)
	bnez $t2,Sort_1

Sort_2:
 	addi $s1, $s2, 0
 	addi $t1,$t1,-1   
 	add $t2,$t2,$t1   
 	bnez $t1,Sort_1    
 	li $v0,4          
 	la $a0,sorted    
 	syscall           
	addi $s1, $s2, 0    
 	addi $t1,$s0, 0        

print_array:
 	li $v0,1          
 	lw $a0,0($s1)     
	syscall           
 	li $v0,4          
	la $a0,space_2     
	syscall           
 	addi $s1,$s1,4    
 	addi $t1,$t1,-1   
 	bnez $t1,print_array    

li $v0,10              
syscall