.data
.balign 4
	fib: .skip 160
	num: .int 0
	format: .asciz "%d"
	newline: .asciz "\n"
	output: .asciz "Which value would you like to print? "
.text
.global main
.extern printf
.extern scanf

main: push {ip, lr}
ldr r4, =fib

mov r10, #2 // counter
mov r5, #0 // first value
mov r6, #1 // second value
str r5, [r4, #0]
str r6, [r4, #4]


loop: cmp r10, #39
beq end

add r7, r5, r6
LSL r8, r10, #2
str r7, [r4, r8]

mov r5, r6
mov r6, r7

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

ldr r0, =newline
bl printf


pop {ip, pc}
