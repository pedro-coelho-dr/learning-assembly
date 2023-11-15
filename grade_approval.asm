.data
	msgNota1: .asciiz "Nota 1: "
    	msgNota2: .asciiz "Nota 2: "
    	msgFreq: .asciiz "Fequência: "
    	msgAprovado: .asciiz "Aluno aprovado.\n"
    	msgReprovado: .asciiz "Aluno reprovado.\n"
    	
 .text
 	main:
 	#Nota 1
 	li $v0, 4
 	la $a0, msgNota1
 	syscall
 	
 	li $v0, 5
 	syscall
 	move $t1, $v0
 	
 	#Nota 2
 	li $v0, 4
 	la $a0, msgNota2
 	syscall
 	
 	li $v0,5
 	syscall
 	move $t2, $v0
 	
 	#Frequencia
 	li $v0, 4
 	la $a0, msgFreq
 	syscall
 	
 	li $v0, 5
 	syscall
 	move $t3, $v0
 	
 	#Calcular media
 	add $t4, $t1, $t2
 	li $t5, 2
 	div $t0, $t4, $t5
 	
 	#Aprovado ou reprovado
 	bge $t0, 70, frequencia
 	j reprovado
 	
 	frequencia:
 		bge $t3, 75, aprovado
 		j reprovado
 		
 	aprovado:
 		li $v0, 4
 		la $a0, msgAprovado
 		syscall
 		j exit
 	
 	reprovado:
 		li $v0, 4
 		la $a0, msgReprovado
 		syscall
 	
 	exit:
 		li $v0,10
 		syscall
 	