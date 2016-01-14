############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Ding Qin! \n "  # declare a zero terminated string
AnInt:	.word	17		# a word initialized to 17
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10,0	# string with carriage return and line feed
InLenW:	.word   2       # initialize to number of words in input1 and input2
InLenB:	.word   20      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	.word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
line: .asciiz " \n"
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
#
# Code for Item 3 -- 
# Print the integer value of AnInt
#
	li $v0, 1  		# system code for print_int
	lw $a0, AnInt		# word loaded into register to be printed. 
	syscall			# print int value
	
	li $v0, 4		#system code for print string
	la $a0, line		#loads address for printing string
	syscall			# prints the string
	
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#
	li $v0, 4		#system code for print string
	la $a0, space		#loads address of string to be printed
	syscall 		#prints string
	
	lw $t2,InLenB
loop: 
	beq $t0, $t2, exit	#goes to the label exit if equals to 16
	lb  $t1, Input1($t0)	#loads word from array to register
	move $a0, $t1		#copies content from register to be printed
	li $v0, 1		#system code to print int
	syscall			#print the int value in the array
	add $t0, $t0,1		#increment counter by 4.
	
	li $v0, 4		#system code for printing a string
	la $a0, space		#loading address of string
	syscall			#prints a space
	
	j loop			#jumps to label loop
exit:	
	li $v0, 4		#system code to print string
	la $a0, line		#loads address of string to print
	syscall			#prints a new line.
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#
	li $v0, 4	#system code for printing string
	la $a0, space	#loads address of string to print
	syscall 	#prints a space
	
	move $t0, $zero	#clears register to 0
	move $t1,$zero	#clears register to 0
	move $t2, $zero
	move $t3, $zero
	move $t4,$zero
	lw $t3, InLenW
	
loops:
	beq $t1, $t3, exits	#if equal to 16 go to label exits	
	lw $t0, Input2($t4)	#loads content of array into register
	sw $t0, Copy($t4)	#loads content of register into memory
	lw $t2, Copy($t4)	#loads content of array into a register
	move $a0, $t2		#loads content to be printed.
	li $v0, 1		#system code for printing int
	syscall			#prints the int
	add $t1, $t1, 1		#increments counter by 1
	add $t4, $t4, 4
	
	li $v0, 4		#system code to print string
	la $a0, space		#loads address of string to print
	syscall			#prints the string
	j loops			#jump to label loops
exits:
#
# Code for Item 6 -- 
# Print the integer average of the contents of array Input2
#
	move $t0, $zero		#clear register to zero
	move $t1, $zero		#clear register to zero
	move $t2, $zero		#clears register to zero
	move $t3, $zero
	move $t4, $zero
	move $t5, $zero
	
	lw $t3, InLenB
while:
	beq $t0, $t3, stop	#if equal to 16, go to label stop
	lb $t1, Input2($t5)	#load array contents into register
	add $t2, $t2, $t1	#add t2+t1 and store into t2 (adding contents of array)
	add $t0, $t0, 1		#increment counter
	add $t5, $t5, 1

	j while			#jump to while label
stop:
	li $v0, 4		#system code to print string 
	la $a0, line		#loads address of string to print
	syscall		
	div $t4, $t2, $t3		#divide total sum of array by 4
	li $v0, 1		#system code to print int
	move $a0, $t4		#copy content to print
	syscall			# print int (average of array)
#
# Code for Item 7 -- 
# Display the first 25 integers that are divisible by either 11 and 17 (with spaces)
#

	
	la $a0, line		#loads 
	li $v0, 4		#system code to print string
	syscall			#print a new line
	move $t0, $zero		#clear contents of register
	move $t1, $zero		#clear contents of register
	move $t2, $zero		#sets register to 0
	
counter:
	li $v0, 1		#system code for printing an int
	beq $t0, 25, end	#if equal to 25 go to label end
	div $t1, $t2, 11	#divide t2 by 11, store in $t1
	mfhi $t3		#remainder of previous division
	bgtz $t3, here		#if greater than zero go to label here
	move $a0, $t2		#copy content to be printed
	syscall			#prints the int value 
	add $t0, $t0, 1		#increment number counter
	
	li $v0, 4		#system code to print string
	la $a0, space		#loads address of string to print
	syscall			#prints a space
	add $t2,$t2,1		#increment number counter by 1
	j counter		#jump to label counter
here:
	
	div $t1, $t2, 17	#divide t2 by 17 and store it in t1
	mfhi $t3		#gets the remainder of previous division
	la $a0, ($t3)		#loads address of remainder into register
	bgtz $a0, jumper	#greater than zero, go to label jumper
	move $a0, $t2		#copy integer to print
	li $v0, 1		#system code to print int
	syscall			#prints the integer
	add $t0, $t0, 1		#increments the counter only when passed conditional statement
	
	li $v0, 4		#system code to print string
	la $a0, space		#loads address of string
	syscall			#prints a space
jumper:
	add $t2,$t2,1		#increments counter by 1
	j counter		#jumps to label counter

end:	



#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 5 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#

	
	la $a0, line		#loads 
	li $v0, 4		#system code to print string
	syscall			#print a new line
	move $t0, $zero		#clear contents of register
	move $t1, $zero		#clear contents of register
	move $t2, $zero
	move $t3, $zero
	move $t4, $zero
	
	
counters:
	
	beq $t0, 25, ends	#if equal to 25 go to label end
	div $t1, $t2, 11	#divide t2 by 11, store in $t1
	mfhi $t3		#remainder of previous division
	la $a0, ($t3)		#loads address of int
	bgtz $a0, heres		#if greater than zero go to label here
	bne $t4, 5, nested
	li $t4, 0	
	li $v0, 4
	la $a0, line
	syscall
nested:
	add $t4, $t4, 1
	move $a0, $t2		#copy content to be printed
	li $v0, 1		#system code for printing an int
	syscall			#prints the int value 
	add $t0, $t0, 1		#increment number counter
	
	
	li $v0, 4		#system code to print string
	la $a0, space		#loads address of string to print
	syscall			#prints a space
	add $t2,$t2,1		#increment number counter by 1
	j counters		#jump to label counter
heres:
	
	div $t1, $t2, 17	#divide t2 by 17 and store it in t1
	mfhi $t3		#gets the remainder of previous division
	la $a0, ($t3)		#loads address of remainder into register
	bgtz $a0, jumpers	#greater than zero, go to label jumper
	bne $t4, 5, nesteds
	li $t4, 0	
	li $v0, 4
	la $a0, line
	syscall
nesteds:	
	add $t4, $t4,1
	move $a0, $t2		#copy integer to print
	li $v0, 1		#system code to print int
	syscall			#prints the integer
	add $t0, $t0, 1		#increments the counter only when passed conditional statement
	
	li $v0, 4		#system code to print string
	la $a0, space		#loads address of string
	syscall			#prints a space
jumpers:
	add $t2,$t2,1		#increments counter by 1
	j counters		#jumps to label counter

ends:	


