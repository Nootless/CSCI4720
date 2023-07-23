.data
A: .double 10.1, 5.2, 6.3, 15.1, 17.2, 19.3, 25.4, 30.2, 12.1, 56.3
B: .double 4.11, 15.0, 16.2, 5.3, 7.1, 9.1, 15.1, 10.1, 22.0, 6.4
C: .space 80
length: .word 10
result: .asciiz "Result is "
start: .asciiz "["
comma: .asciiz ", "
end: .asciiz "]"

.text

main:

# Load address
la $s0, A
la $s1, B
la $s2, C
la $s3, C

# counter
lw $t0, length
li $t1, 0

# loop
loop:
beq $t0, $t1, endloop

l.d $f0, 0($s0) # A[i]
l.d $f2, 0($s1) # B[i]

sub.d $f4, $f0, $f2 # A[i] - B[i]
s.d $f4, 0($s2) # C[i]

# update
addi $s0, $s0, 8
addi $s1, $s1, 8
addi $s2, $s2, 8
addi $t1, $t1, 1

j loop

endloop:

# reset counter
li $t1, 0

li $v0, 4
la $t2, result
move $a0, $t2
syscall
la $t2, start
move $a0, $t2
syscall

printloop:

# load
l.d $f0, 0($s3) # C[i]
addi $s3, $s3, 8
addi $t1, $t1, 1
li $v0, 3
mov.d $f12, $f0
syscall
li $v0, 4

beq $t0, $t1, endcall
la $t2, comma
move $a0, $t2
syscall 

j printloop

endcall:
la $t2, end
move $a0, $t2
syscall 
li $v0,10
syscall
