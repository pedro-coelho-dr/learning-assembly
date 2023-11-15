.data
	msgAlunos: .asciiz "Número de alunos: "
	msgNota1: .asciiz "Nota 1: "
    	msgNota2: .asciiz "Nota 2: "
    	msgFreq: .asciiz "Fequência: "
    	msgAprovado: .asciiz "Aluno aprovado.\n"
    	msgReprovado: .asciiz "Aluno reprovado.\n"
    	
.text
	main:
        	#Numero de alunos
        	li $v0, 4
        	la $a0, msgAlunos
        	syscall

        	li $v0, 5
        	syscall
        	move $t6, $v0 #nr de alunos

        	li $t7, 0 #counter
        	
        loop:
        	bge $t7, $t6, exit

        	addi $t7, $t7, 1
        	#Nota 1
 		li $v0, 4
 		la $a0, msgNota1
 		syscall
 	
 		li $v0, 5
 		syscall
 		move $t1, $v0 #nota1
 	
 		#Nota 2
 		li $v0, 4
 		la $a0, msgNota2
 		syscall
 	
 		li $v0,5
 		syscall
 		move $t2, $v0 #nota2
 	
 		#Frequencia
 		li $v0, 4
 		la $a0, msgFreq
 		syscall
 	
 		li $v0, 5
 		syscall
 		move $t3, $v0 #frequencia
 	
 		#Calcular media
 		add $t4, $t1, $t2
 		li $t5, 2
 		div $t0, $t4, $t5 #media
 	
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
 			j loop
 	
 		reprovado:
 			li $v0, 4
 			la $a0, msgReprovado
 			syscall
 			j loop
        
 	exit:
        li $v0, 10
        syscall