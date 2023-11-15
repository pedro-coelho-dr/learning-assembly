.data
.text
	main:
		li $t1, 0 #soma
		
	loop: 
		
		li $v0,5
		syscall
		move $t0, $v0
		
		add $t1, $t1, $t0
		
		beqz $t0, exit
		j loop
		
	exit:
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 10
		syscall