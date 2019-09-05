
========================================================================

** ELF Header Information

    File Name: Objects\helloworld.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x10040089
    Flags: EF_ARM_HASENTRY (0x05000002)

    ARM ELF revision: 5 (ABI version 2)

    Built with
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 17

    Program header offset: 132720 (0x00020670)
    Section header offset: 132752 (0x00020690)

    Section header string table index: 16

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x10040000
    Physical Addr : 0x10040000
    Size in file  : 5208 bytes (0x1458)
    Size in memory: 15832 bytes (0x3dd8)
    Flags         : PF_X + PF_W + PF_R + PF_ARM_ENTRY (0x80000007)
    Alignment     : 8


========================================================================

** Section #1

    Name        : ISR_VECTOR
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC (0x00000002)
    Addr        : 0x20000000
    File Offset : 52 (0x34)
    Size        : 136 bytes (0x88)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #2

    Name        : ER_FLASH
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_EXECINSTR (0x00000006)
    Addr        : 0x10040088
    File Offset : 188 (0xbc)
    Size        : 4976 bytes (0x1370)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    .ARM.Collect$$$$00000000
    .ARM.Collect$$$$00000001
    __main
    _main_stk
        0x10040088:    f8dfd00c    ....    LDR      sp,__lit__00000000 ; [0x10040098] = 0x20002a68
    .ARM.Collect$$$$00000004
    _main_scatterload
        0x1004008c:    f000f896    ....    BL       __scatterload ; 0x100401bc
    .ARM.Collect$$$$00000008
    .ARM.Collect$$$$0000000A
    .ARM.Collect$$$$0000000B
    __main_after_scatterload
    _main_clock
    _main_cpp_init
    _main_init
        0x10040090:    4800        .H      LDR      r0,[pc,#0] ; [0x10040094] = 0x1004092d
        0x10040092:    4700        .G      BX       r0
    $d
        0x10040094:    1004092d    -...    DCD    268699949
    .ARM.Collect$$$$00002712
    __lit__00000000
    .ARM.Collect$$$$0000000D
    .ARM.Collect$$$$0000000F
    __rt_final_cpp
    __rt_final_exit
        0x10040098:    20002a68    h*.     DCD    536881768
    $t
    .emb_text
    SVC_Handler
        0x1004009c:    4b22        "K      LDR      r3,[pc,#136] ; [0x10040128] = 0x2000008c
        0x1004009e:    6819        .h      LDR      r1,[r3,#0]
        0x100400a0:    6808        .h      LDR      r0,[r1,#0]
        0x100400a2:    e8b00ff0    ....    LDM      r0!,{r4-r11}
        0x100400a6:    f3808809    ....    MSR      PSP,r0
        0x100400aa:    f3bf8f6f    ..o.    ISB      
        0x100400ae:    f04f0000    O...    MOV      r0,#0
        0x100400b2:    f3808811    ....    MSR      BASEPRI,r0
        0x100400b6:    f04e0e0d    N...    ORR      lr,lr,#0xd
        0x100400ba:    4770        pG      BX       lr
    $d
        0x100400bc:    00000000    ....    DCD    0
    $t
    __asm___6_port_c_39a90d8d__prvStartFirstTask
        0x100400c0:    4806        .H      LDR      r0,[pc,#24] ; [0x100400dc] = 0xe000ed08
        0x100400c2:    6800        .h      LDR      r0,[r0,#0]
        0x100400c4:    6800        .h      LDR      r0,[r0,#0]
        0x100400c6:    f3808808    ....    MSR      MSP,r0
        0x100400ca:    b662        b.      CPSIE    i
        0x100400cc:    b661        a.      CPSIE    f
        0x100400ce:    f3bf8f4f    ..O.    DSB      
        0x100400d2:    f3bf8f6f    ..o.    ISB      
        0x100400d6:    df00        ..      SVC      #0x0 ; formerly SWI
        0x100400d8:    bf00        ..      NOP      
        0x100400da:    bf00        ..      NOP      
    $d
        0x100400dc:    e000ed08    ....    DCD    3758157064
    $t
    PendSV_Handler
        0x100400e0:    f3ef8009    ....    MRS      r0,PSP
        0x100400e4:    f3bf8f6f    ..o.    ISB      
        0x100400e8:    4b0f        .K      LDR      r3,[pc,#60] ; [0x10040128] = 0x2000008c
        0x100400ea:    681a        .h      LDR      r2,[r3,#0]
        0x100400ec:    e9200ff0     ...    STMDB    r0!,{r4-r11}
        0x100400f0:    6010        .`      STR      r0,[r2,#0]
        0x100400f2:    b508        ..      PUSH     {r3,lr}
        0x100400f4:    f04f00bf    O...    MOV      r0,#0xbf
        0x100400f8:    f3808811    ....    MSR      BASEPRI,r0
        0x100400fc:    f3bf8f4f    ..O.    DSB      
        0x10040100:    f3bf8f6f    ..o.    ISB      
        0x10040104:    f000ffe4    ....    BL       vTaskSwitchContext ; 0x100410d0
        0x10040108:    f04f0000    O...    MOV      r0,#0
        0x1004010c:    f3808811    ....    MSR      BASEPRI,r0
        0x10040110:    e8bd4008    ...@    POP      {r3,lr}
        0x10040114:    6819        .h      LDR      r1,[r3,#0]
        0x10040116:    6808        .h      LDR      r0,[r1,#0]
        0x10040118:    e8b00ff0    ....    LDM      r0!,{r4-r11}
        0x1004011c:    f3808809    ....    MSR      PSP,r0
        0x10040120:    f3bf8f6f    ..o.    ISB      
        0x10040124:    4770        pG      BX       lr
        0x10040126:    bf00        ..      NOP      
    $d
        0x10040128:    2000008c    ...     DCD    536871052
    $t
    vPortGetIPSR
        0x1004012c:    f3ef8005    ....    MRS      r0,IPSR
        0x10040130:    4770        pG      BX       lr
        0x10040132:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x10040134:    4806        .H      LDR      r0,[pc,#24] ; [0x10040150] = 0x10040501
        0x10040136:    4780        .G      BLX      r0
        0x10040138:    4806        .H      LDR      r0,[pc,#24] ; [0x10040154] = 0x10040089
        0x1004013a:    4700        .G      BX       r0
    NMI_Handler
        0x1004013c:    e7fe        ..      B        NMI_Handler ; 0x1004013c
    HardFault_Handler
        0x1004013e:    e7fe        ..      B        HardFault_Handler ; 0x1004013e
    MemManage_Handler
        0x10040140:    e7fe        ..      B        MemManage_Handler ; 0x10040140
    BusFault_Handler
        0x10040142:    e7fe        ..      B        BusFault_Handler ; 0x10040142
    UsageFault_Handler
        0x10040144:    e7fe        ..      B        UsageFault_Handler ; 0x10040144
        0x10040146:    e7fe        ..      B        0x10040146 ; UsageFault_Handler + 2
    DebugMon_Handler
        0x10040148:    e7fe        ..      B        DebugMon_Handler ; 0x10040148
        0x1004014a:    e7fe        ..      B        0x1004014a ; DebugMon_Handler + 2
        0x1004014c:    e7fe        ..      B        0x1004014c ; DebugMon_Handler + 4
    ADCC0_IRQHandler
    ADCC1_IRQHandler
    ADCC2_IRQHandler
    ADCC3_IRQHandler
    ADCC4_IRQHandler
    ADCC5_IRQHandler
    DMAC_IRQHandler
    EXT_IRQHandler
    GPIO_IRQHandler
    I2C0_IRQHandler
    I2C1_IRQHandler
    I2S_IRQHandler
    QSPI_IRQHandler
    RTC_IRQHandler
    SPIM_IRQHandler
    TIMER_IRQHandler
    UART_IRQHandler
    WDT_IRQHandler
        0x1004014e:    e7fe        ..      B        ADCC0_IRQHandler ; 0x1004014e
    $d
        0x10040150:    10040501    ....    DCD    268698881
        0x10040154:    10040089    ....    DCD    268697737
    $t
    .text
    __aeabi_memcpy
    __aeabi_memcpy4
    __aeabi_memcpy8
        0x10040158:    ea400301    @...    ORR      r3,r0,r1
        0x1004015c:    079b        ..      LSLS     r3,r3,#30
        0x1004015e:    d003        ..      BEQ      0x10040168 ; __aeabi_memcpy + 16
        0x10040160:    e009        ..      B        0x10040176 ; __aeabi_memcpy + 30
        0x10040162:    c908        ..      LDM      r1!,{r3}
        0x10040164:    1f12        ..      SUBS     r2,r2,#4
        0x10040166:    c008        ..      STM      r0!,{r3}
        0x10040168:    2a04        .*      CMP      r2,#4
        0x1004016a:    d2fa        ..      BCS      0x10040162 ; __aeabi_memcpy + 10
        0x1004016c:    e003        ..      B        0x10040176 ; __aeabi_memcpy + 30
        0x1004016e:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x10040172:    f8003b01    ...;    STRB     r3,[r0],#1
        0x10040176:    1e52        R.      SUBS     r2,r2,#1
        0x10040178:    d2f9        ..      BCS      0x1004016e ; __aeabi_memcpy + 22
        0x1004017a:    4770        pG      BX       lr
    .text
    strcpy
        0x1004017c:    4603        .F      MOV      r3,r0
        0x1004017e:    f8112b01    ...+    LDRB     r2,[r1],#1
        0x10040182:    f8002b01    ...+    STRB     r2,[r0],#1
        0x10040186:    2a00        .*      CMP      r2,#0
        0x10040188:    d1f9        ..      BNE      0x1004017e ; strcpy + 2
        0x1004018a:    4618        .F      MOV      r0,r3
        0x1004018c:    4770        pG      BX       lr
    .text
    __aeabi_uidiv
    __aeabi_uidivmod
        0x1004018e:    b530        0.      PUSH     {r4,r5,lr}
        0x10040190:    460b        .F      MOV      r3,r1
        0x10040192:    4601        .F      MOV      r1,r0
        0x10040194:    2000        .       MOVS     r0,#0
        0x10040196:    2220         "      MOVS     r2,#0x20
        0x10040198:    2401        .$      MOVS     r4,#1
        0x1004019a:    e009        ..      B        0x100401b0 ; __aeabi_uidiv + 34
        0x1004019c:    fa21f502    !...    LSR      r5,r1,r2
        0x100401a0:    429d        .B      CMP      r5,r3
        0x100401a2:    d305        ..      BCC      0x100401b0 ; __aeabi_uidiv + 34
        0x100401a4:    fa03f502    ....    LSL      r5,r3,r2
        0x100401a8:    1b49        I.      SUBS     r1,r1,r5
        0x100401aa:    fa04f502    ....    LSL      r5,r4,r2
        0x100401ae:    4428        (D      ADD      r0,r0,r5
        0x100401b0:    1e15        ..      SUBS     r5,r2,#0
        0x100401b2:    f1a20201    ....    SUB      r2,r2,#1
        0x100401b6:    dcf1        ..      BGT      0x1004019c ; __aeabi_uidiv + 14
        0x100401b8:    bd30        0.      POP      {r4,r5,pc}
        0x100401ba:    0000        ..      MOVS     r0,r0
    .text
    __scatterload
    __scatterload_rt2
        0x100401bc:    4c06        .L      LDR      r4,[pc,#24] ; [0x100401d8] = 0x100413c8
        0x100401be:    4d07        .M      LDR      r5,[pc,#28] ; [0x100401dc] = 0x100413f8
        0x100401c0:    e006        ..      B        0x100401d0 ; __scatterload + 20
        0x100401c2:    68e0        .h      LDR      r0,[r4,#0xc]
        0x100401c4:    f0400301    @...    ORR      r3,r0,#1
        0x100401c8:    e8940007    ....    LDM      r4,{r0-r2}
        0x100401cc:    4798        .G      BLX      r3
        0x100401ce:    3410        .4      ADDS     r4,r4,#0x10
        0x100401d0:    42ac        .B      CMP      r4,r5
        0x100401d2:    d3f6        ..      BCC      0x100401c2 ; __scatterload + 6
        0x100401d4:    f7ffff5c    ..\.    BL       __main_after_scatterload ; 0x10040090
    $d
        0x100401d8:    100413c8    ....    DCD    268702664
        0x100401dc:    100413f8    ....    DCD    268702712
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x100401e0:    bf00        ..      NOP      
        0x100401e2:    4904        .I      LDR      r1,[pc,#16] ; [0x100401f4] = 0x40020000
        0x100401e4:    6909        .i      LDR      r1,[r1,#0x10]
        0x100401e6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x100401ea:    4a02        .J      LDR      r2,[pc,#8] ; [0x100401f4] = 0x40020000
        0x100401ec:    6111        .a      STR      r1,[r2,#0x10]
        0x100401ee:    bf00        ..      NOP      
        0x100401f0:    4770        pG      BX       lr
    $d
        0x100401f2:    0000        ..      DCW    0
        0x100401f4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x100401f8:    b510        ..      PUSH     {r4,lr}
        0x100401fa:    4604        .F      MOV      r4,r0
        0x100401fc:    1e60        `.      SUBS     r0,r4,#1
        0x100401fe:    280f        .(      CMP      r0,#0xf
        0x10040200:    dc00        ..      BGT      0x10040204 ; HAL_SYSCON_Set_HClk_Div + 12
        0x10040202:    e004        ..      B        0x1004020e ; HAL_SYSCON_Set_HClk_Div + 22
        0x10040204:    2225        %"      MOVS     r2,#0x25
        0x10040206:    a108        ..      ADR      r1,{pc}+0x22 ; 0x10040228
        0x10040208:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x10040248
        0x1004020a:    f000fa6d    ..m.    BL       __aeabi_assert ; 0x100406e8
        0x1004020e:    1e61        a.      SUBS     r1,r4,#1
        0x10040210:    b2c8        ..      UXTB     r0,r1
        0x10040212:    4913        .I      LDR      r1,[pc,#76] ; [0x10040260] = 0x40020000
        0x10040214:    6849        Ih      LDR      r1,[r1,#4]
        0x10040216:    f3600103    `...    BFI      r1,r0,#0,#4
        0x1004021a:    4a11        .J      LDR      r2,[pc,#68] ; [0x10040260] = 0x40020000
        0x1004021c:    6051        Q`      STR      r1,[r2,#4]
        0x1004021e:    bf00        ..      NOP      
        0x10040220:    2001        .       MOVS     r0,#1
        0x10040222:    f000fe2f    ../.    BL       sysc_awo_div_update_set ; 0x10040e84
        0x10040226:    bd10        ..      POP      {r4,pc}
    $d
        0x10040228:    735c2e2e    ..\s    DCD    1935420974
        0x1004022c:    735c6b64    dk\s    DCD    1935436644
        0x10040230:    735c6372    rc\s    DCD    1935434610
        0x10040234:    645c636f    oc\d    DCD    1683776367
        0x10040238:    65766972    rive    DCD    1702259058
        0x1004023c:    79735c72    r\sy    DCD    2037603442
        0x10040240:    6e6f6373    scon    DCD    1852793715
        0x10040244:    0000632e    .c..    DCD    25390
        0x10040248:    62686128    (ahb    DCD    1651007784
        0x1004024c:    7669645f    _div    DCD    1986618463
        0x10040250:    72656469    ider    DCD    1919247465
        0x10040254:    3c29312d    -1)<    DCD    1009332525
        0x10040258:    6678303d    =0xf    DCD    1719152701
        0x1004025c:    00000000    ....    DCD    0
        0x10040260:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x10040264:    b510        ..      PUSH     {r4,lr}
        0x10040266:    4604        .F      MOV      r4,r0
        0x10040268:    1e60        `.      SUBS     r0,r4,#1
        0x1004026a:    280f        .(      CMP      r0,#0xf
        0x1004026c:    dc00        ..      BGT      0x10040270 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x1004026e:    e004        ..      B        0x1004027a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x10040270:    222c        ,"      MOVS     r2,#0x2c
        0x10040272:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x1004029c
        0x10040274:    a011        ..      ADR      r0,{pc}+0x48 ; 0x100402bc
        0x10040276:    f000fa37    ..7.    BL       __aeabi_assert ; 0x100406e8
        0x1004027a:    1e61        a.      SUBS     r1,r4,#1
        0x1004027c:    b2c8        ..      UXTB     r0,r1
        0x1004027e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x10040282:    6849        Ih      LDR      r1,[r1,#4]
        0x10040284:    f3600103    `...    BFI      r1,r0,#0,#4
        0x10040288:    f04f4280    O..B    MOV      r2,#0x40000000
        0x1004028c:    6051        Q`      STR      r1,[r2,#4]
        0x1004028e:    bf00        ..      NOP      
        0x10040290:    2001        .       MOVS     r0,#1
        0x10040292:    0781        ..      LSLS     r1,r0,#30
        0x10040294:    6008        .`      STR      r0,[r1,#0]
        0x10040296:    bf00        ..      NOP      
        0x10040298:    bd10        ..      POP      {r4,pc}
    $d
        0x1004029a:    0000        ..      DCW    0
        0x1004029c:    735c2e2e    ..\s    DCD    1935420974
        0x100402a0:    735c6b64    dk\s    DCD    1935436644
        0x100402a4:    735c6372    rc\s    DCD    1935434610
        0x100402a8:    645c636f    oc\d    DCD    1683776367
        0x100402ac:    65766972    rive    DCD    1702259058
        0x100402b0:    79735c72    r\sy    DCD    2037603442
        0x100402b4:    6e6f6373    scon    DCD    1852793715
        0x100402b8:    0000632e    .c..    DCD    25390
        0x100402bc:    62706128    (apb    DCD    1651532072
        0x100402c0:    69645f30    0_di    DCD    1768185648
        0x100402c4:    65646976    vide    DCD    1701079414
        0x100402c8:    29312d72    r-1)    DCD    691088754
        0x100402cc:    78303d3c    <=0x    DCD    2016427324
        0x100402d0:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x100402d4:    b510        ..      PUSH     {r4,lr}
        0x100402d6:    4604        .F      MOV      r4,r0
        0x100402d8:    1e60        `.      SUBS     r0,r4,#1
        0x100402da:    280f        .(      CMP      r0,#0xf
        0x100402dc:    dc00        ..      BGT      0x100402e0 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x100402de:    e004        ..      B        0x100402ea ; HAL_SYSCON_Set_PClk1_Div + 22
        0x100402e0:    2234        4"      MOVS     r2,#0x34
        0x100402e2:    a108        ..      ADR      r1,{pc}+0x22 ; 0x10040304
        0x100402e4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x10040324
        0x100402e6:    f000f9ff    ....    BL       __aeabi_assert ; 0x100406e8
        0x100402ea:    1e61        a.      SUBS     r1,r4,#1
        0x100402ec:    b2c8        ..      UXTB     r0,r1
        0x100402ee:    4913        .I      LDR      r1,[pc,#76] ; [0x1004033c] = 0x40020000
        0x100402f0:    6849        Ih      LDR      r1,[r1,#4]
        0x100402f2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x100402f6:    4a11        .J      LDR      r2,[pc,#68] ; [0x1004033c] = 0x40020000
        0x100402f8:    6051        Q`      STR      r1,[r2,#4]
        0x100402fa:    bf00        ..      NOP      
        0x100402fc:    2002        .       MOVS     r0,#2
        0x100402fe:    f000fdc1    ....    BL       sysc_awo_div_update_set ; 0x10040e84
        0x10040302:    bd10        ..      POP      {r4,pc}
    $d
        0x10040304:    735c2e2e    ..\s    DCD    1935420974
        0x10040308:    735c6b64    dk\s    DCD    1935436644
        0x1004030c:    735c6372    rc\s    DCD    1935434610
        0x10040310:    645c636f    oc\d    DCD    1683776367
        0x10040314:    65766972    rive    DCD    1702259058
        0x10040318:    79735c72    r\sy    DCD    2037603442
        0x1004031c:    6e6f6373    scon    DCD    1852793715
        0x10040320:    0000632e    .c..    DCD    25390
        0x10040324:    62706128    (apb    DCD    1651532072
        0x10040328:    69645f31    1_di    DCD    1768185649
        0x1004032c:    65646976    vide    DCD    1701079414
        0x10040330:    29312d72    r-1)    DCD    691088754
        0x10040334:    78303d3c    <=0x    DCD    2016427324
        0x10040338:    00000066    f...    DCD    102
        0x1004033c:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x10040340:    b570        p.      PUSH     {r4-r6,lr}
        0x10040342:    4605        .F      MOV      r5,r0
        0x10040344:    460c        .F      MOV      r4,r1
        0x10040346:    1e60        `.      SUBS     r0,r4,#1
        0x10040348:    f5b05f00    ..._    CMP      r0,#0x2000
        0x1004034c:    da00        ..      BGE      0x10040350 ; HAL_SYSCON_Set_RTC_Div + 16
        0x1004034e:    e004        ..      B        0x1004035a ; HAL_SYSCON_Set_RTC_Div + 26
        0x10040350:    223c        <"      MOVS     r2,#0x3c
        0x10040352:    a112        ..      ADR      r1,{pc}+0x4a ; 0x1004039c
        0x10040354:    a019        ..      ADR      r0,{pc}+0x68 ; 0x100403bc
        0x10040356:    f000f9c7    ....    BL       __aeabi_assert ; 0x100406e8
        0x1004035a:    2d01        .-      CMP      r5,#1
        0x1004035c:    dc00        ..      BGT      0x10040360 ; HAL_SYSCON_Set_RTC_Div + 32
        0x1004035e:    e004        ..      B        0x1004036a ; HAL_SYSCON_Set_RTC_Div + 42
        0x10040360:    223d        ="      MOVS     r2,#0x3d
        0x10040362:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x1004039c
        0x10040364:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x100403d4
        0x10040366:    f000f9bf    ....    BL       __aeabi_assert ; 0x100406e8
        0x1004036a:    b935        5.      CBNZ     r5,0x1004037a ; HAL_SYSCON_Set_RTC_Div + 58
        0x1004036c:    2000        .       MOVS     r0,#0
        0x1004036e:    f000fd8f    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x10040e90
        0x10040372:    2004        .       MOVS     r0,#4
        0x10040374:    f000fd86    ....    BL       sysc_awo_div_update_set ; 0x10040e84
        0x10040378:    e00e        ..      B        0x10040398 ; HAL_SYSCON_Set_RTC_Div + 88
        0x1004037a:    2c02        .,      CMP      r4,#2
        0x1004037c:    db00        ..      BLT      0x10040380 ; HAL_SYSCON_Set_RTC_Div + 64
        0x1004037e:    e004        ..      B        0x1004038a ; HAL_SYSCON_Set_RTC_Div + 74
        0x10040380:    2247        G"      MOVS     r2,#0x47
        0x10040382:    a106        ..      ADR      r1,{pc}+0x1a ; 0x1004039c
        0x10040384:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x100403f0
        0x10040386:    f000f9af    ....    BL       __aeabi_assert ; 0x100406e8
        0x1004038a:    1e61        a.      SUBS     r1,r4,#1
        0x1004038c:    b288        ..      UXTH     r0,r1
        0x1004038e:    f000fd7f    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x10040e90
        0x10040392:    2004        .       MOVS     r0,#4
        0x10040394:    f000fd76    ..v.    BL       sysc_awo_div_update_set ; 0x10040e84
        0x10040398:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x1004039a:    0000        ..      DCW    0
        0x1004039c:    735c2e2e    ..\s    DCD    1935420974
        0x100403a0:    735c6b64    dk\s    DCD    1935436644
        0x100403a4:    735c6372    rc\s    DCD    1935434610
        0x100403a8:    645c636f    oc\d    DCD    1683776367
        0x100403ac:    65766972    rive    DCD    1702259058
        0x100403b0:    79735c72    r\sy    DCD    2037603442
        0x100403b4:    6e6f6373    scon    DCD    1852793715
        0x100403b8:    0000632e    .c..    DCD    25390
        0x100403bc:    63747228    (rtc    DCD    1668575784
        0x100403c0:    7669645f    _div    DCD    1986618463
        0x100403c4:    72656469    ider    DCD    1919247465
        0x100403c8:    3c29312d    -1)<    DCD    1009332525
        0x100403cc:    3178303d    =0x1    DCD    829960253
        0x100403d0:    00666666    fff.    DCD    6710886
        0x100403d4:    5f637472    rtc_    DCD    1600353394
        0x100403d8:    3c637273    src<    DCD    1013150323
        0x100403dc:    6374723d    =rtc    DCD    1668575805
        0x100403e0:    5f6b6c63    clk_    DCD    1600875619
        0x100403e4:    6d6f7266    from    DCD    1836020326
        0x100403e8:    6268615f    _ahb    DCD    1651007839
        0x100403ec:    00000000    ....    DCD    0
        0x100403f0:    5f637472    rtc_    DCD    1600353394
        0x100403f4:    69766964    divi    DCD    1769367908
        0x100403f8:    3e726564    der>    DCD    1047684452
        0x100403fc:    0000323d    =2..    DCD    12861
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x10040400:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x10040404:    4604        .F      MOV      r4,r0
        0x10040406:    460d        .F      MOV      r5,r1
        0x10040408:    4616        .F      MOV      r6,r2
        0x1004040a:    bf00        ..      NOP      
        0x1004040c:    480d        .H      LDR      r0,[pc,#52] ; [0x10040444] = 0x200021b0
        0x1004040e:    7800        .x      LDRB     r0,[r0,#0]
        0x10040410:    b908        ..      CBNZ     r0,0x10040416 ; SEGGER_RTT_Write + 22
        0x10040412:    f000f8b3    ....    BL       _DoInit ; 0x1004057c
        0x10040416:    bf00        ..      NOP      
        0x10040418:    f3ef8011    ....    MRS      r0,BASEPRI
        0x1004041c:    4607        .F      MOV      r7,r0
        0x1004041e:    2020                MOVS     r0,#0x20
        0x10040420:    f3808811    ....    MSR      BASEPRI,r0
        0x10040424:    bf00        ..      NOP      
        0x10040426:    bf00        ..      NOP      
        0x10040428:    4632        2F      MOV      r2,r6
        0x1004042a:    4629        )F      MOV      r1,r5
        0x1004042c:    4620         F      MOV      r0,r4
        0x1004042e:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0x10040448
        0x10040432:    4680        .F      MOV      r8,r0
        0x10040434:    b2f8        ..      UXTB     r0,r7
        0x10040436:    f3808811    ....    MSR      BASEPRI,r0
        0x1004043a:    bf00        ..      NOP      
        0x1004043c:    bf00        ..      NOP      
        0x1004043e:    4640        @F      MOV      r0,r8
        0x10040440:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x10040444:    200021b0    .!.     DCD    536879536
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x10040448:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x1004044c:    4607        .F      MOV      r7,r0
        0x1004044e:    4688        .F      MOV      r8,r1
        0x10040450:    4616        .F      MOV      r6,r2
        0x10040452:    46c2        .F      MOV      r10,r8
        0x10040454:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x10040458:    481b        .H      LDR      r0,[pc,#108] ; [0x100404c8] = 0x200021c8
        0x1004045a:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x1004045e:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x10040462:    b120         .      CBZ      r0,0x1004046e ; SEGGER_RTT_WriteNoLock + 38
        0x10040464:    2801        .(      CMP      r0,#1
        0x10040466:    d011        ..      BEQ      0x1004048c ; SEGGER_RTT_WriteNoLock + 68
        0x10040468:    2802        .(      CMP      r0,#2
        0x1004046a:    d126        &.      BNE      0x100404ba ; SEGGER_RTT_WriteNoLock + 114
        0x1004046c:    e01e        ..      B        0x100404ac ; SEGGER_RTT_WriteNoLock + 100
        0x1004046e:    4648        HF      MOV      r0,r9
        0x10040470:    f000f8bc    ....    BL       _GetAvailWriteSpace ; 0x100405ec
        0x10040474:    4605        .F      MOV      r5,r0
        0x10040476:    42b5        .B      CMP      r5,r6
        0x10040478:    d201        ..      BCS      0x1004047e ; SEGGER_RTT_WriteNoLock + 54
        0x1004047a:    2400        .$      MOVS     r4,#0
        0x1004047c:    e005        ..      B        0x1004048a ; SEGGER_RTT_WriteNoLock + 66
        0x1004047e:    4634        4F      MOV      r4,r6
        0x10040480:    4632        2F      MOV      r2,r6
        0x10040482:    4651        QF      MOV      r1,r10
        0x10040484:    4648        HF      MOV      r0,r9
        0x10040486:    f000f8f8    ....    BL       _WriteNoCheck ; 0x1004067a
        0x1004048a:    e018        ..      B        0x100404be ; SEGGER_RTT_WriteNoLock + 118
        0x1004048c:    4648        HF      MOV      r0,r9
        0x1004048e:    f000f8ad    ....    BL       _GetAvailWriteSpace ; 0x100405ec
        0x10040492:    4605        .F      MOV      r5,r0
        0x10040494:    42b5        .B      CMP      r5,r6
        0x10040496:    d201        ..      BCS      0x1004049c ; SEGGER_RTT_WriteNoLock + 84
        0x10040498:    4628        (F      MOV      r0,r5
        0x1004049a:    e000        ..      B        0x1004049e ; SEGGER_RTT_WriteNoLock + 86
        0x1004049c:    4630        0F      MOV      r0,r6
        0x1004049e:    4604        .F      MOV      r4,r0
        0x100404a0:    4622        "F      MOV      r2,r4
        0x100404a2:    4651        QF      MOV      r1,r10
        0x100404a4:    4648        HF      MOV      r0,r9
        0x100404a6:    f000f8e8    ....    BL       _WriteNoCheck ; 0x1004067a
        0x100404aa:    e008        ..      B        0x100404be ; SEGGER_RTT_WriteNoLock + 118
        0x100404ac:    4632        2F      MOV      r2,r6
        0x100404ae:    4651        QF      MOV      r1,r10
        0x100404b0:    4648        HF      MOV      r0,r9
        0x100404b2:    f000f8a9    ....    BL       _WriteBlocking ; 0x10040608
        0x100404b6:    4604        .F      MOV      r4,r0
        0x100404b8:    e001        ..      B        0x100404be ; SEGGER_RTT_WriteNoLock + 118
        0x100404ba:    2400        .$      MOVS     r4,#0
        0x100404bc:    bf00        ..      NOP      
        0x100404be:    bf00        ..      NOP      
        0x100404c0:    4620         F      MOV      r0,r4
        0x100404c2:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x100404c6:    0000        ..      DCW    0
        0x100404c8:    200021c8    .!.     DCD    536879560
    $t
    i.SysTick_Handler
    SysTick_Handler
        0x100404cc:    b510        ..      PUSH     {r4,lr}
        0x100404ce:    bf00        ..      NOP      
        0x100404d0:    20bf        .       MOVS     r0,#0xbf
        0x100404d2:    f3808811    ....    MSR      BASEPRI,r0
        0x100404d6:    f3bf8f4f    ..O.    DSB      
        0x100404da:    f3bf8f6f    ..o.    ISB      
        0x100404de:    bf00        ..      NOP      
        0x100404e0:    f000fe70    ..p.    BL       xTaskIncrementTick ; 0x100411c4
        0x100404e4:    b118        ..      CBZ      r0,0x100404ee ; SysTick_Handler + 34
        0x100404e6:    f04f5080    O..P    MOV      r0,#0x10000000
        0x100404ea:    4904        .I      LDR      r1,[pc,#16] ; [0x100404fc] = 0xe000ed04
        0x100404ec:    6008        .`      STR      r0,[r1,#0]
        0x100404ee:    bf00        ..      NOP      
        0x100404f0:    2000        .       MOVS     r0,#0
        0x100404f2:    f3808811    ....    MSR      BASEPRI,r0
        0x100404f6:    bf00        ..      NOP      
        0x100404f8:    bd10        ..      POP      {r4,pc}
    $d
        0x100404fa:    0000        ..      DCW    0
        0x100404fc:    e000ed04    ....    DCD    3758157060
    $t
    i.SystemInit
    SystemInit
        0x10040500:    b510        ..      PUSH     {r4,lr}
        0x10040502:    bf00        ..      NOP      
        0x10040504:    4819        .H      LDR      r0,[pc,#100] ; [0x1004056c] = 0x4000b000
        0x10040506:    6800        .h      LDR      r0,[r0,#0]
        0x10040508:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x1004050c:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x10040510:    d1f8        ..      BNE      0x10040504 ; SystemInit + 4
        0x10040512:    f64e2060    N.`     MOV      r0,#0xea60
        0x10040516:    f000f9f3    ....    BL       delay ; 0x10040900
        0x1004051a:    4815        .H      LDR      r0,[pc,#84] ; [0x10040570] = 0x5f5e100
        0x1004051c:    4915        .I      LDR      r1,[pc,#84] ; [0x10040574] = 0x20000088
        0x1004051e:    6008        .`      STR      r0,[r1,#0]
        0x10040520:    2008        .       MOVS     r0,#8
        0x10040522:    f7fffe5d    ..].    BL       HAL_SYSCON_HCLK_Src_Sel ; 0x100401e0
        0x10040526:    2002        .       MOVS     r0,#2
        0x10040528:    f7fffe66    ..f.    BL       HAL_SYSCON_Set_HClk_Div ; 0x100401f8
        0x1004052c:    2004        .       MOVS     r0,#4
        0x1004052e:    f7fffe99    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0x10040264
        0x10040532:    2002        .       MOVS     r0,#2
        0x10040534:    f7fffece    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0x100402d4
        0x10040538:    2164        d!      MOVS     r1,#0x64
        0x1004053a:    2001        .       MOVS     r0,#1
        0x1004053c:    f7ffff00    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0x10040340
        0x10040540:    bf00        ..      NOP      
        0x10040542:    bf00        ..      NOP      
        0x10040544:    bf00        ..      NOP      
        0x10040546:    f3bf8f5f    .._.    DMB      
        0x1004054a:    bf00        ..      NOP      
        0x1004054c:    bf00        ..      NOP      
        0x1004054e:    bf00        ..      NOP      
        0x10040550:    f04f5080    O..P    MOV      r0,#0x10000000
        0x10040554:    4908        .I      LDR      r1,[pc,#32] ; [0x10040578] = 0xe000ed08
        0x10040556:    6008        .`      STR      r0,[r1,#0]
        0x10040558:    bf00        ..      NOP      
        0x1004055a:    bf00        ..      NOP      
        0x1004055c:    bf00        ..      NOP      
        0x1004055e:    f3bf8f4f    ..O.    DSB      
        0x10040562:    bf00        ..      NOP      
        0x10040564:    bf00        ..      NOP      
        0x10040566:    bf00        ..      NOP      
        0x10040568:    bd10        ..      POP      {r4,pc}
    $d
        0x1004056a:    0000        ..      DCW    0
        0x1004056c:    4000b000    ...@    DCD    1073786880
        0x10040570:    05f5e100    ....    DCD    100000000
        0x10040574:    20000088    ...     DCD    536871048
        0x10040578:    e000ed08    ....    DCD    3758157064
    $t
    i._DoInit
    _DoInit
        0x1004057c:    b510        ..      PUSH     {r4,lr}
        0x1004057e:    4c12        .L      LDR      r4,[pc,#72] ; [0x100405c8] = 0x200021b0
        0x10040580:    2003        .       MOVS     r0,#3
        0x10040582:    6120         a      STR      r0,[r4,#0x10]
        0x10040584:    6160        `a      STR      r0,[r4,#0x14]
        0x10040586:    a011        ..      ADR      r0,{pc}+0x46 ; 0x100405cc
        0x10040588:    61a0        .a      STR      r0,[r4,#0x18]
        0x1004058a:    4913        .I      LDR      r1,[pc,#76] ; [0x100405d8] = 0x20002258
        0x1004058c:    61e1        .a      STR      r1,[r4,#0x1c]
        0x1004058e:    f44f6180    O..a    MOV      r1,#0x400
        0x10040592:    6221        !b      STR      r1,[r4,#0x20]
        0x10040594:    2100        .!      MOVS     r1,#0
        0x10040596:    62a1        .b      STR      r1,[r4,#0x28]
        0x10040598:    6261        ab      STR      r1,[r4,#0x24]
        0x1004059a:    62e1        .b      STR      r1,[r4,#0x2c]
        0x1004059c:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x100405cc
        0x1004059e:    6620         f      STR      r0,[r4,#0x60]
        0x100405a0:    490e        .I      LDR      r1,[pc,#56] ; [0x100405dc] = 0x20002658
        0x100405a2:    6661        af      STR      r1,[r4,#0x64]
        0x100405a4:    2110        .!      MOVS     r1,#0x10
        0x100405a6:    66a1        .f      STR      r1,[r4,#0x68]
        0x100405a8:    2100        .!      MOVS     r1,#0
        0x100405aa:    6721        !g      STR      r1,[r4,#0x70]
        0x100405ac:    66e1        .f      STR      r1,[r4,#0x6c]
        0x100405ae:    6761        ag      STR      r1,[r4,#0x74]
        0x100405b0:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x100405e0
        0x100405b2:    1de0        ..      ADDS     r0,r4,#7
        0x100405b4:    f7fffde2    ....    BL       strcpy ; 0x1004017c
        0x100405b8:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x100405e4
        0x100405ba:    4620         F      MOV      r0,r4
        0x100405bc:    f7fffdde    ....    BL       strcpy ; 0x1004017c
        0x100405c0:    2020                MOVS     r0,#0x20
        0x100405c2:    71a0        .q      STRB     r0,[r4,#6]
        0x100405c4:    bd10        ..      POP      {r4,pc}
    $d
        0x100405c6:    0000        ..      DCW    0
        0x100405c8:    200021b0    .!.     DCD    536879536
        0x100405cc:    6d726554    Term    DCD    1836213588
        0x100405d0:    6c616e69    inal    DCD    1818324585
        0x100405d4:    00000000    ....    DCD    0
        0x100405d8:    20002258    X".     DCD    536879704
        0x100405dc:    20002658    X&.     DCD    536880728
        0x100405e0:    00545452    RTT.    DCD    5526610
        0x100405e4:    47474553    SEGG    DCD    1195853139
        0x100405e8:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x100405ec:    b510        ..      PUSH     {r4,lr}
        0x100405ee:    4601        .F      MOV      r1,r0
        0x100405f0:    690a        .i      LDR      r2,[r1,#0x10]
        0x100405f2:    68cb        .h      LDR      r3,[r1,#0xc]
        0x100405f4:    429a        .B      CMP      r2,r3
        0x100405f6:    d804        ..      BHI      0x10040602 ; _GetAvailWriteSpace + 22
        0x100405f8:    688c        .h      LDR      r4,[r1,#8]
        0x100405fa:    1e64        d.      SUBS     r4,r4,#1
        0x100405fc:    1ae4        ..      SUBS     r4,r4,r3
        0x100405fe:    18a0        ..      ADDS     r0,r4,r2
        0x10040600:    e001        ..      B        0x10040606 ; _GetAvailWriteSpace + 26
        0x10040602:    1ad4        ..      SUBS     r4,r2,r3
        0x10040604:    1e60        `.      SUBS     r0,r4,#1
        0x10040606:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x10040608:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x1004060c:    4604        .F      MOV      r4,r0
        0x1004060e:    4689        .F      MOV      r9,r1
        0x10040610:    4617        .F      MOV      r7,r2
        0x10040612:    f04f0a00    O...    MOV      r10,#0
        0x10040616:    68e5        .h      LDR      r5,[r4,#0xc]
        0x10040618:    bf00        ..      NOP      
        0x1004061a:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x1004061e:    45a8        .E      CMP      r8,r5
        0x10040620:    d903        ..      BLS      0x1004062a ; _WriteBlocking + 34
        0x10040622:    eba80005    ....    SUB      r0,r8,r5
        0x10040626:    1e46        F.      SUBS     r6,r0,#1
        0x10040628:    e004        ..      B        0x10040634 ; _WriteBlocking + 44
        0x1004062a:    eba50008    ....    SUB      r0,r5,r8
        0x1004062e:    1c40        @.      ADDS     r0,r0,#1
        0x10040630:    68a1        .h      LDR      r1,[r4,#8]
        0x10040632:    1a0e        ..      SUBS     r6,r1,r0
        0x10040634:    68a0        .h      LDR      r0,[r4,#8]
        0x10040636:    1b40        @.      SUBS     r0,r0,r5
        0x10040638:    42b0        .B      CMP      r0,r6
        0x1004063a:    d901        ..      BLS      0x10040640 ; _WriteBlocking + 56
        0x1004063c:    4630        0F      MOV      r0,r6
        0x1004063e:    e001        ..      B        0x10040644 ; _WriteBlocking + 60
        0x10040640:    68a0        .h      LDR      r0,[r4,#8]
        0x10040642:    1b40        @.      SUBS     r0,r0,r5
        0x10040644:    4606        .F      MOV      r6,r0
        0x10040646:    42be        .B      CMP      r6,r7
        0x10040648:    d201        ..      BCS      0x1004064e ; _WriteBlocking + 70
        0x1004064a:    4630        0F      MOV      r0,r6
        0x1004064c:    e000        ..      B        0x10040650 ; _WriteBlocking + 72
        0x1004064e:    4638        8F      MOV      r0,r7
        0x10040650:    4606        .F      MOV      r6,r0
        0x10040652:    6861        ah      LDR      r1,[r4,#4]
        0x10040654:    1948        H.      ADDS     r0,r1,r5
        0x10040656:    4632        2F      MOV      r2,r6
        0x10040658:    4649        IF      MOV      r1,r9
        0x1004065a:    f7fffd7d    ..}.    BL       __aeabi_memcpy ; 0x10040158
        0x1004065e:    44b2        .D      ADD      r10,r10,r6
        0x10040660:    44b1        .D      ADD      r9,r9,r6
        0x10040662:    1bbf        ..      SUBS     r7,r7,r6
        0x10040664:    4435        5D      ADD      r5,r5,r6
        0x10040666:    68a0        .h      LDR      r0,[r4,#8]
        0x10040668:    42a8        .B      CMP      r0,r5
        0x1004066a:    d100        ..      BNE      0x1004066e ; _WriteBlocking + 102
        0x1004066c:    2500        .%      MOVS     r5,#0
        0x1004066e:    60e5        .`      STR      r5,[r4,#0xc]
        0x10040670:    2f00        ./      CMP      r7,#0
        0x10040672:    d1d2        ..      BNE      0x1004061a ; _WriteBlocking + 18
        0x10040674:    4650        PF      MOV      r0,r10
        0x10040676:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x1004067a:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x1004067e:    4604        .F      MOV      r4,r0
        0x10040680:    4689        .F      MOV      r9,r1
        0x10040682:    4615        .F      MOV      r5,r2
        0x10040684:    68e6        .h      LDR      r6,[r4,#0xc]
        0x10040686:    68a0        .h      LDR      r0,[r4,#8]
        0x10040688:    1b87        ..      SUBS     r7,r0,r6
        0x1004068a:    42af        .B      CMP      r7,r5
        0x1004068c:    d908        ..      BLS      0x100406a0 ; _WriteNoCheck + 38
        0x1004068e:    6861        ah      LDR      r1,[r4,#4]
        0x10040690:    1988        ..      ADDS     r0,r1,r6
        0x10040692:    462a        *F      MOV      r2,r5
        0x10040694:    4649        IF      MOV      r1,r9
        0x10040696:    f7fffd5f    .._.    BL       __aeabi_memcpy ; 0x10040158
        0x1004069a:    1970        p.      ADDS     r0,r6,r5
        0x1004069c:    60e0        .`      STR      r0,[r4,#0xc]
        0x1004069e:    e010        ..      B        0x100406c2 ; _WriteNoCheck + 72
        0x100406a0:    46b8        .F      MOV      r8,r7
        0x100406a2:    6861        ah      LDR      r1,[r4,#4]
        0x100406a4:    1988        ..      ADDS     r0,r1,r6
        0x100406a6:    4642        BF      MOV      r2,r8
        0x100406a8:    4649        IF      MOV      r1,r9
        0x100406aa:    f7fffd55    ..U.    BL       __aeabi_memcpy ; 0x10040158
        0x100406ae:    eba50807    ....    SUB      r8,r5,r7
        0x100406b2:    eb090107    ....    ADD      r1,r9,r7
        0x100406b6:    4642        BF      MOV      r2,r8
        0x100406b8:    6860        `h      LDR      r0,[r4,#4]
        0x100406ba:    f7fffd4d    ..M.    BL       __aeabi_memcpy ; 0x10040158
        0x100406be:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x100406c2:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x100406c6:    0000        ..      MOVS     r0,r0
    i.__0printf$3
    __0printf$3
    __1printf$3
    __2printf
        0x100406c8:    b40f        ..      PUSH     {r0-r3}
        0x100406ca:    4b05        .K      LDR      r3,[pc,#20] ; [0x100406e0] = 0x10040919
        0x100406cc:    b510        ..      PUSH     {r4,lr}
        0x100406ce:    a903        ..      ADD      r1,sp,#0xc
        0x100406d0:    4a04        .J      LDR      r2,[pc,#16] ; [0x100406e4] = 0x200000e4
        0x100406d2:    9802        ..      LDR      r0,[sp,#8]
        0x100406d4:    f000f838    ..8.    BL       _printf_core ; 0x10040748
        0x100406d8:    bc10        ..      POP      {r4}
        0x100406da:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x100406de:    0000        ..      DCW    0
        0x100406e0:    10040919    ....    DCD    268699929
        0x100406e4:    200000e4    ...     DCD    536871140
    $t
    i.__aeabi_assert
    __aeabi_assert
        0x100406e8:    4604        .F      MOV      r4,r0
        0x100406ea:    460d        .F      MOV      r5,r1
        0x100406ec:    4616        .F      MOV      r6,r2
        0x100406ee:    b672        r.      CPSID    i
        0x100406f0:    4623        #F      MOV      r3,r4
        0x100406f2:    4632        2F      MOV      r2,r6
        0x100406f4:    4629        )F      MOV      r1,r5
        0x100406f6:    a002        ..      ADR      r0,{pc}+0xa ; 0x10040700
        0x100406f8:    f7ffffe6    ....    BL       __0printf$3 ; 0x100406c8
        0x100406fc:    bf00        ..      NOP      
        0x100406fe:    e7fe        ..      B        0x100406fe ; __aeabi_assert + 22
    $d
        0x10040700:    65737341    Asse    DCD    1702064961
        0x10040704:    6f697472    rtio    DCD    1869182066
        0x10040708:    6146206e    n Fa    DCD    1631985774
        0x1004070c:    64656c69    iled    DCD    1684368489
        0x10040710:    6966203a    : fi    DCD    1768300602
        0x10040714:    2520656c    le %    DCD    622880108
        0x10040718:    6c202c73    s, l    DCD    1814047859
        0x1004071c:    20656e69    ine     DCD    543518313
        0x10040720:    202c6425    %d,     DCD    539780133
        0x10040724:    000a7325    %s..    DCD    684837
    $t
    i.__scatterload_copy
    __scatterload_copy
        0x10040728:    e002        ..      B        0x10040730 ; __scatterload_copy + 8
        0x1004072a:    c808        ..      LDM      r0!,{r3}
        0x1004072c:    1f12        ..      SUBS     r2,r2,#4
        0x1004072e:    c108        ..      STM      r1!,{r3}
        0x10040730:    2a00        .*      CMP      r2,#0
        0x10040732:    d1fa        ..      BNE      0x1004072a ; __scatterload_copy + 2
        0x10040734:    4770        pG      BX       lr
    i.__scatterload_null
    __scatterload_null
        0x10040736:    4770        pG      BX       lr
    i.__scatterload_zeroinit
    __scatterload_zeroinit
        0x10040738:    2000        .       MOVS     r0,#0
        0x1004073a:    e001        ..      B        0x10040740 ; __scatterload_zeroinit + 8
        0x1004073c:    c101        ..      STM      r1!,{r0}
        0x1004073e:    1f12        ..      SUBS     r2,r2,#4
        0x10040740:    2a00        .*      CMP      r2,#0
        0x10040742:    d1fb        ..      BNE      0x1004073c ; __scatterload_zeroinit + 4
        0x10040744:    4770        pG      BX       lr
        0x10040746:    0000        ..      MOVS     r0,r0
    i._printf_core
    _printf_core
        0x10040748:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x1004074c:    b08b        ..      SUB      sp,sp,#0x2c
        0x1004074e:    469a        .F      MOV      r10,r3
        0x10040750:    460f        .F      MOV      r7,r1
        0x10040752:    4605        .F      MOV      r5,r0
        0x10040754:    2600        .&      MOVS     r6,#0
        0x10040756:    e006        ..      B        0x10040766 ; _printf_core + 30
        0x10040758:    2825        %(      CMP      r0,#0x25
        0x1004075a:    d00b        ..      BEQ      0x10040774 ; _printf_core + 44
        0x1004075c:    4652        RF      MOV      r2,r10
        0x1004075e:    990d        ..      LDR      r1,[sp,#0x34]
        0x10040760:    4790        .G      BLX      r2
        0x10040762:    1c6d        m.      ADDS     r5,r5,#1
        0x10040764:    1c76        v.      ADDS     r6,r6,#1
        0x10040766:    7828        (x      LDRB     r0,[r5,#0]
        0x10040768:    2800        .(      CMP      r0,#0
        0x1004076a:    d1f5        ..      BNE      0x10040758 ; _printf_core + 16
        0x1004076c:    b00f        ..      ADD      sp,sp,#0x3c
        0x1004076e:    4630        0F      MOV      r0,r6
        0x10040770:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x10040774:    2400        .$      MOVS     r4,#0
        0x10040776:    46a0        .F      MOV      r8,r4
        0x10040778:    2201        ."      MOVS     r2,#1
        0x1004077a:    4960        `I      LDR      r1,[pc,#384] ; [0x100408fc] = 0x12809
        0x1004077c:    e000        ..      B        0x10040780 ; _printf_core + 56
        0x1004077e:    4304        .C      ORRS     r4,r4,r0
        0x10040780:    f8153f01    ...?    LDRB     r3,[r5,#1]!
        0x10040784:    3b20         ;      SUBS     r3,r3,#0x20
        0x10040786:    fa02f003    ....    LSL      r0,r2,r3
        0x1004078a:    4208        .B      TST      r0,r1
        0x1004078c:    d1f7        ..      BNE      0x1004077e ; _printf_core + 54
        0x1004078e:    7828        (x      LDRB     r0,[r5,#0]
        0x10040790:    282e        .(      CMP      r0,#0x2e
        0x10040792:    d117        ..      BNE      0x100407c4 ; _printf_core + 124
        0x10040794:    f8150f01    ....    LDRB     r0,[r5,#1]!
        0x10040798:    f0440404    D...    ORR      r4,r4,#4
        0x1004079c:    282a        *(      CMP      r0,#0x2a
        0x1004079e:    d00e        ..      BEQ      0x100407be ; _printf_core + 118
        0x100407a0:    f06f022f    o./.    MVN      r2,#0x2f
        0x100407a4:    7828        (x      LDRB     r0,[r5,#0]
        0x100407a6:    f1a00130    ..0.    SUB      r1,r0,#0x30
        0x100407aa:    2909        .)      CMP      r1,#9
        0x100407ac:    d80a        ..      BHI      0x100407c4 ; _printf_core + 124
        0x100407ae:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x100407b2:    eb020141    ..A.    ADD      r1,r2,r1,LSL #1
        0x100407b6:    eb000801    ....    ADD      r8,r0,r1
        0x100407ba:    1c6d        m.      ADDS     r5,r5,#1
        0x100407bc:    e7f2        ..      B        0x100407a4 ; _printf_core + 92
        0x100407be:    f8578b04    W...    LDR      r8,[r7],#4
        0x100407c2:    1c6d        m.      ADDS     r5,r5,#1
        0x100407c4:    7828        (x      LDRB     r0,[r5,#0]
        0x100407c6:    2869        i(      CMP      r0,#0x69
        0x100407c8:    d03e        >.      BEQ      0x10040848 ; _printf_core + 256
        0x100407ca:    dc06        ..      BGT      0x100407da ; _printf_core + 146
        0x100407cc:    2800        .(      CMP      r0,#0
        0x100407ce:    d0cd        ..      BEQ      0x1004076c ; _printf_core + 36
        0x100407d0:    2863        c(      CMP      r0,#0x63
        0x100407d2:    d00b        ..      BEQ      0x100407ec ; _printf_core + 164
        0x100407d4:    2864        d(      CMP      r0,#0x64
        0x100407d6:    d104        ..      BNE      0x100407e2 ; _printf_core + 154
        0x100407d8:    e036        6.      B        0x10040848 ; _printf_core + 256
        0x100407da:    2873        s(      CMP      r0,#0x73
        0x100407dc:    d010        ..      BEQ      0x10040800 ; _printf_core + 184
        0x100407de:    2875        u(      CMP      r0,#0x75
        0x100407e0:    d04b        K.      BEQ      0x1004087a ; _printf_core + 306
        0x100407e2:    4652        RF      MOV      r2,r10
        0x100407e4:    990d        ..      LDR      r1,[sp,#0x34]
        0x100407e6:    4790        .G      BLX      r2
        0x100407e8:    1c76        v.      ADDS     r6,r6,#1
        0x100407ea:    e085        ..      B        0x100408f8 ; _printf_core + 432
        0x100407ec:    f8170b04    ....    LDRB     r0,[r7],#4
        0x100407f0:    f88d0000    ....    STRB     r0,[sp,#0]
        0x100407f4:    2000        .       MOVS     r0,#0
        0x100407f6:    f88d0001    ....    STRB     r0,[sp,#1]
        0x100407fa:    46e9        .F      MOV      r9,sp
        0x100407fc:    2001        .       MOVS     r0,#1
        0x100407fe:    e003        ..      B        0x10040808 ; _printf_core + 192
        0x10040800:    f8579b04    W...    LDR      r9,[r7],#4
        0x10040804:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x10040808:    0761        a.      LSLS     r1,r4,#29
        0x1004080a:    f04f0400    O...    MOV      r4,#0
        0x1004080e:    d401        ..      BMI      0x10040814 ; _printf_core + 204
        0x10040810:    e00a        ..      B        0x10040828 ; _printf_core + 224
        0x10040812:    1c64        d.      ADDS     r4,r4,#1
        0x10040814:    4544        DE      CMP      r4,r8
        0x10040816:    da0d        ..      BGE      0x10040834 ; _printf_core + 236
        0x10040818:    4284        .B      CMP      r4,r0
        0x1004081a:    dbfa        ..      BLT      0x10040812 ; _printf_core + 202
        0x1004081c:    f8191004    ....    LDRB     r1,[r9,r4]
        0x10040820:    2900        .)      CMP      r1,#0
        0x10040822:    d1f6        ..      BNE      0x10040812 ; _printf_core + 202
        0x10040824:    e006        ..      B        0x10040834 ; _printf_core + 236
        0x10040826:    1c64        d.      ADDS     r4,r4,#1
        0x10040828:    4284        .B      CMP      r4,r0
        0x1004082a:    dbfc        ..      BLT      0x10040826 ; _printf_core + 222
        0x1004082c:    f8191004    ....    LDRB     r1,[r9,r4]
        0x10040830:    2900        .)      CMP      r1,#0
        0x10040832:    d1f8        ..      BNE      0x10040826 ; _printf_core + 222
        0x10040834:    4426        &D      ADD      r6,r6,r4
        0x10040836:    e004        ..      B        0x10040842 ; _printf_core + 250
        0x10040838:    f8190b01    ....    LDRB     r0,[r9],#1
        0x1004083c:    4652        RF      MOV      r2,r10
        0x1004083e:    990d        ..      LDR      r1,[sp,#0x34]
        0x10040840:    4790        .G      BLX      r2
        0x10040842:    1e64        d.      SUBS     r4,r4,#1
        0x10040844:    d2f8        ..      BCS      0x10040838 ; _printf_core + 240
        0x10040846:    e057        W.      B        0x100408f8 ; _printf_core + 432
        0x10040848:    cf01        ..      LDM      r7!,{r0}
        0x1004084a:    f04f0b0a    O...    MOV      r11,#0xa
        0x1004084e:    2800        .(      CMP      r0,#0
        0x10040850:    da02        ..      BGE      0x10040858 ; _printf_core + 272
        0x10040852:    4240        @B      RSBS     r0,r0,#0
        0x10040854:    212d        -!      MOVS     r1,#0x2d
        0x10040856:    e002        ..      B        0x1004085e ; _printf_core + 278
        0x10040858:    0521        !.      LSLS     r1,r4,#20
        0x1004085a:    d504        ..      BPL      0x10040866 ; _printf_core + 286
        0x1004085c:    212b        +!      MOVS     r1,#0x2b
        0x1004085e:    f88d1024    ..$.    STRB     r1,[sp,#0x24]
        0x10040862:    2101        .!      MOVS     r1,#1
        0x10040864:    e003        ..      B        0x1004086e ; _printf_core + 294
        0x10040866:    07e1        ..      LSLS     r1,r4,#31
        0x10040868:    d005        ..      BEQ      0x10040876 ; _printf_core + 302
        0x1004086a:    2120         !      MOVS     r1,#0x20
        0x1004086c:    e7f7        ..      B        0x1004085e ; _printf_core + 278
        0x1004086e:    f10d0920    .. .    ADD      r9,sp,#0x20
        0x10040872:    9108        ..      STR      r1,[sp,#0x20]
        0x10040874:    e00c        ..      B        0x10040890 ; _printf_core + 328
        0x10040876:    2100        .!      MOVS     r1,#0
        0x10040878:    e7f9        ..      B        0x1004086e ; _printf_core + 294
        0x1004087a:    cf01        ..      LDM      r7!,{r0}
        0x1004087c:    f04f0b0a    O...    MOV      r11,#0xa
        0x10040880:    e7f9        ..      B        0x10040876 ; _printf_core + 302
        0x10040882:    4659        YF      MOV      r1,r11
        0x10040884:    f7fffc83    ....    BL       __aeabi_uidiv ; 0x1004018e
        0x10040888:    f1010230    ..0.    ADD      r2,r1,#0x30
        0x1004088c:    f8092d01    ...-    STRB     r2,[r9,#-1]!
        0x10040890:    2800        .(      CMP      r0,#0
        0x10040892:    d1f6        ..      BNE      0x10040882 ; _printf_core + 314
        0x10040894:    ebad0009    ....    SUB      r0,sp,r9
        0x10040898:    f1000b20    .. .    ADD      r11,r0,#0x20
        0x1004089c:    0760        `.      LSLS     r0,r4,#29
        0x1004089e:    d401        ..      BMI      0x100408a4 ; _printf_core + 348
        0x100408a0:    f04f0801    O...    MOV      r8,#1
        0x100408a4:    45d8        .E      CMP      r8,r11
        0x100408a6:    dd02        ..      BLE      0x100408ae ; _printf_core + 358
        0x100408a8:    eba8000b    ....    SUB      r0,r8,r11
        0x100408ac:    e000        ..      B        0x100408b0 ; _printf_core + 360
        0x100408ae:    2000        .       MOVS     r0,#0
        0x100408b0:    4680        .F      MOV      r8,r0
        0x100408b2:    2400        .$      MOVS     r4,#0
        0x100408b4:    e006        ..      B        0x100408c4 ; _printf_core + 380
        0x100408b6:    a809        ..      ADD      r0,sp,#0x24
        0x100408b8:    4652        RF      MOV      r2,r10
        0x100408ba:    5d00        .]      LDRB     r0,[r0,r4]
        0x100408bc:    990d        ..      LDR      r1,[sp,#0x34]
        0x100408be:    4790        .G      BLX      r2
        0x100408c0:    1c64        d.      ADDS     r4,r4,#1
        0x100408c2:    1c76        v.      ADDS     r6,r6,#1
        0x100408c4:    9808        ..      LDR      r0,[sp,#0x20]
        0x100408c6:    4284        .B      CMP      r4,r0
        0x100408c8:    dbf5        ..      BLT      0x100408b6 ; _printf_core + 366
        0x100408ca:    e004        ..      B        0x100408d6 ; _printf_core + 398
        0x100408cc:    2030        0       MOVS     r0,#0x30
        0x100408ce:    4652        RF      MOV      r2,r10
        0x100408d0:    990d        ..      LDR      r1,[sp,#0x34]
        0x100408d2:    4790        .G      BLX      r2
        0x100408d4:    1c76        v.      ADDS     r6,r6,#1
        0x100408d6:    f1b80100    ....    SUBS     r1,r8,#0
        0x100408da:    f1a80801    ....    SUB      r8,r8,#1
        0x100408de:    dcf5        ..      BGT      0x100408cc ; _printf_core + 388
        0x100408e0:    e005        ..      B        0x100408ee ; _printf_core + 422
        0x100408e2:    f8190b01    ....    LDRB     r0,[r9],#1
        0x100408e6:    4652        RF      MOV      r2,r10
        0x100408e8:    990d        ..      LDR      r1,[sp,#0x34]
        0x100408ea:    4790        .G      BLX      r2
        0x100408ec:    1c76        v.      ADDS     r6,r6,#1
        0x100408ee:    f1bb0100    ....    SUBS     r1,r11,#0
        0x100408f2:    f1ab0b01    ....    SUB      r11,r11,#1
        0x100408f6:    dcf4        ..      BGT      0x100408e2 ; _printf_core + 410
        0x100408f8:    1c6d        m.      ADDS     r5,r5,#1
        0x100408fa:    e734        4.      B        0x10040766 ; _printf_core + 30
    $d
        0x100408fc:    00012809    .(..    DCD    75785
    $t
    i.delay
    delay
        0x10040900:    2100        .!      MOVS     r1,#0
        0x10040902:    e006        ..      B        0x10040912 ; delay + 18
        0x10040904:    bf00        ..      NOP      
        0x10040906:    bf00        ..      NOP      
        0x10040908:    bf00        ..      NOP      
        0x1004090a:    bf00        ..      NOP      
        0x1004090c:    bf00        ..      NOP      
        0x1004090e:    bf00        ..      NOP      
        0x10040910:    1c49        I.      ADDS     r1,r1,#1
        0x10040912:    4281        .B      CMP      r1,r0
        0x10040914:    d3f6        ..      BCC      0x10040904 ; delay + 4
        0x10040916:    4770        pG      BX       lr
    i.fputc
    fputc
        0x10040918:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x1004091a:    460c        .F      MOV      r4,r1
        0x1004091c:    2201        ."      MOVS     r2,#1
        0x1004091e:    4669        iF      MOV      r1,sp
        0x10040920:    2000        .       MOVS     r0,#0
        0x10040922:    f7fffd6d    ..m.    BL       SEGGER_RTT_Write ; 0x10040400
        0x10040926:    9800        ..      LDR      r0,[sp,#0]
        0x10040928:    bd1c        ..      POP      {r2-r4,pc}
        0x1004092a:    0000        ..      MOVS     r0,r0
    i.main
    main
        0x1004092c:    b51c        ..      PUSH     {r2-r4,lr}
        0x1004092e:    a00d        ..      ADR      r0,{pc}+0x36 ; 0x10040964
        0x10040930:    f7fffeca    ....    BL       __0printf$3 ; 0x100406c8
        0x10040934:    2000        .       MOVS     r0,#0
        0x10040936:    2101        .!      MOVS     r1,#1
        0x10040938:    4603        .F      MOV      r3,r0
        0x1004093a:    22c8        ."      MOVS     r2,#0xc8
        0x1004093c:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x10040940:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x10040974
        0x10040942:    480e        .H      LDR      r0,[pc,#56] ; [0x1004097c] = 0x10040fd9
        0x10040944:    f000fc0e    ....    BL       xTaskCreate ; 0x10041164
        0x10040948:    2000        .       MOVS     r0,#0
        0x1004094a:    2102        .!      MOVS     r1,#2
        0x1004094c:    4603        .F      MOV      r3,r0
        0x1004094e:    22c8        ."      MOVS     r2,#0xc8
        0x10040950:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x10040954:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x10040980
        0x10040956:    480c        .H      LDR      r0,[pc,#48] ; [0x10040988] = 0x10041005
        0x10040958:    f000fc04    ....    BL       xTaskCreate ; 0x10041164
        0x1004095c:    f000fb7e    ..~.    BL       vTaskStartScheduler ; 0x1004105c
        0x10040960:    bf00        ..      NOP      
        0x10040962:    e7fe        ..      B        0x10040962 ; main + 54
    $d
        0x10040964:    206e7552    Run     DCD    544109906
        0x10040968:    46206e6f    on F    DCD    1176530543
        0x1004096c:    6873616c    lash    DCD    1752392044
        0x10040970:    0000000a    ....    DCD    10
        0x10040974:    6b736154    Task    DCD    1802723668
        0x10040978:    00000031    1...    DCD    49
        0x1004097c:    10040fd9    ....    DCD    268701657
        0x10040980:    6b736154    Task    DCD    1802723668
        0x10040984:    00000032    2...    DCD    50
        0x10040988:    10041005    ....    DCD    268701701
    $t
    i.prvAddCurrentTaskToDelayedList
    prvAddCurrentTaskToDelayedList
        0x1004098c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x10040990:    4605        .F      MOV      r5,r0
        0x10040992:    460e        .F      MOV      r6,r1
        0x10040994:    481c        .H      LDR      r0,[pc,#112] ; [0x10040a08] = 0x200000a0
        0x10040996:    6807        .h      LDR      r7,[r0,#0]
        0x10040998:    481c        .H      LDR      r0,[pc,#112] ; [0x10040a0c] = 0x2000008c
        0x1004099a:    6800        .h      LDR      r0,[r0,#0]
        0x1004099c:    1d00        ..      ADDS     r0,r0,#4
        0x1004099e:    f000fa81    ....    BL       uxListRemove ; 0x10040ea4
        0x100409a2:    b950        P.      CBNZ     r0,0x100409ba ; prvAddCurrentTaskToDelayedList + 46
        0x100409a4:    4819        .H      LDR      r0,[pc,#100] ; [0x10040a0c] = 0x2000008c
        0x100409a6:    6800        .h      LDR      r0,[r0,#0]
        0x100409a8:    f890102c    ..,.    LDRB     r1,[r0,#0x2c]
        0x100409ac:    2001        .       MOVS     r0,#1
        0x100409ae:    4088        .@      LSLS     r0,r0,r1
        0x100409b0:    4917        .I      LDR      r1,[pc,#92] ; [0x10040a10] = 0x200000a4
        0x100409b2:    6809        .h      LDR      r1,[r1,#0]
        0x100409b4:    4381        .C      BICS     r1,r1,r0
        0x100409b6:    4816        .H      LDR      r0,[pc,#88] ; [0x10040a10] = 0x200000a4
        0x100409b8:    6001        .`      STR      r1,[r0,#0]
        0x100409ba:    1c68        h.      ADDS     r0,r5,#1
        0x100409bc:    b938        8.      CBNZ     r0,0x100409ce ; prvAddCurrentTaskToDelayedList + 66
        0x100409be:    b136        6.      CBZ      r6,0x100409ce ; prvAddCurrentTaskToDelayedList + 66
        0x100409c0:    4812        .H      LDR      r0,[pc,#72] ; [0x10040a0c] = 0x2000008c
        0x100409c2:    6801        .h      LDR      r1,[r0,#0]
        0x100409c4:    1d09        ..      ADDS     r1,r1,#4
        0x100409c6:    4813        .H      LDR      r0,[pc,#76] ; [0x10040a14] = 0x2000019c
        0x100409c8:    f000faaa    ....    BL       vListInsertEnd ; 0x10040f20
        0x100409cc:    e01a        ..      B        0x10040a04 ; prvAddCurrentTaskToDelayedList + 120
        0x100409ce:    197c        |.      ADDS     r4,r7,r5
        0x100409d0:    480e        .H      LDR      r0,[pc,#56] ; [0x10040a0c] = 0x2000008c
        0x100409d2:    6800        .h      LDR      r0,[r0,#0]
        0x100409d4:    6044        D`      STR      r4,[r0,#4]
        0x100409d6:    42bc        .B      CMP      r4,r7
        0x100409d8:    d207        ..      BCS      0x100409ea ; prvAddCurrentTaskToDelayedList + 94
        0x100409da:    480c        .H      LDR      r0,[pc,#48] ; [0x10040a0c] = 0x2000008c
        0x100409dc:    6801        .h      LDR      r1,[r0,#0]
        0x100409de:    1d09        ..      ADDS     r1,r1,#4
        0x100409e0:    480d        .H      LDR      r0,[pc,#52] ; [0x10040a18] = 0x20000094
        0x100409e2:    6800        .h      LDR      r0,[r0,#0]
        0x100409e4:    f000fa82    ....    BL       vListInsert ; 0x10040eec
        0x100409e8:    e00c        ..      B        0x10040a04 ; prvAddCurrentTaskToDelayedList + 120
        0x100409ea:    4808        .H      LDR      r0,[pc,#32] ; [0x10040a0c] = 0x2000008c
        0x100409ec:    6801        .h      LDR      r1,[r0,#0]
        0x100409ee:    1d09        ..      ADDS     r1,r1,#4
        0x100409f0:    480a        .H      LDR      r0,[pc,#40] ; [0x10040a1c] = 0x20000090
        0x100409f2:    6800        .h      LDR      r0,[r0,#0]
        0x100409f4:    f000fa7a    ..z.    BL       vListInsert ; 0x10040eec
        0x100409f8:    4809        .H      LDR      r0,[pc,#36] ; [0x10040a20] = 0x200000bc
        0x100409fa:    6800        .h      LDR      r0,[r0,#0]
        0x100409fc:    4284        .B      CMP      r4,r0
        0x100409fe:    d201        ..      BCS      0x10040a04 ; prvAddCurrentTaskToDelayedList + 120
        0x10040a00:    4807        .H      LDR      r0,[pc,#28] ; [0x10040a20] = 0x200000bc
        0x10040a02:    6004        .`      STR      r4,[r0,#0]
        0x10040a04:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x10040a08:    200000a0    ...     DCD    536871072
        0x10040a0c:    2000008c    ...     DCD    536871052
        0x10040a10:    200000a4    ...     DCD    536871076
        0x10040a14:    2000019c    ...     DCD    536871324
        0x10040a18:    20000094    ...     DCD    536871060
        0x10040a1c:    20000090    ...     DCD    536871056
        0x10040a20:    200000bc    ...     DCD    536871100
    $t
    i.prvAddNewTaskToReadyList
    prvAddNewTaskToReadyList
        0x10040a24:    b510        ..      PUSH     {r4,lr}
        0x10040a26:    4604        .F      MOV      r4,r0
        0x10040a28:    f000fa86    ....    BL       vPortEnterCritical ; 0x10040f38
        0x10040a2c:    4823        #H      LDR      r0,[pc,#140] ; [0x10040abc] = 0x2000009c
        0x10040a2e:    6800        .h      LDR      r0,[r0,#0]
        0x10040a30:    1c40        @.      ADDS     r0,r0,#1
        0x10040a32:    4922        "I      LDR      r1,[pc,#136] ; [0x10040abc] = 0x2000009c
        0x10040a34:    6008        .`      STR      r0,[r1,#0]
        0x10040a36:    4822        "H      LDR      r0,[pc,#136] ; [0x10040ac0] = 0x2000008c
        0x10040a38:    6800        .h      LDR      r0,[r0,#0]
        0x10040a3a:    b940        @.      CBNZ     r0,0x10040a4e ; prvAddNewTaskToReadyList + 42
        0x10040a3c:    4820         H      LDR      r0,[pc,#128] ; [0x10040ac0] = 0x2000008c
        0x10040a3e:    6004        .`      STR      r4,[r0,#0]
        0x10040a40:    4608        .F      MOV      r0,r1
        0x10040a42:    6800        .h      LDR      r0,[r0,#0]
        0x10040a44:    2801        .(      CMP      r0,#1
        0x10040a46:    d10d        ..      BNE      0x10040a64 ; prvAddNewTaskToReadyList + 64
        0x10040a48:    f000f914    ....    BL       prvInitialiseTaskLists ; 0x10040c74
        0x10040a4c:    e00a        ..      B        0x10040a64 ; prvAddNewTaskToReadyList + 64
        0x10040a4e:    481d        .H      LDR      r0,[pc,#116] ; [0x10040ac4] = 0x200000a8
        0x10040a50:    6800        .h      LDR      r0,[r0,#0]
        0x10040a52:    b938        8.      CBNZ     r0,0x10040a64 ; prvAddNewTaskToReadyList + 64
        0x10040a54:    481a        .H      LDR      r0,[pc,#104] ; [0x10040ac0] = 0x2000008c
        0x10040a56:    6800        .h      LDR      r0,[r0,#0]
        0x10040a58:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x10040a5a:    6ae1        .j      LDR      r1,[r4,#0x2c]
        0x10040a5c:    4288        .B      CMP      r0,r1
        0x10040a5e:    d801        ..      BHI      0x10040a64 ; prvAddNewTaskToReadyList + 64
        0x10040a60:    4817        .H      LDR      r0,[pc,#92] ; [0x10040ac0] = 0x2000008c
        0x10040a62:    6004        .`      STR      r4,[r0,#0]
        0x10040a64:    4818        .H      LDR      r0,[pc,#96] ; [0x10040ac8] = 0x200000b8
        0x10040a66:    6800        .h      LDR      r0,[r0,#0]
        0x10040a68:    1c40        @.      ADDS     r0,r0,#1
        0x10040a6a:    4917        .I      LDR      r1,[pc,#92] ; [0x10040ac8] = 0x200000b8
        0x10040a6c:    6008        .`      STR      r0,[r1,#0]
        0x10040a6e:    f894102c    ..,.    LDRB     r1,[r4,#0x2c]
        0x10040a72:    2001        .       MOVS     r0,#1
        0x10040a74:    4088        .@      LSLS     r0,r0,r1
        0x10040a76:    4915        .I      LDR      r1,[pc,#84] ; [0x10040acc] = 0x200000a4
        0x10040a78:    6809        .h      LDR      r1,[r1,#0]
        0x10040a7a:    4308        .C      ORRS     r0,r0,r1
        0x10040a7c:    4913        .I      LDR      r1,[pc,#76] ; [0x10040acc] = 0x200000a4
        0x10040a7e:    6008        .`      STR      r0,[r1,#0]
        0x10040a80:    6ae1        .j      LDR      r1,[r4,#0x2c]
        0x10040a82:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x10040a86:    4a12        .J      LDR      r2,[pc,#72] ; [0x10040ad0] = 0x200000e8
        0x10040a88:    eb020081    ....    ADD      r0,r2,r1,LSL #2
        0x10040a8c:    1d21        !.      ADDS     r1,r4,#4
        0x10040a8e:    f000fa47    ..G.    BL       vListInsertEnd ; 0x10040f20
        0x10040a92:    f000fa63    ..c.    BL       vPortExitCritical ; 0x10040f5c
        0x10040a96:    480b        .H      LDR      r0,[pc,#44] ; [0x10040ac4] = 0x200000a8
        0x10040a98:    6800        .h      LDR      r0,[r0,#0]
        0x10040a9a:    b168        h.      CBZ      r0,0x10040ab8 ; prvAddNewTaskToReadyList + 148
        0x10040a9c:    4808        .H      LDR      r0,[pc,#32] ; [0x10040ac0] = 0x2000008c
        0x10040a9e:    6800        .h      LDR      r0,[r0,#0]
        0x10040aa0:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x10040aa2:    6ae1        .j      LDR      r1,[r4,#0x2c]
        0x10040aa4:    4288        .B      CMP      r0,r1
        0x10040aa6:    d207        ..      BCS      0x10040ab8 ; prvAddNewTaskToReadyList + 148
        0x10040aa8:    f04f5080    O..P    MOV      r0,#0x10000000
        0x10040aac:    4909        .I      LDR      r1,[pc,#36] ; [0x10040ad4] = 0xe000ed04
        0x10040aae:    6008        .`      STR      r0,[r1,#0]
        0x10040ab0:    f3bf8f4f    ..O.    DSB      
        0x10040ab4:    f3bf8f6f    ..o.    ISB      
        0x10040ab8:    bd10        ..      POP      {r4,pc}
    $d
        0x10040aba:    0000        ..      DCW    0
        0x10040abc:    2000009c    ...     DCD    536871068
        0x10040ac0:    2000008c    ...     DCD    536871052
        0x10040ac4:    200000a8    ...     DCD    536871080
        0x10040ac8:    200000b8    ...     DCD    536871096
        0x10040acc:    200000a4    ...     DCD    536871076
        0x10040ad0:    200000e8    ...     DCD    536871144
        0x10040ad4:    e000ed04    ....    DCD    3758157060
    $t
    i.prvCheckTasksWaitingTermination
    prvCheckTasksWaitingTermination
        0x10040ad8:    b570        p.      PUSH     {r4-r6,lr}
        0x10040ada:    e023        #.      B        0x10040b24 ; prvCheckTasksWaitingTermination + 76
        0x10040adc:    f000faf0    ....    BL       vTaskSuspendAll ; 0x100410c0
        0x10040ae0:    4813        .H      LDR      r0,[pc,#76] ; [0x10040b30] = 0x20000188
        0x10040ae2:    6800        .h      LDR      r0,[r0,#0]
        0x10040ae4:    b908        ..      CBNZ     r0,0x10040aea ; prvCheckTasksWaitingTermination + 18
        0x10040ae6:    2001        .       MOVS     r0,#1
        0x10040ae8:    e000        ..      B        0x10040aec ; prvCheckTasksWaitingTermination + 20
        0x10040aea:    2000        .       MOVS     r0,#0
        0x10040aec:    4605        .F      MOV      r5,r0
        0x10040aee:    f000fbf7    ....    BL       xTaskResumeAll ; 0x100412e0
        0x10040af2:    b9bd        ..      CBNZ     r5,0x10040b24 ; prvCheckTasksWaitingTermination + 76
        0x10040af4:    f000fa20    .. .    BL       vPortEnterCritical ; 0x10040f38
        0x10040af8:    480d        .H      LDR      r0,[pc,#52] ; [0x10040b30] = 0x20000188
        0x10040afa:    68c0        .h      LDR      r0,[r0,#0xc]
        0x10040afc:    68c4        .h      LDR      r4,[r0,#0xc]
        0x10040afe:    1d20         .      ADDS     r0,r4,#4
        0x10040b00:    f000f9d0    ....    BL       uxListRemove ; 0x10040ea4
        0x10040b04:    480b        .H      LDR      r0,[pc,#44] ; [0x10040b34] = 0x2000009c
        0x10040b06:    6800        .h      LDR      r0,[r0,#0]
        0x10040b08:    1e40        @.      SUBS     r0,r0,#1
        0x10040b0a:    490a        .I      LDR      r1,[pc,#40] ; [0x10040b34] = 0x2000009c
        0x10040b0c:    6008        .`      STR      r0,[r1,#0]
        0x10040b0e:    480a        .H      LDR      r0,[pc,#40] ; [0x10040b38] = 0x20000098
        0x10040b10:    6800        .h      LDR      r0,[r0,#0]
        0x10040b12:    1e40        @.      SUBS     r0,r0,#1
        0x10040b14:    4908        .I      LDR      r1,[pc,#32] ; [0x10040b38] = 0x20000098
        0x10040b16:    6008        .`      STR      r0,[r1,#0]
        0x10040b18:    f000fa20    .. .    BL       vPortExitCritical ; 0x10040f5c
        0x10040b1c:    4620         F      MOV      r0,r4
        0x10040b1e:    f000f80d    ....    BL       prvDeleteTCB ; 0x10040b3c
        0x10040b22:    bf00        ..      NOP      
        0x10040b24:    4804        .H      LDR      r0,[pc,#16] ; [0x10040b38] = 0x20000098
        0x10040b26:    6800        .h      LDR      r0,[r0,#0]
        0x10040b28:    2800        .(      CMP      r0,#0
        0x10040b2a:    d1d7        ..      BNE      0x10040adc ; prvCheckTasksWaitingTermination + 4
        0x10040b2c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x10040b2e:    0000        ..      DCW    0
        0x10040b30:    20000188    ...     DCD    536871304
        0x10040b34:    2000009c    ...     DCD    536871068
        0x10040b38:    20000098    ...     DCD    536871064
    $t
    i.prvDeleteTCB
    prvDeleteTCB
        0x10040b3c:    b510        ..      PUSH     {r4,lr}
        0x10040b3e:    4604        .F      MOV      r4,r0
        0x10040b40:    6b20         k      LDR      r0,[r4,#0x30]
        0x10040b42:    f000fa1b    ....    BL       vPortFree ; 0x10040f7c
        0x10040b46:    4620         F      MOV      r0,r4
        0x10040b48:    f000fa18    ....    BL       vPortFree ; 0x10040f7c
        0x10040b4c:    bd10        ..      POP      {r4,pc}
        0x10040b4e:    0000        ..      MOVS     r0,r0
    i.prvHeapInit
    prvHeapInit
        0x10040b50:    b530        0.      PUSH     {r4,r5,lr}
        0x10040b52:    f44f5300    O..S    MOV      r3,#0x2000
        0x10040b56:    4817        .H      LDR      r0,[pc,#92] ; [0x10040bb4] = 0x200001b0
        0x10040b58:    f0000407    ....    AND      r4,r0,#7
        0x10040b5c:    b12c        ,.      CBZ      r4,0x10040b6a ; prvHeapInit + 26
        0x10040b5e:    1dc0        ..      ADDS     r0,r0,#7
        0x10040b60:    f0200007     ...    BIC      r0,r0,#7
        0x10040b64:    4c13        .L      LDR      r4,[pc,#76] ; [0x10040bb4] = 0x200001b0
        0x10040b66:    1b04        ..      SUBS     r4,r0,r4
        0x10040b68:    1b1b        ..      SUBS     r3,r3,r4
        0x10040b6a:    4602        .F      MOV      r2,r0
        0x10040b6c:    4c12        .L      LDR      r4,[pc,#72] ; [0x10040bb8] = 0x200000cc
        0x10040b6e:    6022        "`      STR      r2,[r4,#0]
        0x10040b70:    2400        .$      MOVS     r4,#0
        0x10040b72:    4d11        .M      LDR      r5,[pc,#68] ; [0x10040bb8] = 0x200000cc
        0x10040b74:    606c        l`      STR      r4,[r5,#4]
        0x10040b76:    18d0        ..      ADDS     r0,r2,r3
        0x10040b78:    3808        .8      SUBS     r0,r0,#8
        0x10040b7a:    f0200007     ...    BIC      r0,r0,#7
        0x10040b7e:    4c0f        .L      LDR      r4,[pc,#60] ; [0x10040bbc] = 0x200000d4
        0x10040b80:    6020         `      STR      r0,[r4,#0]
        0x10040b82:    2400        .$      MOVS     r4,#0
        0x10040b84:    4d0d        .M      LDR      r5,[pc,#52] ; [0x10040bbc] = 0x200000d4
        0x10040b86:    682d        -h      LDR      r5,[r5,#0]
        0x10040b88:    606c        l`      STR      r4,[r5,#4]
        0x10040b8a:    4d0c        .M      LDR      r5,[pc,#48] ; [0x10040bbc] = 0x200000d4
        0x10040b8c:    682d        -h      LDR      r5,[r5,#0]
        0x10040b8e:    602c        ,`      STR      r4,[r5,#0]
        0x10040b90:    4611        .F      MOV      r1,r2
        0x10040b92:    1a44        D.      SUBS     r4,r0,r1
        0x10040b94:    604c        L`      STR      r4,[r1,#4]
        0x10040b96:    4c09        .L      LDR      r4,[pc,#36] ; [0x10040bbc] = 0x200000d4
        0x10040b98:    6824        $h      LDR      r4,[r4,#0]
        0x10040b9a:    600c        .`      STR      r4,[r1,#0]
        0x10040b9c:    4d08        .M      LDR      r5,[pc,#32] ; [0x10040bc0] = 0x200000dc
        0x10040b9e:    684c        Lh      LDR      r4,[r1,#4]
        0x10040ba0:    602c        ,`      STR      r4,[r5,#0]
        0x10040ba2:    4d08        .M      LDR      r5,[pc,#32] ; [0x10040bc4] = 0x200000d8
        0x10040ba4:    684c        Lh      LDR      r4,[r1,#4]
        0x10040ba6:    602c        ,`      STR      r4,[r5,#0]
        0x10040ba8:    f04f4400    O..D    MOV      r4,#0x80000000
        0x10040bac:    4d06        .M      LDR      r5,[pc,#24] ; [0x10040bc8] = 0x200000e0
        0x10040bae:    602c        ,`      STR      r4,[r5,#0]
        0x10040bb0:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x10040bb2:    0000        ..      DCW    0
        0x10040bb4:    200001b0    ...     DCD    536871344
        0x10040bb8:    200000cc    ...     DCD    536871116
        0x10040bbc:    200000d4    ...     DCD    536871124
        0x10040bc0:    200000dc    ...     DCD    536871132
        0x10040bc4:    200000d8    ...     DCD    536871128
        0x10040bc8:    200000e0    ...     DCD    536871136
    $t
    i.prvIdleTask
    prvIdleTask
        0x10040bcc:    bf00        ..      NOP      
        0x10040bce:    f7ffff83    ....    BL       prvCheckTasksWaitingTermination ; 0x10040ad8
        0x10040bd2:    4806        .H      LDR      r0,[pc,#24] ; [0x10040bec] = 0x200000e8
        0x10040bd4:    6800        .h      LDR      r0,[r0,#0]
        0x10040bd6:    2801        .(      CMP      r0,#1
        0x10040bd8:    d9f9        ..      BLS      0x10040bce ; prvIdleTask + 2
        0x10040bda:    f04f5080    O..P    MOV      r0,#0x10000000
        0x10040bde:    4904        .I      LDR      r1,[pc,#16] ; [0x10040bf0] = 0xe000ed04
        0x10040be0:    6008        .`      STR      r0,[r1,#0]
        0x10040be2:    f3bf8f4f    ..O.    DSB      
        0x10040be6:    f3bf8f6f    ..o.    ISB      
        0x10040bea:    e7f0        ..      B        0x10040bce ; prvIdleTask + 2
    $d
        0x10040bec:    200000e8    ...     DCD    536871144
        0x10040bf0:    e000ed04    ....    DCD    3758157060
    $t
    i.prvInitialiseNewTask
    prvInitialiseNewTask
        0x10040bf4:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x10040bf8:    4680        .F      MOV      r8,r0
        0x10040bfa:    460e        .F      MOV      r6,r1
        0x10040bfc:    4691        .F      MOV      r9,r2
        0x10040bfe:    e9dd7a0e    ...z    LDRD     r7,r10,[sp,#0x38]
        0x10040c02:    9c10        ..      LDR      r4,[sp,#0x40]
        0x10040c04:    f1a90001    ....    SUB      r0,r9,#1
        0x10040c08:    6b21        !k      LDR      r1,[r4,#0x30]
        0x10040c0a:    eb010b80    ....    ADD      r11,r1,r0,LSL #2
        0x10040c0e:    f02b0b07    +...    BIC      r11,r11,#7
        0x10040c12:    2500        .%      MOVS     r5,#0
        0x10040c14:    e007        ..      B        0x10040c26 ; prvInitialiseNewTask + 50
        0x10040c16:    5d71        q]      LDRB     r1,[r6,r5]
        0x10040c18:    f1040034    ..4.    ADD      r0,r4,#0x34
        0x10040c1c:    5541        AU      STRB     r1,[r0,r5]
        0x10040c1e:    5d70        p]      LDRB     r0,[r6,r5]
        0x10040c20:    b900        ..      CBNZ     r0,0x10040c24 ; prvInitialiseNewTask + 48
        0x10040c22:    e002        ..      B        0x10040c2a ; prvInitialiseNewTask + 54
        0x10040c24:    1c6d        m.      ADDS     r5,r5,#1
        0x10040c26:    2d10        .-      CMP      r5,#0x10
        0x10040c28:    d3f5        ..      BCC      0x10040c16 ; prvInitialiseNewTask + 34
        0x10040c2a:    bf00        ..      NOP      
        0x10040c2c:    2100        .!      MOVS     r1,#0
        0x10040c2e:    2043        C       MOVS     r0,#0x43
        0x10040c30:    5501        .U      STRB     r1,[r0,r4]
        0x10040c32:    2f05        ./      CMP      r7,#5
        0x10040c34:    d300        ..      BCC      0x10040c38 ; prvInitialiseNewTask + 68
        0x10040c36:    2704        .'      MOVS     r7,#4
        0x10040c38:    62e7        .b      STR      r7,[r4,#0x2c]
        0x10040c3a:    1d20         .      ADDS     r0,r4,#4
        0x10040c3c:    f000f953    ..S.    BL       vListInitialiseItem ; 0x10040ee6
        0x10040c40:    f1040018    ....    ADD      r0,r4,#0x18
        0x10040c44:    f000f94f    ..O.    BL       vListInitialiseItem ; 0x10040ee6
        0x10040c48:    6124        $a      STR      r4,[r4,#0x10]
        0x10040c4a:    f1c70005    ....    RSB      r0,r7,#5
        0x10040c4e:    61a0        .a      STR      r0,[r4,#0x18]
        0x10040c50:    6264        db      STR      r4,[r4,#0x24]
        0x10040c52:    2000        .       MOVS     r0,#0
        0x10040c54:    6460        `d      STR      r0,[r4,#0x44]
        0x10040c56:    f8840048    ..H.    STRB     r0,[r4,#0x48]
        0x10040c5a:    4641        AF      MOV      r1,r8
        0x10040c5c:    4658        XF      MOV      r0,r11
        0x10040c5e:    9a03        ..      LDR      r2,[sp,#0xc]
        0x10040c60:    f000f8fe    ....    BL       pxPortInitialiseStack ; 0x10040e60
        0x10040c64:    6020         `      STR      r0,[r4,#0]
        0x10040c66:    f1ba0f00    ....    CMP      r10,#0
        0x10040c6a:    d001        ..      BEQ      0x10040c70 ; prvInitialiseNewTask + 124
        0x10040c6c:    f8ca4000    ...@    STR      r4,[r10,#0]
        0x10040c70:    e8bd9fff    ....    POP      {r0-r12,pc}
    i.prvInitialiseTaskLists
    prvInitialiseTaskLists
        0x10040c74:    b510        ..      PUSH     {r4,lr}
        0x10040c76:    2400        .$      MOVS     r4,#0
        0x10040c78:    e007        ..      B        0x10040c8a ; prvInitialiseTaskLists + 22
        0x10040c7a:    eb040184    ....    ADD      r1,r4,r4,LSL #2
        0x10040c7e:    4a0f        .J      LDR      r2,[pc,#60] ; [0x10040cbc] = 0x200000e8
        0x10040c80:    eb020081    ....    ADD      r0,r2,r1,LSL #2
        0x10040c84:    f000f922    ..".    BL       vListInitialise ; 0x10040ecc
        0x10040c88:    1c64        d.      ADDS     r4,r4,#1
        0x10040c8a:    2c05        .,      CMP      r4,#5
        0x10040c8c:    d3f5        ..      BCC      0x10040c7a ; prvInitialiseTaskLists + 6
        0x10040c8e:    480c        .H      LDR      r0,[pc,#48] ; [0x10040cc0] = 0x2000014c
        0x10040c90:    f000f91c    ....    BL       vListInitialise ; 0x10040ecc
        0x10040c94:    480b        .H      LDR      r0,[pc,#44] ; [0x10040cc4] = 0x20000160
        0x10040c96:    f000f919    ....    BL       vListInitialise ; 0x10040ecc
        0x10040c9a:    480b        .H      LDR      r0,[pc,#44] ; [0x10040cc8] = 0x20000174
        0x10040c9c:    f000f916    ....    BL       vListInitialise ; 0x10040ecc
        0x10040ca0:    480a        .H      LDR      r0,[pc,#40] ; [0x10040ccc] = 0x20000188
        0x10040ca2:    f000f913    ....    BL       vListInitialise ; 0x10040ecc
        0x10040ca6:    480a        .H      LDR      r0,[pc,#40] ; [0x10040cd0] = 0x2000019c
        0x10040ca8:    f000f910    ....    BL       vListInitialise ; 0x10040ecc
        0x10040cac:    4804        .H      LDR      r0,[pc,#16] ; [0x10040cc0] = 0x2000014c
        0x10040cae:    4909        .I      LDR      r1,[pc,#36] ; [0x10040cd4] = 0x20000090
        0x10040cb0:    6008        .`      STR      r0,[r1,#0]
        0x10040cb2:    4804        .H      LDR      r0,[pc,#16] ; [0x10040cc4] = 0x20000160
        0x10040cb4:    4908        .I      LDR      r1,[pc,#32] ; [0x10040cd8] = 0x20000094
        0x10040cb6:    6008        .`      STR      r0,[r1,#0]
        0x10040cb8:    bd10        ..      POP      {r4,pc}
    $d
        0x10040cba:    0000        ..      DCW    0
        0x10040cbc:    200000e8    ...     DCD    536871144
        0x10040cc0:    2000014c    L..     DCD    536871244
        0x10040cc4:    20000160    `..     DCD    536871264
        0x10040cc8:    20000174    t..     DCD    536871284
        0x10040ccc:    20000188    ...     DCD    536871304
        0x10040cd0:    2000019c    ...     DCD    536871324
        0x10040cd4:    20000090    ...     DCD    536871056
        0x10040cd8:    20000094    ...     DCD    536871060
    $t
    i.prvInsertBlockIntoFreeList
    prvInsertBlockIntoFreeList
        0x10040cdc:    b510        ..      PUSH     {r4,lr}
        0x10040cde:    4601        .F      MOV      r1,r0
        0x10040ce0:    4816        .H      LDR      r0,[pc,#88] ; [0x10040d3c] = 0x200000cc
        0x10040ce2:    e000        ..      B        0x10040ce6 ; prvInsertBlockIntoFreeList + 10
        0x10040ce4:    6800        .h      LDR      r0,[r0,#0]
        0x10040ce6:    6803        .h      LDR      r3,[r0,#0]
        0x10040ce8:    428b        .B      CMP      r3,r1
        0x10040cea:    d3fb        ..      BCC      0x10040ce4 ; prvInsertBlockIntoFreeList + 8
        0x10040cec:    4602        .F      MOV      r2,r0
        0x10040cee:    6843        Ch      LDR      r3,[r0,#4]
        0x10040cf0:    4413        .D      ADD      r3,r3,r2
        0x10040cf2:    428b        .B      CMP      r3,r1
        0x10040cf4:    d104        ..      BNE      0x10040d00 ; prvInsertBlockIntoFreeList + 36
        0x10040cf6:    6843        Ch      LDR      r3,[r0,#4]
        0x10040cf8:    684c        Lh      LDR      r4,[r1,#4]
        0x10040cfa:    4423        #D      ADD      r3,r3,r4
        0x10040cfc:    6043        C`      STR      r3,[r0,#4]
        0x10040cfe:    4601        .F      MOV      r1,r0
        0x10040d00:    460a        .F      MOV      r2,r1
        0x10040d02:    684b        Kh      LDR      r3,[r1,#4]
        0x10040d04:    4413        .D      ADD      r3,r3,r2
        0x10040d06:    6804        .h      LDR      r4,[r0,#0]
        0x10040d08:    42a3        .B      CMP      r3,r4
        0x10040d0a:    d111        ..      BNE      0x10040d30 ; prvInsertBlockIntoFreeList + 84
        0x10040d0c:    4c0c        .L      LDR      r4,[pc,#48] ; [0x10040d40] = 0x200000d4
        0x10040d0e:    6803        .h      LDR      r3,[r0,#0]
        0x10040d10:    6824        $h      LDR      r4,[r4,#0]
        0x10040d12:    42a3        .B      CMP      r3,r4
        0x10040d14:    d008        ..      BEQ      0x10040d28 ; prvInsertBlockIntoFreeList + 76
        0x10040d16:    684b        Kh      LDR      r3,[r1,#4]
        0x10040d18:    6804        .h      LDR      r4,[r0,#0]
        0x10040d1a:    6864        dh      LDR      r4,[r4,#4]
        0x10040d1c:    4423        #D      ADD      r3,r3,r4
        0x10040d1e:    604b        K`      STR      r3,[r1,#4]
        0x10040d20:    6803        .h      LDR      r3,[r0,#0]
        0x10040d22:    681b        .h      LDR      r3,[r3,#0]
        0x10040d24:    600b        .`      STR      r3,[r1,#0]
        0x10040d26:    e005        ..      B        0x10040d34 ; prvInsertBlockIntoFreeList + 88
        0x10040d28:    4b05        .K      LDR      r3,[pc,#20] ; [0x10040d40] = 0x200000d4
        0x10040d2a:    681b        .h      LDR      r3,[r3,#0]
        0x10040d2c:    600b        .`      STR      r3,[r1,#0]
        0x10040d2e:    e001        ..      B        0x10040d34 ; prvInsertBlockIntoFreeList + 88
        0x10040d30:    6803        .h      LDR      r3,[r0,#0]
        0x10040d32:    600b        .`      STR      r3,[r1,#0]
        0x10040d34:    4288        .B      CMP      r0,r1
        0x10040d36:    d000        ..      BEQ      0x10040d3a ; prvInsertBlockIntoFreeList + 94
        0x10040d38:    6001        .`      STR      r1,[r0,#0]
        0x10040d3a:    bd10        ..      POP      {r4,pc}
    $d
        0x10040d3c:    200000cc    ...     DCD    536871116
        0x10040d40:    200000d4    ...     DCD    536871124
    $t
    i.prvResetNextTaskUnblockTime
    prvResetNextTaskUnblockTime
        0x10040d44:    490a        .I      LDR      r1,[pc,#40] ; [0x10040d70] = 0x20000090
        0x10040d46:    6809        .h      LDR      r1,[r1,#0]
        0x10040d48:    6809        .h      LDR      r1,[r1,#0]
        0x10040d4a:    b909        ..      CBNZ     r1,0x10040d50 ; prvResetNextTaskUnblockTime + 12
        0x10040d4c:    2101        .!      MOVS     r1,#1
        0x10040d4e:    e000        ..      B        0x10040d52 ; prvResetNextTaskUnblockTime + 14
        0x10040d50:    2100        .!      MOVS     r1,#0
        0x10040d52:    b121        !.      CBZ      r1,0x10040d5e ; prvResetNextTaskUnblockTime + 26
        0x10040d54:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x10040d58:    4a06        .J      LDR      r2,[pc,#24] ; [0x10040d74] = 0x200000bc
        0x10040d5a:    6011        .`      STR      r1,[r2,#0]
        0x10040d5c:    e006        ..      B        0x10040d6c ; prvResetNextTaskUnblockTime + 40
        0x10040d5e:    4904        .I      LDR      r1,[pc,#16] ; [0x10040d70] = 0x20000090
        0x10040d60:    6809        .h      LDR      r1,[r1,#0]
        0x10040d62:    68c9        .h      LDR      r1,[r1,#0xc]
        0x10040d64:    68c8        .h      LDR      r0,[r1,#0xc]
        0x10040d66:    4a03        .J      LDR      r2,[pc,#12] ; [0x10040d74] = 0x200000bc
        0x10040d68:    6841        Ah      LDR      r1,[r0,#4]
        0x10040d6a:    6011        .`      STR      r1,[r2,#0]
        0x10040d6c:    4770        pG      BX       lr
    $d
        0x10040d6e:    0000        ..      DCW    0
        0x10040d70:    20000090    ...     DCD    536871056
        0x10040d74:    200000bc    ...     DCD    536871100
    $t
    i.prvTaskExitError
    prvTaskExitError
        0x10040d78:    bf00        ..      NOP      
        0x10040d7a:    20bf        .       MOVS     r0,#0xbf
        0x10040d7c:    f3808811    ....    MSR      BASEPRI,r0
        0x10040d80:    f3bf8f4f    ..O.    DSB      
        0x10040d84:    f3bf8f6f    ..o.    ISB      
        0x10040d88:    bf00        ..      NOP      
        0x10040d8a:    bf00        ..      NOP      
        0x10040d8c:    e7fe        ..      B        0x10040d8c ; prvTaskExitError + 20
        0x10040d8e:    0000        ..      MOVS     r0,r0
    i.pvPortMalloc
    pvPortMalloc
        0x10040d90:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x10040d94:    4605        .F      MOV      r5,r0
        0x10040d96:    f04f0800    O...    MOV      r8,#0
        0x10040d9a:    f000f991    ....    BL       vTaskSuspendAll ; 0x100410c0
        0x10040d9e:    482b        +H      LDR      r0,[pc,#172] ; [0x10040e4c] = 0x200000d4
        0x10040da0:    6800        .h      LDR      r0,[r0,#0]
        0x10040da2:    b908        ..      CBNZ     r0,0x10040da8 ; pvPortMalloc + 24
        0x10040da4:    f7fffed4    ....    BL       prvHeapInit ; 0x10040b50
        0x10040da8:    4829        )H      LDR      r0,[pc,#164] ; [0x10040e50] = 0x200000e0
        0x10040daa:    6800        .h      LDR      r0,[r0,#0]
        0x10040dac:    4028        (@      ANDS     r0,r0,r5
        0x10040dae:    2800        .(      CMP      r0,#0
        0x10040db0:    d147        G.      BNE      0x10040e42 ; pvPortMalloc + 178
        0x10040db2:    b145        E.      CBZ      r5,0x10040dc6 ; pvPortMalloc + 54
        0x10040db4:    3508        .5      ADDS     r5,r5,#8
        0x10040db6:    f0050007    ....    AND      r0,r5,#7
        0x10040dba:    b120         .      CBZ      r0,0x10040dc6 ; pvPortMalloc + 54
        0x10040dbc:    f0050007    ....    AND      r0,r5,#7
        0x10040dc0:    f1c00008    ....    RSB      r0,r0,#8
        0x10040dc4:    4405        .D      ADD      r5,r5,r0
        0x10040dc6:    2d00        .-      CMP      r5,#0
        0x10040dc8:    d03b        ;.      BEQ      0x10040e42 ; pvPortMalloc + 178
        0x10040dca:    4822        "H      LDR      r0,[pc,#136] ; [0x10040e54] = 0x200000d8
        0x10040dcc:    6800        .h      LDR      r0,[r0,#0]
        0x10040dce:    4285        .B      CMP      r5,r0
        0x10040dd0:    d837        7.      BHI      0x10040e42 ; pvPortMalloc + 178
        0x10040dd2:    4e21        !N      LDR      r6,[pc,#132] ; [0x10040e58] = 0x200000cc
        0x10040dd4:    4630        0F      MOV      r0,r6
        0x10040dd6:    6804        .h      LDR      r4,[r0,#0]
        0x10040dd8:    e001        ..      B        0x10040dde ; pvPortMalloc + 78
        0x10040dda:    4626        &F      MOV      r6,r4
        0x10040ddc:    6824        $h      LDR      r4,[r4,#0]
        0x10040dde:    6860        `h      LDR      r0,[r4,#4]
        0x10040de0:    42a8        .B      CMP      r0,r5
        0x10040de2:    d202        ..      BCS      0x10040dea ; pvPortMalloc + 90
        0x10040de4:    6820         h      LDR      r0,[r4,#0]
        0x10040de6:    2800        .(      CMP      r0,#0
        0x10040de8:    d1f7        ..      BNE      0x10040dda ; pvPortMalloc + 74
        0x10040dea:    4818        .H      LDR      r0,[pc,#96] ; [0x10040e4c] = 0x200000d4
        0x10040dec:    6800        .h      LDR      r0,[r0,#0]
        0x10040dee:    4284        .B      CMP      r4,r0
        0x10040df0:    d027        '.      BEQ      0x10040e42 ; pvPortMalloc + 178
        0x10040df2:    6830        0h      LDR      r0,[r6,#0]
        0x10040df4:    f1000808    ....    ADD      r8,r0,#8
        0x10040df8:    6820         h      LDR      r0,[r4,#0]
        0x10040dfa:    6030        0`      STR      r0,[r6,#0]
        0x10040dfc:    6860        `h      LDR      r0,[r4,#4]
        0x10040dfe:    1b40        @.      SUBS     r0,r0,r5
        0x10040e00:    2810        .(      CMP      r0,#0x10
        0x10040e02:    d907        ..      BLS      0x10040e14 ; pvPortMalloc + 132
        0x10040e04:    1967        g.      ADDS     r7,r4,r5
        0x10040e06:    6860        `h      LDR      r0,[r4,#4]
        0x10040e08:    1b40        @.      SUBS     r0,r0,r5
        0x10040e0a:    6078        x`      STR      r0,[r7,#4]
        0x10040e0c:    6065        e`      STR      r5,[r4,#4]
        0x10040e0e:    4638        8F      MOV      r0,r7
        0x10040e10:    f7ffff64    ..d.    BL       prvInsertBlockIntoFreeList ; 0x10040cdc
        0x10040e14:    490f        .I      LDR      r1,[pc,#60] ; [0x10040e54] = 0x200000d8
        0x10040e16:    6860        `h      LDR      r0,[r4,#4]
        0x10040e18:    6809        .h      LDR      r1,[r1,#0]
        0x10040e1a:    1a08        ..      SUBS     r0,r1,r0
        0x10040e1c:    490d        .I      LDR      r1,[pc,#52] ; [0x10040e54] = 0x200000d8
        0x10040e1e:    6008        .`      STR      r0,[r1,#0]
        0x10040e20:    4608        .F      MOV      r0,r1
        0x10040e22:    6800        .h      LDR      r0,[r0,#0]
        0x10040e24:    490d        .I      LDR      r1,[pc,#52] ; [0x10040e5c] = 0x200000dc
        0x10040e26:    6809        .h      LDR      r1,[r1,#0]
        0x10040e28:    4288        .B      CMP      r0,r1
        0x10040e2a:    d203        ..      BCS      0x10040e34 ; pvPortMalloc + 164
        0x10040e2c:    4809        .H      LDR      r0,[pc,#36] ; [0x10040e54] = 0x200000d8
        0x10040e2e:    6800        .h      LDR      r0,[r0,#0]
        0x10040e30:    490a        .I      LDR      r1,[pc,#40] ; [0x10040e5c] = 0x200000dc
        0x10040e32:    6008        .`      STR      r0,[r1,#0]
        0x10040e34:    4906        .I      LDR      r1,[pc,#24] ; [0x10040e50] = 0x200000e0
        0x10040e36:    6860        `h      LDR      r0,[r4,#4]
        0x10040e38:    6809        .h      LDR      r1,[r1,#0]
        0x10040e3a:    4308        .C      ORRS     r0,r0,r1
        0x10040e3c:    6060        ``      STR      r0,[r4,#4]
        0x10040e3e:    2000        .       MOVS     r0,#0
        0x10040e40:    6020         `      STR      r0,[r4,#0]
        0x10040e42:    f000fa4d    ..M.    BL       xTaskResumeAll ; 0x100412e0
        0x10040e46:    4640        @F      MOV      r0,r8
        0x10040e48:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x10040e4c:    200000d4    ...     DCD    536871124
        0x10040e50:    200000e0    ...     DCD    536871136
        0x10040e54:    200000d8    ...     DCD    536871128
        0x10040e58:    200000cc    ...     DCD    536871116
        0x10040e5c:    200000dc    ...     DCD    536871132
    $t
    i.pxPortInitialiseStack
    pxPortInitialiseStack
        0x10040e60:    1f00        ..      SUBS     r0,r0,#4
        0x10040e62:    f04f7380    O..s    MOV      r3,#0x1000000
        0x10040e66:    6003        .`      STR      r3,[r0,#0]
        0x10040e68:    1f00        ..      SUBS     r0,r0,#4
        0x10040e6a:    f0210301    !...    BIC      r3,r1,#1
        0x10040e6e:    6003        .`      STR      r3,[r0,#0]
        0x10040e70:    1f00        ..      SUBS     r0,r0,#4
        0x10040e72:    4b03        .K      LDR      r3,[pc,#12] ; [0x10040e80] = 0x10040d79
        0x10040e74:    6003        .`      STR      r3,[r0,#0]
        0x10040e76:    3814        .8      SUBS     r0,r0,#0x14
        0x10040e78:    6002        .`      STR      r2,[r0,#0]
        0x10040e7a:    3820         8      SUBS     r0,r0,#0x20
        0x10040e7c:    4770        pG      BX       lr
    $d
        0x10040e7e:    0000        ..      DCW    0
        0x10040e80:    10040d79    y...    DCD    268701049
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x10040e84:    4901        .I      LDR      r1,[pc,#4] ; [0x10040e8c] = 0x40020000
        0x10040e86:    6008        .`      STR      r0,[r1,#0]
        0x10040e88:    4770        pG      BX       lr
    $d
        0x10040e8a:    0000        ..      DCW    0
        0x10040e8c:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x10040e90:    4903        .I      LDR      r1,[pc,#12] ; [0x10040ea0] = 0x40020000
        0x10040e92:    6849        Ih      LDR      r1,[r1,#4]
        0x10040e94:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x10040e98:    4a01        .J      LDR      r2,[pc,#4] ; [0x10040ea0] = 0x40020000
        0x10040e9a:    6051        Q`      STR      r1,[r2,#4]
        0x10040e9c:    4770        pG      BX       lr
    $d
        0x10040e9e:    0000        ..      DCW    0
        0x10040ea0:    40020000    ...@    DCD    1073872896
    $t
    i.uxListRemove
    uxListRemove
        0x10040ea4:    4601        .F      MOV      r1,r0
        0x10040ea6:    690a        .i      LDR      r2,[r1,#0x10]
        0x10040ea8:    e9d13001    ...0    LDRD     r3,r0,[r1,#4]
        0x10040eac:    6098        .`      STR      r0,[r3,#8]
        0x10040eae:    e9d10301    ....    LDRD     r0,r3,[r1,#4]
        0x10040eb2:    6058        X`      STR      r0,[r3,#4]
        0x10040eb4:    6850        Ph      LDR      r0,[r2,#4]
        0x10040eb6:    4288        .B      CMP      r0,r1
        0x10040eb8:    d101        ..      BNE      0x10040ebe ; uxListRemove + 26
        0x10040eba:    6888        .h      LDR      r0,[r1,#8]
        0x10040ebc:    6050        P`      STR      r0,[r2,#4]
        0x10040ebe:    2000        .       MOVS     r0,#0
        0x10040ec0:    6108        .a      STR      r0,[r1,#0x10]
        0x10040ec2:    6810        .h      LDR      r0,[r2,#0]
        0x10040ec4:    1e40        @.      SUBS     r0,r0,#1
        0x10040ec6:    6010        .`      STR      r0,[r2,#0]
        0x10040ec8:    6810        .h      LDR      r0,[r2,#0]
        0x10040eca:    4770        pG      BX       lr
    i.vListInitialise
    vListInitialise
        0x10040ecc:    f1000108    ....    ADD      r1,r0,#8
        0x10040ed0:    6041        A`      STR      r1,[r0,#4]
        0x10040ed2:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x10040ed6:    6081        .`      STR      r1,[r0,#8]
        0x10040ed8:    f1000108    ....    ADD      r1,r0,#8
        0x10040edc:    60c1        .`      STR      r1,[r0,#0xc]
        0x10040ede:    6101        .a      STR      r1,[r0,#0x10]
        0x10040ee0:    2100        .!      MOVS     r1,#0
        0x10040ee2:    6001        .`      STR      r1,[r0,#0]
        0x10040ee4:    4770        pG      BX       lr
    i.vListInitialiseItem
    vListInitialiseItem
        0x10040ee6:    2100        .!      MOVS     r1,#0
        0x10040ee8:    6101        .a      STR      r1,[r0,#0x10]
        0x10040eea:    4770        pG      BX       lr
    i.vListInsert
    vListInsert
        0x10040eec:    b510        ..      PUSH     {r4,lr}
        0x10040eee:    4602        .F      MOV      r2,r0
        0x10040ef0:    680b        .h      LDR      r3,[r1,#0]
        0x10040ef2:    1c5c        \.      ADDS     r4,r3,#1
        0x10040ef4:    b90c        ..      CBNZ     r4,0x10040efa ; vListInsert + 14
        0x10040ef6:    6910        .i      LDR      r0,[r2,#0x10]
        0x10040ef8:    e007        ..      B        0x10040f0a ; vListInsert + 30
        0x10040efa:    f1020008    ....    ADD      r0,r2,#8
        0x10040efe:    e000        ..      B        0x10040f02 ; vListInsert + 22
        0x10040f00:    6840        @h      LDR      r0,[r0,#4]
        0x10040f02:    6844        Dh      LDR      r4,[r0,#4]
        0x10040f04:    6824        $h      LDR      r4,[r4,#0]
        0x10040f06:    429c        .B      CMP      r4,r3
        0x10040f08:    d9fa        ..      BLS      0x10040f00 ; vListInsert + 20
        0x10040f0a:    6844        Dh      LDR      r4,[r0,#4]
        0x10040f0c:    604c        L`      STR      r4,[r1,#4]
        0x10040f0e:    684c        Lh      LDR      r4,[r1,#4]
        0x10040f10:    60a1        .`      STR      r1,[r4,#8]
        0x10040f12:    6088        .`      STR      r0,[r1,#8]
        0x10040f14:    6041        A`      STR      r1,[r0,#4]
        0x10040f16:    610a        .a      STR      r2,[r1,#0x10]
        0x10040f18:    6814        .h      LDR      r4,[r2,#0]
        0x10040f1a:    1c64        d.      ADDS     r4,r4,#1
        0x10040f1c:    6014        .`      STR      r4,[r2,#0]
        0x10040f1e:    bd10        ..      POP      {r4,pc}
    i.vListInsertEnd
    vListInsertEnd
        0x10040f20:    6842        Bh      LDR      r2,[r0,#4]
        0x10040f22:    604a        J`      STR      r2,[r1,#4]
        0x10040f24:    6893        .h      LDR      r3,[r2,#8]
        0x10040f26:    608b        .`      STR      r3,[r1,#8]
        0x10040f28:    6893        .h      LDR      r3,[r2,#8]
        0x10040f2a:    6059        Y`      STR      r1,[r3,#4]
        0x10040f2c:    6091        .`      STR      r1,[r2,#8]
        0x10040f2e:    6108        .a      STR      r0,[r1,#0x10]
        0x10040f30:    6803        .h      LDR      r3,[r0,#0]
        0x10040f32:    1c5b        [.      ADDS     r3,r3,#1
        0x10040f34:    6003        .`      STR      r3,[r0,#0]
        0x10040f36:    4770        pG      BX       lr
    i.vPortEnterCritical
    vPortEnterCritical
        0x10040f38:    bf00        ..      NOP      
        0x10040f3a:    20bf        .       MOVS     r0,#0xbf
        0x10040f3c:    f3808811    ....    MSR      BASEPRI,r0
        0x10040f40:    f3bf8f4f    ..O.    DSB      
        0x10040f44:    f3bf8f6f    ..o.    ISB      
        0x10040f48:    bf00        ..      NOP      
        0x10040f4a:    4803        .H      LDR      r0,[pc,#12] ; [0x10040f58] = 0x200000c8
        0x10040f4c:    6800        .h      LDR      r0,[r0,#0]
        0x10040f4e:    1c40        @.      ADDS     r0,r0,#1
        0x10040f50:    4901        .I      LDR      r1,[pc,#4] ; [0x10040f58] = 0x200000c8
        0x10040f52:    6008        .`      STR      r0,[r1,#0]
        0x10040f54:    4770        pG      BX       lr
    $d
        0x10040f56:    0000        ..      DCW    0
        0x10040f58:    200000c8    ...     DCD    536871112
    $t
    i.vPortExitCritical
    vPortExitCritical
        0x10040f5c:    4806        .H      LDR      r0,[pc,#24] ; [0x10040f78] = 0x200000c8
        0x10040f5e:    6800        .h      LDR      r0,[r0,#0]
        0x10040f60:    1e40        @.      SUBS     r0,r0,#1
        0x10040f62:    4905        .I      LDR      r1,[pc,#20] ; [0x10040f78] = 0x200000c8
        0x10040f64:    6008        .`      STR      r0,[r1,#0]
        0x10040f66:    4608        .F      MOV      r0,r1
        0x10040f68:    6800        .h      LDR      r0,[r0,#0]
        0x10040f6a:    b920         .      CBNZ     r0,0x10040f76 ; vPortExitCritical + 26
        0x10040f6c:    2000        .       MOVS     r0,#0
        0x10040f6e:    f3808811    ....    MSR      BASEPRI,r0
        0x10040f72:    bf00        ..      NOP      
        0x10040f74:    bf00        ..      NOP      
        0x10040f76:    4770        pG      BX       lr
    $d
        0x10040f78:    200000c8    ...     DCD    536871112
    $t
    i.vPortFree
    vPortFree
        0x10040f7c:    b570        p.      PUSH     {r4-r6,lr}
        0x10040f7e:    4606        .F      MOV      r6,r0
        0x10040f80:    4635        5F      MOV      r5,r6
        0x10040f82:    b1d6        ..      CBZ      r6,0x10040fba ; vPortFree + 62
        0x10040f84:    3d08        .=      SUBS     r5,r5,#8
        0x10040f86:    462c        ,F      MOV      r4,r5
        0x10040f88:    490c        .I      LDR      r1,[pc,#48] ; [0x10040fbc] = 0x200000e0
        0x10040f8a:    6860        `h      LDR      r0,[r4,#4]
        0x10040f8c:    6809        .h      LDR      r1,[r1,#0]
        0x10040f8e:    4008        .@      ANDS     r0,r0,r1
        0x10040f90:    b198        ..      CBZ      r0,0x10040fba ; vPortFree + 62
        0x10040f92:    6820         h      LDR      r0,[r4,#0]
        0x10040f94:    b988        ..      CBNZ     r0,0x10040fba ; vPortFree + 62
        0x10040f96:    4909        .I      LDR      r1,[pc,#36] ; [0x10040fbc] = 0x200000e0
        0x10040f98:    6860        `h      LDR      r0,[r4,#4]
        0x10040f9a:    6809        .h      LDR      r1,[r1,#0]
        0x10040f9c:    4388        .C      BICS     r0,r0,r1
        0x10040f9e:    6060        ``      STR      r0,[r4,#4]
        0x10040fa0:    f000f88e    ....    BL       vTaskSuspendAll ; 0x100410c0
        0x10040fa4:    4906        .I      LDR      r1,[pc,#24] ; [0x10040fc0] = 0x200000d8
        0x10040fa6:    6860        `h      LDR      r0,[r4,#4]
        0x10040fa8:    6809        .h      LDR      r1,[r1,#0]
        0x10040faa:    4408        .D      ADD      r0,r0,r1
        0x10040fac:    4904        .I      LDR      r1,[pc,#16] ; [0x10040fc0] = 0x200000d8
        0x10040fae:    6008        .`      STR      r0,[r1,#0]
        0x10040fb0:    4620         F      MOV      r0,r4
        0x10040fb2:    f7fffe93    ....    BL       prvInsertBlockIntoFreeList ; 0x10040cdc
        0x10040fb6:    f000f993    ....    BL       xTaskResumeAll ; 0x100412e0
        0x10040fba:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x10040fbc:    200000e0    ...     DCD    536871136
        0x10040fc0:    200000d8    ...     DCD    536871128
    $t
    i.vPortSetupTimerInterrupt
    vPortSetupTimerInterrupt
        0x10040fc4:    4803        .H      LDR      r0,[pc,#12] ; [0x10040fd4] = 0x1869f
        0x10040fc6:    f04f21e0    O..!    MOV      r1,#0xe000e000
        0x10040fca:    6148        Ha      STR      r0,[r1,#0x14]
        0x10040fcc:    2007        .       MOVS     r0,#7
        0x10040fce:    6108        .a      STR      r0,[r1,#0x10]
        0x10040fd0:    4770        pG      BX       lr
    $d
        0x10040fd2:    0000        ..      DCW    0
        0x10040fd4:    0001869f    ....    DCD    99999
    $t
    i.vTask1
    vTask1
        0x10040fd8:    e006        ..      B        0x10040fe8 ; vTask1 + 16
        0x10040fda:    a004        ..      ADR      r0,{pc}+0x12 ; 0x10040fec
        0x10040fdc:    f7fffb74    ..t.    BL       __0printf$3 ; 0x100406c8
        0x10040fe0:    f44f707a    O.zp    MOV      r0,#0x3e8
        0x10040fe4:    f000f820    .. .    BL       vTaskDelay ; 0x10041028
        0x10040fe8:    e7f7        ..      B        0x10040fda ; vTask1 + 2
    $d
        0x10040fea:    0000        ..      DCW    0
        0x10040fec:    6c6c6548    Hell    DCD    1819043144
        0x10040ff0:    46202c6f    o, F    DCD    1176513647
        0x10040ff4:    52656572    reeR    DCD    1382376818
        0x10040ff8:    7e534f54    TOS~    DCD    2119389012
        0x10040ffc:    2e7e7e7e    ~~~.    DCD    780041854
        0x10041000:    0000000a    ....    DCD    10
    $t
    i.vTask2
    vTask2
        0x10041004:    e006        ..      B        0x10041014 ; vTask2 + 16
        0x10041006:    a004        ..      ADR      r0,{pc}+0x12 ; 0x10041018
        0x10041008:    f7fffb5e    ..^.    BL       __0printf$3 ; 0x100406c8
        0x1004100c:    f44f60fa    O..`    MOV      r0,#0x7d0
        0x10041010:    f000f80a    ....    BL       vTaskDelay ; 0x10041028
        0x10041014:    e7f7        ..      B        0x10041006 ; vTask2 + 2
    $d
        0x10041016:    0000        ..      DCW    0
        0x10041018:    65732032    2 se    DCD    1702043698
        0x1004101c:    646e6f63    cond    DCD    1684959075
        0x10041020:    a1a3a1a3    ....    DCD    2711855523
        0x10041024:    00000a2e    ....    DCD    2606
    $t
    i.vTaskDelay
    vTaskDelay
        0x10041028:    b570        p.      PUSH     {r4-r6,lr}
        0x1004102a:    4604        .F      MOV      r4,r0
        0x1004102c:    2500        .%      MOVS     r5,#0
        0x1004102e:    b144        D.      CBZ      r4,0x10041042 ; vTaskDelay + 26
        0x10041030:    f000f846    ..F.    BL       vTaskSuspendAll ; 0x100410c0
        0x10041034:    2100        .!      MOVS     r1,#0
        0x10041036:    4620         F      MOV      r0,r4
        0x10041038:    f7fffca8    ....    BL       prvAddCurrentTaskToDelayedList ; 0x1004098c
        0x1004103c:    f000f950    ..P.    BL       xTaskResumeAll ; 0x100412e0
        0x10041040:    4605        .F      MOV      r5,r0
        0x10041042:    b93d        =.      CBNZ     r5,0x10041054 ; vTaskDelay + 44
        0x10041044:    f04f5080    O..P    MOV      r0,#0x10000000
        0x10041048:    4903        .I      LDR      r1,[pc,#12] ; [0x10041058] = 0xe000ed04
        0x1004104a:    6008        .`      STR      r0,[r1,#0]
        0x1004104c:    f3bf8f4f    ..O.    DSB      
        0x10041050:    f3bf8f6f    ..o.    ISB      
        0x10041054:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x10041056:    0000        ..      DCW    0
        0x10041058:    e000ed04    ....    DCD    3758157060
    $t
    i.vTaskStartScheduler
    vTaskStartScheduler
        0x1004105c:    b51c        ..      PUSH     {r2-r4,lr}
        0x1004105e:    4811        .H      LDR      r0,[pc,#68] ; [0x100410a4] = 0x200000c0
        0x10041060:    2100        .!      MOVS     r1,#0
        0x10041062:    460b        .F      MOV      r3,r1
        0x10041064:    2280        ."      MOVS     r2,#0x80
        0x10041066:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x1004106a:    a10f        ..      ADR      r1,{pc}+0x3e ; 0x100410a8
        0x1004106c:    4810        .H      LDR      r0,[pc,#64] ; [0x100410b0] = 0x10040bcd
        0x1004106e:    f000f879    ..y.    BL       xTaskCreate ; 0x10041164
        0x10041072:    4604        .F      MOV      r4,r0
        0x10041074:    2c01        .,      CMP      r4,#1
        0x10041076:    d114        ..      BNE      0x100410a2 ; vTaskStartScheduler + 70
        0x10041078:    bf00        ..      NOP      
        0x1004107a:    20bf        .       MOVS     r0,#0xbf
        0x1004107c:    f3808811    ....    MSR      BASEPRI,r0
        0x10041080:    f3bf8f4f    ..O.    DSB      
        0x10041084:    f3bf8f6f    ..o.    ISB      
        0x10041088:    bf00        ..      NOP      
        0x1004108a:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x1004108e:    4909        .I      LDR      r1,[pc,#36] ; [0x100410b4] = 0x200000bc
        0x10041090:    6008        .`      STR      r0,[r1,#0]
        0x10041092:    2001        .       MOVS     r0,#1
        0x10041094:    4908        .I      LDR      r1,[pc,#32] ; [0x100410b8] = 0x200000a8
        0x10041096:    6008        .`      STR      r0,[r1,#0]
        0x10041098:    2000        .       MOVS     r0,#0
        0x1004109a:    4908        .I      LDR      r1,[pc,#32] ; [0x100410bc] = 0x200000a0
        0x1004109c:    6008        .`      STR      r0,[r1,#0]
        0x1004109e:    f000f847    ..G.    BL       xPortStartScheduler ; 0x10041130
        0x100410a2:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x100410a4:    200000c0    ...     DCD    536871104
        0x100410a8:    454c4449    IDLE    DCD    1162626121
        0x100410ac:    00000000    ....    DCD    0
        0x100410b0:    10040bcd    ....    DCD    268700621
        0x100410b4:    200000bc    ...     DCD    536871100
        0x100410b8:    200000a8    ...     DCD    536871080
        0x100410bc:    200000a0    ...     DCD    536871072
    $t
    i.vTaskSuspendAll
    vTaskSuspendAll
        0x100410c0:    4802        .H      LDR      r0,[pc,#8] ; [0x100410cc] = 0x200000c4
        0x100410c2:    6800        .h      LDR      r0,[r0,#0]
        0x100410c4:    1c40        @.      ADDS     r0,r0,#1
        0x100410c6:    4901        .I      LDR      r1,[pc,#4] ; [0x100410cc] = 0x200000c4
        0x100410c8:    6008        .`      STR      r0,[r1,#0]
        0x100410ca:    4770        pG      BX       lr
    $d
        0x100410cc:    200000c4    ...     DCD    536871108
    $t
    i.vTaskSwitchContext
    vTaskSwitchContext
        0x100410d0:    4812        .H      LDR      r0,[pc,#72] ; [0x1004111c] = 0x200000c4
        0x100410d2:    6800        .h      LDR      r0,[r0,#0]
        0x100410d4:    b118        ..      CBZ      r0,0x100410de ; vTaskSwitchContext + 14
        0x100410d6:    2001        .       MOVS     r0,#1
        0x100410d8:    4911        .I      LDR      r1,[pc,#68] ; [0x10041120] = 0x200000b0
        0x100410da:    6008        .`      STR      r0,[r1,#0]
        0x100410dc:    e01d        ..      B        0x1004111a ; vTaskSwitchContext + 74
        0x100410de:    2000        .       MOVS     r0,#0
        0x100410e0:    490f        .I      LDR      r1,[pc,#60] ; [0x10041120] = 0x200000b0
        0x100410e2:    6008        .`      STR      r0,[r1,#0]
        0x100410e4:    480f        .H      LDR      r0,[pc,#60] ; [0x10041124] = 0x200000a4
        0x100410e6:    6800        .h      LDR      r0,[r0,#0]
        0x100410e8:    fab0f080    ....    CLZ      r0,r0
        0x100410ec:    f1c0011f    ....    RSB      r1,r0,#0x1f
        0x100410f0:    eb010281    ....    ADD      r2,r1,r1,LSL #2
        0x100410f4:    4b0c        .K      LDR      r3,[pc,#48] ; [0x10041128] = 0x200000e8
        0x100410f6:    eb030082    ....    ADD      r0,r3,r2,LSL #2
        0x100410fa:    6842        Bh      LDR      r2,[r0,#4]
        0x100410fc:    6852        Rh      LDR      r2,[r2,#4]
        0x100410fe:    6042        B`      STR      r2,[r0,#4]
        0x10041100:    f1000208    ....    ADD      r2,r0,#8
        0x10041104:    6843        Ch      LDR      r3,[r0,#4]
        0x10041106:    4293        .B      CMP      r3,r2
        0x10041108:    d102        ..      BNE      0x10041110 ; vTaskSwitchContext + 64
        0x1004110a:    6842        Bh      LDR      r2,[r0,#4]
        0x1004110c:    6852        Rh      LDR      r2,[r2,#4]
        0x1004110e:    6042        B`      STR      r2,[r0,#4]
        0x10041110:    6842        Bh      LDR      r2,[r0,#4]
        0x10041112:    68d2        .h      LDR      r2,[r2,#0xc]
        0x10041114:    4b05        .K      LDR      r3,[pc,#20] ; [0x1004112c] = 0x2000008c
        0x10041116:    601a        .`      STR      r2,[r3,#0]
        0x10041118:    bf00        ..      NOP      
        0x1004111a:    4770        pG      BX       lr
    $d
        0x1004111c:    200000c4    ...     DCD    536871108
        0x10041120:    200000b0    ...     DCD    536871088
        0x10041124:    200000a4    ...     DCD    536871076
        0x10041128:    200000e8    ...     DCD    536871144
        0x1004112c:    2000008c    ...     DCD    536871052
    $t
    i.xPortStartScheduler
    xPortStartScheduler
        0x10041130:    b510        ..      PUSH     {r4,lr}
        0x10041132:    480a        .H      LDR      r0,[pc,#40] ; [0x1004115c] = 0xe000ed20
        0x10041134:    6800        .h      LDR      r0,[r0,#0]
        0x10041136:    f440007f    @...    ORR      r0,r0,#0xff0000
        0x1004113a:    4908        .I      LDR      r1,[pc,#32] ; [0x1004115c] = 0xe000ed20
        0x1004113c:    6008        .`      STR      r0,[r1,#0]
        0x1004113e:    4608        .F      MOV      r0,r1
        0x10041140:    6800        .h      LDR      r0,[r0,#0]
        0x10041142:    f040407f    @..@    ORR      r0,r0,#0xff000000
        0x10041146:    6008        .`      STR      r0,[r1,#0]
        0x10041148:    f7ffff3c    ..<.    BL       vPortSetupTimerInterrupt ; 0x10040fc4
        0x1004114c:    2000        .       MOVS     r0,#0
        0x1004114e:    4904        .I      LDR      r1,[pc,#16] ; [0x10041160] = 0x200000c8
        0x10041150:    6008        .`      STR      r0,[r1,#0]
        0x10041152:    f7feffb5    ....    BL       __asm___6_port_c_39a90d8d__prvStartFirstTask ; 0x100400c0
        0x10041156:    2000        .       MOVS     r0,#0
        0x10041158:    bd10        ..      POP      {r4,pc}
    $d
        0x1004115a:    0000        ..      DCW    0
        0x1004115c:    e000ed20     ...    DCD    3758157088
        0x10041160:    200000c8    ...     DCD    536871112
    $t
    i.xTaskCreate
    xTaskCreate
        0x10041164:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x10041168:    b085        ..      SUB      sp,sp,#0x14
        0x1004116a:    4680        .F      MOV      r8,r0
        0x1004116c:    4689        .F      MOV      r9,r1
        0x1004116e:    4617        .F      MOV      r7,r2
        0x10041170:    e9ddab12    ....    LDRD     r10,r11,[sp,#0x48]
        0x10041174:    00b8        ..      LSLS     r0,r7,#2
        0x10041176:    f7fffe0b    ....    BL       pvPortMalloc ; 0x10040d90
        0x1004117a:    4606        .F      MOV      r6,r0
        0x1004117c:    b156        V.      CBZ      r6,0x10041194 ; xTaskCreate + 48
        0x1004117e:    204c        L       MOVS     r0,#0x4c
        0x10041180:    f7fffe06    ....    BL       pvPortMalloc ; 0x10040d90
        0x10041184:    4604        .F      MOV      r4,r0
        0x10041186:    b10c        ..      CBZ      r4,0x1004118c ; xTaskCreate + 40
        0x10041188:    6326        &c      STR      r6,[r4,#0x30]
        0x1004118a:    e004        ..      B        0x10041196 ; xTaskCreate + 50
        0x1004118c:    4630        0F      MOV      r0,r6
        0x1004118e:    f7fffef5    ....    BL       vPortFree ; 0x10040f7c
        0x10041192:    e000        ..      B        0x10041196 ; xTaskCreate + 50
        0x10041194:    2400        .$      MOVS     r4,#0
        0x10041196:    b17c        |.      CBZ      r4,0x100411b8 ; xTaskCreate + 84
        0x10041198:    2000        .       MOVS     r0,#0
        0x1004119a:    e9cdab00    ....    STRD     r10,r11,[sp,#0]
        0x1004119e:    e9cd4002    ...@    STRD     r4,r0,[sp,#8]
        0x100411a2:    463a        :F      MOV      r2,r7
        0x100411a4:    4649        IF      MOV      r1,r9
        0x100411a6:    4640        @F      MOV      r0,r8
        0x100411a8:    9b08        ..      LDR      r3,[sp,#0x20]
        0x100411aa:    f7fffd23    ..#.    BL       prvInitialiseNewTask ; 0x10040bf4
        0x100411ae:    4620         F      MOV      r0,r4
        0x100411b0:    f7fffc38    ..8.    BL       prvAddNewTaskToReadyList ; 0x10040a24
        0x100411b4:    2501        .%      MOVS     r5,#1
        0x100411b6:    e001        ..      B        0x100411bc ; xTaskCreate + 88
        0x100411b8:    f04f35ff    O..5    MOV      r5,#0xffffffff
        0x100411bc:    4628        (F      MOV      r0,r5
        0x100411be:    b009        ..      ADD      sp,sp,#0x24
        0x100411c0:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.xTaskIncrementTick
    xTaskIncrementTick
        0x100411c4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x100411c8:    2700        .'      MOVS     r7,#0
        0x100411ca:    483a        :H      LDR      r0,[pc,#232] ; [0x100412b4] = 0x200000c4
        0x100411cc:    6800        .h      LDR      r0,[r0,#0]
        0x100411ce:    2800        .(      CMP      r0,#0
        0x100411d0:    d163        c.      BNE      0x1004129a ; xTaskIncrementTick + 214
        0x100411d2:    4839        9H      LDR      r0,[pc,#228] ; [0x100412b8] = 0x200000a0
        0x100411d4:    6800        .h      LDR      r0,[r0,#0]
        0x100411d6:    1c45        E.      ADDS     r5,r0,#1
        0x100411d8:    4837        7H      LDR      r0,[pc,#220] ; [0x100412b8] = 0x200000a0
        0x100411da:    6005        .`      STR      r5,[r0,#0]
        0x100411dc:    b98d        ..      CBNZ     r5,0x10041202 ; xTaskIncrementTick + 62
        0x100411de:    4837        7H      LDR      r0,[pc,#220] ; [0x100412bc] = 0x20000090
        0x100411e0:    f8d08000    ....    LDR      r8,[r0,#0]
        0x100411e4:    4836        6H      LDR      r0,[pc,#216] ; [0x100412c0] = 0x20000094
        0x100411e6:    6800        .h      LDR      r0,[r0,#0]
        0x100411e8:    4934        4I      LDR      r1,[pc,#208] ; [0x100412bc] = 0x20000090
        0x100411ea:    6008        .`      STR      r0,[r1,#0]
        0x100411ec:    4834        4H      LDR      r0,[pc,#208] ; [0x100412c0] = 0x20000094
        0x100411ee:    f8c08000    ....    STR      r8,[r0,#0]
        0x100411f2:    4834        4H      LDR      r0,[pc,#208] ; [0x100412c4] = 0x200000b4
        0x100411f4:    6800        .h      LDR      r0,[r0,#0]
        0x100411f6:    1c40        @.      ADDS     r0,r0,#1
        0x100411f8:    4932        2I      LDR      r1,[pc,#200] ; [0x100412c4] = 0x200000b4
        0x100411fa:    6008        .`      STR      r0,[r1,#0]
        0x100411fc:    f7fffda2    ....    BL       prvResetNextTaskUnblockTime ; 0x10040d44
        0x10041200:    bf00        ..      NOP      
        0x10041202:    4831        1H      LDR      r0,[pc,#196] ; [0x100412c8] = 0x200000bc
        0x10041204:    6800        .h      LDR      r0,[r0,#0]
        0x10041206:    4285        .B      CMP      r5,r0
        0x10041208:    d33b        ;.      BCC      0x10041282 ; xTaskIncrementTick + 190
        0x1004120a:    bf00        ..      NOP      
        0x1004120c:    482b        +H      LDR      r0,[pc,#172] ; [0x100412bc] = 0x20000090
        0x1004120e:    6800        .h      LDR      r0,[r0,#0]
        0x10041210:    6800        .h      LDR      r0,[r0,#0]
        0x10041212:    b908        ..      CBNZ     r0,0x10041218 ; xTaskIncrementTick + 84
        0x10041214:    2001        .       MOVS     r0,#1
        0x10041216:    e000        ..      B        0x1004121a ; xTaskIncrementTick + 86
        0x10041218:    2000        .       MOVS     r0,#0
        0x1004121a:    b120         .      CBZ      r0,0x10041226 ; xTaskIncrementTick + 98
        0x1004121c:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x10041220:    4929        )I      LDR      r1,[pc,#164] ; [0x100412c8] = 0x200000bc
        0x10041222:    6008        .`      STR      r0,[r1,#0]
        0x10041224:    e02c        ,.      B        0x10041280 ; xTaskIncrementTick + 188
        0x10041226:    4825        %H      LDR      r0,[pc,#148] ; [0x100412bc] = 0x20000090
        0x10041228:    6800        .h      LDR      r0,[r0,#0]
        0x1004122a:    68c0        .h      LDR      r0,[r0,#0xc]
        0x1004122c:    68c4        .h      LDR      r4,[r0,#0xc]
        0x1004122e:    6866        fh      LDR      r6,[r4,#4]
        0x10041230:    42b5        .B      CMP      r5,r6
        0x10041232:    d202        ..      BCS      0x1004123a ; xTaskIncrementTick + 118
        0x10041234:    4824        $H      LDR      r0,[pc,#144] ; [0x100412c8] = 0x200000bc
        0x10041236:    6006        .`      STR      r6,[r0,#0]
        0x10041238:    e022        ".      B        0x10041280 ; xTaskIncrementTick + 188
        0x1004123a:    1d20         .      ADDS     r0,r4,#4
        0x1004123c:    f7fffe32    ..2.    BL       uxListRemove ; 0x10040ea4
        0x10041240:    6aa0        .j      LDR      r0,[r4,#0x28]
        0x10041242:    b118        ..      CBZ      r0,0x1004124c ; xTaskIncrementTick + 136
        0x10041244:    f1040018    ....    ADD      r0,r4,#0x18
        0x10041248:    f7fffe2c    ..,.    BL       uxListRemove ; 0x10040ea4
        0x1004124c:    f894102c    ..,.    LDRB     r1,[r4,#0x2c]
        0x10041250:    2001        .       MOVS     r0,#1
        0x10041252:    4088        .@      LSLS     r0,r0,r1
        0x10041254:    491d        .I      LDR      r1,[pc,#116] ; [0x100412cc] = 0x200000a4
        0x10041256:    6809        .h      LDR      r1,[r1,#0]
        0x10041258:    4308        .C      ORRS     r0,r0,r1
        0x1004125a:    491c        .I      LDR      r1,[pc,#112] ; [0x100412cc] = 0x200000a4
        0x1004125c:    6008        .`      STR      r0,[r1,#0]
        0x1004125e:    6ae1        .j      LDR      r1,[r4,#0x2c]
        0x10041260:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x10041264:    4a1a        .J      LDR      r2,[pc,#104] ; [0x100412d0] = 0x200000e8
        0x10041266:    eb020081    ....    ADD      r0,r2,r1,LSL #2
        0x1004126a:    1d21        !.      ADDS     r1,r4,#4
        0x1004126c:    f7fffe58    ..X.    BL       vListInsertEnd ; 0x10040f20
        0x10041270:    4918        .I      LDR      r1,[pc,#96] ; [0x100412d4] = 0x2000008c
        0x10041272:    6ae0        .j      LDR      r0,[r4,#0x2c]
        0x10041274:    6809        .h      LDR      r1,[r1,#0]
        0x10041276:    6ac9        .j      LDR      r1,[r1,#0x2c]
        0x10041278:    4288        .B      CMP      r0,r1
        0x1004127a:    d3c7        ..      BCC      0x1004120c ; xTaskIncrementTick + 72
        0x1004127c:    2701        .'      MOVS     r7,#1
        0x1004127e:    e7c5        ..      B        0x1004120c ; xTaskIncrementTick + 72
        0x10041280:    bf00        ..      NOP      
        0x10041282:    4814        .H      LDR      r0,[pc,#80] ; [0x100412d4] = 0x2000008c
        0x10041284:    6800        .h      LDR      r0,[r0,#0]
        0x10041286:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x10041288:    eb000080    ....    ADD      r0,r0,r0,LSL #2
        0x1004128c:    4910        .I      LDR      r1,[pc,#64] ; [0x100412d0] = 0x200000e8
        0x1004128e:    f8510020    Q. .    LDR      r0,[r1,r0,LSL #2]
        0x10041292:    2801        .(      CMP      r0,#1
        0x10041294:    d900        ..      BLS      0x10041298 ; xTaskIncrementTick + 212
        0x10041296:    2701        .'      MOVS     r7,#1
        0x10041298:    e004        ..      B        0x100412a4 ; xTaskIncrementTick + 224
        0x1004129a:    480f        .H      LDR      r0,[pc,#60] ; [0x100412d8] = 0x200000ac
        0x1004129c:    6800        .h      LDR      r0,[r0,#0]
        0x1004129e:    1c40        @.      ADDS     r0,r0,#1
        0x100412a0:    490d        .I      LDR      r1,[pc,#52] ; [0x100412d8] = 0x200000ac
        0x100412a2:    6008        .`      STR      r0,[r1,#0]
        0x100412a4:    480d        .H      LDR      r0,[pc,#52] ; [0x100412dc] = 0x200000b0
        0x100412a6:    6800        .h      LDR      r0,[r0,#0]
        0x100412a8:    b100        ..      CBZ      r0,0x100412ac ; xTaskIncrementTick + 232
        0x100412aa:    2701        .'      MOVS     r7,#1
        0x100412ac:    4638        8F      MOV      r0,r7
        0x100412ae:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x100412b2:    0000        ..      DCW    0
        0x100412b4:    200000c4    ...     DCD    536871108
        0x100412b8:    200000a0    ...     DCD    536871072
        0x100412bc:    20000090    ...     DCD    536871056
        0x100412c0:    20000094    ...     DCD    536871060
        0x100412c4:    200000b4    ...     DCD    536871092
        0x100412c8:    200000bc    ...     DCD    536871100
        0x100412cc:    200000a4    ...     DCD    536871076
        0x100412d0:    200000e8    ...     DCD    536871144
        0x100412d4:    2000008c    ...     DCD    536871052
        0x100412d8:    200000ac    ...     DCD    536871084
        0x100412dc:    200000b0    ...     DCD    536871088
    $t
    i.xTaskResumeAll
    xTaskResumeAll
        0x100412e0:    b570        p.      PUSH     {r4-r6,lr}
        0x100412e2:    2400        .$      MOVS     r4,#0
        0x100412e4:    2600        .&      MOVS     r6,#0
        0x100412e6:    f7fffe27    ..'.    BL       vPortEnterCritical ; 0x10040f38
        0x100412ea:    482e        .H      LDR      r0,[pc,#184] ; [0x100413a4] = 0x200000c4
        0x100412ec:    6800        .h      LDR      r0,[r0,#0]
        0x100412ee:    1e40        @.      SUBS     r0,r0,#1
        0x100412f0:    492c        ,I      LDR      r1,[pc,#176] ; [0x100413a4] = 0x200000c4
        0x100412f2:    6008        .`      STR      r0,[r1,#0]
        0x100412f4:    4608        .F      MOV      r0,r1
        0x100412f6:    6800        .h      LDR      r0,[r0,#0]
        0x100412f8:    2800        .(      CMP      r0,#0
        0x100412fa:    d14f        O.      BNE      0x1004139c ; xTaskResumeAll + 188
        0x100412fc:    482a        *H      LDR      r0,[pc,#168] ; [0x100413a8] = 0x2000009c
        0x100412fe:    6800        .h      LDR      r0,[r0,#0]
        0x10041300:    2800        .(      CMP      r0,#0
        0x10041302:    d04b        K.      BEQ      0x1004139c ; xTaskResumeAll + 188
        0x10041304:    e024        $.      B        0x10041350 ; xTaskResumeAll + 112
        0x10041306:    4829        )H      LDR      r0,[pc,#164] ; [0x100413ac] = 0x20000174
        0x10041308:    68c0        .h      LDR      r0,[r0,#0xc]
        0x1004130a:    68c4        .h      LDR      r4,[r0,#0xc]
        0x1004130c:    f1040018    ....    ADD      r0,r4,#0x18
        0x10041310:    f7fffdc8    ....    BL       uxListRemove ; 0x10040ea4
        0x10041314:    1d20         .      ADDS     r0,r4,#4
        0x10041316:    f7fffdc5    ....    BL       uxListRemove ; 0x10040ea4
        0x1004131a:    f894102c    ..,.    LDRB     r1,[r4,#0x2c]
        0x1004131e:    2001        .       MOVS     r0,#1
        0x10041320:    4088        .@      LSLS     r0,r0,r1
        0x10041322:    4923        #I      LDR      r1,[pc,#140] ; [0x100413b0] = 0x200000a4
        0x10041324:    6809        .h      LDR      r1,[r1,#0]
        0x10041326:    4308        .C      ORRS     r0,r0,r1
        0x10041328:    4921        !I      LDR      r1,[pc,#132] ; [0x100413b0] = 0x200000a4
        0x1004132a:    6008        .`      STR      r0,[r1,#0]
        0x1004132c:    6ae1        .j      LDR      r1,[r4,#0x2c]
        0x1004132e:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x10041332:    4a20         J      LDR      r2,[pc,#128] ; [0x100413b4] = 0x200000e8
        0x10041334:    eb020081    ....    ADD      r0,r2,r1,LSL #2
        0x10041338:    1d21        !.      ADDS     r1,r4,#4
        0x1004133a:    f7fffdf1    ....    BL       vListInsertEnd ; 0x10040f20
        0x1004133e:    491e        .I      LDR      r1,[pc,#120] ; [0x100413b8] = 0x2000008c
        0x10041340:    6ae0        .j      LDR      r0,[r4,#0x2c]
        0x10041342:    6809        .h      LDR      r1,[r1,#0]
        0x10041344:    6ac9        .j      LDR      r1,[r1,#0x2c]
        0x10041346:    4288        .B      CMP      r0,r1
        0x10041348:    d302        ..      BCC      0x10041350 ; xTaskResumeAll + 112
        0x1004134a:    2001        .       MOVS     r0,#1
        0x1004134c:    491b        .I      LDR      r1,[pc,#108] ; [0x100413bc] = 0x200000b0
        0x1004134e:    6008        .`      STR      r0,[r1,#0]
        0x10041350:    4816        .H      LDR      r0,[pc,#88] ; [0x100413ac] = 0x20000174
        0x10041352:    6800        .h      LDR      r0,[r0,#0]
        0x10041354:    b908        ..      CBNZ     r0,0x1004135a ; xTaskResumeAll + 122
        0x10041356:    2001        .       MOVS     r0,#1
        0x10041358:    e000        ..      B        0x1004135c ; xTaskResumeAll + 124
        0x1004135a:    2000        .       MOVS     r0,#0
        0x1004135c:    2800        .(      CMP      r0,#0
        0x1004135e:    d0d2        ..      BEQ      0x10041306 ; xTaskResumeAll + 38
        0x10041360:    b10c        ..      CBZ      r4,0x10041366 ; xTaskResumeAll + 134
        0x10041362:    f7fffcef    ....    BL       prvResetNextTaskUnblockTime ; 0x10040d44
        0x10041366:    4816        .H      LDR      r0,[pc,#88] ; [0x100413c0] = 0x200000ac
        0x10041368:    6805        .h      LDR      r5,[r0,#0]
        0x1004136a:    b165        e.      CBZ      r5,0x10041386 ; xTaskResumeAll + 166
        0x1004136c:    bf00        ..      NOP      
        0x1004136e:    f7ffff29    ..).    BL       xTaskIncrementTick ; 0x100411c4
        0x10041372:    b110        ..      CBZ      r0,0x1004137a ; xTaskResumeAll + 154
        0x10041374:    2001        .       MOVS     r0,#1
        0x10041376:    4911        .I      LDR      r1,[pc,#68] ; [0x100413bc] = 0x200000b0
        0x10041378:    6008        .`      STR      r0,[r1,#0]
        0x1004137a:    1e6d        m.      SUBS     r5,r5,#1
        0x1004137c:    2d00        .-      CMP      r5,#0
        0x1004137e:    d1f6        ..      BNE      0x1004136e ; xTaskResumeAll + 142
        0x10041380:    2000        .       MOVS     r0,#0
        0x10041382:    490f        .I      LDR      r1,[pc,#60] ; [0x100413c0] = 0x200000ac
        0x10041384:    6008        .`      STR      r0,[r1,#0]
        0x10041386:    480d        .H      LDR      r0,[pc,#52] ; [0x100413bc] = 0x200000b0
        0x10041388:    6800        .h      LDR      r0,[r0,#0]
        0x1004138a:    b138        8.      CBZ      r0,0x1004139c ; xTaskResumeAll + 188
        0x1004138c:    2601        .&      MOVS     r6,#1
        0x1004138e:    0730        0.      LSLS     r0,r6,#28
        0x10041390:    490c        .I      LDR      r1,[pc,#48] ; [0x100413c4] = 0xe000ed04
        0x10041392:    6008        .`      STR      r0,[r1,#0]
        0x10041394:    f3bf8f4f    ..O.    DSB      
        0x10041398:    f3bf8f6f    ..o.    ISB      
        0x1004139c:    f7fffdde    ....    BL       vPortExitCritical ; 0x10040f5c
        0x100413a0:    4630        0F      MOV      r0,r6
        0x100413a2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x100413a4:    200000c4    ...     DCD    536871108
        0x100413a8:    2000009c    ...     DCD    536871068
        0x100413ac:    20000174    t..     DCD    536871284
        0x100413b0:    200000a4    ...     DCD    536871076
        0x100413b4:    200000e8    ...     DCD    536871144
        0x100413b8:    2000008c    ...     DCD    536871052
        0x100413bc:    200000b0    ...     DCD    536871088
        0x100413c0:    200000ac    ...     DCD    536871084
        0x100413c4:    e000ed04    ....    DCD    3758157060
    $d.realdata
    Region$$Table$$Base
        0x100413c8:    10040000    ....    DCD    268697600
        0x100413cc:    20000000    ...     DCD    536870912
        0x100413d0:    00000088    ....    DCD    136
        0x100413d4:    10040728    (...    DCD    268699432
        0x100413d8:    100413f8    ....    DCD    268702712
        0x100413dc:    20000088    ...     DCD    536871048
        0x100413e0:    00000060    `...    DCD    96
        0x100413e4:    10040728    (...    DCD    268699432
        0x100413e8:    10041458    X...    DCD    268702808
        0x100413ec:    200000e8    ...     DCD    536871144
        0x100413f0:    00002980    .)..    DCD    10624
        0x100413f4:    10040738    8...    DCD    268699448
    Region$$Table$$Limit

====================================

** Section #3

    Name        : DATA_IN_RAM
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000088
    File Offset : 5164 (0x142c)
    Size        : 96 bytes (0x60)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #4

    Name        : DATA_IN_RAM
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x200000e8
    File Offset : 5260 (0x148c)
    Size        : 10624 bytes (0x2980)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 8
    Entry Size  : 0


====================================

** Section #5

    Name        : .debug_abbrev
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 5260 (0x148c)
    Size        : 1476 bytes (0x5c4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #6

    Name        : .debug_frame
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 6736 (0x1a50)
    Size        : 2068 bytes (0x814)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #7

    Name        : .debug_info
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 8804 (0x2264)
    Size        : 57400 bytes (0xe038)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #8

    Name        : .debug_line
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 66204 (0x1029c)
    Size        : 11844 bytes (0x2e44)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #9

    Name        : .debug_loc
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 78048 (0x130e0)
    Size        : 3232 bytes (0xca0)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #10

    Name        : .debug_macinfo
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 81280 (0x13d80)
    Size        : 22188 bytes (0x56ac)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #11

    Name        : .debug_pubnames
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 103468 (0x1942c)
    Size        : 1506 bytes (0x5e2)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #12

    Name        : .symtab
    Type        : SHT_SYMTAB (0x00000002)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 104976 (0x19a10)
    Size        : 6768 bytes (0x1a70)
    Link        : Section 13 (.strtab)
    Info        : Last local symbol no = 284
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #13

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 111744 (0x1b480)
    Size        : 5844 bytes (0x16d4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #14

    Name        : .note
    Type        : SHT_NOTE (0x00000007)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 117588 (0x1cb54)
    Size        : 32 bytes (0x20)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

        Section     Segment
    ====================================

              1           0
              2           0
              3           0
              4           0

====================================

** Section #15

    Name        : .comment
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 117620 (0x1cb74)
    Size        : 14904 bytes (0x3a38)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0

    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    ArmLink --strict --library_type=microlib --callgraph --map --symbols --xref --diag_suppress=9931 --cpu=Cortex-M3 --fpu=SoftVFP --list=.\Listings\helloworld.map --output=.\Objects\helloworld.axf --scatter=.\elf2_example.sct --info=summarysizes,sizes,totals,unused,veneers

    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\h_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\m_ws.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\mc_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\mf_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\vfpsupport.l
    Input Comments:
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p2638-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2638-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    list.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\list.o --depend=.\objects\list.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\list.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\list.c
    
    queue.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\queue.o --depend=.\objects\queue.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\queue.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\queue.c
    
    tasks.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\tasks.o --depend=.\objects\tasks.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\tasks.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\tasks.c
    
    timers.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\timers.o --depend=.\objects\timers.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\timers.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\timers.c
    
    port.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\port.o --vfemode=force

    Input Comments:
    
    p2aa8-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2aa8-2
    
    
    
    port.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\port.o --depend=.\objects\port.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\port.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3\port.c
    
    
    
    
    
    heap_4.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\heap_4.o --depend=.\objects\heap_4.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\heap_4.crf ..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\MemMang\heap_4.c
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\include -I..\..\..\ELF2_BSP\FreeRTOSv9.0.0\FreeRTOS\Source\portable\Keil\ARM_CM3 -IF:\Anlogic_MCU\Release_To_Custom\V20180709\Anlogic_MCU_Pkg\Demo\FreeRTOS\Helloworld\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__MICROLIB -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\syscon.o --vfemode=force

    Input Comments:
    
    p2e50-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2e50-2
    
    
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\syscon.o --depend=.\objects\syscon.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IE:\新建文件夹\新建文件夹\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\syscon.crf ..\sdk\src\soc\driver\syscon.c
    
    
    
    
    

====================================

** Section #16

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 132524 (0x205ac)
    Size        : 196 bytes (0xc4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x200021b0  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x200021b0  0x10       _SEGGER_RTT.acID                         array[16] of char
0x200021c0  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x200021c4  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x200021c8  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x20002210  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x20002658  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x20002258  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x200000e4  0x4        __stdout                                 FILE
0x200000e4  0x4        __stdout.handle                          int

address     size       variable name                            type
0x200000d4  0x4        pxEnd                                    pointer to BlockLink_t

address     size       variable name                            type
0x200001b0  0x2000     ucHeap                                   array[8192] of uint8_t

address     size       variable name                            type
0x200000e0  0x4        xBlockAllocatedBit                       size_t

address     size       variable name                            type
0x200000d8  0x4        xFreeBytesRemaining                      size_t

address     size       variable name                            type
0x200000dc  0x4        xMinimumEverFreeBytesRemaining           size_t

address     size       variable name                            type
0x200000cc  0x8        xStart                                   BlockLink_t
0x200000cc  0x4        xStart.pxNextFreeBlock                   pointer to A_BLOCK_LINK
0x200000d0  0x4        xStart.xBlockSize                        size_t

address     size       variable name                            type
0x200000c8  0x4        uxCriticalNesting                        UBaseType_t

address     size       variable name                            type
0x2000008c  0x4        pxCurrentTCB                             volatile pointer to TCB_t

address     size       variable name                            type
0x20000090  0x4        pxDelayedTaskList                        volatile pointer to List_t

address     size       variable name                            type
0x20000094  0x4        pxOverflowDelayedTaskList                volatile pointer to List_t

address     size       variable name                            type
0x200000e8  0x64       pxReadyTasksLists                        array[5] of List_t

address     size       variable name                            type
0x2000009c  0x4        uxCurrentNumberOfTasks                   volatile UBaseType_t

address     size       variable name                            type
0x20000098  0x4        uxDeletedTasksWaitingCleanUp             volatile UBaseType_t

address     size       variable name                            type
0x200000ac  0x4        uxPendedTicks                            volatile UBaseType_t

address     size       variable name                            type
0x200000c4  0x4        uxSchedulerSuspended                     volatile UBaseType_t

address     size       variable name                            type
0x200000b8  0x4        uxTaskNumber                             UBaseType_t

address     size       variable name                            type
0x200000a4  0x4        uxTopReadyPriority                       volatile UBaseType_t

address     size       variable name                            type
0x2000014c  0x14       xDelayedTaskList1                        List_t
0x2000014c  0x4        xDelayedTaskList1.uxNumberOfItems        UBaseType_t
0x20000150  0x4        xDelayedTaskList1.pxIndex                pointer to ListItem_t
0x20000154  0xc        xDelayedTaskList1.xListEnd               MiniListItem_t
0x20000154  0x4        xDelayedTaskList1.xListEnd.xItemValue    TickType_t
0x20000158  0x4        xDelayedTaskList1.xListEnd.pxNext        pointer to xLIST_ITEM
0x2000015c  0x4        xDelayedTaskList1.xListEnd.pxPrevious    pointer to xLIST_ITEM

address     size       variable name                            type
0x20000160  0x14       xDelayedTaskList2                        List_t
0x20000160  0x4        xDelayedTaskList2.uxNumberOfItems        UBaseType_t
0x20000164  0x4        xDelayedTaskList2.pxIndex                pointer to ListItem_t
0x20000168  0xc        xDelayedTaskList2.xListEnd               MiniListItem_t
0x20000168  0x4        xDelayedTaskList2.xListEnd.xItemValue    TickType_t
0x2000016c  0x4        xDelayedTaskList2.xListEnd.pxNext        pointer to xLIST_ITEM
0x20000170  0x4        xDelayedTaskList2.xListEnd.pxPrevious    pointer to xLIST_ITEM

address     size       variable name                            type
0x200000c0  0x4        xIdleTaskHandle                          TaskHandle_t

address     size       variable name                            type
0x200000bc  0x4        xNextTaskUnblockTime                     volatile TickType_t

address     size       variable name                            type
0x200000b4  0x4        xNumOfOverflows                          volatile BaseType_t

address     size       variable name                            type
0x20000174  0x14       xPendingReadyList                        List_t
0x20000174  0x4        xPendingReadyList.uxNumberOfItems        UBaseType_t
0x20000178  0x4        xPendingReadyList.pxIndex                pointer to ListItem_t
0x2000017c  0xc        xPendingReadyList.xListEnd               MiniListItem_t
0x2000017c  0x4        xPendingReadyList.xListEnd.xItemValue    TickType_t
0x20000180  0x4        xPendingReadyList.xListEnd.pxNext        pointer to xLIST_ITEM
0x20000184  0x4        xPendingReadyList.xListEnd.pxPrevious    pointer to xLIST_ITEM

address     size       variable name                            type
0x200000a8  0x4        xSchedulerRunning                        volatile BaseType_t

address     size       variable name                            type
0x2000019c  0x14       xSuspendedTaskList                       List_t
0x2000019c  0x4        xSuspendedTaskList.uxNumberOfItems       UBaseType_t
0x200001a0  0x4        xSuspendedTaskList.pxIndex               pointer to ListItem_t
0x200001a4  0xc        xSuspendedTaskList.xListEnd              MiniListItem_t
0x200001a4  0x4        xSuspendedTaskList.xListEnd.xItemValue   TickType_t
0x200001a8  0x4        xSuspendedTaskList.xListEnd.pxNext       pointer to xLIST_ITEM
0x200001ac  0x4        xSuspendedTaskList.xListEnd.pxPrevious   pointer to xLIST_ITEM

address     size       variable name                            type
0x20000188  0x14       xTasksWaitingTermination                 List_t
0x20000188  0x4        xTasksWaitingTermination.uxNumberOfItems UBaseType_t
0x2000018c  0x4        xTasksWaitingTermination.pxIndex         pointer to ListItem_t
0x20000190  0xc        xTasksWaitingTermination.xListEnd        MiniListItem_t
0x20000190  0x4        xTasksWaitingTermination.xListEnd.xItemValue TickType_t
0x20000194  0x4        xTasksWaitingTermination.xListEnd.pxNext pointer to xLIST_ITEM
0x20000198  0x4        xTasksWaitingTermination.xListEnd.pxPrevious pointer to xLIST_ITEM

address     size       variable name                            type
0x200000a0  0x4        xTickCount                               volatile TickType_t

address     size       variable name                            type
0x200000b0  0x4        xYieldPending                            volatile BaseType_t

address     size       variable name                            type
0x20000088  0x4        SystemCoreClock                          uint32_t

