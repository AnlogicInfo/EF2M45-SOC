
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

    Image Entry point: 0x00000119
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
    Section header entries: 18

    Program header offset: 198004 (0x00030574)
    Section header offset: 198036 (0x00030594)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 8680 bytes (0x21e8)
    Size in memory: 11264 bytes (0x2c00)
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

    Name        : INT_CALLBACK_TBL
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x00000088
    File Offset : 188 (0xbc)
    Size        : 144 bytes (0x90)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #3

    Name        : RO_IRAM2
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_EXECINSTR (0x00000006)
    Addr        : 0x00000118
    File Offset : 332 (0x14c)
    Size        : 8392 bytes (0x20c8)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    !!!main
    __main
        0x00000118:    f000f802    ....    BL       __scatterload ; 0x120
        0x0000011c:    f000f842    ..B.    BL       __rt_entry ; 0x1a4
    !!!scatter
    __scatterload
    __scatterload_rt2
    __scatterload_rt2_thumb_only
        0x00000120:    a00a        ..      ADR      r0,{pc}+0x2c ; 0x14c
        0x00000122:    e8900c00    ....    LDM      r0,{r10,r11}
        0x00000126:    4482        .D      ADD      r10,r10,r0
        0x00000128:    4483        .D      ADD      r11,r11,r0
        0x0000012a:    f1aa0701    ....    SUB      r7,r10,#1
    __scatterload_null
        0x0000012e:    45da        .E      CMP      r10,r11
        0x00000130:    d101        ..      BNE      0x136 ; __scatterload_null + 8
        0x00000132:    f000f837    ..7.    BL       __rt_entry ; 0x1a4
        0x00000136:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x12f
        0x0000013a:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x0000013e:    f0130f01    ....    TST      r3,#1
        0x00000142:    bf18        ..      IT       NE
        0x00000144:    1afb        ..      SUBNE    r3,r7,r3
        0x00000146:    f0430301    C...    ORR      r3,r3,#1
        0x0000014a:    4718        .G      BX       r3
    $d
        0x0000014c:    00002074    t ..    DCD    8308
        0x00000150:    00002094    . ..    DCD    8340
    $t
    !!handler_copy
    __scatterload_copy
        0x00000154:    3a10        .:      SUBS     r2,r2,#0x10
        0x00000156:    bf24        $.      ITT      CS
        0x00000158:    c878        x.      LDMCS    r0!,{r3-r6}
        0x0000015a:    c178        x.      STMCS    r1!,{r3-r6}
        0x0000015c:    d8fa        ..      BHI      __scatterload_copy ; 0x154
        0x0000015e:    0752        R.      LSLS     r2,r2,#29
        0x00000160:    bf24        $.      ITT      CS
        0x00000162:    c830        0.      LDMCS    r0!,{r4,r5}
        0x00000164:    c130        0.      STMCS    r1!,{r4,r5}
        0x00000166:    bf44        D.      ITT      MI
        0x00000168:    6804        .h      LDRMI    r4,[r0,#0]
        0x0000016a:    600c        .`      STRMI    r4,[r1,#0]
        0x0000016c:    4770        pG      BX       lr
        0x0000016e:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x00000170:    2300        .#      MOVS     r3,#0
        0x00000172:    2400        .$      MOVS     r4,#0
        0x00000174:    2500        .%      MOVS     r5,#0
        0x00000176:    2600        .&      MOVS     r6,#0
        0x00000178:    3a10        .:      SUBS     r2,r2,#0x10
        0x0000017a:    bf28        (.      IT       CS
        0x0000017c:    c178        x.      STMCS    r1!,{r3-r6}
        0x0000017e:    d8fb        ..      BHI      0x178 ; __scatterload_zeroinit + 8
        0x00000180:    0752        R.      LSLS     r2,r2,#29
        0x00000182:    bf28        (.      IT       CS
        0x00000184:    c130        0.      STMCS    r1!,{r4,r5}
        0x00000186:    bf48        H.      IT       MI
        0x00000188:    600b        .`      STRMI    r3,[r1,#0]
        0x0000018a:    4770        pG      BX       lr
    .ARM.Collect$$_printf_percent$$00000009
    .ARM.Collect$$_printf_percent$$00000000
    _printf_d
    _printf_percent
        0x0000018c:    2964        d)      CMP      r1,#0x64
        0x0000018e:    f00080a3    ....    BEQ.W    _printf_int_dec ; 0x2d8
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x00000192:    2973        s)      CMP      r1,#0x73
        0x00000194:    f00081b3    ....    BEQ.W    _printf_string ; 0x4fe
    .ARM.Collect$$_printf_percent$$00000017
    _printf_percent_end
        0x00000198:    2000        .       MOVS     r0,#0
        0x0000019a:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x0000019c:    b51f        ..      PUSH     {r0-r4,lr}
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
        0x0000019e:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x000001a0:    b510        ..      PUSH     {r4,lr}
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
        0x000001a2:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x000001a4:    f000fa10    ....    BL       __user_setup_stackheap ; 0x5c8
        0x000001a8:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x000001aa:    f7fffff7    ....    BL       __rt_lib_init ; 0x19c
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x000001ae:    f001fd63    ..c.    BL       main ; 0x1c78
        0x000001b2:    f000fa2e    ....    BL       exit ; 0x612
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x000001b6:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x000001b8:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x1a0
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x000001bc:    bc03        ..      POP      {r0,r1}
        0x000001be:    f000fa33    ..3.    BL       _sys_exit ; 0x628
        0x000001c2:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x151d
        0x000001c6:    4780        .G      BLX      r0
        0x000001c8:    4809        .H      LDR      r0,[pc,#36] ; [0x1f0] = 0x119
        0x000001ca:    4700        .G      BX       r0
    NMI_Handler
        0x000001cc:    e7fe        ..      B        NMI_Handler ; 0x1cc
    HardFault_Handler
        0x000001ce:    e7fe        ..      B        HardFault_Handler ; 0x1ce
    MemManage_Handler
        0x000001d0:    e7fe        ..      B        MemManage_Handler ; 0x1d0
    BusFault_Handler
        0x000001d2:    e7fe        ..      B        BusFault_Handler ; 0x1d2
    UsageFault_Handler
        0x000001d4:    e7fe        ..      B        UsageFault_Handler ; 0x1d4
    SVC_Handler
        0x000001d6:    e7fe        ..      B        SVC_Handler ; 0x1d6
    DebugMon_Handler
        0x000001d8:    e7fe        ..      B        DebugMon_Handler ; 0x1d8
    PendSV_Handler
        0x000001da:    e7fe        ..      B        PendSV_Handler ; 0x1da
    SysTick_Handler
        0x000001dc:    e7fe        ..      B        SysTick_Handler ; 0x1dc
        0x000001de:    e7fe        ..      B        0x1de ; SysTick_Handler + 2
    __user_initial_stackheap
        0x000001e0:    4804        .H      LDR      r0,[pc,#16] ; [0x1f4] = 0x20000520
        0x000001e2:    4905        .I      LDR      r1,[pc,#20] ; [0x1f8] = 0x20000a20
        0x000001e4:    4a05        .J      LDR      r2,[pc,#20] ; [0x1fc] = 0x20000620
        0x000001e6:    4b06        .K      LDR      r3,[pc,#24] ; [0x200] = 0x20000620
        0x000001e8:    4770        pG      BX       lr
    $d
        0x000001ea:    0000        ..      DCW    0
        0x000001ec:    0000151d    ....    DCD    5405
        0x000001f0:    00000119    ....    DCD    281
        0x000001f4:    20000520     ..     DCD    536872224
        0x000001f8:    20000a20     ..     DCD    536873504
        0x000001fc:    20000620     ..     DCD    536872480
        0x00000200:    20000620     ..     DCD    536872480
    $t
    .text
    __2printf
        0x00000204:    b40f        ..      PUSH     {r0-r3}
        0x00000206:    4904        .I      LDR      r1,[pc,#16] ; [0x218] = 0x20000004
        0x00000208:    b510        ..      PUSH     {r4,lr}
        0x0000020a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000020c:    9802        ..      LDR      r0,[sp,#8]
        0x0000020e:    f000f97b    ..{.    BL       _printf_char_file ; 0x508
        0x00000212:    bc10        ..      POP      {r4}
        0x00000214:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000218:    20000004    ...     DCD    536870916
    $t
    .text
    __printf
        0x0000021c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000220:    460e        .F      MOV      r6,r1
        0x00000222:    4604        .F      MOV      r4,r0
        0x00000224:    2000        .       MOVS     r0,#0
        0x00000226:    6220         b      STR      r0,[r4,#0x20]
        0x00000228:    4620         F      MOV      r0,r4
        0x0000022a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x0000022c:    4788        .G      BLX      r1
        0x0000022e:    b330        0.      CBZ      r0,0x27e ; __printf + 98
        0x00000230:    2825        %(      CMP      r0,#0x25
        0x00000232:    d005        ..      BEQ      0x240 ; __printf + 36
        0x00000234:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000238:    4790        .G      BLX      r2
        0x0000023a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000023c:    1c40        @.      ADDS     r0,r0,#1
        0x0000023e:    e7f2        ..      B        0x226 ; __printf + 10
        0x00000240:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000242:    4620         F      MOV      r0,r4
        0x00000244:    2700        .'      MOVS     r7,#0
        0x00000246:    4788        .G      BLX      r1
        0x00000248:    0005        ..      MOVS     r5,r0
        0x0000024a:    d018        ..      BEQ      0x27e ; __printf + 98
        0x0000024c:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x00000250:    2819        .(      CMP      r0,#0x19
        0x00000252:    d802        ..      BHI      0x25a ; __printf + 62
        0x00000254:    3520         5      ADDS     r5,r5,#0x20
        0x00000256:    f44f6700    O..g    MOV      r7,#0x800
        0x0000025a:    4632        2F      MOV      r2,r6
        0x0000025c:    4629        )F      MOV      r1,r5
        0x0000025e:    4620         F      MOV      r0,r4
        0x00000260:    6027        '`      STR      r7,[r4,#0]
        0x00000262:    f7ffff93    ....    BL       _printf_d ; 0x18c
        0x00000266:    b140        @.      CBZ      r0,0x27a ; __printf + 94
        0x00000268:    2801        .(      CMP      r0,#1
        0x0000026a:    d004        ..      BEQ      0x276 ; __printf + 90
        0x0000026c:    1df6        ..      ADDS     r6,r6,#7
        0x0000026e:    f0260607    &...    BIC      r6,r6,#7
        0x00000272:    3608        .6      ADDS     r6,r6,#8
        0x00000274:    e7d8        ..      B        0x228 ; __printf + 12
        0x00000276:    1d36        6.      ADDS     r6,r6,#4
        0x00000278:    e7d6        ..      B        0x228 ; __printf + 12
        0x0000027a:    4628        (F      MOV      r0,r5
        0x0000027c:    e7da        ..      B        0x234 ; __printf + 24
        0x0000027e:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000280:    e8bd81f0    ....    POP      {r4-r8,pc}
    .text
    _printf_str
        0x00000284:    b570        p.      PUSH     {r4-r6,lr}
        0x00000286:    460c        .F      MOV      r4,r1
        0x00000288:    4605        .F      MOV      r5,r0
        0x0000028a:    2a01        .*      CMP      r2,#1
        0x0000028c:    d005        ..      BEQ      0x29a ; _printf_str + 22
        0x0000028e:    7828        (x      LDRB     r0,[r5,#0]
        0x00000290:    0680        ..      LSLS     r0,r0,#26
        0x00000292:    d500        ..      BPL      0x296 ; _printf_str + 18
        0x00000294:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x00000296:    2300        .#      MOVS     r3,#0
        0x00000298:    e002        ..      B        0x2a0 ; _printf_str + 28
        0x0000029a:    2301        .#      MOVS     r3,#1
        0x0000029c:    e005        ..      B        0x2aa ; _printf_str + 38
        0x0000029e:    1c5b        [.      ADDS     r3,r3,#1
        0x000002a0:    4293        .B      CMP      r3,r2
        0x000002a2:    d202        ..      BCS      0x2aa ; _printf_str + 38
        0x000002a4:    5ce0        .\      LDRB     r0,[r4,r3]
        0x000002a6:    2800        .(      CMP      r0,#0
        0x000002a8:    d1f9        ..      BNE      0x29e ; _printf_str + 26
        0x000002aa:    69a8        .i      LDR      r0,[r5,#0x18]
        0x000002ac:    18e6        ..      ADDS     r6,r4,r3
        0x000002ae:    1ac0        ..      SUBS     r0,r0,r3
        0x000002b0:    61a8        .a      STR      r0,[r5,#0x18]
        0x000002b2:    6a28        (j      LDR      r0,[r5,#0x20]
        0x000002b4:    4418        .D      ADD      r0,r0,r3
        0x000002b6:    6228        (b      STR      r0,[r5,#0x20]
        0x000002b8:    4628        (F      MOV      r0,r5
        0x000002ba:    f3af8000    ....    NOP.W    
        0x000002be:    e004        ..      B        0x2ca ; _printf_str + 70
        0x000002c0:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x000002c4:    f8140b01    ....    LDRB     r0,[r4],#1
        0x000002c8:    4790        .G      BLX      r2
        0x000002ca:    42b4        .B      CMP      r4,r6
        0x000002cc:    d3f8        ..      BCC      0x2c0 ; _printf_str + 60
        0x000002ce:    4628        (F      MOV      r0,r5
        0x000002d0:    f3af8000    ....    NOP.W    
        0x000002d4:    bd70        p.      POP      {r4-r6,pc}
        0x000002d6:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x000002d8:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000002dc:    4606        .F      MOV      r6,r0
        0x000002de:    2400        .$      MOVS     r4,#0
        0x000002e0:    6810        .h      LDR      r0,[r2,#0]
        0x000002e2:    2975        u)      CMP      r1,#0x75
        0x000002e4:    4631        1F      MOV      r1,r6
        0x000002e6:    a516        ..      ADR      r5,{pc}+0x5a ; 0x340
        0x000002e8:    d010        ..      BEQ      0x30c ; _printf_int_dec + 52
        0x000002ea:    f3af8000    ....    NOP.W    
        0x000002ee:    2800        .(      CMP      r0,#0
        0x000002f0:    da02        ..      BGE      0x2f8 ; _printf_int_dec + 32
        0x000002f2:    4240        @B      RSBS     r0,r0,#0
        0x000002f4:    a513        ..      ADR      r5,{pc}+0x50 ; 0x344
        0x000002f6:    e007        ..      B        0x308 ; _printf_int_dec + 48
        0x000002f8:    6831        1h      LDR      r1,[r6,#0]
        0x000002fa:    078a        ..      LSLS     r2,r1,#30
        0x000002fc:    d501        ..      BPL      0x302 ; _printf_int_dec + 42
        0x000002fe:    a512        ..      ADR      r5,{pc}+0x4a ; 0x348
        0x00000300:    e002        ..      B        0x308 ; _printf_int_dec + 48
        0x00000302:    0749        I.      LSLS     r1,r1,#29
        0x00000304:    d504        ..      BPL      0x310 ; _printf_int_dec + 56
        0x00000306:    a511        ..      ADR      r5,{pc}+0x46 ; 0x34c
        0x00000308:    2401        .$      MOVS     r4,#1
        0x0000030a:    e001        ..      B        0x310 ; _printf_int_dec + 56
        0x0000030c:    f3af8000    ....    NOP.W    
        0x00000310:    2100        .!      MOVS     r1,#0
        0x00000312:    220a        ."      MOVS     r2,#0xa
        0x00000314:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x00000318:    e009        ..      B        0x32e ; _printf_int_dec + 86
        0x0000031a:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x0000031e:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x00000322:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x00000326:    3030        00      ADDS     r0,r0,#0x30
        0x00000328:    5478        xT      STRB     r0,[r7,r1]
        0x0000032a:    4618        .F      MOV      r0,r3
        0x0000032c:    1c49        I.      ADDS     r1,r1,#1
        0x0000032e:    2800        .(      CMP      r0,#0
        0x00000330:    d1f3        ..      BNE      0x31a ; _printf_int_dec + 66
        0x00000332:    4623        #F      MOV      r3,r4
        0x00000334:    462a        *F      MOV      r2,r5
        0x00000336:    4630        0F      MOV      r0,r6
        0x00000338:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x0000033c:    f000b874    ..t.    B.W      _printf_int_common ; 0x428
    $d
        0x00000340:    00000000    ....    DCD    0
        0x00000344:    0000002d    -...    DCD    45
        0x00000348:    0000002b    +...    DCD    43
        0x0000034c:    00000020     ...    DCD    32
    $t
    .text
    strcpy
        0x00000350:    ea400301    @...    ORR      r3,r0,r1
        0x00000354:    4602        .F      MOV      r2,r0
        0x00000356:    b530        0.      PUSH     {r4,r5,lr}
        0x00000358:    079b        ..      LSLS     r3,r3,#30
        0x0000035a:    d110        ..      BNE      0x37e ; strcpy + 46
        0x0000035c:    f04f3401    O..4    MOV      r4,#0x1010101
        0x00000360:    e000        ..      B        0x364 ; strcpy + 20
        0x00000362:    c208        ..      STM      r2!,{r3}
        0x00000364:    c908        ..      LDM      r1!,{r3}
        0x00000366:    1b1d        ..      SUBS     r5,r3,r4
        0x00000368:    439d        .C      BICS     r5,r5,r3
        0x0000036a:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x0000036e:    d0f8        ..      BEQ      0x362 ; strcpy + 18
        0x00000370:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x00000374:    f8021b01    ....    STRB     r1,[r2],#1
        0x00000378:    d00d        ..      BEQ      0x396 ; strcpy + 70
        0x0000037a:    0a1b        ..      LSRS     r3,r3,#8
        0x0000037c:    e7f8        ..      B        0x370 ; strcpy + 32
        0x0000037e:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000382:    2b00        .+      CMP      r3,#0
        0x00000384:    f8023b01    ...;    STRB     r3,[r2],#1
        0x00000388:    d005        ..      BEQ      0x396 ; strcpy + 70
        0x0000038a:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x0000038e:    2b00        .+      CMP      r3,#0
        0x00000390:    f8023b01    ...;    STRB     r3,[r2],#1
        0x00000394:    d1f3        ..      BNE      0x37e ; strcpy + 46
        0x00000396:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x00000398:    2a03        .*      CMP      r2,#3
        0x0000039a:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x3fe
        0x0000039e:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003a2:    f0008015    ....    BEQ.W    0x3d0 ; __aeabi_memcpy + 56
        0x000003a6:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003aa:    f1bc0f02    ....    CMP      r12,#2
        0x000003ae:    4462        bD      ADD      r2,r2,r12
        0x000003b0:    bf98        ..      IT       LS
        0x000003b2:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x000003b6:    f8003b01    ...;    STRB     r3,[r0],#1
        0x000003ba:    bf38        8.      IT       CC
        0x000003bc:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x000003c0:    f1a20204    ....    SUB      r2,r2,#4
        0x000003c4:    bf98        ..      IT       LS
        0x000003c6:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x000003ca:    bf38        8.      IT       CC
        0x000003cc:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x000003d0:    f0110303    ....    ANDS     r3,r1,#3
        0x000003d4:    f00080aa    ....    BEQ.W    __aeabi_memcpy4 ; 0x52c
        0x000003d8:    3a08        .:      SUBS     r2,r2,#8
        0x000003da:    f0c08008    ....    BCC.W    0x3ee ; __aeabi_memcpy + 86
        0x000003de:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x000003e2:    3a08        .:      SUBS     r2,r2,#8
        0x000003e4:    f851cb04    Q...    LDR      r12,[r1],#4
        0x000003e8:    e8a01008    ....    STM      r0!,{r3,r12}
        0x000003ec:    e7f5        ..      B        0x3da ; __aeabi_memcpy + 66
        0x000003ee:    1d12        ..      ADDS     r2,r2,#4
        0x000003f0:    bf5c        \.      ITT      PL
        0x000003f2:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x000003f6:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x000003fa:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x000003fe:    07d2        ..      LSLS     r2,r2,#31
        0x00000400:    bf24        $.      ITT      CS
        0x00000402:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x00000406:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000040a:    bf48        H.      IT       MI
        0x0000040c:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000410:    bf24        $.      ITT      CS
        0x00000412:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x00000416:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000041a:    bf48        H.      IT       MI
        0x0000041c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000420:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000422:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000424:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x00000426:    4770        pG      BX       lr
    .text
    _printf_int_common
        0x00000428:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000042c:    460d        .F      MOV      r5,r1
        0x0000042e:    4699        .F      MOV      r9,r3
        0x00000430:    4692        .F      MOV      r10,r2
        0x00000432:    4604        .F      MOV      r4,r0
        0x00000434:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x00000438:    6801        .h      LDR      r1,[r0,#0]
        0x0000043a:    0688        ..      LSLS     r0,r1,#26
        0x0000043c:    d504        ..      BPL      0x448 ; _printf_int_common + 32
        0x0000043e:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00000440:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000444:    6021        !`      STR      r1,[r4,#0]
        0x00000446:    e000        ..      B        0x44a ; _printf_int_common + 34
        0x00000448:    2001        .       MOVS     r0,#1
        0x0000044a:    42a8        .B      CMP      r0,r5
        0x0000044c:    dd01        ..      BLE      0x452 ; _printf_int_common + 42
        0x0000044e:    1b47        G.      SUBS     r7,r0,r5
        0x00000450:    e000        ..      B        0x454 ; _printf_int_common + 44
        0x00000452:    2700        .'      MOVS     r7,#0
        0x00000454:    69a1        .i      LDR      r1,[r4,#0x18]
        0x00000456:    197a        z.      ADDS     r2,r7,r5
        0x00000458:    eb020009    ....    ADD      r0,r2,r9
        0x0000045c:    1a08        ..      SUBS     r0,r1,r0
        0x0000045e:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000460:    7820         x      LDRB     r0,[r4,#0]
        0x00000462:    06c0        ..      LSLS     r0,r0,#27
        0x00000464:    d402        ..      BMI      0x46c ; _printf_int_common + 68
        0x00000466:    4620         F      MOV      r0,r4
        0x00000468:    f3af8000    ....    NOP.W    
        0x0000046c:    2600        .&      MOVS     r6,#0
        0x0000046e:    e008        ..      B        0x482 ; _printf_int_common + 90
        0x00000470:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000474:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x00000478:    4790        .G      BLX      r2
        0x0000047a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000047c:    1c40        @.      ADDS     r0,r0,#1
        0x0000047e:    1c76        v.      ADDS     r6,r6,#1
        0x00000480:    6220         b      STR      r0,[r4,#0x20]
        0x00000482:    454e        NE      CMP      r6,r9
        0x00000484:    dbf4        ..      BLT      0x470 ; _printf_int_common + 72
        0x00000486:    7820         x      LDRB     r0,[r4,#0]
        0x00000488:    06c0        ..      LSLS     r0,r0,#27
        0x0000048a:    d50a        ..      BPL      0x4a2 ; _printf_int_common + 122
        0x0000048c:    4620         F      MOV      r0,r4
        0x0000048e:    f3af8000    ....    NOP.W    
        0x00000492:    e006        ..      B        0x4a2 ; _printf_int_common + 122
        0x00000494:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000498:    2030        0       MOVS     r0,#0x30
        0x0000049a:    4790        .G      BLX      r2
        0x0000049c:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000049e:    1c40        @.      ADDS     r0,r0,#1
        0x000004a0:    6220         b      STR      r0,[r4,#0x20]
        0x000004a2:    1e38        8.      SUBS     r0,r7,#0
        0x000004a4:    f1a70701    ....    SUB      r7,r7,#1
        0x000004a8:    dcf4        ..      BGT      0x494 ; _printf_int_common + 108
        0x000004aa:    e007        ..      B        0x4bc ; _printf_int_common + 148
        0x000004ac:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004b0:    f8180005    ....    LDRB     r0,[r8,r5]
        0x000004b4:    4790        .G      BLX      r2
        0x000004b6:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004b8:    1c40        @.      ADDS     r0,r0,#1
        0x000004ba:    6220         b      STR      r0,[r4,#0x20]
        0x000004bc:    1e28        (.      SUBS     r0,r5,#0
        0x000004be:    f1a50501    ....    SUB      r5,r5,#1
        0x000004c2:    dcf3        ..      BGT      0x4ac ; _printf_int_common + 132
        0x000004c4:    4620         F      MOV      r0,r4
        0x000004c6:    f3af8000    ....    NOP.W    
        0x000004ca:    7820         x      LDRB     r0,[r4,#0]
        0x000004cc:    0600        ..      LSLS     r0,r0,#24
        0x000004ce:    d502        ..      BPL      0x4d6 ; _printf_int_common + 174
        0x000004d0:    2002        .       MOVS     r0,#2
        0x000004d2:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000004d6:    2001        .       MOVS     r0,#1
        0x000004d8:    e7fb        ..      B        0x4d2 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x000004da:    b510        ..      PUSH     {r4,lr}
        0x000004dc:    6943        Ci      LDR      r3,[r0,#0x14]
        0x000004de:    b113        ..      CBZ      r3,0x4e6 ; _printf_cs_common + 12
        0x000004e0:    f3af8000    ....    NOP.W    
        0x000004e4:    e001        ..      B        0x4ea ; _printf_cs_common + 16
        0x000004e6:    f7fffecd    ....    BL       _printf_str ; 0x284
        0x000004ea:    2001        .       MOVS     r0,#1
        0x000004ec:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x000004ee:    7812        .x      LDRB     r2,[r2,#0]
        0x000004f0:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x000004f4:    700a        .p      STRB     r2,[r1,#0]
        0x000004f6:    2200        ."      MOVS     r2,#0
        0x000004f8:    704a        Jp      STRB     r2,[r1,#1]
        0x000004fa:    2201        ."      MOVS     r2,#1
        0x000004fc:    e7ed        ..      B        _printf_cs_common ; 0x4da
    _printf_string
        0x000004fe:    6811        .h      LDR      r1,[r2,#0]
        0x00000500:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000504:    e7e9        ..      B        _printf_cs_common ; 0x4da
        0x00000506:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x00000508:    4b07        .K      LDR      r3,[pc,#28] ; [0x528] = 0x172b
        0x0000050a:    b570        p.      PUSH     {r4-r6,lr}
        0x0000050c:    460d        .F      MOV      r5,r1
        0x0000050e:    447b        {D      ADD      r3,r3,pc
        0x00000510:    f000f843    ..C.    BL       _printf_char_common ; 0x59a
        0x00000514:    4604        .F      MOV      r4,r0
        0x00000516:    4628        (F      MOV      r0,r5
        0x00000518:    f000f852    ..R.    BL       ferror ; 0x5c0
        0x0000051c:    b110        ..      CBZ      r0,0x524 ; _printf_char_file + 28
        0x0000051e:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000522:    bd70        p.      POP      {r4-r6,pc}
        0x00000524:    4620         F      MOV      r0,r4
        0x00000526:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000528:    0000172b    +...    DCD    5931
    $t
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x0000052c:    b510        ..      PUSH     {r4,lr}
        0x0000052e:    3a20         :      SUBS     r2,r2,#0x20
        0x00000530:    f0c0800b    ....    BCC.W    0x54a ; __aeabi_memcpy4 + 30
        0x00000534:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000538:    3a20         :      SUBS     r2,r2,#0x20
        0x0000053a:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x0000053e:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000542:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000546:    f4bfaff5    ....    BCS.W    0x534 ; __aeabi_memcpy4 + 8
        0x0000054a:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x0000054e:    bf24        $.      ITT      CS
        0x00000550:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x00000554:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x00000558:    bf44        D.      ITT      MI
        0x0000055a:    c918        ..      LDMMI    r1!,{r3,r4}
        0x0000055c:    c018        ..      STMMI    r0!,{r3,r4}
        0x0000055e:    e8bd4010    ...@    POP      {r4,lr}
        0x00000562:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x00000566:    bf24        $.      ITT      CS
        0x00000568:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x0000056c:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x00000570:    bf08        ..      IT       EQ
        0x00000572:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x00000574:    07d2        ..      LSLS     r2,r2,#31
        0x00000576:    bf28        (.      IT       CS
        0x00000578:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x0000057c:    bf48        H.      IT       MI
        0x0000057e:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000582:    bf28        (.      IT       CS
        0x00000584:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x00000588:    bf48        H.      IT       MI
        0x0000058a:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x0000058e:    4770        pG      BX       lr
    .text
    _printf_input_char
        0x00000590:    6901        .i      LDR      r1,[r0,#0x10]
        0x00000592:    1c4a        J.      ADDS     r2,r1,#1
        0x00000594:    6102        .a      STR      r2,[r0,#0x10]
        0x00000596:    7808        .x      LDRB     r0,[r1,#0]
        0x00000598:    4770        pG      BX       lr
    _printf_char_common
        0x0000059a:    b500        ..      PUSH     {lr}
        0x0000059c:    b08f        ..      SUB      sp,sp,#0x3c
        0x0000059e:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000005a2:    2100        .!      MOVS     r1,#0
        0x000005a4:    9105        ..      STR      r1,[sp,#0x14]
        0x000005a6:    4905        .I      LDR      r1,[pc,#20] ; [0x5bc] = 0xffffffe5
        0x000005a8:    4479        yD      ADD      r1,r1,pc
        0x000005aa:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x000005ae:    4611        .F      MOV      r1,r2
        0x000005b0:    4668        hF      MOV      r0,sp
        0x000005b2:    f7fffe33    ..3.    BL       __printf ; 0x21c
        0x000005b6:    b00f        ..      ADD      sp,sp,#0x3c
        0x000005b8:    bd00        ..      POP      {pc}
    $d
        0x000005ba:    0000        ..      DCW    0
        0x000005bc:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x000005c0:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x000005c2:    f0000080    ....    AND      r0,r0,#0x80
        0x000005c6:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x000005c8:    4675        uF      MOV      r5,lr
        0x000005ca:    f000f829    ..).    BL       __user_libspace ; 0x620
        0x000005ce:    46ae        .F      MOV      lr,r5
        0x000005d0:    0005        ..      MOVS     r5,r0
        0x000005d2:    4669        iF      MOV      r1,sp
        0x000005d4:    4653        SF      MOV      r3,r10
        0x000005d6:    f0200007     ...    BIC      r0,r0,#7
        0x000005da:    4685        .F      MOV      sp,r0
        0x000005dc:    b018        ..      ADD      sp,sp,#0x60
        0x000005de:    b520         .      PUSH     {r5,lr}
        0x000005e0:    f7fffdfe    ....    BL       __user_initial_stackheap ; 0x1e0
        0x000005e4:    e8bd4020    .. @    POP      {r5,lr}
        0x000005e8:    f04f0600    O...    MOV      r6,#0
        0x000005ec:    f04f0700    O...    MOV      r7,#0
        0x000005f0:    f04f0800    O...    MOV      r8,#0
        0x000005f4:    f04f0b00    O...    MOV      r11,#0
        0x000005f8:    f0210107    !...    BIC      r1,r1,#7
        0x000005fc:    46ac        .F      MOV      r12,r5
        0x000005fe:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000602:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000606:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000060a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000060e:    468d        .F      MOV      sp,r1
        0x00000610:    4770        pG      BX       lr
    .text
    exit
        0x00000612:    4604        .F      MOV      r4,r0
        0x00000614:    f3af8000    ....    NOP.W    
        0x00000618:    4620         F      MOV      r0,r4
        0x0000061a:    f7fffdcc    ....    BL       __rt_exit ; 0x1b6
        0x0000061e:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000620:    4800        .H      LDR      r0,[pc,#0] ; [0x624] = 0x200004c0
        0x00000622:    4770        pG      BX       lr
    $d
        0x00000624:    200004c0    ...     DCD    536872128
    $t
    .text
    _sys_exit
        0x00000628:    4901        .I      LDR      r1,[pc,#4] ; [0x630] = 0x20026
        0x0000062a:    2018        .       MOVS     r0,#0x18
        0x0000062c:    beab        ..      BKPT     #0xab
        0x0000062e:    e7fe        ..      B        0x62e ; _sys_exit + 6
    $d
        0x00000630:    00020026    &...    DCD    131110
    $t
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x00000634:    4770        pG      BX       lr
    .text
    __semihosting_library_function
        0x00000636:    0000        ..      MOVS     r0,r0
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x00000638:    b570        p.      PUSH     {r4-r6,lr}
        0x0000063a:    4d07        .M      LDR      r5,[pc,#28] ; [0x658] = 0x88
        0x0000063c:    f1050428    ..(.    ADD      r4,r5,#0x28
        0x00000640:    b104        ..      CBZ      r4,0x644 ; ADCC0_IRQHandler + 12
        0x00000642:    e004        ..      B        0x64e ; ADCC0_IRQHandler + 22
        0x00000644:    2264        d"      MOVS     r2,#0x64
        0x00000646:    a105        ..      ADR      r1,{pc}+0x16 ; 0x65c
        0x00000648:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x67c
        0x0000064a:    f001f9b9    ....    BL       __aeabi_assert ; 0x19c0
        0x0000064e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000652:    4788        .G      BLX      r1
        0x00000654:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000656:    0000        ..      DCW    0
        0x00000658:    00000088    ....    DCD    136
        0x0000065c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000660:    2e2e5c2e    .\..    DCD    774790190
        0x00000664:    464c455c    \ELF    DCD    1179403612
        0x00000668:    53425f32    2_BS    DCD    1396858674
        0x0000066c:    72445c50    P\Dr    DCD    1917082704
        0x00000670:    72657669    iver    DCD    1919252073
        0x00000674:    746e695c    \int    DCD    1953392988
        0x00000678:    00632e63    c.c.    DCD    6499939
        0x0000067c:    636e7566    func    DCD    1668183398
        0x00000680:    203d2120     !=     DCD    540877088
        0x00000684:    00000030    0...    DCD    48
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x00000688:    b570        p.      PUSH     {r4-r6,lr}
        0x0000068a:    4d07        .M      LDR      r5,[pc,#28] ; [0x6a8] = 0x88
        0x0000068c:    f1050430    ..0.    ADD      r4,r5,#0x30
        0x00000690:    b104        ..      CBZ      r4,0x694 ; ADCC1_IRQHandler + 12
        0x00000692:    e004        ..      B        0x69e ; ADCC1_IRQHandler + 22
        0x00000694:    226f        o"      MOVS     r2,#0x6f
        0x00000696:    a105        ..      ADR      r1,{pc}+0x16 ; 0x6ac
        0x00000698:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x6cc
        0x0000069a:    f001f991    ....    BL       __aeabi_assert ; 0x19c0
        0x0000069e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000006a2:    4788        .G      BLX      r1
        0x000006a4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000006a6:    0000        ..      DCW    0
        0x000006a8:    00000088    ....    DCD    136
        0x000006ac:    2e5c2e2e    ..\.    DCD    777793070
        0x000006b0:    2e2e5c2e    .\..    DCD    774790190
        0x000006b4:    464c455c    \ELF    DCD    1179403612
        0x000006b8:    53425f32    2_BS    DCD    1396858674
        0x000006bc:    72445c50    P\Dr    DCD    1917082704
        0x000006c0:    72657669    iver    DCD    1919252073
        0x000006c4:    746e695c    \int    DCD    1953392988
        0x000006c8:    00632e63    c.c.    DCD    6499939
        0x000006cc:    636e7566    func    DCD    1668183398
        0x000006d0:    203d2120     !=     DCD    540877088
        0x000006d4:    00000030    0...    DCD    48
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x000006d8:    b570        p.      PUSH     {r4-r6,lr}
        0x000006da:    4d07        .M      LDR      r5,[pc,#28] ; [0x6f8] = 0x88
        0x000006dc:    f1050438    ..8.    ADD      r4,r5,#0x38
        0x000006e0:    b104        ..      CBZ      r4,0x6e4 ; ADCC2_IRQHandler + 12
        0x000006e2:    e004        ..      B        0x6ee ; ADCC2_IRQHandler + 22
        0x000006e4:    227a        z"      MOVS     r2,#0x7a
        0x000006e6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x6fc
        0x000006e8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x71c
        0x000006ea:    f001f969    ..i.    BL       __aeabi_assert ; 0x19c0
        0x000006ee:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000006f2:    4788        .G      BLX      r1
        0x000006f4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000006f6:    0000        ..      DCW    0
        0x000006f8:    00000088    ....    DCD    136
        0x000006fc:    2e5c2e2e    ..\.    DCD    777793070
        0x00000700:    2e2e5c2e    .\..    DCD    774790190
        0x00000704:    464c455c    \ELF    DCD    1179403612
        0x00000708:    53425f32    2_BS    DCD    1396858674
        0x0000070c:    72445c50    P\Dr    DCD    1917082704
        0x00000710:    72657669    iver    DCD    1919252073
        0x00000714:    746e695c    \int    DCD    1953392988
        0x00000718:    00632e63    c.c.    DCD    6499939
        0x0000071c:    636e7566    func    DCD    1668183398
        0x00000720:    203d2120     !=     DCD    540877088
        0x00000724:    00000030    0...    DCD    48
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000728:    b570        p.      PUSH     {r4-r6,lr}
        0x0000072a:    4d07        .M      LDR      r5,[pc,#28] ; [0x748] = 0x88
        0x0000072c:    f1050440    ..@.    ADD      r4,r5,#0x40
        0x00000730:    b104        ..      CBZ      r4,0x734 ; ADCC3_IRQHandler + 12
        0x00000732:    e004        ..      B        0x73e ; ADCC3_IRQHandler + 22
        0x00000734:    2285        ."      MOVS     r2,#0x85
        0x00000736:    a105        ..      ADR      r1,{pc}+0x16 ; 0x74c
        0x00000738:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x76c
        0x0000073a:    f001f941    ..A.    BL       __aeabi_assert ; 0x19c0
        0x0000073e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000742:    4788        .G      BLX      r1
        0x00000744:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000746:    0000        ..      DCW    0
        0x00000748:    00000088    ....    DCD    136
        0x0000074c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000750:    2e2e5c2e    .\..    DCD    774790190
        0x00000754:    464c455c    \ELF    DCD    1179403612
        0x00000758:    53425f32    2_BS    DCD    1396858674
        0x0000075c:    72445c50    P\Dr    DCD    1917082704
        0x00000760:    72657669    iver    DCD    1919252073
        0x00000764:    746e695c    \int    DCD    1953392988
        0x00000768:    00632e63    c.c.    DCD    6499939
        0x0000076c:    636e7566    func    DCD    1668183398
        0x00000770:    203d2120     !=     DCD    540877088
        0x00000774:    00000030    0...    DCD    48
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x00000778:    b570        p.      PUSH     {r4-r6,lr}
        0x0000077a:    4d07        .M      LDR      r5,[pc,#28] ; [0x798] = 0x88
        0x0000077c:    f1050448    ..H.    ADD      r4,r5,#0x48
        0x00000780:    b104        ..      CBZ      r4,0x784 ; ADCC4_IRQHandler + 12
        0x00000782:    e004        ..      B        0x78e ; ADCC4_IRQHandler + 22
        0x00000784:    2290        ."      MOVS     r2,#0x90
        0x00000786:    a105        ..      ADR      r1,{pc}+0x16 ; 0x79c
        0x00000788:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x7bc
        0x0000078a:    f001f919    ....    BL       __aeabi_assert ; 0x19c0
        0x0000078e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000792:    4788        .G      BLX      r1
        0x00000794:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000796:    0000        ..      DCW    0
        0x00000798:    00000088    ....    DCD    136
        0x0000079c:    2e5c2e2e    ..\.    DCD    777793070
        0x000007a0:    2e2e5c2e    .\..    DCD    774790190
        0x000007a4:    464c455c    \ELF    DCD    1179403612
        0x000007a8:    53425f32    2_BS    DCD    1396858674
        0x000007ac:    72445c50    P\Dr    DCD    1917082704
        0x000007b0:    72657669    iver    DCD    1919252073
        0x000007b4:    746e695c    \int    DCD    1953392988
        0x000007b8:    00632e63    c.c.    DCD    6499939
        0x000007bc:    636e7566    func    DCD    1668183398
        0x000007c0:    203d2120     !=     DCD    540877088
        0x000007c4:    00000030    0...    DCD    48
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x000007c8:    b570        p.      PUSH     {r4-r6,lr}
        0x000007ca:    4d07        .M      LDR      r5,[pc,#28] ; [0x7e8] = 0x88
        0x000007cc:    f1050450    ..P.    ADD      r4,r5,#0x50
        0x000007d0:    b104        ..      CBZ      r4,0x7d4 ; ADCC5_IRQHandler + 12
        0x000007d2:    e004        ..      B        0x7de ; ADCC5_IRQHandler + 22
        0x000007d4:    229a        ."      MOVS     r2,#0x9a
        0x000007d6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x7ec
        0x000007d8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x80c
        0x000007da:    f001f8f1    ....    BL       __aeabi_assert ; 0x19c0
        0x000007de:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000007e2:    4788        .G      BLX      r1
        0x000007e4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000007e6:    0000        ..      DCW    0
        0x000007e8:    00000088    ....    DCD    136
        0x000007ec:    2e5c2e2e    ..\.    DCD    777793070
        0x000007f0:    2e2e5c2e    .\..    DCD    774790190
        0x000007f4:    464c455c    \ELF    DCD    1179403612
        0x000007f8:    53425f32    2_BS    DCD    1396858674
        0x000007fc:    72445c50    P\Dr    DCD    1917082704
        0x00000800:    72657669    iver    DCD    1919252073
        0x00000804:    746e695c    \int    DCD    1953392988
        0x00000808:    00632e63    c.c.    DCD    6499939
        0x0000080c:    636e7566    func    DCD    1668183398
        0x00000810:    203d2120     !=     DCD    540877088
        0x00000814:    00000030    0...    DCD    48
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000818:    b570        p.      PUSH     {r4-r6,lr}
        0x0000081a:    4d07        .M      LDR      r5,[pc,#28] ; [0x838] = 0x88
        0x0000081c:    f1050418    ....    ADD      r4,r5,#0x18
        0x00000820:    b104        ..      CBZ      r4,0x824 ; DMAC_IRQHandler + 12
        0x00000822:    e004        ..      B        0x82e ; DMAC_IRQHandler + 22
        0x00000824:    224e        N"      MOVS     r2,#0x4e
        0x00000826:    a105        ..      ADR      r1,{pc}+0x16 ; 0x83c
        0x00000828:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x85c
        0x0000082a:    f001f8c9    ....    BL       __aeabi_assert ; 0x19c0
        0x0000082e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000832:    4788        .G      BLX      r1
        0x00000834:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000836:    0000        ..      DCW    0
        0x00000838:    00000088    ....    DCD    136
        0x0000083c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000840:    2e2e5c2e    .\..    DCD    774790190
        0x00000844:    464c455c    \ELF    DCD    1179403612
        0x00000848:    53425f32    2_BS    DCD    1396858674
        0x0000084c:    72445c50    P\Dr    DCD    1917082704
        0x00000850:    72657669    iver    DCD    1919252073
        0x00000854:    746e695c    \int    DCD    1953392988
        0x00000858:    00632e63    c.c.    DCD    6499939
        0x0000085c:    636e7566    func    DCD    1668183398
        0x00000860:    203d2120     !=     DCD    540877088
        0x00000864:    00000030    0...    DCD    48
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x00000868:    b570        p.      PUSH     {r4-r6,lr}
        0x0000086a:    4d07        .M      LDR      r5,[pc,#28] ; [0x888] = 0x88
        0x0000086c:    f1050408    ....    ADD      r4,r5,#8
        0x00000870:    b104        ..      CBZ      r4,0x874 ; EXT_IRQHandler + 12
        0x00000872:    e004        ..      B        0x87e ; EXT_IRQHandler + 22
        0x00000874:    2238        8"      MOVS     r2,#0x38
        0x00000876:    a105        ..      ADR      r1,{pc}+0x16 ; 0x88c
        0x00000878:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x8ac
        0x0000087a:    f001f8a1    ....    BL       __aeabi_assert ; 0x19c0
        0x0000087e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000882:    4788        .G      BLX      r1
        0x00000884:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000886:    0000        ..      DCW    0
        0x00000888:    00000088    ....    DCD    136
        0x0000088c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000890:    2e2e5c2e    .\..    DCD    774790190
        0x00000894:    464c455c    \ELF    DCD    1179403612
        0x00000898:    53425f32    2_BS    DCD    1396858674
        0x0000089c:    72445c50    P\Dr    DCD    1917082704
        0x000008a0:    72657669    iver    DCD    1919252073
        0x000008a4:    746e695c    \int    DCD    1953392988
        0x000008a8:    00632e63    c.c.    DCD    6499939
        0x000008ac:    636e7566    func    DCD    1668183398
        0x000008b0:    203d2120     !=     DCD    540877088
        0x000008b4:    00000030    0...    DCD    48
    $t
    i.FLASH_Erase_Block
    FLASH_Erase_Block
        0x000008b8:    b57c        |.      PUSH     {r2-r6,lr}
        0x000008ba:    4606        .F      MOV      r6,r0
        0x000008bc:    460c        .F      MOV      r4,r1
        0x000008be:    2006        .       MOVS     r0,#6
        0x000008c0:    9001        ..      STR      r0,[sp,#4]
        0x000008c2:    b12c        ,.      CBZ      r4,0x8d0 ; FLASH_Erase_Block + 24
        0x000008c4:    2c01        .,      CMP      r4,#1
        0x000008c6:    d003        ..      BEQ      0x8d0 ; FLASH_Erase_Block + 24
        0x000008c8:    2c02        .,      CMP      r4,#2
        0x000008ca:    d001        ..      BEQ      0x8d0 ; FLASH_Erase_Block + 24
        0x000008cc:    2c03        .,      CMP      r4,#3
        0x000008ce:    d100        ..      BNE      0x8d2 ; FLASH_Erase_Block + 26
        0x000008d0:    e004        ..      B        0x8dc ; FLASH_Erase_Block + 36
        0x000008d2:    2266        f"      MOVS     r2,#0x66
        0x000008d4:    a118        ..      ADR      r1,{pc}+0x64 ; 0x938
        0x000008d6:    4820         H      LDR      r0,[pc,#128] ; [0x958] = 0x2164
        0x000008d8:    f001f872    ..r.    BL       __aeabi_assert ; 0x19c0
        0x000008dc:    2101        .!      MOVS     r1,#1
        0x000008de:    a801        ..      ADD      r0,sp,#4
        0x000008e0:    f001fb26    ..&.    BL       qspi_write ; 0x1f30
        0x000008e4:    4630        0F      MOV      r0,r6
        0x000008e6:    f001f88b    ....    BL       co_bswap32 ; 0x1a00
        0x000008ea:    9000        ..      STR      r0,[sp,#0]
        0x000008ec:    b134        4.      CBZ      r4,0x8fc ; FLASH_Erase_Block + 68
        0x000008ee:    2c01        .,      CMP      r4,#1
        0x000008f0:    d009        ..      BEQ      0x906 ; FLASH_Erase_Block + 78
        0x000008f2:    2c02        .,      CMP      r4,#2
        0x000008f4:    d00c        ..      BEQ      0x910 ; FLASH_Erase_Block + 88
        0x000008f6:    2c03        .,      CMP      r4,#3
        0x000008f8:    d114        ..      BNE      0x924 ; FLASH_Erase_Block + 108
        0x000008fa:    e00e        ..      B        0x91a ; FLASH_Erase_Block + 98
        0x000008fc:    2020                MOVS     r0,#0x20
        0x000008fe:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000902:    2504        .%      MOVS     r5,#4
        0x00000904:    e00e        ..      B        0x924 ; FLASH_Erase_Block + 108
        0x00000906:    2052        R       MOVS     r0,#0x52
        0x00000908:    f88d0000    ....    STRB     r0,[sp,#0]
        0x0000090c:    2504        .%      MOVS     r5,#4
        0x0000090e:    e009        ..      B        0x924 ; FLASH_Erase_Block + 108
        0x00000910:    20d8        .       MOVS     r0,#0xd8
        0x00000912:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000916:    2504        .%      MOVS     r5,#4
        0x00000918:    e004        ..      B        0x924 ; FLASH_Erase_Block + 108
        0x0000091a:    2060        `       MOVS     r0,#0x60
        0x0000091c:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000920:    2501        .%      MOVS     r5,#1
        0x00000922:    bf00        ..      NOP      
        0x00000924:    bf00        ..      NOP      
        0x00000926:    4629        )F      MOV      r1,r5
        0x00000928:    4668        hF      MOV      r0,sp
        0x0000092a:    f001fb01    ....    BL       qspi_write ; 0x1f30
        0x0000092e:    f000f81b    ....    BL       FLASH_Operation_Wait ; 0x968
        0x00000932:    2000        .       MOVS     r0,#0
        0x00000934:    bd7c        |.      POP      {r2-r6,pc}
    $d
        0x00000936:    0000        ..      DCW    0
        0x00000938:    735c2e2e    ..\s    DCD    1935420974
        0x0000093c:    735c6b64    dk\s    DCD    1935436644
        0x00000940:    735c6372    rc\s    DCD    1935434610
        0x00000944:    645c636f    oc\d    DCD    1683776367
        0x00000948:    65766972    rive    DCD    1702259058
        0x0000094c:    6c665c72    r\fl    DCD    1818647666
        0x00000950:    2e687361    ash.    DCD    778597217
        0x00000954:    00000063    c...    DCD    99
        0x00000958:    00002164    d!..    DCD    8548
    $t
    i.FLASH_Init
    FLASH_Init
        0x0000095c:    b510        ..      PUSH     {r4,lr}
        0x0000095e:    2101        .!      MOVS     r1,#1
        0x00000960:    2004        .       MOVS     r0,#4
        0x00000962:    f001fa37    ..7.    BL       qspi_init ; 0x1dd4
        0x00000966:    bd10        ..      POP      {r4,pc}
    i.FLASH_Operation_Wait
    FLASH_Operation_Wait
        0x00000968:    b51c        ..      PUSH     {r2-r4,lr}
        0x0000096a:    2005        .       MOVS     r0,#5
        0x0000096c:    9000        ..      STR      r0,[sp,#0]
        0x0000096e:    bf00        ..      NOP      
        0x00000970:    2301        .#      MOVS     r3,#1
        0x00000972:    466a        jF      MOV      r2,sp
        0x00000974:    4619        .F      MOV      r1,r3
        0x00000976:    a801        ..      ADD      r0,sp,#4
        0x00000978:    f001fa3c    ..<.    BL       qspi_read ; 0x1df4
        0x0000097c:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000980:    f0000001    ....    AND      r0,r0,#1
        0x00000984:    2800        .(      CMP      r0,#0
        0x00000986:    d1f3        ..      BNE      0x970 ; FLASH_Operation_Wait + 8
        0x00000988:    bd1c        ..      POP      {r2-r4,pc}
        0x0000098a:    0000        ..      MOVS     r0,r0
    i.FLASH_Program
    FLASH_Program
        0x0000098c:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x00000990:    4604        .F      MOV      r4,r0
        0x00000992:    460d        .F      MOV      r5,r1
        0x00000994:    4617        .F      MOV      r7,r2
        0x00000996:    f02409ff    $...    BIC      r9,r4,#0xff
        0x0000099a:    f3c5200f    ...     UBFX     r0,r5,#8,#16
        0x0000099e:    9000        ..      STR      r0,[sp,#0]
        0x000009a0:    f0050aff    ....    AND      r10,r5,#0xff
        0x000009a4:    f5b41f00    ....    CMP      r4,#0x200000
        0x000009a8:    d200        ..      BCS      0x9ac ; FLASH_Program + 32
        0x000009aa:    e004        ..      B        0x9b6 ; FLASH_Program + 42
        0x000009ac:    22a4        ."      MOVS     r2,#0xa4
        0x000009ae:    a11c        ..      ADR      r1,{pc}+0x72 ; 0xa20
        0x000009b0:    a023        #.      ADR      r0,{pc}+0x90 ; 0xa40
        0x000009b2:    f001f805    ....    BL       __aeabi_assert ; 0x19c0
        0x000009b6:    45a1        .E      CMP      r9,r4
        0x000009b8:    d012        ..      BEQ      0x9e0 ; FLASH_Program + 84
        0x000009ba:    f5097080    ...p    ADD      r0,r9,#0x100
        0x000009be:    eba00b04    ....    SUB      r11,r0,r4
        0x000009c2:    455d        ]E      CMP      r5,r11
        0x000009c4:    d201        ..      BCS      0x9ca ; FLASH_Program + 62
        0x000009c6:    4628        (F      MOV      r0,r5
        0x000009c8:    e000        ..      B        0x9cc ; FLASH_Program + 64
        0x000009ca:    4658        XF      MOV      r0,r11
        0x000009cc:    4606        .F      MOV      r6,r0
        0x000009ce:    463a        :F      MOV      r2,r7
        0x000009d0:    4631        1F      MOV      r1,r6
        0x000009d2:    4620         F      MOV      r0,r4
        0x000009d4:    f000f83c    ..<.    BL       FLASH_Program_Base ; 0xa50
        0x000009d8:    4437        7D      ADD      r7,r7,r6
        0x000009da:    4434        4D      ADD      r4,r4,r6
        0x000009dc:    1bad        ..      SUBS     r5,r5,r6
        0x000009de:    bf00        ..      NOP      
        0x000009e0:    f04f0800    O...    MOV      r8,#0
        0x000009e4:    e00d        ..      B        0xa02 ; FLASH_Program + 118
        0x000009e6:    463a        :F      MOV      r2,r7
        0x000009e8:    f44f7180    O..q    MOV      r1,#0x100
        0x000009ec:    4620         F      MOV      r0,r4
        0x000009ee:    f000f82f    ../.    BL       FLASH_Program_Base ; 0xa50
        0x000009f2:    f5047480    ...t    ADD      r4,r4,#0x100
        0x000009f6:    f5077780    ...w    ADD      r7,r7,#0x100
        0x000009fa:    f1080001    ....    ADD      r0,r8,#1
        0x000009fe:    fa1ff880    ....    UXTH     r8,r0
        0x00000a02:    9800        ..      LDR      r0,[sp,#0]
        0x00000a04:    4580        .E      CMP      r8,r0
        0x00000a06:    dbee        ..      BLT      0x9e6 ; FLASH_Program + 90
        0x00000a08:    f1ba0f00    ....    CMP      r10,#0
        0x00000a0c:    d004        ..      BEQ      0xa18 ; FLASH_Program + 140
        0x00000a0e:    463a        :F      MOV      r2,r7
        0x00000a10:    4651        QF      MOV      r1,r10
        0x00000a12:    4620         F      MOV      r0,r4
        0x00000a14:    f000f81c    ....    BL       FLASH_Program_Base ; 0xa50
        0x00000a18:    2000        .       MOVS     r0,#0
        0x00000a1a:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x00000a1e:    0000        ..      DCW    0
        0x00000a20:    735c2e2e    ..\s    DCD    1935420974
        0x00000a24:    735c6b64    dk\s    DCD    1935436644
        0x00000a28:    735c6372    rc\s    DCD    1935434610
        0x00000a2c:    645c636f    oc\d    DCD    1683776367
        0x00000a30:    65766972    rive    DCD    1702259058
        0x00000a34:    6c665c72    r\fl    DCD    1818647666
        0x00000a38:    2e687361    ash.    DCD    778597217
        0x00000a3c:    00000063    c...    DCD    99
        0x00000a40:    7366666f    offs    DCD    1936090735
        0x00000a44:    303c7465    et<0    DCD    809268325
        0x00000a48:    30303278    x200    DCD    808465016
        0x00000a4c:    00303030    000.    DCD    3158064
    $t
    i.FLASH_Program_Base
    FLASH_Program_Base
        0x00000a50:    e92d43f8    -..C    PUSH     {r3-r9,lr}
        0x00000a54:    4680        .F      MOV      r8,r0
        0x00000a56:    460d        .F      MOV      r5,r1
        0x00000a58:    4616        .F      MOV      r6,r2
        0x00000a5a:    2006        .       MOVS     r0,#6
        0x00000a5c:    9000        ..      STR      r0,[sp,#0]
        0x00000a5e:    1f34        4.      SUBS     r4,r6,#4
        0x00000a60:    4640        @F      MOV      r0,r8
        0x00000a62:    f000ffcd    ....    BL       co_bswap32 ; 0x1a00
        0x00000a66:    4681        .F      MOV      r9,r0
        0x00000a68:    f5b57f80    ....    CMP      r5,#0x100
        0x00000a6c:    d800        ..      BHI      0xa70 ; FLASH_Program_Base + 32
        0x00000a6e:    e004        ..      B        0xa7a ; FLASH_Program_Base + 42
        0x00000a70:    228f        ."      MOVS     r2,#0x8f
        0x00000a72:    a10b        ..      ADR      r1,{pc}+0x2e ; 0xaa0
        0x00000a74:    a012        ..      ADR      r0,{pc}+0x4c ; 0xac0
        0x00000a76:    f000ffa3    ....    BL       __aeabi_assert ; 0x19c0
        0x00000a7a:    6827        'h      LDR      r7,[r4,#0]
        0x00000a7c:    2101        .!      MOVS     r1,#1
        0x00000a7e:    4668        hF      MOV      r0,sp
        0x00000a80:    f001fa56    ..V.    BL       qspi_write ; 0x1f30
        0x00000a84:    f8c49000    ....    STR      r9,[r4,#0]
        0x00000a88:    2002        .       MOVS     r0,#2
        0x00000a8a:    7020         p      STRB     r0,[r4,#0]
        0x00000a8c:    1d29        ).      ADDS     r1,r5,#4
        0x00000a8e:    4620         F      MOV      r0,r4
        0x00000a90:    f001fa4e    ..N.    BL       qspi_write ; 0x1f30
        0x00000a94:    f7ffff68    ..h.    BL       FLASH_Operation_Wait ; 0x968
        0x00000a98:    6027        '`      STR      r7,[r4,#0]
        0x00000a9a:    e8bd83f8    ....    POP      {r3-r9,pc}
    $d
        0x00000a9e:    0000        ..      DCW    0
        0x00000aa0:    735c2e2e    ..\s    DCD    1935420974
        0x00000aa4:    735c6b64    dk\s    DCD    1935436644
        0x00000aa8:    735c6372    rc\s    DCD    1935434610
        0x00000aac:    645c636f    oc\d    DCD    1683776367
        0x00000ab0:    65766972    rive    DCD    1702259058
        0x00000ab4:    6c665c72    r\fl    DCD    1818647666
        0x00000ab8:    2e687361    ash.    DCD    778597217
        0x00000abc:    00000063    c...    DCD    99
        0x00000ac0:    676e656c    leng    DCD    1735288172
        0x00000ac4:    3d3c6874    th<=    DCD    1027369076
        0x00000ac8:    00363532    256.    DCD    3552562
    $t
    i.FLASH_Quad_Enable
    FLASH_Quad_Enable
        0x00000acc:    b51c        ..      PUSH     {r2-r4,lr}
        0x00000ace:    2006        .       MOVS     r0,#6
        0x00000ad0:    9001        ..      STR      r0,[sp,#4]
        0x00000ad2:    a007        ..      ADR      r0,{pc}+0x1e ; 0xaf0
        0x00000ad4:    6800        .h      LDR      r0,[r0,#0]
        0x00000ad6:    9000        ..      STR      r0,[sp,#0]
        0x00000ad8:    2101        .!      MOVS     r1,#1
        0x00000ada:    a801        ..      ADD      r0,sp,#4
        0x00000adc:    f001fa28    ..(.    BL       qspi_write ; 0x1f30
        0x00000ae0:    2103        .!      MOVS     r1,#3
        0x00000ae2:    4668        hF      MOV      r0,sp
        0x00000ae4:    f001fa24    ..$.    BL       qspi_write ; 0x1f30
        0x00000ae8:    f7ffff3e    ..>.    BL       FLASH_Operation_Wait ; 0x968
        0x00000aec:    2000        .       MOVS     r0,#0
        0x00000aee:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x00000af0:    00020001    ....    DCD    131073
    $t
    i.FLASH_Quad_Read
    FLASH_Quad_Read
        0x00000af4:    e92d43f8    -..C    PUSH     {r3-r9,lr}
        0x00000af8:    4604        .F      MOV      r4,r0
        0x00000afa:    460e        .F      MOV      r6,r1
        0x00000afc:    4617        .F      MOV      r7,r2
        0x00000afe:    08b5        ..      LSRS     r5,r6,#2
        0x00000b00:    f0060803    ....    AND      r8,r6,#3
        0x00000b04:    f5b41f00    ....    CMP      r4,#0x200000
        0x00000b08:    d200        ..      BCS      0xb0c ; FLASH_Quad_Read + 24
        0x00000b0a:    e004        ..      B        0xb16 ; FLASH_Quad_Read + 34
        0x00000b0c:    22fe        ."      MOVS     r2,#0xfe
        0x00000b0e:    a119        ..      ADR      r1,{pc}+0x66 ; 0xb74
        0x00000b10:    a020         .      ADR      r0,{pc}+0x84 ; 0xb94
        0x00000b12:    f000ff55    ..U.    BL       __aeabi_assert ; 0x19c0
        0x00000b16:    f5b53f80    ...?    CMP      r5,#0x10000
        0x00000b1a:    d800        ..      BHI      0xb1e ; FLASH_Quad_Read + 42
        0x00000b1c:    e004        ..      B        0xb28 ; FLASH_Quad_Read + 52
        0x00000b1e:    22ff        ."      MOVS     r2,#0xff
        0x00000b20:    a114        ..      ADR      r1,{pc}+0x54 ; 0xb74
        0x00000b22:    a020         .      ADR      r0,{pc}+0x82 ; 0xba4
        0x00000b24:    f000ff4c    ..L.    BL       __aeabi_assert ; 0x19c0
        0x00000b28:    2008        .       MOVS     r0,#8
        0x00000b2a:    4623        #F      MOV      r3,r4
        0x00000b2c:    226b        k"      MOVS     r2,#0x6b
        0x00000b2e:    4629        )F      MOV      r1,r5
        0x00000b30:    9000        ..      STR      r0,[sp,#0]
        0x00000b32:    4638        8F      MOV      r0,r7
        0x00000b34:    f001f8ec    ....    BL       qspi_flash_quad_read_data ; 0x1d10
        0x00000b38:    2004        .       MOVS     r0,#4
        0x00000b3a:    fb007705    ...w    MLA      r7,r0,r5,r7
        0x00000b3e:    fb004405    ...D    MLA      r4,r0,r5,r4
        0x00000b42:    f1b80f00    ....    CMP      r8,#0
        0x00000b46:    d012        ..      BEQ      0xb6e ; FLASH_Quad_Read + 122
        0x00000b48:    2003        .       MOVS     r0,#3
        0x00000b4a:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000b4e:    0c20         .      LSRS     r0,r4,#16
        0x00000b50:    f88d0001    ....    STRB     r0,[sp,#1]
        0x00000b54:    0a20         .      LSRS     r0,r4,#8
        0x00000b56:    f88d0002    ....    STRB     r0,[sp,#2]
        0x00000b5a:    b2e0        ..      UXTB     r0,r4
        0x00000b5c:    f88d0003    ....    STRB     r0,[sp,#3]
        0x00000b60:    2304        .#      MOVS     r3,#4
        0x00000b62:    466a        jF      MOV      r2,sp
        0x00000b64:    4641        AF      MOV      r1,r8
        0x00000b66:    4638        8F      MOV      r0,r7
        0x00000b68:    f001f944    ..D.    BL       qspi_read ; 0x1df4
        0x00000b6c:    bf00        ..      NOP      
        0x00000b6e:    2000        .       MOVS     r0,#0
        0x00000b70:    e8bd83f8    ....    POP      {r3-r9,pc}
    $d
        0x00000b74:    735c2e2e    ..\s    DCD    1935420974
        0x00000b78:    735c6b64    dk\s    DCD    1935436644
        0x00000b7c:    735c6372    rc\s    DCD    1935434610
        0x00000b80:    645c636f    oc\d    DCD    1683776367
        0x00000b84:    65766972    rive    DCD    1702259058
        0x00000b88:    6c665c72    r\fl    DCD    1818647666
        0x00000b8c:    2e687361    ash.    DCD    778597217
        0x00000b90:    00000063    c...    DCD    99
        0x00000b94:    7366666f    offs    DCD    1936090735
        0x00000b98:    303c7465    et<0    DCD    809268325
        0x00000b9c:    30303278    x200    DCD    808465016
        0x00000ba0:    00303030    000.    DCD    3158064
        0x00000ba4:    676e656c    leng    DCD    1735288172
        0x00000ba8:    695f6874    th_i    DCD    1767860340
        0x00000bac:    6f775f6e    n_wo    DCD    1870094190
        0x00000bb0:    3c736472    rds<    DCD    1014195314
        0x00000bb4:    3178303d    =0x1    DCD    829960253
        0x00000bb8:    30303030    0000    DCD    808464432
        0x00000bbc:    00000000    ....    DCD    0
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x00000bc0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000bc2:    4d07        .M      LDR      r5,[pc,#28] ; [0xbe0] = 0x88
        0x00000bc4:    f1050480    ....    ADD      r4,r5,#0x80
        0x00000bc8:    b104        ..      CBZ      r4,0xbcc ; GPIO_IRQHandler + 12
        0x00000bca:    e004        ..      B        0xbd6 ; GPIO_IRQHandler + 22
        0x00000bcc:    22d6        ."      MOVS     r2,#0xd6
        0x00000bce:    a105        ..      ADR      r1,{pc}+0x16 ; 0xbe4
        0x00000bd0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xc04
        0x00000bd2:    f000fef5    ....    BL       __aeabi_assert ; 0x19c0
        0x00000bd6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000bda:    4788        .G      BLX      r1
        0x00000bdc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000bde:    0000        ..      DCW    0
        0x00000be0:    00000088    ....    DCD    136
        0x00000be4:    2e5c2e2e    ..\.    DCD    777793070
        0x00000be8:    2e2e5c2e    .\..    DCD    774790190
        0x00000bec:    464c455c    \ELF    DCD    1179403612
        0x00000bf0:    53425f32    2_BS    DCD    1396858674
        0x00000bf4:    72445c50    P\Dr    DCD    1917082704
        0x00000bf8:    72657669    iver    DCD    1919252073
        0x00000bfc:    746e695c    \int    DCD    1953392988
        0x00000c00:    00632e63    c.c.    DCD    6499939
        0x00000c04:    636e7566    func    DCD    1668183398
        0x00000c08:    203d2120     !=     DCD    540877088
        0x00000c0c:    00000030    0...    DCD    48
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x00000c10:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000c12:    4604        .F      MOV      r4,r0
        0x00000c14:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x00000c18:    4620         F      MOV      r0,r4
        0x00000c1a:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0xc80
        0x00000c1e:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000c22:    2801        .(      CMP      r0,#1
        0x00000c24:    d105        ..      BNE      0xc32 ; HAL_GPIO_Init + 34
        0x00000c26:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x00000c2a:    4620         F      MOV      r0,r4
        0x00000c2c:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0xd90
        0x00000c30:    e009        ..      B        0xc46 ; HAL_GPIO_Init + 54
        0x00000c32:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x00000c36:    4620         F      MOV      r0,r4
        0x00000c38:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0xc48
        0x00000c3c:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00000c40:    4620         F      MOV      r0,r4
        0x00000c42:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0xd2c
        0x00000c46:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x00000c48:    b530        0.      PUSH     {r4,r5,lr}
        0x00000c4a:    460a        .F      MOV      r2,r1
        0x00000c4c:    bf00        ..      NOP      
        0x00000c4e:    4b0b        .K      LDR      r3,[pc,#44] ; [0xc7c] = 0x40007000
        0x00000c50:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x00000c52:    b29b        ..      UXTH     r3,r3
        0x00000c54:    4619        .F      MOV      r1,r3
        0x00000c56:    2a01        .*      CMP      r2,#1
        0x00000c58:    d103        ..      BNE      0xc62 ; HAL_GPIO_SetDebounce + 26
        0x00000c5a:    2301        .#      MOVS     r3,#1
        0x00000c5c:    4083        .@      LSLS     r3,r3,r0
        0x00000c5e:    4319        .C      ORRS     r1,r1,r3
        0x00000c60:    e002        ..      B        0xc68 ; HAL_GPIO_SetDebounce + 32
        0x00000c62:    2301        .#      MOVS     r3,#1
        0x00000c64:    4083        .@      LSLS     r3,r3,r0
        0x00000c66:    4399        .C      BICS     r1,r1,r3
        0x00000c68:    b28b        ..      UXTH     r3,r1
        0x00000c6a:    4c04        .L      LDR      r4,[pc,#16] ; [0xc7c] = 0x40007000
        0x00000c6c:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000c6e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000c72:    4d02        .M      LDR      r5,[pc,#8] ; [0xc7c] = 0x40007000
        0x00000c74:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000c76:    bf00        ..      NOP      
        0x00000c78:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000c7a:    0000        ..      DCW    0
        0x00000c7c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000c80:    b530        0.      PUSH     {r4,r5,lr}
        0x00000c82:    4602        .F      MOV      r2,r0
        0x00000c84:    2a10        .*      CMP      r2,#0x10
        0x00000c86:    da16        ..      BGE      0xcb6 ; HAL_GPIO_SetDir + 54
        0x00000c88:    bf00        ..      NOP      
        0x00000c8a:    4b19        .K      LDR      r3,[pc,#100] ; [0xcf0] = 0x40007000
        0x00000c8c:    685b        [h      LDR      r3,[r3,#4]
        0x00000c8e:    b298        ..      UXTH     r0,r3
        0x00000c90:    bf00        ..      NOP      
        0x00000c92:    2901        .)      CMP      r1,#1
        0x00000c94:    d103        ..      BNE      0xc9e ; HAL_GPIO_SetDir + 30
        0x00000c96:    2301        .#      MOVS     r3,#1
        0x00000c98:    4093        .@      LSLS     r3,r3,r2
        0x00000c9a:    4318        .C      ORRS     r0,r0,r3
        0x00000c9c:    e002        ..      B        0xca4 ; HAL_GPIO_SetDir + 36
        0x00000c9e:    2301        .#      MOVS     r3,#1
        0x00000ca0:    4093        .@      LSLS     r3,r3,r2
        0x00000ca2:    4398        .C      BICS     r0,r0,r3
        0x00000ca4:    b283        ..      UXTH     r3,r0
        0x00000ca6:    4c12        .L      LDR      r4,[pc,#72] ; [0xcf0] = 0x40007000
        0x00000ca8:    6864        dh      LDR      r4,[r4,#4]
        0x00000caa:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000cae:    4d10        .M      LDR      r5,[pc,#64] ; [0xcf0] = 0x40007000
        0x00000cb0:    606c        l`      STR      r4,[r5,#4]
        0x00000cb2:    bf00        ..      NOP      
        0x00000cb4:    e01b        ..      B        0xcee ; HAL_GPIO_SetDir + 110
        0x00000cb6:    bf00        ..      NOP      
        0x00000cb8:    4b0d        .K      LDR      r3,[pc,#52] ; [0xcf0] = 0x40007000
        0x00000cba:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000cbc:    b298        ..      UXTH     r0,r3
        0x00000cbe:    bf00        ..      NOP      
        0x00000cc0:    2901        .)      CMP      r1,#1
        0x00000cc2:    d106        ..      BNE      0xcd2 ; HAL_GPIO_SetDir + 82
        0x00000cc4:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000cc8:    2401        .$      MOVS     r4,#1
        0x00000cca:    fa04f303    ....    LSL      r3,r4,r3
        0x00000cce:    4318        .C      ORRS     r0,r0,r3
        0x00000cd0:    e004        ..      B        0xcdc ; HAL_GPIO_SetDir + 92
        0x00000cd2:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000cd6:    2401        .$      MOVS     r4,#1
        0x00000cd8:    409c        .@      LSLS     r4,r4,r3
        0x00000cda:    43a0        .C      BICS     r0,r0,r4
        0x00000cdc:    b283        ..      UXTH     r3,r0
        0x00000cde:    4c04        .L      LDR      r4,[pc,#16] ; [0xcf0] = 0x40007000
        0x00000ce0:    6924        $i      LDR      r4,[r4,#0x10]
        0x00000ce2:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000ce6:    4d02        .M      LDR      r5,[pc,#8] ; [0xcf0] = 0x40007000
        0x00000ce8:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000cea:    bf00        ..      NOP      
        0x00000cec:    bf00        ..      NOP      
        0x00000cee:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000cf0:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000cf4:    b530        0.      PUSH     {r4,r5,lr}
        0x00000cf6:    460a        .F      MOV      r2,r1
        0x00000cf8:    bf00        ..      NOP      
        0x00000cfa:    4b0b        .K      LDR      r3,[pc,#44] ; [0xd28] = 0x40007000
        0x00000cfc:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000cfe:    b29b        ..      UXTH     r3,r3
        0x00000d00:    4619        .F      MOV      r1,r3
        0x00000d02:    2a01        .*      CMP      r2,#1
        0x00000d04:    d103        ..      BNE      0xd0e ; HAL_GPIO_SetPly + 26
        0x00000d06:    2301        .#      MOVS     r3,#1
        0x00000d08:    4083        .@      LSLS     r3,r3,r0
        0x00000d0a:    4319        .C      ORRS     r1,r1,r3
        0x00000d0c:    e002        ..      B        0xd14 ; HAL_GPIO_SetPly + 32
        0x00000d0e:    2301        .#      MOVS     r3,#1
        0x00000d10:    4083        .@      LSLS     r3,r3,r0
        0x00000d12:    4399        .C      BICS     r1,r1,r3
        0x00000d14:    b28b        ..      UXTH     r3,r1
        0x00000d16:    4c04        .L      LDR      r4,[pc,#16] ; [0xd28] = 0x40007000
        0x00000d18:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000d1a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000d1e:    4d02        .M      LDR      r5,[pc,#8] ; [0xd28] = 0x40007000
        0x00000d20:    63ec        .c      STR      r4,[r5,#0x3c]
        0x00000d22:    bf00        ..      NOP      
        0x00000d24:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000d26:    0000        ..      DCW    0
        0x00000d28:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000d2c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000d2e:    4605        .F      MOV      r5,r0
        0x00000d30:    460c        .F      MOV      r4,r1
        0x00000d32:    b134        4.      CBZ      r4,0xd42 ; HAL_GPIO_TrigType + 22
        0x00000d34:    2c01        .,      CMP      r4,#1
        0x00000d36:    d00d        ..      BEQ      0xd54 ; HAL_GPIO_TrigType + 40
        0x00000d38:    2c02        .,      CMP      r4,#2
        0x00000d3a:    d014        ..      BEQ      0xd66 ; HAL_GPIO_TrigType + 58
        0x00000d3c:    2c03        .,      CMP      r4,#3
        0x00000d3e:    d124        $.      BNE      0xd8a ; HAL_GPIO_TrigType + 94
        0x00000d40:    e01a        ..      B        0xd78 ; HAL_GPIO_TrigType + 76
        0x00000d42:    2100        .!      MOVS     r1,#0
        0x00000d44:    4628        (F      MOV      r0,r5
        0x00000d46:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0xdec
        0x00000d4a:    2100        .!      MOVS     r1,#0
        0x00000d4c:    4628        (F      MOV      r0,r5
        0x00000d4e:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0xcf4
        0x00000d52:    e01a        ..      B        0xd8a ; HAL_GPIO_TrigType + 94
        0x00000d54:    2100        .!      MOVS     r1,#0
        0x00000d56:    4628        (F      MOV      r0,r5
        0x00000d58:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0xdec
        0x00000d5c:    2101        .!      MOVS     r1,#1
        0x00000d5e:    4628        (F      MOV      r0,r5
        0x00000d60:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0xcf4
        0x00000d64:    e011        ..      B        0xd8a ; HAL_GPIO_TrigType + 94
        0x00000d66:    2101        .!      MOVS     r1,#1
        0x00000d68:    4628        (F      MOV      r0,r5
        0x00000d6a:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0xdec
        0x00000d6e:    2100        .!      MOVS     r1,#0
        0x00000d70:    4628        (F      MOV      r0,r5
        0x00000d72:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0xcf4
        0x00000d76:    e008        ..      B        0xd8a ; HAL_GPIO_TrigType + 94
        0x00000d78:    2101        .!      MOVS     r1,#1
        0x00000d7a:    4628        (F      MOV      r0,r5
        0x00000d7c:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0xdec
        0x00000d80:    2101        .!      MOVS     r1,#1
        0x00000d82:    4628        (F      MOV      r0,r5
        0x00000d84:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0xcf4
        0x00000d88:    bf00        ..      NOP      
        0x00000d8a:    bf00        ..      NOP      
        0x00000d8c:    bd70        p.      POP      {r4-r6,pc}
        0x00000d8e:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000d90:    b570        p.      PUSH     {r4-r6,lr}
        0x00000d92:    4605        .F      MOV      r5,r0
        0x00000d94:    460e        .F      MOV      r6,r1
        0x00000d96:    2d10        .-      CMP      r5,#0x10
        0x00000d98:    da10        ..      BGE      0xdbc ; HAL_GPIO_WritePin + 44
        0x00000d9a:    bf00        ..      NOP      
        0x00000d9c:    4812        .H      LDR      r0,[pc,#72] ; [0xde8] = 0x40007000
        0x00000d9e:    6800        .h      LDR      r0,[r0,#0]
        0x00000da0:    b284        ..      UXTH     r4,r0
        0x00000da2:    bf00        ..      NOP      
        0x00000da4:    b91e        ..      CBNZ     r6,0xdae ; HAL_GPIO_WritePin + 30
        0x00000da6:    2001        .       MOVS     r0,#1
        0x00000da8:    40a8        .@      LSLS     r0,r0,r5
        0x00000daa:    4384        .C      BICS     r4,r4,r0
        0x00000dac:    e002        ..      B        0xdb4 ; HAL_GPIO_WritePin + 36
        0x00000dae:    2001        .       MOVS     r0,#1
        0x00000db0:    40a8        .@      LSLS     r0,r0,r5
        0x00000db2:    4304        .C      ORRS     r4,r4,r0
        0x00000db4:    b2a0        ..      UXTH     r0,r4
        0x00000db6:    f000ff4b    ..K.    BL       gpio_portadataregister_setf ; 0x1c50
        0x00000dba:    e014        ..      B        0xde6 ; HAL_GPIO_WritePin + 86
        0x00000dbc:    bf00        ..      NOP      
        0x00000dbe:    480a        .H      LDR      r0,[pc,#40] ; [0xde8] = 0x40007000
        0x00000dc0:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000dc2:    b284        ..      UXTH     r4,r0
        0x00000dc4:    bf00        ..      NOP      
        0x00000dc6:    b92e        ..      CBNZ     r6,0xdd4 ; HAL_GPIO_WritePin + 68
        0x00000dc8:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000dcc:    2101        .!      MOVS     r1,#1
        0x00000dce:    4081        .@      LSLS     r1,r1,r0
        0x00000dd0:    438c        .C      BICS     r4,r4,r1
        0x00000dd2:    e005        ..      B        0xde0 ; HAL_GPIO_WritePin + 80
        0x00000dd4:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000dd8:    2101        .!      MOVS     r1,#1
        0x00000dda:    fa01f000    ....    LSL      r0,r1,r0
        0x00000dde:    4304        .C      ORRS     r4,r4,r0
        0x00000de0:    b2a0        ..      UXTH     r0,r4
        0x00000de2:    f000ff3f    ..?.    BL       gpio_portbdataregister_setf ; 0x1c64
        0x00000de6:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000de8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000dec:    b530        0.      PUSH     {r4,r5,lr}
        0x00000dee:    460a        .F      MOV      r2,r1
        0x00000df0:    bf00        ..      NOP      
        0x00000df2:    4b0b        .K      LDR      r3,[pc,#44] ; [0xe20] = 0x40007000
        0x00000df4:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000df6:    b29b        ..      UXTH     r3,r3
        0x00000df8:    4619        .F      MOV      r1,r3
        0x00000dfa:    2a01        .*      CMP      r2,#1
        0x00000dfc:    d103        ..      BNE      0xe06 ; HAL_GPIO_setIrqLevel + 26
        0x00000dfe:    2301        .#      MOVS     r3,#1
        0x00000e00:    4083        .@      LSLS     r3,r3,r0
        0x00000e02:    4319        .C      ORRS     r1,r1,r3
        0x00000e04:    e002        ..      B        0xe0c ; HAL_GPIO_setIrqLevel + 32
        0x00000e06:    2301        .#      MOVS     r3,#1
        0x00000e08:    4083        .@      LSLS     r3,r3,r0
        0x00000e0a:    4399        .C      BICS     r1,r1,r3
        0x00000e0c:    b28b        ..      UXTH     r3,r1
        0x00000e0e:    4c04        .L      LDR      r4,[pc,#16] ; [0xe20] = 0x40007000
        0x00000e10:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000e12:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000e16:    4d02        .M      LDR      r5,[pc,#8] ; [0xe20] = 0x40007000
        0x00000e18:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000e1a:    bf00        ..      NOP      
        0x00000e1c:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000e1e:    0000        ..      DCW    0
        0x00000e20:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000e24:    bf00        ..      NOP      
        0x00000e26:    4904        .I      LDR      r1,[pc,#16] ; [0xe38] = 0x40020000
        0x00000e28:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000e2a:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000e2e:    4a02        .J      LDR      r2,[pc,#8] ; [0xe38] = 0x40020000
        0x00000e30:    6111        .a      STR      r1,[r2,#0x10]
        0x00000e32:    bf00        ..      NOP      
        0x00000e34:    4770        pG      BX       lr
    $d
        0x00000e36:    0000        ..      DCW    0
        0x00000e38:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000e3c:    b510        ..      PUSH     {r4,lr}
        0x00000e3e:    4604        .F      MOV      r4,r0
        0x00000e40:    1e60        `.      SUBS     r0,r4,#1
        0x00000e42:    280f        .(      CMP      r0,#0xf
        0x00000e44:    dc00        ..      BGT      0xe48 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000e46:    e004        ..      B        0xe52 ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000e48:    2225        %"      MOVS     r2,#0x25
        0x00000e4a:    a108        ..      ADR      r1,{pc}+0x22 ; 0xe6c
        0x00000e4c:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xe8c
        0x00000e4e:    f000fdb7    ....    BL       __aeabi_assert ; 0x19c0
        0x00000e52:    1e61        a.      SUBS     r1,r4,#1
        0x00000e54:    b2c8        ..      UXTB     r0,r1
        0x00000e56:    4913        .I      LDR      r1,[pc,#76] ; [0xea4] = 0x40020000
        0x00000e58:    6849        Ih      LDR      r1,[r1,#4]
        0x00000e5a:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000e5e:    4a11        .J      LDR      r2,[pc,#68] ; [0xea4] = 0x40020000
        0x00000e60:    6051        Q`      STR      r1,[r2,#4]
        0x00000e62:    bf00        ..      NOP      
        0x00000e64:    2001        .       MOVS     r0,#1
        0x00000e66:    f001f8b1    ....    BL       sysc_awo_div_update_set ; 0x1fcc
        0x00000e6a:    bd10        ..      POP      {r4,pc}
    $d
        0x00000e6c:    735c2e2e    ..\s    DCD    1935420974
        0x00000e70:    735c6b64    dk\s    DCD    1935436644
        0x00000e74:    735c6372    rc\s    DCD    1935434610
        0x00000e78:    645c636f    oc\d    DCD    1683776367
        0x00000e7c:    65766972    rive    DCD    1702259058
        0x00000e80:    79735c72    r\sy    DCD    2037603442
        0x00000e84:    6e6f6373    scon    DCD    1852793715
        0x00000e88:    0000632e    .c..    DCD    25390
        0x00000e8c:    62686128    (ahb    DCD    1651007784
        0x00000e90:    7669645f    _div    DCD    1986618463
        0x00000e94:    72656469    ider    DCD    1919247465
        0x00000e98:    3c29312d    -1)<    DCD    1009332525
        0x00000e9c:    6678303d    =0xf    DCD    1719152701
        0x00000ea0:    00000000    ....    DCD    0
        0x00000ea4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000ea8:    b510        ..      PUSH     {r4,lr}
        0x00000eaa:    4604        .F      MOV      r4,r0
        0x00000eac:    1e60        `.      SUBS     r0,r4,#1
        0x00000eae:    280f        .(      CMP      r0,#0xf
        0x00000eb0:    dc00        ..      BGT      0xeb4 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000eb2:    e004        ..      B        0xebe ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000eb4:    222c        ,"      MOVS     r2,#0x2c
        0x00000eb6:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xee0
        0x00000eb8:    a011        ..      ADR      r0,{pc}+0x48 ; 0xf00
        0x00000eba:    f000fd81    ....    BL       __aeabi_assert ; 0x19c0
        0x00000ebe:    1e61        a.      SUBS     r1,r4,#1
        0x00000ec0:    b2c8        ..      UXTB     r0,r1
        0x00000ec2:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ec6:    6849        Ih      LDR      r1,[r1,#4]
        0x00000ec8:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000ecc:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000ed0:    6051        Q`      STR      r1,[r2,#4]
        0x00000ed2:    bf00        ..      NOP      
        0x00000ed4:    2001        .       MOVS     r0,#1
        0x00000ed6:    0781        ..      LSLS     r1,r0,#30
        0x00000ed8:    6008        .`      STR      r0,[r1,#0]
        0x00000eda:    bf00        ..      NOP      
        0x00000edc:    bd10        ..      POP      {r4,pc}
    $d
        0x00000ede:    0000        ..      DCW    0
        0x00000ee0:    735c2e2e    ..\s    DCD    1935420974
        0x00000ee4:    735c6b64    dk\s    DCD    1935436644
        0x00000ee8:    735c6372    rc\s    DCD    1935434610
        0x00000eec:    645c636f    oc\d    DCD    1683776367
        0x00000ef0:    65766972    rive    DCD    1702259058
        0x00000ef4:    79735c72    r\sy    DCD    2037603442
        0x00000ef8:    6e6f6373    scon    DCD    1852793715
        0x00000efc:    0000632e    .c..    DCD    25390
        0x00000f00:    62706128    (apb    DCD    1651532072
        0x00000f04:    69645f30    0_di    DCD    1768185648
        0x00000f08:    65646976    vide    DCD    1701079414
        0x00000f0c:    29312d72    r-1)    DCD    691088754
        0x00000f10:    78303d3c    <=0x    DCD    2016427324
        0x00000f14:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000f18:    b510        ..      PUSH     {r4,lr}
        0x00000f1a:    4604        .F      MOV      r4,r0
        0x00000f1c:    1e60        `.      SUBS     r0,r4,#1
        0x00000f1e:    280f        .(      CMP      r0,#0xf
        0x00000f20:    dc00        ..      BGT      0xf24 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000f22:    e004        ..      B        0xf2e ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000f24:    2234        4"      MOVS     r2,#0x34
        0x00000f26:    a108        ..      ADR      r1,{pc}+0x22 ; 0xf48
        0x00000f28:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xf68
        0x00000f2a:    f000fd49    ..I.    BL       __aeabi_assert ; 0x19c0
        0x00000f2e:    1e61        a.      SUBS     r1,r4,#1
        0x00000f30:    b2c8        ..      UXTB     r0,r1
        0x00000f32:    4913        .I      LDR      r1,[pc,#76] ; [0xf80] = 0x40020000
        0x00000f34:    6849        Ih      LDR      r1,[r1,#4]
        0x00000f36:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000f3a:    4a11        .J      LDR      r2,[pc,#68] ; [0xf80] = 0x40020000
        0x00000f3c:    6051        Q`      STR      r1,[r2,#4]
        0x00000f3e:    bf00        ..      NOP      
        0x00000f40:    2002        .       MOVS     r0,#2
        0x00000f42:    f001f843    ..C.    BL       sysc_awo_div_update_set ; 0x1fcc
        0x00000f46:    bd10        ..      POP      {r4,pc}
    $d
        0x00000f48:    735c2e2e    ..\s    DCD    1935420974
        0x00000f4c:    735c6b64    dk\s    DCD    1935436644
        0x00000f50:    735c6372    rc\s    DCD    1935434610
        0x00000f54:    645c636f    oc\d    DCD    1683776367
        0x00000f58:    65766972    rive    DCD    1702259058
        0x00000f5c:    79735c72    r\sy    DCD    2037603442
        0x00000f60:    6e6f6373    scon    DCD    1852793715
        0x00000f64:    0000632e    .c..    DCD    25390
        0x00000f68:    62706128    (apb    DCD    1651532072
        0x00000f6c:    69645f31    1_di    DCD    1768185649
        0x00000f70:    65646976    vide    DCD    1701079414
        0x00000f74:    29312d72    r-1)    DCD    691088754
        0x00000f78:    78303d3c    <=0x    DCD    2016427324
        0x00000f7c:    00000066    f...    DCD    102
        0x00000f80:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000f84:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f86:    4605        .F      MOV      r5,r0
        0x00000f88:    460c        .F      MOV      r4,r1
        0x00000f8a:    1e60        `.      SUBS     r0,r4,#1
        0x00000f8c:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000f90:    da00        ..      BGE      0xf94 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000f92:    e004        ..      B        0xf9e ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000f94:    223c        <"      MOVS     r2,#0x3c
        0x00000f96:    a112        ..      ADR      r1,{pc}+0x4a ; 0xfe0
        0x00000f98:    a019        ..      ADR      r0,{pc}+0x68 ; 0x1000
        0x00000f9a:    f000fd11    ....    BL       __aeabi_assert ; 0x19c0
        0x00000f9e:    2d01        .-      CMP      r5,#1
        0x00000fa0:    dc00        ..      BGT      0xfa4 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000fa2:    e004        ..      B        0xfae ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000fa4:    223d        ="      MOVS     r2,#0x3d
        0x00000fa6:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xfe0
        0x00000fa8:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x1018
        0x00000faa:    f000fd09    ....    BL       __aeabi_assert ; 0x19c0
        0x00000fae:    b935        5.      CBNZ     r5,0xfbe ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000fb0:    2000        .       MOVS     r0,#0
        0x00000fb2:    f001f811    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1fd8
        0x00000fb6:    2004        .       MOVS     r0,#4
        0x00000fb8:    f001f808    ....    BL       sysc_awo_div_update_set ; 0x1fcc
        0x00000fbc:    e00e        ..      B        0xfdc ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000fbe:    2c02        .,      CMP      r4,#2
        0x00000fc0:    db00        ..      BLT      0xfc4 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000fc2:    e004        ..      B        0xfce ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000fc4:    2247        G"      MOVS     r2,#0x47
        0x00000fc6:    a106        ..      ADR      r1,{pc}+0x1a ; 0xfe0
        0x00000fc8:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x1034
        0x00000fca:    f000fcf9    ....    BL       __aeabi_assert ; 0x19c0
        0x00000fce:    1e61        a.      SUBS     r1,r4,#1
        0x00000fd0:    b288        ..      UXTH     r0,r1
        0x00000fd2:    f001f801    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1fd8
        0x00000fd6:    2004        .       MOVS     r0,#4
        0x00000fd8:    f000fff8    ....    BL       sysc_awo_div_update_set ; 0x1fcc
        0x00000fdc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000fde:    0000        ..      DCW    0
        0x00000fe0:    735c2e2e    ..\s    DCD    1935420974
        0x00000fe4:    735c6b64    dk\s    DCD    1935436644
        0x00000fe8:    735c6372    rc\s    DCD    1935434610
        0x00000fec:    645c636f    oc\d    DCD    1683776367
        0x00000ff0:    65766972    rive    DCD    1702259058
        0x00000ff4:    79735c72    r\sy    DCD    2037603442
        0x00000ff8:    6e6f6373    scon    DCD    1852793715
        0x00000ffc:    0000632e    .c..    DCD    25390
        0x00001000:    63747228    (rtc    DCD    1668575784
        0x00001004:    7669645f    _div    DCD    1986618463
        0x00001008:    72656469    ider    DCD    1919247465
        0x0000100c:    3c29312d    -1)<    DCD    1009332525
        0x00001010:    3178303d    =0x1    DCD    829960253
        0x00001014:    00666666    fff.    DCD    6710886
        0x00001018:    5f637472    rtc_    DCD    1600353394
        0x0000101c:    3c637273    src<    DCD    1013150323
        0x00001020:    6374723d    =rtc    DCD    1668575805
        0x00001024:    5f6b6c63    clk_    DCD    1600875619
        0x00001028:    6d6f7266    from    DCD    1836020326
        0x0000102c:    6268615f    _ahb    DCD    1651007839
        0x00001030:    00000000    ....    DCD    0
        0x00001034:    5f637472    rtc_    DCD    1600353394
        0x00001038:    69766964    divi    DCD    1769367908
        0x0000103c:    3e726564    der>    DCD    1047684452
        0x00001040:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00001044:    b570        p.      PUSH     {r4-r6,lr}
        0x00001046:    4d07        .M      LDR      r5,[pc,#28] ; [0x1064] = 0x88
        0x00001048:    f1050460    ..`.    ADD      r4,r5,#0x60
        0x0000104c:    b104        ..      CBZ      r4,0x1050 ; I2C0_IRQHandler + 12
        0x0000104e:    e004        ..      B        0x105a ; I2C0_IRQHandler + 22
        0x00001050:    22ae        ."      MOVS     r2,#0xae
        0x00001052:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1068
        0x00001054:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1088
        0x00001056:    f000fcb3    ....    BL       __aeabi_assert ; 0x19c0
        0x0000105a:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000105e:    4788        .G      BLX      r1
        0x00001060:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001062:    0000        ..      DCW    0
        0x00001064:    00000088    ....    DCD    136
        0x00001068:    2e5c2e2e    ..\.    DCD    777793070
        0x0000106c:    2e2e5c2e    .\..    DCD    774790190
        0x00001070:    464c455c    \ELF    DCD    1179403612
        0x00001074:    53425f32    2_BS    DCD    1396858674
        0x00001078:    72445c50    P\Dr    DCD    1917082704
        0x0000107c:    72657669    iver    DCD    1919252073
        0x00001080:    746e695c    \int    DCD    1953392988
        0x00001084:    00632e63    c.c.    DCD    6499939
        0x00001088:    636e7566    func    DCD    1668183398
        0x0000108c:    203d2120     !=     DCD    540877088
        0x00001090:    00000030    0...    DCD    48
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00001094:    b570        p.      PUSH     {r4-r6,lr}
        0x00001096:    4d07        .M      LDR      r5,[pc,#28] ; [0x10b4] = 0x88
        0x00001098:    f1050468    ..h.    ADD      r4,r5,#0x68
        0x0000109c:    b104        ..      CBZ      r4,0x10a0 ; I2C1_IRQHandler + 12
        0x0000109e:    e004        ..      B        0x10aa ; I2C1_IRQHandler + 22
        0x000010a0:    22b8        ."      MOVS     r2,#0xb8
        0x000010a2:    a105        ..      ADR      r1,{pc}+0x16 ; 0x10b8
        0x000010a4:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x10d8
        0x000010a6:    f000fc8b    ....    BL       __aeabi_assert ; 0x19c0
        0x000010aa:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000010ae:    4788        .G      BLX      r1
        0x000010b0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000010b2:    0000        ..      DCW    0
        0x000010b4:    00000088    ....    DCD    136
        0x000010b8:    2e5c2e2e    ..\.    DCD    777793070
        0x000010bc:    2e2e5c2e    .\..    DCD    774790190
        0x000010c0:    464c455c    \ELF    DCD    1179403612
        0x000010c4:    53425f32    2_BS    DCD    1396858674
        0x000010c8:    72445c50    P\Dr    DCD    1917082704
        0x000010cc:    72657669    iver    DCD    1919252073
        0x000010d0:    746e695c    \int    DCD    1953392988
        0x000010d4:    00632e63    c.c.    DCD    6499939
        0x000010d8:    636e7566    func    DCD    1668183398
        0x000010dc:    203d2120     !=     DCD    540877088
        0x000010e0:    00000030    0...    DCD    48
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x000010e4:    b570        p.      PUSH     {r4-r6,lr}
        0x000010e6:    4d07        .M      LDR      r5,[pc,#28] ; [0x1104] = 0x88
        0x000010e8:    f1050488    ....    ADD      r4,r5,#0x88
        0x000010ec:    b104        ..      CBZ      r4,0x10f0 ; I2S_IRQHandler + 12
        0x000010ee:    e004        ..      B        0x10fa ; I2S_IRQHandler + 22
        0x000010f0:    22e0        ."      MOVS     r2,#0xe0
        0x000010f2:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1108
        0x000010f4:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1128
        0x000010f6:    f000fc63    ..c.    BL       __aeabi_assert ; 0x19c0
        0x000010fa:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000010fe:    4788        .G      BLX      r1
        0x00001100:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001102:    0000        ..      DCW    0
        0x00001104:    00000088    ....    DCD    136
        0x00001108:    2e5c2e2e    ..\.    DCD    777793070
        0x0000110c:    2e2e5c2e    .\..    DCD    774790190
        0x00001110:    464c455c    \ELF    DCD    1179403612
        0x00001114:    53425f32    2_BS    DCD    1396858674
        0x00001118:    72445c50    P\Dr    DCD    1917082704
        0x0000111c:    72657669    iver    DCD    1919252073
        0x00001120:    746e695c    \int    DCD    1953392988
        0x00001124:    00632e63    c.c.    DCD    6499939
        0x00001128:    636e7566    func    DCD    1668183398
        0x0000112c:    203d2120     !=     DCD    540877088
        0x00001130:    00000030    0...    DCD    48
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00001134:    b570        p.      PUSH     {r4-r6,lr}
        0x00001136:    4d07        .M      LDR      r5,[pc,#28] ; [0x1154] = 0x88
        0x00001138:    f1050420    .. .    ADD      r4,r5,#0x20
        0x0000113c:    b104        ..      CBZ      r4,0x1140 ; QSPI_IRQHandler + 12
        0x0000113e:    e004        ..      B        0x114a ; QSPI_IRQHandler + 22
        0x00001140:    2259        Y"      MOVS     r2,#0x59
        0x00001142:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1158
        0x00001144:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1178
        0x00001146:    f000fc3b    ..;.    BL       __aeabi_assert ; 0x19c0
        0x0000114a:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000114e:    4788        .G      BLX      r1
        0x00001150:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001152:    0000        ..      DCW    0
        0x00001154:    00000088    ....    DCD    136
        0x00001158:    2e5c2e2e    ..\.    DCD    777793070
        0x0000115c:    2e2e5c2e    .\..    DCD    774790190
        0x00001160:    464c455c    \ELF    DCD    1179403612
        0x00001164:    53425f32    2_BS    DCD    1396858674
        0x00001168:    72445c50    P\Dr    DCD    1917082704
        0x0000116c:    72657669    iver    DCD    1919252073
        0x00001170:    746e695c    \int    DCD    1953392988
        0x00001174:    00632e63    c.c.    DCD    6499939
        0x00001178:    636e7566    func    DCD    1668183398
        0x0000117c:    203d2120     !=     DCD    540877088
        0x00001180:    00000030    0...    DCD    48
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00001184:    b570        p.      PUSH     {r4-r6,lr}
        0x00001186:    4d07        .M      LDR      r5,[pc,#28] ; [0x11a4] = 0x88
        0x00001188:    f1050410    ....    ADD      r4,r5,#0x10
        0x0000118c:    b104        ..      CBZ      r4,0x1190 ; RTC_IRQHandler + 12
        0x0000118e:    e004        ..      B        0x119a ; RTC_IRQHandler + 22
        0x00001190:    2243        C"      MOVS     r2,#0x43
        0x00001192:    a105        ..      ADR      r1,{pc}+0x16 ; 0x11a8
        0x00001194:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x11c8
        0x00001196:    f000fc13    ....    BL       __aeabi_assert ; 0x19c0
        0x0000119a:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000119e:    4788        .G      BLX      r1
        0x000011a0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000011a2:    0000        ..      DCW    0
        0x000011a4:    00000088    ....    DCD    136
        0x000011a8:    2e5c2e2e    ..\.    DCD    777793070
        0x000011ac:    2e2e5c2e    .\..    DCD    774790190
        0x000011b0:    464c455c    \ELF    DCD    1179403612
        0x000011b4:    53425f32    2_BS    DCD    1396858674
        0x000011b8:    72445c50    P\Dr    DCD    1917082704
        0x000011bc:    72657669    iver    DCD    1919252073
        0x000011c0:    746e695c    \int    DCD    1953392988
        0x000011c4:    00632e63    c.c.    DCD    6499939
        0x000011c8:    636e7566    func    DCD    1668183398
        0x000011cc:    203d2120     !=     DCD    540877088
        0x000011d0:    00000030    0...    DCD    48
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000011d4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000011d8:    4604        .F      MOV      r4,r0
        0x000011da:    460d        .F      MOV      r5,r1
        0x000011dc:    4616        .F      MOV      r6,r2
        0x000011de:    bf00        ..      NOP      
        0x000011e0:    480d        .H      LDR      r0,[pc,#52] ; [0x1218] = 0x20000008
        0x000011e2:    7800        .x      LDRB     r0,[r0,#0]
        0x000011e4:    b908        ..      CBNZ     r0,0x11ea ; SEGGER_RTT_Write + 22
        0x000011e6:    f000fa37    ..7.    BL       _DoInit ; 0x1658
        0x000011ea:    bf00        ..      NOP      
        0x000011ec:    f3ef8011    ....    MRS      r0,BASEPRI
        0x000011f0:    4607        .F      MOV      r7,r0
        0x000011f2:    2020                MOVS     r0,#0x20
        0x000011f4:    f3808811    ....    MSR      BASEPRI,r0
        0x000011f8:    bf00        ..      NOP      
        0x000011fa:    bf00        ..      NOP      
        0x000011fc:    4632        2F      MOV      r2,r6
        0x000011fe:    4629        )F      MOV      r1,r5
        0x00001200:    4620         F      MOV      r0,r4
        0x00001202:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0x121c
        0x00001206:    4680        .F      MOV      r8,r0
        0x00001208:    b2f8        ..      UXTB     r0,r7
        0x0000120a:    f3808811    ....    MSR      BASEPRI,r0
        0x0000120e:    bf00        ..      NOP      
        0x00001210:    bf00        ..      NOP      
        0x00001212:    4640        @F      MOV      r0,r8
        0x00001214:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001218:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x0000121c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001220:    4607        .F      MOV      r7,r0
        0x00001222:    4688        .F      MOV      r8,r1
        0x00001224:    4616        .F      MOV      r6,r2
        0x00001226:    46c2        .F      MOV      r10,r8
        0x00001228:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x0000122c:    481b        .H      LDR      r0,[pc,#108] ; [0x129c] = 0x20000020
        0x0000122e:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x00001232:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x00001236:    b120         .      CBZ      r0,0x1242 ; SEGGER_RTT_WriteNoLock + 38
        0x00001238:    2801        .(      CMP      r0,#1
        0x0000123a:    d011        ..      BEQ      0x1260 ; SEGGER_RTT_WriteNoLock + 68
        0x0000123c:    2802        .(      CMP      r0,#2
        0x0000123e:    d126        &.      BNE      0x128e ; SEGGER_RTT_WriteNoLock + 114
        0x00001240:    e01e        ..      B        0x1280 ; SEGGER_RTT_WriteNoLock + 100
        0x00001242:    4648        HF      MOV      r0,r9
        0x00001244:    f000fa40    ..@.    BL       _GetAvailWriteSpace ; 0x16c8
        0x00001248:    4605        .F      MOV      r5,r0
        0x0000124a:    42b5        .B      CMP      r5,r6
        0x0000124c:    d201        ..      BCS      0x1252 ; SEGGER_RTT_WriteNoLock + 54
        0x0000124e:    2400        .$      MOVS     r4,#0
        0x00001250:    e005        ..      B        0x125e ; SEGGER_RTT_WriteNoLock + 66
        0x00001252:    4634        4F      MOV      r4,r6
        0x00001254:    4632        2F      MOV      r2,r6
        0x00001256:    4651        QF      MOV      r1,r10
        0x00001258:    4648        HF      MOV      r0,r9
        0x0000125a:    f000fb8a    ....    BL       _WriteNoCheck ; 0x1972
        0x0000125e:    e018        ..      B        0x1292 ; SEGGER_RTT_WriteNoLock + 118
        0x00001260:    4648        HF      MOV      r0,r9
        0x00001262:    f000fa31    ..1.    BL       _GetAvailWriteSpace ; 0x16c8
        0x00001266:    4605        .F      MOV      r5,r0
        0x00001268:    42b5        .B      CMP      r5,r6
        0x0000126a:    d201        ..      BCS      0x1270 ; SEGGER_RTT_WriteNoLock + 84
        0x0000126c:    4628        (F      MOV      r0,r5
        0x0000126e:    e000        ..      B        0x1272 ; SEGGER_RTT_WriteNoLock + 86
        0x00001270:    4630        0F      MOV      r0,r6
        0x00001272:    4604        .F      MOV      r4,r0
        0x00001274:    4622        "F      MOV      r2,r4
        0x00001276:    4651        QF      MOV      r1,r10
        0x00001278:    4648        HF      MOV      r0,r9
        0x0000127a:    f000fb7a    ..z.    BL       _WriteNoCheck ; 0x1972
        0x0000127e:    e008        ..      B        0x1292 ; SEGGER_RTT_WriteNoLock + 118
        0x00001280:    4632        2F      MOV      r2,r6
        0x00001282:    4651        QF      MOV      r1,r10
        0x00001284:    4648        HF      MOV      r0,r9
        0x00001286:    f000fb3b    ..;.    BL       _WriteBlocking ; 0x1900
        0x0000128a:    4604        .F      MOV      r4,r0
        0x0000128c:    e001        ..      B        0x1292 ; SEGGER_RTT_WriteNoLock + 118
        0x0000128e:    2400        .$      MOVS     r4,#0
        0x00001290:    bf00        ..      NOP      
        0x00001292:    bf00        ..      NOP      
        0x00001294:    4620         F      MOV      r0,r4
        0x00001296:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x0000129a:    0000        ..      DCW    0
        0x0000129c:    20000020     ..     DCD    536870944
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x000012a0:    b40f        ..      PUSH     {r0-r3}
        0x000012a2:    b538        8.      PUSH     {r3-r5,lr}
        0x000012a4:    4604        .F      MOV      r4,r0
        0x000012a6:    a806        ..      ADD      r0,sp,#0x18
        0x000012a8:    9000        ..      STR      r0,[sp,#0]
        0x000012aa:    466a        jF      MOV      r2,sp
        0x000012ac:    4620         F      MOV      r0,r4
        0x000012ae:    9905        ..      LDR      r1,[sp,#0x14]
        0x000012b0:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0x12c2
        0x000012b4:    4605        .F      MOV      r5,r0
        0x000012b6:    2000        .       MOVS     r0,#0
        0x000012b8:    9000        ..      STR      r0,[sp,#0]
        0x000012ba:    4628        (F      MOV      r0,r5
        0x000012bc:    bc38        8.      POP      {r3-r5}
        0x000012be:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x000012c2:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x000012c6:    b099        ..      SUB      sp,sp,#0x64
        0x000012c8:    4682        .F      MOV      r10,r0
        0x000012ca:    460d        .F      MOV      r5,r1
        0x000012cc:    4614        .F      MOV      r4,r2
        0x000012ce:    a803        ..      ADD      r0,sp,#0xc
        0x000012d0:    9014        ..      STR      r0,[sp,#0x50]
        0x000012d2:    2040        @       MOVS     r0,#0x40
        0x000012d4:    9015        ..      STR      r0,[sp,#0x54]
        0x000012d6:    2000        .       MOVS     r0,#0
        0x000012d8:    9016        ..      STR      r0,[sp,#0x58]
        0x000012da:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x000012de:    9017        ..      STR      r0,[sp,#0x5c]
        0x000012e0:    bf00        ..      NOP      
        0x000012e2:    782e        .x      LDRB     r6,[r5,#0]
        0x000012e4:    1c6d        m.      ADDS     r5,r5,#1
        0x000012e6:    b906        ..      CBNZ     r6,0x12ea ; SEGGER_RTT_vprintf + 40
        0x000012e8:    e0dd        ..      B        0x14a6 ; SEGGER_RTT_vprintf + 484
        0x000012ea:    2e25        %.      CMP      r6,#0x25
        0x000012ec:    d179        y.      BNE      0x13e2 ; SEGGER_RTT_vprintf + 288
        0x000012ee:    2700        .'      MOVS     r7,#0
        0x000012f0:    f04f0901    O...    MOV      r9,#1
        0x000012f4:    bf00        ..      NOP      
        0x000012f6:    782e        .x      LDRB     r6,[r5,#0]
        0x000012f8:    2e23        #.      CMP      r6,#0x23
        0x000012fa:    d012        ..      BEQ      0x1322 ; SEGGER_RTT_vprintf + 96
        0x000012fc:    2e2b        +.      CMP      r6,#0x2b
        0x000012fe:    d00c        ..      BEQ      0x131a ; SEGGER_RTT_vprintf + 88
        0x00001300:    2e2d        -.      CMP      r6,#0x2d
        0x00001302:    d002        ..      BEQ      0x130a ; SEGGER_RTT_vprintf + 72
        0x00001304:    2e30        0.      CMP      r6,#0x30
        0x00001306:    d110        ..      BNE      0x132a ; SEGGER_RTT_vprintf + 104
        0x00001308:    e003        ..      B        0x1312 ; SEGGER_RTT_vprintf + 80
        0x0000130a:    f0470701    G...    ORR      r7,r7,#1
        0x0000130e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001310:    e00e        ..      B        0x1330 ; SEGGER_RTT_vprintf + 110
        0x00001312:    f0470702    G...    ORR      r7,r7,#2
        0x00001316:    1c6d        m.      ADDS     r5,r5,#1
        0x00001318:    e00a        ..      B        0x1330 ; SEGGER_RTT_vprintf + 110
        0x0000131a:    f0470704    G...    ORR      r7,r7,#4
        0x0000131e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001320:    e006        ..      B        0x1330 ; SEGGER_RTT_vprintf + 110
        0x00001322:    f0470708    G...    ORR      r7,r7,#8
        0x00001326:    1c6d        m.      ADDS     r5,r5,#1
        0x00001328:    e002        ..      B        0x1330 ; SEGGER_RTT_vprintf + 110
        0x0000132a:    f04f0900    O...    MOV      r9,#0
        0x0000132e:    bf00        ..      NOP      
        0x00001330:    bf00        ..      NOP      
        0x00001332:    f1b90f00    ....    CMP      r9,#0
        0x00001336:    d1de        ..      BNE      0x12f6 ; SEGGER_RTT_vprintf + 52
        0x00001338:    f04f0800    O...    MOV      r8,#0
        0x0000133c:    bf00        ..      NOP      
        0x0000133e:    782e        .x      LDRB     r6,[r5,#0]
        0x00001340:    2e30        0.      CMP      r6,#0x30
        0x00001342:    db01        ..      BLT      0x1348 ; SEGGER_RTT_vprintf + 134
        0x00001344:    2e39        9.      CMP      r6,#0x39
        0x00001346:    dd00        ..      BLE      0x134a ; SEGGER_RTT_vprintf + 136
        0x00001348:    e007        ..      B        0x135a ; SEGGER_RTT_vprintf + 152
        0x0000134a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000134c:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00001350:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x00001354:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x00001358:    e7f1        ..      B        0x133e ; SEGGER_RTT_vprintf + 124
        0x0000135a:    bf00        ..      NOP      
        0x0000135c:    2000        .       MOVS     r0,#0
        0x0000135e:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001360:    782e        .x      LDRB     r6,[r5,#0]
        0x00001362:    2e2e        ..      CMP      r6,#0x2e
        0x00001364:    d112        ..      BNE      0x138c ; SEGGER_RTT_vprintf + 202
        0x00001366:    1c6d        m.      ADDS     r5,r5,#1
        0x00001368:    bf00        ..      NOP      
        0x0000136a:    782e        .x      LDRB     r6,[r5,#0]
        0x0000136c:    2e30        0.      CMP      r6,#0x30
        0x0000136e:    db01        ..      BLT      0x1374 ; SEGGER_RTT_vprintf + 178
        0x00001370:    2e39        9.      CMP      r6,#0x39
        0x00001372:    dd00        ..      BLE      0x1376 ; SEGGER_RTT_vprintf + 180
        0x00001374:    e009        ..      B        0x138a ; SEGGER_RTT_vprintf + 200
        0x00001376:    1c6d        m.      ADDS     r5,r5,#1
        0x00001378:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x0000137c:    9913        ..      LDR      r1,[sp,#0x4c]
        0x0000137e:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001382:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x00001386:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001388:    e7ef        ..      B        0x136a ; SEGGER_RTT_vprintf + 168
        0x0000138a:    bf00        ..      NOP      
        0x0000138c:    782e        .x      LDRB     r6,[r5,#0]
        0x0000138e:    bf00        ..      NOP      
        0x00001390:    2e6c        l.      CMP      r6,#0x6c
        0x00001392:    d001        ..      BEQ      0x1398 ; SEGGER_RTT_vprintf + 214
        0x00001394:    2e68        h.      CMP      r6,#0x68
        0x00001396:    d102        ..      BNE      0x139e ; SEGGER_RTT_vprintf + 220
        0x00001398:    1c6d        m.      ADDS     r5,r5,#1
        0x0000139a:    782e        .x      LDRB     r6,[r5,#0]
        0x0000139c:    e000        ..      B        0x13a0 ; SEGGER_RTT_vprintf + 222
        0x0000139e:    e000        ..      B        0x13a2 ; SEGGER_RTT_vprintf + 224
        0x000013a0:    e7f6        ..      B        0x1390 ; SEGGER_RTT_vprintf + 206
        0x000013a2:    bf00        ..      NOP      
        0x000013a4:    2e70        p.      CMP      r6,#0x70
        0x000013a6:    d05d        ].      BEQ      0x1464 ; SEGGER_RTT_vprintf + 418
        0x000013a8:    dc08        ..      BGT      0x13bc ; SEGGER_RTT_vprintf + 250
        0x000013aa:    2e25        %.      CMP      r6,#0x25
        0x000013ac:    d06a        j.      BEQ      0x1484 ; SEGGER_RTT_vprintf + 450
        0x000013ae:    2e58        X.      CMP      r6,#0x58
        0x000013b0:    d035        5.      BEQ      0x141e ; SEGGER_RTT_vprintf + 348
        0x000013b2:    2e63        c.      CMP      r6,#0x63
        0x000013b4:    d009        ..      BEQ      0x13ca ; SEGGER_RTT_vprintf + 264
        0x000013b6:    2e64        d.      CMP      r6,#0x64
        0x000013b8:    d169        i.      BNE      0x148e ; SEGGER_RTT_vprintf + 460
        0x000013ba:    e013        ..      B        0x13e4 ; SEGGER_RTT_vprintf + 290
        0x000013bc:    2e73        s.      CMP      r6,#0x73
        0x000013be:    d03c        <.      BEQ      0x143a ; SEGGER_RTT_vprintf + 376
        0x000013c0:    2e75        u.      CMP      r6,#0x75
        0x000013c2:    d01d        ..      BEQ      0x1400 ; SEGGER_RTT_vprintf + 318
        0x000013c4:    2e78        x.      CMP      r6,#0x78
        0x000013c6:    d162        b.      BNE      0x148e ; SEGGER_RTT_vprintf + 460
        0x000013c8:    e028        (.      B        0x141c ; SEGGER_RTT_vprintf + 346
        0x000013ca:    6821        !h      LDR      r1,[r4,#0]
        0x000013cc:    1d08        ..      ADDS     r0,r1,#4
        0x000013ce:    6020         `      STR      r0,[r4,#0]
        0x000013d0:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000013d4:    f0090bff    ....    AND      r11,r9,#0xff
        0x000013d8:    4659        YF      MOV      r1,r11
        0x000013da:    a814        ..      ADD      r0,sp,#0x50
        0x000013dc:    f000fa6e    ..n.    BL       _StoreChar ; 0x18bc
        0x000013e0:    e056        V.      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x000013e2:    e058        X.      B        0x1496 ; SEGGER_RTT_vprintf + 468
        0x000013e4:    6821        !h      LDR      r1,[r4,#0]
        0x000013e6:    1d08        ..      ADDS     r0,r1,#4
        0x000013e8:    6020         `      STR      r0,[r4,#0]
        0x000013ea:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000013ee:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000013f2:    220a        ."      MOVS     r2,#0xa
        0x000013f4:    4649        IF      MOV      r1,r9
        0x000013f6:    a814        ..      ADD      r0,sp,#0x50
        0x000013f8:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000013fa:    f000f973    ..s.    BL       _PrintInt ; 0x16e4
        0x000013fe:    e047        G.      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x00001400:    6821        !h      LDR      r1,[r4,#0]
        0x00001402:    1d08        ..      ADDS     r0,r1,#4
        0x00001404:    6020         `      STR      r0,[r4,#0]
        0x00001406:    f8d19000    ....    LDR      r9,[r1,#0]
        0x0000140a:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000140e:    220a        ."      MOVS     r2,#0xa
        0x00001410:    4649        IF      MOV      r1,r9
        0x00001412:    a814        ..      ADD      r0,sp,#0x50
        0x00001414:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001416:    f000f9db    ....    BL       _PrintUnsigned ; 0x17d0
        0x0000141a:    e039        9.      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x0000141c:    bf00        ..      NOP      
        0x0000141e:    6821        !h      LDR      r1,[r4,#0]
        0x00001420:    1d08        ..      ADDS     r0,r1,#4
        0x00001422:    6020         `      STR      r0,[r4,#0]
        0x00001424:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001428:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000142c:    2210        ."      MOVS     r2,#0x10
        0x0000142e:    4649        IF      MOV      r1,r9
        0x00001430:    a814        ..      ADD      r0,sp,#0x50
        0x00001432:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001434:    f000f9cc    ....    BL       _PrintUnsigned ; 0x17d0
        0x00001438:    e02a        *.      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x0000143a:    6821        !h      LDR      r1,[r4,#0]
        0x0000143c:    1d08        ..      ADDS     r0,r1,#4
        0x0000143e:    6020         `      STR      r0,[r4,#0]
        0x00001440:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x00001444:    bf00        ..      NOP      
        0x00001446:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x0000144a:    f10b0b01    ....    ADD      r11,r11,#1
        0x0000144e:    b906        ..      CBNZ     r6,0x1452 ; SEGGER_RTT_vprintf + 400
        0x00001450:    e006        ..      B        0x1460 ; SEGGER_RTT_vprintf + 414
        0x00001452:    4631        1F      MOV      r1,r6
        0x00001454:    a814        ..      ADD      r0,sp,#0x50
        0x00001456:    f000fa31    ..1.    BL       _StoreChar ; 0x18bc
        0x0000145a:    9817        ..      LDR      r0,[sp,#0x5c]
        0x0000145c:    2800        .(      CMP      r0,#0
        0x0000145e:    daf2        ..      BGE      0x1446 ; SEGGER_RTT_vprintf + 388
        0x00001460:    bf00        ..      NOP      
        0x00001462:    e015        ..      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x00001464:    6821        !h      LDR      r1,[r4,#0]
        0x00001466:    1d08        ..      ADDS     r0,r1,#4
        0x00001468:    6020         `      STR      r0,[r4,#0]
        0x0000146a:    f8d19000    ....    LDR      r9,[r1,#0]
        0x0000146e:    2000        .       MOVS     r0,#0
        0x00001470:    2108        .!      MOVS     r1,#8
        0x00001472:    460b        .F      MOV      r3,r1
        0x00001474:    2210        ."      MOVS     r2,#0x10
        0x00001476:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x0000147a:    4649        IF      MOV      r1,r9
        0x0000147c:    a814        ..      ADD      r0,sp,#0x50
        0x0000147e:    f000f9a7    ....    BL       _PrintUnsigned ; 0x17d0
        0x00001482:    e005        ..      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x00001484:    2125        %!      MOVS     r1,#0x25
        0x00001486:    a814        ..      ADD      r0,sp,#0x50
        0x00001488:    f000fa18    ....    BL       _StoreChar ; 0x18bc
        0x0000148c:    e000        ..      B        0x1490 ; SEGGER_RTT_vprintf + 462
        0x0000148e:    bf00        ..      NOP      
        0x00001490:    bf00        ..      NOP      
        0x00001492:    1c6d        m.      ADDS     r5,r5,#1
        0x00001494:    e003        ..      B        0x149e ; SEGGER_RTT_vprintf + 476
        0x00001496:    4631        1F      MOV      r1,r6
        0x00001498:    a814        ..      ADD      r0,sp,#0x50
        0x0000149a:    f000fa0f    ....    BL       _StoreChar ; 0x18bc
        0x0000149e:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000014a0:    2800        .(      CMP      r0,#0
        0x000014a2:    f6bfaf1e    ....    BGE      0x12e2 ; SEGGER_RTT_vprintf + 32
        0x000014a6:    bf00        ..      NOP      
        0x000014a8:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000014aa:    2800        .(      CMP      r0,#0
        0x000014ac:    dd0a        ..      BLE      0x14c4 ; SEGGER_RTT_vprintf + 514
        0x000014ae:    9816        ..      LDR      r0,[sp,#0x58]
        0x000014b0:    b120         .      CBZ      r0,0x14bc ; SEGGER_RTT_vprintf + 506
        0x000014b2:    a903        ..      ADD      r1,sp,#0xc
        0x000014b4:    4650        PF      MOV      r0,r10
        0x000014b6:    9a16        ..      LDR      r2,[sp,#0x58]
        0x000014b8:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0x11d4
        0x000014bc:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x000014c0:    4408        .D      ADD      r0,r0,r1
        0x000014c2:    9017        ..      STR      r0,[sp,#0x5c]
        0x000014c4:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000014c6:    b019        ..      ADD      sp,sp,#0x64
        0x000014c8:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x000014cc:    b570        p.      PUSH     {r4-r6,lr}
        0x000014ce:    4d07        .M      LDR      r5,[pc,#28] ; [0x14ec] = 0x88
        0x000014d0:    f1050470    ..p.    ADD      r4,r5,#0x70
        0x000014d4:    b104        ..      CBZ      r4,0x14d8 ; SPIM_IRQHandler + 12
        0x000014d6:    e004        ..      B        0x14e2 ; SPIM_IRQHandler + 22
        0x000014d8:    22c2        ."      MOVS     r2,#0xc2
        0x000014da:    a105        ..      ADR      r1,{pc}+0x16 ; 0x14f0
        0x000014dc:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1510
        0x000014de:    f000fa6f    ..o.    BL       __aeabi_assert ; 0x19c0
        0x000014e2:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000014e6:    4788        .G      BLX      r1
        0x000014e8:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000014ea:    0000        ..      DCW    0
        0x000014ec:    00000088    ....    DCD    136
        0x000014f0:    2e5c2e2e    ..\.    DCD    777793070
        0x000014f4:    2e2e5c2e    .\..    DCD    774790190
        0x000014f8:    464c455c    \ELF    DCD    1179403612
        0x000014fc:    53425f32    2_BS    DCD    1396858674
        0x00001500:    72445c50    P\Dr    DCD    1917082704
        0x00001504:    72657669    iver    DCD    1919252073
        0x00001508:    746e695c    \int    DCD    1953392988
        0x0000150c:    00632e63    c.c.    DCD    6499939
        0x00001510:    636e7566    func    DCD    1668183398
        0x00001514:    203d2120     !=     DCD    540877088
        0x00001518:    00000030    0...    DCD    48
    $t
    i.SystemInit
    SystemInit
        0x0000151c:    b510        ..      PUSH     {r4,lr}
        0x0000151e:    bf00        ..      NOP      
        0x00001520:    480f        .H      LDR      r0,[pc,#60] ; [0x1560] = 0x4000b000
        0x00001522:    6800        .h      LDR      r0,[r0,#0]
        0x00001524:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x00001528:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x0000152c:    d1f8        ..      BNE      0x1520 ; SystemInit + 4
        0x0000152e:    f64e2060    N.`     MOV      r0,#0xea60
        0x00001532:    f000fa74    ..t.    BL       delay ; 0x1a1e
        0x00001536:    480b        .H      LDR      r0,[pc,#44] ; [0x1564] = 0x5f5e100
        0x00001538:    490b        .I      LDR      r1,[pc,#44] ; [0x1568] = 0x20000000
        0x0000153a:    6008        .`      STR      r0,[r1,#0]
        0x0000153c:    2008        .       MOVS     r0,#8
        0x0000153e:    f7fffc71    ..q.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xe24
        0x00001542:    2002        .       MOVS     r0,#2
        0x00001544:    f7fffc7a    ..z.    BL       HAL_SYSCON_Set_HClk_Div ; 0xe3c
        0x00001548:    2004        .       MOVS     r0,#4
        0x0000154a:    f7fffcad    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xea8
        0x0000154e:    2002        .       MOVS     r0,#2
        0x00001550:    f7fffce2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xf18
        0x00001554:    2164        d!      MOVS     r1,#0x64
        0x00001556:    2001        .       MOVS     r0,#1
        0x00001558:    f7fffd14    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0xf84
        0x0000155c:    bd10        ..      POP      {r4,pc}
    $d
        0x0000155e:    0000        ..      DCW    0
        0x00001560:    4000b000    ...@    DCD    1073786880
        0x00001564:    05f5e100    ....    DCD    100000000
        0x00001568:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x0000156c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000156e:    4d07        .M      LDR      r5,[pc,#28] ; [0x158c] = 0x88
        0x00001570:    f1050458    ..X.    ADD      r4,r5,#0x58
        0x00001574:    b104        ..      CBZ      r4,0x1578 ; TIMER_IRQHandler + 12
        0x00001576:    e004        ..      B        0x1582 ; TIMER_IRQHandler + 22
        0x00001578:    22a4        ."      MOVS     r2,#0xa4
        0x0000157a:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1590
        0x0000157c:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x15b0
        0x0000157e:    f000fa1f    ....    BL       __aeabi_assert ; 0x19c0
        0x00001582:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001586:    4788        .G      BLX      r1
        0x00001588:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000158a:    0000        ..      DCW    0
        0x0000158c:    00000088    ....    DCD    136
        0x00001590:    2e5c2e2e    ..\.    DCD    777793070
        0x00001594:    2e2e5c2e    .\..    DCD    774790190
        0x00001598:    464c455c    \ELF    DCD    1179403612
        0x0000159c:    53425f32    2_BS    DCD    1396858674
        0x000015a0:    72445c50    P\Dr    DCD    1917082704
        0x000015a4:    72657669    iver    DCD    1919252073
        0x000015a8:    746e695c    \int    DCD    1953392988
        0x000015ac:    00632e63    c.c.    DCD    6499939
        0x000015b0:    636e7566    func    DCD    1668183398
        0x000015b4:    203d2120     !=     DCD    540877088
        0x000015b8:    00000030    0...    DCD    48
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x000015bc:    b570        p.      PUSH     {r4-r6,lr}
        0x000015be:    4d07        .M      LDR      r5,[pc,#28] ; [0x15dc] = 0x88
        0x000015c0:    f1050478    ..x.    ADD      r4,r5,#0x78
        0x000015c4:    b104        ..      CBZ      r4,0x15c8 ; UART_IRQHandler + 12
        0x000015c6:    e004        ..      B        0x15d2 ; UART_IRQHandler + 22
        0x000015c8:    22cc        ."      MOVS     r2,#0xcc
        0x000015ca:    a105        ..      ADR      r1,{pc}+0x16 ; 0x15e0
        0x000015cc:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1600
        0x000015ce:    f000f9f7    ....    BL       __aeabi_assert ; 0x19c0
        0x000015d2:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000015d6:    4788        .G      BLX      r1
        0x000015d8:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000015da:    0000        ..      DCW    0
        0x000015dc:    00000088    ....    DCD    136
        0x000015e0:    2e5c2e2e    ..\.    DCD    777793070
        0x000015e4:    2e2e5c2e    .\..    DCD    774790190
        0x000015e8:    464c455c    \ELF    DCD    1179403612
        0x000015ec:    53425f32    2_BS    DCD    1396858674
        0x000015f0:    72445c50    P\Dr    DCD    1917082704
        0x000015f4:    72657669    iver    DCD    1919252073
        0x000015f8:    746e695c    \int    DCD    1953392988
        0x000015fc:    00632e63    c.c.    DCD    6499939
        0x00001600:    636e7566    func    DCD    1668183398
        0x00001604:    203d2120     !=     DCD    540877088
        0x00001608:    00000030    0...    DCD    48
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x0000160c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000160e:    4d06        .M      LDR      r5,[pc,#24] ; [0x1628] = 0x88
        0x00001610:    462c        ,F      MOV      r4,r5
        0x00001612:    b104        ..      CBZ      r4,0x1616 ; WDT_IRQHandler + 10
        0x00001614:    e004        ..      B        0x1620 ; WDT_IRQHandler + 20
        0x00001616:    222f        /"      MOVS     r2,#0x2f
        0x00001618:    a104        ..      ADR      r1,{pc}+0x14 ; 0x162c
        0x0000161a:    a00c        ..      ADR      r0,{pc}+0x32 ; 0x164c
        0x0000161c:    f000f9d0    ....    BL       __aeabi_assert ; 0x19c0
        0x00001620:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001624:    4788        .G      BLX      r1
        0x00001626:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001628:    00000088    ....    DCD    136
        0x0000162c:    2e5c2e2e    ..\.    DCD    777793070
        0x00001630:    2e2e5c2e    .\..    DCD    774790190
        0x00001634:    464c455c    \ELF    DCD    1179403612
        0x00001638:    53425f32    2_BS    DCD    1396858674
        0x0000163c:    72445c50    P\Dr    DCD    1917082704
        0x00001640:    72657669    iver    DCD    1919252073
        0x00001644:    746e695c    \int    DCD    1953392988
        0x00001648:    00632e63    c.c.    DCD    6499939
        0x0000164c:    636e7566    func    DCD    1668183398
        0x00001650:    203d2120     !=     DCD    540877088
        0x00001654:    00000030    0...    DCD    48
    $t
    i._DoInit
    _DoInit
        0x00001658:    b510        ..      PUSH     {r4,lr}
        0x0000165a:    4c12        .L      LDR      r4,[pc,#72] ; [0x16a4] = 0x20000008
        0x0000165c:    2003        .       MOVS     r0,#3
        0x0000165e:    6120         a      STR      r0,[r4,#0x10]
        0x00001660:    6160        `a      STR      r0,[r4,#0x14]
        0x00001662:    a011        ..      ADR      r0,{pc}+0x46 ; 0x16a8
        0x00001664:    61a0        .a      STR      r0,[r4,#0x18]
        0x00001666:    4913        .I      LDR      r1,[pc,#76] ; [0x16b4] = 0x200000b0
        0x00001668:    61e1        .a      STR      r1,[r4,#0x1c]
        0x0000166a:    f44f6180    O..a    MOV      r1,#0x400
        0x0000166e:    6221        !b      STR      r1,[r4,#0x20]
        0x00001670:    2100        .!      MOVS     r1,#0
        0x00001672:    62a1        .b      STR      r1,[r4,#0x28]
        0x00001674:    6261        ab      STR      r1,[r4,#0x24]
        0x00001676:    62e1        .b      STR      r1,[r4,#0x2c]
        0x00001678:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x16a8
        0x0000167a:    6620         f      STR      r0,[r4,#0x60]
        0x0000167c:    490e        .I      LDR      r1,[pc,#56] ; [0x16b8] = 0x200004b0
        0x0000167e:    6661        af      STR      r1,[r4,#0x64]
        0x00001680:    2110        .!      MOVS     r1,#0x10
        0x00001682:    66a1        .f      STR      r1,[r4,#0x68]
        0x00001684:    2100        .!      MOVS     r1,#0
        0x00001686:    6721        !g      STR      r1,[r4,#0x70]
        0x00001688:    66e1        .f      STR      r1,[r4,#0x6c]
        0x0000168a:    6761        ag      STR      r1,[r4,#0x74]
        0x0000168c:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x16bc
        0x0000168e:    1de0        ..      ADDS     r0,r4,#7
        0x00001690:    f7fefe5e    ..^.    BL       strcpy ; 0x350
        0x00001694:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x16c0
        0x00001696:    4620         F      MOV      r0,r4
        0x00001698:    f7fefe5a    ..Z.    BL       strcpy ; 0x350
        0x0000169c:    2020                MOVS     r0,#0x20
        0x0000169e:    71a0        .q      STRB     r0,[r4,#6]
        0x000016a0:    bd10        ..      POP      {r4,pc}
    $d
        0x000016a2:    0000        ..      DCW    0
        0x000016a4:    20000008    ...     DCD    536870920
        0x000016a8:    6d726554    Term    DCD    1836213588
        0x000016ac:    6c616e69    inal    DCD    1818324585
        0x000016b0:    00000000    ....    DCD    0
        0x000016b4:    200000b0    ...     DCD    536871088
        0x000016b8:    200004b0    ...     DCD    536872112
        0x000016bc:    00545452    RTT.    DCD    5526610
        0x000016c0:    47474553    SEGG    DCD    1195853139
        0x000016c4:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x000016c8:    b510        ..      PUSH     {r4,lr}
        0x000016ca:    4601        .F      MOV      r1,r0
        0x000016cc:    690a        .i      LDR      r2,[r1,#0x10]
        0x000016ce:    68cb        .h      LDR      r3,[r1,#0xc]
        0x000016d0:    429a        .B      CMP      r2,r3
        0x000016d2:    d804        ..      BHI      0x16de ; _GetAvailWriteSpace + 22
        0x000016d4:    688c        .h      LDR      r4,[r1,#8]
        0x000016d6:    1e64        d.      SUBS     r4,r4,#1
        0x000016d8:    1ae4        ..      SUBS     r4,r4,r3
        0x000016da:    18a0        ..      ADDS     r0,r4,r2
        0x000016dc:    e001        ..      B        0x16e2 ; _GetAvailWriteSpace + 26
        0x000016de:    1ad4        ..      SUBS     r4,r2,r3
        0x000016e0:    1e60        `.      SUBS     r0,r4,#1
        0x000016e2:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x000016e4:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x000016e8:    4606        .F      MOV      r6,r0
        0x000016ea:    460f        .F      MOV      r7,r1
        0x000016ec:    4692        .F      MOV      r10,r2
        0x000016ee:    4698        .F      MOV      r8,r3
        0x000016f0:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x000016f4:    2f00        ./      CMP      r7,#0
        0x000016f6:    da01        ..      BGE      0x16fc ; _PrintInt + 24
        0x000016f8:    4278        xB      RSBS     r0,r7,#0
        0x000016fa:    e000        ..      B        0x16fe ; _PrintInt + 26
        0x000016fc:    4638        8F      MOV      r0,r7
        0x000016fe:    4683        .F      MOV      r11,r0
        0x00001700:    f04f0901    O...    MOV      r9,#1
        0x00001704:    e003        ..      B        0x170e ; _PrintInt + 42
        0x00001706:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x0000170a:    f1090901    ....    ADD      r9,r9,#1
        0x0000170e:    45d3        .E      CMP      r11,r10
        0x00001710:    daf9        ..      BGE      0x1706 ; _PrintInt + 34
        0x00001712:    45c8        .E      CMP      r8,r9
        0x00001714:    d900        ..      BLS      0x1718 ; _PrintInt + 52
        0x00001716:    46c1        .F      MOV      r9,r8
        0x00001718:    b134        4.      CBZ      r4,0x1728 ; _PrintInt + 68
        0x0000171a:    2f00        ./      CMP      r7,#0
        0x0000171c:    db03        ..      BLT      0x1726 ; _PrintInt + 66
        0x0000171e:    f0050004    ....    AND      r0,r5,#4
        0x00001722:    2804        .(      CMP      r0,#4
        0x00001724:    d100        ..      BNE      0x1728 ; _PrintInt + 68
        0x00001726:    1e64        d.      SUBS     r4,r4,#1
        0x00001728:    f0050002    ....    AND      r0,r5,#2
        0x0000172c:    b110        ..      CBZ      r0,0x1734 ; _PrintInt + 80
        0x0000172e:    f1b80f00    ....    CMP      r8,#0
        0x00001732:    d011        ..      BEQ      0x1758 ; _PrintInt + 116
        0x00001734:    f0050001    ....    AND      r0,r5,#1
        0x00001738:    b970        p.      CBNZ     r0,0x1758 ; _PrintInt + 116
        0x0000173a:    b16c        l.      CBZ      r4,0x1758 ; _PrintInt + 116
        0x0000173c:    e008        ..      B        0x1750 ; _PrintInt + 108
        0x0000173e:    1e64        d.      SUBS     r4,r4,#1
        0x00001740:    2120         !      MOVS     r1,#0x20
        0x00001742:    4630        0F      MOV      r0,r6
        0x00001744:    f000f8ba    ....    BL       _StoreChar ; 0x18bc
        0x00001748:    68f0        .h      LDR      r0,[r6,#0xc]
        0x0000174a:    2800        .(      CMP      r0,#0
        0x0000174c:    da00        ..      BGE      0x1750 ; _PrintInt + 108
        0x0000174e:    e002        ..      B        0x1756 ; _PrintInt + 114
        0x00001750:    b10c        ..      CBZ      r4,0x1756 ; _PrintInt + 114
        0x00001752:    45a1        .E      CMP      r9,r4
        0x00001754:    d3f3        ..      BCC      0x173e ; _PrintInt + 90
        0x00001756:    bf00        ..      NOP      
        0x00001758:    68f0        .h      LDR      r0,[r6,#0xc]
        0x0000175a:    2800        .(      CMP      r0,#0
        0x0000175c:    db36        6.      BLT      0x17cc ; _PrintInt + 232
        0x0000175e:    2f00        ./      CMP      r7,#0
        0x00001760:    da05        ..      BGE      0x176e ; _PrintInt + 138
        0x00001762:    427f        .B      RSBS     r7,r7,#0
        0x00001764:    212d        -!      MOVS     r1,#0x2d
        0x00001766:    4630        0F      MOV      r0,r6
        0x00001768:    f000f8a8    ....    BL       _StoreChar ; 0x18bc
        0x0000176c:    e007        ..      B        0x177e ; _PrintInt + 154
        0x0000176e:    f0050004    ....    AND      r0,r5,#4
        0x00001772:    2804        .(      CMP      r0,#4
        0x00001774:    d103        ..      BNE      0x177e ; _PrintInt + 154
        0x00001776:    212b        +!      MOVS     r1,#0x2b
        0x00001778:    4630        0F      MOV      r0,r6
        0x0000177a:    f000f89f    ....    BL       _StoreChar ; 0x18bc
        0x0000177e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001780:    2800        .(      CMP      r0,#0
        0x00001782:    db23        #.      BLT      0x17cc ; _PrintInt + 232
        0x00001784:    f0050002    ....    AND      r0,r5,#2
        0x00001788:    2802        .(      CMP      r0,#2
        0x0000178a:    d114        ..      BNE      0x17b6 ; _PrintInt + 210
        0x0000178c:    f0050001    ....    AND      r0,r5,#1
        0x00001790:    b988        ..      CBNZ     r0,0x17b6 ; _PrintInt + 210
        0x00001792:    f1b80f00    ....    CMP      r8,#0
        0x00001796:    d10e        ..      BNE      0x17b6 ; _PrintInt + 210
        0x00001798:    b16c        l.      CBZ      r4,0x17b6 ; _PrintInt + 210
        0x0000179a:    e008        ..      B        0x17ae ; _PrintInt + 202
        0x0000179c:    1e64        d.      SUBS     r4,r4,#1
        0x0000179e:    2130        0!      MOVS     r1,#0x30
        0x000017a0:    4630        0F      MOV      r0,r6
        0x000017a2:    f000f88b    ....    BL       _StoreChar ; 0x18bc
        0x000017a6:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000017a8:    2800        .(      CMP      r0,#0
        0x000017aa:    da00        ..      BGE      0x17ae ; _PrintInt + 202
        0x000017ac:    e002        ..      B        0x17b4 ; _PrintInt + 208
        0x000017ae:    b10c        ..      CBZ      r4,0x17b4 ; _PrintInt + 208
        0x000017b0:    45a1        .E      CMP      r9,r4
        0x000017b2:    d3f3        ..      BCC      0x179c ; _PrintInt + 184
        0x000017b4:    bf00        ..      NOP      
        0x000017b6:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000017b8:    2800        .(      CMP      r0,#0
        0x000017ba:    db07        ..      BLT      0x17cc ; _PrintInt + 232
        0x000017bc:    4643        CF      MOV      r3,r8
        0x000017be:    4652        RF      MOV      r2,r10
        0x000017c0:    4639        9F      MOV      r1,r7
        0x000017c2:    4630        0F      MOV      r0,r6
        0x000017c4:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x000017c8:    f000f802    ....    BL       _PrintUnsigned ; 0x17d0
        0x000017cc:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x000017d0:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x000017d4:    4680        .F      MOV      r8,r0
        0x000017d6:    4689        .F      MOV      r9,r1
        0x000017d8:    4615        .F      MOV      r5,r2
        0x000017da:    461e        .F      MOV      r6,r3
        0x000017dc:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x000017de:    f8cd9004    ....    STR      r9,[sp,#4]
        0x000017e2:    2701        .'      MOVS     r7,#1
        0x000017e4:    46bb        .F      MOV      r11,r7
        0x000017e6:    e005        ..      B        0x17f4 ; _PrintUnsigned + 36
        0x000017e8:    9801        ..      LDR      r0,[sp,#4]
        0x000017ea:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x000017ee:    9001        ..      STR      r0,[sp,#4]
        0x000017f0:    f10b0b01    ....    ADD      r11,r11,#1
        0x000017f4:    9801        ..      LDR      r0,[sp,#4]
        0x000017f6:    42a8        .B      CMP      r0,r5
        0x000017f8:    d2f6        ..      BCS      0x17e8 ; _PrintUnsigned + 24
        0x000017fa:    455e        ^E      CMP      r6,r11
        0x000017fc:    d900        ..      BLS      0x1800 ; _PrintUnsigned + 48
        0x000017fe:    46b3        .F      MOV      r11,r6
        0x00001800:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001802:    f0000001    ....    AND      r0,r0,#1
        0x00001806:    b9d0        ..      CBNZ     r0,0x183e ; _PrintUnsigned + 110
        0x00001808:    b1cc        ..      CBZ      r4,0x183e ; _PrintUnsigned + 110
        0x0000180a:    980d        ..      LDR      r0,[sp,#0x34]
        0x0000180c:    f0000002    ....    AND      r0,r0,#2
        0x00001810:    2802        .(      CMP      r0,#2
        0x00001812:    d103        ..      BNE      0x181c ; _PrintUnsigned + 76
        0x00001814:    b916        ..      CBNZ     r6,0x181c ; _PrintUnsigned + 76
        0x00001816:    2030        0       MOVS     r0,#0x30
        0x00001818:    9000        ..      STR      r0,[sp,#0]
        0x0000181a:    e001        ..      B        0x1820 ; _PrintUnsigned + 80
        0x0000181c:    2020                MOVS     r0,#0x20
        0x0000181e:    9000        ..      STR      r0,[sp,#0]
        0x00001820:    e009        ..      B        0x1836 ; _PrintUnsigned + 102
        0x00001822:    1e64        d.      SUBS     r4,r4,#1
        0x00001824:    4640        @F      MOV      r0,r8
        0x00001826:    9900        ..      LDR      r1,[sp,#0]
        0x00001828:    f000f848    ..H.    BL       _StoreChar ; 0x18bc
        0x0000182c:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001830:    2800        .(      CMP      r0,#0
        0x00001832:    da00        ..      BGE      0x1836 ; _PrintUnsigned + 102
        0x00001834:    e002        ..      B        0x183c ; _PrintUnsigned + 108
        0x00001836:    b10c        ..      CBZ      r4,0x183c ; _PrintUnsigned + 108
        0x00001838:    45a3        .E      CMP      r11,r4
        0x0000183a:    d3f2        ..      BCC      0x1822 ; _PrintUnsigned + 82
        0x0000183c:    bf00        ..      NOP      
        0x0000183e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001842:    2800        .(      CMP      r0,#0
        0x00001844:    db35        5.      BLT      0x18b2 ; _PrintUnsigned + 226
        0x00001846:    e009        ..      B        0x185c ; _PrintUnsigned + 140
        0x00001848:    2e01        ..      CMP      r6,#1
        0x0000184a:    d901        ..      BLS      0x1850 ; _PrintUnsigned + 128
        0x0000184c:    1e76        v.      SUBS     r6,r6,#1
        0x0000184e:    e004        ..      B        0x185a ; _PrintUnsigned + 138
        0x00001850:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00001854:    45aa        .E      CMP      r10,r5
        0x00001856:    d200        ..      BCS      0x185a ; _PrintUnsigned + 138
        0x00001858:    e001        ..      B        0x185e ; _PrintUnsigned + 142
        0x0000185a:    436f        oC      MULS     r7,r5,r7
        0x0000185c:    e7f4        ..      B        0x1848 ; _PrintUnsigned + 120
        0x0000185e:    bf00        ..      NOP      
        0x00001860:    bf00        ..      NOP      
        0x00001862:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00001866:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x0000186a:    4813        .H      LDR      r0,[pc,#76] ; [0x18b8] = 0x2154
        0x0000186c:    f810100a    ....    LDRB     r1,[r0,r10]
        0x00001870:    4640        @F      MOV      r0,r8
        0x00001872:    f000f823    ..#.    BL       _StoreChar ; 0x18bc
        0x00001876:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000187a:    2800        .(      CMP      r0,#0
        0x0000187c:    da00        ..      BGE      0x1880 ; _PrintUnsigned + 176
        0x0000187e:    e003        ..      B        0x1888 ; _PrintUnsigned + 184
        0x00001880:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x00001884:    2f00        ./      CMP      r7,#0
        0x00001886:    d1ec        ..      BNE      0x1862 ; _PrintUnsigned + 146
        0x00001888:    bf00        ..      NOP      
        0x0000188a:    980d        ..      LDR      r0,[sp,#0x34]
        0x0000188c:    f0000001    ....    AND      r0,r0,#1
        0x00001890:    b178        x.      CBZ      r0,0x18b2 ; _PrintUnsigned + 226
        0x00001892:    b174        t.      CBZ      r4,0x18b2 ; _PrintUnsigned + 226
        0x00001894:    e009        ..      B        0x18aa ; _PrintUnsigned + 218
        0x00001896:    1e64        d.      SUBS     r4,r4,#1
        0x00001898:    2120         !      MOVS     r1,#0x20
        0x0000189a:    4640        @F      MOV      r0,r8
        0x0000189c:    f000f80e    ....    BL       _StoreChar ; 0x18bc
        0x000018a0:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000018a4:    2800        .(      CMP      r0,#0
        0x000018a6:    da00        ..      BGE      0x18aa ; _PrintUnsigned + 218
        0x000018a8:    e002        ..      B        0x18b0 ; _PrintUnsigned + 224
        0x000018aa:    b10c        ..      CBZ      r4,0x18b0 ; _PrintUnsigned + 224
        0x000018ac:    45a3        .E      CMP      r11,r4
        0x000018ae:    d3f2        ..      BCC      0x1896 ; _PrintUnsigned + 198
        0x000018b0:    bf00        ..      NOP      
        0x000018b2:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x000018b6:    0000        ..      DCW    0
        0x000018b8:    00002154    T!..    DCD    8532
    $t
    i._StoreChar
    _StoreChar
        0x000018bc:    b570        p.      PUSH     {r4-r6,lr}
        0x000018be:    4604        .F      MOV      r4,r0
        0x000018c0:    460e        .F      MOV      r6,r1
        0x000018c2:    68a5        .h      LDR      r5,[r4,#8]
        0x000018c4:    1c68        h.      ADDS     r0,r5,#1
        0x000018c6:    6861        ah      LDR      r1,[r4,#4]
        0x000018c8:    4281        .B      CMP      r1,r0
        0x000018ca:    d306        ..      BCC      0x18da ; _StoreChar + 30
        0x000018cc:    6820         h      LDR      r0,[r4,#0]
        0x000018ce:    5546        FU      STRB     r6,[r0,r5]
        0x000018d0:    1c68        h.      ADDS     r0,r5,#1
        0x000018d2:    60a0        .`      STR      r0,[r4,#8]
        0x000018d4:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000018d6:    1c40        @.      ADDS     r0,r0,#1
        0x000018d8:    60e0        .`      STR      r0,[r4,#0xc]
        0x000018da:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x000018de:    4288        .B      CMP      r0,r1
        0x000018e0:    d10d        ..      BNE      0x18fe ; _StoreChar + 66
        0x000018e2:    68a2        .h      LDR      r2,[r4,#8]
        0x000018e4:    6821        !h      LDR      r1,[r4,#0]
        0x000018e6:    6920         i      LDR      r0,[r4,#0x10]
        0x000018e8:    f7fffc74    ..t.    BL       SEGGER_RTT_Write ; 0x11d4
        0x000018ec:    68a1        .h      LDR      r1,[r4,#8]
        0x000018ee:    4288        .B      CMP      r0,r1
        0x000018f0:    d003        ..      BEQ      0x18fa ; _StoreChar + 62
        0x000018f2:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000018f6:    60e0        .`      STR      r0,[r4,#0xc]
        0x000018f8:    e001        ..      B        0x18fe ; _StoreChar + 66
        0x000018fa:    2000        .       MOVS     r0,#0
        0x000018fc:    60a0        .`      STR      r0,[r4,#8]
        0x000018fe:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00001900:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001904:    4604        .F      MOV      r4,r0
        0x00001906:    4689        .F      MOV      r9,r1
        0x00001908:    4617        .F      MOV      r7,r2
        0x0000190a:    f04f0a00    O...    MOV      r10,#0
        0x0000190e:    68e5        .h      LDR      r5,[r4,#0xc]
        0x00001910:    bf00        ..      NOP      
        0x00001912:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x00001916:    45a8        .E      CMP      r8,r5
        0x00001918:    d903        ..      BLS      0x1922 ; _WriteBlocking + 34
        0x0000191a:    eba80005    ....    SUB      r0,r8,r5
        0x0000191e:    1e46        F.      SUBS     r6,r0,#1
        0x00001920:    e004        ..      B        0x192c ; _WriteBlocking + 44
        0x00001922:    eba50008    ....    SUB      r0,r5,r8
        0x00001926:    1c40        @.      ADDS     r0,r0,#1
        0x00001928:    68a1        .h      LDR      r1,[r4,#8]
        0x0000192a:    1a0e        ..      SUBS     r6,r1,r0
        0x0000192c:    68a0        .h      LDR      r0,[r4,#8]
        0x0000192e:    1b40        @.      SUBS     r0,r0,r5
        0x00001930:    42b0        .B      CMP      r0,r6
        0x00001932:    d901        ..      BLS      0x1938 ; _WriteBlocking + 56
        0x00001934:    4630        0F      MOV      r0,r6
        0x00001936:    e001        ..      B        0x193c ; _WriteBlocking + 60
        0x00001938:    68a0        .h      LDR      r0,[r4,#8]
        0x0000193a:    1b40        @.      SUBS     r0,r0,r5
        0x0000193c:    4606        .F      MOV      r6,r0
        0x0000193e:    42be        .B      CMP      r6,r7
        0x00001940:    d201        ..      BCS      0x1946 ; _WriteBlocking + 70
        0x00001942:    4630        0F      MOV      r0,r6
        0x00001944:    e000        ..      B        0x1948 ; _WriteBlocking + 72
        0x00001946:    4638        8F      MOV      r0,r7
        0x00001948:    4606        .F      MOV      r6,r0
        0x0000194a:    6861        ah      LDR      r1,[r4,#4]
        0x0000194c:    1948        H.      ADDS     r0,r1,r5
        0x0000194e:    4632        2F      MOV      r2,r6
        0x00001950:    4649        IF      MOV      r1,r9
        0x00001952:    f7fefd21    ..!.    BL       __aeabi_memcpy ; 0x398
        0x00001956:    44b2        .D      ADD      r10,r10,r6
        0x00001958:    44b1        .D      ADD      r9,r9,r6
        0x0000195a:    1bbf        ..      SUBS     r7,r7,r6
        0x0000195c:    4435        5D      ADD      r5,r5,r6
        0x0000195e:    68a0        .h      LDR      r0,[r4,#8]
        0x00001960:    42a8        .B      CMP      r0,r5
        0x00001962:    d100        ..      BNE      0x1966 ; _WriteBlocking + 102
        0x00001964:    2500        .%      MOVS     r5,#0
        0x00001966:    60e5        .`      STR      r5,[r4,#0xc]
        0x00001968:    2f00        ./      CMP      r7,#0
        0x0000196a:    d1d2        ..      BNE      0x1912 ; _WriteBlocking + 18
        0x0000196c:    4650        PF      MOV      r0,r10
        0x0000196e:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001972:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001976:    4604        .F      MOV      r4,r0
        0x00001978:    4689        .F      MOV      r9,r1
        0x0000197a:    4615        .F      MOV      r5,r2
        0x0000197c:    68e6        .h      LDR      r6,[r4,#0xc]
        0x0000197e:    68a0        .h      LDR      r0,[r4,#8]
        0x00001980:    1b87        ..      SUBS     r7,r0,r6
        0x00001982:    42af        .B      CMP      r7,r5
        0x00001984:    d908        ..      BLS      0x1998 ; _WriteNoCheck + 38
        0x00001986:    6861        ah      LDR      r1,[r4,#4]
        0x00001988:    1988        ..      ADDS     r0,r1,r6
        0x0000198a:    462a        *F      MOV      r2,r5
        0x0000198c:    4649        IF      MOV      r1,r9
        0x0000198e:    f7fefd03    ....    BL       __aeabi_memcpy ; 0x398
        0x00001992:    1970        p.      ADDS     r0,r6,r5
        0x00001994:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001996:    e010        ..      B        0x19ba ; _WriteNoCheck + 72
        0x00001998:    46b8        .F      MOV      r8,r7
        0x0000199a:    6861        ah      LDR      r1,[r4,#4]
        0x0000199c:    1988        ..      ADDS     r0,r1,r6
        0x0000199e:    4642        BF      MOV      r2,r8
        0x000019a0:    4649        IF      MOV      r1,r9
        0x000019a2:    f7fefcf9    ....    BL       __aeabi_memcpy ; 0x398
        0x000019a6:    eba50807    ....    SUB      r8,r5,r7
        0x000019aa:    eb090107    ....    ADD      r1,r9,r7
        0x000019ae:    4642        BF      MOV      r2,r8
        0x000019b0:    6860        `h      LDR      r0,[r4,#4]
        0x000019b2:    f7fefcf1    ....    BL       __aeabi_memcpy ; 0x398
        0x000019b6:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x000019ba:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000019be:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x000019c0:    4604        .F      MOV      r4,r0
        0x000019c2:    460d        .F      MOV      r5,r1
        0x000019c4:    4616        .F      MOV      r6,r2
        0x000019c6:    b672        r.      CPSID    i
        0x000019c8:    4623        #F      MOV      r3,r4
        0x000019ca:    4632        2F      MOV      r2,r6
        0x000019cc:    4629        )F      MOV      r1,r5
        0x000019ce:    a002        ..      ADR      r0,{pc}+0xa ; 0x19d8
        0x000019d0:    f7fefc18    ....    BL       __2printf ; 0x204
        0x000019d4:    bf00        ..      NOP      
        0x000019d6:    e7fe        ..      B        0x19d6 ; __aeabi_assert + 22
    $d
        0x000019d8:    65737341    Asse    DCD    1702064961
        0x000019dc:    6f697472    rtio    DCD    1869182066
        0x000019e0:    6146206e    n Fa    DCD    1631985774
        0x000019e4:    64656c69    iled    DCD    1684368489
        0x000019e8:    6966203a    : fi    DCD    1768300602
        0x000019ec:    2520656c    le %    DCD    622880108
        0x000019f0:    6c202c73    s, l    DCD    1814047859
        0x000019f4:    20656e69    ine     DCD    543518313
        0x000019f8:    202c6425    %d,     DCD    539780133
        0x000019fc:    000a7325    %s..    DCD    684837
    $t
    i.co_bswap32
    co_bswap32
        0x00001a00:    4601        .F      MOV      r1,r0
        0x00001a02:    f44f007f    O...    MOV      r0,#0xff0000
        0x00001a06:    ea002001    ...     AND      r0,r0,r1,LSL #8
        0x00001a0a:    ea406001    @..`    ORR      r0,r0,r1,LSL #24
        0x00001a0e:    f44f427f    O..B    MOV      r2,#0xff00
        0x00001a12:    ea022211    ..."    AND      r2,r2,r1,LSR #8
        0x00001a16:    4310        .C      ORRS     r0,r0,r2
        0x00001a18:    ea406011    @..`    ORR      r0,r0,r1,LSR #24
        0x00001a1c:    4770        pG      BX       lr
    i.delay
    delay
        0x00001a1e:    2100        .!      MOVS     r1,#0
        0x00001a20:    e006        ..      B        0x1a30 ; delay + 18
        0x00001a22:    bf00        ..      NOP      
        0x00001a24:    bf00        ..      NOP      
        0x00001a26:    bf00        ..      NOP      
        0x00001a28:    bf00        ..      NOP      
        0x00001a2a:    bf00        ..      NOP      
        0x00001a2c:    bf00        ..      NOP      
        0x00001a2e:    1c49        I.      ADDS     r1,r1,#1
        0x00001a30:    4281        .B      CMP      r1,r0
        0x00001a32:    d3f6        ..      BCC      0x1a22 ; delay + 4
        0x00001a34:    4770        pG      BX       lr
        0x00001a36:    0000        ..      MOVS     r0,r0
    i.dmac_ch0_cfg_h_pack
    dmac_ch0_cfg_h_pack
        0x00001a38:    b570        p.      PUSH     {r4-r6,lr}
        0x00001a3a:    9c04        ..      LDR      r4,[sp,#0x10]
        0x00001a3c:    02c5        ..      LSLS     r5,r0,#11
        0x00001a3e:    ea4515c1    E...    ORR      r5,r5,r1,LSL #7
        0x00001a42:    ea450582    E...    ORR      r5,r5,r2,LSL #2
        0x00001a46:    ea450543    E.C.    ORR      r5,r5,r3,LSL #1
        0x00001a4a:    4325        %C      ORRS     r5,r5,r4
        0x00001a4c:    4e01        .N      LDR      r6,[pc,#4] ; [0x1a54] = 0x40010000
        0x00001a4e:    6475        ud      STR      r5,[r6,#0x44]
        0x00001a50:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001a52:    0000        ..      DCW    0
        0x00001a54:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_cfg_l_pack
    dmac_ch0_cfg_l_pack
        0x00001a58:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001a5a:    ac05        ..      ADD      r4,sp,#0x14
        0x00001a5c:    cc70        p.      LDM      r4,{r4-r6}
        0x00001a5e:    0507        ..      LSLS     r7,r0,#20
        0x00001a60:    ea4747c1    G..G    ORR      r7,r7,r1,LSL #19
        0x00001a64:    ea474782    G..G    ORR      r7,r7,r2,LSL #18
        0x00001a68:    ea4727c3    G..'    ORR      r7,r7,r3,LSL #11
        0x00001a6c:    ea472784    G..'    ORR      r7,r7,r4,LSL #10
        0x00001a70:    ea472705    G..'    ORR      r7,r7,r5,LSL #8
        0x00001a74:    ea471746    G.F.    ORR      r7,r7,r6,LSL #5
        0x00001a78:    f8dfc008    ....    LDR      r12,[pc,#8] ; [0x1a84] = 0x40010000
        0x00001a7c:    f8cc7040    ..@p    STR      r7,[r12,#0x40]
        0x00001a80:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00001a82:    0000        ..      DCW    0
        0x00001a84:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_h_pack
    dmac_ch0_ctrl_h_pack
        0x00001a88:    ea413200    A..2    ORR      r2,r1,r0,LSL #12
        0x00001a8c:    4b01        .K      LDR      r3,[pc,#4] ; [0x1a94] = 0x40010000
        0x00001a8e:    61da        .a      STR      r2,[r3,#0x1c]
        0x00001a90:    4770        pG      BX       lr
    $d
        0x00001a92:    0000        ..      DCW    0
        0x00001a94:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_l_pack
    dmac_ch0_ctrl_l_pack
        0x00001a98:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001a9c:    ac06        ..      ADD      r4,sp,#0x18
        0x00001a9e:    ccf0        ..      LDM      r4,{r4-r7}
        0x00001aa0:    ea4f5c00    O..\    LSL      r12,r0,#20
        0x00001aa4:    ea4c3c81    L..<    ORR      r12,r12,r1,LSL #14
        0x00001aa8:    ea4c2cc2    L..,    ORR      r12,r12,r2,LSL #11
        0x00001aac:    ea4c2c43    L.C,    ORR      r12,r12,r3,LSL #9
        0x00001ab0:    ea4c1cc4    L...    ORR      r12,r12,r4,LSL #7
        0x00001ab4:    ea4c1c05    L...    ORR      r12,r12,r5,LSL #4
        0x00001ab8:    ea4c0c46    L.F.    ORR      r12,r12,r6,LSL #1
        0x00001abc:    ea4c0c07    L...    ORR      r12,r12,r7
        0x00001ac0:    f8df8008    ....    LDR      r8,[pc,#8] ; [0x1acc] = 0x40010000
        0x00001ac4:    f8c8c018    ....    STR      r12,[r8,#0x18]
        0x00001ac8:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001acc:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_dar_l_set
    dmac_ch0_dar_l_set
        0x00001ad0:    4901        .I      LDR      r1,[pc,#4] ; [0x1ad8] = 0x40010000
        0x00001ad2:    6088        .`      STR      r0,[r1,#8]
        0x00001ad4:    4770        pG      BX       lr
    $d
        0x00001ad6:    0000        ..      DCW    0
        0x00001ad8:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_sar_l_set
    dmac_ch0_sar_l_set
        0x00001adc:    4901        .I      LDR      r1,[pc,#4] ; [0x1ae4] = 0x40010000
        0x00001ade:    6008        .`      STR      r0,[r1,#0]
        0x00001ae0:    4770        pG      BX       lr
    $d
        0x00001ae2:    0000        ..      DCW    0
        0x00001ae4:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_chenreg_l_pack
    dmac_chenreg_l_pack
        0x00001ae8:    ea412200    A.."    ORR      r2,r1,r0,LSL #8
        0x00001aec:    4b01        .K      LDR      r3,[pc,#4] ; [0x1af4] = 0x400103a0
        0x00001aee:    601a        .`      STR      r2,[r3,#0]
        0x00001af0:    4770        pG      BX       lr
    $d
        0x00001af2:    0000        ..      DCW    0
        0x00001af4:    400103a0    ...@    DCD    1073808288
    $t
    i.dmac_clearblock_l_set
    dmac_clearblock_l_set
        0x00001af8:    4901        .I      LDR      r1,[pc,#4] ; [0x1b00] = 0x40010340
        0x00001afa:    6008        .`      STR      r0,[r1,#0]
        0x00001afc:    4770        pG      BX       lr
    $d
        0x00001afe:    0000        ..      DCW    0
        0x00001b00:    40010340    @..@    DCD    1073808192
    $t
    i.dmac_dmacfgreg_l_set
    dmac_dmacfgreg_l_set
        0x00001b04:    4901        .I      LDR      r1,[pc,#4] ; [0x1b0c] = 0x40010398
        0x00001b06:    6008        .`      STR      r0,[r1,#0]
        0x00001b08:    4770        pG      BX       lr
    $d
        0x00001b0a:    0000        ..      DCW    0
        0x00001b0c:    40010398    ...@    DCD    1073808280
    $t
    i.dmac_rawblock_l_get
    dmac_rawblock_l_get
        0x00001b10:    4801        .H      LDR      r0,[pc,#4] ; [0x1b18] = 0x400102c8
        0x00001b12:    6800        .h      LDR      r0,[r0,#0]
        0x00001b14:    4770        pG      BX       lr
    $d
        0x00001b16:    0000        ..      DCW    0
        0x00001b18:    400102c8    ...@    DCD    1073808072
    $t
    i.dmac_transfer_QSPI_RX
    dmac_transfer_QSPI_RX
        0x00001b1c:    b57f        ..      PUSH     {r0-r6,lr}
        0x00001b1e:    4606        .F      MOV      r6,r0
        0x00001b20:    460c        .F      MOV      r4,r1
        0x00001b22:    4615        .F      MOV      r5,r2
        0x00001b24:    4630        0F      MOV      r0,r6
        0x00001b26:    f7ffffd9    ....    BL       dmac_ch0_sar_l_set ; 0x1adc
        0x00001b2a:    4620         F      MOV      r0,r4
        0x00001b2c:    f7ffffd0    ....    BL       dmac_ch0_dar_l_set ; 0x1ad0
        0x00001b30:    2000        .       MOVS     r0,#0
        0x00001b32:    9000        ..      STR      r0,[sp,#0]
        0x00001b34:    9001        ..      STR      r0,[sp,#4]
        0x00001b36:    9002        ..      STR      r0,[sp,#8]
        0x00001b38:    2302        .#      MOVS     r3,#2
        0x00001b3a:    461a        .F      MOV      r2,r3
        0x00001b3c:    4619        .F      MOV      r1,r3
        0x00001b3e:    9003        ..      STR      r0,[sp,#0xc]
        0x00001b40:    4618        .F      MOV      r0,r3
        0x00001b42:    f7ffffa9    ....    BL       dmac_ch0_ctrl_l_pack ; 0x1a98
        0x00001b46:    b2a9        ..      UXTH     r1,r5
        0x00001b48:    2000        .       MOVS     r0,#0
        0x00001b4a:    f7ffff9d    ....    BL       dmac_ch0_ctrl_h_pack ; 0x1a88
        0x00001b4e:    2101        .!      MOVS     r1,#1
        0x00001b50:    4608        .F      MOV      r0,r1
        0x00001b52:    f7ffffc9    ....    BL       dmac_chenreg_l_pack ; 0x1ae8
        0x00001b56:    bf00        ..      NOP      
        0x00001b58:    f7ffffda    ....    BL       dmac_rawblock_l_get ; 0x1b10
        0x00001b5c:    f0000001    ....    AND      r0,r0,#1
        0x00001b60:    2800        .(      CMP      r0,#0
        0x00001b62:    d0f9        ..      BEQ      0x1b58 ; dmac_transfer_QSPI_RX + 60
        0x00001b64:    2001        .       MOVS     r0,#1
        0x00001b66:    f7ffffc7    ....    BL       dmac_clearblock_l_set ; 0x1af8
        0x00001b6a:    bd7f        ..      POP      {r0-r6,pc}
    i.dmac_transfer_QSPI_RX_32Bit
    dmac_transfer_QSPI_RX_32Bit
        0x00001b6c:    b57f        ..      PUSH     {r0-r6,lr}
        0x00001b6e:    4606        .F      MOV      r6,r0
        0x00001b70:    460c        .F      MOV      r4,r1
        0x00001b72:    4615        .F      MOV      r5,r2
        0x00001b74:    4630        0F      MOV      r0,r6
        0x00001b76:    f7ffffb1    ....    BL       dmac_ch0_sar_l_set ; 0x1adc
        0x00001b7a:    4620         F      MOV      r0,r4
        0x00001b7c:    f7ffffa8    ....    BL       dmac_ch0_dar_l_set ; 0x1ad0
        0x00001b80:    2000        .       MOVS     r0,#0
        0x00001b82:    2102        .!      MOVS     r1,#2
        0x00001b84:    e9cd0100    ....    STRD     r0,r1,[sp,#0]
        0x00001b88:    460b        .F      MOV      r3,r1
        0x00001b8a:    460a        .F      MOV      r2,r1
        0x00001b8c:    e9cd1002    ....    STRD     r1,r0,[sp,#8]
        0x00001b90:    4608        .F      MOV      r0,r1
        0x00001b92:    f7ffff81    ....    BL       dmac_ch0_ctrl_l_pack ; 0x1a98
        0x00001b96:    b2a9        ..      UXTH     r1,r5
        0x00001b98:    2000        .       MOVS     r0,#0
        0x00001b9a:    f7ffff75    ..u.    BL       dmac_ch0_ctrl_h_pack ; 0x1a88
        0x00001b9e:    2101        .!      MOVS     r1,#1
        0x00001ba0:    4608        .F      MOV      r0,r1
        0x00001ba2:    f7ffffa1    ....    BL       dmac_chenreg_l_pack ; 0x1ae8
        0x00001ba6:    bf00        ..      NOP      
        0x00001ba8:    f7ffffb2    ....    BL       dmac_rawblock_l_get ; 0x1b10
        0x00001bac:    f0000001    ....    AND      r0,r0,#1
        0x00001bb0:    2800        .(      CMP      r0,#0
        0x00001bb2:    d0f9        ..      BEQ      0x1ba8 ; dmac_transfer_QSPI_RX_32Bit + 60
        0x00001bb4:    2001        .       MOVS     r0,#1
        0x00001bb6:    f7ffff9f    ....    BL       dmac_clearblock_l_set ; 0x1af8
        0x00001bba:    bd7f        ..      POP      {r0-r6,pc}
    i.dmac_transfer_QSPI_TX
    dmac_transfer_QSPI_TX
        0x00001bbc:    b57f        ..      PUSH     {r0-r6,lr}
        0x00001bbe:    4606        .F      MOV      r6,r0
        0x00001bc0:    460c        .F      MOV      r4,r1
        0x00001bc2:    4615        .F      MOV      r5,r2
        0x00001bc4:    4630        0F      MOV      r0,r6
        0x00001bc6:    f7ffff89    ....    BL       dmac_ch0_sar_l_set ; 0x1adc
        0x00001bca:    4620         F      MOV      r0,r4
        0x00001bcc:    f7ffff80    ....    BL       dmac_ch0_dar_l_set ; 0x1ad0
        0x00001bd0:    2000        .       MOVS     r0,#0
        0x00001bd2:    2302        .#      MOVS     r3,#2
        0x00001bd4:    e9cd3000    ...0    STRD     r3,r0,[sp,#0]
        0x00001bd8:    9002        ..      STR      r0,[sp,#8]
        0x00001bda:    4603        .F      MOV      r3,r0
        0x00001bdc:    2202        ."      MOVS     r2,#2
        0x00001bde:    4611        .F      MOV      r1,r2
        0x00001be0:    9003        ..      STR      r0,[sp,#0xc]
        0x00001be2:    2001        .       MOVS     r0,#1
        0x00001be4:    f7ffff58    ..X.    BL       dmac_ch0_ctrl_l_pack ; 0x1a98
        0x00001be8:    b2a9        ..      UXTH     r1,r5
        0x00001bea:    2000        .       MOVS     r0,#0
        0x00001bec:    f7ffff4c    ..L.    BL       dmac_ch0_ctrl_h_pack ; 0x1a88
        0x00001bf0:    2101        .!      MOVS     r1,#1
        0x00001bf2:    4608        .F      MOV      r0,r1
        0x00001bf4:    f7ffff78    ..x.    BL       dmac_chenreg_l_pack ; 0x1ae8
        0x00001bf8:    bf00        ..      NOP      
        0x00001bfa:    f7ffff89    ....    BL       dmac_rawblock_l_get ; 0x1b10
        0x00001bfe:    f0000001    ....    AND      r0,r0,#1
        0x00001c02:    2800        .(      CMP      r0,#0
        0x00001c04:    d0f9        ..      BEQ      0x1bfa ; dmac_transfer_QSPI_TX + 62
        0x00001c06:    2001        .       MOVS     r0,#1
        0x00001c08:    f7ffff76    ..v.    BL       dmac_clearblock_l_set ; 0x1af8
        0x00001c0c:    bd7f        ..      POP      {r0-r6,pc}
    i.dmac_transfer_qspi_init
    dmac_transfer_qspi_init
        0x00001c0e:    b50e        ..      PUSH     {r1-r3,lr}
        0x00001c10:    2001        .       MOVS     r0,#1
        0x00001c12:    f7ffff77    ..w.    BL       dmac_dmacfgreg_l_set ; 0x1b04
        0x00001c16:    2001        .       MOVS     r0,#1
        0x00001c18:    2100        .!      MOVS     r1,#0
        0x00001c1a:    9100        ..      STR      r1,[sp,#0]
        0x00001c1c:    460b        .F      MOV      r3,r1
        0x00001c1e:    460a        .F      MOV      r2,r1
        0x00001c20:    e9cd1001    ....    STRD     r1,r0,[sp,#4]
        0x00001c24:    4608        .F      MOV      r0,r1
        0x00001c26:    f7ffff17    ....    BL       dmac_ch0_cfg_l_pack ; 0x1a58
        0x00001c2a:    2000        .       MOVS     r0,#0
        0x00001c2c:    4603        .F      MOV      r3,r0
        0x00001c2e:    2201        ."      MOVS     r2,#1
        0x00001c30:    4601        .F      MOV      r1,r0
        0x00001c32:    9000        ..      STR      r0,[sp,#0]
        0x00001c34:    4610        .F      MOV      r0,r2
        0x00001c36:    f7fffeff    ....    BL       dmac_ch0_cfg_h_pack ; 0x1a38
        0x00001c3a:    bd0e        ..      POP      {r1-r3,pc}
    i.fputc
    fputc
        0x00001c3c:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00001c3e:    460c        .F      MOV      r4,r1
        0x00001c40:    2201        ."      MOVS     r2,#1
        0x00001c42:    4669        iF      MOV      r1,sp
        0x00001c44:    2000        .       MOVS     r0,#0
        0x00001c46:    f7fffac5    ....    BL       SEGGER_RTT_Write ; 0x11d4
        0x00001c4a:    9800        ..      LDR      r0,[sp,#0]
        0x00001c4c:    bd1c        ..      POP      {r2-r4,pc}
        0x00001c4e:    0000        ..      MOVS     r0,r0
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00001c50:    4903        .I      LDR      r1,[pc,#12] ; [0x1c60] = 0x40007000
        0x00001c52:    6809        .h      LDR      r1,[r1,#0]
        0x00001c54:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001c58:    4a01        .J      LDR      r2,[pc,#4] ; [0x1c60] = 0x40007000
        0x00001c5a:    6011        .`      STR      r1,[r2,#0]
        0x00001c5c:    4770        pG      BX       lr
    $d
        0x00001c5e:    0000        ..      DCW    0
        0x00001c60:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00001c64:    4903        .I      LDR      r1,[pc,#12] ; [0x1c74] = 0x40007000
        0x00001c66:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001c68:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001c6c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1c74] = 0x40007000
        0x00001c6e:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001c70:    4770        pG      BX       lr
    $d
        0x00001c72:    0000        ..      DCW    0
        0x00001c74:    40007000    .p.@    DCD    1073770496
    $t
    i.main
    main
        0x00001c78:    a102        ..      ADR      r1,{pc}+0xc ; 0x1c84
        0x00001c7a:    2000        .       MOVS     r0,#0
        0x00001c7c:    f7fffb10    ....    BL       SEGGER_RTT_printf ; 0x12a0
        0x00001c80:    f000f9b4    ....    BL       test_quad_read ; 0x1fec
    $d
        0x00001c84:    6c6c6548    Hell    DCD    1819043144
        0x00001c88:    6f57206f    o Wo    DCD    1867980911
        0x00001c8c:    20646c72    rld     DCD    543452274
        0x00001c90:    38313032    2018    DCD    942747698
        0x00001c94:    34303530    0504    DCD    875574576
        0x00001c98:    00000a7e    ~...    DCD    2686
    $t
    i.qspi_ctrlr0_pack
    qspi_ctrlr0_pack
        0x00001c9c:    e92d43f0    -..C    PUSH     {r4-r9,lr}
        0x00001ca0:    ac07        ..      ADD      r4,sp,#0x1c
        0x00001ca2:    e89410f0    ....    LDM      r4,{r4-r7,r12}
        0x00001ca6:    ea4f5840    O.@X    LSL      r8,r0,#21
        0x00001caa:    ea484801    H..H    ORR      r8,r8,r1,LSL #16
        0x00001cae:    ea483802    H..8    ORR      r8,r8,r2,LSL #12
        0x00001cb2:    ea4828c3    H..(    ORR      r8,r8,r3,LSL #11
        0x00001cb6:    ea482884    H..(    ORR      r8,r8,r4,LSL #10
        0x00001cba:    ea482805    H..(    ORR      r8,r8,r5,LSL #8
        0x00001cbe:    ea4818c6    H...    ORR      r8,r8,r6,LSL #7
        0x00001cc2:    ea481887    H...    ORR      r8,r8,r7,LSL #6
        0x00001cc6:    ea48180c    H...    ORR      r8,r8,r12,LSL #4
        0x00001cca:    f8df900c    ....    LDR      r9,[pc,#12] ; [0x1cd8] = 0x40030000
        0x00001cce:    f8c98000    ....    STR      r8,[r9,#0]
        0x00001cd2:    e8bd83f0    ....    POP      {r4-r9,pc}
    $d
        0x00001cd6:    0000        ..      DCW    0
        0x00001cd8:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_ctrlr1_pack
    qspi_ctrlr1_pack
        0x00001cdc:    4901        .I      LDR      r1,[pc,#4] ; [0x1ce4] = 0x40030000
        0x00001cde:    6048        H`      STR      r0,[r1,#4]
        0x00001ce0:    4770        pG      BX       lr
    $d
        0x00001ce2:    0000        ..      DCW    0
        0x00001ce4:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_dmacr_pack
    qspi_dmacr_pack
        0x00001ce8:    ea410240    A.@.    ORR      r2,r1,r0,LSL #1
        0x00001cec:    4b01        .K      LDR      r3,[pc,#4] ; [0x1cf4] = 0x40030000
        0x00001cee:    64da        .d      STR      r2,[r3,#0x4c]
        0x00001cf0:    4770        pG      BX       lr
    $d
        0x00001cf2:    0000        ..      DCW    0
        0x00001cf4:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_dmardlr_set
    qspi_dmardlr_set
        0x00001cf8:    4901        .I      LDR      r1,[pc,#4] ; [0x1d00] = 0x40030000
        0x00001cfa:    6548        He      STR      r0,[r1,#0x54]
        0x00001cfc:    4770        pG      BX       lr
    $d
        0x00001cfe:    0000        ..      DCW    0
        0x00001d00:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_dr_set
    qspi_dr_set
        0x00001d04:    4901        .I      LDR      r1,[pc,#4] ; [0x1d0c] = 0x40030000
        0x00001d06:    6608        .f      STR      r0,[r1,#0x60]
        0x00001d08:    4770        pG      BX       lr
    $d
        0x00001d0a:    0000        ..      DCW    0
        0x00001d0c:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_flash_quad_read_data
    qspi_flash_quad_read_data
        0x00001d10:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001d14:    b085        ..      SUB      sp,sp,#0x14
        0x00001d16:    4605        .F      MOV      r5,r0
        0x00001d18:    460c        .F      MOV      r4,r1
        0x00001d1a:    4616        .F      MOV      r6,r2
        0x00001d1c:    461f        .F      MOV      r7,r3
        0x00001d1e:    f8dd9038    ..8.    LDR      r9,[sp,#0x38]
        0x00001d22:    f64070ff    @..p    MOV      r0,#0xfff
        0x00001d26:    fbb4f0f0    ....    UDIV     r0,r4,r0
        0x00001d2a:    fa1ffa80    ....    UXTH     r10,r0
        0x00001d2e:    f64070ff    @..p    MOV      r0,#0xfff
        0x00001d32:    fbb4f1f0    ....    UDIV     r1,r4,r0
        0x00001d36:    fb004b11    ...K    MLS      r11,r0,r1,r4
        0x00001d3a:    2000        .       MOVS     r0,#0
        0x00001d3c:    f000f8ce    ....    BL       qspi_ser_set ; 0x1edc
        0x00001d40:    2000        .       MOVS     r0,#0
        0x00001d42:    2302        .#      MOVS     r3,#2
        0x00001d44:    e9cd3001    ...0    STRD     r3,r0,[sp,#4]
        0x00001d48:    9003        ..      STR      r0,[sp,#0xc]
        0x00001d4a:    9004        ..      STR      r0,[sp,#0x10]
        0x00001d4c:    4603        .F      MOV      r3,r0
        0x00001d4e:    4602        .F      MOV      r2,r0
        0x00001d50:    211f        .!      MOVS     r1,#0x1f
        0x00001d52:    9000        ..      STR      r0,[sp,#0]
        0x00001d54:    2002        .       MOVS     r0,#2
        0x00001d56:    f7ffffa1    ....    BL       qspi_ctrlr0_pack ; 0x1c9c
        0x00001d5a:    1e61        a.      SUBS     r1,r4,#1
        0x00001d5c:    b288        ..      UXTH     r0,r1
        0x00001d5e:    f7ffffbd    ....    BL       qspi_ctrlr1_pack ; 0x1cdc
        0x00001d62:    2300        .#      MOVS     r3,#0
        0x00001d64:    2206        ."      MOVS     r2,#6
        0x00001d66:    2102        .!      MOVS     r1,#2
        0x00001d68:    4648        HF      MOV      r0,r9
        0x00001d6a:    f000f8bd    ....    BL       qspi_spi_ctrlr0_pack ; 0x1ee8
        0x00001d6e:    2007        .       MOVS     r0,#7
        0x00001d70:    f7ffffc2    ....    BL       qspi_dmardlr_set ; 0x1cf8
        0x00001d74:    2101        .!      MOVS     r1,#1
        0x00001d76:    2000        .       MOVS     r0,#0
        0x00001d78:    f7ffffb6    ....    BL       qspi_dmacr_pack ; 0x1ce8
        0x00001d7c:    2001        .       MOVS     r0,#1
        0x00001d7e:    f000f8c9    ....    BL       qspi_ssienr_set ; 0x1f14
        0x00001d82:    4630        0F      MOV      r0,r6
        0x00001d84:    f7ffffbe    ....    BL       qspi_dr_set ; 0x1d04
        0x00001d88:    4638        8F      MOV      r0,r7
        0x00001d8a:    f7ffffbb    ....    BL       qspi_dr_set ; 0x1d04
        0x00001d8e:    2001        .       MOVS     r0,#1
        0x00001d90:    f000f8a4    ....    BL       qspi_ser_set ; 0x1edc
        0x00001d94:    f04f0800    O...    MOV      r8,#0
        0x00001d98:    e00c        ..      B        0x1db4 ; qspi_flash_quad_read_data + 164
        0x00001d9a:    480d        .H      LDR      r0,[pc,#52] ; [0x1dd0] = 0x400300ec
        0x00001d9c:    f64072ff    @..r    MOV      r2,#0xfff
        0x00001da0:    4629        )F      MOV      r1,r5
        0x00001da2:    f7fffee3    ....    BL       dmac_transfer_QSPI_RX_32Bit ; 0x1b6c
        0x00001da6:    f64370fc    C..p    MOV      r0,#0x3ffc
        0x00001daa:    4405        .D      ADD      r5,r5,r0
        0x00001dac:    f1080001    ....    ADD      r0,r8,#1
        0x00001db0:    fa1ff880    ....    UXTH     r8,r0
        0x00001db4:    45d0        .E      CMP      r8,r10
        0x00001db6:    dbf0        ..      BLT      0x1d9a ; qspi_flash_quad_read_data + 138
        0x00001db8:    4805        .H      LDR      r0,[pc,#20] ; [0x1dd0] = 0x400300ec
        0x00001dba:    465a        ZF      MOV      r2,r11
        0x00001dbc:    4629        )F      MOV      r1,r5
        0x00001dbe:    f7fffed5    ....    BL       dmac_transfer_QSPI_RX_32Bit ; 0x1b6c
        0x00001dc2:    2000        .       MOVS     r0,#0
        0x00001dc4:    f000f8a6    ....    BL       qspi_ssienr_set ; 0x1f14
        0x00001dc8:    b005        ..      ADD      sp,sp,#0x14
        0x00001dca:    e8bd8ff0    ....    POP      {r4-r11,pc}
    $d
        0x00001dce:    0000        ..      DCW    0
        0x00001dd0:    400300ec    ...@    DCD    1073938668
    $t
    i.qspi_init
    qspi_init
        0x00001dd4:    b570        p.      PUSH     {r4-r6,lr}
        0x00001dd6:    4605        .F      MOV      r5,r0
        0x00001dd8:    460c        .F      MOV      r4,r1
        0x00001dda:    4620         F      MOV      r0,r4
        0x00001ddc:    f000f868    ..h.    BL       qspi_rsd_setf ; 0x1eb0
        0x00001de0:    2000        .       MOVS     r0,#0
        0x00001de2:    f000f88d    ....    BL       qspi_ssi_en_setf ; 0x1f00
        0x00001de6:    4628        (F      MOV      r0,r5
        0x00001de8:    f000f86e    ..n.    BL       qspi_sckdv_setf ; 0x1ec8
        0x00001dec:    f7ffff0f    ....    BL       dmac_transfer_qspi_init ; 0x1c0e
        0x00001df0:    bd70        p.      POP      {r4-r6,pc}
        0x00001df2:    0000        ..      MOVS     r0,r0
    i.qspi_read
    qspi_read
        0x00001df4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001df8:    b086        ..      SUB      sp,sp,#0x18
        0x00001dfa:    4605        .F      MOV      r5,r0
        0x00001dfc:    460c        .F      MOV      r4,r1
        0x00001dfe:    4617        .F      MOV      r7,r2
        0x00001e00:    4698        .F      MOV      r8,r3
        0x00001e02:    2000        .       MOVS     r0,#0
        0x00001e04:    f000f86a    ..j.    BL       qspi_ser_set ; 0x1edc
        0x00001e08:    2000        .       MOVS     r0,#0
        0x00001e0a:    2303        .#      MOVS     r3,#3
        0x00001e0c:    e9cd3001    ...0    STRD     r3,r0,[sp,#4]
        0x00001e10:    9003        ..      STR      r0,[sp,#0xc]
        0x00001e12:    9004        ..      STR      r0,[sp,#0x10]
        0x00001e14:    4603        .F      MOV      r3,r0
        0x00001e16:    4602        .F      MOV      r2,r0
        0x00001e18:    2107        .!      MOVS     r1,#7
        0x00001e1a:    9000        ..      STR      r0,[sp,#0]
        0x00001e1c:    f7ffff3e    ..>.    BL       qspi_ctrlr0_pack ; 0x1c9c
        0x00001e20:    1e61        a.      SUBS     r1,r4,#1
        0x00001e22:    b288        ..      UXTH     r0,r1
        0x00001e24:    f7ffff5a    ..Z.    BL       qspi_ctrlr1_pack ; 0x1cdc
        0x00001e28:    2001        .       MOVS     r0,#1
        0x00001e2a:    f000f873    ..s.    BL       qspi_ssienr_set ; 0x1f14
        0x00001e2e:    2600        .&      MOVS     r6,#0
        0x00001e30:    e005        ..      B        0x1e3e ; qspi_read + 74
        0x00001e32:    f8170b01    ....    LDRB     r0,[r7],#1
        0x00001e36:    f7ffff65    ..e.    BL       qspi_dr_set ; 0x1d04
        0x00001e3a:    1c70        p.      ADDS     r0,r6,#1
        0x00001e3c:    b286        ..      UXTH     r6,r0
        0x00001e3e:    4546        FE      CMP      r6,r8
        0x00001e40:    dbf7        ..      BLT      0x1e32 ; qspi_read + 62
        0x00001e42:    2001        .       MOVS     r0,#1
        0x00001e44:    f000f84a    ..J.    BL       qspi_ser_set ; 0x1edc
        0x00001e48:    2c40        @,      CMP      r4,#0x40
        0x00001e4a:    d818        ..      BHI      0x1e7e ; qspi_read + 138
        0x00001e4c:    bf00        ..      NOP      
        0x00001e4e:    f000f867    ..g.    BL       qspi_tfe_getf ; 0x1f20
        0x00001e52:    2801        .(      CMP      r0,#1
        0x00001e54:    d1fb        ..      BNE      0x1e4e ; qspi_read + 90
        0x00001e56:    bf00        ..      NOP      
        0x00001e58:    bf00        ..      NOP      
        0x00001e5a:    4814        .H      LDR      r0,[pc,#80] ; [0x1eac] = 0x40030000
        0x00001e5c:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00001e5e:    f0000001    ....    AND      r0,r0,#1
        0x00001e62:    2800        .(      CMP      r0,#0
        0x00001e64:    d1f8        ..      BNE      0x1e58 ; qspi_read + 100
        0x00001e66:    2600        .&      MOVS     r6,#0
        0x00001e68:    e006        ..      B        0x1e78 ; qspi_read + 132
        0x00001e6a:    bf00        ..      NOP      
        0x00001e6c:    480f        .H      LDR      r0,[pc,#60] ; [0x1eac] = 0x40030000
        0x00001e6e:    6e00        .n      LDR      r0,[r0,#0x60]
        0x00001e70:    f8050b01    ....    STRB     r0,[r5],#1
        0x00001e74:    1c70        p.      ADDS     r0,r6,#1
        0x00001e76:    b286        ..      UXTH     r6,r0
        0x00001e78:    42a6        .B      CMP      r6,r4
        0x00001e7a:    d3f6        ..      BCC      0x1e6a ; qspi_read + 118
        0x00001e7c:    e00c        ..      B        0x1e98 ; qspi_read + 164
        0x00001e7e:    2007        .       MOVS     r0,#7
        0x00001e80:    f7ffff3a    ..:.    BL       qspi_dmardlr_set ; 0x1cf8
        0x00001e84:    2101        .!      MOVS     r1,#1
        0x00001e86:    2000        .       MOVS     r0,#0
        0x00001e88:    f7ffff2e    ....    BL       qspi_dmacr_pack ; 0x1ce8
        0x00001e8c:    4807        .H      LDR      r0,[pc,#28] ; [0x1eac] = 0x40030000
        0x00001e8e:    3060        `0      ADDS     r0,r0,#0x60
        0x00001e90:    4622        "F      MOV      r2,r4
        0x00001e92:    4629        )F      MOV      r1,r5
        0x00001e94:    f7fffe42    ..B.    BL       dmac_transfer_QSPI_RX ; 0x1b1c
        0x00001e98:    2100        .!      MOVS     r1,#0
        0x00001e9a:    4608        .F      MOV      r0,r1
        0x00001e9c:    f7ffff24    ..$.    BL       qspi_dmacr_pack ; 0x1ce8
        0x00001ea0:    2000        .       MOVS     r0,#0
        0x00001ea2:    f000f837    ..7.    BL       qspi_ssienr_set ; 0x1f14
        0x00001ea6:    b006        ..      ADD      sp,sp,#0x18
        0x00001ea8:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001eac:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_rsd_setf
    qspi_rsd_setf
        0x00001eb0:    4904        .I      LDR      r1,[pc,#16] ; [0x1ec4] = 0x400300f0
        0x00001eb2:    6809        .h      LDR      r1,[r1,#0]
        0x00001eb4:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001eb8:    4a02        .J      LDR      r2,[pc,#8] ; [0x1ec4] = 0x400300f0
        0x00001eba:    3af0        .:      SUBS     r2,r2,#0xf0
        0x00001ebc:    f8c210f0    ....    STR      r1,[r2,#0xf0]
        0x00001ec0:    4770        pG      BX       lr
    $d
        0x00001ec2:    0000        ..      DCW    0
        0x00001ec4:    400300f0    ...@    DCD    1073938672
    $t
    i.qspi_sckdv_setf
    qspi_sckdv_setf
        0x00001ec8:    4903        .I      LDR      r1,[pc,#12] ; [0x1ed8] = 0x40030000
        0x00001eca:    6949        Ii      LDR      r1,[r1,#0x14]
        0x00001ecc:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001ed0:    4a01        .J      LDR      r2,[pc,#4] ; [0x1ed8] = 0x40030000
        0x00001ed2:    6151        Qa      STR      r1,[r2,#0x14]
        0x00001ed4:    4770        pG      BX       lr
    $d
        0x00001ed6:    0000        ..      DCW    0
        0x00001ed8:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_ser_set
    qspi_ser_set
        0x00001edc:    4901        .I      LDR      r1,[pc,#4] ; [0x1ee4] = 0x40030000
        0x00001ede:    6108        .a      STR      r0,[r1,#0x10]
        0x00001ee0:    4770        pG      BX       lr
    $d
        0x00001ee2:    0000        ..      DCW    0
        0x00001ee4:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_spi_ctrlr0_pack
    qspi_spi_ctrlr0_pack
        0x00001ee8:    b530        0.      PUSH     {r4,r5,lr}
        0x00001eea:    02c4        ..      LSLS     r4,r0,#11
        0x00001eec:    ea442401    D..$    ORR      r4,r4,r1,LSL #8
        0x00001ef0:    ea440482    D...    ORR      r4,r4,r2,LSL #2
        0x00001ef4:    431c        .C      ORRS     r4,r4,r3
        0x00001ef6:    4d01        .M      LDR      r5,[pc,#4] ; [0x1efc] = 0x400300f4
        0x00001ef8:    602c        ,`      STR      r4,[r5,#0]
        0x00001efa:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00001efc:    400300f4    ...@    DCD    1073938676
    $t
    i.qspi_ssi_en_setf
    qspi_ssi_en_setf
        0x00001f00:    4903        .I      LDR      r1,[pc,#12] ; [0x1f10] = 0x40030000
        0x00001f02:    6889        .h      LDR      r1,[r1,#8]
        0x00001f04:    f3600100    `...    BFI      r1,r0,#0,#1
        0x00001f08:    4a01        .J      LDR      r2,[pc,#4] ; [0x1f10] = 0x40030000
        0x00001f0a:    6091        .`      STR      r1,[r2,#8]
        0x00001f0c:    4770        pG      BX       lr
    $d
        0x00001f0e:    0000        ..      DCW    0
        0x00001f10:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_ssienr_set
    qspi_ssienr_set
        0x00001f14:    4901        .I      LDR      r1,[pc,#4] ; [0x1f1c] = 0x40030000
        0x00001f16:    6088        .`      STR      r0,[r1,#8]
        0x00001f18:    4770        pG      BX       lr
    $d
        0x00001f1a:    0000        ..      DCW    0
        0x00001f1c:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_tfe_getf
    qspi_tfe_getf
        0x00001f20:    4802        .H      LDR      r0,[pc,#8] ; [0x1f2c] = 0x40030000
        0x00001f22:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00001f24:    f3c00080    ....    UBFX     r0,r0,#2,#1
        0x00001f28:    4770        pG      BX       lr
    $d
        0x00001f2a:    0000        ..      DCW    0
        0x00001f2c:    40030000    ...@    DCD    1073938432
    $t
    i.qspi_write
    qspi_write
        0x00001f30:    b530        0.      PUSH     {r4,r5,lr}
        0x00001f32:    b085        ..      SUB      sp,sp,#0x14
        0x00001f34:    4605        .F      MOV      r5,r0
        0x00001f36:    460c        .F      MOV      r4,r1
        0x00001f38:    2000        .       MOVS     r0,#0
        0x00001f3a:    f7ffffcf    ....    BL       qspi_ser_set ; 0x1edc
        0x00001f3e:    2000        .       MOVS     r0,#0
        0x00001f40:    2301        .#      MOVS     r3,#1
        0x00001f42:    e9cd3001    ...0    STRD     r3,r0,[sp,#4]
        0x00001f46:    9003        ..      STR      r0,[sp,#0xc]
        0x00001f48:    9004        ..      STR      r0,[sp,#0x10]
        0x00001f4a:    4603        .F      MOV      r3,r0
        0x00001f4c:    4602        .F      MOV      r2,r0
        0x00001f4e:    2107        .!      MOVS     r1,#7
        0x00001f50:    9000        ..      STR      r0,[sp,#0]
        0x00001f52:    f7fffea3    ....    BL       qspi_ctrlr0_pack ; 0x1c9c
        0x00001f56:    2001        .       MOVS     r0,#1
        0x00001f58:    f7ffffdc    ....    BL       qspi_ssienr_set ; 0x1f14
        0x00001f5c:    2c40        @,      CMP      r4,#0x40
        0x00001f5e:    d80c        ..      BHI      0x1f7a ; qspi_write + 74
        0x00001f60:    e003        ..      B        0x1f6a ; qspi_write + 58
        0x00001f62:    f8150b01    ....    LDRB     r0,[r5],#1
        0x00001f66:    f7fffecd    ....    BL       qspi_dr_set ; 0x1d04
        0x00001f6a:    1e20         .      SUBS     r0,r4,#0
        0x00001f6c:    f1a40401    ....    SUB      r4,r4,#1
        0x00001f70:    d1f7        ..      BNE      0x1f62 ; qspi_write + 50
        0x00001f72:    2001        .       MOVS     r0,#1
        0x00001f74:    f7ffffb2    ....    BL       qspi_ser_set ; 0x1edc
        0x00001f78:    e010        ..      B        0x1f9c ; qspi_write + 108
        0x00001f7a:    2020                MOVS     r0,#0x20
        0x00001f7c:    4912        .I      LDR      r1,[pc,#72] ; [0x1fc8] = 0x40030000
        0x00001f7e:    6508        .e      STR      r0,[r1,#0x50]
        0x00001f80:    bf00        ..      NOP      
        0x00001f82:    2100        .!      MOVS     r1,#0
        0x00001f84:    2001        .       MOVS     r0,#1
        0x00001f86:    f7fffeaf    ....    BL       qspi_dmacr_pack ; 0x1ce8
        0x00001f8a:    2001        .       MOVS     r0,#1
        0x00001f8c:    f7ffffa6    ....    BL       qspi_ser_set ; 0x1edc
        0x00001f90:    490d        .I      LDR      r1,[pc,#52] ; [0x1fc8] = 0x40030000
        0x00001f92:    3160        `1      ADDS     r1,r1,#0x60
        0x00001f94:    4622        "F      MOV      r2,r4
        0x00001f96:    4628        (F      MOV      r0,r5
        0x00001f98:    f7fffe10    ....    BL       dmac_transfer_QSPI_TX ; 0x1bbc
        0x00001f9c:    bf00        ..      NOP      
        0x00001f9e:    f7ffffbf    ....    BL       qspi_tfe_getf ; 0x1f20
        0x00001fa2:    2801        .(      CMP      r0,#1
        0x00001fa4:    d1fb        ..      BNE      0x1f9e ; qspi_write + 110
        0x00001fa6:    bf00        ..      NOP      
        0x00001fa8:    bf00        ..      NOP      
        0x00001faa:    4807        .H      LDR      r0,[pc,#28] ; [0x1fc8] = 0x40030000
        0x00001fac:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00001fae:    f0000001    ....    AND      r0,r0,#1
        0x00001fb2:    2800        .(      CMP      r0,#0
        0x00001fb4:    d1f8        ..      BNE      0x1fa8 ; qspi_write + 120
        0x00001fb6:    2100        .!      MOVS     r1,#0
        0x00001fb8:    4608        .F      MOV      r0,r1
        0x00001fba:    f7fffe95    ....    BL       qspi_dmacr_pack ; 0x1ce8
        0x00001fbe:    2000        .       MOVS     r0,#0
        0x00001fc0:    f7ffffa8    ....    BL       qspi_ssienr_set ; 0x1f14
        0x00001fc4:    b005        ..      ADD      sp,sp,#0x14
        0x00001fc6:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00001fc8:    40030000    ...@    DCD    1073938432
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001fcc:    4901        .I      LDR      r1,[pc,#4] ; [0x1fd4] = 0x40020000
        0x00001fce:    6008        .`      STR      r0,[r1,#0]
        0x00001fd0:    4770        pG      BX       lr
    $d
        0x00001fd2:    0000        ..      DCW    0
        0x00001fd4:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001fd8:    4903        .I      LDR      r1,[pc,#12] ; [0x1fe8] = 0x40020000
        0x00001fda:    6849        Ih      LDR      r1,[r1,#4]
        0x00001fdc:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001fe0:    4a01        .J      LDR      r2,[pc,#4] ; [0x1fe8] = 0x40020000
        0x00001fe2:    6051        Q`      STR      r1,[r2,#4]
        0x00001fe4:    4770        pG      BX       lr
    $d
        0x00001fe6:    0000        ..      DCW    0
        0x00001fe8:    40020000    ...@    DCD    1073872896
    $t
    i.test_quad_read
    test_quad_read
        0x00001fec:    b08a        ..      SUB      sp,sp,#0x28
        0x00001fee:    bf00        ..      NOP      
        0x00001ff0:    2700        .'      MOVS     r7,#0
        0x00001ff2:    a337        7.      ADR      r3,{pc}+0xde ; 0x20d0
        0x00001ff4:    cb0f        ..      LDM      r3,{r0-r3}
        0x00001ff6:    e9cd2308    ...#    STRD     r2,r3,[sp,#0x20]
        0x00001ffa:    e9cd0106    ....    STRD     r0,r1,[sp,#0x18]
        0x00001ffe:    2000        .       MOVS     r0,#0
        0x00002000:    9002        ..      STR      r0,[sp,#8]
        0x00002002:    9003        ..      STR      r0,[sp,#0xc]
        0x00002004:    9004        ..      STR      r0,[sp,#0x10]
        0x00002006:    9005        ..      STR      r0,[sp,#0x14]
        0x00002008:    2001        .       MOVS     r0,#1
        0x0000200a:    f88d0004    ....    STRB     r0,[sp,#4]
        0x0000200e:    f88d0005    ....    STRB     r0,[sp,#5]
        0x00002012:    f88d0006    ....    STRB     r0,[sp,#6]
        0x00002016:    2010        .       MOVS     r0,#0x10
        0x00002018:    9901        ..      LDR      r1,[sp,#4]
        0x0000201a:    f7fefdf9    ....    BL       HAL_GPIO_Init ; 0xc10
        0x0000201e:    f7fefc9d    ....    BL       FLASH_Init ; 0x95c
        0x00002022:    2100        .!      MOVS     r1,#0
        0x00002024:    f44f2080    O..     MOV      r0,#0x40000
        0x00002028:    f7fefc46    ..F.    BL       FLASH_Erase_Block ; 0x8b8
        0x0000202c:    aa06        ..      ADD      r2,sp,#0x18
        0x0000202e:    2110        .!      MOVS     r1,#0x10
        0x00002030:    0388        ..      LSLS     r0,r1,#14
        0x00002032:    f7fefcab    ....    BL       FLASH_Program ; 0x98c
        0x00002036:    4607        .F      MOV      r7,r0
        0x00002038:    b91f        ..      CBNZ     r7,0x2042 ; test_quad_read + 86
        0x0000203a:    a029        ).      ADR      r0,{pc}+0xa6 ; 0x20e0
        0x0000203c:    f7fef8e2    ....    BL       __2printf ; 0x204
        0x00002040:    e002        ..      B        0x2048 ; test_quad_read + 92
        0x00002042:    a02b        +.      ADR      r0,{pc}+0xae ; 0x20f0
        0x00002044:    f7fef8de    ....    BL       __2printf ; 0x204
        0x00002048:    f7fefd40    ..@.    BL       FLASH_Quad_Enable ; 0xacc
        0x0000204c:    4607        .F      MOV      r7,r0
        0x0000204e:    b91f        ..      CBNZ     r7,0x2058 ; test_quad_read + 108
        0x00002050:    a02c        ,.      ADR      r0,{pc}+0xb4 ; 0x2104
        0x00002052:    f7fef8d7    ....    BL       __2printf ; 0x204
        0x00002056:    e002        ..      B        0x205e ; test_quad_read + 114
        0x00002058:    a02e        ..      ADR      r0,{pc}+0xbc ; 0x2114
        0x0000205a:    f7fef8d3    ....    BL       __2printf ; 0x204
        0x0000205e:    aa02        ..      ADD      r2,sp,#8
        0x00002060:    2110        .!      MOVS     r1,#0x10
        0x00002062:    0388        ..      LSLS     r0,r1,#14
        0x00002064:    f7fefd46    ..F.    BL       FLASH_Quad_Read ; 0xaf4
        0x00002068:    4607        .F      MOV      r7,r0
        0x0000206a:    b91f        ..      CBNZ     r7,0x2074 ; test_quad_read + 136
        0x0000206c:    a02d        -.      ADR      r0,{pc}+0xb8 ; 0x2124
        0x0000206e:    f7fef8c9    ....    BL       __2printf ; 0x204
        0x00002072:    e002        ..      B        0x207a ; test_quad_read + 142
        0x00002074:    a02f        /.      ADR      r0,{pc}+0xc0 ; 0x2134
        0x00002076:    f7fef8c5    ....    BL       __2printf ; 0x204
        0x0000207a:    2400        .$      MOVS     r4,#0
        0x0000207c:    e006        ..      B        0x208c ; test_quad_read + 160
        0x0000207e:    a802        ..      ADD      r0,sp,#8
        0x00002080:    5d02        .]      LDRB     r2,[r0,r4]
        0x00002082:    4621        !F      MOV      r1,r4
        0x00002084:    a030        0.      ADR      r0,{pc}+0xc4 ; 0x2148
        0x00002086:    f7fef8bd    ....    BL       __2printf ; 0x204
        0x0000208a:    1c64        d.      ADDS     r4,r4,#1
        0x0000208c:    2c10        .,      CMP      r4,#0x10
        0x0000208e:    d3f6        ..      BCC      0x207e ; test_quad_read + 146
        0x00002090:    e01d        ..      B        0x20ce ; test_quad_read + 226
        0x00002092:    2100        .!      MOVS     r1,#0
        0x00002094:    2010        .       MOVS     r0,#0x10
        0x00002096:    f7fefe7b    ..{.    BL       HAL_GPIO_WritePin ; 0xd90
        0x0000209a:    2582        .%      MOVS     r5,#0x82
        0x0000209c:    e006        ..      B        0x20ac ; test_quad_read + 192
        0x0000209e:    f2427610    B..v    MOV      r6,#0x2710
        0x000020a2:    e000        ..      B        0x20a6 ; test_quad_read + 186
        0x000020a4:    1e76        v.      SUBS     r6,r6,#1
        0x000020a6:    2e00        ..      CMP      r6,#0
        0x000020a8:    d1fc        ..      BNE      0x20a4 ; test_quad_read + 184
        0x000020aa:    1e6d        m.      SUBS     r5,r5,#1
        0x000020ac:    2d00        .-      CMP      r5,#0
        0x000020ae:    d1f6        ..      BNE      0x209e ; test_quad_read + 178
        0x000020b0:    2101        .!      MOVS     r1,#1
        0x000020b2:    2010        .       MOVS     r0,#0x10
        0x000020b4:    f7fefe6c    ..l.    BL       HAL_GPIO_WritePin ; 0xd90
        0x000020b8:    2582        .%      MOVS     r5,#0x82
        0x000020ba:    e006        ..      B        0x20ca ; test_quad_read + 222
        0x000020bc:    f2427610    B..v    MOV      r6,#0x2710
        0x000020c0:    e000        ..      B        0x20c4 ; test_quad_read + 216
        0x000020c2:    1e76        v.      SUBS     r6,r6,#1
        0x000020c4:    2e00        ..      CMP      r6,#0
        0x000020c6:    d1fc        ..      BNE      0x20c2 ; test_quad_read + 214
        0x000020c8:    1e6d        m.      SUBS     r5,r5,#1
        0x000020ca:    2d00        .-      CMP      r5,#0
        0x000020cc:    d1f6        ..      BNE      0x20bc ; test_quad_read + 208
        0x000020ce:    e7e0        ..      B        0x2092 ; test_quad_read + 166
    $d
        0x000020d0:    c4c3c2c1    ....    DCD    3301163713
        0x000020d4:    c8c7c6c5    ....    DCD    3368535749
        0x000020d8:    d4d3d2d1    ....    DCD    3570651857
        0x000020dc:    d8d7d6d5    ....    DCD    3638023893
        0x000020e0:    676f7250    Prog    DCD    1735357008
        0x000020e4:    206d6172    ram     DCD    544039282
        0x000020e8:    7e206b4f    Ok ~    DCD    2116053839
        0x000020ec:    0000000a    ....    DCD    10
        0x000020f0:    676f7250    Prog    DCD    1735357008
        0x000020f4:    206d6172    ram     DCD    544039282
        0x000020f8:    6f727245    Erro    DCD    1869771333
        0x000020fc:    0a7e2072    r ~.    DCD    176038002
        0x00002100:    00000000    ....    DCD    0
        0x00002104:    62616e45    Enab    DCD    1650552389
        0x00002108:    4f20656c    le O    DCD    1327523180
        0x0000210c:    0a7e206b    k ~.    DCD    176037995
        0x00002110:    00000000    ....    DCD    0
        0x00002114:    62616e45    Enab    DCD    1650552389
        0x00002118:    4520656c    le E    DCD    1159751020
        0x0000211c:    726f7272    rror    DCD    1919906418
        0x00002120:    000a7e20     ~..    DCD    687648
        0x00002124:    64617551    Quad    DCD    1684108625
        0x00002128:    61655220     Rea    DCD    1634030112
        0x0000212c:    6b4f2064    d Ok    DCD    1800347748
        0x00002130:    000a7e20     ~..    DCD    687648
        0x00002134:    64617551    Quad    DCD    1684108625
        0x00002138:    61655220     Rea    DCD    1634030112
        0x0000213c:    72452064    d Er    DCD    1917132900
        0x00002140:    20726f72    ror     DCD    544370546
        0x00002144:    00000a7e    ~...    DCD    2686
        0x00002148:    3d206425    %d =    DCD    1025532965
        0x0000214c:    20642520     %d     DCD    543434016
        0x00002150:    00202020       .    DCD    2105376
    $d.realdata
    .constdata
    _aV2C
        0x00002154:    33323130    0123    DCD    858927408
        0x00002158:    37363534    4567    DCD    926299444
        0x0000215c:    42413938    89AB    DCD    1111570744
        0x00002160:    46454443    CDEF    DCD    1178944579
    .conststring
        0x00002164:    65707974    type    DCD    1701869940
        0x00002168:    65533d3d    ==Se    DCD    1699953981
        0x0000216c:    726f7463    ctor    DCD    1919906915
        0x00002170:    6172455f    _Era    DCD    1634878815
        0x00002174:    7c206573    se |    DCD    2082497907
        0x00002178:    7974207c    | ty    DCD    2037653628
        0x0000217c:    3d3d6570    pe==    DCD    1027433840
        0x00002180:    636f6c42    Bloc    DCD    1668246594
        0x00002184:    32335f6b    k_32    DCD    842227563
        0x00002188:    455f424b    KB_E    DCD    1163870795
        0x0000218c:    65736172    rase    DCD    1702060402
        0x00002190:    207c7c20     ||     DCD    545029152
        0x00002194:    65707974    type    DCD    1701869940
        0x00002198:    6c423d3d    ==Bl    DCD    1816280381
        0x0000219c:    5f6b636f    ock_    DCD    1600873327
        0x000021a0:    424b3436    64KB    DCD    1112224822
        0x000021a4:    6172455f    _Era    DCD    1634878815
        0x000021a8:    7c206573    se |    DCD    2082497907
        0x000021ac:    7974207c    | ty    DCD    2037653628
        0x000021b0:    3d3d6570    pe==    DCD    1027433840
        0x000021b4:    70696843    Chip    DCD    1885956163
        0x000021b8:    6172455f    _Era    DCD    1634878815
        0x000021bc:    00006573    se..    DCD    25971
    Region$$Table$$Base
        0x000021c0:    000021e0    .!..    DCD    8672
        0x000021c4:    20000000    ...     DCD    536870912
        0x000021c8:    00000008    ....    DCD    8
        0x000021cc:    00000154    T...    DCD    340
        0x000021d0:    000021e8    .!..    DCD    8680
        0x000021d4:    20000008    ...     DCD    536870920
        0x000021d8:    00000a18    ....    DCD    2584
        0x000021dc:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 8724 (0x2214)
    Size        : 8 bytes (0x8)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000008
    File Offset : 8732 (0x221c)
    Size        : 2584 bytes (0xa18)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 8
    Entry Size  : 0


====================================

** Section #6

    Name        : .debug_abbrev
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 8732 (0x221c)
    Size        : 1476 bytes (0x5c4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #7

    Name        : .debug_frame
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 10208 (0x27e0)
    Size        : 3440 bytes (0xd70)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #8

    Name        : .debug_info
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 13648 (0x3550)
    Size        : 118444 bytes (0x1ceac)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #9

    Name        : .debug_line
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 132092 (0x203fc)
    Size        : 15872 bytes (0x3e00)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #10

    Name        : .debug_loc
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 147964 (0x241fc)
    Size        : 6684 bytes (0x1a1c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #11

    Name        : .debug_macinfo
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 154648 (0x25c18)
    Size        : 8480 bytes (0x2120)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #12

    Name        : .debug_pubnames
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 163128 (0x27d38)
    Size        : 2212 bytes (0x8a4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #13

    Name        : .symtab
    Type        : SHT_SYMTAB (0x00000002)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 165340 (0x285dc)
    Size        : 10064 bytes (0x2750)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 472
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 175404 (0x2ad2c)
    Size        : 8300 bytes (0x206c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

** Section #15

    Name        : .note
    Type        : SHT_NOTE (0x00000007)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 183704 (0x2cd98)
    Size        : 36 bytes (0x24)
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
              5           0

====================================

** Section #16

    Name        : .comment
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 183740 (0x2cdbc)
    Size        : 14084 bytes (0x3704)
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
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\main.o --vfemode=force

    Input Comments:
    
    p3a20-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p3a20-2
    
    
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    
    
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p3654-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p3654-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p1fd0-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p1fd0-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\FLASH_Demo\SDK144\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    flash.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\flash.o --vfemode=force

    Input Comments:
    
    p1d0-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    flash.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\flash.o --depend=.\objects\flash.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\flash.crf ..\sdk\src\soc\driver\flash.c
    
    
    
    
    
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
    
    
    
    qspi.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\qspi.o --vfemode=force

    Input Comments:
    
    pc34-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    qspi.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\qspi.o --depend=.\objects\qspi.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\qspi.crf ..\sdk\src\soc\driver\qspi.c
    
    
    
    dma.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\dma.o --vfemode=force

    Input Comments:
    
    pab4-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    dma.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\dma.o --depend=.\objects\dma.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\dma.crf ..\sdk\src\soc\driver\dma.c
    
    
    
    
    
    
    

====================================

** Section #17

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 197824 (0x304c0)
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

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

