# change the extension for .asm and execute it with MARS 4.5
.data
needle: .asciiz "Guten Tag"
result: .space 18
ascii_vocals: .asciiz "aeiouAEIOU"
string1: .asciiz "Rechnerarchitektur enthaelt: "
string2: .asciiz " Vokale."
string3: .asciiz "\nRechnerarchitektur ohne Vokale ist: "
nline: .asciiz "\n"

.text
main:
	li $t0, 0 # Counter for the number of vowels
	li $t1, 0 # Index of the character of needle currently being viewed
	li $t2, 0 # Index of the currently viewed vocals in ascii_vocals
	li $t3, 0 # Index of the next free space in result

n_loop: 
	lb $t4, needle($t1) # (i) Der aktuelle Buchstabe des Strings needle wird in ein Register geladen
	beqz $t4, end # (iv) Führe einen Sprung durch, sofern alle Buchstaben des Strings needle betrachtet wurden.

vocs:
	# Fuegen Sie hier Ihre Loesung ein
	lb $t5, ascii_vocals($t2)
	beq $t4, $t5, vocal
	beq $t2, 10, save
	addi $t2, $t2, 1
	j vocs

vocal: 
	addi $t0, $t0, 1  #(iii)Erhöhe die Anzahl der gezählten Vokale um eins.
	li $t2, 0
	addi $t1, $t1, 1
	j n_loop

save:
	# Fuegen Sie hier Ihre Loesung ein
	sb $t4, result($t3)
	addi $t3, $t3, 1

reset: 
	add $t1, $t1, 1
	li $t2, 0
	j n_loop

end: 
	li $v0, 4
	la $a0, string1
	syscall

	li $v0, 1
	move $a0, $t0
	syscall #(ii)Die Anzahl der gezählten Vokale wird auf der Konsole ausgegeben

	li $v0, 4
	la $a0, string2
	syscall

	li $v0, 4
	la $a0, string3
	syscall

	li $v0, 4
	la $a0, result
	syscall

	li $v0, 10
	syscall