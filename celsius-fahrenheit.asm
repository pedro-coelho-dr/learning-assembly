.data
	entrada: .asciiz "Celsius: "
	saida: .asciiz "Fahrenheit: "
	
.text
	main:
	#printa string
		li $v0, 4
		la $a0, entrada
		syscall
	# le input
		
		li $v0, 5
		syscall
	# pega o input, multiplica por 9, divide 5 e soma 32
		move $t0, $v0
		li $t1, 9
		mul $t0, $t0, $t1
		li $t1, 5
		div $t0, $t0, $t1
		addi $t0, $t0, 32
	
	# printa string	
		li $v0, 4
		la $a0, saida
		syscall
		
	#print output
		li $v0,1
		move $a0, $t0
		syscall
	
	#exit
		li $v0,10
		syscall
		

		
