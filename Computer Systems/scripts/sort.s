.data
.balign 4
	array: .skip 28
	num: .int 0
	format: .asciz "%d"

	arrayPrintFormat: .asciz "%d "
	enterArrayText: .asciz "Please enter Array:\n"
	arrayValue: .asciz "> "

	userInput: .asciz "User Input = "
	resultString: .asciz "Value is %d\n"
	newLine: .asciz "\n"
.text
.global main
.extern printf
.extern scanf

main: push {ip, lr}

bl enterArray

ldr r1, =array
bl sort

bl printArray

b end

enterArray:
push {ip, lr}
push {r9, r10}
ldr r0, =enterArrayText
bl printf
ldr r9, =array
mov r10, #0
loopInput:
cmp r10, #7
beq endInput

ldr r0, =arrayValue
bl printf
ldr r0, =format
add r1, r9, r10, LSL #2
bl scanf

add r10, r10, #1
b loopInput
endInput:
pop {r9, r10}
pop {ip, pc}

printArray:
push {ip, lr}
push {r9, r10}
mov r10, #0
ldr r9, =array
printLoop:
cmp r10, #7
beq endPrintLoop

ldr r0, =arrayPrintFormat
add r1, r9, r10, LSL #2
ldr r1, [r1]
bl printf

add r10, r10, #1
b printLoop

endPrintLoop:
pop {r9, r10}
pop {ip, pc}
//////////////////////////////////

end:
pop {ip, pc}



sort:
push {ip, lr}
push {r10}
mov r10, #0 //r10 is index i

loop:
cmp r10, #7
beq endLoop

bl startTraverse

add r10, r10, #1
b loop

endLoop:
pop {r10}
pop {ip, pc}
/////////////////


startTraverse:
push {ip, lr}
push {r5, r6, r7, r8, r9}
mov r9, #0
// r5 is address of first number, r6 is address of second
// r7 is value of first, r8 is value of second
// r9 is index j
traverse:
add r5, r1, r9, LSL #2

add r9, r9, #1
cmp r9, #7
beq endTraverse

add r6, r1, r9, LSL #2

ldr r7, [r5]
ldr r8, [r6]

cmp r7, r8
blgt swap

b traverse
endTraverse:
pop {r5, r6, r7, r8, r9}
pop {ip, pc}

swap:
push {ip, lr}

str r7, [r6]
str r8, [r5]

pop {ip, pc}
