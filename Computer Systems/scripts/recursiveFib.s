.data
.balign 4
	value: .int 0
	input: .asciz "%d"
	resultString: .asciz "Fib(%d) is: %d\n"
	prompt: .asciz "Please give an integer: "
	newLine: .asciz "\n"
.text
.global main
.extern printf
.extern scanf

main:
push {ip, lr}

ldr r0, =prompt
bl printf
ldr r0, =input
ldr r1, =value
bl scanf

ldr r1, =value
ldr r1, [r1]

bl recursiveFib

ldr r0, =resultString
ldr r1, =value
ldr r1, [r1]
bl printf

b end

recursiveFib:
push {ip, lr}

cmp r1, #2
moveq r2, #1
beq endRecursion

cmp r1, #1
moveq r2, #0
beq endRecursion

push {r4, r5}

push {r1}
sub r1, r1, #1
bl recursiveFib
mov r4, r2

pop {r1}
sub r1, r1, #2
bl recursiveFib
mov r5, r2

add r2, r4, r5

pop {r4, r5}

b endRecursion

endRecursion:
pop {ip, pc}

end:
pop {ip, pc}
