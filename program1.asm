.data
A: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56
B: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6
C:.space 40
length: .word 10 # length of all arrays
result:.asciiz "Result is ["
comma:.asciiz ", "
endp:.asciiz "]"
.text
main:
# By Justin Zhang
la $t0, A # first array
la $t1, B # second array
la $t2, C # result array
la $s2, C # used to print results
lw $t3, length # length
li $s3, 0 # i = 0


loopf: slt $s0, $s3, $t3 # i < length
beq $s0, $zero, endloop

# load i from array A and B
lw $s4, 0($t0)
lw $t4, 0($t1)
# subtract A[i] from B[i]
sub $s5, $s4, $t4
# save into matrix C
sw $s5, 0($t2)

addi $s3, $s3, 1 # iterate loop

# # iterate arrays
addi $t0, $t0, 4
addi $t1, $t1, 4
addi $t2, $t2, 4

j loopf

endloop:

# portion for printing
li $v0,4 # print string
la $t6, result
move $a0, $t6
syscall 

li $s3, 0 # i = 0, reset

printloop: slt $s0, $s3, $t3 # i < length
beq $s0, $zero, endprintloop
lw $s1, 0($s2)

li $v0, 1 # print int(s)
move $a0, $s1
syscall


addi $s3, $s3, 1
addi $s2, $s2, 4
# no commas should show after the last value
beq $s3, $t3, endprintloop
li $v0,4 # print separator
la $t6, comma
move $a0, $t6
syscall 

j printloop



endprintloop:
li $v0,4 # print string
la $t6, endp
move $a0, $t6
syscall 

li $v0,10
syscall