.data
arr: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29
length: .word 20

.text
main:

la $a0, arr # array
lw $a1, length # length
li $a2, 22 # value to search

jal searchArray
move $a0, $v0
li $v0, 1
syscall
li $v0, 10
syscall


searchArray:
li $t0, 0 # counter
li $t2, -1 # if value found

loop: beq $t0, $a1, endloop
lw $t1, 0($a0)
beq $t1, $a2, endupdateloop # if current value = value to find

# update iterator
addi $a0, $a0, 4
addi $t0, $t0, 1
j loop


endloop:
move $v0, $t2
jr $ra

endupdateloop:
move $v0, $t0
jr $ra
