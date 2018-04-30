.data
.balign 4
	out: .asciz "5! = %d\n"
.text
.global main
.extern printf

fact:
	push {r6, lr}

	cmp r6, #1
	bge else

	mov r6, #1
	pop {r7, lr}
	bx lr

else:
	sub r6, r6, #1
	bl fact

	pop {r7, lr}
	mul r6, r7, r6
	bx lr

main:
	push {ip, lr}
	mov r6, #5
	bl fact

	mov r1, r6
	ldr r0,=out
	bl printf

	pop {ip, pc}
