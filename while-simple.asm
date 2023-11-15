.data
.text

li $t2, 0

WHILE: slti $t1,$t2,10

bne  $t1,1,EXIT

add $a0, $t2, $zero  # load desired value into argument register $a0, using pseudo-op
li  $v0, 1           # service 1 is print integer
syscall

addi $t2,$t2,1
j WHILE

EXIT:
li $v0,10
syscall 
