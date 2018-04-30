.data
.balign 4
	string:	.asciz " %d,"
	f:	.word 0
	s:	.word 1
.text
.global main
.extern printf

main:
push {ip, lr}

ldr r5,=f
ldr r5,[r5]

add r1, r5, #0

ldr r0,=string
bl printf


ldr r4,=s
ldr r4,[r4]

add r1,r4,#0

ldr r0,=string
bl printf

add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf

@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@
@@@@
mov r5,r4
mov r4,r6
add r6,r4,r5
add r1,r6,#0

ldr r0,=string
bl printf
@@@@



pop {ip,pc}
