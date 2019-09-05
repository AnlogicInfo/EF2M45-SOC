
========================================================================

** ELF Header Information

    File Name: Objects\demo.axf

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
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 17

    Program header offset: 99816 (0x000185e8)
    Section header offset: 99848 (0x00018608)

    Section header string table index: 16

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 4284 bytes (0x10bc)
    Size in memory: 6868 bytes (0x1ad4)
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
    Size        : 4140 bytes (0x102c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    !!!main
    __main
        0x00000088:    f000f802    ....    BL       __scatterload ; 0x90
        0x0000008c:    f000f842    ..B.    BL       __rt_entry ; 0x114
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
        0x000000a2:    f000f837    ..7.    BL       __rt_entry ; 0x114
        0x000000a6:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x9f
        0x000000aa:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x000000ae:    f0130f01    ....    TST      r3,#1
        0x000000b2:    bf18        ..      IT       NE
        0x000000b4:    1afb        ..      SUBNE    r3,r7,r3
        0x000000b6:    f0430301    C...    ORR      r3,r3,#1
        0x000000ba:    4718        .G      BX       r3
    $d
        0x000000bc:    00000fd8    ....    DCD    4056
        0x000000c0:    00000ff8    ....    DCD    4088
    $t
    !!handler_copy
    __scatterload_copy
        0x000000c4:    3a10        .:      SUBS     r2,r2,#0x10
        0x000000c6:    bf24        $.      ITT      CS
        0x000000c8:    c878        x.      LDMCS    r0!,{r3-r6}
        0x000000ca:    c178        x.      STMCS    r1!,{r3-r6}
        0x000000cc:    d8fa        ..      BHI      __scatterload_copy ; 0xc4
        0x000000ce:    0752        R.      LSLS     r2,r2,#29
        0x000000d0:    bf24        $.      ITT      CS
        0x000000d2:    c830        0.      LDMCS    r0!,{r4,r5}
        0x000000d4:    c130        0.      STMCS    r1!,{r4,r5}
        0x000000d6:    bf44        D.      ITT      MI
        0x000000d8:    6804        .h      LDRMI    r4,[r0,#0]
        0x000000da:    600c        .`      STRMI    r4,[r1,#0]
        0x000000dc:    4770        pG      BX       lr
        0x000000de:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x000000e0:    2300        .#      MOVS     r3,#0
        0x000000e2:    2400        .$      MOVS     r4,#0
        0x000000e4:    2500        .%      MOVS     r5,#0
        0x000000e6:    2600        .&      MOVS     r6,#0
        0x000000e8:    3a10        .:      SUBS     r2,r2,#0x10
        0x000000ea:    bf28        (.      IT       CS
        0x000000ec:    c178        x.      STMCS    r1!,{r3-r6}
        0x000000ee:    d8fb        ..      BHI      0xe8 ; __scatterload_zeroinit + 8
        0x000000f0:    0752        R.      LSLS     r2,r2,#29
        0x000000f2:    bf28        (.      IT       CS
        0x000000f4:    c130        0.      STMCS    r1!,{r4,r5}
        0x000000f6:    bf48        H.      IT       MI
        0x000000f8:    600b        .`      STRMI    r3,[r1,#0]
        0x000000fa:    4770        pG      BX       lr
    .ARM.Collect$$_printf_percent$$00000009
    .ARM.Collect$$_printf_percent$$00000000
    _printf_d
    _printf_percent
        0x000000fc:    2964        d)      CMP      r1,#0x64
        0x000000fe:    f00080a3    ....    BEQ.W    _printf_int_dec ; 0x248
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x00000102:    2973        s)      CMP      r1,#0x73
        0x00000104:    f00081b3    ....    BEQ.W    _printf_string ; 0x46e
    .ARM.Collect$$_printf_percent$$00000017
    _printf_percent_end
        0x00000108:    2000        .       MOVS     r0,#0
        0x0000010a:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x0000010c:    b51f        ..      PUSH     {r0-r4,lr}
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
        0x0000010e:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x00000110:    b510        ..      PUSH     {r4,lr}
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
        0x00000112:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x00000114:    f000fa10    ....    BL       __user_setup_stackheap ; 0x538
        0x00000118:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x0000011a:    f7fffff7    ....    BL       __rt_lib_init ; 0x10c
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x0000011e:    f000ff49    ..I.    BL       main ; 0xfb4
        0x00000122:    f000fa2e    ....    BL       exit ; 0x582
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x00000126:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x00000128:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x110
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x0000012c:    bc03        ..      POP      {r0,r1}
        0x0000012e:    f000fa33    ..3.    BL       _sys_exit ; 0x598
        0x00000132:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x00000134:    4809        .H      LDR      r0,[pc,#36] ; [0x15c] = 0xc05
        0x00000136:    4780        .G      BLX      r0
        0x00000138:    4809        .H      LDR      r0,[pc,#36] ; [0x160] = 0x89
        0x0000013a:    4700        .G      BX       r0
    NMI_Handler
        0x0000013c:    e7fe        ..      B        NMI_Handler ; 0x13c
    HardFault_Handler
        0x0000013e:    e7fe        ..      B        HardFault_Handler ; 0x13e
    MemManage_Handler
        0x00000140:    e7fe        ..      B        MemManage_Handler ; 0x140
    BusFault_Handler
        0x00000142:    e7fe        ..      B        BusFault_Handler ; 0x142
    UsageFault_Handler
        0x00000144:    e7fe        ..      B        UsageFault_Handler ; 0x144
    SVC_Handler
        0x00000146:    e7fe        ..      B        SVC_Handler ; 0x146
    DebugMon_Handler
        0x00000148:    e7fe        ..      B        DebugMon_Handler ; 0x148
    PendSV_Handler
        0x0000014a:    e7fe        ..      B        PendSV_Handler ; 0x14a
    SysTick_Handler
        0x0000014c:    e7fe        ..      B        SysTick_Handler ; 0x14c
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
        0x0000014e:    e7fe        ..      B        ADCC0_IRQHandler ; 0x14e
    __user_initial_stackheap
        0x00000150:    4804        .H      LDR      r0,[pc,#16] ; [0x164] = 0x20000520
        0x00000152:    4905        .I      LDR      r1,[pc,#20] ; [0x168] = 0x20000a20
        0x00000154:    4a05        .J      LDR      r2,[pc,#20] ; [0x16c] = 0x20000620
        0x00000156:    4b06        .K      LDR      r3,[pc,#24] ; [0x170] = 0x20000620
        0x00000158:    4770        pG      BX       lr
    $d
        0x0000015a:    0000        ..      DCW    0
        0x0000015c:    00000c05    ....    DCD    3077
        0x00000160:    00000089    ....    DCD    137
        0x00000164:    20000520     ..     DCD    536872224
        0x00000168:    20000a20     ..     DCD    536873504
        0x0000016c:    20000620     ..     DCD    536872480
        0x00000170:    20000620     ..     DCD    536872480
    $t
    .text
    __2printf
        0x00000174:    b40f        ..      PUSH     {r0-r3}
        0x00000176:    4904        .I      LDR      r1,[pc,#16] ; [0x188] = 0x20000004
        0x00000178:    b510        ..      PUSH     {r4,lr}
        0x0000017a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000017c:    9802        ..      LDR      r0,[sp,#8]
        0x0000017e:    f000f97b    ..{.    BL       _printf_char_file ; 0x478
        0x00000182:    bc10        ..      POP      {r4}
        0x00000184:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000188:    20000004    ...     DCD    536870916
    $t
    .text
    __printf
        0x0000018c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000190:    460e        .F      MOV      r6,r1
        0x00000192:    4604        .F      MOV      r4,r0
        0x00000194:    2000        .       MOVS     r0,#0
        0x00000196:    6220         b      STR      r0,[r4,#0x20]
        0x00000198:    4620         F      MOV      r0,r4
        0x0000019a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x0000019c:    4788        .G      BLX      r1
        0x0000019e:    b330        0.      CBZ      r0,0x1ee ; __printf + 98
        0x000001a0:    2825        %(      CMP      r0,#0x25
        0x000001a2:    d005        ..      BEQ      0x1b0 ; __printf + 36
        0x000001a4:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000001a8:    4790        .G      BLX      r2
        0x000001aa:    6a20         j      LDR      r0,[r4,#0x20]
        0x000001ac:    1c40        @.      ADDS     r0,r0,#1
        0x000001ae:    e7f2        ..      B        0x196 ; __printf + 10
        0x000001b0:    68e1        .h      LDR      r1,[r4,#0xc]
        0x000001b2:    4620         F      MOV      r0,r4
        0x000001b4:    2700        .'      MOVS     r7,#0
        0x000001b6:    4788        .G      BLX      r1
        0x000001b8:    0005        ..      MOVS     r5,r0
        0x000001ba:    d018        ..      BEQ      0x1ee ; __printf + 98
        0x000001bc:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x000001c0:    2819        .(      CMP      r0,#0x19
        0x000001c2:    d802        ..      BHI      0x1ca ; __printf + 62
        0x000001c4:    3520         5      ADDS     r5,r5,#0x20
        0x000001c6:    f44f6700    O..g    MOV      r7,#0x800
        0x000001ca:    4632        2F      MOV      r2,r6
        0x000001cc:    4629        )F      MOV      r1,r5
        0x000001ce:    4620         F      MOV      r0,r4
        0x000001d0:    6027        '`      STR      r7,[r4,#0]
        0x000001d2:    f7ffff93    ....    BL       _printf_d ; 0xfc
        0x000001d6:    b140        @.      CBZ      r0,0x1ea ; __printf + 94
        0x000001d8:    2801        .(      CMP      r0,#1
        0x000001da:    d004        ..      BEQ      0x1e6 ; __printf + 90
        0x000001dc:    1df6        ..      ADDS     r6,r6,#7
        0x000001de:    f0260607    &...    BIC      r6,r6,#7
        0x000001e2:    3608        .6      ADDS     r6,r6,#8
        0x000001e4:    e7d8        ..      B        0x198 ; __printf + 12
        0x000001e6:    1d36        6.      ADDS     r6,r6,#4
        0x000001e8:    e7d6        ..      B        0x198 ; __printf + 12
        0x000001ea:    4628        (F      MOV      r0,r5
        0x000001ec:    e7da        ..      B        0x1a4 ; __printf + 24
        0x000001ee:    6a20         j      LDR      r0,[r4,#0x20]
        0x000001f0:    e8bd81f0    ....    POP      {r4-r8,pc}
    .text
    _printf_str
        0x000001f4:    b570        p.      PUSH     {r4-r6,lr}
        0x000001f6:    460c        .F      MOV      r4,r1
        0x000001f8:    4605        .F      MOV      r5,r0
        0x000001fa:    2a01        .*      CMP      r2,#1
        0x000001fc:    d005        ..      BEQ      0x20a ; _printf_str + 22
        0x000001fe:    7828        (x      LDRB     r0,[r5,#0]
        0x00000200:    0680        ..      LSLS     r0,r0,#26
        0x00000202:    d500        ..      BPL      0x206 ; _printf_str + 18
        0x00000204:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x00000206:    2300        .#      MOVS     r3,#0
        0x00000208:    e002        ..      B        0x210 ; _printf_str + 28
        0x0000020a:    2301        .#      MOVS     r3,#1
        0x0000020c:    e005        ..      B        0x21a ; _printf_str + 38
        0x0000020e:    1c5b        [.      ADDS     r3,r3,#1
        0x00000210:    4293        .B      CMP      r3,r2
        0x00000212:    d202        ..      BCS      0x21a ; _printf_str + 38
        0x00000214:    5ce0        .\      LDRB     r0,[r4,r3]
        0x00000216:    2800        .(      CMP      r0,#0
        0x00000218:    d1f9        ..      BNE      0x20e ; _printf_str + 26
        0x0000021a:    69a8        .i      LDR      r0,[r5,#0x18]
        0x0000021c:    18e6        ..      ADDS     r6,r4,r3
        0x0000021e:    1ac0        ..      SUBS     r0,r0,r3
        0x00000220:    61a8        .a      STR      r0,[r5,#0x18]
        0x00000222:    6a28        (j      LDR      r0,[r5,#0x20]
        0x00000224:    4418        .D      ADD      r0,r0,r3
        0x00000226:    6228        (b      STR      r0,[r5,#0x20]
        0x00000228:    4628        (F      MOV      r0,r5
        0x0000022a:    f3af8000    ....    NOP.W    
        0x0000022e:    e004        ..      B        0x23a ; _printf_str + 70
        0x00000230:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x00000234:    f8140b01    ....    LDRB     r0,[r4],#1
        0x00000238:    4790        .G      BLX      r2
        0x0000023a:    42b4        .B      CMP      r4,r6
        0x0000023c:    d3f8        ..      BCC      0x230 ; _printf_str + 60
        0x0000023e:    4628        (F      MOV      r0,r5
        0x00000240:    f3af8000    ....    NOP.W    
        0x00000244:    bd70        p.      POP      {r4-r6,pc}
        0x00000246:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x00000248:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000024c:    4606        .F      MOV      r6,r0
        0x0000024e:    2400        .$      MOVS     r4,#0
        0x00000250:    6810        .h      LDR      r0,[r2,#0]
        0x00000252:    2975        u)      CMP      r1,#0x75
        0x00000254:    4631        1F      MOV      r1,r6
        0x00000256:    a516        ..      ADR      r5,{pc}+0x5a ; 0x2b0
        0x00000258:    d010        ..      BEQ      0x27c ; _printf_int_dec + 52
        0x0000025a:    f3af8000    ....    NOP.W    
        0x0000025e:    2800        .(      CMP      r0,#0
        0x00000260:    da02        ..      BGE      0x268 ; _printf_int_dec + 32
        0x00000262:    4240        @B      RSBS     r0,r0,#0
        0x00000264:    a513        ..      ADR      r5,{pc}+0x50 ; 0x2b4
        0x00000266:    e007        ..      B        0x278 ; _printf_int_dec + 48
        0x00000268:    6831        1h      LDR      r1,[r6,#0]
        0x0000026a:    078a        ..      LSLS     r2,r1,#30
        0x0000026c:    d501        ..      BPL      0x272 ; _printf_int_dec + 42
        0x0000026e:    a512        ..      ADR      r5,{pc}+0x4a ; 0x2b8
        0x00000270:    e002        ..      B        0x278 ; _printf_int_dec + 48
        0x00000272:    0749        I.      LSLS     r1,r1,#29
        0x00000274:    d504        ..      BPL      0x280 ; _printf_int_dec + 56
        0x00000276:    a511        ..      ADR      r5,{pc}+0x46 ; 0x2bc
        0x00000278:    2401        .$      MOVS     r4,#1
        0x0000027a:    e001        ..      B        0x280 ; _printf_int_dec + 56
        0x0000027c:    f3af8000    ....    NOP.W    
        0x00000280:    2100        .!      MOVS     r1,#0
        0x00000282:    220a        ."      MOVS     r2,#0xa
        0x00000284:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x00000288:    e009        ..      B        0x29e ; _printf_int_dec + 86
        0x0000028a:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x0000028e:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x00000292:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x00000296:    3030        00      ADDS     r0,r0,#0x30
        0x00000298:    5478        xT      STRB     r0,[r7,r1]
        0x0000029a:    4618        .F      MOV      r0,r3
        0x0000029c:    1c49        I.      ADDS     r1,r1,#1
        0x0000029e:    2800        .(      CMP      r0,#0
        0x000002a0:    d1f3        ..      BNE      0x28a ; _printf_int_dec + 66
        0x000002a2:    4623        #F      MOV      r3,r4
        0x000002a4:    462a        *F      MOV      r2,r5
        0x000002a6:    4630        0F      MOV      r0,r6
        0x000002a8:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x000002ac:    f000b874    ..t.    B.W      _printf_int_common ; 0x398
    $d
        0x000002b0:    00000000    ....    DCD    0
        0x000002b4:    0000002d    -...    DCD    45
        0x000002b8:    0000002b    +...    DCD    43
        0x000002bc:    00000020     ...    DCD    32
    $t
    .text
    strcpy
        0x000002c0:    ea400301    @...    ORR      r3,r0,r1
        0x000002c4:    4602        .F      MOV      r2,r0
        0x000002c6:    b530        0.      PUSH     {r4,r5,lr}
        0x000002c8:    079b        ..      LSLS     r3,r3,#30
        0x000002ca:    d110        ..      BNE      0x2ee ; strcpy + 46
        0x000002cc:    f04f3401    O..4    MOV      r4,#0x1010101
        0x000002d0:    e000        ..      B        0x2d4 ; strcpy + 20
        0x000002d2:    c208        ..      STM      r2!,{r3}
        0x000002d4:    c908        ..      LDM      r1!,{r3}
        0x000002d6:    1b1d        ..      SUBS     r5,r3,r4
        0x000002d8:    439d        .C      BICS     r5,r5,r3
        0x000002da:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x000002de:    d0f8        ..      BEQ      0x2d2 ; strcpy + 18
        0x000002e0:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x000002e4:    f8021b01    ....    STRB     r1,[r2],#1
        0x000002e8:    d00d        ..      BEQ      0x306 ; strcpy + 70
        0x000002ea:    0a1b        ..      LSRS     r3,r3,#8
        0x000002ec:    e7f8        ..      B        0x2e0 ; strcpy + 32
        0x000002ee:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000002f2:    2b00        .+      CMP      r3,#0
        0x000002f4:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000002f8:    d005        ..      BEQ      0x306 ; strcpy + 70
        0x000002fa:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000002fe:    2b00        .+      CMP      r3,#0
        0x00000300:    f8023b01    ...;    STRB     r3,[r2],#1
        0x00000304:    d1f3        ..      BNE      0x2ee ; strcpy + 46
        0x00000306:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x00000308:    2a03        .*      CMP      r2,#3
        0x0000030a:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x36e
        0x0000030e:    f0100c03    ....    ANDS     r12,r0,#3
        0x00000312:    f0008015    ....    BEQ.W    0x340 ; __aeabi_memcpy + 56
        0x00000316:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x0000031a:    f1bc0f02    ....    CMP      r12,#2
        0x0000031e:    4462        bD      ADD      r2,r2,r12
        0x00000320:    bf98        ..      IT       LS
        0x00000322:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x00000326:    f8003b01    ...;    STRB     r3,[r0],#1
        0x0000032a:    bf38        8.      IT       CC
        0x0000032c:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x00000330:    f1a20204    ....    SUB      r2,r2,#4
        0x00000334:    bf98        ..      IT       LS
        0x00000336:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x0000033a:    bf38        8.      IT       CC
        0x0000033c:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x00000340:    f0110303    ....    ANDS     r3,r1,#3
        0x00000344:    f00080aa    ....    BEQ.W    __aeabi_memcpy4 ; 0x49c
        0x00000348:    3a08        .:      SUBS     r2,r2,#8
        0x0000034a:    f0c08008    ....    BCC.W    0x35e ; __aeabi_memcpy + 86
        0x0000034e:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x00000352:    3a08        .:      SUBS     r2,r2,#8
        0x00000354:    f851cb04    Q...    LDR      r12,[r1],#4
        0x00000358:    e8a01008    ....    STM      r0!,{r3,r12}
        0x0000035c:    e7f5        ..      B        0x34a ; __aeabi_memcpy + 66
        0x0000035e:    1d12        ..      ADDS     r2,r2,#4
        0x00000360:    bf5c        \.      ITT      PL
        0x00000362:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x00000366:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x0000036a:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x0000036e:    07d2        ..      LSLS     r2,r2,#31
        0x00000370:    bf24        $.      ITT      CS
        0x00000372:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x00000376:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000037a:    bf48        H.      IT       MI
        0x0000037c:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000380:    bf24        $.      ITT      CS
        0x00000382:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x00000386:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000038a:    bf48        H.      IT       MI
        0x0000038c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000390:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000392:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000394:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x00000396:    4770        pG      BX       lr
    .text
    _printf_int_common
        0x00000398:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000039c:    460d        .F      MOV      r5,r1
        0x0000039e:    4699        .F      MOV      r9,r3
        0x000003a0:    4692        .F      MOV      r10,r2
        0x000003a2:    4604        .F      MOV      r4,r0
        0x000003a4:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x000003a8:    6801        .h      LDR      r1,[r0,#0]
        0x000003aa:    0688        ..      LSLS     r0,r1,#26
        0x000003ac:    d504        ..      BPL      0x3b8 ; _printf_int_common + 32
        0x000003ae:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x000003b0:    f0210110    !...    BIC      r1,r1,#0x10
        0x000003b4:    6021        !`      STR      r1,[r4,#0]
        0x000003b6:    e000        ..      B        0x3ba ; _printf_int_common + 34
        0x000003b8:    2001        .       MOVS     r0,#1
        0x000003ba:    42a8        .B      CMP      r0,r5
        0x000003bc:    dd01        ..      BLE      0x3c2 ; _printf_int_common + 42
        0x000003be:    1b47        G.      SUBS     r7,r0,r5
        0x000003c0:    e000        ..      B        0x3c4 ; _printf_int_common + 44
        0x000003c2:    2700        .'      MOVS     r7,#0
        0x000003c4:    69a1        .i      LDR      r1,[r4,#0x18]
        0x000003c6:    197a        z.      ADDS     r2,r7,r5
        0x000003c8:    eb020009    ....    ADD      r0,r2,r9
        0x000003cc:    1a08        ..      SUBS     r0,r1,r0
        0x000003ce:    61a0        .a      STR      r0,[r4,#0x18]
        0x000003d0:    7820         x      LDRB     r0,[r4,#0]
        0x000003d2:    06c0        ..      LSLS     r0,r0,#27
        0x000003d4:    d402        ..      BMI      0x3dc ; _printf_int_common + 68
        0x000003d6:    4620         F      MOV      r0,r4
        0x000003d8:    f3af8000    ....    NOP.W    
        0x000003dc:    2600        .&      MOVS     r6,#0
        0x000003de:    e008        ..      B        0x3f2 ; _printf_int_common + 90
        0x000003e0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000003e4:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x000003e8:    4790        .G      BLX      r2
        0x000003ea:    6a20         j      LDR      r0,[r4,#0x20]
        0x000003ec:    1c40        @.      ADDS     r0,r0,#1
        0x000003ee:    1c76        v.      ADDS     r6,r6,#1
        0x000003f0:    6220         b      STR      r0,[r4,#0x20]
        0x000003f2:    454e        NE      CMP      r6,r9
        0x000003f4:    dbf4        ..      BLT      0x3e0 ; _printf_int_common + 72
        0x000003f6:    7820         x      LDRB     r0,[r4,#0]
        0x000003f8:    06c0        ..      LSLS     r0,r0,#27
        0x000003fa:    d50a        ..      BPL      0x412 ; _printf_int_common + 122
        0x000003fc:    4620         F      MOV      r0,r4
        0x000003fe:    f3af8000    ....    NOP.W    
        0x00000402:    e006        ..      B        0x412 ; _printf_int_common + 122
        0x00000404:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000408:    2030        0       MOVS     r0,#0x30
        0x0000040a:    4790        .G      BLX      r2
        0x0000040c:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000040e:    1c40        @.      ADDS     r0,r0,#1
        0x00000410:    6220         b      STR      r0,[r4,#0x20]
        0x00000412:    1e38        8.      SUBS     r0,r7,#0
        0x00000414:    f1a70701    ....    SUB      r7,r7,#1
        0x00000418:    dcf4        ..      BGT      0x404 ; _printf_int_common + 108
        0x0000041a:    e007        ..      B        0x42c ; _printf_int_common + 148
        0x0000041c:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000420:    f8180005    ....    LDRB     r0,[r8,r5]
        0x00000424:    4790        .G      BLX      r2
        0x00000426:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000428:    1c40        @.      ADDS     r0,r0,#1
        0x0000042a:    6220         b      STR      r0,[r4,#0x20]
        0x0000042c:    1e28        (.      SUBS     r0,r5,#0
        0x0000042e:    f1a50501    ....    SUB      r5,r5,#1
        0x00000432:    dcf3        ..      BGT      0x41c ; _printf_int_common + 132
        0x00000434:    4620         F      MOV      r0,r4
        0x00000436:    f3af8000    ....    NOP.W    
        0x0000043a:    7820         x      LDRB     r0,[r4,#0]
        0x0000043c:    0600        ..      LSLS     r0,r0,#24
        0x0000043e:    d502        ..      BPL      0x446 ; _printf_int_common + 174
        0x00000440:    2002        .       MOVS     r0,#2
        0x00000442:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00000446:    2001        .       MOVS     r0,#1
        0x00000448:    e7fb        ..      B        0x442 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x0000044a:    b510        ..      PUSH     {r4,lr}
        0x0000044c:    6943        Ci      LDR      r3,[r0,#0x14]
        0x0000044e:    b113        ..      CBZ      r3,0x456 ; _printf_cs_common + 12
        0x00000450:    f3af8000    ....    NOP.W    
        0x00000454:    e001        ..      B        0x45a ; _printf_cs_common + 16
        0x00000456:    f7fffecd    ....    BL       _printf_str ; 0x1f4
        0x0000045a:    2001        .       MOVS     r0,#1
        0x0000045c:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x0000045e:    7812        .x      LDRB     r2,[r2,#0]
        0x00000460:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000464:    700a        .p      STRB     r2,[r1,#0]
        0x00000466:    2200        ."      MOVS     r2,#0
        0x00000468:    704a        Jp      STRB     r2,[r1,#1]
        0x0000046a:    2201        ."      MOVS     r2,#1
        0x0000046c:    e7ed        ..      B        _printf_cs_common ; 0x44a
    _printf_string
        0x0000046e:    6811        .h      LDR      r1,[r2,#0]
        0x00000470:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000474:    e7e9        ..      B        _printf_cs_common ; 0x44a
        0x00000476:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x00000478:    4b07        .K      LDR      r3,[pc,#28] ; [0x498] = 0xafb
        0x0000047a:    b570        p.      PUSH     {r4-r6,lr}
        0x0000047c:    460d        .F      MOV      r5,r1
        0x0000047e:    447b        {D      ADD      r3,r3,pc
        0x00000480:    f000f843    ..C.    BL       _printf_char_common ; 0x50a
        0x00000484:    4604        .F      MOV      r4,r0
        0x00000486:    4628        (F      MOV      r0,r5
        0x00000488:    f000f852    ..R.    BL       ferror ; 0x530
        0x0000048c:    b110        ..      CBZ      r0,0x494 ; _printf_char_file + 28
        0x0000048e:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000492:    bd70        p.      POP      {r4-r6,pc}
        0x00000494:    4620         F      MOV      r0,r4
        0x00000496:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000498:    00000afb    ....    DCD    2811
    $t
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x0000049c:    b510        ..      PUSH     {r4,lr}
        0x0000049e:    3a20         :      SUBS     r2,r2,#0x20
        0x000004a0:    f0c0800b    ....    BCC.W    0x4ba ; __aeabi_memcpy4 + 30
        0x000004a4:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x000004a8:    3a20         :      SUBS     r2,r2,#0x20
        0x000004aa:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x000004ae:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x000004b2:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x000004b6:    f4bfaff5    ....    BCS.W    0x4a4 ; __aeabi_memcpy4 + 8
        0x000004ba:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x000004be:    bf24        $.      ITT      CS
        0x000004c0:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x000004c4:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x000004c8:    bf44        D.      ITT      MI
        0x000004ca:    c918        ..      LDMMI    r1!,{r3,r4}
        0x000004cc:    c018        ..      STMMI    r0!,{r3,r4}
        0x000004ce:    e8bd4010    ...@    POP      {r4,lr}
        0x000004d2:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x000004d6:    bf24        $.      ITT      CS
        0x000004d8:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x000004dc:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000004e0:    bf08        ..      IT       EQ
        0x000004e2:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000004e4:    07d2        ..      LSLS     r2,r2,#31
        0x000004e6:    bf28        (.      IT       CS
        0x000004e8:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000004ec:    bf48        H.      IT       MI
        0x000004ee:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000004f2:    bf28        (.      IT       CS
        0x000004f4:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000004f8:    bf48        H.      IT       MI
        0x000004fa:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000004fe:    4770        pG      BX       lr
    .text
    _printf_input_char
        0x00000500:    6901        .i      LDR      r1,[r0,#0x10]
        0x00000502:    1c4a        J.      ADDS     r2,r1,#1
        0x00000504:    6102        .a      STR      r2,[r0,#0x10]
        0x00000506:    7808        .x      LDRB     r0,[r1,#0]
        0x00000508:    4770        pG      BX       lr
    _printf_char_common
        0x0000050a:    b500        ..      PUSH     {lr}
        0x0000050c:    b08f        ..      SUB      sp,sp,#0x3c
        0x0000050e:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x00000512:    2100        .!      MOVS     r1,#0
        0x00000514:    9105        ..      STR      r1,[sp,#0x14]
        0x00000516:    4905        .I      LDR      r1,[pc,#20] ; [0x52c] = 0xffffffe5
        0x00000518:    4479        yD      ADD      r1,r1,pc
        0x0000051a:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x0000051e:    4611        .F      MOV      r1,r2
        0x00000520:    4668        hF      MOV      r0,sp
        0x00000522:    f7fffe33    ..3.    BL       __printf ; 0x18c
        0x00000526:    b00f        ..      ADD      sp,sp,#0x3c
        0x00000528:    bd00        ..      POP      {pc}
    $d
        0x0000052a:    0000        ..      DCW    0
        0x0000052c:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x00000530:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x00000532:    f0000080    ....    AND      r0,r0,#0x80
        0x00000536:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x00000538:    4675        uF      MOV      r5,lr
        0x0000053a:    f000f829    ..).    BL       __user_libspace ; 0x590
        0x0000053e:    46ae        .F      MOV      lr,r5
        0x00000540:    0005        ..      MOVS     r5,r0
        0x00000542:    4669        iF      MOV      r1,sp
        0x00000544:    4653        SF      MOV      r3,r10
        0x00000546:    f0200007     ...    BIC      r0,r0,#7
        0x0000054a:    4685        .F      MOV      sp,r0
        0x0000054c:    b018        ..      ADD      sp,sp,#0x60
        0x0000054e:    b520         .      PUSH     {r5,lr}
        0x00000550:    f7fffdfe    ....    BL       __user_initial_stackheap ; 0x150
        0x00000554:    e8bd4020    .. @    POP      {r5,lr}
        0x00000558:    f04f0600    O...    MOV      r6,#0
        0x0000055c:    f04f0700    O...    MOV      r7,#0
        0x00000560:    f04f0800    O...    MOV      r8,#0
        0x00000564:    f04f0b00    O...    MOV      r11,#0
        0x00000568:    f0210107    !...    BIC      r1,r1,#7
        0x0000056c:    46ac        .F      MOV      r12,r5
        0x0000056e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000572:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000576:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000057a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000057e:    468d        .F      MOV      sp,r1
        0x00000580:    4770        pG      BX       lr
    .text
    exit
        0x00000582:    4604        .F      MOV      r4,r0
        0x00000584:    f3af8000    ....    NOP.W    
        0x00000588:    4620         F      MOV      r0,r4
        0x0000058a:    f7fffdcc    ....    BL       __rt_exit ; 0x126
        0x0000058e:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000590:    4800        .H      LDR      r0,[pc,#0] ; [0x594] = 0x200004c0
        0x00000592:    4770        pG      BX       lr
    $d
        0x00000594:    200004c0    ...     DCD    536872128
    $t
    .text
    _sys_exit
        0x00000598:    4901        .I      LDR      r1,[pc,#4] ; [0x5a0] = 0x20026
        0x0000059a:    2018        .       MOVS     r0,#0x18
        0x0000059c:    beab        ..      BKPT     #0xab
        0x0000059e:    e7fe        ..      B        0x59e ; _sys_exit + 6
    $d
        0x000005a0:    00020026    &...    DCD    131110
    $t
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x000005a4:    4770        pG      BX       lr
    i.HAL_GPIO_Init
    .text
    HAL_GPIO_Init
    __semihosting_library_function
        0x000005a6:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000005a8:    4604        .F      MOV      r4,r0
        0x000005aa:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x000005ae:    4620         F      MOV      r0,r4
        0x000005b0:    f000f832    ..2.    BL       HAL_GPIO_SetDir ; 0x618
        0x000005b4:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x000005b8:    2801        .(      CMP      r0,#1
        0x000005ba:    d105        ..      BNE      0x5c8 ; HAL_GPIO_Init + 34
        0x000005bc:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x000005c0:    4620         F      MOV      r0,r4
        0x000005c2:    f000f8b1    ....    BL       HAL_GPIO_WritePin ; 0x728
        0x000005c6:    e009        ..      B        0x5dc ; HAL_GPIO_Init + 54
        0x000005c8:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x000005cc:    4620         F      MOV      r0,r4
        0x000005ce:    f000f807    ....    BL       HAL_GPIO_SetDebounce ; 0x5e0
        0x000005d2:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000005d6:    4620         F      MOV      r0,r4
        0x000005d8:    f000f874    ..t.    BL       HAL_GPIO_TrigType ; 0x6c4
        0x000005dc:    bd1c        ..      POP      {r2-r4,pc}
        0x000005de:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x000005e0:    b530        0.      PUSH     {r4,r5,lr}
        0x000005e2:    460a        .F      MOV      r2,r1
        0x000005e4:    bf00        ..      NOP      
        0x000005e6:    4b0b        .K      LDR      r3,[pc,#44] ; [0x614] = 0x40007000
        0x000005e8:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x000005ea:    b29b        ..      UXTH     r3,r3
        0x000005ec:    4619        .F      MOV      r1,r3
        0x000005ee:    2a01        .*      CMP      r2,#1
        0x000005f0:    d103        ..      BNE      0x5fa ; HAL_GPIO_SetDebounce + 26
        0x000005f2:    2301        .#      MOVS     r3,#1
        0x000005f4:    4083        .@      LSLS     r3,r3,r0
        0x000005f6:    4319        .C      ORRS     r1,r1,r3
        0x000005f8:    e002        ..      B        0x600 ; HAL_GPIO_SetDebounce + 32
        0x000005fa:    2301        .#      MOVS     r3,#1
        0x000005fc:    4083        .@      LSLS     r3,r3,r0
        0x000005fe:    4399        .C      BICS     r1,r1,r3
        0x00000600:    b28b        ..      UXTH     r3,r1
        0x00000602:    4c04        .L      LDR      r4,[pc,#16] ; [0x614] = 0x40007000
        0x00000604:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000606:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000060a:    4d02        .M      LDR      r5,[pc,#8] ; [0x614] = 0x40007000
        0x0000060c:    64ac        .d      STR      r4,[r5,#0x48]
        0x0000060e:    bf00        ..      NOP      
        0x00000610:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000612:    0000        ..      DCW    0
        0x00000614:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000618:    b530        0.      PUSH     {r4,r5,lr}
        0x0000061a:    4602        .F      MOV      r2,r0
        0x0000061c:    2a10        .*      CMP      r2,#0x10
        0x0000061e:    da16        ..      BGE      0x64e ; HAL_GPIO_SetDir + 54
        0x00000620:    bf00        ..      NOP      
        0x00000622:    4b19        .K      LDR      r3,[pc,#100] ; [0x688] = 0x40007000
        0x00000624:    685b        [h      LDR      r3,[r3,#4]
        0x00000626:    b298        ..      UXTH     r0,r3
        0x00000628:    bf00        ..      NOP      
        0x0000062a:    2901        .)      CMP      r1,#1
        0x0000062c:    d103        ..      BNE      0x636 ; HAL_GPIO_SetDir + 30
        0x0000062e:    2301        .#      MOVS     r3,#1
        0x00000630:    4093        .@      LSLS     r3,r3,r2
        0x00000632:    4318        .C      ORRS     r0,r0,r3
        0x00000634:    e002        ..      B        0x63c ; HAL_GPIO_SetDir + 36
        0x00000636:    2301        .#      MOVS     r3,#1
        0x00000638:    4093        .@      LSLS     r3,r3,r2
        0x0000063a:    4398        .C      BICS     r0,r0,r3
        0x0000063c:    b283        ..      UXTH     r3,r0
        0x0000063e:    4c12        .L      LDR      r4,[pc,#72] ; [0x688] = 0x40007000
        0x00000640:    6864        dh      LDR      r4,[r4,#4]
        0x00000642:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000646:    4d10        .M      LDR      r5,[pc,#64] ; [0x688] = 0x40007000
        0x00000648:    606c        l`      STR      r4,[r5,#4]
        0x0000064a:    bf00        ..      NOP      
        0x0000064c:    e01b        ..      B        0x686 ; HAL_GPIO_SetDir + 110
        0x0000064e:    bf00        ..      NOP      
        0x00000650:    4b0d        .K      LDR      r3,[pc,#52] ; [0x688] = 0x40007000
        0x00000652:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000654:    b298        ..      UXTH     r0,r3
        0x00000656:    bf00        ..      NOP      
        0x00000658:    2901        .)      CMP      r1,#1
        0x0000065a:    d106        ..      BNE      0x66a ; HAL_GPIO_SetDir + 82
        0x0000065c:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000660:    2401        .$      MOVS     r4,#1
        0x00000662:    fa04f303    ....    LSL      r3,r4,r3
        0x00000666:    4318        .C      ORRS     r0,r0,r3
        0x00000668:    e004        ..      B        0x674 ; HAL_GPIO_SetDir + 92
        0x0000066a:    f1a20310    ....    SUB      r3,r2,#0x10
        0x0000066e:    2401        .$      MOVS     r4,#1
        0x00000670:    409c        .@      LSLS     r4,r4,r3
        0x00000672:    43a0        .C      BICS     r0,r0,r4
        0x00000674:    b283        ..      UXTH     r3,r0
        0x00000676:    4c04        .L      LDR      r4,[pc,#16] ; [0x688] = 0x40007000
        0x00000678:    6924        $i      LDR      r4,[r4,#0x10]
        0x0000067a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000067e:    4d02        .M      LDR      r5,[pc,#8] ; [0x688] = 0x40007000
        0x00000680:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000682:    bf00        ..      NOP      
        0x00000684:    bf00        ..      NOP      
        0x00000686:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000688:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x0000068c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000068e:    460a        .F      MOV      r2,r1
        0x00000690:    bf00        ..      NOP      
        0x00000692:    4b0b        .K      LDR      r3,[pc,#44] ; [0x6c0] = 0x40007000
        0x00000694:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000696:    b29b        ..      UXTH     r3,r3
        0x00000698:    4619        .F      MOV      r1,r3
        0x0000069a:    2a01        .*      CMP      r2,#1
        0x0000069c:    d103        ..      BNE      0x6a6 ; HAL_GPIO_SetPly + 26
        0x0000069e:    2301        .#      MOVS     r3,#1
        0x000006a0:    4083        .@      LSLS     r3,r3,r0
        0x000006a2:    4319        .C      ORRS     r1,r1,r3
        0x000006a4:    e002        ..      B        0x6ac ; HAL_GPIO_SetPly + 32
        0x000006a6:    2301        .#      MOVS     r3,#1
        0x000006a8:    4083        .@      LSLS     r3,r3,r0
        0x000006aa:    4399        .C      BICS     r1,r1,r3
        0x000006ac:    b28b        ..      UXTH     r3,r1
        0x000006ae:    4c04        .L      LDR      r4,[pc,#16] ; [0x6c0] = 0x40007000
        0x000006b0:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x000006b2:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000006b6:    4d02        .M      LDR      r5,[pc,#8] ; [0x6c0] = 0x40007000
        0x000006b8:    63ec        .c      STR      r4,[r5,#0x3c]
        0x000006ba:    bf00        ..      NOP      
        0x000006bc:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000006be:    0000        ..      DCW    0
        0x000006c0:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x000006c4:    b570        p.      PUSH     {r4-r6,lr}
        0x000006c6:    4605        .F      MOV      r5,r0
        0x000006c8:    460c        .F      MOV      r4,r1
        0x000006ca:    b134        4.      CBZ      r4,0x6da ; HAL_GPIO_TrigType + 22
        0x000006cc:    2c01        .,      CMP      r4,#1
        0x000006ce:    d00d        ..      BEQ      0x6ec ; HAL_GPIO_TrigType + 40
        0x000006d0:    2c02        .,      CMP      r4,#2
        0x000006d2:    d014        ..      BEQ      0x6fe ; HAL_GPIO_TrigType + 58
        0x000006d4:    2c03        .,      CMP      r4,#3
        0x000006d6:    d124        $.      BNE      0x722 ; HAL_GPIO_TrigType + 94
        0x000006d8:    e01a        ..      B        0x710 ; HAL_GPIO_TrigType + 76
        0x000006da:    2100        .!      MOVS     r1,#0
        0x000006dc:    4628        (F      MOV      r0,r5
        0x000006de:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0x784
        0x000006e2:    2100        .!      MOVS     r1,#0
        0x000006e4:    4628        (F      MOV      r0,r5
        0x000006e6:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0x68c
        0x000006ea:    e01a        ..      B        0x722 ; HAL_GPIO_TrigType + 94
        0x000006ec:    2100        .!      MOVS     r1,#0
        0x000006ee:    4628        (F      MOV      r0,r5
        0x000006f0:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0x784
        0x000006f4:    2101        .!      MOVS     r1,#1
        0x000006f6:    4628        (F      MOV      r0,r5
        0x000006f8:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0x68c
        0x000006fc:    e011        ..      B        0x722 ; HAL_GPIO_TrigType + 94
        0x000006fe:    2101        .!      MOVS     r1,#1
        0x00000700:    4628        (F      MOV      r0,r5
        0x00000702:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0x784
        0x00000706:    2100        .!      MOVS     r1,#0
        0x00000708:    4628        (F      MOV      r0,r5
        0x0000070a:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0x68c
        0x0000070e:    e008        ..      B        0x722 ; HAL_GPIO_TrigType + 94
        0x00000710:    2101        .!      MOVS     r1,#1
        0x00000712:    4628        (F      MOV      r0,r5
        0x00000714:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0x784
        0x00000718:    2101        .!      MOVS     r1,#1
        0x0000071a:    4628        (F      MOV      r0,r5
        0x0000071c:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0x68c
        0x00000720:    bf00        ..      NOP      
        0x00000722:    bf00        ..      NOP      
        0x00000724:    bd70        p.      POP      {r4-r6,pc}
        0x00000726:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000728:    b570        p.      PUSH     {r4-r6,lr}
        0x0000072a:    4605        .F      MOV      r5,r0
        0x0000072c:    460e        .F      MOV      r6,r1
        0x0000072e:    2d10        .-      CMP      r5,#0x10
        0x00000730:    da10        ..      BGE      0x754 ; HAL_GPIO_WritePin + 44
        0x00000732:    bf00        ..      NOP      
        0x00000734:    4812        .H      LDR      r0,[pc,#72] ; [0x780] = 0x40007000
        0x00000736:    6800        .h      LDR      r0,[r0,#0]
        0x00000738:    b284        ..      UXTH     r4,r0
        0x0000073a:    bf00        ..      NOP      
        0x0000073c:    b91e        ..      CBNZ     r6,0x746 ; HAL_GPIO_WritePin + 30
        0x0000073e:    2001        .       MOVS     r0,#1
        0x00000740:    40a8        .@      LSLS     r0,r0,r5
        0x00000742:    4384        .C      BICS     r4,r4,r0
        0x00000744:    e002        ..      B        0x74c ; HAL_GPIO_WritePin + 36
        0x00000746:    2001        .       MOVS     r0,#1
        0x00000748:    40a8        .@      LSLS     r0,r0,r5
        0x0000074a:    4304        .C      ORRS     r4,r4,r0
        0x0000074c:    b2a0        ..      UXTH     r0,r4
        0x0000074e:    f000fc1d    ....    BL       gpio_portadataregister_setf ; 0xf8c
        0x00000752:    e014        ..      B        0x77e ; HAL_GPIO_WritePin + 86
        0x00000754:    bf00        ..      NOP      
        0x00000756:    480a        .H      LDR      r0,[pc,#40] ; [0x780] = 0x40007000
        0x00000758:    68c0        .h      LDR      r0,[r0,#0xc]
        0x0000075a:    b284        ..      UXTH     r4,r0
        0x0000075c:    bf00        ..      NOP      
        0x0000075e:    b92e        ..      CBNZ     r6,0x76c ; HAL_GPIO_WritePin + 68
        0x00000760:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000764:    2101        .!      MOVS     r1,#1
        0x00000766:    4081        .@      LSLS     r1,r1,r0
        0x00000768:    438c        .C      BICS     r4,r4,r1
        0x0000076a:    e005        ..      B        0x778 ; HAL_GPIO_WritePin + 80
        0x0000076c:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000770:    2101        .!      MOVS     r1,#1
        0x00000772:    fa01f000    ....    LSL      r0,r1,r0
        0x00000776:    4304        .C      ORRS     r4,r4,r0
        0x00000778:    b2a0        ..      UXTH     r0,r4
        0x0000077a:    f000fc11    ....    BL       gpio_portbdataregister_setf ; 0xfa0
        0x0000077e:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000780:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000784:    b530        0.      PUSH     {r4,r5,lr}
        0x00000786:    460a        .F      MOV      r2,r1
        0x00000788:    bf00        ..      NOP      
        0x0000078a:    4b0b        .K      LDR      r3,[pc,#44] ; [0x7b8] = 0x40007000
        0x0000078c:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x0000078e:    b29b        ..      UXTH     r3,r3
        0x00000790:    4619        .F      MOV      r1,r3
        0x00000792:    2a01        .*      CMP      r2,#1
        0x00000794:    d103        ..      BNE      0x79e ; HAL_GPIO_setIrqLevel + 26
        0x00000796:    2301        .#      MOVS     r3,#1
        0x00000798:    4083        .@      LSLS     r3,r3,r0
        0x0000079a:    4319        .C      ORRS     r1,r1,r3
        0x0000079c:    e002        ..      B        0x7a4 ; HAL_GPIO_setIrqLevel + 32
        0x0000079e:    2301        .#      MOVS     r3,#1
        0x000007a0:    4083        .@      LSLS     r3,r3,r0
        0x000007a2:    4399        .C      BICS     r1,r1,r3
        0x000007a4:    b28b        ..      UXTH     r3,r1
        0x000007a6:    4c04        .L      LDR      r4,[pc,#16] ; [0x7b8] = 0x40007000
        0x000007a8:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x000007aa:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000007ae:    4d02        .M      LDR      r5,[pc,#8] ; [0x7b8] = 0x40007000
        0x000007b0:    63ac        .c      STR      r4,[r5,#0x38]
        0x000007b2:    bf00        ..      NOP      
        0x000007b4:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000007b6:    0000        ..      DCW    0
        0x000007b8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x000007bc:    bf00        ..      NOP      
        0x000007be:    4904        .I      LDR      r1,[pc,#16] ; [0x7d0] = 0x40020000
        0x000007c0:    6909        .i      LDR      r1,[r1,#0x10]
        0x000007c2:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000007c6:    4a02        .J      LDR      r2,[pc,#8] ; [0x7d0] = 0x40020000
        0x000007c8:    6111        .a      STR      r1,[r2,#0x10]
        0x000007ca:    bf00        ..      NOP      
        0x000007cc:    4770        pG      BX       lr
    $d
        0x000007ce:    0000        ..      DCW    0
        0x000007d0:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x000007d4:    b510        ..      PUSH     {r4,lr}
        0x000007d6:    4604        .F      MOV      r4,r0
        0x000007d8:    1e60        `.      SUBS     r0,r4,#1
        0x000007da:    280f        .(      CMP      r0,#0xf
        0x000007dc:    dc00        ..      BGT      0x7e0 ; HAL_SYSCON_Set_HClk_Div + 12
        0x000007de:    e004        ..      B        0x7ea ; HAL_SYSCON_Set_HClk_Div + 22
        0x000007e0:    2225        %"      MOVS     r2,#0x25
        0x000007e2:    a108        ..      ADR      r1,{pc}+0x22 ; 0x804
        0x000007e4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x824
        0x000007e6:    f000fbaf    ....    BL       __aeabi_assert ; 0xf48
        0x000007ea:    1e61        a.      SUBS     r1,r4,#1
        0x000007ec:    b2c8        ..      UXTB     r0,r1
        0x000007ee:    4913        .I      LDR      r1,[pc,#76] ; [0x83c] = 0x40020000
        0x000007f0:    6849        Ih      LDR      r1,[r1,#4]
        0x000007f2:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000007f6:    4a11        .J      LDR      r2,[pc,#68] ; [0x83c] = 0x40020000
        0x000007f8:    6051        Q`      STR      r1,[r2,#4]
        0x000007fa:    bf00        ..      NOP      
        0x000007fc:    2001        .       MOVS     r0,#1
        0x000007fe:    f000fbed    ....    BL       sysc_awo_div_update_set ; 0xfdc
        0x00000802:    bd10        ..      POP      {r4,pc}
    $d
        0x00000804:    735c2e2e    ..\s    DCD    1935420974
        0x00000808:    735c6b64    dk\s    DCD    1935436644
        0x0000080c:    735c6372    rc\s    DCD    1935434610
        0x00000810:    645c636f    oc\d    DCD    1683776367
        0x00000814:    65766972    rive    DCD    1702259058
        0x00000818:    79735c72    r\sy    DCD    2037603442
        0x0000081c:    6e6f6373    scon    DCD    1852793715
        0x00000820:    0000632e    .c..    DCD    25390
        0x00000824:    62686128    (ahb    DCD    1651007784
        0x00000828:    7669645f    _div    DCD    1986618463
        0x0000082c:    72656469    ider    DCD    1919247465
        0x00000830:    3c29312d    -1)<    DCD    1009332525
        0x00000834:    6678303d    =0xf    DCD    1719152701
        0x00000838:    00000000    ....    DCD    0
        0x0000083c:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000840:    b510        ..      PUSH     {r4,lr}
        0x00000842:    4604        .F      MOV      r4,r0
        0x00000844:    1e60        `.      SUBS     r0,r4,#1
        0x00000846:    280f        .(      CMP      r0,#0xf
        0x00000848:    dc00        ..      BGT      0x84c ; HAL_SYSCON_Set_PClk0_Div + 12
        0x0000084a:    e004        ..      B        0x856 ; HAL_SYSCON_Set_PClk0_Div + 22
        0x0000084c:    222c        ,"      MOVS     r2,#0x2c
        0x0000084e:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x878
        0x00000850:    a011        ..      ADR      r0,{pc}+0x48 ; 0x898
        0x00000852:    f000fb79    ..y.    BL       __aeabi_assert ; 0xf48
        0x00000856:    1e61        a.      SUBS     r1,r4,#1
        0x00000858:    b2c8        ..      UXTB     r0,r1
        0x0000085a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x0000085e:    6849        Ih      LDR      r1,[r1,#4]
        0x00000860:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000864:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000868:    6051        Q`      STR      r1,[r2,#4]
        0x0000086a:    bf00        ..      NOP      
        0x0000086c:    2001        .       MOVS     r0,#1
        0x0000086e:    0781        ..      LSLS     r1,r0,#30
        0x00000870:    6008        .`      STR      r0,[r1,#0]
        0x00000872:    bf00        ..      NOP      
        0x00000874:    bd10        ..      POP      {r4,pc}
    $d
        0x00000876:    0000        ..      DCW    0
        0x00000878:    735c2e2e    ..\s    DCD    1935420974
        0x0000087c:    735c6b64    dk\s    DCD    1935436644
        0x00000880:    735c6372    rc\s    DCD    1935434610
        0x00000884:    645c636f    oc\d    DCD    1683776367
        0x00000888:    65766972    rive    DCD    1702259058
        0x0000088c:    79735c72    r\sy    DCD    2037603442
        0x00000890:    6e6f6373    scon    DCD    1852793715
        0x00000894:    0000632e    .c..    DCD    25390
        0x00000898:    62706128    (apb    DCD    1651532072
        0x0000089c:    69645f30    0_di    DCD    1768185648
        0x000008a0:    65646976    vide    DCD    1701079414
        0x000008a4:    29312d72    r-1)    DCD    691088754
        0x000008a8:    78303d3c    <=0x    DCD    2016427324
        0x000008ac:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x000008b0:    b510        ..      PUSH     {r4,lr}
        0x000008b2:    4604        .F      MOV      r4,r0
        0x000008b4:    1e60        `.      SUBS     r0,r4,#1
        0x000008b6:    280f        .(      CMP      r0,#0xf
        0x000008b8:    dc00        ..      BGT      0x8bc ; HAL_SYSCON_Set_PClk1_Div + 12
        0x000008ba:    e004        ..      B        0x8c6 ; HAL_SYSCON_Set_PClk1_Div + 22
        0x000008bc:    2234        4"      MOVS     r2,#0x34
        0x000008be:    a108        ..      ADR      r1,{pc}+0x22 ; 0x8e0
        0x000008c0:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x900
        0x000008c2:    f000fb41    ..A.    BL       __aeabi_assert ; 0xf48
        0x000008c6:    1e61        a.      SUBS     r1,r4,#1
        0x000008c8:    b2c8        ..      UXTB     r0,r1
        0x000008ca:    4913        .I      LDR      r1,[pc,#76] ; [0x918] = 0x40020000
        0x000008cc:    6849        Ih      LDR      r1,[r1,#4]
        0x000008ce:    f3601107    `...    BFI      r1,r0,#4,#4
        0x000008d2:    4a11        .J      LDR      r2,[pc,#68] ; [0x918] = 0x40020000
        0x000008d4:    6051        Q`      STR      r1,[r2,#4]
        0x000008d6:    bf00        ..      NOP      
        0x000008d8:    2002        .       MOVS     r0,#2
        0x000008da:    f000fb7f    ....    BL       sysc_awo_div_update_set ; 0xfdc
        0x000008de:    bd10        ..      POP      {r4,pc}
    $d
        0x000008e0:    735c2e2e    ..\s    DCD    1935420974
        0x000008e4:    735c6b64    dk\s    DCD    1935436644
        0x000008e8:    735c6372    rc\s    DCD    1935434610
        0x000008ec:    645c636f    oc\d    DCD    1683776367
        0x000008f0:    65766972    rive    DCD    1702259058
        0x000008f4:    79735c72    r\sy    DCD    2037603442
        0x000008f8:    6e6f6373    scon    DCD    1852793715
        0x000008fc:    0000632e    .c..    DCD    25390
        0x00000900:    62706128    (apb    DCD    1651532072
        0x00000904:    69645f31    1_di    DCD    1768185649
        0x00000908:    65646976    vide    DCD    1701079414
        0x0000090c:    29312d72    r-1)    DCD    691088754
        0x00000910:    78303d3c    <=0x    DCD    2016427324
        0x00000914:    00000066    f...    DCD    102
        0x00000918:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x0000091c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000091e:    4605        .F      MOV      r5,r0
        0x00000920:    460c        .F      MOV      r4,r1
        0x00000922:    1e60        `.      SUBS     r0,r4,#1
        0x00000924:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000928:    da00        ..      BGE      0x92c ; HAL_SYSCON_Set_RTC_Div + 16
        0x0000092a:    e004        ..      B        0x936 ; HAL_SYSCON_Set_RTC_Div + 26
        0x0000092c:    223c        <"      MOVS     r2,#0x3c
        0x0000092e:    a112        ..      ADR      r1,{pc}+0x4a ; 0x978
        0x00000930:    a019        ..      ADR      r0,{pc}+0x68 ; 0x998
        0x00000932:    f000fb09    ....    BL       __aeabi_assert ; 0xf48
        0x00000936:    2d01        .-      CMP      r5,#1
        0x00000938:    dc00        ..      BGT      0x93c ; HAL_SYSCON_Set_RTC_Div + 32
        0x0000093a:    e004        ..      B        0x946 ; HAL_SYSCON_Set_RTC_Div + 42
        0x0000093c:    223d        ="      MOVS     r2,#0x3d
        0x0000093e:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x978
        0x00000940:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x9b0
        0x00000942:    f000fb01    ....    BL       __aeabi_assert ; 0xf48
        0x00000946:    b935        5.      CBNZ     r5,0x956 ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000948:    2000        .       MOVS     r0,#0
        0x0000094a:    f000fb4d    ..M.    BL       sysc_awo_rtc_div_para_m1_setf ; 0xfe8
        0x0000094e:    2004        .       MOVS     r0,#4
        0x00000950:    f000fb44    ..D.    BL       sysc_awo_div_update_set ; 0xfdc
        0x00000954:    e00e        ..      B        0x974 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000956:    2c02        .,      CMP      r4,#2
        0x00000958:    db00        ..      BLT      0x95c ; HAL_SYSCON_Set_RTC_Div + 64
        0x0000095a:    e004        ..      B        0x966 ; HAL_SYSCON_Set_RTC_Div + 74
        0x0000095c:    2247        G"      MOVS     r2,#0x47
        0x0000095e:    a106        ..      ADR      r1,{pc}+0x1a ; 0x978
        0x00000960:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x9cc
        0x00000962:    f000faf1    ....    BL       __aeabi_assert ; 0xf48
        0x00000966:    1e61        a.      SUBS     r1,r4,#1
        0x00000968:    b288        ..      UXTH     r0,r1
        0x0000096a:    f000fb3d    ..=.    BL       sysc_awo_rtc_div_para_m1_setf ; 0xfe8
        0x0000096e:    2004        .       MOVS     r0,#4
        0x00000970:    f000fb34    ..4.    BL       sysc_awo_div_update_set ; 0xfdc
        0x00000974:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000976:    0000        ..      DCW    0
        0x00000978:    735c2e2e    ..\s    DCD    1935420974
        0x0000097c:    735c6b64    dk\s    DCD    1935436644
        0x00000980:    735c6372    rc\s    DCD    1935434610
        0x00000984:    645c636f    oc\d    DCD    1683776367
        0x00000988:    65766972    rive    DCD    1702259058
        0x0000098c:    79735c72    r\sy    DCD    2037603442
        0x00000990:    6e6f6373    scon    DCD    1852793715
        0x00000994:    0000632e    .c..    DCD    25390
        0x00000998:    63747228    (rtc    DCD    1668575784
        0x0000099c:    7669645f    _div    DCD    1986618463
        0x000009a0:    72656469    ider    DCD    1919247465
        0x000009a4:    3c29312d    -1)<    DCD    1009332525
        0x000009a8:    3178303d    =0x1    DCD    829960253
        0x000009ac:    00666666    fff.    DCD    6710886
        0x000009b0:    5f637472    rtc_    DCD    1600353394
        0x000009b4:    3c637273    src<    DCD    1013150323
        0x000009b8:    6374723d    =rtc    DCD    1668575805
        0x000009bc:    5f6b6c63    clk_    DCD    1600875619
        0x000009c0:    6d6f7266    from    DCD    1836020326
        0x000009c4:    6268615f    _ahb    DCD    1651007839
        0x000009c8:    00000000    ....    DCD    0
        0x000009cc:    5f637472    rtc_    DCD    1600353394
        0x000009d0:    69766964    divi    DCD    1769367908
        0x000009d4:    3e726564    der>    DCD    1047684452
        0x000009d8:    0000323d    =2..    DCD    12861
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000009dc:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000009e0:    4607        .F      MOV      r7,r0
        0x000009e2:    480b        .H      LDR      r0,[pc,#44] ; [0xa10] = 0x20000008
        0x000009e4:    4615        .F      MOV      r5,r2
        0x000009e6:    460e        .F      MOV      r6,r1
        0x000009e8:    7800        .x      LDRB     r0,[r0,#0]
        0x000009ea:    b908        ..      CBNZ     r0,0x9f0 ; SEGGER_RTT_Write + 20
        0x000009ec:    f000f936    ..6.    BL       _DoInit ; 0xc5c
        0x000009f0:    f3ef8411    ....    MRS      r4,BASEPRI
        0x000009f4:    2020                MOVS     r0,#0x20
        0x000009f6:    f3808811    ....    MSR      BASEPRI,r0
        0x000009fa:    462a        *F      MOV      r2,r5
        0x000009fc:    4631        1F      MOV      r1,r6
        0x000009fe:    4638        8F      MOV      r0,r7
        0x00000a00:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0xa14
        0x00000a04:    b2e1        ..      UXTB     r1,r4
        0x00000a06:    f3818811    ....    MSR      BASEPRI,r1
        0x00000a0a:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000a0e:    0000        ..      DCW    0
        0x00000a10:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000a14:    b570        p.      PUSH     {r4-r6,lr}
        0x00000a16:    460e        .F      MOV      r6,r1
        0x00000a18:    4914        .I      LDR      r1,[pc,#80] ; [0xa6c] = 0x20000008
        0x00000a1a:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x00000a1e:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x00000a22:    4614        .F      MOV      r4,r2
        0x00000a24:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x00000a26:    3518        .5      ADDS     r5,r5,#0x18
        0x00000a28:    b120         .      CBZ      r0,0xa34 ; SEGGER_RTT_WriteNoLock + 32
        0x00000a2a:    2801        .(      CMP      r0,#1
        0x00000a2c:    d00f        ..      BEQ      0xa4e ; SEGGER_RTT_WriteNoLock + 58
        0x00000a2e:    2802        .(      CMP      r0,#2
        0x00000a30:    d105        ..      BNE      0xa3e ; SEGGER_RTT_WriteNoLock + 42
        0x00000a32:    e013        ..      B        0xa5c ; SEGGER_RTT_WriteNoLock + 72
        0x00000a34:    4628        (F      MOV      r0,r5
        0x00000a36:    f000f945    ..E.    BL       _GetAvailWriteSpace ; 0xcc4
        0x00000a3a:    42a0        .B      CMP      r0,r4
        0x00000a3c:    d201        ..      BCS      0xa42 ; SEGGER_RTT_WriteNoLock + 46
        0x00000a3e:    2400        .$      MOVS     r4,#0
        0x00000a40:    e011        ..      B        0xa66 ; SEGGER_RTT_WriteNoLock + 82
        0x00000a42:    4622        "F      MOV      r2,r4
        0x00000a44:    4631        1F      MOV      r1,r6
        0x00000a46:    4628        (F      MOV      r0,r5
        0x00000a48:    f000fa5c    ..\.    BL       _WriteNoCheck ; 0xf04
        0x00000a4c:    e00b        ..      B        0xa66 ; SEGGER_RTT_WriteNoLock + 82
        0x00000a4e:    4628        (F      MOV      r0,r5
        0x00000a50:    f000f938    ..8.    BL       _GetAvailWriteSpace ; 0xcc4
        0x00000a54:    42a0        .B      CMP      r0,r4
        0x00000a56:    d2f4        ..      BCS      0xa42 ; SEGGER_RTT_WriteNoLock + 46
        0x00000a58:    4604        .F      MOV      r4,r0
        0x00000a5a:    e7f2        ..      B        0xa42 ; SEGGER_RTT_WriteNoLock + 46
        0x00000a5c:    4631        1F      MOV      r1,r6
        0x00000a5e:    4628        (F      MOV      r0,r5
        0x00000a60:    f000fa23    ..#.    BL       _WriteBlocking ; 0xeaa
        0x00000a64:    4604        .F      MOV      r4,r0
        0x00000a66:    4620         F      MOV      r0,r4
        0x00000a68:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000a6a:    0000        ..      DCW    0
        0x00000a6c:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00000a70:    b40f        ..      PUSH     {r0-r3}
        0x00000a72:    b508        ..      PUSH     {r3,lr}
        0x00000a74:    a904        ..      ADD      r1,sp,#0x10
        0x00000a76:    9100        ..      STR      r1,[sp,#0]
        0x00000a78:    466a        jF      MOV      r2,sp
        0x00000a7a:    9903        ..      LDR      r1,[sp,#0xc]
        0x00000a7c:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0xa86
        0x00000a80:    b001        ..      ADD      sp,sp,#4
        0x00000a82:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x00000a86:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000a8a:    b098        ..      SUB      sp,sp,#0x60
        0x00000a8c:    4680        .F      MOV      r8,r0
        0x00000a8e:    a807        ..      ADD      r0,sp,#0x1c
        0x00000a90:    9002        ..      STR      r0,[sp,#8]
        0x00000a92:    2040        @       MOVS     r0,#0x40
        0x00000a94:    2600        .&      MOVS     r6,#0
        0x00000a96:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x00000a9a:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x00000a9e:    4615        .F      MOV      r5,r2
        0x00000aa0:    460c        .F      MOV      r4,r1
        0x00000aa2:    f8141b01    ....    LDRB     r1,[r4],#1
        0x00000aa6:    2900        .)      CMP      r1,#0
        0x00000aa8:    d06f        o.      BEQ      0xb8a ; SEGGER_RTT_vprintf + 260
        0x00000aaa:    2925        %)      CMP      r1,#0x25
        0x00000aac:    d008        ..      BEQ      0xac0 ; SEGGER_RTT_vprintf + 58
        0x00000aae:    a802        ..      ADD      r0,sp,#8
        0x00000ab0:    f000f9dc    ....    BL       _StoreChar ; 0xe6c
        0x00000ab4:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000ab6:    2800        .(      CMP      r0,#0
        0x00000ab8:    daf3        ..      BGE      0xaa2 ; SEGGER_RTT_vprintf + 28
        0x00000aba:    b018        ..      ADD      sp,sp,#0x60
        0x00000abc:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00000ac0:    2000        .       MOVS     r0,#0
        0x00000ac2:    2201        ."      MOVS     r2,#1
        0x00000ac4:    7821        !x      LDRB     r1,[r4,#0]
        0x00000ac6:    2923        #)      CMP      r1,#0x23
        0x00000ac8:    d01e        ..      BEQ      0xb08 ; SEGGER_RTT_vprintf + 130
        0x00000aca:    292b        +)      CMP      r1,#0x2b
        0x00000acc:    d019        ..      BEQ      0xb02 ; SEGGER_RTT_vprintf + 124
        0x00000ace:    292d        -)      CMP      r1,#0x2d
        0x00000ad0:    d002        ..      BEQ      0xad8 ; SEGGER_RTT_vprintf + 82
        0x00000ad2:    2930        0)      CMP      r1,#0x30
        0x00000ad4:    d108        ..      BNE      0xae8 ; SEGGER_RTT_vprintf + 98
        0x00000ad6:    e002        ..      B        0xade ; SEGGER_RTT_vprintf + 88
        0x00000ad8:    f0400001    @...    ORR      r0,r0,#1
        0x00000adc:    e001        ..      B        0xae2 ; SEGGER_RTT_vprintf + 92
        0x00000ade:    f0400002    @...    ORR      r0,r0,#2
        0x00000ae2:    1c64        d.      ADDS     r4,r4,#1
        0x00000ae4:    2a00        .*      CMP      r2,#0
        0x00000ae6:    d1ed        ..      BNE      0xac4 ; SEGGER_RTT_vprintf + 62
        0x00000ae8:    2200        ."      MOVS     r2,#0
        0x00000aea:    7821        !x      LDRB     r1,[r4,#0]
        0x00000aec:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x00000af0:    2b0a        .+      CMP      r3,#0xa
        0x00000af2:    d20c        ..      BCS      0xb0e ; SEGGER_RTT_vprintf + 136
        0x00000af4:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x00000af8:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x00000afc:    3a30        0:      SUBS     r2,r2,#0x30
        0x00000afe:    1c64        d.      ADDS     r4,r4,#1
        0x00000b00:    e7f3        ..      B        0xaea ; SEGGER_RTT_vprintf + 100
        0x00000b02:    f0400004    @...    ORR      r0,r0,#4
        0x00000b06:    e7ec        ..      B        0xae2 ; SEGGER_RTT_vprintf + 92
        0x00000b08:    f0400008    @...    ORR      r0,r0,#8
        0x00000b0c:    e7e9        ..      B        0xae2 ; SEGGER_RTT_vprintf + 92
        0x00000b0e:    2300        .#      MOVS     r3,#0
        0x00000b10:    b2cf        ..      UXTB     r7,r1
        0x00000b12:    2f2e        ./      CMP      r7,#0x2e
        0x00000b14:    d10b        ..      BNE      0xb2e ; SEGGER_RTT_vprintf + 168
        0x00000b16:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00000b1a:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x00000b1e:    2f0a        ./      CMP      r7,#0xa
        0x00000b20:    d205        ..      BCS      0xb2e ; SEGGER_RTT_vprintf + 168
        0x00000b22:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x00000b26:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x00000b2a:    3b30        0;      SUBS     r3,r3,#0x30
        0x00000b2c:    e7f3        ..      B        0xb16 ; SEGGER_RTT_vprintf + 144
        0x00000b2e:    296c        l)      CMP      r1,#0x6c
        0x00000b30:    d00d        ..      BEQ      0xb4e ; SEGGER_RTT_vprintf + 200
        0x00000b32:    2968        h)      CMP      r1,#0x68
        0x00000b34:    d00b        ..      BEQ      0xb4e ; SEGGER_RTT_vprintf + 200
        0x00000b36:    2970        p)      CMP      r1,#0x70
        0x00000b38:    d04a        J.      BEQ      0xbd0 ; SEGGER_RTT_vprintf + 330
        0x00000b3a:    dc0b        ..      BGT      0xb54 ; SEGGER_RTT_vprintf + 206
        0x00000b3c:    2925        %)      CMP      r1,#0x25
        0x00000b3e:    d014        ..      BEQ      0xb6a ; SEGGER_RTT_vprintf + 228
        0x00000b40:    2958        X)      CMP      r1,#0x58
        0x00000b42:    d02b        +.      BEQ      0xb9c ; SEGGER_RTT_vprintf + 278
        0x00000b44:    2963        c)      CMP      r1,#0x63
        0x00000b46:    d00c        ..      BEQ      0xb62 ; SEGGER_RTT_vprintf + 220
        0x00000b48:    2964        d)      CMP      r1,#0x64
        0x00000b4a:    d111        ..      BNE      0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000b4c:    e012        ..      B        0xb74 ; SEGGER_RTT_vprintf + 238
        0x00000b4e:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00000b52:    e7ec        ..      B        0xb2e ; SEGGER_RTT_vprintf + 168
        0x00000b54:    2973        s)      CMP      r1,#0x73
        0x00000b56:    d02c        ,.      BEQ      0xbb2 ; SEGGER_RTT_vprintf + 300
        0x00000b58:    2975        u)      CMP      r1,#0x75
        0x00000b5a:    d017        ..      BEQ      0xb8c ; SEGGER_RTT_vprintf + 262
        0x00000b5c:    2978        x)      CMP      r1,#0x78
        0x00000b5e:    d107        ..      BNE      0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000b60:    e01c        ..      B        0xb9c ; SEGGER_RTT_vprintf + 278
        0x00000b62:    6828        (h      LDR      r0,[r5,#0]
        0x00000b64:    1d01        ..      ADDS     r1,r0,#4
        0x00000b66:    6029        )`      STR      r1,[r5,#0]
        0x00000b68:    7801        .x      LDRB     r1,[r0,#0]
        0x00000b6a:    a802        ..      ADD      r0,sp,#8
        0x00000b6c:    f000f97e    ..~.    BL       _StoreChar ; 0xe6c
        0x00000b70:    1c64        d.      ADDS     r4,r4,#1
        0x00000b72:    e79f        ..      B        0xab4 ; SEGGER_RTT_vprintf + 46
        0x00000b74:    6829        )h      LDR      r1,[r5,#0]
        0x00000b76:    1d0f        ..      ADDS     r7,r1,#4
        0x00000b78:    602f        /`      STR      r7,[r5,#0]
        0x00000b7a:    6809        .h      LDR      r1,[r1,#0]
        0x00000b7c:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000b80:    220a        ."      MOVS     r2,#0xa
        0x00000b82:    a802        ..      ADD      r0,sp,#8
        0x00000b84:    f000f8a9    ....    BL       _PrintInt ; 0xcda
        0x00000b88:    e7f2        ..      B        0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000b8a:    e02b        +.      B        0xbe4 ; SEGGER_RTT_vprintf + 350
        0x00000b8c:    6829        )h      LDR      r1,[r5,#0]
        0x00000b8e:    1d0f        ..      ADDS     r7,r1,#4
        0x00000b90:    602f        /`      STR      r7,[r5,#0]
        0x00000b92:    6809        .h      LDR      r1,[r1,#0]
        0x00000b94:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000b98:    220a        ."      MOVS     r2,#0xa
        0x00000b9a:    e006        ..      B        0xbaa ; SEGGER_RTT_vprintf + 292
        0x00000b9c:    6829        )h      LDR      r1,[r5,#0]
        0x00000b9e:    1d0f        ..      ADDS     r7,r1,#4
        0x00000ba0:    602f        /`      STR      r7,[r5,#0]
        0x00000ba2:    6809        .h      LDR      r1,[r1,#0]
        0x00000ba4:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000ba8:    2210        ."      MOVS     r2,#0x10
        0x00000baa:    a802        ..      ADD      r0,sp,#8
        0x00000bac:    f000f8f8    ....    BL       _PrintUnsigned ; 0xda0
        0x00000bb0:    e7de        ..      B        0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000bb2:    6828        (h      LDR      r0,[r5,#0]
        0x00000bb4:    1d01        ..      ADDS     r1,r0,#4
        0x00000bb6:    6029        )`      STR      r1,[r5,#0]
        0x00000bb8:    6807        .h      LDR      r7,[r0,#0]
        0x00000bba:    f8171b01    ....    LDRB     r1,[r7],#1
        0x00000bbe:    2900        .)      CMP      r1,#0
        0x00000bc0:    d0d6        ..      BEQ      0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000bc2:    a802        ..      ADD      r0,sp,#8
        0x00000bc4:    f000f952    ..R.    BL       _StoreChar ; 0xe6c
        0x00000bc8:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000bca:    2800        .(      CMP      r0,#0
        0x00000bcc:    daf5        ..      BGE      0xbba ; SEGGER_RTT_vprintf + 308
        0x00000bce:    e7cf        ..      B        0xb70 ; SEGGER_RTT_vprintf + 234
        0x00000bd0:    6828        (h      LDR      r0,[r5,#0]
        0x00000bd2:    1d01        ..      ADDS     r1,r0,#4
        0x00000bd4:    6029        )`      STR      r1,[r5,#0]
        0x00000bd6:    6801        .h      LDR      r1,[r0,#0]
        0x00000bd8:    2008        .       MOVS     r0,#8
        0x00000bda:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x00000bde:    4603        .F      MOV      r3,r0
        0x00000be0:    2210        ."      MOVS     r2,#0x10
        0x00000be2:    e7e2        ..      B        0xbaa ; SEGGER_RTT_vprintf + 292
        0x00000be4:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000be6:    2800        .(      CMP      r0,#0
        0x00000be8:    f77faf67    ..g.    BLE      0xaba ; SEGGER_RTT_vprintf + 52
        0x00000bec:    9804        ..      LDR      r0,[sp,#0x10]
        0x00000bee:    b120         .      CBZ      r0,0xbfa ; SEGGER_RTT_vprintf + 372
        0x00000bf0:    4602        .F      MOV      r2,r0
        0x00000bf2:    a907        ..      ADD      r1,sp,#0x1c
        0x00000bf4:    4640        @F      MOV      r0,r8
        0x00000bf6:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0x9dc
        0x00000bfa:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x00000bfe:    4408        .D      ADD      r0,r0,r1
        0x00000c00:    9005        ..      STR      r0,[sp,#0x14]
        0x00000c02:    e75a        Z.      B        0xaba ; SEGGER_RTT_vprintf + 52
    i.SystemInit
    SystemInit
        0x00000c04:    b510        ..      PUSH     {r4,lr}
        0x00000c06:    4812        .H      LDR      r0,[pc,#72] ; [0xc50] = 0x4000b000
        0x00000c08:    6801        .h      LDR      r1,[r0,#0]
        0x00000c0a:    0149        I.      LSLS     r1,r1,#5
        0x00000c0c:    d5fc        ..      BPL      0xc08 ; SystemInit + 4
        0x00000c0e:    f64e2160    N.`!    MOV      r1,#0xea60
        0x00000c12:    2000        .       MOVS     r0,#0
        0x00000c14:    bf00        ..      NOP      
        0x00000c16:    bf00        ..      NOP      
        0x00000c18:    bf00        ..      NOP      
        0x00000c1a:    bf00        ..      NOP      
        0x00000c1c:    bf00        ..      NOP      
        0x00000c1e:    bf00        ..      NOP      
        0x00000c20:    1c40        @.      ADDS     r0,r0,#1
        0x00000c22:    4288        .B      CMP      r0,r1
        0x00000c24:    d3f6        ..      BCC      0xc14 ; SystemInit + 16
        0x00000c26:    490c        .I      LDR      r1,[pc,#48] ; [0xc58] = 0x20000000
        0x00000c28:    480a        .H      LDR      r0,[pc,#40] ; [0xc54] = 0x5f5e100
        0x00000c2a:    6008        .`      STR      r0,[r1,#0]
        0x00000c2c:    2008        .       MOVS     r0,#8
        0x00000c2e:    f7fffdc5    ....    BL       HAL_SYSCON_HCLK_Src_Sel ; 0x7bc
        0x00000c32:    2002        .       MOVS     r0,#2
        0x00000c34:    f7fffdce    ....    BL       HAL_SYSCON_Set_HClk_Div ; 0x7d4
        0x00000c38:    2004        .       MOVS     r0,#4
        0x00000c3a:    f7fffe01    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0x840
        0x00000c3e:    2002        .       MOVS     r0,#2
        0x00000c40:    f7fffe36    ..6.    BL       HAL_SYSCON_Set_PClk1_Div ; 0x8b0
        0x00000c44:    2164        d!      MOVS     r1,#0x64
        0x00000c46:    e8bd4010    ...@    POP      {r4,lr}
        0x00000c4a:    2001        .       MOVS     r0,#1
        0x00000c4c:    f7ffbe66    ..f.    B.W      HAL_SYSCON_Set_RTC_Div ; 0x91c
    $d
        0x00000c50:    4000b000    ...@    DCD    1073786880
        0x00000c54:    05f5e100    ....    DCD    100000000
        0x00000c58:    20000000    ...     DCD    536870912
    $t
    i._DoInit
    _DoInit
        0x00000c5c:    b510        ..      PUSH     {r4,lr}
        0x00000c5e:    4c12        .L      LDR      r4,[pc,#72] ; [0xca8] = 0x20000008
        0x00000c60:    2003        .       MOVS     r0,#3
        0x00000c62:    2100        .!      MOVS     r1,#0
        0x00000c64:    6120         a      STR      r0,[r4,#0x10]
        0x00000c66:    6160        `a      STR      r0,[r4,#0x14]
        0x00000c68:    a010        ..      ADR      r0,{pc}+0x44 ; 0xcac
        0x00000c6a:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000c6c:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x00000c70:    61e0        .a      STR      r0,[r4,#0x1c]
        0x00000c72:    f44f6080    O..`    MOV      r0,#0x400
        0x00000c76:    62a1        .b      STR      r1,[r4,#0x28]
        0x00000c78:    6220         b      STR      r0,[r4,#0x20]
        0x00000c7a:    6261        ab      STR      r1,[r4,#0x24]
        0x00000c7c:    a00b        ..      ADR      r0,{pc}+0x30 ; 0xcac
        0x00000c7e:    62e1        .b      STR      r1,[r4,#0x2c]
        0x00000c80:    6620         f      STR      r0,[r4,#0x60]
        0x00000c82:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x00000c86:    6660        `f      STR      r0,[r4,#0x64]
        0x00000c88:    2010        .       MOVS     r0,#0x10
        0x00000c8a:    6721        !g      STR      r1,[r4,#0x70]
        0x00000c8c:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x00000c90:    6761        ag      STR      r1,[r4,#0x74]
        0x00000c92:    a109        ..      ADR      r1,{pc}+0x26 ; 0xcb8
        0x00000c94:    1de0        ..      ADDS     r0,r4,#7
        0x00000c96:    f7fffb13    ....    BL       strcpy ; 0x2c0
        0x00000c9a:    a108        ..      ADR      r1,{pc}+0x22 ; 0xcbc
        0x00000c9c:    4620         F      MOV      r0,r4
        0x00000c9e:    f7fffb0f    ....    BL       strcpy ; 0x2c0
        0x00000ca2:    2020                MOVS     r0,#0x20
        0x00000ca4:    71a0        .q      STRB     r0,[r4,#6]
        0x00000ca6:    bd10        ..      POP      {r4,pc}
    $d
        0x00000ca8:    20000008    ...     DCD    536870920
        0x00000cac:    6d726554    Term    DCD    1836213588
        0x00000cb0:    6c616e69    inal    DCD    1818324585
        0x00000cb4:    00000000    ....    DCD    0
        0x00000cb8:    00545452    RTT.    DCD    5526610
        0x00000cbc:    47474553    SEGG    DCD    1195853139
        0x00000cc0:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00000cc4:    6902        .i      LDR      r2,[r0,#0x10]
        0x00000cc6:    68c1        .h      LDR      r1,[r0,#0xc]
        0x00000cc8:    428a        .B      CMP      r2,r1
        0x00000cca:    d803        ..      BHI      0xcd4 ; _GetAvailWriteSpace + 16
        0x00000ccc:    6880        .h      LDR      r0,[r0,#8]
        0x00000cce:    1a40        @.      SUBS     r0,r0,r1
        0x00000cd0:    4410        .D      ADD      r0,r0,r2
        0x00000cd2:    e000        ..      B        0xcd6 ; _GetAvailWriteSpace + 18
        0x00000cd4:    1a50        P.      SUBS     r0,r2,r1
        0x00000cd6:    1e40        @.      SUBS     r0,r0,#1
        0x00000cd8:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x00000cda:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00000cde:    000e        ..      MOVS     r6,r1
        0x00000ce0:    4680        .F      MOV      r8,r0
        0x00000ce2:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x00000ce6:    f1c60000    ....    RSB      r0,r6,#0
        0x00000cea:    4699        .F      MOV      r9,r3
        0x00000cec:    4692        .F      MOV      r10,r2
        0x00000cee:    4683        .F      MOV      r11,r0
        0x00000cf0:    d400        ..      BMI      0xcf4 ; _PrintInt + 26
        0x00000cf2:    4608        .F      MOV      r0,r1
        0x00000cf4:    2501        .%      MOVS     r5,#1
        0x00000cf6:    e002        ..      B        0xcfe ; _PrintInt + 36
        0x00000cf8:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x00000cfc:    1c6d        m.      ADDS     r5,r5,#1
        0x00000cfe:    4550        PE      CMP      r0,r10
        0x00000d00:    dafa        ..      BGE      0xcf8 ; _PrintInt + 30
        0x00000d02:    45a9        .E      CMP      r9,r5
        0x00000d04:    d900        ..      BLS      0xd08 ; _PrintInt + 46
        0x00000d06:    464d        MF      MOV      r5,r9
        0x00000d08:    b124        $.      CBZ      r4,0xd14 ; _PrintInt + 58
        0x00000d0a:    2e00        ..      CMP      r6,#0
        0x00000d0c:    db01        ..      BLT      0xd12 ; _PrintInt + 56
        0x00000d0e:    0778        x.      LSLS     r0,r7,#29
        0x00000d10:    d500        ..      BPL      0xd14 ; _PrintInt + 58
        0x00000d12:    1e64        d.      SUBS     r4,r4,#1
        0x00000d14:    07b8        ..      LSLS     r0,r7,#30
        0x00000d16:    d502        ..      BPL      0xd1e ; _PrintInt + 68
        0x00000d18:    f1b90f00    ....    CMP      r9,#0
        0x00000d1c:    d00f        ..      BEQ      0xd3e ; _PrintInt + 100
        0x00000d1e:    07f8        ..      LSLS     r0,r7,#31
        0x00000d20:    d10d        ..      BNE      0xd3e ; _PrintInt + 100
        0x00000d22:    b164        d.      CBZ      r4,0xd3e ; _PrintInt + 100
        0x00000d24:    42a5        .B      CMP      r5,r4
        0x00000d26:    d20a        ..      BCS      0xd3e ; _PrintInt + 100
        0x00000d28:    2120         !      MOVS     r1,#0x20
        0x00000d2a:    4640        @F      MOV      r0,r8
        0x00000d2c:    1e64        d.      SUBS     r4,r4,#1
        0x00000d2e:    f000f89d    ....    BL       _StoreChar ; 0xe6c
        0x00000d32:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000d36:    2800        .(      CMP      r0,#0
        0x00000d38:    daf3        ..      BGE      0xd22 ; _PrintInt + 72
        0x00000d3a:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x00000d3e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000d42:    2800        .(      CMP      r0,#0
        0x00000d44:    dbf9        ..      BLT      0xd3a ; _PrintInt + 96
        0x00000d46:    2e00        ..      CMP      r6,#0
        0x00000d48:    da02        ..      BGE      0xd50 ; _PrintInt + 118
        0x00000d4a:    465e        ^F      MOV      r6,r11
        0x00000d4c:    212d        -!      MOVS     r1,#0x2d
        0x00000d4e:    e002        ..      B        0xd56 ; _PrintInt + 124
        0x00000d50:    0778        x.      LSLS     r0,r7,#29
        0x00000d52:    d507        ..      BPL      0xd64 ; _PrintInt + 138
        0x00000d54:    212b        +!      MOVS     r1,#0x2b
        0x00000d56:    4640        @F      MOV      r0,r8
        0x00000d58:    f000f888    ....    BL       _StoreChar ; 0xe6c
        0x00000d5c:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000d60:    2800        .(      CMP      r0,#0
        0x00000d62:    dbea        ..      BLT      0xd3a ; _PrintInt + 96
        0x00000d64:    f0070003    ....    AND      r0,r7,#3
        0x00000d68:    2802        .(      CMP      r0,#2
        0x00000d6a:    d10f        ..      BNE      0xd8c ; _PrintInt + 178
        0x00000d6c:    f1b90f00    ....    CMP      r9,#0
        0x00000d70:    d10c        ..      BNE      0xd8c ; _PrintInt + 178
        0x00000d72:    b15c        \.      CBZ      r4,0xd8c ; _PrintInt + 178
        0x00000d74:    42a5        .B      CMP      r5,r4
        0x00000d76:    d209        ..      BCS      0xd8c ; _PrintInt + 178
        0x00000d78:    2130        0!      MOVS     r1,#0x30
        0x00000d7a:    4640        @F      MOV      r0,r8
        0x00000d7c:    1e64        d.      SUBS     r4,r4,#1
        0x00000d7e:    f000f875    ..u.    BL       _StoreChar ; 0xe6c
        0x00000d82:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00000d86:    2800        .(      CMP      r0,#0
        0x00000d88:    daf3        ..      BGE      0xd72 ; _PrintInt + 152
        0x00000d8a:    e7d6        ..      B        0xd3a ; _PrintInt + 96
        0x00000d8c:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x00000d90:    464b        KF      MOV      r3,r9
        0x00000d92:    4652        RF      MOV      r2,r10
        0x00000d94:    4631        1F      MOV      r1,r6
        0x00000d96:    4640        @F      MOV      r0,r8
        0x00000d98:    f000f802    ....    BL       _PrintUnsigned ; 0xda0
        0x00000d9c:    e7cd        ..      B        0xd3a ; _PrintInt + 96
        0x00000d9e:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x00000da0:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x00000da4:    4682        .F      MOV      r10,r0
        0x00000da6:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x00000daa:    2501        .%      MOVS     r5,#1
        0x00000dac:    4699        .F      MOV      r9,r3
        0x00000dae:    4617        .F      MOV      r7,r2
        0x00000db0:    4688        .F      MOV      r8,r1
        0x00000db2:    4608        .F      MOV      r0,r1
        0x00000db4:    462e        .F      MOV      r6,r5
        0x00000db6:    e002        ..      B        0xdbe ; _PrintUnsigned + 30
        0x00000db8:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x00000dbc:    1c76        v.      ADDS     r6,r6,#1
        0x00000dbe:    42b8        .B      CMP      r0,r7
        0x00000dc0:    d2fa        ..      BCS      0xdb8 ; _PrintUnsigned + 24
        0x00000dc2:    45b1        .E      CMP      r9,r6
        0x00000dc4:    d900        ..      BLS      0xdc8 ; _PrintUnsigned + 40
        0x00000dc6:    464e        NF      MOV      r6,r9
        0x00000dc8:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00000dcc:    d117        ..      BNE      0xdfe ; _PrintUnsigned + 94
        0x00000dce:    b1b4        ..      CBZ      r4,0xdfe ; _PrintUnsigned + 94
        0x00000dd0:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x00000dd4:    d502        ..      BPL      0xddc ; _PrintUnsigned + 60
        0x00000dd6:    f1b90f00    ....    CMP      r9,#0
        0x00000dda:    d002        ..      BEQ      0xde2 ; _PrintUnsigned + 66
        0x00000ddc:    2020                MOVS     r0,#0x20
        0x00000dde:    9000        ..      STR      r0,[sp,#0]
        0x00000de0:    e00b        ..      B        0xdfa ; _PrintUnsigned + 90
        0x00000de2:    2030        0       MOVS     r0,#0x30
        0x00000de4:    e7fb        ..      B        0xdde ; _PrintUnsigned + 62
        0x00000de6:    4650        PF      MOV      r0,r10
        0x00000de8:    1e64        d.      SUBS     r4,r4,#1
        0x00000dea:    9900        ..      LDR      r1,[sp,#0]
        0x00000dec:    f000f83e    ..>.    BL       _StoreChar ; 0xe6c
        0x00000df0:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00000df4:    2800        .(      CMP      r0,#0
        0x00000df6:    db35        5.      BLT      0xe64 ; _PrintUnsigned + 196
        0x00000df8:    b10c        ..      CBZ      r4,0xdfe ; _PrintUnsigned + 94
        0x00000dfa:    42a6        .B      CMP      r6,r4
        0x00000dfc:    d3f3        ..      BCC      0xde6 ; _PrintUnsigned + 70
        0x00000dfe:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00000e02:    2800        .(      CMP      r0,#0
        0x00000e04:    db2e        ..      BLT      0xe64 ; _PrintUnsigned + 196
        0x00000e06:    f1b90f01    ....    CMP      r9,#1
        0x00000e0a:    d902        ..      BLS      0xe12 ; _PrintUnsigned + 114
        0x00000e0c:    f1a90901    ....    SUB      r9,r9,#1
        0x00000e10:    e003        ..      B        0xe1a ; _PrintUnsigned + 122
        0x00000e12:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00000e16:    42b8        .B      CMP      r0,r7
        0x00000e18:    d301        ..      BCC      0xe1e ; _PrintUnsigned + 126
        0x00000e1a:    437d        }C      MULS     r5,r7,r5
        0x00000e1c:    e7f3        ..      B        0xe06 ; _PrintUnsigned + 102
        0x00000e1e:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0xe68] = 0x1084
        0x00000e22:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00000e26:    fb008815    ....    MLS      r8,r0,r5,r8
        0x00000e2a:    f8191000    ....    LDRB     r1,[r9,r0]
        0x00000e2e:    4650        PF      MOV      r0,r10
        0x00000e30:    f000f81c    ....    BL       _StoreChar ; 0xe6c
        0x00000e34:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00000e38:    2800        .(      CMP      r0,#0
        0x00000e3a:    db03        ..      BLT      0xe44 ; _PrintUnsigned + 164
        0x00000e3c:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x00000e40:    2d00        .-      CMP      r5,#0
        0x00000e42:    d1ee        ..      BNE      0xe22 ; _PrintUnsigned + 130
        0x00000e44:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00000e48:    d00c        ..      BEQ      0xe64 ; _PrintUnsigned + 196
        0x00000e4a:    2c00        .,      CMP      r4,#0
        0x00000e4c:    d00a        ..      BEQ      0xe64 ; _PrintUnsigned + 196
        0x00000e4e:    42a6        .B      CMP      r6,r4
        0x00000e50:    d208        ..      BCS      0xe64 ; _PrintUnsigned + 196
        0x00000e52:    2120         !      MOVS     r1,#0x20
        0x00000e54:    4650        PF      MOV      r0,r10
        0x00000e56:    1e64        d.      SUBS     r4,r4,#1
        0x00000e58:    f000f808    ....    BL       _StoreChar ; 0xe6c
        0x00000e5c:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00000e60:    2800        .(      CMP      r0,#0
        0x00000e62:    daf2        ..      BGE      0xe4a ; _PrintUnsigned + 170
        0x00000e64:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x00000e68:    00001084    ....    DCD    4228
    $t
    i._StoreChar
    _StoreChar
        0x00000e6c:    b510        ..      PUSH     {r4,lr}
        0x00000e6e:    4604        .F      MOV      r4,r0
        0x00000e70:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x00000e74:    1c42        B.      ADDS     r2,r0,#1
        0x00000e76:    4293        .B      CMP      r3,r2
        0x00000e78:    d305        ..      BCC      0xe86 ; _StoreChar + 26
        0x00000e7a:    6823        #h      LDR      r3,[r4,#0]
        0x00000e7c:    5419        .T      STRB     r1,[r3,r0]
        0x00000e7e:    60a2        .`      STR      r2,[r4,#8]
        0x00000e80:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00000e82:    1c40        @.      ADDS     r0,r0,#1
        0x00000e84:    60e0        .`      STR      r0,[r4,#0xc]
        0x00000e86:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x00000e8a:    4282        .B      CMP      r2,r0
        0x00000e8c:    d109        ..      BNE      0xea2 ; _StoreChar + 54
        0x00000e8e:    6821        !h      LDR      r1,[r4,#0]
        0x00000e90:    6920         i      LDR      r0,[r4,#0x10]
        0x00000e92:    f7fffda3    ....    BL       SEGGER_RTT_Write ; 0x9dc
        0x00000e96:    68a1        .h      LDR      r1,[r4,#8]
        0x00000e98:    4288        .B      CMP      r0,r1
        0x00000e9a:    d003        ..      BEQ      0xea4 ; _StoreChar + 56
        0x00000e9c:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000ea0:    60e0        .`      STR      r0,[r4,#0xc]
        0x00000ea2:    bd10        ..      POP      {r4,pc}
        0x00000ea4:    2000        .       MOVS     r0,#0
        0x00000ea6:    60a0        .`      STR      r0,[r4,#8]
        0x00000ea8:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00000eaa:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000eae:    68c4        .h      LDR      r4,[r0,#0xc]
        0x00000eb0:    4617        .F      MOV      r7,r2
        0x00000eb2:    4689        .F      MOV      r9,r1
        0x00000eb4:    4605        .F      MOV      r5,r0
        0x00000eb6:    f04f0800    O...    MOV      r8,#0
        0x00000eba:    6928        (i      LDR      r0,[r5,#0x10]
        0x00000ebc:    42a0        .B      CMP      r0,r4
        0x00000ebe:    d901        ..      BLS      0xec4 ; _WriteBlocking + 26
        0x00000ec0:    1b06        ..      SUBS     r6,r0,r4
        0x00000ec2:    e002        ..      B        0xeca ; _WriteBlocking + 32
        0x00000ec4:    68a9        .h      LDR      r1,[r5,#8]
        0x00000ec6:    1a20         .      SUBS     r0,r4,r0
        0x00000ec8:    1a0e        ..      SUBS     r6,r1,r0
        0x00000eca:    68a8        .h      LDR      r0,[r5,#8]
        0x00000ecc:    1e76        v.      SUBS     r6,r6,#1
        0x00000ece:    1b00        ..      SUBS     r0,r0,r4
        0x00000ed0:    42b0        .B      CMP      r0,r6
        0x00000ed2:    d800        ..      BHI      0xed6 ; _WriteBlocking + 44
        0x00000ed4:    4606        .F      MOV      r6,r0
        0x00000ed6:    42be        .B      CMP      r6,r7
        0x00000ed8:    d300        ..      BCC      0xedc ; _WriteBlocking + 50
        0x00000eda:    463e        >F      MOV      r6,r7
        0x00000edc:    6868        hh      LDR      r0,[r5,#4]
        0x00000ede:    4632        2F      MOV      r2,r6
        0x00000ee0:    4420         D      ADD      r0,r0,r4
        0x00000ee2:    4649        IF      MOV      r1,r9
        0x00000ee4:    f7fffa10    ....    BL       __aeabi_memcpy ; 0x308
        0x00000ee8:    68a8        .h      LDR      r0,[r5,#8]
        0x00000eea:    1bbf        ..      SUBS     r7,r7,r6
        0x00000eec:    4434        4D      ADD      r4,r4,r6
        0x00000eee:    44b0        .D      ADD      r8,r8,r6
        0x00000ef0:    44b1        .D      ADD      r9,r9,r6
        0x00000ef2:    42a0        .B      CMP      r0,r4
        0x00000ef4:    d100        ..      BNE      0xef8 ; _WriteBlocking + 78
        0x00000ef6:    2400        .$      MOVS     r4,#0
        0x00000ef8:    60ec        .`      STR      r4,[r5,#0xc]
        0x00000efa:    2f00        ./      CMP      r7,#0
        0x00000efc:    d1dd        ..      BNE      0xeba ; _WriteBlocking + 16
        0x00000efe:    4640        @F      MOV      r0,r8
        0x00000f00:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00000f04:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000f08:    4604        .F      MOV      r4,r0
        0x00000f0a:    4688        .F      MOV      r8,r1
        0x00000f0c:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x00000f10:    1bc5        ..      SUBS     r5,r0,r7
        0x00000f12:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000f14:    6860        `h      LDR      r0,[r4,#4]
        0x00000f16:    4616        .F      MOV      r6,r2
        0x00000f18:    4408        .D      ADD      r0,r0,r1
        0x00000f1a:    42b5        .B      CMP      r5,r6
        0x00000f1c:    d906        ..      BLS      0xf2c ; _WriteNoCheck + 40
        0x00000f1e:    4641        AF      MOV      r1,r8
        0x00000f20:    f7fff9f2    ....    BL       __aeabi_memcpy ; 0x308
        0x00000f24:    19b8        ..      ADDS     r0,r7,r6
        0x00000f26:    60e0        .`      STR      r0,[r4,#0xc]
        0x00000f28:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00000f2c:    462a        *F      MOV      r2,r5
        0x00000f2e:    4641        AF      MOV      r1,r8
        0x00000f30:    f7fff9ea    ....    BL       __aeabi_memcpy ; 0x308
        0x00000f34:    1b76        v.      SUBS     r6,r6,r5
        0x00000f36:    eb080105    ....    ADD      r1,r8,r5
        0x00000f3a:    4632        2F      MOV      r2,r6
        0x00000f3c:    6860        `h      LDR      r0,[r4,#4]
        0x00000f3e:    f7fff9e3    ....    BL       __aeabi_memcpy ; 0x308
        0x00000f42:    60e6        .`      STR      r6,[r4,#0xc]
        0x00000f44:    e7f0        ..      B        0xf28 ; _WriteNoCheck + 36
        0x00000f46:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00000f48:    b672        r.      CPSID    i
        0x00000f4a:    4603        .F      MOV      r3,r0
        0x00000f4c:    a001        ..      ADR      r0,{pc}+8 ; 0xf54
        0x00000f4e:    f7fff911    ....    BL       __2printf ; 0x174
        0x00000f52:    e7fe        ..      B        0xf52 ; __aeabi_assert + 10
    $d
        0x00000f54:    65737341    Asse    DCD    1702064961
        0x00000f58:    6f697472    rtio    DCD    1869182066
        0x00000f5c:    6146206e    n Fa    DCD    1631985774
        0x00000f60:    64656c69    iled    DCD    1684368489
        0x00000f64:    6966203a    : fi    DCD    1768300602
        0x00000f68:    2520656c    le %    DCD    622880108
        0x00000f6c:    6c202c73    s, l    DCD    1814047859
        0x00000f70:    20656e69    ine     DCD    543518313
        0x00000f74:    202c6425    %d,     DCD    539780133
        0x00000f78:    000a7325    %s..    DCD    684837
    $t
    i.fputc
    fputc
        0x00000f7c:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000f7e:    2201        ."      MOVS     r2,#1
        0x00000f80:    4669        iF      MOV      r1,sp
        0x00000f82:    2000        .       MOVS     r0,#0
        0x00000f84:    f7fffd2a    ..*.    BL       SEGGER_RTT_Write ; 0x9dc
        0x00000f88:    9800        ..      LDR      r0,[sp,#0]
        0x00000f8a:    bd1c        ..      POP      {r2-r4,pc}
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00000f8c:    4903        .I      LDR      r1,[pc,#12] ; [0xf9c] = 0x40007000
        0x00000f8e:    6809        .h      LDR      r1,[r1,#0]
        0x00000f90:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00000f94:    4a01        .J      LDR      r2,[pc,#4] ; [0xf9c] = 0x40007000
        0x00000f96:    6011        .`      STR      r1,[r2,#0]
        0x00000f98:    4770        pG      BX       lr
    $d
        0x00000f9a:    0000        ..      DCW    0
        0x00000f9c:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00000fa0:    4903        .I      LDR      r1,[pc,#12] ; [0xfb0] = 0x40007000
        0x00000fa2:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000fa4:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00000fa8:    4a01        .J      LDR      r2,[pc,#4] ; [0xfb0] = 0x40007000
        0x00000faa:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000fac:    4770        pG      BX       lr
    $d
        0x00000fae:    0000        ..      DCW    0
        0x00000fb0:    40007000    .p.@    DCD    1073770496
    $t
    i.main
    main
        0x00000fb4:    a103        ..      ADR      r1,{pc}+0x10 ; 0xfc4
        0x00000fb6:    2000        .       MOVS     r0,#0
        0x00000fb8:    f7fffd5a    ..Z.    BL       SEGGER_RTT_printf ; 0xa70
        0x00000fbc:    f000f81e    ....    BL       test_gpio ; 0xffc
        0x00000fc0:    e7fe        ..      B        0xfc0 ; main + 12
    $d
        0x00000fc2:    0000        ..      DCW    0
        0x00000fc4:    6c6c6548    Hell    DCD    1819043144
        0x00000fc8:    6f57206f    o Wo    DCD    1867980911
        0x00000fcc:    20646c72    rld     DCD    543452274
        0x00000fd0:    38313032    2018    DCD    942747698
        0x00000fd4:    34303530    0504    DCD    875574576
        0x00000fd8:    00000a7e    ~...    DCD    2686
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00000fdc:    4901        .I      LDR      r1,[pc,#4] ; [0xfe4] = 0x40020000
        0x00000fde:    6008        .`      STR      r0,[r1,#0]
        0x00000fe0:    4770        pG      BX       lr
    $d
        0x00000fe2:    0000        ..      DCW    0
        0x00000fe4:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00000fe8:    4903        .I      LDR      r1,[pc,#12] ; [0xff8] = 0x40020000
        0x00000fea:    6849        Ih      LDR      r1,[r1,#4]
        0x00000fec:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00000ff0:    4a01        .J      LDR      r2,[pc,#4] ; [0xff8] = 0x40020000
        0x00000ff2:    6051        Q`      STR      r1,[r2,#4]
        0x00000ff4:    4770        pG      BX       lr
    $d
        0x00000ff6:    0000        ..      DCW    0
        0x00000ff8:    40020000    ...@    DCD    1073872896
    $t
    i.test_gpio
    test_gpio
        0x00000ffc:    2001        .       MOVS     r0,#1
        0x00000ffe:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001002:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00001006:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x0000100a:    460c        .F      MOV      r4,r1
        0x0000100c:    2010        .       MOVS     r0,#0x10
        0x0000100e:    f7fffaca    ....    BL       HAL_GPIO_Init ; 0x5a6
        0x00001012:    4621        !F      MOV      r1,r4
        0x00001014:    2011        .       MOVS     r0,#0x11
        0x00001016:    f7fffac6    ....    BL       HAL_GPIO_Init ; 0x5a6
        0x0000101a:    f44f777a    O.zw    MOV      r7,#0x3e8
        0x0000101e:    f2413688    A..6    MOV      r6,#0x1388
        0x00001022:    2101        .!      MOVS     r1,#1
        0x00001024:    2010        .       MOVS     r0,#0x10
        0x00001026:    f7fffb7f    ....    BL       HAL_GPIO_WritePin ; 0x728
        0x0000102a:    2101        .!      MOVS     r1,#1
        0x0000102c:    2011        .       MOVS     r0,#0x11
        0x0000102e:    f7fffb7b    ..{.    BL       HAL_GPIO_WritePin ; 0x728
        0x00001032:    4638        8F      MOV      r0,r7
        0x00001034:    4635        5F      MOV      r5,r6
        0x00001036:    1e6d        m.      SUBS     r5,r5,#1
        0x00001038:    d1fd        ..      BNE      0x1036 ; test_gpio + 58
        0x0000103a:    1e40        @.      SUBS     r0,r0,#1
        0x0000103c:    d1fa        ..      BNE      0x1034 ; test_gpio + 56
        0x0000103e:    2100        .!      MOVS     r1,#0
        0x00001040:    2010        .       MOVS     r0,#0x10
        0x00001042:    f7fffb71    ..q.    BL       HAL_GPIO_WritePin ; 0x728
        0x00001046:    2100        .!      MOVS     r1,#0
        0x00001048:    2011        .       MOVS     r0,#0x11
        0x0000104a:    f7fffb6d    ..m.    BL       HAL_GPIO_WritePin ; 0x728
        0x0000104e:    4638        8F      MOV      r0,r7
        0x00001050:    4634        4F      MOV      r4,r6
        0x00001052:    1e64        d.      SUBS     r4,r4,#1
        0x00001054:    d1fd        ..      BNE      0x1052 ; test_gpio + 86
        0x00001056:    1e40        @.      SUBS     r0,r0,#1
        0x00001058:    d1fa        ..      BNE      0x1050 ; test_gpio + 84
        0x0000105a:    a002        ..      ADR      r0,{pc}+0xa ; 0x1064
        0x0000105c:    f7fff88a    ....    BL       __2printf ; 0x174
        0x00001060:    e7df        ..      B        0x1022 ; test_gpio + 38
    $d
        0x00001062:    0000        ..      DCW    0
        0x00001064:    32666c45    Elf2    DCD    845573189
        0x00001068:    55434d20     MCU    DCD    1430474016
        0x0000106c:    69755120     Qui    DCD    1769296160
        0x00001070:    74736b63    ckst    DCD    1953721187
        0x00001074:    20747261    art     DCD    544502369
        0x00001078:    6a6f7250    Proj    DCD    1785688656
        0x0000107c:    7e746365    ect~    DCD    2121556837
        0x00001080:    0000000a    ....    DCD    10
    $d.realdata
    .constdata
    _aV2C
        0x00001084:    33323130    0123    DCD    858927408
        0x00001088:    37363534    4567    DCD    926299444
        0x0000108c:    42413938    89AB    DCD    1111570744
        0x00001090:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001094:    000010b4    ....    DCD    4276
        0x00001098:    20000000    ...     DCD    536870912
        0x0000109c:    00000008    ....    DCD    8
        0x000010a0:    000000c4    ....    DCD    196
        0x000010a4:    000010bc    ....    DCD    4284
        0x000010a8:    20000008    ...     DCD    536870920
        0x000010ac:    00000a18    ....    DCD    2584
        0x000010b0:    000000e0    ....    DCD    224
    Region$$Table$$Limit

====================================

** Section #3

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 4328 (0x10e8)
    Size        : 8 bytes (0x8)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000008
    File Offset : 4336 (0x10f0)
    Size        : 2584 bytes (0xa18)
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
    File Offset : 4336 (0x10f0)
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
    File Offset : 5812 (0x16b4)
    Size        : 1972 bytes (0x7b4)
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
    File Offset : 7784 (0x1e68)
    Size        : 51540 bytes (0xc954)
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
    File Offset : 59324 (0xe7bc)
    Size        : 7724 bytes (0x1e2c)
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
    File Offset : 67048 (0x105e8)
    Size        : 3308 bytes (0xcec)
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
    File Offset : 70356 (0x112d4)
    Size        : 5700 bytes (0x1644)
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
    File Offset : 76056 (0x12918)
    Size        : 1012 bytes (0x3f4)
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
    File Offset : 77068 (0x12d0c)
    Size        : 6784 bytes (0x1a80)
    Link        : Section 13 (.strtab)
    Info        : Last local symbol no = 281
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #13

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 83852 (0x1478c)
    Size        : 6172 bytes (0x181c)
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
    File Offset : 90024 (0x15fa8)
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
    File Offset : 90056 (0x15fc8)
    Size        : 9580 bytes (0x256c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0

    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    ArmLink --strict --callgraph --map --symbols --xref --diag_suppress=9931 --cpu=Cortex-M3 --fpu=SoftVFP --list=.\Listings\demo.map --output=.\Objects\demo.axf --scatter=.\elf2_example.sct --keep=int_register.o(int_callback_area) --info=summarysizes,sizes,totals,unused,veneers

    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\c_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\fz_ws.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\h_w.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\m_ws.l
    C:\Keil_v5\ARM\ARMCC\Bin\..\lib\armlib\vfpsupport.l
    Input Comments:
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p54d4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p54d4-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Ke
    
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_gpio.o --vfemode=force

    Input Comments:
    
    p2d74-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2d74-2
    
    
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RESET_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\gpio.o --vfemode=force

    Input Comments:
    
    p66cc-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p66cc-2
    
    
    
    gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\gpio.o --depend=.\objects\gpio.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\gpio.crf ..\sdk\src\soc\driver\gpio.c
    
    
    
    
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\syscon.o --vfemode=force

    Input Comments:
    
    p622c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p622c-2
    
    
    
    syscon.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\syscon.o --depend=.\objects\syscon.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\syscon.crf ..\sdk\src\soc\driver\syscon.c
    
    
    
    
    
    
    
    

====================================

** Section #16

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 99636 (0x18534)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x20000008  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x20000008  0x10       _SEGGER_RTT.acID                         array[16] of char
0x20000018  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x2000001c  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x20000020  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x20000068  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x200004b0  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x200000b0  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x20000004  0x4        __stdout                                 FILE
0x20000004  0x4        __stdout.handle                          int

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

