.data
.balign 4
	array: .skip 160
	num: .int 0
	format: .asciz "%d"
	userInput: .asciz "User Input = "
	resultString: .asciz "Value is %d\n"
	newLine: .asciz "\n"
.text
.global main
.extern printf
.extern scanf

main: push {ip, lr}
ldr r10, =array

bl startLoop1

ldr r0, =userInput
bl printf

ldr r0, =format
ldr r1, =num
bl scanf

ldr r4, =num
ldr r4, [r4]
add r5, r10, r4, LSL #2

ldr r1,[r5]
ldr r0, =format
bl printf
ldr r0, =newLine
bl printf
b end
startLoop1:
push {ip, lr}
mov r4, #0
loop1:cmp r4, #4
beq end // doesn't end program, just pops ip

bl startLoop2

add r4, r4, #1
b loop1
startLoop2:
push {ip, lr}
mov r5, #0
loop2:cmp r5, #10
beq end //doesn't end program, just pops

mov r6, #10
mul r6, r4, r6
add r6, r5, r6
add r7, r10, r6, LSL #2
str r6, [r7]

add r5, r5, #1
b loop2
end:
pop {ip, pc}
