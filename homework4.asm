.data

array: .word # contains an array&nbsp;

length: .word # length of array

.text

main:

la $a1, array

lw $a2, length

jal Average

move $a0, $v0

li $v0,1 # print out average

syscall&nbsp;

li $v0, 10

syscall