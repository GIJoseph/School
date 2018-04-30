.data
.balign 4
        string: .asciz " %d! is %d \n"
        f:      .word 0
.text
.global main
.extern printf

main:
push {ip, lr}


mov r7,#1
mov r8,#1

add r1, r7, #0
add r2, r8, #0
ldr r0,=string
bl printf


add r7,r7,#1
mov r9,r8
mulal r8,r9,r7

add r1, r7, #0
add r2, r8, #0
ldr r0,=string
bl printf
@@@@@
@@@@@
add r7,r7,#1
mov r9,r8
mulal r8,r9,r7

add r1, r7, #0
add r2, r8, #0
ldr r0,=string
bl printf
@@@@@
@@@@@
add r7,r7,#1
mov r9,r8
mulal r8,r9,r7

add r1, r7, #0
add r2, r8, #0
ldr r0,=string
bl printf
@@@@@
@@@@@
add r7,r7,#1
mov r9,r8
mulal r8,r9,r7

add r1, r7, #0
add r2, r8, #0
ldr r0,=string
bl printf
@@@@@


pop {ip, lr}
