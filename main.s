.text
_start:
    li a0,0x1000000    # address of I/O
    li t0,0            # value for filling display
    li t1,16385        # value for incrementing t0
    la a1,START_MSG    # address of start message
    la a2,END_MSG      # address of end message
    li a3,16384        # value for stoping main loop
    li a4,0x3fffff     # value for filling up 10 bits of register with 0
    
    sw x0,4(a0)        # clear tty
    sw x0,0x14(a0)     # clear display

# write start message to tty
start_msg_loop:
    lb t0,0(a1)
    beq t0,x0,start_main_loop
    sb t0,0(a0)
    addi a1,a1,1
    j start_msg_loop
    
# set t0 to 0, start main loop
start_main_loop:
    mv t0,x0 

# loop for filling display
main_loop:
    beq t0,a3,end_msg_loop
    sw t0,0x10(a0)
    add t0,t0,t1
    and t0,t0,a4
    j main_loop

end_msg_loop:
    lb t0,0(a2)
    beq t0,x0,end
    sb t0,0(a0)
    addi a2,a2,1
    j end_msg_loop

end:
    j end

.data
START_MSG: .asciz "Hi! this is program for testing display!"
END_MSG:   .asciz "\nTesting ended!"
