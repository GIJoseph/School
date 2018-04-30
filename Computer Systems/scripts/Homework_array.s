.data
.balign 4
	a: .skip 40
	num: .int 0
	format: .asciz "%d"
	prompt: .asciz "> "
	output: .asciz "Which value would you like to print?"
.text
.global main
.extern printf
.extern scanf

main: push {ip, lr}
mov r10, #0
ldr r4, =a

loop: cmp r10, #10
beq end

ldr r0, =prompt
bl printf

ldr r0, =format
ldr r1, =num
bl scanf
ldr r1, =num
ldr r6, [r1]

add r5, r4, r10, LSL #2
str r6, [r5]

add r10, r10, #1
b loop

end:
ldr r0, =output
bl printf
ldr r0, =format
ldr r1, =num
bl scanf
ldr r1, =num
ldr r1, [r1]
add r5, r4, r1, LSL #2
ldr r1, [r5]
ldr r0, =format

bl printf

pop {ip, pc}
