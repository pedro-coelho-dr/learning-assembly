.data
.text

main:
addi $a0,$zero,10
addi $a1,$zero,4

jal calcular_media

add $a0, $v0, $zero  # load desired value into argument register $a0, using pseudo-op
li  $v0, 1           # service 1 is print integer
syscall

li $v0,10
syscall


calcular_media:
	addi $sp, $sp -4
	sw $ra, (0)$sp
	
	jal somar_notas
	
	srl $v0, $v0, 1
	
	jr (0)$sp

	lw $ra, (0)$sp
	addi $sp, $sp 4

somar_notas:
	addi $sp, $sp -12
	sw $ra, (0)$sp
	sw $a0, (4)$sp
	sw $a1, (8)$sp
	add $v0, $a0, $a1
	jr (0)$sp
	

	
