.text
_start:
    li a0,0x1000000      # address of I/O
    li a1,64             # player x pos
    li a2,64             # player y pos
    li a3,128-1          # map size
    li a4,0x3fc000
    li s0,119            # W key code
    li s1,97             # A key code
    li s2,115            # S key code
    li s3,100            # D key code

main_loop:
    lb t0,8(a0)          # get keyboard
    
    ble a2,x0,A_key
    bne t0,s0,A_key
    addi a2,a2,-1
    j draw

    A_key:
        ble a1,x0,S_key
        bne t0,s1,S_key
        addi a1,a1,-1
        j draw

    S_key:
        bge a2,a3,D_key
        bne t0,s2,D_key
        addi a2,a2,1
        j draw

    D_key:
        bge a1,a3,draw
        bne t0,s3,draw
        addi a1,a1,1

    draw:
        mv t1,a1
        slli t0,a2,7
        add t1,t1,t0
        add t1,t1,a4         # add white color
        sw x0,0x14(a0)         # clear screen
        sw t1,0x10(a0)         # draw player
    j main_loop
