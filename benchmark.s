.text
_start:
    li a0,0x1000010 # display addr
    li t0,10000 # counter
    li t1,4186047 # white pixel in center

main_loop:
    addi t2,t2,1
    bne t2,t0,main_loop
    sw t1,0(a0)

end: j end
