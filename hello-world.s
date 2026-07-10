.text
_start:
    la t0,TTY_ADDR
    lw a1,0(t0)           # get tty addr to a1
    
    la a0,START_MSG       # store START_MSG address in arg0
    
    call write_msg
    
    li s0,10              # set counter for loop

loop:
    beq s0,x0,end         # if counter == 0, then halt
    la a0,LOOP_MSG        # store LOOP_MSG address in arg0
    call write_msg
    addi s0,s0,-1
    j loop

write_msg:
    lb t0,0(a0)
    beq t0,x0,write_msg_return
    sb t0,0(a1)
    addi a0,a0,1
    j write_msg
    write_msg_return: ret

end:
    j end

.data
START_MSG: .asciz "Hello World from RV32I Custom CPU!\n"
LOOP_MSG:  .asciz "Loop!\n"
TTY_ADDR:  .word 0x1000000
