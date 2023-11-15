.data
.text
	main:
		li $t1, 0 #soma
		li $t0, 1 #x
		
	loop: 
		beqz $t0, exit
		li $v0,5
		syscall
		move $t0, $v0
		
		add $t1, $t1, $t0
		j loop
		
	exit:
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall