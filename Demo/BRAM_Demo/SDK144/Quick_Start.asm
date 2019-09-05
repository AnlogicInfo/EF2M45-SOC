
========================================================================

** ELF Header Information

    File Name: Objects\Quick_Start.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x00000089
    Flags: EF_ARM_HASENTRY (0x05000002)

    ARM ELF revision: 5 (ABI version 2)

    Built with
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 17

    Program header offset: 102248 (0x00018f68)
    Section header offset: 102280 (0x00018f88)

    Section header string table index: 16

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 4788 bytes (0x12b4)
    Size in memory: 7376 bytes (0x1cd0)
    Flags         : PF_X + PF_W + PF_R + PF_ARM_ENTRY (0x80000007)
    Alignment     : 8


========================================================================

** Section #1

    Name        : RO_IRAM1
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC (0x00000002)
    Addr        : 0x00000000
    File Offset : 52 (0x34)
    Size        : 136 bytes (0x88)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #2

    Name        : RO_IRAM2
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_EXECINSTR (0x00000006)
    Addr        : 0x00000088
    File Offset : 188 (0xbc)
    Size        : 4644 bytes (0x1224)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    !!!main
    __main
        0x00000088:    f000f802    ....    BL       __scatterload ; 0x90
        0x0000008c:    f000f834    ..4.    BL       __rt_entry ; 0xf8
    !!!scatter
    __scatterload
    __scatterload_rt2
    __scatterload_rt2_thumb_only
        0x00000090:    a00a        ..      ADR      r0,{pc}+0x2c ; 0xbc
        0x00000092:    e8900c00    ....    LDM      r0,{r10,r11}
        0x00000096:    4482        .D      ADD      r10,r10,r0
        0x00000098:    4483        .D      ADD      r11,r11,r0
        0x0000009a:    f1aa0701    ....    SUB      r7,r10,#1
    __scatterload_null
        0x0000009e:    45da        .E      CMP      r10,r11
        0x000000a0:    d101        ..      BNE      0xa6 ; __scatterload_null + 8
        0x000000a2:    f000f829    ..).    BL       __rt_entry ; 0xf8
        0x000000a6:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x9f
        0x000000aa:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x000000ae:    f0130f01    ....    TST      r3,#1
        0x000000b2:    bf18        ..      IT       NE
        0x000000b4:    1afb        ..      SUBNE    r3,r7,r3
        0x000000b6:    f0430301    C...    ORR      r3,r3,#1
        0x000000ba:    4718        .G      BX       r3
    $d
        0x000000bc:    000011e0    ....    DCD    4576
        0x000000c0:    000011f0    ....    DCD    4592
    $t
    !!handler_zi
    __scatterload_zeroinit
        0x000000c4:    2300        .#      MOVS     r3,#0
        0x000000c6:    2400        .$      MOVS     r4,#0
        0x000000c8:    2500        .%      MOVS     r5,#0
        0x000000ca:    2600        .&      MOVS     r6,#0
        0x000000cc:    3a10        .:      SUBS     r2,r2,#0x10
        0x000000ce:    bf28        (.      IT       CS
        0x000000d0:    c178        x.      STMCS    r1!,{r3-r6}
        0x000000d2:    d8fb        ..      BHI      0xcc ; __scatterload_zeroinit + 8
        0x000000d4:    0752        R.      LSLS     r2,r2,#29
        0x000000d6:    bf28        (.      IT       CS
        0x000000d8:    c130        0.      STMCS    r1!,{r4,r5}
        0x000000da:    bf48        H.      IT       MI
        0x000000dc:    600b        .`      STRMI    r3,[r1,#0]
        0x000000de:    4770        pG      BX       lr
    .ARM.Collect$$_printf_percent$$00000009
    .ARM.Collect$$_printf_percent$$00000000
    _printf_d
    _printf_percent
        0x000000e0:    2964        d)      CMP      r1,#0x64
        0x000000e2:    f00080a3    ....    BEQ.W    _printf_int_dec ; 0x22c
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x000000e6:    2973        s)      CMP      r1,#0x73
        0x000000e8:    f00081b3    ....    BEQ.W    _printf_string ; 0x452
    .ARM.Collect$$_printf_percent$$00000017
    _printf_percent_end
        0x000000ec:    2000        .       MOVS     r0,#0
        0x000000ee:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x000000f0:    b51f        ..      PUSH     {r0-r4,lr}
    .ARM.Collect$$libinit$$00000002
    .ARM.Collect$$libinit$$00000004
    .ARM.Collect$$libinit$$0000000A
    .ARM.Collect$$libinit$$0000000C
    .ARM.Collect$$libinit$$0000000E
    .ARM.Collect$$libinit$$00000011
    .ARM.Collect$$libinit$$00000013
    .ARM.Collect$$libinit$$00000015
    .ARM.Collect$$libinit$$00000017
    .ARM.Collect$$libinit$$00000019
    .ARM.Collect$$libinit$$0000001B
    .ARM.Collect$$libinit$$0000001D
    .ARM.Collect$$libinit$$0000001F
    .ARM.Collect$$libinit$$00000021
    .ARM.Collect$$libinit$$00000023
    .ARM.Collect$$libinit$$00000025
    .ARM.Collect$$libinit$$0000002C
    .ARM.Collect$$libinit$$0000002E
    .ARM.Collect$$libinit$$00000030
    .ARM.Collect$$libinit$$00000032
    .ARM.Collect$$libinit$$00000033
    __rt_lib_init_alloca_1
    __rt_lib_init_argv_1
    __rt_lib_init_atexit_1
    __rt_lib_init_clock_1
    __rt_lib_init_cpp_1
    __rt_lib_init_exceptions_1
    __rt_lib_init_fp_1
    __rt_lib_init_fp_trap_1
    __rt_lib_init_getenv_1
    __rt_lib_init_heap_1
    __rt_lib_init_lc_collate_1
    __rt_lib_init_lc_ctype_1
    __rt_lib_init_lc_monetary_1
    __rt_lib_init_lc_numeric_1
    __rt_lib_init_lc_time_1
    __rt_lib_init_preinit_1
    __rt_lib_init_rand_1
    __rt_lib_init_return
    __rt_lib_init_signal_1
    __rt_lib_init_stdio_1
    __rt_lib_init_user_alloc_1
        0x000000f2:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x000000f4:    b510        ..      PUSH     {r4,lr}
    .ARM.Collect$$libshutdown$$00000003
    .ARM.Collect$$libshutdown$$00000006
    .ARM.Collect$$libshutdown$$00000009
    .ARM.Collect$$libshutdown$$0000000B
    .ARM.Collect$$libshutdown$$0000000E
    .ARM.Collect$$libshutdown$$0000000F
    __rt_lib_shutdown_fp_trap_1
    __rt_lib_shutdown_heap_1
    __rt_lib_shutdown_return
    __rt_lib_shutdown_signal_1
    __rt_lib_shutdown_stdio_1
    __rt_lib_shutdown_user_alloc_1
        0x000000f6:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x000000f8:    f000fa10    ....    BL       __user_setup_stackheap ; 0x51c
        0x000000fc:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x000000fe:    f7fffff7    ....    BL       __rt_lib_init ; 0xf0
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x00000102:    f000ffff    ....    BL       main ; 0x1104
        0x00000106:    f000fa2e    ....    BL       exit ; 0x566
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x0000010a:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x0000010c:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0xf4
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x00000110:    bc03        ..      POP      {r0,r1}
        0x00000112:    f000fa33    ..3.    BL       _sys_exit ; 0x57c
        0x00000116:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x00000118:    4809        .H      LDR      r0,[pc,#36] ; [0x140] = 0xcb9
        0x0000011a:    4780        .G      BLX      r0
        0x0000011c:    4809        .H      LDR      r0,[pc,#36] ; [0x144] = 0x89
        0x0000011e:    4700        .G      BX       r0
    NMI_Handler
        0x00000120:    e7fe        ..      B        NMI_Handler ; 0x120
    HardFault_Handler
        0x00000122:    e7fe        ..      B        HardFault_Handler ; 0x122
    MemManage_Handler
        0x00000124:    e7fe        ..      B        MemManage_Handler ; 0x124
    BusFault_Handler
        0x00000126:    e7fe        ..      B        BusFault_Handler ; 0x126
    UsageFault_Handler
        0x00000128:    e7fe        ..      B        UsageFault_Handler ; 0x128
    SVC_Handler
        0x0000012a:    e7fe        ..      B        SVC_Handler ; 0x12a
    DebugMon_Handler
        0x0000012c:    e7fe        ..      B        DebugMon_Handler ; 0x12c
    PendSV_Handler
        0x0000012e:    e7fe        ..      B        PendSV_Handler ; 0x12e
    SysTick_Handler
        0x00000130:    e7fe        ..      B        SysTick_Handler ; 0x130
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
        0x00000132:    e7fe        ..      B        ADCC0_IRQHandler ; 0x132
    __user_initial_stackheap
        0x00000134:    4804        .H      LDR      r0,[pc,#16] ; [0x148] = 0x17d0
        0x00000136:    4905        .I      LDR      r1,[pc,#20] ; [0x14c] = 0x1cd0
        0x00000138:    4a05        .J      LDR      r2,[pc,#20] ; [0x150] = 0x18d0
        0x0000013a:    4b06        .K      LDR      r3,[pc,#24] ; [0x154] = 0x18d0
        0x0000013c:    4770        pG      BX       lr
    $d
        0x0000013e:    0000        ..      DCW    0
        0x00000140:    00000cb9    ....    DCD    3257
        0x00000144:    00000089    ....    DCD    137
        0x00000148:    000017d0    ....    DCD    6096
        0x0000014c:    00001cd0    ....    DCD    7376
        0x00000150:    000018d0    ....    DCD    6352
        0x00000154:    000018d0    ....    DCD    6352
    $t
    .text
    __2printf
        0x00000158:    b40f        ..      PUSH     {r0-r3}
        0x0000015a:    4904        .I      LDR      r1,[pc,#16] ; [0x16c] = 0x12b0
        0x0000015c:    b510        ..      PUSH     {r4,lr}
        0x0000015e:    aa03        ..      ADD      r2,sp,#0xc
        0x00000160:    9802        ..      LDR      r0,[sp,#8]
        0x00000162:    f000f97b    ..{.    BL       _printf_char_file ; 0x45c
        0x00000166:    bc10        ..      POP      {r4}
        0x00000168:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x0000016c:    000012b0    ....    DCD    4784
    $t
    .text
    __printf
        0x00000170:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000174:    460e        .F      MOV      r6,r1
        0x00000176:    4604        .F      MOV      r4,r0
        0x00000178:    2000        .       MOVS     r0,#0
        0x0000017a:    6220         b      STR      r0,[r4,#0x20]
        0x0000017c:    4620         F      MOV      r0,r4
        0x0000017e:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000180:    4788        .G      BLX      r1
        0x00000182:    b330        0.      CBZ      r0,0x1d2 ; __printf + 98
        0x00000184:    2825        %(      CMP      r0,#0x25
        0x00000186:    d005        ..      BEQ      0x194 ; __printf + 36
        0x00000188:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x0000018c:    4790        .G      BLX      r2
        0x0000018e:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000190:    1c40        @.      ADDS     r0,r0,#1
        0x00000192:    e7f2        ..      B        0x17a ; __printf + 10
        0x00000194:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000196:    4620         F      MOV      r0,r4
        0x00000198:    2700        .'      MOVS     r7,#0
        0x0000019a:    4788        .G      BLX      r1
        0x0000019c:    0005        ..      MOVS     r5,r0
        0x0000019e:    d018        ..      BEQ      0x1d2 ; __printf + 98
        0x000001a0:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x000001a4:    2819        .(      CMP      r0,#0x19
        0x000001a6:    d802        ..      BHI      0x1ae ; __printf + 62
        0x000001a8:    3520         5      ADDS     r5,r5,#0x20
        0x000001aa:    f44f6700    O..g    MOV      r7,#0x800
        0x000001ae:    4632        2F      MOV      r2,r6
        0x000001b0:    4629        )F      MOV      r1,r5
        0x000001b2:    4620         F      MOV      r0,r4
        0x000001b4:    6027        '`      STR      r7,[r4,#0]
        0x000001b6:    f7ffff93    ....    BL       _printf_d ; 0xe0
        0x000001ba:    b140        @.      CBZ      r0,0x1ce ; __printf + 94
        0x000001bc:    2801        .(      CMP      r0,#1
        0x000001be:    d004        ..      BEQ      0x1ca ; __printf + 90
        0x000001c0:    1df6        ..      ADDS     r6,r6,#7
        0x000001c2:    f0260607    &...    BIC      r6,r6,#7
        0x000001c6:    3608        .6      ADDS     r6,r6,#8
        0x000001c8:    e7d8        ..      B        0x17c ; __printf + 12
        0x000001ca:    1d36        6.      ADDS     r6,r6,#4
        0x000001cc:    e7d6        ..      B        0x17c ; __printf + 12
        0x000001ce:    4628        (F      MOV      r0,r5
        0x000001d0:    e7da        ..      B        0x188 ; __printf + 24
        0x000001d2:    6a20         j      LDR      r0,[r4,#0x20]
        0x000001d4:    e8bd81f0    ....    POP      {r4-r8,pc}
    .text
    _printf_str
        0x000001d8:    b570        p.      PUSH     {r4-r6,lr}
        0x000001da:    460c        .F      MOV      r4,r1
        0x000001dc:    4605        .F      MOV      r5,r0
        0x000001de:    2a01        .*      CMP      r2,#1
        0x000001e0:    d005        ..      BEQ      0x1ee ; _printf_str + 22
        0x000001e2:    7828        (x      LDRB     r0,[r5,#0]
        0x000001e4:    0680        ..      LSLS     r0,r0,#26
        0x000001e6:    d500        ..      BPL      0x1ea ; _printf_str + 18
        0x000001e8:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x000001ea:    2300        .#      MOVS     r3,#0
        0x000001ec:    e002        ..      B        0x1f4 ; _printf_str + 28
        0x000001ee:    2301        .#      MOVS     r3,#1
        0x000001f0:    e005        ..      B        0x1fe ; _printf_str + 38
        0x000001f2:    1c5b        [.      ADDS     r3,r3,#1
        0x000001f4:    4293        .B      CMP      r3,r2
        0x000001f6:    d202        ..      BCS      0x1fe ; _printf_str + 38
        0x000001f8:    5ce0        .\      LDRB     r0,[r4,r3]
        0x000001fa:    2800        .(      CMP      r0,#0
        0x000001fc:    d1f9        ..      BNE      0x1f2 ; _printf_str + 26
        0x000001fe:    69a8        .i      LDR      r0,[r5,#0x18]
        0x00000200:    18e6        ..      ADDS     r6,r4,r3
        0x00000202:    1ac0        ..      SUBS     r0,r0,r3
        0x00000204:    61a8        .a      STR      r0,[r5,#0x18]
        0x00000206:    6a28        (j      LDR      r0,[r5,#0x20]
        0x00000208:    4418        .D      ADD      r0,r0,r3
        0x0000020a:    6228        (b      STR      r0,[r5,#0x20]
        0x0000020c:    4628        (F      MOV      r0,r5
        0x0000020e:    f3af8000    ....    NOP.W    
        0x00000212:    e004        ..      B        0x21e ; _printf_str + 70
        0x00000214:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x00000218:    f8140b01    ....    LDRB     r0,[r4],#1
        0x0000021c:    4790        .G      BLX      r2
        0x0000021e:    42b4        .B      CMP      r4,r6
        0x00000220:    d3f8        ..      BCC      0x214 ; _printf_str + 60
        0x00000222:    4628        (F      MOV      r0,r5
        0x00000224:    f3af8000    ....    NOP.W    
        0x00000228:    bd70        p.      POP      {r4-r6,pc}
        0x0000022a:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x0000022c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000230:    4606        .F      MOV      r6,r0
        0x00000232:    2400        .$      MOVS     r4,#0
        0x00000234:    6810        .h      LDR      r0,[r2,#0]
        0x00000236:    2975        u)      CMP      r1,#0x75
        0x00000238:    4631        1F      MOV      r1,r6
        0x0000023a:    a516        ..      ADR      r5,{pc}+0x5a ; 0x294
        0x0000023c:    d010        ..      BEQ      0x260 ; _printf_int_dec + 52
        0x0000023e:    f3af8000    ....    NOP.W    
        0x00000242:    2800        .(      CMP      r0,#0
        0x00000244:    da02        ..      BGE      0x24c ; _printf_int_dec + 32
        0x00000246:    4240        @B      RSBS     r0,r0,#0
        0x00000248:    a513        ..      ADR      r5,{pc}+0x50 ; 0x298
        0x0000024a:    e007        ..      B        0x25c ; _printf_int_dec + 48
        0x0000024c:    6831        1h      LDR      r1,[r6,#0]
        0x0000024e:    078a        ..      LSLS     r2,r1,#30
        0x00000250:    d501        ..      BPL      0x256 ; _printf_int_dec + 42
        0x00000252:    a512        ..      ADR      r5,{pc}+0x4a ; 0x29c
        0x00000254:    e002        ..      B        0x25c ; _printf_int_dec + 48
        0x00000256:    0749        I.      LSLS     r1,r1,#29
        0x00000258:    d504        ..      BPL      0x264 ; _printf_int_dec + 56
        0x0000025a:    a511        ..      ADR      r5,{pc}+0x46 ; 0x2a0
        0x0000025c:    2401        .$      MOVS     r4,#1
        0x0000025e:    e001        ..      B        0x264 ; _printf_int_dec + 56
        0x00000260:    f3af8000    ....    NOP.W    
        0x00000264:    2100        .!      MOVS     r1,#0
        0x00000266:    220a        ."      MOVS     r2,#0xa
        0x00000268:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x0000026c:    e009        ..      B        0x282 ; _printf_int_dec + 86
        0x0000026e:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x00000272:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x00000276:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x0000027a:    3030        00      ADDS     r0,r0,#0x30
        0x0000027c:    5478        xT      STRB     r0,[r7,r1]
        0x0000027e:    4618        .F      MOV      r0,r3
        0x00000280:    1c49        I.      ADDS     r1,r1,#1
        0x00000282:    2800        .(      CMP      r0,#0
        0x00000284:    d1f3        ..      BNE      0x26e ; _printf_int_dec + 66
        0x00000286:    4623        #F      MOV      r3,r4
        0x00000288:    462a        *F      MOV      r2,r5
        0x0000028a:    4630        0F      MOV      r0,r6
        0x0000028c:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x00000290:    f000b874    ..t.    B.W      _printf_int_common ; 0x37c
    $d
        0x00000294:    00000000    ....    DCD    0
        0x00000298:    0000002d    -...    DCD    45
        0x0000029c:    0000002b    +...    DCD    43
        0x000002a0:    00000020     ...    DCD    32
    $t
    .text
    strcpy
        0x000002a4:    ea400301    @...    ORR      r3,r0,r1
        0x000002a8:    4602        .F      MOV      r2,r0
        0x000002aa:    b530        0.      PUSH     {r4,r5,lr}
        0x000002ac:    079b        ..      LSLS     r3,r3,#30
        0x000002ae:    d110        ..      BNE      0x2d2 ; strcpy + 46
        0x000002b0:    f04f3401    O..4    MOV      r4,#0x1010101
        0x000002b4:    e000        ..      B        0x2b8 ; strcpy + 20
        0x000002b6:    c208        ..      STM      r2!,{r3}
        0x000002b8:    c908        ..      LDM      r1!,{r3}
        0x000002ba:    1b1d        ..      SUBS     r5,r3,r4
        0x000002bc:    439d        .C      BICS     r5,r5,r3
        0x000002be:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x000002c2:    d0f8        ..      BEQ      0x2b6 ; strcpy + 18
        0x000002c4:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x000002c8:    f8021b01    ....    STRB     r1,[r2],#1
        0x000002cc:    d00d        ..      BEQ      0x2ea ; strcpy + 70
        0x000002ce:    0a1b        ..      LSRS     r3,r3,#8
        0x000002d0:    e7f8        ..      B        0x2c4 ; strcpy + 32
        0x000002d2:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000002d6:    2b00        .+      CMP      r3,#0
        0x000002d8:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000002dc:    d005        ..      BEQ      0x2ea ; strcpy + 70
        0x000002de:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000002e2:    2b00        .+      CMP      r3,#0
        0x000002e4:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000002e8:    d1f3        ..      BNE      0x2d2 ; strcpy + 46
        0x000002ea:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x000002ec:    2a03        .*      CMP      r2,#3
        0x000002ee:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x352
        0x000002f2:    f0100c03    ....    ANDS     r12,r0,#3
        0x000002f6:    f0008015    ....    BEQ.W    0x324 ; __aeabi_memcpy + 56
        0x000002fa:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000002fe:    f1bc0f02    ....    CMP      r12,#2
        0x00000302:    4462        bD      ADD      r2,r2,r12
        0x00000304:    bf98        ..      IT       LS
        0x00000306:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x0000030a:    f8003b01    ...;    STRB     r3,[r0],#1
        0x0000030e:    bf38        8.      IT       CC
        0x00000310:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x00000314:    f1a20204    ....    SUB      r2,r2,#4
        0x00000318:    bf98        ..      IT       LS
        0x0000031a:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x0000031e:    bf38        8.      IT       CC
        0x00000320:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x00000324:    f0110303    ....    ANDS     r3,r1,#3
        0x00000328:    f00080aa    ....    BEQ.W    __aeabi_memcpy4 ; 0x480
        0x0000032c:    3a08        .:      SUBS     r2,r2,#8
        0x0000032e:    f0c08008    ....    BCC.W    0x342 ; __aeabi_memcpy + 86
        0x00000332:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x00000336:    3a08        .:      SUBS     r2,r2,#8
        0x00000338:    f851cb04    Q...    LDR      r12,[r1],#4
        0x0000033c:    e8a01008    ....    STM      r0!,{r3,r12}
        0x00000340:    e7f5        ..      B        0x32e ; __aeabi_memcpy + 66
        0x00000342:    1d12        ..      ADDS     r2,r2,#4
        0x00000344:    bf5c        \.      ITT      PL
        0x00000346:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x0000034a:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x0000034e:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x00000352:    07d2        ..      LSLS     r2,r2,#31
        0x00000354:    bf24        $.      ITT      CS
        0x00000356:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x0000035a:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000035e:    bf48        H.      IT       MI
        0x00000360:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000364:    bf24        $.      ITT      CS
        0x00000366:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x0000036a:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000036e:    bf48        H.      IT       MI
        0x00000370:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000374:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000376:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000378:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x0000037a:    4770        pG      BX       lr
    .text
    _printf_int_common
        0x0000037c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000380:    460d        .F      MOV      r5,r1
        0x00000382:    4699        .F      MOV      r9,r3
        0x00000384:    4692        .F      MOV      r10,r2
        0x00000386:    4604        .F      MOV      r4,r0
        0x00000388:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x0000038c:    6801        .h      LDR      r1,[r0,#0]
        0x0000038e:    0688        ..      LSLS     r0,r1,#26
        0x00000390:    d504        ..      BPL      0x39c ; _printf_int_common + 32
        0x00000392:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00000394:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000398:    6021        !`      STR      r1,[r4,#0]
        0x0000039a:    e000        ..      B        0x39e ; _printf_int_common + 34
        0x0000039c:    2001        .       MOVS     r0,#1
        0x0000039e:    42a8        .B      CMP      r0,r5
        0x000003a0:    dd01        ..      BLE      0x3a6 ; _printf_int_common + 42
        0x000003a2:    1b47        G.      SUBS     r7,r0,r5
        0x000003a4:    e000        ..      B        0x3a8 ; _printf_int_common + 44
        0x000003a6:    2700        .'      MOVS     r7,#0
        0x000003a8:    69a1        .i      LDR      r1,[r4,#0x18]
        0x000003aa:    197a        z.      ADDS     r2,r7,r5
        0x000003ac:    eb020009    ....    ADD      r0,r2,r9
        0x000003b0:    1a08        ..      SUBS     r0,r1,r0
        0x000003b2:    61a0        .a      STR      r0,[r4,#0x18]
        0x000003b4:    7820         x      LDRB     r0,[r4,#0]
        0x000003b6:    06c0        ..      LSLS     r0,r0,#27
        0x000003b8:    d402        ..      BMI      0x3c0 ; _printf_int_common + 68
        0x000003ba:    4620         F      MOV      r0,r4
        0x000003bc:    f3af8000    ....    NOP.W    
        0x000003c0:    2600        .&      MOVS     r6,#0
        0x000003c2:    e008        ..      B        0x3d6 ; _printf_int_common + 90
        0x000003c4:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000003c8:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x000003cc:    4790        .G      BLX      r2
        0x000003ce:    6a20         j      LDR      r0,[r4,#0x20]
        0x000003d0:    1c40        @.      ADDS     r0,r0,#1
        0x000003d2:    1c76        v.      ADDS     r6,r6,#1
        0x000003d4:    6220         b      STR      r0,[r4,#0x20]
        0x000003d6:    454e        NE      CMP      r6,r9
        0x000003d8:    dbf4        ..      BLT      0x3c4 ; _printf_int_common + 72
        0x000003da:    7820         x      LDRB     r0,[r4,#0]
        0x000003dc:    06c0        ..      LSLS     r0,r0,#27
        0x000003de:    d50a        ..      BPL      0x3f6 ; _printf_int_common + 122
        0x000003e0:    4620         F      MOV      r0,r4
        0x000003e2:    f3af8000    ....    NOP.W    
        0x000003e6:    e006        ..      B        0x3f6 ; _printf_int_common + 122
        0x000003e8:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000003ec:    2030        0       MOVS     r0,#0x30
        0x000003ee:    4790        .G      BLX      r2
        0x000003f0:    6a20         j      LDR      r0,[r4,#0x20]
        0x000003f2:    1c40        @.      ADDS     r0,r0,#1
        0x000003f4:    6220         b      STR      r0,[r4,#0x20]
        0x000003f6:    1e38        8.      SUBS     r0,r7,#0
        0x000003f8:    f1a70701    ....    SUB      r7,r7,#1
        0x000003fc:    dcf4        ..      BGT      0x3e8 ; _printf_int_common + 108
        0x000003fe:    e007        ..      B        0x410 ; _printf_int_common + 148
        0x00000400:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000404:    f8180005    ....    LDRB     r0,[r8,r5]
        0x00000408:    4790        .G      BLX      r2
        0x0000040a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000040c:    1c40        @.      ADDS     r0,r0,#1
        0x0000040e:    6220         b      STR      r0,[r4,#0x20]
        0x00000410:    1e28        (.      SUBS     r0,r5,#0
        0x00000412:    f1a50501    ....    SUB      r5,r5,#1
        0x00000416:    dcf3        ..      BGT      0x400 ; _printf_int_common + 132
        0x00000418:    4620         F      MOV      r0,r4
        0x0000041a:    f3af8000    ....    NOP.W    
        0x0000041e:    7820         x      LDRB     r0,[r4,#0]
        0x00000420:    0600        ..      LSLS     r0,r0,#24
        0x00000422:    d502        ..      BPL      0x42a ; _printf_int_common + 174
        0x00000424:    2002        .       MOVS     r0,#2
        0x00000426:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0000042a:    2001        .       MOVS     r0,#1
        0x0000042c:    e7fb        ..      B        0x426 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x0000042e:    b510        ..      PUSH     {r4,lr}
        0x00000430:    6943        Ci      LDR      r3,[r0,#0x14]
        0x00000432:    b113        ..      CBZ      r3,0x43a ; _printf_cs_common + 12
        0x00000434:    f3af8000    ....    NOP.W    
        0x00000438:    e001        ..      B        0x43e ; _printf_cs_common + 16
        0x0000043a:    f7fffecd    ....    BL       _printf_str ; 0x1d8
        0x0000043e:    2001        .       MOVS     r0,#1
        0x00000440:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x00000442:    7812        .x      LDRB     r2,[r2,#0]
        0x00000444:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000448:    700a        .p      STRB     r2,[r1,#0]
        0x0000044a:    2200        ."      MOVS     r2,#0
        0x0000044c:    704a        Jp      STRB     r2,[r1,#1]
        0x0000044e:    2201        ."      MOVS     r2,#1
        0x00000450:    e7ed        ..      B        _printf_cs_common ; 0x42e
    _printf_string
        0x00000452:    6811        .h      LDR      r1,[r2,#0]
        0x00000454:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000458:    e7e9        ..      B        _printf_cs_common ; 0x42e
        0x0000045a:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x0000045c:    4b07        .K      LDR      r3,[pc,#28] ; [0x47c] = 0xc63
        0x0000045e:    b570        p.      PUSH     {r4-r6,lr}
        0x00000460:    460d        .F      MOV      r5,r1
        0x00000462:    447b        {D      ADD      r3,r3,pc
        0x00000464:    f000f843    ..C.    BL       _printf_char_common ; 0x4ee
        0x00000468:    4604        .F      MOV      r4,r0
        0x0000046a:    4628        (F      MOV      r0,r5
        0x0000046c:    f000f852    ..R.    BL       ferror ; 0x514
        0x00000470:    b110        ..      CBZ      r0,0x478 ; _printf_char_file + 28
        0x00000472:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000476:    bd70        p.      POP      {r4-r6,pc}
        0x00000478:    4620         F      MOV      r0,r4
        0x0000047a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000047c:    00000c63    c...    DCD    3171
    $t
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x00000480:    b510        ..      PUSH     {r4,lr}
        0x00000482:    3a20         :      SUBS     r2,r2,#0x20
        0x00000484:    f0c0800b    ....    BCC.W    0x49e ; __aeabi_memcpy4 + 30
        0x00000488:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000048c:    3a20         :      SUBS     r2,r2,#0x20
        0x0000048e:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000492:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000496:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x0000049a:    f4bfaff5    ....    BCS.W    0x488 ; __aeabi_memcpy4 + 8
        0x0000049e:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x000004a2:    bf24        $.      ITT      CS
        0x000004a4:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x000004a8:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x000004ac:    bf44        D.      ITT      MI
        0x000004ae:    c918        ..      LDMMI    r1!,{r3,r4}
        0x000004b0:    c018        ..      STMMI    r0!,{r3,r4}
        0x000004b2:    e8bd4010    ...@    POP      {r4,lr}
        0x000004b6:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x000004ba:    bf24        $.      ITT      CS
        0x000004bc:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x000004c0:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000004c4:    bf08        ..      IT       EQ
        0x000004c6:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000004c8:    07d2        ..      LSLS     r2,r2,#31
        0x000004ca:    bf28        (.      IT       CS
        0x000004cc:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000004d0:    bf48        H.      IT       MI
        0x000004d2:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000004d6:    bf28        (.      IT       CS
        0x000004d8:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000004dc:    bf48        H.      IT       MI
        0x000004de:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000004e2:    4770        pG      BX       lr
    .text
    _printf_input_char
        0x000004e4:    6901        .i      LDR      r1,[r0,#0x10]
        0x000004e6:    1c4a        J.      ADDS     r2,r1,#1
        0x000004e8:    6102        .a      STR      r2,[r0,#0x10]
        0x000004ea:    7808        .x      LDRB     r0,[r1,#0]
        0x000004ec:    4770        pG      BX       lr
    _printf_char_common
        0x000004ee:    b500        ..      PUSH     {lr}
        0x000004f0:    b08f        ..      SUB      sp,sp,#0x3c
        0x000004f2:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000004f6:    2100        .!      MOVS     r1,#0
        0x000004f8:    9105        ..      STR      r1,[sp,#0x14]
        0x000004fa:    4905        .I      LDR      r1,[pc,#20] ; [0x510] = 0xffffffe5
        0x000004fc:    4479        yD      ADD      r1,r1,pc
        0x000004fe:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x00000502:    4611        .F      MOV      r1,r2
        0x00000504:    4668        hF      MOV      r0,sp
        0x00000506:    f7fffe33    ..3.    BL       __printf ; 0x170
        0x0000050a:    b00f        ..      ADD      sp,sp,#0x3c
        0x0000050c:    bd00        ..      POP      {pc}
    $d
        0x0000050e:    0000        ..      DCW    0
        0x00000510:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x00000514:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x00000516:    f0000080    ....    AND      r0,r0,#0x80
        0x0000051a:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x0000051c:    4675        uF      MOV      r5,lr
        0x0000051e:    f000f829    ..).    BL       __user_libspace ; 0x574
        0x00000522:    46ae        .F      MOV      lr,r5
        0x00000524:    0005        ..      MOVS     r5,r0
        0x00000526:    4669        iF      MOV      r1,sp
        0x00000528:    4653        SF      MOV      r3,r10
        0x0000052a:    f0200007     ...    BIC      r0,r0,#7
        0x0000052e:    4685        .F      MOV      sp,r0
        0x00000530:    b018        ..      ADD      sp,sp,#0x60
        0x00000532:    b520         .      PUSH     {r5,lr}
        0x00000534:    f7fffdfe    ....    BL       __user_initial_stackheap ; 0x134
        0x00000538:    e8bd4020    .. @    POP      {r5,lr}
        0x0000053c:    f04f0600    O...    MOV      r6,#0
        0x00000540:    f04f0700    O...    MOV      r7,#0
        0x00000544:    f04f0800    O...    MOV      r8,#0
        0x00000548:    f04f0b00    O...    MOV      r11,#0
        0x0000054c:    f0210107    !...    BIC      r1,r1,#7
        0x00000550:    46ac        .F      MOV      r12,r5
        0x00000552:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000556:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000055a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000055e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000562:    468d        .F      MOV      sp,r1
        0x00000564:    4770        pG      BX       lr
    .text
    exit
        0x00000566:    4604        .F      MOV      r4,r0
        0x00000568:    f3af8000    ....    NOP.W    
        0x0000056c:    4620         F      MOV      r0,r4
        0x0000056e:    f7fffdcc    ....    BL       __rt_exit ; 0x10a
        0x00000572:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000574:    4800        .H      LDR      r0,[pc,#0] ; [0x578] = 0x176c
        0x00000576:    4770        pG      BX       lr
    $d
        0x00000578:    0000176c    l...    DCD    5996
    $t
    .text
    _sys_exit
        0x0000057c:    4901        .I      LDR      r1,[pc,#4] ; [0x584] = 0x20026
        0x0000057e:    2018        .       MOVS     r0,#0x18
        0x00000580:    beab        ..      BKPT     #0xab
        0x00000582:    e7fe        ..      B        0x582 ; _sys_exit + 6
    $d
        0x00000584:    00020026    &...    DCD    131110
    $t
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x00000588:    4770        pG      BX       lr
    i.HAL_GPIO_Init
    .text
    HAL_GPIO_Init
    __semihosting_library_function
        0x0000058a:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x0000058c:    4604        .F      MOV      r4,r0
        0x0000058e:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x00000592:    4620         F      MOV      r0,r4
        0x00000594:    f000f832    ..2.    BL       HAL_GPIO_SetDir ; 0x5fc
        0x00000598:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x0000059c:    2801        .(      CMP      r0,#1
        0x0000059e:    d105        ..      BNE      0x5ac ; HAL_GPIO_Init + 34
        0x000005a0:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x000005a4:    4620         F      MOV      r0,r4
        0x000005a6:    f000f8b1    ....    BL       HAL_GPIO_WritePin ; 0x70c
        0x000005aa:    e009        ..      B        0x5c0 ; HAL_GPIO_Init + 54
        0x000005ac:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x000005b0:    4620         F      MOV      r0,r4
        0x000005b2:    f000f807    ....    BL       HAL_GPIO_SetDebounce ; 0x5c4
        0x000005b6:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000005ba:    4620         F      MOV      r0,r4
        0x000005bc:    f000f874    ..t.    BL       HAL_GPIO_TrigType ; 0x6a8
        0x000005c0:    bd1c        ..      POP      {r2-r4,pc}
        0x000005c2:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x000005c4:    b530        0.      PUSH     {r4,r5,lr}
        0x000005c6:    460a        .F      MOV      r2,r1
        0x000005c8:    bf00        ..      NOP      
        0x000005ca:    4b0b        .K      LDR      r3,[pc,#44] ; [0x5f8] = 0x40007000
        0x000005cc:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x000005ce:    b29b        ..      UXTH     r3,r3
        0x000005d0:    4619        .F      MOV      r1,r3
        0x000005d2:    2a01        .*      CMP      r2,#1
        0x000005d4:    d103        ..      BNE      0x5de ; HAL_GPIO_SetDebounce + 26
        0x000005d6:    2301        .#      MOVS     r3,#1
        0x000005d8:    4083        .@      LSLS     r3,r3,r0
        0x000005da:    4319        .C      ORRS     r1,r1,r3
        0x000005dc:    e002        ..      B        0x5e4 ; HAL_GPIO_SetDebounce + 32
        0x000005de:    2301        .#      MOVS     r3,#1
        0x000005e0:    4083        .@      LSLS     r3,r3,r0
        0x000005e2:    4399        .C      BICS     r1,r1,r3
        0x000005e4:    b28b        ..      UXTH     r3,r1
        0x000005e6:    4c04        .L      LDR      r4,[pc,#16] ; [0x5f8] = 0x40007000
        0x000005e8:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x000005ea:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000005ee:    4d02        .M      LDR      r5,[pc,#8] ; [0x5f8] = 0x40007000
        0x000005f0:    64ac        .d      STR      r4,[r5,#0x48]
        0x000005f2:    bf00        ..      NOP      
        0x000005f4:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000005f6:    0000        ..      DCW    0
        0x000005f8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x000005fc:    b530        0.      PUSH     {r4,r5,lr}
        0x000005fe:    4602        .F      MOV      r2,r0
        0x00000600:    2a10        .*      CMP      r2,#0x10
        0x00000602:    da16        ..      BGE      0x632 ; HAL_GPIO_SetDir + 54
        0x00000604:    bf00        ..      NOP      
        0x00000606:    4b19        .K      LDR      r3,[pc,#100] ; [0x66c] = 0x40007000
        0x00000608:    685b        [h      LDR      r3,[r3,#4]
        0x0000060a:    b298        ..      UXTH     r0,r3
        0x0000060c:    bf00        ..      NOP      
        0x0000060e:    2901        .)      CMP      r1,#1
        0x00000610:    d103        ..      BNE      0x61a ; HAL_GPIO_SetDir + 30
        0x00000612:    2301        .#      MOVS     r3,#1
        0x00000614:    4093        .@      LSLS     r3,r3,r2
        0x00000616:    4318        .C      ORRS     r0,r0,r3
        0x00000618:    e002        ..      B        0x620 ; HAL_GPIO_SetDir + 36
        0x0000061a:    2301        .#      MOVS     r3,#1
        0x0000061c:    4093        .@      LSLS     r3,r3,r2
        0x0000061e:    4398        .C      BICS     r0,r0,r3
        0x00000620:    b283        ..      UXTH     r3,r0
        0x00000622:    4c12        .L      LDR      r4,[pc,#72] ; [0x66c] = 0x40007000
        0x00000624:    6864        dh      LDR      r4,[r4,#4]
        0x00000626:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000062a:    4d10        .M      LDR      r5,[pc,#64] ; [0x66c] = 0x40007000
        0x0000062c:    606c        l`      STR      r4,[r5,#4]
        0x0000062e:    bf00        ..      NOP      
        0x00000630:    e01b        ..      B        0x66a ; HAL_GPIO_SetDir + 110
        0x00000632:    bf00        ..      NOP      
        0x00000634:    4b0d        .K      LDR      r3,[pc,#52] ; [0x66c] = 0x40007000
        0x00000636:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000638:    b298        ..      UXTH     r0,r3
        0x0000063a:    bf00        ..      NOP      
        0x0000063c:    2901        .)      CMP      r1,#1
        0x0000063e:    d106        ..      BNE      0x64e ; HAL_GPIO_SetDir + 82
        0x00000640:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000644:    2401        .$      MOVS     r4,#1
        0x00000646:    fa04f303    ....    LSL      r3,r4,r3
        0x0000064a:    4318        .C      ORRS     r0,r0,r3
        0x0000064c:    e004        ..      B        0x658 ; HAL_GPIO_SetDir + 92
        0x0000064e:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000652:    2401        .$      MOVS     r4,#1
        0x00000654:    409c        .@      LSLS     r4,r4,r3
        0x00000656:    43a0        .C      BICS     r0,r0,r4
        0x00000658:    b283        ..      UXTH     r3,r0
        0x0000065a:    4c04        .L      LDR      r4,[pc,#16] ; [0x66c] = 0x40007000
        0x0000065c:    6924        $i      LDR      r4,[r4,#0x10]
        0x0000065e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000662:    4d02        .M      LDR      r5,[pc,#8] ; [0x66c] = 0x40007000
        0x00000664:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000666:    bf00        ..      NOP      
        0x00000668:    bf00        ..      NOP      
        0x0000066a:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x0000066c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000670:    b530        0.      PUSH     {r4,r5,lr}
        0x00000672:    460a        .F      MOV      r2,r1
        0x00000674:    bf00        ..      NOP      
        0x00000676:    4b0b        .K      LDR      r3,[pc,#44] ; [0x6a4] = 0x40007000
        0x00000678:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x0000067a:    b29b        ..      UXTH     r3,r3
        0x0000067c:    4619        .F      MOV      r1,r3
        0x0000067e:    2a01        .*      CMP      r2,#1
        0x00000680:    d103        ..      BNE      0x68a ; HAL_GPIO_SetPly + 26
        0x00000682:    2301        .#      MOVS     r3,#1
        0x00000684:    4083        .@      LSLS     r3,r3,r0
        0x00000686:    4319        .C      ORRS     r1,r1,r3
        0x00000688:    e002        ..      B        0x690 ; HAL_GPIO_SetPly + 32
        0x0000068a:    2301        .#      MOVS     r3,#1
        0x0000068c:    4083        .@      LSLS     r3,r3,r0
        0x0000068e:    4399        .C      BICS     r1,r1,r3
        0x00000690:    b28b        ..      UXTH     r3,r1
        0x00000692:    4c04        .L      LDR      r4,[pc,#16] ; [0x6a4] = 0x40007000
        0x00000694:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000696:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000069a:    4d02        .M      LDR      r5,[pc,#8] ; [0x6a4] = 0x40007000
        0x0000069c:    63ec        .c      STR      r4,[r5,#0x3c]
        0x0000069e:    bf00        ..      NOP      
        0x000006a0:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000006a2:    0000        ..      DCW    0
        0x000006a4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x000006a8:    b570        p.      PUSH     {r4-r6,lr}
        0x000006aa:    4605        .F      MOV      r5,r0
        0x000006ac:    460c        .F      MOV      r4,r1
        0x000006ae:    b134        4.      CBZ      r4,0x6be ; HAL_GPIO_TrigType + 22
        0x000006b0:    2c01        .,      CMP      r4,#1
        0x000006b2:    d00d        ..      BEQ      0x6d0 ; HAL_GPIO_TrigType + 40
        0x000006b4:    2c02        .,      CMP      r4,#2
        0x000006b6:    d014        ..      BEQ      0x6e2 ; HAL_GPIO_TrigType + 58
        0x000006b8:    2c03        .,      CMP      r4,#3
        0x000006ba:    d124        $.      BNE      0x706 ; HAL_GPIO_TrigType + 94
        0x000006bc:    e01a        ..      B        0x6f4 ; HAL_GPIO_TrigType + 76
        0x000006be:    2100        .!      MOVS     r1,#0
        0x000006c0:    4628        (F      MOV      r0,r5
        0x000006c2:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0x768
        0x000006c6:    2100        .!      MOVS     r1,#0
        0x000006c8:    4628        (F      MOV      r0,r5
        0x000006ca:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0x670
        0x000006ce:    e01a        ..      B        0x706 ; HAL_GPIO_TrigType + 94
        0x000006d0:    2100        .!      MOVS     r1,#0
        0x000006d2:    4628        (F      MOV      r0,r5
        0x000006d4:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0x768
        0x000006d8:    2101        .!      MOVS     r1,#1
        0x000006da:    4628        (F      MOV      r0,r5
        0x000006dc:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0x670
        0x000006e0:    e011        ..      B        0x706 ; HAL_GPIO_TrigType + 94
        0x000006e2:    2101        .!      MOVS     r1,#1
        0x000006e4:    4628        (F      MOV      r0,r5
        0x000006e6:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0x768
        0x000006ea:    2100        .!      MOVS     r1,#0
        0x000006ec:    4628        (F      MOV      r0,r5
        0x000006ee:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0x670
        0x000006f2:    e008        ..      B        0x706 ; HAL_GPIO_TrigType + 94
        0x000006f4:    2101        .!      MOVS     r1,#1
        0x000006f6:    4628        (F      MOV      r0,r5
        0x000006f8:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0x768
        0x000006fc:    2101        .!      MOVS     r1,#1
        0x000006fe:    4628        (F      MOV      r0,r5
        0x00000700:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0x670
        0x00000704:    bf00        ..      NOP      
        0x00000706:    bf00        ..      NOP      
        0x00000708:    bd70        p.      POP      {r4-r6,pc}
        0x0000070a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x0000070c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000070e:    4605        .F      MOV      r5,r0
        0x00000710:    460e        .F      MOV      r6,r1
        0x00000712:    2d10        .-      CMP      r5,#0x10
        0x00000714:    da10        ..      BGE      0x738 ; HAL_GPIO_WritePin + 44
        0x00000716:    bf00        ..      NOP      
        0x00000718:    4812        .H      LDR      r0,[pc,#72] ; [0x764] = 0x40007000
        0x0000071a:    6800        .h      LDR      r0,[r0,#0]
        0x0000071c:    b284        ..      UXTH     r4,r0
        0x0000071e:    bf00        ..      NOP      
        0x00000720:    b91e        ..      CBNZ     r6,0x72a ; HAL_GPIO_WritePin + 30
        0x00000722:    2001        .       MOVS     r0,#1
        0x00000724:    40a8        .@      LSLS     r0,r0,r5
        0x00000726:    4384        .C      BICS     r4,r4,r0
        0x00000728:    e002        ..      B        0x730 ; HAL_GPIO_WritePin + 36
        0x0000072a:    2001        .       MOVS     r0,#1
        0x0000072c:    40a8        .@      LSLS     r0,r0,r5
        0x0000072e:    4304        .C      ORRS     r4,r4,r0
        0x00000730:    b2a0        ..      UXTH     r0,r4
        0x00000732:    f000fcd3    ....    BL       gpio_portadataregister_setf ; 0x10dc
        0x00000736:    e014        ..      B        0x762 ; HAL_GPIO_WritePin + 86
        0x00000738:    bf00        ..      NOP      
        0x0000073a:    480a        .H      LDR      r0,[pc,#40] ; [0x764] = 0x40007000
        0x0000073c:    68c0        .h      LDR      r0,[r0,#0xc]
        0x0000073e:    b284        ..      UXTH     r4,r0
        0x00000740:    bf00        ..      NOP      
        0x00000742:    b92e        ..      CBNZ     r6,0x750 ; HAL_GPIO_WritePin + 68
        0x00000744:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000748:    2101        .!      MOVS     r1,#1
        0x0000074a:    4081        .@      LSLS     r1,r1,r0
        0x0000074c:    438c        .C      BICS     r4,r4,r1
        0x0000074e:    e005        ..      B        0x75c ; HAL_GPIO_WritePin + 80
        0x00000750:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000754:    2101        .!      MOVS     r1,#1
        0x00000756:    fa01f000    ....    LSL      r0,r1,r0
        0x0000075a:    4304        .C      ORRS     r4,r4,r0
        0x0000075c:    b2a0        ..      UXTH     r0,r4
        0x0000075e:    f000fcc7    ....    BL       gpio_portbdataregister_setf ; 0x10f0
        0x00000762:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000764:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000768:    b530        0.      PUSH     {r4,r5,lr}
        0x0000076a:    460a        .F      MOV      r2,r1
        0x0000076c:    bf00        ..      NOP      
        0x0000076e:    4b0b        .K      LDR      r3,[pc,#44] ; [0x79c] = 0x40007000
        0x00000770:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000772:    b29b        ..      UXTH     r3,r3
        0x00000774:    4619        .F      MOV      r1,r3
        0x00000776:    2a01        .*      CMP      r2,#1
        0x00000778:    d103        ..      BNE      0x782 ; HAL_GPIO_setIrqLevel + 26
        0x0000077a:    2301        .#      MOVS     r3,#1
        0x0000077c:    4083        .@      LSLS     r3,r3,r0
        0x0000077e:    4319        .C      ORRS     r1,r1,r3
        0x00000780:    e002        ..      B        0x788 ; HAL_GPIO_setIrqLevel + 32
        0x00000782:    2301        .#      MOVS     r3,#1
        0x00000784:    4083        .@      LSLS     r3,r3,r0
        0x00000786:    4399        .C      BICS     r1,r1,r3
        0x00000788:    b28b        ..      UXTH     r3,r1
        0x0000078a:    4c04        .L      LDR      r4,[pc,#16] ; [0x79c] = 0x40007000
        0x0000078c:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x0000078e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000792:    4d02        .M      LDR      r5,[pc,#8] ; [0x79c] = 0x40007000
        0x00000794:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000796:    bf00        ..      NOP      
        0x00000798:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x0000079a:    0000        ..      DCW    0
        0x0000079c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x000007a0:    bf00        ..      NOP      
        0x000007a2:    4904        .I      LDR      r1,[pc,#16] ; [0x7b4] = 0x40020000
        0x000007a4:    6909        .i      LDR      r1,[r1,#0x10]
        0x000007a6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000007aa:    4a02        .J      LDR      r2,[pc,#8] ; [0x7b4] = 0x40020000
        0x000007ac:    6111        .a      STR      r1,[r2,#0x10]
        0x000007ae:    bf00        ..      NOP      
        0x000007b0:    4770        pG      BX       lr
    $d
        0x000007b2:    0000        ..      DCW    0
        0x000007b4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x000007b8:    b510        ..      PUSH     {r4,lr}
        0x000007ba:    4604        .F      MOV      r4,r0
        0x000007bc:    1e60        `.      SUBS     r0,r4,#1
        0x000007be:    280f        .(      CMP      r0,#0xf
        0x000007c0:    dc00        ..      BGT      0x7c4 ; HAL_SYSCON_Set_HClk_Div + 12
        0x000007c2:    e004        ..      B        0x7ce ; HAL_SYSCON_Set_HClk_Div + 22
        0x000007c4:    2225        %"      MOVS     r2,#0x25
        0x000007c6:    a108        ..      ADR      r1,{pc}+0x22 ; 0x7e8
        0x000007c8:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x808
        0x000007ca:    f000fc51    ..Q.    BL       __aeabi_assert ; 0x1070
        0x000007ce:    1e61        a.      SUBS     r1,r4,#1
        0x000007d0:    b2c8        ..      UXTB     r0,r1
        0x000007d2:    4913        .I      LDR      r1,[pc,#76] ; [0x820] = 0x40020000
        0x000007d4:    6849        Ih      LDR      r1,[r1,#4]
        0x000007d6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000007da:    4a11        .J      LDR      r2,[pc,#68] ; [0x820] = 0x40020000
        0x000007dc:    6051        Q`      STR      r1,[r2,#4]
        0x000007de:    bf00        ..      NOP      
        0x000007e0:    2001        .       MOVS     r0,#1
        0x000007e2:    f000fca3    ....    BL       sysc_awo_div_update_set ; 0x112c
        0x000007e6:    bd10        ..      POP      {r4,pc}
    $d
        0x000007e8:    735c2e2e    ..\s    DCD    1935420974
        0x000007ec:    735c6b64    dk\s    DCD    1935436644
        0x000007f0:    735c6372    rc\s    DCD    1935434610
        0x000007f4:    645c636f    oc\d    DCD    1683776367
        0x000007f8:    65766972    rive    DCD    1702259058
        0x000007fc:    79735c72    r\sy    DCD    2037603442
        0x00000800:    6e6f6373    scon    DCD    1852793715
        0x00000804:    0000632e    .c..    DCD    25390
        0x00000808:    62686128    (ahb    DCD    1651007784
        0x0000080c:    7669645f    _div    DCD    1986618463
        0x00000810:    72656469    ider    DCD    1919247465
        0x00000814:    3c29312d    -1)<    DCD    1009332525
        0x00000818:    6678303d    =0xf    DCD    1719152701
        0x0000081c:    00000000    ....    DCD    0
        0x00000820:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000824:    b510        ..      PUSH     {r4,lr}
        0x00000826:    4604        .F      MOV      r4,r0
        0x00000828:    1e60        `.      SUBS     r0,r4,#1
        0x0000082a:    280f        .(      CMP      r0,#0xf
        0x0000082c:    dc00        ..      BGT      0x830 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x0000082e:    e004        ..      B        0x83a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000830:    222c        ,"      MOVS     r2,#0x2c
        0x00000832:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x85c
        0x00000834:    a011        ..      ADR      r0,{pc}+0x48 ; 0x87c
        0x00000836:    f000fc1b    ....    BL       __aeabi_assert ; 0x1070
        0x0000083a:    1e61        a.      SUBS     r1,r4,#1
        0x0000083c:    b2c8        ..      UXTB     r0,r1
        0x0000083e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000842:    6849        Ih      LDR      r1,[r1,#4]
        0x00000844:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000848:    f04f4280    O..B    MOV      r2,#0x40000000
        0x0000084c:    6051        Q`      STR      r1,[r2,#4]
        0x0000084e:    bf00        ..      NOP      
        0x00000850:    2001        .       MOVS     r0,#1
        0x00000852:    0781        ..      LSLS     r1,r0,#30
        0x00000854:    6008        .`      STR      r0,[r1,#0]
        0x00000856:    bf00        ..      NOP      
        0x00000858:    bd10        ..      POP      {r4,pc}
    $d
        0x0000085a:    0000        ..      DCW    0
        0x0000085c:    735c2e2e    ..\s    DCD    1935420974
        0x00000860:    735c6b64    dk\s    DCD    1935436644
        0x00000864:    735c6372    rc\s    DCD    1935434610
        0x00000868:    645c636f    oc\d    DCD    1683776367
        0x0000086c:    65766972    rive    DCD    1702259058
        0x00000870:    79735c72    r\sy    DCD    2037603442
        0x00000874:    6e6f6373    scon    DCD    1852793715
        0x00000878:    0000632e    .c..    DCD    25390
        0x0000087c:    62706128    (apb    DCD    1651532072
        0x00000880:    69645f30    0_di    DCD    1768185648
        0x00000884:    65646976    vide    DCD    1701079414
        0x00000888:    29312d72    r-1)    DCD    691088754
        0x0000088c:    78303d3c    <=0x    DCD    2016427324
        0x00000890:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000894:    b510        ..      PUSH     {r4,lr}
        0x00000896:    4604        .F      MOV      r4,r0
        0x00000898:    1e60        `.      SUBS     r0,r4,#1
        0x0000089a:    280f        .(      CMP      r0,#0xf
        0x0000089c:    dc00        ..      BGT      0x8a0 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x0000089e:    e004        ..      B        0x8aa ; HAL_SYSCON_Set_PClk1_Div + 22
        0x000008a0:    2234        4"      MOVS     r2,#0x34
        0x000008a2:    a108        ..      ADR      r1,{pc}+0x22 ; 0x8c4
        0x000008a4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x8e4
        0x000008a6:    f000fbe3    ....    BL       __aeabi_assert ; 0x1070
        0x000008aa:    1e61        a.      SUBS     r1,r4,#1
        0x000008ac:    b2c8        ..      UXTB     r0,r1
        0x000008ae:    4913        .I      LDR      r1,[pc,#76] ; [0x8fc] = 0x40020000
        0x000008b0:    6849        Ih      LDR      r1,[r1,#4]
        0x000008b2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x000008b6:    4a11        .J      LDR      r2,[pc,#68] ; [0x8fc] = 0x40020000
        0x000008b8:    6051        Q`      STR      r1,[r2,#4]
        0x000008ba:    bf00        ..      NOP      
        0x000008bc:    2002        .       MOVS     r0,#2
        0x000008be:    f000fc35    ..5.    BL       sysc_awo_div_update_set ; 0x112c
        0x000008c2:    bd10        ..      POP      {r4,pc}
    $d
        0x000008c4:    735c2e2e    ..\s    DCD    1935420974
        0x000008c8:    735c6b64    dk\s    DCD    1935436644
        0x000008cc:    735c6372    rc\s    DCD    1935434610
        0x000008d0:    645c636f    oc\d    DCD    1683776367
        0x000008d4:    65766972    rive    DCD    1702259058
        0x000008d8:    79735c72    r\sy    DCD    2037603442
        0x000008dc:    6e6f6373    scon    DCD    1852793715
        0x000008e0:    0000632e    .c..    DCD    25390
        0x000008e4:    62706128    (apb    DCD    1651532072
        0x000008e8:    69645f31    1_di    DCD    1768185649
        0x000008ec:    65646976    vide    DCD    1701079414
        0x000008f0:    29312d72    r-1)    DCD    691088754
        0x000008f4:    78303d3c    <=0x    DCD    2016427324
        0x000008f8:    00000066    f...    DCD    102
        0x000008fc:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000900:    b570        p.      PUSH     {r4-r6,lr}
        0x00000902:    4605        .F      MOV      r5,r0
        0x00000904:    460c        .F      MOV      r4,r1
        0x00000906:    1e60        `.      SUBS     r0,r4,#1
        0x00000908:    f5b05f00    ..._    CMP      r0,#0x2000
        0x0000090c:    da00        ..      BGE      0x910 ; HAL_SYSCON_Set_RTC_Div + 16
        0x0000090e:    e004        ..      B        0x91a ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000910:    223c        <"      MOVS     r2,#0x3c
        0x00000912:    a112        ..      ADR      r1,{pc}+0x4a ; 0x95c
        0x00000914:    a019        ..      ADR      r0,{pc}+0x68 ; 0x97c
        0x00000916:    f000fbab    ....    BL       __aeabi_assert ; 0x1070
        0x0000091a:    2d01        .-      CMP      r5,#1
        0x0000091c:    dc00        ..      BGT      0x920 ; HAL_SYSCON_Set_RTC_Div + 32
        0x0000091e:    e004        ..      B        0x92a ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000920:    223d        ="      MOVS     r2,#0x3d
        0x00000922:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x95c
        0x00000924:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x994
        0x00000926:    f000fba3    ....    BL       __aeabi_assert ; 0x1070
        0x0000092a:    b935        5.      CBNZ     r5,0x93a ; HAL_SYSCON_Set_RTC_Div + 58
        0x0000092c:    2000        .       MOVS     r0,#0
        0x0000092e:    f000fc03    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1138
        0x00000932:    2004        .       MOVS     r0,#4
        0x00000934:    f000fbfa    ....    BL       sysc_awo_div_update_set ; 0x112c
        0x00000938:    e00e        ..      B        0x958 ; HAL_SYSCON_Set_RTC_Div + 88
        0x0000093a:    2c02        .,      CMP      r4,#2
        0x0000093c:    db00        ..      BLT      0x940 ; HAL_SYSCON_Set_RTC_Div + 64
        0x0000093e:    e004        ..      B        0x94a ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000940:    2247        G"      MOVS     r2,#0x47
        0x00000942:    a106        ..      ADR      r1,{pc}+0x1a ; 0x95c
        0x00000944:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x9b0
        0x00000946:    f000fb93    ....    BL       __aeabi_assert ; 0x1070
        0x0000094a:    1e61        a.      SUBS     r1,r4,#1
        0x0000094c:    b288        ..      UXTH     r0,r1
        0x0000094e:    f000fbf3    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1138
        0x00000952:    2004        .       MOVS     r0,#4
        0x00000954:    f000fbea    ....    BL       sysc_awo_div_update_set ; 0x112c
        0x00000958:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000095a:    0000        ..      DCW    0
        0x0000095c:    735c2e2e    ..\s    DCD    1935420974
        0x00000960:    735c6b64    dk\s    DCD    1935436644
        0x00000964:    735c6372    rc\s    DCD    1935434610
        0x00000968:    645c636f    oc\d    DCD    1683776367
        0x0000096c:    65766972    rive    DCD    1702259058
        0x00000970:    79735c72    r\sy    DCD    2037603442
        0x00000974:    6e6f6373    scon    DCD    1852793715
        0x00000978:    0000632e    .c..    DCD    25390
        0x0000097c:    63747228    (rtc    DCD    1668575784
        0x00000980:    7669645f    _div    DCD    1986618463
        0x00000984:    72656469    ider    DCD    1919247465
        0x00000988:    3c29312d    -1)<    DCD    1009332525
        0x0000098c:    3178303d    =0x1    DCD    829960253
        0x00000990:    00666666    fff.    DCD    6710886
        0x00000994:    5f637472    rtc_    DCD    1600353394
        0x00000998:    3c637273    src<    DCD    1013150323
        0x0000099c:    6374723d    =rtc    DCD    1668575805
        0x000009a0:    5f6b6c63    clk_    DCD    1600875619
        0x000009a4:    6d6f7266    from    DCD    1836020326
        0x000009a8:    6268615f    _ahb    DCD    1651007839
        0x000009ac:    00000000    ....    DCD    0
        0x000009b0:    5f637472    rtc_    DCD    1600353394
        0x000009b4:    69766964    divi    DCD    1769367908
        0x000009b8:    3e726564    der>    DCD    1047684452
        0x000009bc:    0000323d    =2..    DCD    12861
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000009c0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000009c4:    4604        .F      MOV      r4,r0
        0x000009c6:    460d        .F      MOV      r5,r1
        0x000009c8:    4616        .F      MOV      r6,r2
        0x000009ca:    bf00        ..      NOP      
        0x000009cc:    480d        .H      LDR      r0,[pc,#52] ; [0xa04] = 0x12b4
        0x000009ce:    7800        .x      LDRB     r0,[r0,#0]
        0x000009d0:    b908        ..      CBNZ     r0,0x9d6 ; SEGGER_RTT_Write + 22
        0x000009d2:    f000f999    ....    BL       _DoInit ; 0xd08
        0x000009d6:    bf00        ..      NOP      
        0x000009d8:    f3ef8011    ....    MRS      r0,BASEPRI
        0x000009dc:    4607        .F      MOV      r7,r0
        0x000009de:    2020                MOVS     r0,#0x20
        0x000009e0:    f3808811    ....    MSR      BASEPRI,r0
        0x000009e4:    bf00        ..      NOP      
        0x000009e6:    bf00        ..      NOP      
        0x000009e8:    4632        2F      MOV      r2,r6
        0x000009ea:    4629        )F      MOV      r1,r5
        0x000009ec:    4620         F      MOV      r0,r4
        0x000009ee:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0xa08
        0x000009f2:    4680        .F      MOV      r8,r0
        0x000009f4:    b2f8        ..      UXTB     r0,r7
        0x000009f6:    f3808811    ....    MSR      BASEPRI,r0
        0x000009fa:    bf00        ..      NOP      
        0x000009fc:    bf00        ..      NOP      
        0x000009fe:    4640        @F      MOV      r0,r8
        0x00000a00:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000a04:    000012b4    ....    DCD    4788
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000a08:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000a0c:    4607        .F      MOV      r7,r0
        0x00000a0e:    4688        .F      MOV      r8,r1
        0x00000a10:    4616        .F      MOV      r6,r2
        0x00000a12:    46c2        .F      MOV      r10,r8
        0x00000a14:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x00000a18:    481b        .H      LDR      r0,[pc,#108] ; [0xa88] = 0x12cc
        0x00000a1a:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x00000a1e:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x00000a22:    b120         .      CBZ      r0,0xa2e ; SEGGER_RTT_WriteNoLock + 38
        0x00000a24:    2801        .(      CMP      r0,#1
        0x00000a26:    d011        ..      BEQ      0xa4c ; SEGGER_RTT_WriteNoLock + 68
        0x00000a28:    2802        .(      CMP      r0,#2
        0x00000a2a:    d126        &.      BNE      0xa7a ; SEGGER_RTT_WriteNoLock + 114
        0x00000a2c:    e01e        ..      B        0xa6c ; SEGGER_RTT_WriteNoLock + 100
        0x00000a2e:    4648        HF      MOV      r0,r9
        0x00000a30:    f000f9a2    ....    BL       _GetAvailWriteSpace ; 0xd78
        0x00000a34:    4605        .F      MOV      r5,r0
        0x00000a36:    42b5        .B      CMP      r5,r6
        0x00000a38:    d201        ..      BCS      0xa3e ; SEGGER_RTT_WriteNoLock + 54
        0x00000a3a:    2400        .$      MOVS     r4,#0
        0x00000a3c:    e005        ..      B        0xa4a ; SEGGER_RTT_WriteNoLock + 66
        0x00000a3e:    4634        4F      MOV      r4,r6
        0x00000a40:    4632        2F      MOV      r2,r6
        0x00000a42:    4651        QF      MOV      r1,r10
        0x00000a44:    4648        HF      MOV      r0,r9
        0x00000a46:    f000faec    ....    BL       _WriteNoCheck ; 0x1022
        0x00000a4a:    e018        ..      B        0xa7e ; SEGGER_RTT_WriteNoLock + 118
        0x00000a4c:    4648        HF      MOV      r0,r9
        0x00000a4e:    f000f993    ....    BL       _GetAvailWriteSpace ; 0xd78
        0x00000a52:    4605        .F      MOV      r5,r0
        0x00000a54:    42b5        .B      CMP      r5,r6
        0x00000a56:    d201        ..      BCS      0xa5c ; SEGGER_RTT_WriteNoLock + 84
        0x00000a58:    4628        (F      MOV      r0,r5
        0x00000a5a:    e000        ..      B        0xa5e ; SEGGER_RTT_WriteNoLock + 86
        0x00000a5c:    4630        0F      MOV      r0,r6
        0x00000a5e:    4604        .F      MOV      r4,r0
        0x00000a60:    4622        "F      MOV      r2,r4
        0x00000a62:    4651        QF      MOV      r1,r10
        0x00000a64:    4648        HF      MOV      r0,r9
        0x00000a66:    f000fadc    ....    BL       _WriteNoCheck ; 0x1022
        0x00000a6a:    e008        ..      B        0xa7e ; SEGGER_RTT_WriteNoLock + 118
        0x00000a6c:    4632        2F      MOV      r2,r6
        0x00000a6e:    4651        QF      MOV      r1,r10
        0x00000a70:    4648        HF      MOV      r0,r9
        0x00000a72:    f000fa9d    ....    BL       _WriteBlocking ; 0xfb0
        0x00000a76:    4604        .F      MOV      r4,r0
        0x00000a78:    e001        ..      B        0xa7e ; SEGGER_RTT_WriteNoLock + 118
        0x00000a7a:    2400        .$      MOVS     r4,#0
        0x00000a7c:    bf00        ..      NOP      
        0x00000a7e:    bf00        ..      NOP      
        0x00000a80:    4620         F      MOV      r0,r4
        0x00000a82:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x00000a86:    0000        ..      DCW    0
        0x00000a88:    000012cc    ....    DCD    4812
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00000a8c:    b40f        ..      PUSH     {r0-r3}
        0x00000a8e:    b538        8.      PUSH     {r3-r5,lr}
        0x00000a90:    4604        .F      MOV      r4,r0
        0x00000a92:    a806        ..      ADD      r0,sp,#0x18
        0x00000a94:    9000        ..      STR      r0,[sp,#0]
        0x00000a96:    466a        jF      MOV      r2,sp
        0x00000a98:    4620         F      MOV      r0,r4
        0x00000a9a:    9905        ..      LDR      r1,[sp,#0x14]
        0x00000a9c:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0xaae
        0x00000aa0:    4605        .F      MOV      r5,r0
        0x00000aa2:    2000        .       MOVS     r0,#0
        0x00000aa4:    9000        ..      STR      r0,[sp,#0]
        0x00000aa6:    4628        (F      MOV      r0,r5
        0x00000aa8:    bc38        8.      POP      {r3-r5}
        0x00000aaa:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x00000aae:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00000ab2:    b099        ..      SUB      sp,sp,#0x64
        0x00000ab4:    4682        .F      MOV      r10,r0
        0x00000ab6:    460d        .F      MOV      r5,r1
        0x00000ab8:    4614        .F      MOV      r4,r2
        0x00000aba:    a803        ..      ADD      r0,sp,#0xc
        0x00000abc:    9014        ..      STR      r0,[sp,#0x50]
        0x00000abe:    2040        @       MOVS     r0,#0x40
        0x00000ac0:    9015        ..      STR      r0,[sp,#0x54]
        0x00000ac2:    2000        .       MOVS     r0,#0
        0x00000ac4:    9016        ..      STR      r0,[sp,#0x58]
        0x00000ac6:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x00000aca:    9017        ..      STR      r0,[sp,#0x5c]
        0x00000acc:    bf00        ..      NOP      
        0x00000ace:    782e        .x      LDRB     r6,[r5,#0]
        0x00000ad0:    1c6d        m.      ADDS     r5,r5,#1
        0x00000ad2:    b906        ..      CBNZ     r6,0xad6 ; SEGGER_RTT_vprintf + 40
        0x00000ad4:    e0dd        ..      B        0xc92 ; SEGGER_RTT_vprintf + 484
        0x00000ad6:    2e25        %.      CMP      r6,#0x25
        0x00000ad8:    d179        y.      BNE      0xbce ; SEGGER_RTT_vprintf + 288
        0x00000ada:    2700        .'      MOVS     r7,#0
        0x00000adc:    f04f0901    O...    MOV      r9,#1
        0x00000ae0:    bf00        ..      NOP      
        0x00000ae2:    782e        .x      LDRB     r6,[r5,#0]
        0x00000ae4:    2e23        #.      CMP      r6,#0x23
        0x00000ae6:    d012        ..      BEQ      0xb0e ; SEGGER_RTT_vprintf + 96
        0x00000ae8:    2e2b        +.      CMP      r6,#0x2b
        0x00000aea:    d00c        ..      BEQ      0xb06 ; SEGGER_RTT_vprintf + 88
        0x00000aec:    2e2d        -.      CMP      r6,#0x2d
        0x00000aee:    d002        ..      BEQ      0xaf6 ; SEGGER_RTT_vprintf + 72
        0x00000af0:    2e30        0.      CMP      r6,#0x30
        0x00000af2:    d110        ..      BNE      0xb16 ; SEGGER_RTT_vprintf + 104
        0x00000af4:    e003        ..      B        0xafe ; SEGGER_RTT_vprintf + 80
        0x00000af6:    f0470701    G...    ORR      r7,r7,#1
        0x00000afa:    1c6d        m.      ADDS     r5,r5,#1
        0x00000afc:    e00e        ..      B        0xb1c ; SEGGER_RTT_vprintf + 110
        0x00000afe:    f0470702    G...    ORR      r7,r7,#2
        0x00000b02:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b04:    e00a        ..      B        0xb1c ; SEGGER_RTT_vprintf + 110
        0x00000b06:    f0470704    G...    ORR      r7,r7,#4
        0x00000b0a:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b0c:    e006        ..      B        0xb1c ; SEGGER_RTT_vprintf + 110
        0x00000b0e:    f0470708    G...    ORR      r7,r7,#8
        0x00000b12:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b14:    e002        ..      B        0xb1c ; SEGGER_RTT_vprintf + 110
        0x00000b16:    f04f0900    O...    MOV      r9,#0
        0x00000b1a:    bf00        ..      NOP      
        0x00000b1c:    bf00        ..      NOP      
        0x00000b1e:    f1b90f00    ....    CMP      r9,#0
        0x00000b22:    d1de        ..      BNE      0xae2 ; SEGGER_RTT_vprintf + 52
        0x00000b24:    f04f0800    O...    MOV      r8,#0
        0x00000b28:    bf00        ..      NOP      
        0x00000b2a:    782e        .x      LDRB     r6,[r5,#0]
        0x00000b2c:    2e30        0.      CMP      r6,#0x30
        0x00000b2e:    db01        ..      BLT      0xb34 ; SEGGER_RTT_vprintf + 134
        0x00000b30:    2e39        9.      CMP      r6,#0x39
        0x00000b32:    dd00        ..      BLE      0xb36 ; SEGGER_RTT_vprintf + 136
        0x00000b34:    e007        ..      B        0xb46 ; SEGGER_RTT_vprintf + 152
        0x00000b36:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b38:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00000b3c:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x00000b40:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x00000b44:    e7f1        ..      B        0xb2a ; SEGGER_RTT_vprintf + 124
        0x00000b46:    bf00        ..      NOP      
        0x00000b48:    2000        .       MOVS     r0,#0
        0x00000b4a:    9013        ..      STR      r0,[sp,#0x4c]
        0x00000b4c:    782e        .x      LDRB     r6,[r5,#0]
        0x00000b4e:    2e2e        ..      CMP      r6,#0x2e
        0x00000b50:    d112        ..      BNE      0xb78 ; SEGGER_RTT_vprintf + 202
        0x00000b52:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b54:    bf00        ..      NOP      
        0x00000b56:    782e        .x      LDRB     r6,[r5,#0]
        0x00000b58:    2e30        0.      CMP      r6,#0x30
        0x00000b5a:    db01        ..      BLT      0xb60 ; SEGGER_RTT_vprintf + 178
        0x00000b5c:    2e39        9.      CMP      r6,#0x39
        0x00000b5e:    dd00        ..      BLE      0xb62 ; SEGGER_RTT_vprintf + 180
        0x00000b60:    e009        ..      B        0xb76 ; SEGGER_RTT_vprintf + 200
        0x00000b62:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b64:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00000b68:    9913        ..      LDR      r1,[sp,#0x4c]
        0x00000b6a:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00000b6e:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x00000b72:    9013        ..      STR      r0,[sp,#0x4c]
        0x00000b74:    e7ef        ..      B        0xb56 ; SEGGER_RTT_vprintf + 168
        0x00000b76:    bf00        ..      NOP      
        0x00000b78:    782e        .x      LDRB     r6,[r5,#0]
        0x00000b7a:    bf00        ..      NOP      
        0x00000b7c:    2e6c        l.      CMP      r6,#0x6c
        0x00000b7e:    d001        ..      BEQ      0xb84 ; SEGGER_RTT_vprintf + 214
        0x00000b80:    2e68        h.      CMP      r6,#0x68
        0x00000b82:    d102        ..      BNE      0xb8a ; SEGGER_RTT_vprintf + 220
        0x00000b84:    1c6d        m.      ADDS     r5,r5,#1
        0x00000b86:    782e        .x      LDRB     r6,[r5,#0]
        0x00000b88:    e000        ..      B        0xb8c ; SEGGER_RTT_vprintf + 222
        0x00000b8a:    e000        ..      B        0xb8e ; SEGGER_RTT_vprintf + 224
        0x00000b8c:    e7f6        ..      B        0xb7c ; SEGGER_RTT_vprintf + 206
        0x00000b8e:    bf00        ..      NOP      
        0x00000b90:    2e70        p.      CMP      r6,#0x70
        0x00000b92:    d05d        ].      BEQ      0xc50 ; SEGGER_RTT_vprintf + 418
        0x00000b94:    dc08        ..      BGT      0xba8 ; SEGGER_RTT_vprintf + 250
        0x00000b96:    2e25        %.      CMP      r6,#0x25
        0x00000b98:    d06a        j.      BEQ      0xc70 ; SEGGER_RTT_vprintf + 450
        0x00000b9a:    2e58        X.      CMP      r6,#0x58
        0x00000b9c:    d035        5.      BEQ      0xc0a ; SEGGER_RTT_vprintf + 348
        0x00000b9e:    2e63        c.      CMP      r6,#0x63
        0x00000ba0:    d009        ..      BEQ      0xbb6 ; SEGGER_RTT_vprintf + 264
        0x00000ba2:    2e64        d.      CMP      r6,#0x64
        0x00000ba4:    d169        i.      BNE      0xc7a ; SEGGER_RTT_vprintf + 460
        0x00000ba6:    e013        ..      B        0xbd0 ; SEGGER_RTT_vprintf + 290
        0x00000ba8:    2e73        s.      CMP      r6,#0x73
        0x00000baa:    d03c        <.      BEQ      0xc26 ; SEGGER_RTT_vprintf + 376
        0x00000bac:    2e75        u.      CMP      r6,#0x75
        0x00000bae:    d01d        ..      BEQ      0xbec ; SEGGER_RTT_vprintf + 318
        0x00000bb0:    2e78        x.      CMP      r6,#0x78
        0x00000bb2:    d162        b.      BNE      0xc7a ; SEGGER_RTT_vprintf + 460
        0x00000bb4:    e028        (.      B        0xc08 ; SEGGER_RTT_vprintf + 346
        0x00000bb6:    6821        !h      LDR      r1,[r4,#0]
        0x00000bb8:    1d08        ..      ADDS     r0,r1,#4
        0x00000bba:    6020         `      STR      r0,[r4,#0]
        0x00000bbc:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00000bc0:    f0090bff    ....    AND      r11,r9,#0xff
        0x00000bc4:    4659        YF      MOV      r1,r11
        0x00000bc6:    a814        ..      ADD      r0,sp,#0x50
        0x00000bc8:    f000f9d0    ....    BL       _StoreChar ; 0xf6c
        0x00000bcc:    e056        V.      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000bce:    e058        X.      B        0xc82 ; SEGGER_RTT_vprintf + 468
        0x00000bd0:    6821        !h      LDR      r1,[r4,#0]
        0x00000bd2:    1d08        ..      ADDS     r0,r1,#4
        0x00000bd4:    6020         `      STR      r0,[r4,#0]
        0x00000bd6:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00000bda:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x00000bde:    220a        ."      MOVS     r2,#0xa
        0x00000be0:    4649        IF      MOV      r1,r9
        0x00000be2:    a814        ..      ADD      r0,sp,#0x50
        0x00000be4:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00000be6:    f000f8d5    ....    BL       _PrintInt ; 0xd94
        0x00000bea:    e047        G.      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000bec:    6821        !h      LDR      r1,[r4,#0]
        0x00000bee:    1d08        ..      ADDS     r0,r1,#4
        0x00000bf0:    6020         `      STR      r0,[r4,#0]
        0x00000bf2:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00000bf6:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x00000bfa:    220a        ."      MOVS     r2,#0xa
        0x00000bfc:    4649        IF      MOV      r1,r9
        0x00000bfe:    a814        ..      ADD      r0,sp,#0x50
        0x00000c00:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00000c02:    f000f93d    ..=.    BL       _PrintUnsigned ; 0xe80
        0x00000c06:    e039        9.      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000c08:    bf00        ..      NOP      
        0x00000c0a:    6821        !h      LDR      r1,[r4,#0]
        0x00000c0c:    1d08        ..      ADDS     r0,r1,#4
        0x00000c0e:    6020         `      STR      r0,[r4,#0]
        0x00000c10:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00000c14:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x00000c18:    2210        ."      MOVS     r2,#0x10
        0x00000c1a:    4649        IF      MOV      r1,r9
        0x00000c1c:    a814        ..      ADD      r0,sp,#0x50
        0x00000c1e:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00000c20:    f000f92e    ....    BL       _PrintUnsigned ; 0xe80
        0x00000c24:    e02a        *.      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000c26:    6821        !h      LDR      r1,[r4,#0]
        0x00000c28:    1d08        ..      ADDS     r0,r1,#4
        0x00000c2a:    6020         `      STR      r0,[r4,#0]
        0x00000c2c:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x00000c30:    bf00        ..      NOP      
        0x00000c32:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x00000c36:    f10b0b01    ....    ADD      r11,r11,#1
        0x00000c3a:    b906        ..      CBNZ     r6,0xc3e ; SEGGER_RTT_vprintf + 400
        0x00000c3c:    e006        ..      B        0xc4c ; SEGGER_RTT_vprintf + 414
        0x00000c3e:    4631        1F      MOV      r1,r6
        0x00000c40:    a814        ..      ADD      r0,sp,#0x50
        0x00000c42:    f000f993    ....    BL       _StoreChar ; 0xf6c
        0x00000c46:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00000c48:    2800        .(      CMP      r0,#0
        0x00000c4a:    daf2        ..      BGE      0xc32 ; SEGGER_RTT_vprintf + 388
        0x00000c4c:    bf00        ..      NOP      
        0x00000c4e:    e015        ..      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000c50:    6821        !h      LDR      r1,[r4,#0]
        0x00000c52:    1d08        ..      ADDS     r0,r1,#4
        0x00000c54:    6020         `      STR      r0,[r4,#0]
        0x00000c56:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00000c5a:    2000        .       MOVS     r0,#0
        0x00000c5c:    2108        .!      MOVS     r1,#8
        0x00000c5e:    460b        .F      MOV      r3,r1
        0x00000c60:    2210        ."      MOVS     r2,#0x10
        0x00000c62:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x00000c66:    4649        IF      MOV      r1,r9
        0x00000c68:    a814        ..      ADD      r0,sp,#0x50
        0x00000c6a:    f000f909    ....    BL       _PrintUnsigned ; 0xe80
        0x00000c6e:    e005        ..      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000c70:    2125        %!      MOVS     r1,#0x25
        0x00000c72:    a814        ..      ADD      r0,sp,#0x50
        0x00000c74:    f000f97a    ..z.    BL       _StoreChar ; 0xf6c
        0x00000c78:    e000        ..      B        0xc7c ; SEGGER_RTT_vprintf + 462
        0x00000c7a:    bf00        ..      NOP      
        0x00000c7c:    bf00        ..      NOP      
        0x00000c7e:    1c6d        m.      ADDS     r5,r5,#1
        0x00000c80:    e003        ..      B        0xc8a ; SEGGER_RTT_vprintf + 476
        0x00000c82:    4631        1F      MOV      r1,r6
        0x00000c84:    a814        ..      ADD      r0,sp,#0x50
        0x00000c86:    f000f971    ..q.    BL       _StoreChar ; 0xf6c
        0x00000c8a:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00000c8c:    2800        .(      CMP      r0,#0
        0x00000c8e:    f6bfaf1e    ....    BGE      0xace ; SEGGER_RTT_vprintf + 32
        0x00000c92:    bf00        ..      NOP      
        0x00000c94:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00000c96:    2800        .(      CMP      r0,#0
        0x00000c98:    dd0a        ..      BLE      0xcb0 ; SEGGER_RTT_vprintf + 514
        0x00000c9a:    9816        ..      LDR      r0,[sp,#0x58]
        0x00000c9c:    b120         .      CBZ      r0,0xca8 ; SEGGER_RTT_vprintf + 506
        0x00000c9e:    a903        ..      ADD      r1,sp,#0xc
        0x00000ca0:    4650        PF      MOV      r0,r10
        0x00000ca2:    9a16        ..      LDR      r2,[sp,#0x58]
        0x00000ca4:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0x9c0
        0x00000ca8:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x00000cac:    4408        .D      ADD      r0,r0,r1
        0x00000cae:    9017        ..      STR      r0,[sp,#0x5c]
        0x00000cb0:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00000cb2:    b019        ..      ADD      sp,sp,#0x64
        0x00000cb4:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SystemInit
    SystemInit
        0x00000cb8:    b510        ..      PUSH     {r4,lr}
        0x00000cba:    bf00        ..      NOP      
        0x00000cbc:    480f        .H      LDR      r0,[pc,#60] ; [0xcfc] = 0x4000b000
        0x00000cbe:    6800        .h      LDR      r0,[r0,#0]
        0x00000cc0:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x00000cc4:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x00000cc8:    d1f8        ..      BNE      0xcbc ; SystemInit + 4
        0x00000cca:    f64e2060    N.`     MOV      r0,#0xea60
        0x00000cce:    f000f9ef    ....    BL       delay ; 0x10b0
        0x00000cd2:    480b        .H      LDR      r0,[pc,#44] ; [0xd00] = 0x5f5e100
        0x00000cd4:    490b        .I      LDR      r1,[pc,#44] ; [0xd04] = 0x12ac
        0x00000cd6:    6008        .`      STR      r0,[r1,#0]
        0x00000cd8:    2008        .       MOVS     r0,#8
        0x00000cda:    f7fffd61    ..a.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0x7a0
        0x00000cde:    2002        .       MOVS     r0,#2
        0x00000ce0:    f7fffd6a    ..j.    BL       HAL_SYSCON_Set_HClk_Div ; 0x7b8
        0x00000ce4:    2004        .       MOVS     r0,#4
        0x00000ce6:    f7fffd9d    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0x824
        0x00000cea:    2002        .       MOVS     r0,#2
        0x00000cec:    f7fffdd2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0x894
        0x00000cf0:    2164        d!      MOVS     r1,#0x64
        0x00000cf2:    2001        .       MOVS     r0,#1
        0x00000cf4:    f7fffe04    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0x900
        0x00000cf8:    bd10        ..      POP      {r4,pc}
    $d
        0x00000cfa:    0000        ..      DCW    0
        0x00000cfc:    4000b000    ...@    DCD    1073786880
        0x00000d00:    05f5e100    ....    DCD    100000000
        0x00000d04:    000012ac    ....    DCD    4780
    $t
    i._DoInit
    _DoInit
        0x00000d08:    b510        ..      PUSH     {r4,lr}
        0x00000d0a:    4c12        .L      LDR      r4,[pc,#72] ; [0xd54] = 0x12b4
        0x00000d0c:    2003        .       MOVS     r0,#3
        0x00000d0e:    6120         a      STR      r0,[r4,#0x10]
        0x00000d10:    6160        `a      STR      r0,[r4,#0x14]
        0x00000d12:    a011        ..      ADR      r0,{pc}+0x46 ; 0xd58
        0x00000d14:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000d16:    4913        .I      LDR      r1,[pc,#76] ; [0xd64] = 0x135c
        0x00000d18:    61e1        .a      STR      r1,[r4,#0x1c]
        0x00000d1a:    f44f6180    O..a    MOV      r1,#0x400
        0x00000d1e:    6221        !b      STR      r1,[r4,#0x20]
        0x00000d20:    2100        .!      MOVS     r1,#0
        0x00000d22:    62a1        .b      STR      r1,[r4,#0x28]
        0x00000d24:    6261        ab      STR      r1,[r4,#0x24]
        0x00000d26:    62e1        .b      STR      r1,[r4,#0x2c]
        0x00000d28:    a00b        ..      ADR      r0,{pc}+0x30 ; 0xd58
        0x00000d2a:    6620         f      STR      r0,[r4,#0x60]
        0x00000d2c:    490e        .I      LDR      r1,[pc,#56] ; [0xd68] = 0x175c
        0x00000d2e:    6661        af      STR      r1,[r4,#0x64]
        0x00000d30:    2110        .!      MOVS     r1,#0x10
        0x00000d32:    66a1        .f      STR      r1,[r4,#0x68]
        0x00000d34:    2100        .!      MOVS     r1,#0
        0x00000d36:    6721        !g      STR      r1,[r4,#0x70]
        0x00000d38:    66e1        .f      STR      r1,[r4,#0x6c]
        0x00000d3a:    6761        ag      STR      r1,[r4,#0x74]
        0x00000d3c:    a10b        ..      ADR      r1,{pc}+0x30 ; 0xd6c
        0x00000d3e:    1de0        ..      ADDS     r0,r4,#7
        0x00000d40:    f7fffab0    ....    BL       strcpy ; 0x2a4
        0x00000d44:    a10a        ..      ADR      r1,{pc}+0x2c ; 0xd70
        0x00000d46:    4620         F      MOV      r0,r4
        0x00000d48:    f7fffaac    ....    BL       strcpy ; 0x2a4
        0x00000d4c:    2020                MOVS     r0,#0x20
        0x00000d4e:    71a0        .q      STRB     r0,[r4,#6]
        0x00000d50:    bd10        ..      POP      {r4,pc}
    $d
        0x00000d52:    0000        ..      DCW    0
        0x00000d54:    000012b4    ....    DCD    4788
        0x00000d58:    6d726554    Term    DCD    1836213588
        0x00000d5c:    6c616e69    inal    DCD    1818324585
        0x00000d60:    00000000    ....    DCD    0
        0x00000d64:    0000135c    \...    DCD    4956
        0x00000d68:    0000175c    \...    DCD    5980
        0x00000d6c:    00545452    RTT.    DCD    5526610
        0x00000d70:    47474553    SEGG    DCD    1195853139
        0x00000d74:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00000d78:    b510        ..      PUSH     {r4,lr}
        0x00000d7a:    4601        .F      MOV      r1,r0
        0x00000d7c:    690a        .i      LDR      r2,[r1,#0x10]
        0x00000d7e:    68cb        .h      LDR      r3,[r1,#0xc]
        0x00000d80:    429a        .B      CMP      r2,r3
        0x00000d82:    d804        ..      BHI      0xd8e ; _GetAvailWriteSpace + 22
        0x00000d84:    688c        .h      LDR      r4,[r1,#8]
        0x00000d86:    1e64        d.      SUBS     r4,r4,#1
        0x00000d88:    1ae4        ..      SUBS     r4,r4,r3
        0x00000d8a:    18a0        ..      ADDS     r0,r4,r2
        0x00000d8c:    e001        ..      B        0xd92 ; _GetAvailWriteSpace + 26
        0x00000d8e:    1ad4        ..      SUBS     r4,r2,r3
        0x00000d90:    1e60        `.      SUBS     r0,r4,#1
        0x00000d92:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x00000d94:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00000d98:    4606        .F      MOV      r6,r0
        0x00000d9a:    460f        .F      MOV      r7,r1
        0x00000d9c:    4692        .F      MOV      r10,r2
        0x00000d9e:    4698        .F      MOV      r8,r3
        0x00000da0:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x00000da4:    2f00        ./      CMP      r7,#0
        0x00000da6:    da01        ..      BGE      0xdac ; _PrintInt + 24
        0x00000da8:    4278        xB      RSBS     r0,r7,#0
        0x00000daa:    e000        ..      B        0xdae ; _PrintInt + 26
        0x00000dac:    4638        8F      MOV      r0,r7
        0x00000dae:    4683        .F      MOV      r11,r0
        0x00000db0:    f04f0901    O...    MOV      r9,#1
        0x00000db4:    e003        ..      B        0xdbe ; _PrintInt + 42
        0x00000db6:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x00000dba:    f1090901    ....    ADD      r9,r9,#1
        0x00000dbe:    45d3        .E      CMP      r11,r10
        0x00000dc0:    daf9        ..      BGE      0xdb6 ; _PrintInt + 34
        0x00000dc2:    45c8        .E      CMP      r8,r9
        0x00000dc4:    d900        ..      BLS      0xdc8 ; _PrintInt + 52
        0x00000dc6:    46c1        .F      MOV      r9,r8
        0x00000dc8:    b134        4.      CBZ      r4,0xdd8 ; _PrintInt + 68
        0x00000dca:    2f00        ./      CMP      r7,#0
        0x00000dcc:    db03        ..      BLT      0xdd6 ; _PrintInt + 66
        0x00000dce:    f0050004    ....    AND      r0,r5,#4
        0x00000dd2:    2804        .(      CMP      r0,#4
        0x00000dd4:    d100        ..      BNE      0xdd8 ; _PrintInt + 68
        0x00000dd6:    1e64        d.      SUBS     r4,r4,#1
        0x00000dd8:    f0050002    ....    AND      r0,r5,#2
        0x00000ddc:    b110        ..      CBZ      r0,0xde4 ; _PrintInt + 80
        0x00000dde:    f1b80f00    ....    CMP      r8,#0
        0x00000de2:    d011        ..      BEQ      0xe08 ; _PrintInt + 116
        0x00000de4:    f0050001    ....    AND      r0,r5,#1
        0x00000de8:    b970        p.      CBNZ     r0,0xe08 ; _PrintInt + 116
        0x00000dea:    b16c        l.      CBZ      r4,0xe08 ; _PrintInt + 116
        0x00000dec:    e008        ..      B        0xe00 ; _PrintInt + 108
        0x00000dee:    1e64        d.      SUBS     r4,r4,#1
        0x00000df0:    2120         !      MOVS     r1,#0x20
        0x00000df2:    4630        0F      MOV      r0,r6
        0x00000df4:    f000f8ba    ....    BL       _StoreChar ; 0xf6c
        0x00000df8:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00000dfa:    2800        .(      CMP      r0,#0
        0x00000dfc:    da00        ..      BGE      0xe00 ; _PrintInt + 108
        0x00000dfe:    e002        ..      B        0xe06 ; _PrintInt + 114
        0x00000e00:    b10c        ..      CBZ      r4,0xe06 ; _PrintInt + 114
        0x00000e02:    45a1        .E      CMP      r9,r4
        0x00000e04:    d3f3        ..      BCC      0xdee ; _PrintInt + 90
        0x00000e06:    bf00        ..      NOP      
        0x00000e08:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00000e0a:    2800        .(      CMP      r0,#0
        0x00000e0c:    db36        6.      BLT      0xe7c ; _PrintInt + 232
        0x00000e0e:    2f00        ./      CMP      r7,#0
        0x00000e10:    da05        ..      BGE      0xe1e ; _PrintInt + 138
        0x00000e12:    427f        .B      RSBS     r7,r7,#0
        0x00000e14:    212d        -!      MOVS     r1,#0x2d
        0x00000e16:    4630        0F      MOV      r0,r6
        0x00000e18:    f000f8a8    ....    BL       _StoreChar ; 0xf6c
        0x00000e1c:    e007        ..      B        0xe2e ; _PrintInt + 154
        0x00000e1e:    f0050004    ....    AND      r0,r5,#4
        0x00000e22:    2804        .(      CMP      r0,#4
        0x00000e24:    d103        ..      BNE      0xe2e ; _PrintInt + 154
        0x00000e26:    212b        +!      MOVS     r1,#0x2b
        0x00000e28:    4630        0F      MOV      r0,r6
        0x00000e2a:    f000f89f    ....    BL       _StoreChar ; 0xf6c
        0x00000e2e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00000e30:    2800        .(      CMP      r0,#0
        0x00000e32:    db23        #.      BLT      0xe7c ; _PrintInt + 232
        0x00000e34:    f0050002    ....    AND      r0,r5,#2
        0x00000e38:    2802        .(      CMP      r0,#2
        0x00000e3a:    d114        ..      BNE      0xe66 ; _PrintInt + 210
        0x00000e3c:    f0050001    ....    AND      r0,r5,#1
        0x00000e40:    b988        ..      CBNZ     r0,0xe66 ; _PrintInt + 210
        0x00000e42:    f1b80f00    ....    CMP      r8,#0
        0x00000e46:    d10e        ..      BNE      0xe66 ; _PrintInt + 210
        0x00000e48:    b16c        l.      CBZ      r4,0xe66 ; _PrintInt + 210
        0x00000e4a:    e008        ..      B        0xe5e ; _PrintInt + 202
        0x00000e4c:    1e64        d.      SUBS     r4,r4,#1
        0x00000e4e:    2130        0!      MOVS     r1,#0x30
        0x00000e50:    4630        0F      MOV      r0,r6
        0x00000e52:    f000f88b    ....    BL       _StoreChar ; 0xf6c
        0x00000e56:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00000e58:    2800        .(      CMP      r0,#0
        0x00000e5a:    da00        ..      BGE      0xe5e ; _PrintInt + 202
        0x00000e5c:    e002        ..      B        0xe64 ; _PrintInt + 208
        0x00000e5e:    b10c        ..      CBZ      r4,0xe64 ; _PrintInt + 208
        0x00000e60:    45a1        .E      CMP      r9,r4
        0x00000e62:    d3f3        ..      BCC      0xe4c ; _PrintInt + 184
        0x00000e64:    bf00        ..      NOP      
        0x00000e66:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00000e68:    2800        .(      CMP      r0,#0
        0x00000e6a:    db07        ..      BLT      0xe7c ; _PrintInt + 232
        0x00000e6c:    4643        CF      MOV      r3,r8
        0x00000e6e:    4652        RF      MOV      r2,r10
        0x00000e70:    4639        9F      MOV      r1,r7
        0x00000e72:    4630        0F      MOV      r0,r6
        0x00000e74:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x00000e78:    f000f802    ....    BL       _PrintUnsigned ; 0xe80
        0x00000e7c:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x00000e80:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00000e84:    4680        .F      MOV      r8,r0
        0x00000e86:    4689        .F      MOV      r9,r1
        0x00000e88:    4615        .F      MOV      r5,r2
        0x00000e8a:    461e        .F      MOV      r6,r3
        0x00000e8c:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x00000e8e:    f8cd9004    ....    STR      r9,[sp,#4]
        0x00000e92:    2701        .'      MOVS     r7,#1
        0x00000e94:    46bb        .F      MOV      r11,r7
        0x00000e96:    e005        ..      B        0xea4 ; _PrintUnsigned + 36
        0x00000e98:    9801        ..      LDR      r0,[sp,#4]
        0x00000e9a:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x00000e9e:    9001        ..      STR      r0,[sp,#4]
        0x00000ea0:    f10b0b01    ....    ADD      r11,r11,#1
        0x00000ea4:    9801        ..      LDR      r0,[sp,#4]
        0x00000ea6:    42a8        .B      CMP      r0,r5
        0x00000ea8:    d2f6        ..      BCS      0xe98 ; _PrintUnsigned + 24
        0x00000eaa:    455e        ^E      CMP      r6,r11
        0x00000eac:    d900        ..      BLS      0xeb0 ; _PrintUnsigned + 48
        0x00000eae:    46b3        .F      MOV      r11,r6
        0x00000eb0:    980d        ..      LDR      r0,[sp,#0x34]
        0x00000eb2:    f0000001    ....    AND      r0,r0,#1
        0x00000eb6:    b9d0        ..      CBNZ     r0,0xeee ; _PrintUnsigned + 110
        0x00000eb8:    b1cc        ..      CBZ      r4,0xeee ; _PrintUnsigned + 110
        0x00000eba:    980d        ..      LDR      r0,[sp,#0x34]
        0x00000ebc:    f0000002    ....    AND      r0,r0,#2
        0x00000ec0:    2802        .(      CMP      r0,#2
        0x00000ec2:    d103        ..      BNE      0xecc ; _PrintUnsigned + 76
        0x00000ec4:    b916        ..      CBNZ     r6,0xecc ; _PrintUnsigned + 76
        0x00000ec6:    2030        0       MOVS     r0,#0x30
        0x00000ec8:    9000        ..      STR      r0,[sp,#0]
        0x00000eca:    e001        ..      B        0xed0 ; _PrintUnsigned + 80
        0x00000ecc:    2020                MOVS     r0,#0x20
        0x00000ece:    9000        ..      STR      r0,[sp,#0]
        0x00000ed0:    e009        ..      B        0xee6 ; _PrintUnsigned + 102
        0x00000ed2:    1e64        d.      SUBS     r4,r4,#1
        0x00000ed4:    4640        @F      MOV      r0,r8
        0x00000ed6:    9900        ..      LDR      r1,[sp,#0]
        0x00000ed8:    f000f848    ..H.    BL       _StoreChar ; 0xf6c
        0x00000edc:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000ee0:    2800        .(      CMP      r0,#0
        0x00000ee2:    da00        ..      BGE      0xee6 ; _PrintUnsigned + 102
        0x00000ee4:    e002        ..      B        0xeec ; _PrintUnsigned + 108
        0x00000ee6:    b10c        ..      CBZ      r4,0xeec ; _PrintUnsigned + 108
        0x00000ee8:    45a3        .E      CMP      r11,r4
        0x00000eea:    d3f2        ..      BCC      0xed2 ; _PrintUnsigned + 82
        0x00000eec:    bf00        ..      NOP      
        0x00000eee:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000ef2:    2800        .(      CMP      r0,#0
        0x00000ef4:    db35        5.      BLT      0xf62 ; _PrintUnsigned + 226
        0x00000ef6:    e009        ..      B        0xf0c ; _PrintUnsigned + 140
        0x00000ef8:    2e01        ..      CMP      r6,#1
        0x00000efa:    d901        ..      BLS      0xf00 ; _PrintUnsigned + 128
        0x00000efc:    1e76        v.      SUBS     r6,r6,#1
        0x00000efe:    e004        ..      B        0xf0a ; _PrintUnsigned + 138
        0x00000f00:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00000f04:    45aa        .E      CMP      r10,r5
        0x00000f06:    d200        ..      BCS      0xf0a ; _PrintUnsigned + 138
        0x00000f08:    e001        ..      B        0xf0e ; _PrintUnsigned + 142
        0x00000f0a:    436f        oC      MULS     r7,r5,r7
        0x00000f0c:    e7f4        ..      B        0xef8 ; _PrintUnsigned + 120
        0x00000f0e:    bf00        ..      NOP      
        0x00000f10:    bf00        ..      NOP      
        0x00000f12:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00000f16:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x00000f1a:    4813        .H      LDR      r0,[pc,#76] ; [0xf68] = 0x128c
        0x00000f1c:    f810100a    ....    LDRB     r1,[r0,r10]
        0x00000f20:    4640        @F      MOV      r0,r8
        0x00000f22:    f000f823    ..#.    BL       _StoreChar ; 0xf6c
        0x00000f26:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000f2a:    2800        .(      CMP      r0,#0
        0x00000f2c:    da00        ..      BGE      0xf30 ; _PrintUnsigned + 176
        0x00000f2e:    e003        ..      B        0xf38 ; _PrintUnsigned + 184
        0x00000f30:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x00000f34:    2f00        ./      CMP      r7,#0
        0x00000f36:    d1ec        ..      BNE      0xf12 ; _PrintUnsigned + 146
        0x00000f38:    bf00        ..      NOP      
        0x00000f3a:    980d        ..      LDR      r0,[sp,#0x34]
        0x00000f3c:    f0000001    ....    AND      r0,r0,#1
        0x00000f40:    b178        x.      CBZ      r0,0xf62 ; _PrintUnsigned + 226
        0x00000f42:    b174        t.      CBZ      r4,0xf62 ; _PrintUnsigned + 226
        0x00000f44:    e009        ..      B        0xf5a ; _PrintUnsigned + 218
        0x00000f46:    1e64        d.      SUBS     r4,r4,#1
        0x00000f48:    2120         !      MOVS     r1,#0x20
        0x00000f4a:    4640        @F      MOV      r0,r8
        0x00000f4c:    f000f80e    ....    BL       _StoreChar ; 0xf6c
        0x00000f50:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000f54:    2800        .(      CMP      r0,#0
        0x00000f56:    da00        ..      BGE      0xf5a ; _PrintUnsigned + 218
        0x00000f58:    e002        ..      B        0xf60 ; _PrintUnsigned + 224
        0x00000f5a:    b10c        ..      CBZ      r4,0xf60 ; _PrintUnsigned + 224
        0x00000f5c:    45a3        .E      CMP      r11,r4
        0x00000f5e:    d3f2        ..      BCC      0xf46 ; _PrintUnsigned + 198
        0x00000f60:    bf00        ..      NOP      
        0x00000f62:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x00000f66:    0000        ..      DCW    0
        0x00000f68:    0000128c    ....    DCD    4748
    $t
    i._StoreChar
    _StoreChar
        0x00000f6c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f6e:    4604        .F      MOV      r4,r0
        0x00000f70:    460e        .F      MOV      r6,r1
        0x00000f72:    68a5        .h      LDR      r5,[r4,#8]
        0x00000f74:    1c68        h.      ADDS     r0,r5,#1
        0x00000f76:    6861        ah      LDR      r1,[r4,#4]
        0x00000f78:    4281        .B      CMP      r1,r0
        0x00000f7a:    d306        ..      BCC      0xf8a ; _StoreChar + 30
        0x00000f7c:    6820         h      LDR      r0,[r4,#0]
        0x00000f7e:    5546        FU      STRB     r6,[r0,r5]
        0x00000f80:    1c68        h.      ADDS     r0,r5,#1
        0x00000f82:    60a0        .`      STR      r0,[r4,#8]
        0x00000f84:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00000f86:    1c40        @.      ADDS     r0,r0,#1
        0x00000f88:    60e0        .`      STR      r0,[r4,#0xc]
        0x00000f8a:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x00000f8e:    4288        .B      CMP      r0,r1
        0x00000f90:    d10d        ..      BNE      0xfae ; _StoreChar + 66
        0x00000f92:    68a2        .h      LDR      r2,[r4,#8]
        0x00000f94:    6821        !h      LDR      r1,[r4,#0]
        0x00000f96:    6920         i      LDR      r0,[r4,#0x10]
        0x00000f98:    f7fffd12    ....    BL       SEGGER_RTT_Write ; 0x9c0
        0x00000f9c:    68a1        .h      LDR      r1,[r4,#8]
        0x00000f9e:    4288        .B      CMP      r0,r1
        0x00000fa0:    d003        ..      BEQ      0xfaa ; _StoreChar + 62
        0x00000fa2:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000fa6:    60e0        .`      STR      r0,[r4,#0xc]
        0x00000fa8:    e001        ..      B        0xfae ; _StoreChar + 66
        0x00000faa:    2000        .       MOVS     r0,#0
        0x00000fac:    60a0        .`      STR      r0,[r4,#8]
        0x00000fae:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00000fb0:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000fb4:    4604        .F      MOV      r4,r0
        0x00000fb6:    4689        .F      MOV      r9,r1
        0x00000fb8:    4617        .F      MOV      r7,r2
        0x00000fba:    f04f0a00    O...    MOV      r10,#0
        0x00000fbe:    68e5        .h      LDR      r5,[r4,#0xc]
        0x00000fc0:    bf00        ..      NOP      
        0x00000fc2:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x00000fc6:    45a8        .E      CMP      r8,r5
        0x00000fc8:    d903        ..      BLS      0xfd2 ; _WriteBlocking + 34
        0x00000fca:    eba80005    ....    SUB      r0,r8,r5
        0x00000fce:    1e46        F.      SUBS     r6,r0,#1
        0x00000fd0:    e004        ..      B        0xfdc ; _WriteBlocking + 44
        0x00000fd2:    eba50008    ....    SUB      r0,r5,r8
        0x00000fd6:    1c40        @.      ADDS     r0,r0,#1
        0x00000fd8:    68a1        .h      LDR      r1,[r4,#8]
        0x00000fda:    1a0e        ..      SUBS     r6,r1,r0
        0x00000fdc:    68a0        .h      LDR      r0,[r4,#8]
        0x00000fde:    1b40        @.      SUBS     r0,r0,r5
        0x00000fe0:    42b0        .B      CMP      r0,r6
        0x00000fe2:    d901        ..      BLS      0xfe8 ; _WriteBlocking + 56
        0x00000fe4:    4630        0F      MOV      r0,r6
        0x00000fe6:    e001        ..      B        0xfec ; _WriteBlocking + 60
        0x00000fe8:    68a0        .h      LDR      r0,[r4,#8]
        0x00000fea:    1b40        @.      SUBS     r0,r0,r5
        0x00000fec:    4606        .F      MOV      r6,r0
        0x00000fee:    42be        .B      CMP      r6,r7
        0x00000ff0:    d201        ..      BCS      0xff6 ; _WriteBlocking + 70
        0x00000ff2:    4630        0F      MOV      r0,r6
        0x00000ff4:    e000        ..      B        0xff8 ; _WriteBlocking + 72
        0x00000ff6:    4638        8F      MOV      r0,r7
        0x00000ff8:    4606        .F      MOV      r6,r0
        0x00000ffa:    6861        ah      LDR      r1,[r4,#4]
        0x00000ffc:    1948        H.      ADDS     r0,r1,r5
        0x00000ffe:    4632        2F      MOV      r2,r6
        0x00001000:    4649        IF      MOV      r1,r9
        0x00001002:    f7fff973    ..s.    BL       __aeabi_memcpy ; 0x2ec
        0x00001006:    44b2        .D      ADD      r10,r10,r6
        0x00001008:    44b1        .D      ADD      r9,r9,r6
        0x0000100a:    1bbf        ..      SUBS     r7,r7,r6
        0x0000100c:    4435        5D      ADD      r5,r5,r6
        0x0000100e:    68a0        .h      LDR      r0,[r4,#8]
        0x00001010:    42a8        .B      CMP      r0,r5
        0x00001012:    d100        ..      BNE      0x1016 ; _WriteBlocking + 102
        0x00001014:    2500        .%      MOVS     r5,#0
        0x00001016:    60e5        .`      STR      r5,[r4,#0xc]
        0x00001018:    2f00        ./      CMP      r7,#0
        0x0000101a:    d1d2        ..      BNE      0xfc2 ; _WriteBlocking + 18
        0x0000101c:    4650        PF      MOV      r0,r10
        0x0000101e:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001022:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001026:    4604        .F      MOV      r4,r0
        0x00001028:    4689        .F      MOV      r9,r1
        0x0000102a:    4615        .F      MOV      r5,r2
        0x0000102c:    68e6        .h      LDR      r6,[r4,#0xc]
        0x0000102e:    68a0        .h      LDR      r0,[r4,#8]
        0x00001030:    1b87        ..      SUBS     r7,r0,r6
        0x00001032:    42af        .B      CMP      r7,r5
        0x00001034:    d908        ..      BLS      0x1048 ; _WriteNoCheck + 38
        0x00001036:    6861        ah      LDR      r1,[r4,#4]
        0x00001038:    1988        ..      ADDS     r0,r1,r6
        0x0000103a:    462a        *F      MOV      r2,r5
        0x0000103c:    4649        IF      MOV      r1,r9
        0x0000103e:    f7fff955    ..U.    BL       __aeabi_memcpy ; 0x2ec
        0x00001042:    1970        p.      ADDS     r0,r6,r5
        0x00001044:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001046:    e010        ..      B        0x106a ; _WriteNoCheck + 72
        0x00001048:    46b8        .F      MOV      r8,r7
        0x0000104a:    6861        ah      LDR      r1,[r4,#4]
        0x0000104c:    1988        ..      ADDS     r0,r1,r6
        0x0000104e:    4642        BF      MOV      r2,r8
        0x00001050:    4649        IF      MOV      r1,r9
        0x00001052:    f7fff94b    ..K.    BL       __aeabi_memcpy ; 0x2ec
        0x00001056:    eba50807    ....    SUB      r8,r5,r7
        0x0000105a:    eb090107    ....    ADD      r1,r9,r7
        0x0000105e:    4642        BF      MOV      r2,r8
        0x00001060:    6860        `h      LDR      r0,[r4,#4]
        0x00001062:    f7fff943    ..C.    BL       __aeabi_memcpy ; 0x2ec
        0x00001066:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x0000106a:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0000106e:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00001070:    4604        .F      MOV      r4,r0
        0x00001072:    460d        .F      MOV      r5,r1
        0x00001074:    4616        .F      MOV      r6,r2
        0x00001076:    b672        r.      CPSID    i
        0x00001078:    4623        #F      MOV      r3,r4
        0x0000107a:    4632        2F      MOV      r2,r6
        0x0000107c:    4629        )F      MOV      r1,r5
        0x0000107e:    a002        ..      ADR      r0,{pc}+0xa ; 0x1088
        0x00001080:    f7fff86a    ..j.    BL       __2printf ; 0x158
        0x00001084:    bf00        ..      NOP      
        0x00001086:    e7fe        ..      B        0x1086 ; __aeabi_assert + 22
    $d
        0x00001088:    65737341    Asse    DCD    1702064961
        0x0000108c:    6f697472    rtio    DCD    1869182066
        0x00001090:    6146206e    n Fa    DCD    1631985774
        0x00001094:    64656c69    iled    DCD    1684368489
        0x00001098:    6966203a    : fi    DCD    1768300602
        0x0000109c:    2520656c    le %    DCD    622880108
        0x000010a0:    6c202c73    s, l    DCD    1814047859
        0x000010a4:    20656e69    ine     DCD    543518313
        0x000010a8:    202c6425    %d,     DCD    539780133
        0x000010ac:    000a7325    %s..    DCD    684837
    $t
    i.delay
    delay
        0x000010b0:    2100        .!      MOVS     r1,#0
        0x000010b2:    e006        ..      B        0x10c2 ; delay + 18
        0x000010b4:    bf00        ..      NOP      
        0x000010b6:    bf00        ..      NOP      
        0x000010b8:    bf00        ..      NOP      
        0x000010ba:    bf00        ..      NOP      
        0x000010bc:    bf00        ..      NOP      
        0x000010be:    bf00        ..      NOP      
        0x000010c0:    1c49        I.      ADDS     r1,r1,#1
        0x000010c2:    4281        .B      CMP      r1,r0
        0x000010c4:    d3f6        ..      BCC      0x10b4 ; delay + 4
        0x000010c6:    4770        pG      BX       lr
    i.fputc
    fputc
        0x000010c8:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000010ca:    460c        .F      MOV      r4,r1
        0x000010cc:    2201        ."      MOVS     r2,#1
        0x000010ce:    4669        iF      MOV      r1,sp
        0x000010d0:    2000        .       MOVS     r0,#0
        0x000010d2:    f7fffc75    ..u.    BL       SEGGER_RTT_Write ; 0x9c0
        0x000010d6:    9800        ..      LDR      r0,[sp,#0]
        0x000010d8:    bd1c        ..      POP      {r2-r4,pc}
        0x000010da:    0000        ..      MOVS     r0,r0
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x000010dc:    4903        .I      LDR      r1,[pc,#12] ; [0x10ec] = 0x40007000
        0x000010de:    6809        .h      LDR      r1,[r1,#0]
        0x000010e0:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000010e4:    4a01        .J      LDR      r2,[pc,#4] ; [0x10ec] = 0x40007000
        0x000010e6:    6011        .`      STR      r1,[r2,#0]
        0x000010e8:    4770        pG      BX       lr
    $d
        0x000010ea:    0000        ..      DCW    0
        0x000010ec:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x000010f0:    4903        .I      LDR      r1,[pc,#12] ; [0x1100] = 0x40007000
        0x000010f2:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000010f4:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000010f8:    4a01        .J      LDR      r2,[pc,#4] ; [0x1100] = 0x40007000
        0x000010fa:    60d1        .`      STR      r1,[r2,#0xc]
        0x000010fc:    4770        pG      BX       lr
    $d
        0x000010fe:    0000        ..      DCW    0
        0x00001100:    40007000    .p.@    DCD    1073770496
    $t
    i.main
    main
        0x00001104:    a103        ..      ADR      r1,{pc}+0x10 ; 0x1114
        0x00001106:    2000        .       MOVS     r0,#0
        0x00001108:    f7fffcc0    ....    BL       SEGGER_RTT_printf ; 0xa8c
        0x0000110c:    f000f81e    ....    BL       test_gpio ; 0x114c
        0x00001110:    bf00        ..      NOP      
        0x00001112:    e7fe        ..      B        0x1112 ; main + 14
    $d
        0x00001114:    6c6c6548    Hell    DCD    1819043144
        0x00001118:    6f57206f    o Wo    DCD    1867980911
        0x0000111c:    20646c72    rld     DCD    543452274
        0x00001120:    38313032    2018    DCD    942747698
        0x00001124:    34303530    0504    DCD    875574576
        0x00001128:    00000a7e    ~...    DCD    2686
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x0000112c:    4901        .I      LDR      r1,[pc,#4] ; [0x1134] = 0x40020000
        0x0000112e:    6008        .`      STR      r0,[r1,#0]
        0x00001130:    4770        pG      BX       lr
    $d
        0x00001132:    0000        ..      DCW    0
        0x00001134:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001138:    4903        .I      LDR      r1,[pc,#12] ; [0x1148] = 0x40020000
        0x0000113a:    6849        Ih      LDR      r1,[r1,#4]
        0x0000113c:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001140:    4a01        .J      LDR      r2,[pc,#4] ; [0x1148] = 0x40020000
        0x00001142:    6051        Q`      STR      r1,[r2,#4]
        0x00001144:    4770        pG      BX       lr
    $d
        0x00001146:    0000        ..      DCW    0
        0x00001148:    40020000    ...@    DCD    1073872896
    $t
    i.test_gpio
    test_gpio
        0x0000114c:    b508        ..      PUSH     {r3,lr}
        0x0000114e:    f04f0800    O...    MOV      r8,#0
        0x00001152:    2001        .       MOVS     r0,#1
        0x00001154:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00001158:    f88d0001    ....    STRB     r0,[sp,#1]
        0x0000115c:    f88d0002    ....    STRB     r0,[sp,#2]
        0x00001160:    2010        .       MOVS     r0,#0x10
        0x00001162:    9900        ..      LDR      r1,[sp,#0]
        0x00001164:    f7fffa11    ....    BL       HAL_GPIO_Init ; 0x58a
        0x00001168:    2007        .       MOVS     r0,#7
        0x0000116a:    9900        ..      LDR      r1,[sp,#0]
        0x0000116c:    f7fffa0d    ....    BL       HAL_GPIO_Init ; 0x58a
        0x00001170:    2400        .$      MOVS     r4,#0
        0x00001172:    e004        ..      B        0x117e ; test_gpio + 50
        0x00001174:    00a0        ..      LSLS     r0,r4,#2
        0x00001176:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x0000117a:    6004        .`      STR      r4,[r0,#0]
        0x0000117c:    1c64        d.      ADDS     r4,r4,#1
        0x0000117e:    f5b45f00    ..._    CMP      r4,#0x2000
        0x00001182:    d3f7        ..      BCC      0x1174 ; test_gpio + 40
        0x00001184:    2400        .$      MOVS     r4,#0
        0x00001186:    e012        ..      B        0x11ae ; test_gpio + 98
        0x00001188:    00a0        ..      LSLS     r0,r4,#2
        0x0000118a:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x0000118e:    6807        .h      LDR      r7,[r0,#0]
        0x00001190:    42bc        .B      CMP      r4,r7
        0x00001192:    d00b        ..      BEQ      0x11ac ; test_gpio + 96
        0x00001194:    f1080801    ....    ADD      r8,r8,#1
        0x00001198:    4622        "F      MOV      r2,r4
        0x0000119a:    4621        !F      MOV      r1,r4
        0x0000119c:    a020         .      ADR      r0,{pc}+0x84 ; 0x1220
        0x0000119e:    f7feffdb    ....    BL       __2printf ; 0x158
        0x000011a2:    463a        :F      MOV      r2,r7
        0x000011a4:    4621        !F      MOV      r1,r4
        0x000011a6:    a023        #.      ADR      r0,{pc}+0x8e ; 0x1234
        0x000011a8:    f7feffd6    ....    BL       __2printf ; 0x158
        0x000011ac:    1c64        d.      ADDS     r4,r4,#1
        0x000011ae:    f5b45f00    ..._    CMP      r4,#0x2000
        0x000011b2:    d3e9        ..      BCC      0x1188 ; test_gpio + 60
        0x000011b4:    f1b80f00    ....    CMP      r8,#0
        0x000011b8:    d003        ..      BEQ      0x11c2 ; test_gpio + 118
        0x000011ba:    a023        #.      ADR      r0,{pc}+0x8e ; 0x1248
        0x000011bc:    f7feffcc    ....    BL       __2printf ; 0x158
        0x000011c0:    e002        ..      B        0x11c8 ; test_gpio + 124
        0x000011c2:    a026        &.      ADR      r0,{pc}+0x9a ; 0x125c
        0x000011c4:    f7feffc8    ....    BL       __2printf ; 0x158
        0x000011c8:    e028        (.      B        0x121c ; test_gpio + 208
        0x000011ca:    2100        .!      MOVS     r1,#0
        0x000011cc:    2010        .       MOVS     r0,#0x10
        0x000011ce:    f7fffa9d    ....    BL       HAL_GPIO_WritePin ; 0x70c
        0x000011d2:    2100        .!      MOVS     r1,#0
        0x000011d4:    2007        .       MOVS     r0,#7
        0x000011d6:    f7fffa99    ....    BL       HAL_GPIO_WritePin ; 0x70c
        0x000011da:    2582        .%      MOVS     r5,#0x82
        0x000011dc:    e006        ..      B        0x11ec ; test_gpio + 160
        0x000011de:    f2427610    B..v    MOV      r6,#0x2710
        0x000011e2:    e000        ..      B        0x11e6 ; test_gpio + 154
        0x000011e4:    1e76        v.      SUBS     r6,r6,#1
        0x000011e6:    2e00        ..      CMP      r6,#0
        0x000011e8:    d1fc        ..      BNE      0x11e4 ; test_gpio + 152
        0x000011ea:    1e6d        m.      SUBS     r5,r5,#1
        0x000011ec:    2d00        .-      CMP      r5,#0
        0x000011ee:    d1f6        ..      BNE      0x11de ; test_gpio + 146
        0x000011f0:    2101        .!      MOVS     r1,#1
        0x000011f2:    2010        .       MOVS     r0,#0x10
        0x000011f4:    f7fffa8a    ....    BL       HAL_GPIO_WritePin ; 0x70c
        0x000011f8:    2101        .!      MOVS     r1,#1
        0x000011fa:    2007        .       MOVS     r0,#7
        0x000011fc:    f7fffa86    ....    BL       HAL_GPIO_WritePin ; 0x70c
        0x00001200:    2582        .%      MOVS     r5,#0x82
        0x00001202:    e006        ..      B        0x1212 ; test_gpio + 198
        0x00001204:    f2427610    B..v    MOV      r6,#0x2710
        0x00001208:    e000        ..      B        0x120c ; test_gpio + 192
        0x0000120a:    1e76        v.      SUBS     r6,r6,#1
        0x0000120c:    2e00        ..      CMP      r6,#0
        0x0000120e:    d1fc        ..      BNE      0x120a ; test_gpio + 190
        0x00001210:    1e6d        m.      SUBS     r5,r5,#1
        0x00001212:    2d00        .-      CMP      r5,#0
        0x00001214:    d1f6        ..      BNE      0x1204 ; test_gpio + 184
        0x00001216:    a015        ..      ADR      r0,{pc}+0x56 ; 0x126c
        0x00001218:    f7feff9e    ....    BL       __2printf ; 0x158
        0x0000121c:    e7d5        ..      B        0x11ca ; test_gpio + 126
    $d
        0x0000121e:    0000        ..      DCW    0
        0x00001220:    625f7277    wr_b    DCD    1650422391
        0x00001224:    5b6d6172    ram[    DCD    1533895026
        0x00001228:    205d6425    %d]     DCD    542991397
        0x0000122c:    6425203d    = %d    DCD    1680154685
        0x00001230:    000d0a20     ...    DCD    854560
        0x00001234:    625f6472    rd_b    DCD    1650418802
        0x00001238:    5b6d6172    ram[    DCD    1533895026
        0x0000123c:    205d6425    %d]     DCD    542991397
        0x00001240:    6425203d    = %d    DCD    1680154685
        0x00001244:    000d0a20     ...    DCD    854560
        0x00001248:    6f6d654d    Memo    DCD    1869440333
        0x0000124c:    54207972    ry T    DCD    1411414386
        0x00001250:    20747365    est     DCD    544502629
        0x00001254:    6f727245    Erro    DCD    1869771333
        0x00001258:    00000a72    r...    DCD    2674
        0x0000125c:    6f6d654d    Memo    DCD    1869440333
        0x00001260:    54207972    ry T    DCD    1411414386
        0x00001264:    20747365    est     DCD    544502629
        0x00001268:    000a6b4f    Ok..    DCD    682831
        0x0000126c:    32666c45    Elf2    DCD    845573189
        0x00001270:    55434d20     MCU    DCD    1430474016
        0x00001274:    69755120     Qui    DCD    1769296160
        0x00001278:    74736b63    ckst    DCD    1953721187
        0x0000127c:    20747261    art     DCD    544502369
        0x00001280:    6a6f7250    Proj    DCD    1785688656
        0x00001284:    7e746365    ect~    DCD    2121556837
        0x00001288:    0000000a    ....    DCD    10
    $d.realdata
    .constdata
    _aV2C
        0x0000128c:    33323130    0123    DCD    858927408
        0x00001290:    37363534    4567    DCD    926299444
        0x00001294:    42413938    89AB    DCD    1111570744
        0x00001298:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x0000129c:    000012b4    ....    DCD    4788
        0x000012a0:    000012b4    ....    DCD    4788
        0x000012a4:    00000a1c    ....    DCD    2588
        0x000012a8:    000000c4    ....    DCD    196
    Region$$Table$$Limit

====================================

** Section #3

    Name        : RO_IRAM2
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x000012ac
    File Offset : 4832 (0x12e0)
    Size        : 8 bytes (0x8)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #4

    Name        : RO_IRAM2
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x000012b4
    File Offset : 4840 (0x12e8)
    Size        : 2588 bytes (0xa1c)
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
    File Offset : 4840 (0x12e8)
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
    File Offset : 6316 (0x18ac)
    Size        : 1960 bytes (0x7a8)
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
    File Offset : 8276 (0x2054)
    Size        : 51808 bytes (0xca60)
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
    File Offset : 60084 (0xeab4)
    Size        : 7868 bytes (0x1ebc)
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
    File Offset : 67952 (0x10970)
    Size        : 2952 bytes (0xb88)
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
    File Offset : 70904 (0x114f8)
    Size        : 7800 bytes (0x1e78)
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
    File Offset : 78704 (0x13370)
    Size        : 952 bytes (0x3b8)
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
    File Offset : 79656 (0x13728)
    Size        : 6752 bytes (0x1a60)
    Link        : Section 13 (.strtab)
    Info        : Last local symbol no = 280
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #13

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 86408 (0x15188)
    Size        : 6152 bytes (0x1808)
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
    File Offset : 92560 (0x16990)
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
    File Offset : 92592 (0x169b0)
    Size        : 9484 bytes (0x250c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0

    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    ArmLink --strict --callgraph --map --symbols --xref --diag_suppress=9931 --cpu=Cortex-M3 --fpu=SoftVFP --list=.\Listings\Quick_Start.map --output=.\Objects\Quick_Start.axf --scatter=.\elf2_example.sct --keep=int_register.o(int_callback_area) --info=summarysizes,sizes,totals,unused,veneers

    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\c_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\fz_ws.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\h_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\m_ws.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\vfpsupport.l
    Input Comments:
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_gpio.o --vfemode=force

    Input Comments:
    
    p3818-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p3818-2
    
    
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p3804-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p3804-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\BRAM_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    gpio.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\gpio.o --vfemode=force

    Input Comments:
    
    p1250-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    gpio.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\gpio.o --depend=.\objects\gpio.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\gpio.crf ..\sdk\src\soc\driver\gpio.c
    
    
    syscon.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\syscon.o --vfemode=force

    Input Comments:
    
    pda8-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    syscon.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\syscon.o --depend=.\objects\syscon.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\syscon.crf ..\sdk\src\soc\driver\syscon.c
    
    
    
    
    
    

====================================

** Section #16

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 102076 (0x18ebc)
    Size        : 172 bytes (0xac)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x000012b4  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x000012b4  0x10       _SEGGER_RTT.acID                         array[16] of char
0x000012c4  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x000012c8  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x000012cc  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x00001314  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x0000175c  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x0000135c  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x000012b0  0x4        __stdout                                 FILE
0x000012b0  0x4        __stdout.handle                          int

address     size       variable name                            type
0x000012ac  0x4        SystemCoreClock                          uint32_t

