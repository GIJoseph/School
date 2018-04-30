.data
.balign 4
	array: .skip 40
	index: .int 0
	temp: .int 0
	key: .int 0
	valueInArray: .int 0
	input: .asciz "%d"
	enterArrayString: .asciz "Please enter array: "
	enterKey: .asciz "Please Enter Key: "
	keyAtIndexString: .asciz "The key was found at index: "
	noneString: .asciz "none"
	newLine: .asciz "\n"
.text
.global main
.extern printf
.extern scanf

main: push {ip, lr}
ldr r4, =array
ldr r5, =index
ldr r5, [r5]
bl startLoop	@loops through asking the user for input for the array
bl getKey	@asks user for key

ldr r1, =key
ldr r1, [r1]	@passing value to function by value
mov r2, r4	@Passing array to function by reference

bl startSearch

ldr r2, =valueInArray
str r3, [r2]
ldr r0, =keyAtIndexString
bl printf
ldr r1, =valueInArray
ldr r1, [r1]

bl printResults

b end

inputIntoArray:
push {ip, lr}
push {r10}

	ldr r0, =input
	ldr r1, =temp
	bl scanf
	ldr r1, =temp

	ldr r1, [r1]
	add r10, r4, r5, LSL #2
	str r1, [r10]

pop {r10}
pop {ip, pc}

startLoop:
push {ip, lr}
	ldr r0, =enterArrayString
	bl printf
	loop:
	cmp r5, #10
	beq goBack

	bl inputIntoArray

	add r5, r5, #1

	b loop
	goBack:
pop {ip, pc}

getKey:
push {ip, lr}
	ldr r0, =enterKey
	bl printf

	ldr r0, =input
	ldr r1, =key
	bl scanf

pop {ip, pc}


startSearch:
push {ip, lr}
push {r10}
	mov r5, #0
	mov r3, #255
	search:
	cmp r5, #10
	beq goBackSearch
	add r10, r2, r5, LSL #2
	ldr r10, [r10]

	cmp r10, r1
	moveq r3, r5

	add r5, r5, #1
	b search
	goBackSearch:
pop {r10}
pop {ip, pc}


printResults:
push {ip, lr}

	ldreq r0, =input

	cmp r1, #255
	ldreq r0, =noneString

	bl printf

	ldr r0, =newLine
	bl printf
pop {ip, pc}

end:
pop {ip, pc}
