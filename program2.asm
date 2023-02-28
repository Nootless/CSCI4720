.data
arr: .word 10, 3, 45, 90, 12
length: .word 5
max: .word 0
str: .asciiz "Largest in given array is "

.text
main:
li $t0, 1 # i = 1
la $t1, arr
la $t5, arr
lw $t2, length
lw $s0, 0($t1) # first element

loop: slt $s1, $t0, $t2
beq $s1, $zero, endloop

lw $s2, 0($t1) # first element



slt $s3, $s0, $s2 # arr[i] > max
beq $s1, $zero, iterloop

maxloop:
move $s0, $s2

iterloop:
# update iterator
addi $t1, $t1, 4
addi $t0, $t0, 1
j loop


endloop:
li $v0, 4
la $t4, str # print beginning
move $a0, $t4
syscall
li $v0, 1
move $a0, $s0 # print value
sw $s0 0($t5)
syscall
li $v0, 10
syscall