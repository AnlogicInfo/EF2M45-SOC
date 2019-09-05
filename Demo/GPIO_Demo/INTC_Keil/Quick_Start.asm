
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
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 18

    Program header offset: 150052 (0x00024a24)
    Section header offset: 150084 (0x00024a44)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 6704 bytes (0x1a30)
    Size in memory: 9288 bytes (0x2448)
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
    Size        : 6416 bytes (0x1910)
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
        0x0000014c:    000018bc    ....    DCD    6332
        0x00000150:    000018dc    ....    DCD    6364
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
        0x000001ae:    f001fba7    ....    BL       main ; 0x1900
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
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x12d1
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
        0x000001ec:    000012d1    ....    DCD    4817
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
        0x00000508:    4b07        .K      LDR      r3,[pc,#28] ; [0x528] = 0x12bb
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
        0x00000528:    000012bb    ....    DCD    4795
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
        0x0000064a:    f001f893    ....    BL       __aeabi_assert ; 0x1774
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
        0x0000069a:    f001f86b    ..k.    BL       __aeabi_assert ; 0x1774
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
        0x000006ea:    f001f843    ..C.    BL       __aeabi_assert ; 0x1774
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
        0x0000073a:    f001f81b    ....    BL       __aeabi_assert ; 0x1774
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
        0x0000078a:    f000fff3    ....    BL       __aeabi_assert ; 0x1774
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
        0x000007da:    f000ffcb    ....    BL       __aeabi_assert ; 0x1774
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
        0x0000082a:    f000ffa3    ....    BL       __aeabi_assert ; 0x1774
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
        0x0000087a:    f000ff7b    ..{.    BL       __aeabi_assert ; 0x1774
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
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000008b8:    b570        p.      PUSH     {r4-r6,lr}
        0x000008ba:    4d07        .M      LDR      r5,[pc,#28] ; [0x8d8] = 0x88
        0x000008bc:    f1050480    ....    ADD      r4,r5,#0x80
        0x000008c0:    b104        ..      CBZ      r4,0x8c4 ; GPIO_IRQHandler + 12
        0x000008c2:    e004        ..      B        0x8ce ; GPIO_IRQHandler + 22
        0x000008c4:    22d6        ."      MOVS     r2,#0xd6
        0x000008c6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x8dc
        0x000008c8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x8fc
        0x000008ca:    f000ff53    ..S.    BL       __aeabi_assert ; 0x1774
        0x000008ce:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000008d2:    4788        .G      BLX      r1
        0x000008d4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000008d6:    0000        ..      DCW    0
        0x000008d8:    00000088    ....    DCD    136
        0x000008dc:    2e5c2e2e    ..\.    DCD    777793070
        0x000008e0:    2e2e5c2e    .\..    DCD    774790190
        0x000008e4:    464c455c    \ELF    DCD    1179403612
        0x000008e8:    53425f32    2_BS    DCD    1396858674
        0x000008ec:    72445c50    P\Dr    DCD    1917082704
        0x000008f0:    72657669    iver    DCD    1919252073
        0x000008f4:    746e695c    \int    DCD    1953392988
        0x000008f8:    00632e63    c.c.    DCD    6499939
        0x000008fc:    636e7566    func    DCD    1668183398
        0x00000900:    203d2120     !=     DCD    540877088
        0x00000904:    00000030    0...    DCD    48
    $t
    i.GPIO_Int_Register
    GPIO_Int_Register
        0x00000908:    b570        p.      PUSH     {r4-r6,lr}
        0x0000090a:    4604        .F      MOV      r4,r0
        0x0000090c:    460d        .F      MOV      r5,r1
        0x0000090e:    b104        ..      CBZ      r4,0x912 ; GPIO_Int_Register + 10
        0x00000910:    e004        ..      B        0x91c ; GPIO_Int_Register + 20
        0x00000912:    228d        ."      MOVS     r2,#0x8d
        0x00000914:    a104        ..      ADR      r1,{pc}+0x14 ; 0x928
        0x00000916:    a00e        ..      ADR      r0,{pc}+0x3a ; 0x950
        0x00000918:    f000ff2c    ..,.    BL       __aeabi_assert ; 0x1774
        0x0000091c:    462a        *F      MOV      r2,r5
        0x0000091e:    4621        !F      MOV      r1,r4
        0x00000920:    2010        .       MOVS     r0,#0x10
        0x00000922:    f000ffb3    ....    BL       int_callback_register ; 0x188c
        0x00000926:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000928:    2e5c2e2e    ..\.    DCD    777793070
        0x0000092c:    2e2e5c2e    .\..    DCD    774790190
        0x00000930:    464c455c    \ELF    DCD    1179403612
        0x00000934:    53425f32    2_BS    DCD    1396858674
        0x00000938:    72445c50    P\Dr    DCD    1917082704
        0x0000093c:    72657669    iver    DCD    1919252073
        0x00000940:    746e695c    \int    DCD    1953392988
        0x00000944:    6765725f    _reg    DCD    1734701663
        0x00000948:    65747369    iste    DCD    1702130537
        0x0000094c:    00632e72    r.c.    DCD    6499954
        0x00000950:    5f727369    isr_    DCD    1601336169
        0x00000954:    636e7566    func    DCD    1668183398
        0x00000958:    203d2120     !=     DCD    540877088
        0x0000095c:    00000030    0...    DCD    48
    $t
    i.HAL_GPIO_ClrIrq
    HAL_GPIO_ClrIrq
        0x00000960:    2201        ."      MOVS     r2,#1
        0x00000962:    fa02f100    ....    LSL      r1,r2,r0
        0x00000966:    4a02        .J      LDR      r2,[pc,#8] ; [0x970] = 0x40007000
        0x00000968:    64d1        .d      STR      r1,[r2,#0x4c]
        0x0000096a:    bf00        ..      NOP      
        0x0000096c:    4770        pG      BX       lr
    $d
        0x0000096e:    0000        ..      DCW    0
        0x00000970:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x00000974:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000976:    4604        .F      MOV      r4,r0
        0x00000978:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x0000097c:    4620         F      MOV      r0,r4
        0x0000097e:    f000f849    ..I.    BL       HAL_GPIO_SetDir ; 0xa14
        0x00000982:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000986:    2801        .(      CMP      r0,#1
        0x00000988:    d105        ..      BNE      0x996 ; HAL_GPIO_Init + 34
        0x0000098a:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x0000098e:    4620         F      MOV      r0,r4
        0x00000990:    f000f8d8    ....    BL       HAL_GPIO_WritePin ; 0xb44
        0x00000994:    e009        ..      B        0x9aa ; HAL_GPIO_Init + 54
        0x00000996:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x0000099a:    4620         F      MOV      r0,r4
        0x0000099c:    f000f81e    ....    BL       HAL_GPIO_SetDebounce ; 0x9dc
        0x000009a0:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000009a4:    4620         F      MOV      r0,r4
        0x000009a6:    f000f88b    ....    BL       HAL_GPIO_TrigType ; 0xac0
        0x000009aa:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_IntEnable
    HAL_GPIO_IntEnable
        0x000009ac:    b570        p.      PUSH     {r4-r6,lr}
        0x000009ae:    4604        .F      MOV      r4,r0
        0x000009b0:    bf00        ..      NOP      
        0x000009b2:    4805        .H      LDR      r0,[pc,#20] ; [0x9c8] = 0x40007000
        0x000009b4:    6b00        .k      LDR      r0,[r0,#0x30]
        0x000009b6:    b280        ..      UXTH     r0,r0
        0x000009b8:    4605        .F      MOV      r5,r0
        0x000009ba:    2001        .       MOVS     r0,#1
        0x000009bc:    40a0        .@      LSLS     r0,r0,r4
        0x000009be:    4305        .C      ORRS     r5,r5,r0
        0x000009c0:    b2a8        ..      UXTH     r0,r5
        0x000009c2:    f000ff17    ....    BL       gpio_interruptenable_setf ; 0x17f4
        0x000009c6:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000009c8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_IntStatus
    HAL_GPIO_IntStatus
        0x000009cc:    bf00        ..      NOP      
        0x000009ce:    4802        .H      LDR      r0,[pc,#8] ; [0x9d8] = 0x40007000
        0x000009d0:    6c00        .l      LDR      r0,[r0,#0x40]
        0x000009d2:    b280        ..      UXTH     r0,r0
        0x000009d4:    4770        pG      BX       lr
    $d
        0x000009d6:    0000        ..      DCW    0
        0x000009d8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x000009dc:    b530        0.      PUSH     {r4,r5,lr}
        0x000009de:    460a        .F      MOV      r2,r1
        0x000009e0:    bf00        ..      NOP      
        0x000009e2:    4b0b        .K      LDR      r3,[pc,#44] ; [0xa10] = 0x40007000
        0x000009e4:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x000009e6:    b29b        ..      UXTH     r3,r3
        0x000009e8:    4619        .F      MOV      r1,r3
        0x000009ea:    2a01        .*      CMP      r2,#1
        0x000009ec:    d103        ..      BNE      0x9f6 ; HAL_GPIO_SetDebounce + 26
        0x000009ee:    2301        .#      MOVS     r3,#1
        0x000009f0:    4083        .@      LSLS     r3,r3,r0
        0x000009f2:    4319        .C      ORRS     r1,r1,r3
        0x000009f4:    e002        ..      B        0x9fc ; HAL_GPIO_SetDebounce + 32
        0x000009f6:    2301        .#      MOVS     r3,#1
        0x000009f8:    4083        .@      LSLS     r3,r3,r0
        0x000009fa:    4399        .C      BICS     r1,r1,r3
        0x000009fc:    b28b        ..      UXTH     r3,r1
        0x000009fe:    4c04        .L      LDR      r4,[pc,#16] ; [0xa10] = 0x40007000
        0x00000a00:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000a02:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000a06:    4d02        .M      LDR      r5,[pc,#8] ; [0xa10] = 0x40007000
        0x00000a08:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000a0a:    bf00        ..      NOP      
        0x00000a0c:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000a0e:    0000        ..      DCW    0
        0x00000a10:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000a14:    b530        0.      PUSH     {r4,r5,lr}
        0x00000a16:    4602        .F      MOV      r2,r0
        0x00000a18:    2a10        .*      CMP      r2,#0x10
        0x00000a1a:    da16        ..      BGE      0xa4a ; HAL_GPIO_SetDir + 54
        0x00000a1c:    bf00        ..      NOP      
        0x00000a1e:    4b19        .K      LDR      r3,[pc,#100] ; [0xa84] = 0x40007000
        0x00000a20:    685b        [h      LDR      r3,[r3,#4]
        0x00000a22:    b298        ..      UXTH     r0,r3
        0x00000a24:    bf00        ..      NOP      
        0x00000a26:    2901        .)      CMP      r1,#1
        0x00000a28:    d103        ..      BNE      0xa32 ; HAL_GPIO_SetDir + 30
        0x00000a2a:    2301        .#      MOVS     r3,#1
        0x00000a2c:    4093        .@      LSLS     r3,r3,r2
        0x00000a2e:    4318        .C      ORRS     r0,r0,r3
        0x00000a30:    e002        ..      B        0xa38 ; HAL_GPIO_SetDir + 36
        0x00000a32:    2301        .#      MOVS     r3,#1
        0x00000a34:    4093        .@      LSLS     r3,r3,r2
        0x00000a36:    4398        .C      BICS     r0,r0,r3
        0x00000a38:    b283        ..      UXTH     r3,r0
        0x00000a3a:    4c12        .L      LDR      r4,[pc,#72] ; [0xa84] = 0x40007000
        0x00000a3c:    6864        dh      LDR      r4,[r4,#4]
        0x00000a3e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000a42:    4d10        .M      LDR      r5,[pc,#64] ; [0xa84] = 0x40007000
        0x00000a44:    606c        l`      STR      r4,[r5,#4]
        0x00000a46:    bf00        ..      NOP      
        0x00000a48:    e01b        ..      B        0xa82 ; HAL_GPIO_SetDir + 110
        0x00000a4a:    bf00        ..      NOP      
        0x00000a4c:    4b0d        .K      LDR      r3,[pc,#52] ; [0xa84] = 0x40007000
        0x00000a4e:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000a50:    b298        ..      UXTH     r0,r3
        0x00000a52:    bf00        ..      NOP      
        0x00000a54:    2901        .)      CMP      r1,#1
        0x00000a56:    d106        ..      BNE      0xa66 ; HAL_GPIO_SetDir + 82
        0x00000a58:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000a5c:    2401        .$      MOVS     r4,#1
        0x00000a5e:    fa04f303    ....    LSL      r3,r4,r3
        0x00000a62:    4318        .C      ORRS     r0,r0,r3
        0x00000a64:    e004        ..      B        0xa70 ; HAL_GPIO_SetDir + 92
        0x00000a66:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000a6a:    2401        .$      MOVS     r4,#1
        0x00000a6c:    409c        .@      LSLS     r4,r4,r3
        0x00000a6e:    43a0        .C      BICS     r0,r0,r4
        0x00000a70:    b283        ..      UXTH     r3,r0
        0x00000a72:    4c04        .L      LDR      r4,[pc,#16] ; [0xa84] = 0x40007000
        0x00000a74:    6924        $i      LDR      r4,[r4,#0x10]
        0x00000a76:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000a7a:    4d02        .M      LDR      r5,[pc,#8] ; [0xa84] = 0x40007000
        0x00000a7c:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000a7e:    bf00        ..      NOP      
        0x00000a80:    bf00        ..      NOP      
        0x00000a82:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000a84:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000a88:    b530        0.      PUSH     {r4,r5,lr}
        0x00000a8a:    460a        .F      MOV      r2,r1
        0x00000a8c:    bf00        ..      NOP      
        0x00000a8e:    4b0b        .K      LDR      r3,[pc,#44] ; [0xabc] = 0x40007000
        0x00000a90:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000a92:    b29b        ..      UXTH     r3,r3
        0x00000a94:    4619        .F      MOV      r1,r3
        0x00000a96:    2a01        .*      CMP      r2,#1
        0x00000a98:    d103        ..      BNE      0xaa2 ; HAL_GPIO_SetPly + 26
        0x00000a9a:    2301        .#      MOVS     r3,#1
        0x00000a9c:    4083        .@      LSLS     r3,r3,r0
        0x00000a9e:    4319        .C      ORRS     r1,r1,r3
        0x00000aa0:    e002        ..      B        0xaa8 ; HAL_GPIO_SetPly + 32
        0x00000aa2:    2301        .#      MOVS     r3,#1
        0x00000aa4:    4083        .@      LSLS     r3,r3,r0
        0x00000aa6:    4399        .C      BICS     r1,r1,r3
        0x00000aa8:    b28b        ..      UXTH     r3,r1
        0x00000aaa:    4c04        .L      LDR      r4,[pc,#16] ; [0xabc] = 0x40007000
        0x00000aac:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000aae:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000ab2:    4d02        .M      LDR      r5,[pc,#8] ; [0xabc] = 0x40007000
        0x00000ab4:    63ec        .c      STR      r4,[r5,#0x3c]
        0x00000ab6:    bf00        ..      NOP      
        0x00000ab8:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000aba:    0000        ..      DCW    0
        0x00000abc:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000ac0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000ac2:    4605        .F      MOV      r5,r0
        0x00000ac4:    460c        .F      MOV      r4,r1
        0x00000ac6:    b134        4.      CBZ      r4,0xad6 ; HAL_GPIO_TrigType + 22
        0x00000ac8:    2c01        .,      CMP      r4,#1
        0x00000aca:    d00d        ..      BEQ      0xae8 ; HAL_GPIO_TrigType + 40
        0x00000acc:    2c02        .,      CMP      r4,#2
        0x00000ace:    d014        ..      BEQ      0xafa ; HAL_GPIO_TrigType + 58
        0x00000ad0:    2c03        .,      CMP      r4,#3
        0x00000ad2:    d124        $.      BNE      0xb1e ; HAL_GPIO_TrigType + 94
        0x00000ad4:    e01a        ..      B        0xb0c ; HAL_GPIO_TrigType + 76
        0x00000ad6:    2100        .!      MOVS     r1,#0
        0x00000ad8:    4628        (F      MOV      r0,r5
        0x00000ada:    f000f861    ..a.    BL       HAL_GPIO_setIrqLevel ; 0xba0
        0x00000ade:    2100        .!      MOVS     r1,#0
        0x00000ae0:    4628        (F      MOV      r0,r5
        0x00000ae2:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0xa88
        0x00000ae6:    e01a        ..      B        0xb1e ; HAL_GPIO_TrigType + 94
        0x00000ae8:    2100        .!      MOVS     r1,#0
        0x00000aea:    4628        (F      MOV      r0,r5
        0x00000aec:    f000f858    ..X.    BL       HAL_GPIO_setIrqLevel ; 0xba0
        0x00000af0:    2101        .!      MOVS     r1,#1
        0x00000af2:    4628        (F      MOV      r0,r5
        0x00000af4:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0xa88
        0x00000af8:    e011        ..      B        0xb1e ; HAL_GPIO_TrigType + 94
        0x00000afa:    2101        .!      MOVS     r1,#1
        0x00000afc:    4628        (F      MOV      r0,r5
        0x00000afe:    f000f84f    ..O.    BL       HAL_GPIO_setIrqLevel ; 0xba0
        0x00000b02:    2100        .!      MOVS     r1,#0
        0x00000b04:    4628        (F      MOV      r0,r5
        0x00000b06:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0xa88
        0x00000b0a:    e008        ..      B        0xb1e ; HAL_GPIO_TrigType + 94
        0x00000b0c:    2101        .!      MOVS     r1,#1
        0x00000b0e:    4628        (F      MOV      r0,r5
        0x00000b10:    f000f846    ..F.    BL       HAL_GPIO_setIrqLevel ; 0xba0
        0x00000b14:    2101        .!      MOVS     r1,#1
        0x00000b16:    4628        (F      MOV      r0,r5
        0x00000b18:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0xa88
        0x00000b1c:    bf00        ..      NOP      
        0x00000b1e:    bf00        ..      NOP      
        0x00000b20:    bd70        p.      POP      {r4-r6,pc}
        0x00000b22:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_UnmaskIrq
    HAL_GPIO_UnmaskIrq
        0x00000b24:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b26:    4605        .F      MOV      r5,r0
        0x00000b28:    bf00        ..      NOP      
        0x00000b2a:    4805        .H      LDR      r0,[pc,#20] ; [0xb40] = 0x40007000
        0x00000b2c:    6b40        @k      LDR      r0,[r0,#0x34]
        0x00000b2e:    b280        ..      UXTH     r0,r0
        0x00000b30:    4604        .F      MOV      r4,r0
        0x00000b32:    2001        .       MOVS     r0,#1
        0x00000b34:    40a8        .@      LSLS     r0,r0,r5
        0x00000b36:    4384        .C      BICS     r4,r4,r0
        0x00000b38:    4620         F      MOV      r0,r4
        0x00000b3a:    f000fe51    ..Q.    BL       gpio_int_mask_setf ; 0x17e0
        0x00000b3e:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000b40:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000b44:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b46:    4605        .F      MOV      r5,r0
        0x00000b48:    460e        .F      MOV      r6,r1
        0x00000b4a:    2d10        .-      CMP      r5,#0x10
        0x00000b4c:    da10        ..      BGE      0xb70 ; HAL_GPIO_WritePin + 44
        0x00000b4e:    bf00        ..      NOP      
        0x00000b50:    4812        .H      LDR      r0,[pc,#72] ; [0xb9c] = 0x40007000
        0x00000b52:    6800        .h      LDR      r0,[r0,#0]
        0x00000b54:    b284        ..      UXTH     r4,r0
        0x00000b56:    bf00        ..      NOP      
        0x00000b58:    b91e        ..      CBNZ     r6,0xb62 ; HAL_GPIO_WritePin + 30
        0x00000b5a:    2001        .       MOVS     r0,#1
        0x00000b5c:    40a8        .@      LSLS     r0,r0,r5
        0x00000b5e:    4384        .C      BICS     r4,r4,r0
        0x00000b60:    e002        ..      B        0xb68 ; HAL_GPIO_WritePin + 36
        0x00000b62:    2001        .       MOVS     r0,#1
        0x00000b64:    40a8        .@      LSLS     r0,r0,r5
        0x00000b66:    4304        .C      ORRS     r4,r4,r0
        0x00000b68:    b2a0        ..      UXTH     r0,r4
        0x00000b6a:    f000fe7b    ..{.    BL       gpio_portadataregister_setf ; 0x1864
        0x00000b6e:    e014        ..      B        0xb9a ; HAL_GPIO_WritePin + 86
        0x00000b70:    bf00        ..      NOP      
        0x00000b72:    480a        .H      LDR      r0,[pc,#40] ; [0xb9c] = 0x40007000
        0x00000b74:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000b76:    b284        ..      UXTH     r4,r0
        0x00000b78:    bf00        ..      NOP      
        0x00000b7a:    b92e        ..      CBNZ     r6,0xb88 ; HAL_GPIO_WritePin + 68
        0x00000b7c:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000b80:    2101        .!      MOVS     r1,#1
        0x00000b82:    4081        .@      LSLS     r1,r1,r0
        0x00000b84:    438c        .C      BICS     r4,r4,r1
        0x00000b86:    e005        ..      B        0xb94 ; HAL_GPIO_WritePin + 80
        0x00000b88:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000b8c:    2101        .!      MOVS     r1,#1
        0x00000b8e:    fa01f000    ....    LSL      r0,r1,r0
        0x00000b92:    4304        .C      ORRS     r4,r4,r0
        0x00000b94:    b2a0        ..      UXTH     r0,r4
        0x00000b96:    f000fe6f    ..o.    BL       gpio_portbdataregister_setf ; 0x1878
        0x00000b9a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000b9c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000ba0:    b530        0.      PUSH     {r4,r5,lr}
        0x00000ba2:    460a        .F      MOV      r2,r1
        0x00000ba4:    bf00        ..      NOP      
        0x00000ba6:    4b0b        .K      LDR      r3,[pc,#44] ; [0xbd4] = 0x40007000
        0x00000ba8:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000baa:    b29b        ..      UXTH     r3,r3
        0x00000bac:    4619        .F      MOV      r1,r3
        0x00000bae:    2a01        .*      CMP      r2,#1
        0x00000bb0:    d103        ..      BNE      0xbba ; HAL_GPIO_setIrqLevel + 26
        0x00000bb2:    2301        .#      MOVS     r3,#1
        0x00000bb4:    4083        .@      LSLS     r3,r3,r0
        0x00000bb6:    4319        .C      ORRS     r1,r1,r3
        0x00000bb8:    e002        ..      B        0xbc0 ; HAL_GPIO_setIrqLevel + 32
        0x00000bba:    2301        .#      MOVS     r3,#1
        0x00000bbc:    4083        .@      LSLS     r3,r3,r0
        0x00000bbe:    4399        .C      BICS     r1,r1,r3
        0x00000bc0:    b28b        ..      UXTH     r3,r1
        0x00000bc2:    4c04        .L      LDR      r4,[pc,#16] ; [0xbd4] = 0x40007000
        0x00000bc4:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000bc6:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000bca:    4d02        .M      LDR      r5,[pc,#8] ; [0xbd4] = 0x40007000
        0x00000bcc:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000bce:    bf00        ..      NOP      
        0x00000bd0:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000bd2:    0000        ..      DCW    0
        0x00000bd4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000bd8:    bf00        ..      NOP      
        0x00000bda:    4904        .I      LDR      r1,[pc,#16] ; [0xbec] = 0x40020000
        0x00000bdc:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000bde:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000be2:    4a02        .J      LDR      r2,[pc,#8] ; [0xbec] = 0x40020000
        0x00000be4:    6111        .a      STR      r1,[r2,#0x10]
        0x00000be6:    bf00        ..      NOP      
        0x00000be8:    4770        pG      BX       lr
    $d
        0x00000bea:    0000        ..      DCW    0
        0x00000bec:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000bf0:    b510        ..      PUSH     {r4,lr}
        0x00000bf2:    4604        .F      MOV      r4,r0
        0x00000bf4:    1e60        `.      SUBS     r0,r4,#1
        0x00000bf6:    280f        .(      CMP      r0,#0xf
        0x00000bf8:    dc00        ..      BGT      0xbfc ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000bfa:    e004        ..      B        0xc06 ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000bfc:    2225        %"      MOVS     r2,#0x25
        0x00000bfe:    a108        ..      ADR      r1,{pc}+0x22 ; 0xc20
        0x00000c00:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xc40
        0x00000c02:    f000fdb7    ....    BL       __aeabi_assert ; 0x1774
        0x00000c06:    1e61        a.      SUBS     r1,r4,#1
        0x00000c08:    b2c8        ..      UXTB     r0,r1
        0x00000c0a:    4913        .I      LDR      r1,[pc,#76] ; [0xc58] = 0x40020000
        0x00000c0c:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c0e:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000c12:    4a11        .J      LDR      r2,[pc,#68] ; [0xc58] = 0x40020000
        0x00000c14:    6051        Q`      STR      r1,[r2,#4]
        0x00000c16:    bf00        ..      NOP      
        0x00000c18:    2001        .       MOVS     r0,#1
        0x00000c1a:    f000fe85    ....    BL       sysc_awo_div_update_set ; 0x1928
        0x00000c1e:    bd10        ..      POP      {r4,pc}
    $d
        0x00000c20:    735c2e2e    ..\s    DCD    1935420974
        0x00000c24:    735c6b64    dk\s    DCD    1935436644
        0x00000c28:    735c6372    rc\s    DCD    1935434610
        0x00000c2c:    645c636f    oc\d    DCD    1683776367
        0x00000c30:    65766972    rive    DCD    1702259058
        0x00000c34:    79735c72    r\sy    DCD    2037603442
        0x00000c38:    6e6f6373    scon    DCD    1852793715
        0x00000c3c:    0000632e    .c..    DCD    25390
        0x00000c40:    62686128    (ahb    DCD    1651007784
        0x00000c44:    7669645f    _div    DCD    1986618463
        0x00000c48:    72656469    ider    DCD    1919247465
        0x00000c4c:    3c29312d    -1)<    DCD    1009332525
        0x00000c50:    6678303d    =0xf    DCD    1719152701
        0x00000c54:    00000000    ....    DCD    0
        0x00000c58:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000c5c:    b510        ..      PUSH     {r4,lr}
        0x00000c5e:    4604        .F      MOV      r4,r0
        0x00000c60:    1e60        `.      SUBS     r0,r4,#1
        0x00000c62:    280f        .(      CMP      r0,#0xf
        0x00000c64:    dc00        ..      BGT      0xc68 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000c66:    e004        ..      B        0xc72 ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000c68:    222c        ,"      MOVS     r2,#0x2c
        0x00000c6a:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xc94
        0x00000c6c:    a011        ..      ADR      r0,{pc}+0x48 ; 0xcb4
        0x00000c6e:    f000fd81    ....    BL       __aeabi_assert ; 0x1774
        0x00000c72:    1e61        a.      SUBS     r1,r4,#1
        0x00000c74:    b2c8        ..      UXTB     r0,r1
        0x00000c76:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000c7a:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c7c:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000c80:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000c84:    6051        Q`      STR      r1,[r2,#4]
        0x00000c86:    bf00        ..      NOP      
        0x00000c88:    2001        .       MOVS     r0,#1
        0x00000c8a:    0781        ..      LSLS     r1,r0,#30
        0x00000c8c:    6008        .`      STR      r0,[r1,#0]
        0x00000c8e:    bf00        ..      NOP      
        0x00000c90:    bd10        ..      POP      {r4,pc}
    $d
        0x00000c92:    0000        ..      DCW    0
        0x00000c94:    735c2e2e    ..\s    DCD    1935420974
        0x00000c98:    735c6b64    dk\s    DCD    1935436644
        0x00000c9c:    735c6372    rc\s    DCD    1935434610
        0x00000ca0:    645c636f    oc\d    DCD    1683776367
        0x00000ca4:    65766972    rive    DCD    1702259058
        0x00000ca8:    79735c72    r\sy    DCD    2037603442
        0x00000cac:    6e6f6373    scon    DCD    1852793715
        0x00000cb0:    0000632e    .c..    DCD    25390
        0x00000cb4:    62706128    (apb    DCD    1651532072
        0x00000cb8:    69645f30    0_di    DCD    1768185648
        0x00000cbc:    65646976    vide    DCD    1701079414
        0x00000cc0:    29312d72    r-1)    DCD    691088754
        0x00000cc4:    78303d3c    <=0x    DCD    2016427324
        0x00000cc8:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000ccc:    b510        ..      PUSH     {r4,lr}
        0x00000cce:    4604        .F      MOV      r4,r0
        0x00000cd0:    1e60        `.      SUBS     r0,r4,#1
        0x00000cd2:    280f        .(      CMP      r0,#0xf
        0x00000cd4:    dc00        ..      BGT      0xcd8 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000cd6:    e004        ..      B        0xce2 ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000cd8:    2234        4"      MOVS     r2,#0x34
        0x00000cda:    a108        ..      ADR      r1,{pc}+0x22 ; 0xcfc
        0x00000cdc:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xd1c
        0x00000cde:    f000fd49    ..I.    BL       __aeabi_assert ; 0x1774
        0x00000ce2:    1e61        a.      SUBS     r1,r4,#1
        0x00000ce4:    b2c8        ..      UXTB     r0,r1
        0x00000ce6:    4913        .I      LDR      r1,[pc,#76] ; [0xd34] = 0x40020000
        0x00000ce8:    6849        Ih      LDR      r1,[r1,#4]
        0x00000cea:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000cee:    4a11        .J      LDR      r2,[pc,#68] ; [0xd34] = 0x40020000
        0x00000cf0:    6051        Q`      STR      r1,[r2,#4]
        0x00000cf2:    bf00        ..      NOP      
        0x00000cf4:    2002        .       MOVS     r0,#2
        0x00000cf6:    f000fe17    ....    BL       sysc_awo_div_update_set ; 0x1928
        0x00000cfa:    bd10        ..      POP      {r4,pc}
    $d
        0x00000cfc:    735c2e2e    ..\s    DCD    1935420974
        0x00000d00:    735c6b64    dk\s    DCD    1935436644
        0x00000d04:    735c6372    rc\s    DCD    1935434610
        0x00000d08:    645c636f    oc\d    DCD    1683776367
        0x00000d0c:    65766972    rive    DCD    1702259058
        0x00000d10:    79735c72    r\sy    DCD    2037603442
        0x00000d14:    6e6f6373    scon    DCD    1852793715
        0x00000d18:    0000632e    .c..    DCD    25390
        0x00000d1c:    62706128    (apb    DCD    1651532072
        0x00000d20:    69645f31    1_di    DCD    1768185649
        0x00000d24:    65646976    vide    DCD    1701079414
        0x00000d28:    29312d72    r-1)    DCD    691088754
        0x00000d2c:    78303d3c    <=0x    DCD    2016427324
        0x00000d30:    00000066    f...    DCD    102
        0x00000d34:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000d38:    b570        p.      PUSH     {r4-r6,lr}
        0x00000d3a:    4605        .F      MOV      r5,r0
        0x00000d3c:    460c        .F      MOV      r4,r1
        0x00000d3e:    1e60        `.      SUBS     r0,r4,#1
        0x00000d40:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000d44:    da00        ..      BGE      0xd48 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000d46:    e004        ..      B        0xd52 ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000d48:    223c        <"      MOVS     r2,#0x3c
        0x00000d4a:    a112        ..      ADR      r1,{pc}+0x4a ; 0xd94
        0x00000d4c:    a019        ..      ADR      r0,{pc}+0x68 ; 0xdb4
        0x00000d4e:    f000fd11    ....    BL       __aeabi_assert ; 0x1774
        0x00000d52:    2d01        .-      CMP      r5,#1
        0x00000d54:    dc00        ..      BGT      0xd58 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000d56:    e004        ..      B        0xd62 ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000d58:    223d        ="      MOVS     r2,#0x3d
        0x00000d5a:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xd94
        0x00000d5c:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xdcc
        0x00000d5e:    f000fd09    ....    BL       __aeabi_assert ; 0x1774
        0x00000d62:    b935        5.      CBNZ     r5,0xd72 ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000d64:    2000        .       MOVS     r0,#0
        0x00000d66:    f000fde5    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1934
        0x00000d6a:    2004        .       MOVS     r0,#4
        0x00000d6c:    f000fddc    ....    BL       sysc_awo_div_update_set ; 0x1928
        0x00000d70:    e00e        ..      B        0xd90 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000d72:    2c02        .,      CMP      r4,#2
        0x00000d74:    db00        ..      BLT      0xd78 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000d76:    e004        ..      B        0xd82 ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000d78:    2247        G"      MOVS     r2,#0x47
        0x00000d7a:    a106        ..      ADR      r1,{pc}+0x1a ; 0xd94
        0x00000d7c:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xde8
        0x00000d7e:    f000fcf9    ....    BL       __aeabi_assert ; 0x1774
        0x00000d82:    1e61        a.      SUBS     r1,r4,#1
        0x00000d84:    b288        ..      UXTH     r0,r1
        0x00000d86:    f000fdd5    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1934
        0x00000d8a:    2004        .       MOVS     r0,#4
        0x00000d8c:    f000fdcc    ....    BL       sysc_awo_div_update_set ; 0x1928
        0x00000d90:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000d92:    0000        ..      DCW    0
        0x00000d94:    735c2e2e    ..\s    DCD    1935420974
        0x00000d98:    735c6b64    dk\s    DCD    1935436644
        0x00000d9c:    735c6372    rc\s    DCD    1935434610
        0x00000da0:    645c636f    oc\d    DCD    1683776367
        0x00000da4:    65766972    rive    DCD    1702259058
        0x00000da8:    79735c72    r\sy    DCD    2037603442
        0x00000dac:    6e6f6373    scon    DCD    1852793715
        0x00000db0:    0000632e    .c..    DCD    25390
        0x00000db4:    63747228    (rtc    DCD    1668575784
        0x00000db8:    7669645f    _div    DCD    1986618463
        0x00000dbc:    72656469    ider    DCD    1919247465
        0x00000dc0:    3c29312d    -1)<    DCD    1009332525
        0x00000dc4:    3178303d    =0x1    DCD    829960253
        0x00000dc8:    00666666    fff.    DCD    6710886
        0x00000dcc:    5f637472    rtc_    DCD    1600353394
        0x00000dd0:    3c637273    src<    DCD    1013150323
        0x00000dd4:    6374723d    =rtc    DCD    1668575805
        0x00000dd8:    5f6b6c63    clk_    DCD    1600875619
        0x00000ddc:    6d6f7266    from    DCD    1836020326
        0x00000de0:    6268615f    _ahb    DCD    1651007839
        0x00000de4:    00000000    ....    DCD    0
        0x00000de8:    5f637472    rtc_    DCD    1600353394
        0x00000dec:    69766964    divi    DCD    1769367908
        0x00000df0:    3e726564    der>    DCD    1047684452
        0x00000df4:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000df8:    b570        p.      PUSH     {r4-r6,lr}
        0x00000dfa:    4d07        .M      LDR      r5,[pc,#28] ; [0xe18] = 0x88
        0x00000dfc:    f1050460    ..`.    ADD      r4,r5,#0x60
        0x00000e00:    b104        ..      CBZ      r4,0xe04 ; I2C0_IRQHandler + 12
        0x00000e02:    e004        ..      B        0xe0e ; I2C0_IRQHandler + 22
        0x00000e04:    22ae        ."      MOVS     r2,#0xae
        0x00000e06:    a105        ..      ADR      r1,{pc}+0x16 ; 0xe1c
        0x00000e08:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xe3c
        0x00000e0a:    f000fcb3    ....    BL       __aeabi_assert ; 0x1774
        0x00000e0e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000e12:    4788        .G      BLX      r1
        0x00000e14:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e16:    0000        ..      DCW    0
        0x00000e18:    00000088    ....    DCD    136
        0x00000e1c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000e20:    2e2e5c2e    .\..    DCD    774790190
        0x00000e24:    464c455c    \ELF    DCD    1179403612
        0x00000e28:    53425f32    2_BS    DCD    1396858674
        0x00000e2c:    72445c50    P\Dr    DCD    1917082704
        0x00000e30:    72657669    iver    DCD    1919252073
        0x00000e34:    746e695c    \int    DCD    1953392988
        0x00000e38:    00632e63    c.c.    DCD    6499939
        0x00000e3c:    636e7566    func    DCD    1668183398
        0x00000e40:    203d2120     !=     DCD    540877088
        0x00000e44:    00000030    0...    DCD    48
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000e48:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e4a:    4d07        .M      LDR      r5,[pc,#28] ; [0xe68] = 0x88
        0x00000e4c:    f1050468    ..h.    ADD      r4,r5,#0x68
        0x00000e50:    b104        ..      CBZ      r4,0xe54 ; I2C1_IRQHandler + 12
        0x00000e52:    e004        ..      B        0xe5e ; I2C1_IRQHandler + 22
        0x00000e54:    22b8        ."      MOVS     r2,#0xb8
        0x00000e56:    a105        ..      ADR      r1,{pc}+0x16 ; 0xe6c
        0x00000e58:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xe8c
        0x00000e5a:    f000fc8b    ....    BL       __aeabi_assert ; 0x1774
        0x00000e5e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000e62:    4788        .G      BLX      r1
        0x00000e64:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e66:    0000        ..      DCW    0
        0x00000e68:    00000088    ....    DCD    136
        0x00000e6c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000e70:    2e2e5c2e    .\..    DCD    774790190
        0x00000e74:    464c455c    \ELF    DCD    1179403612
        0x00000e78:    53425f32    2_BS    DCD    1396858674
        0x00000e7c:    72445c50    P\Dr    DCD    1917082704
        0x00000e80:    72657669    iver    DCD    1919252073
        0x00000e84:    746e695c    \int    DCD    1953392988
        0x00000e88:    00632e63    c.c.    DCD    6499939
        0x00000e8c:    636e7566    func    DCD    1668183398
        0x00000e90:    203d2120     !=     DCD    540877088
        0x00000e94:    00000030    0...    DCD    48
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00000e98:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e9a:    4d07        .M      LDR      r5,[pc,#28] ; [0xeb8] = 0x88
        0x00000e9c:    f1050488    ....    ADD      r4,r5,#0x88
        0x00000ea0:    b104        ..      CBZ      r4,0xea4 ; I2S_IRQHandler + 12
        0x00000ea2:    e004        ..      B        0xeae ; I2S_IRQHandler + 22
        0x00000ea4:    22e0        ."      MOVS     r2,#0xe0
        0x00000ea6:    a105        ..      ADR      r1,{pc}+0x16 ; 0xebc
        0x00000ea8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xedc
        0x00000eaa:    f000fc63    ..c.    BL       __aeabi_assert ; 0x1774
        0x00000eae:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000eb2:    4788        .G      BLX      r1
        0x00000eb4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000eb6:    0000        ..      DCW    0
        0x00000eb8:    00000088    ....    DCD    136
        0x00000ebc:    2e5c2e2e    ..\.    DCD    777793070
        0x00000ec0:    2e2e5c2e    .\..    DCD    774790190
        0x00000ec4:    464c455c    \ELF    DCD    1179403612
        0x00000ec8:    53425f32    2_BS    DCD    1396858674
        0x00000ecc:    72445c50    P\Dr    DCD    1917082704
        0x00000ed0:    72657669    iver    DCD    1919252073
        0x00000ed4:    746e695c    \int    DCD    1953392988
        0x00000ed8:    00632e63    c.c.    DCD    6499939
        0x00000edc:    636e7566    func    DCD    1668183398
        0x00000ee0:    203d2120     !=     DCD    540877088
        0x00000ee4:    00000030    0...    DCD    48
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00000ee8:    b570        p.      PUSH     {r4-r6,lr}
        0x00000eea:    4d07        .M      LDR      r5,[pc,#28] ; [0xf08] = 0x88
        0x00000eec:    f1050420    .. .    ADD      r4,r5,#0x20
        0x00000ef0:    b104        ..      CBZ      r4,0xef4 ; QSPI_IRQHandler + 12
        0x00000ef2:    e004        ..      B        0xefe ; QSPI_IRQHandler + 22
        0x00000ef4:    2259        Y"      MOVS     r2,#0x59
        0x00000ef6:    a105        ..      ADR      r1,{pc}+0x16 ; 0xf0c
        0x00000ef8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xf2c
        0x00000efa:    f000fc3b    ..;.    BL       __aeabi_assert ; 0x1774
        0x00000efe:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000f02:    4788        .G      BLX      r1
        0x00000f04:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f06:    0000        ..      DCW    0
        0x00000f08:    00000088    ....    DCD    136
        0x00000f0c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000f10:    2e2e5c2e    .\..    DCD    774790190
        0x00000f14:    464c455c    \ELF    DCD    1179403612
        0x00000f18:    53425f32    2_BS    DCD    1396858674
        0x00000f1c:    72445c50    P\Dr    DCD    1917082704
        0x00000f20:    72657669    iver    DCD    1919252073
        0x00000f24:    746e695c    \int    DCD    1953392988
        0x00000f28:    00632e63    c.c.    DCD    6499939
        0x00000f2c:    636e7566    func    DCD    1668183398
        0x00000f30:    203d2120     !=     DCD    540877088
        0x00000f34:    00000030    0...    DCD    48
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00000f38:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f3a:    4d07        .M      LDR      r5,[pc,#28] ; [0xf58] = 0x88
        0x00000f3c:    f1050410    ....    ADD      r4,r5,#0x10
        0x00000f40:    b104        ..      CBZ      r4,0xf44 ; RTC_IRQHandler + 12
        0x00000f42:    e004        ..      B        0xf4e ; RTC_IRQHandler + 22
        0x00000f44:    2243        C"      MOVS     r2,#0x43
        0x00000f46:    a105        ..      ADR      r1,{pc}+0x16 ; 0xf5c
        0x00000f48:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xf7c
        0x00000f4a:    f000fc13    ....    BL       __aeabi_assert ; 0x1774
        0x00000f4e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000f52:    4788        .G      BLX      r1
        0x00000f54:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f56:    0000        ..      DCW    0
        0x00000f58:    00000088    ....    DCD    136
        0x00000f5c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000f60:    2e2e5c2e    .\..    DCD    774790190
        0x00000f64:    464c455c    \ELF    DCD    1179403612
        0x00000f68:    53425f32    2_BS    DCD    1396858674
        0x00000f6c:    72445c50    P\Dr    DCD    1917082704
        0x00000f70:    72657669    iver    DCD    1919252073
        0x00000f74:    746e695c    \int    DCD    1953392988
        0x00000f78:    00632e63    c.c.    DCD    6499939
        0x00000f7c:    636e7566    func    DCD    1668183398
        0x00000f80:    203d2120     !=     DCD    540877088
        0x00000f84:    00000030    0...    DCD    48
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00000f88:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000f8c:    4604        .F      MOV      r4,r0
        0x00000f8e:    460d        .F      MOV      r5,r1
        0x00000f90:    4616        .F      MOV      r6,r2
        0x00000f92:    bf00        ..      NOP      
        0x00000f94:    480d        .H      LDR      r0,[pc,#52] ; [0xfcc] = 0x20000008
        0x00000f96:    7800        .x      LDRB     r0,[r0,#0]
        0x00000f98:    b908        ..      CBNZ     r0,0xf9e ; SEGGER_RTT_Write + 22
        0x00000f9a:    f000fa37    ..7.    BL       _DoInit ; 0x140c
        0x00000f9e:    bf00        ..      NOP      
        0x00000fa0:    f3ef8011    ....    MRS      r0,BASEPRI
        0x00000fa4:    4607        .F      MOV      r7,r0
        0x00000fa6:    2020                MOVS     r0,#0x20
        0x00000fa8:    f3808811    ....    MSR      BASEPRI,r0
        0x00000fac:    bf00        ..      NOP      
        0x00000fae:    bf00        ..      NOP      
        0x00000fb0:    4632        2F      MOV      r2,r6
        0x00000fb2:    4629        )F      MOV      r1,r5
        0x00000fb4:    4620         F      MOV      r0,r4
        0x00000fb6:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0xfd0
        0x00000fba:    4680        .F      MOV      r8,r0
        0x00000fbc:    b2f8        ..      UXTB     r0,r7
        0x00000fbe:    f3808811    ....    MSR      BASEPRI,r0
        0x00000fc2:    bf00        ..      NOP      
        0x00000fc4:    bf00        ..      NOP      
        0x00000fc6:    4640        @F      MOV      r0,r8
        0x00000fc8:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000fcc:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000fd0:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000fd4:    4607        .F      MOV      r7,r0
        0x00000fd6:    4688        .F      MOV      r8,r1
        0x00000fd8:    4616        .F      MOV      r6,r2
        0x00000fda:    46c2        .F      MOV      r10,r8
        0x00000fdc:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x00000fe0:    481b        .H      LDR      r0,[pc,#108] ; [0x1050] = 0x20000020
        0x00000fe2:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x00000fe6:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x00000fea:    b120         .      CBZ      r0,0xff6 ; SEGGER_RTT_WriteNoLock + 38
        0x00000fec:    2801        .(      CMP      r0,#1
        0x00000fee:    d011        ..      BEQ      0x1014 ; SEGGER_RTT_WriteNoLock + 68
        0x00000ff0:    2802        .(      CMP      r0,#2
        0x00000ff2:    d126        &.      BNE      0x1042 ; SEGGER_RTT_WriteNoLock + 114
        0x00000ff4:    e01e        ..      B        0x1034 ; SEGGER_RTT_WriteNoLock + 100
        0x00000ff6:    4648        HF      MOV      r0,r9
        0x00000ff8:    f000fa40    ..@.    BL       _GetAvailWriteSpace ; 0x147c
        0x00000ffc:    4605        .F      MOV      r5,r0
        0x00000ffe:    42b5        .B      CMP      r5,r6
        0x00001000:    d201        ..      BCS      0x1006 ; SEGGER_RTT_WriteNoLock + 54
        0x00001002:    2400        .$      MOVS     r4,#0
        0x00001004:    e005        ..      B        0x1012 ; SEGGER_RTT_WriteNoLock + 66
        0x00001006:    4634        4F      MOV      r4,r6
        0x00001008:    4632        2F      MOV      r2,r6
        0x0000100a:    4651        QF      MOV      r1,r10
        0x0000100c:    4648        HF      MOV      r0,r9
        0x0000100e:    f000fb8a    ....    BL       _WriteNoCheck ; 0x1726
        0x00001012:    e018        ..      B        0x1046 ; SEGGER_RTT_WriteNoLock + 118
        0x00001014:    4648        HF      MOV      r0,r9
        0x00001016:    f000fa31    ..1.    BL       _GetAvailWriteSpace ; 0x147c
        0x0000101a:    4605        .F      MOV      r5,r0
        0x0000101c:    42b5        .B      CMP      r5,r6
        0x0000101e:    d201        ..      BCS      0x1024 ; SEGGER_RTT_WriteNoLock + 84
        0x00001020:    4628        (F      MOV      r0,r5
        0x00001022:    e000        ..      B        0x1026 ; SEGGER_RTT_WriteNoLock + 86
        0x00001024:    4630        0F      MOV      r0,r6
        0x00001026:    4604        .F      MOV      r4,r0
        0x00001028:    4622        "F      MOV      r2,r4
        0x0000102a:    4651        QF      MOV      r1,r10
        0x0000102c:    4648        HF      MOV      r0,r9
        0x0000102e:    f000fb7a    ..z.    BL       _WriteNoCheck ; 0x1726
        0x00001032:    e008        ..      B        0x1046 ; SEGGER_RTT_WriteNoLock + 118
        0x00001034:    4632        2F      MOV      r2,r6
        0x00001036:    4651        QF      MOV      r1,r10
        0x00001038:    4648        HF      MOV      r0,r9
        0x0000103a:    f000fb3b    ..;.    BL       _WriteBlocking ; 0x16b4
        0x0000103e:    4604        .F      MOV      r4,r0
        0x00001040:    e001        ..      B        0x1046 ; SEGGER_RTT_WriteNoLock + 118
        0x00001042:    2400        .$      MOVS     r4,#0
        0x00001044:    bf00        ..      NOP      
        0x00001046:    bf00        ..      NOP      
        0x00001048:    4620         F      MOV      r0,r4
        0x0000104a:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x0000104e:    0000        ..      DCW    0
        0x00001050:    20000020     ..     DCD    536870944
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00001054:    b40f        ..      PUSH     {r0-r3}
        0x00001056:    b538        8.      PUSH     {r3-r5,lr}
        0x00001058:    4604        .F      MOV      r4,r0
        0x0000105a:    a806        ..      ADD      r0,sp,#0x18
        0x0000105c:    9000        ..      STR      r0,[sp,#0]
        0x0000105e:    466a        jF      MOV      r2,sp
        0x00001060:    4620         F      MOV      r0,r4
        0x00001062:    9905        ..      LDR      r1,[sp,#0x14]
        0x00001064:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0x1076
        0x00001068:    4605        .F      MOV      r5,r0
        0x0000106a:    2000        .       MOVS     r0,#0
        0x0000106c:    9000        ..      STR      r0,[sp,#0]
        0x0000106e:    4628        (F      MOV      r0,r5
        0x00001070:    bc38        8.      POP      {r3-r5}
        0x00001072:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x00001076:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x0000107a:    b099        ..      SUB      sp,sp,#0x64
        0x0000107c:    4682        .F      MOV      r10,r0
        0x0000107e:    460d        .F      MOV      r5,r1
        0x00001080:    4614        .F      MOV      r4,r2
        0x00001082:    a803        ..      ADD      r0,sp,#0xc
        0x00001084:    9014        ..      STR      r0,[sp,#0x50]
        0x00001086:    2040        @       MOVS     r0,#0x40
        0x00001088:    9015        ..      STR      r0,[sp,#0x54]
        0x0000108a:    2000        .       MOVS     r0,#0
        0x0000108c:    9016        ..      STR      r0,[sp,#0x58]
        0x0000108e:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x00001092:    9017        ..      STR      r0,[sp,#0x5c]
        0x00001094:    bf00        ..      NOP      
        0x00001096:    782e        .x      LDRB     r6,[r5,#0]
        0x00001098:    1c6d        m.      ADDS     r5,r5,#1
        0x0000109a:    b906        ..      CBNZ     r6,0x109e ; SEGGER_RTT_vprintf + 40
        0x0000109c:    e0dd        ..      B        0x125a ; SEGGER_RTT_vprintf + 484
        0x0000109e:    2e25        %.      CMP      r6,#0x25
        0x000010a0:    d179        y.      BNE      0x1196 ; SEGGER_RTT_vprintf + 288
        0x000010a2:    2700        .'      MOVS     r7,#0
        0x000010a4:    f04f0901    O...    MOV      r9,#1
        0x000010a8:    bf00        ..      NOP      
        0x000010aa:    782e        .x      LDRB     r6,[r5,#0]
        0x000010ac:    2e23        #.      CMP      r6,#0x23
        0x000010ae:    d012        ..      BEQ      0x10d6 ; SEGGER_RTT_vprintf + 96
        0x000010b0:    2e2b        +.      CMP      r6,#0x2b
        0x000010b2:    d00c        ..      BEQ      0x10ce ; SEGGER_RTT_vprintf + 88
        0x000010b4:    2e2d        -.      CMP      r6,#0x2d
        0x000010b6:    d002        ..      BEQ      0x10be ; SEGGER_RTT_vprintf + 72
        0x000010b8:    2e30        0.      CMP      r6,#0x30
        0x000010ba:    d110        ..      BNE      0x10de ; SEGGER_RTT_vprintf + 104
        0x000010bc:    e003        ..      B        0x10c6 ; SEGGER_RTT_vprintf + 80
        0x000010be:    f0470701    G...    ORR      r7,r7,#1
        0x000010c2:    1c6d        m.      ADDS     r5,r5,#1
        0x000010c4:    e00e        ..      B        0x10e4 ; SEGGER_RTT_vprintf + 110
        0x000010c6:    f0470702    G...    ORR      r7,r7,#2
        0x000010ca:    1c6d        m.      ADDS     r5,r5,#1
        0x000010cc:    e00a        ..      B        0x10e4 ; SEGGER_RTT_vprintf + 110
        0x000010ce:    f0470704    G...    ORR      r7,r7,#4
        0x000010d2:    1c6d        m.      ADDS     r5,r5,#1
        0x000010d4:    e006        ..      B        0x10e4 ; SEGGER_RTT_vprintf + 110
        0x000010d6:    f0470708    G...    ORR      r7,r7,#8
        0x000010da:    1c6d        m.      ADDS     r5,r5,#1
        0x000010dc:    e002        ..      B        0x10e4 ; SEGGER_RTT_vprintf + 110
        0x000010de:    f04f0900    O...    MOV      r9,#0
        0x000010e2:    bf00        ..      NOP      
        0x000010e4:    bf00        ..      NOP      
        0x000010e6:    f1b90f00    ....    CMP      r9,#0
        0x000010ea:    d1de        ..      BNE      0x10aa ; SEGGER_RTT_vprintf + 52
        0x000010ec:    f04f0800    O...    MOV      r8,#0
        0x000010f0:    bf00        ..      NOP      
        0x000010f2:    782e        .x      LDRB     r6,[r5,#0]
        0x000010f4:    2e30        0.      CMP      r6,#0x30
        0x000010f6:    db01        ..      BLT      0x10fc ; SEGGER_RTT_vprintf + 134
        0x000010f8:    2e39        9.      CMP      r6,#0x39
        0x000010fa:    dd00        ..      BLE      0x10fe ; SEGGER_RTT_vprintf + 136
        0x000010fc:    e007        ..      B        0x110e ; SEGGER_RTT_vprintf + 152
        0x000010fe:    1c6d        m.      ADDS     r5,r5,#1
        0x00001100:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00001104:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x00001108:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x0000110c:    e7f1        ..      B        0x10f2 ; SEGGER_RTT_vprintf + 124
        0x0000110e:    bf00        ..      NOP      
        0x00001110:    2000        .       MOVS     r0,#0
        0x00001112:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001114:    782e        .x      LDRB     r6,[r5,#0]
        0x00001116:    2e2e        ..      CMP      r6,#0x2e
        0x00001118:    d112        ..      BNE      0x1140 ; SEGGER_RTT_vprintf + 202
        0x0000111a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000111c:    bf00        ..      NOP      
        0x0000111e:    782e        .x      LDRB     r6,[r5,#0]
        0x00001120:    2e30        0.      CMP      r6,#0x30
        0x00001122:    db01        ..      BLT      0x1128 ; SEGGER_RTT_vprintf + 178
        0x00001124:    2e39        9.      CMP      r6,#0x39
        0x00001126:    dd00        ..      BLE      0x112a ; SEGGER_RTT_vprintf + 180
        0x00001128:    e009        ..      B        0x113e ; SEGGER_RTT_vprintf + 200
        0x0000112a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000112c:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00001130:    9913        ..      LDR      r1,[sp,#0x4c]
        0x00001132:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x00001136:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x0000113a:    9013        ..      STR      r0,[sp,#0x4c]
        0x0000113c:    e7ef        ..      B        0x111e ; SEGGER_RTT_vprintf + 168
        0x0000113e:    bf00        ..      NOP      
        0x00001140:    782e        .x      LDRB     r6,[r5,#0]
        0x00001142:    bf00        ..      NOP      
        0x00001144:    2e6c        l.      CMP      r6,#0x6c
        0x00001146:    d001        ..      BEQ      0x114c ; SEGGER_RTT_vprintf + 214
        0x00001148:    2e68        h.      CMP      r6,#0x68
        0x0000114a:    d102        ..      BNE      0x1152 ; SEGGER_RTT_vprintf + 220
        0x0000114c:    1c6d        m.      ADDS     r5,r5,#1
        0x0000114e:    782e        .x      LDRB     r6,[r5,#0]
        0x00001150:    e000        ..      B        0x1154 ; SEGGER_RTT_vprintf + 222
        0x00001152:    e000        ..      B        0x1156 ; SEGGER_RTT_vprintf + 224
        0x00001154:    e7f6        ..      B        0x1144 ; SEGGER_RTT_vprintf + 206
        0x00001156:    bf00        ..      NOP      
        0x00001158:    2e70        p.      CMP      r6,#0x70
        0x0000115a:    d05d        ].      BEQ      0x1218 ; SEGGER_RTT_vprintf + 418
        0x0000115c:    dc08        ..      BGT      0x1170 ; SEGGER_RTT_vprintf + 250
        0x0000115e:    2e25        %.      CMP      r6,#0x25
        0x00001160:    d06a        j.      BEQ      0x1238 ; SEGGER_RTT_vprintf + 450
        0x00001162:    2e58        X.      CMP      r6,#0x58
        0x00001164:    d035        5.      BEQ      0x11d2 ; SEGGER_RTT_vprintf + 348
        0x00001166:    2e63        c.      CMP      r6,#0x63
        0x00001168:    d009        ..      BEQ      0x117e ; SEGGER_RTT_vprintf + 264
        0x0000116a:    2e64        d.      CMP      r6,#0x64
        0x0000116c:    d169        i.      BNE      0x1242 ; SEGGER_RTT_vprintf + 460
        0x0000116e:    e013        ..      B        0x1198 ; SEGGER_RTT_vprintf + 290
        0x00001170:    2e73        s.      CMP      r6,#0x73
        0x00001172:    d03c        <.      BEQ      0x11ee ; SEGGER_RTT_vprintf + 376
        0x00001174:    2e75        u.      CMP      r6,#0x75
        0x00001176:    d01d        ..      BEQ      0x11b4 ; SEGGER_RTT_vprintf + 318
        0x00001178:    2e78        x.      CMP      r6,#0x78
        0x0000117a:    d162        b.      BNE      0x1242 ; SEGGER_RTT_vprintf + 460
        0x0000117c:    e028        (.      B        0x11d0 ; SEGGER_RTT_vprintf + 346
        0x0000117e:    6821        !h      LDR      r1,[r4,#0]
        0x00001180:    1d08        ..      ADDS     r0,r1,#4
        0x00001182:    6020         `      STR      r0,[r4,#0]
        0x00001184:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001188:    f0090bff    ....    AND      r11,r9,#0xff
        0x0000118c:    4659        YF      MOV      r1,r11
        0x0000118e:    a814        ..      ADD      r0,sp,#0x50
        0x00001190:    f000fa6e    ..n.    BL       _StoreChar ; 0x1670
        0x00001194:    e056        V.      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x00001196:    e058        X.      B        0x124a ; SEGGER_RTT_vprintf + 468
        0x00001198:    6821        !h      LDR      r1,[r4,#0]
        0x0000119a:    1d08        ..      ADDS     r0,r1,#4
        0x0000119c:    6020         `      STR      r0,[r4,#0]
        0x0000119e:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000011a2:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000011a6:    220a        ."      MOVS     r2,#0xa
        0x000011a8:    4649        IF      MOV      r1,r9
        0x000011aa:    a814        ..      ADD      r0,sp,#0x50
        0x000011ac:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000011ae:    f000f973    ..s.    BL       _PrintInt ; 0x1498
        0x000011b2:    e047        G.      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x000011b4:    6821        !h      LDR      r1,[r4,#0]
        0x000011b6:    1d08        ..      ADDS     r0,r1,#4
        0x000011b8:    6020         `      STR      r0,[r4,#0]
        0x000011ba:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000011be:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000011c2:    220a        ."      MOVS     r2,#0xa
        0x000011c4:    4649        IF      MOV      r1,r9
        0x000011c6:    a814        ..      ADD      r0,sp,#0x50
        0x000011c8:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000011ca:    f000f9db    ....    BL       _PrintUnsigned ; 0x1584
        0x000011ce:    e039        9.      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x000011d0:    bf00        ..      NOP      
        0x000011d2:    6821        !h      LDR      r1,[r4,#0]
        0x000011d4:    1d08        ..      ADDS     r0,r1,#4
        0x000011d6:    6020         `      STR      r0,[r4,#0]
        0x000011d8:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000011dc:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000011e0:    2210        ."      MOVS     r2,#0x10
        0x000011e2:    4649        IF      MOV      r1,r9
        0x000011e4:    a814        ..      ADD      r0,sp,#0x50
        0x000011e6:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000011e8:    f000f9cc    ....    BL       _PrintUnsigned ; 0x1584
        0x000011ec:    e02a        *.      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x000011ee:    6821        !h      LDR      r1,[r4,#0]
        0x000011f0:    1d08        ..      ADDS     r0,r1,#4
        0x000011f2:    6020         `      STR      r0,[r4,#0]
        0x000011f4:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x000011f8:    bf00        ..      NOP      
        0x000011fa:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x000011fe:    f10b0b01    ....    ADD      r11,r11,#1
        0x00001202:    b906        ..      CBNZ     r6,0x1206 ; SEGGER_RTT_vprintf + 400
        0x00001204:    e006        ..      B        0x1214 ; SEGGER_RTT_vprintf + 414
        0x00001206:    4631        1F      MOV      r1,r6
        0x00001208:    a814        ..      ADD      r0,sp,#0x50
        0x0000120a:    f000fa31    ..1.    BL       _StoreChar ; 0x1670
        0x0000120e:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001210:    2800        .(      CMP      r0,#0
        0x00001212:    daf2        ..      BGE      0x11fa ; SEGGER_RTT_vprintf + 388
        0x00001214:    bf00        ..      NOP      
        0x00001216:    e015        ..      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x00001218:    6821        !h      LDR      r1,[r4,#0]
        0x0000121a:    1d08        ..      ADDS     r0,r1,#4
        0x0000121c:    6020         `      STR      r0,[r4,#0]
        0x0000121e:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001222:    2000        .       MOVS     r0,#0
        0x00001224:    2108        .!      MOVS     r1,#8
        0x00001226:    460b        .F      MOV      r3,r1
        0x00001228:    2210        ."      MOVS     r2,#0x10
        0x0000122a:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x0000122e:    4649        IF      MOV      r1,r9
        0x00001230:    a814        ..      ADD      r0,sp,#0x50
        0x00001232:    f000f9a7    ....    BL       _PrintUnsigned ; 0x1584
        0x00001236:    e005        ..      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x00001238:    2125        %!      MOVS     r1,#0x25
        0x0000123a:    a814        ..      ADD      r0,sp,#0x50
        0x0000123c:    f000fa18    ....    BL       _StoreChar ; 0x1670
        0x00001240:    e000        ..      B        0x1244 ; SEGGER_RTT_vprintf + 462
        0x00001242:    bf00        ..      NOP      
        0x00001244:    bf00        ..      NOP      
        0x00001246:    1c6d        m.      ADDS     r5,r5,#1
        0x00001248:    e003        ..      B        0x1252 ; SEGGER_RTT_vprintf + 476
        0x0000124a:    4631        1F      MOV      r1,r6
        0x0000124c:    a814        ..      ADD      r0,sp,#0x50
        0x0000124e:    f000fa0f    ....    BL       _StoreChar ; 0x1670
        0x00001252:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001254:    2800        .(      CMP      r0,#0
        0x00001256:    f6bfaf1e    ....    BGE      0x1096 ; SEGGER_RTT_vprintf + 32
        0x0000125a:    bf00        ..      NOP      
        0x0000125c:    9817        ..      LDR      r0,[sp,#0x5c]
        0x0000125e:    2800        .(      CMP      r0,#0
        0x00001260:    dd0a        ..      BLE      0x1278 ; SEGGER_RTT_vprintf + 514
        0x00001262:    9816        ..      LDR      r0,[sp,#0x58]
        0x00001264:    b120         .      CBZ      r0,0x1270 ; SEGGER_RTT_vprintf + 506
        0x00001266:    a903        ..      ADD      r1,sp,#0xc
        0x00001268:    4650        PF      MOV      r0,r10
        0x0000126a:    9a16        ..      LDR      r2,[sp,#0x58]
        0x0000126c:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0xf88
        0x00001270:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x00001274:    4408        .D      ADD      r0,r0,r1
        0x00001276:    9017        ..      STR      r0,[sp,#0x5c]
        0x00001278:    9817        ..      LDR      r0,[sp,#0x5c]
        0x0000127a:    b019        ..      ADD      sp,sp,#0x64
        0x0000127c:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00001280:    b570        p.      PUSH     {r4-r6,lr}
        0x00001282:    4d07        .M      LDR      r5,[pc,#28] ; [0x12a0] = 0x88
        0x00001284:    f1050470    ..p.    ADD      r4,r5,#0x70
        0x00001288:    b104        ..      CBZ      r4,0x128c ; SPIM_IRQHandler + 12
        0x0000128a:    e004        ..      B        0x1296 ; SPIM_IRQHandler + 22
        0x0000128c:    22c2        ."      MOVS     r2,#0xc2
        0x0000128e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x12a4
        0x00001290:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x12c4
        0x00001292:    f000fa6f    ..o.    BL       __aeabi_assert ; 0x1774
        0x00001296:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000129a:    4788        .G      BLX      r1
        0x0000129c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000129e:    0000        ..      DCW    0
        0x000012a0:    00000088    ....    DCD    136
        0x000012a4:    2e5c2e2e    ..\.    DCD    777793070
        0x000012a8:    2e2e5c2e    .\..    DCD    774790190
        0x000012ac:    464c455c    \ELF    DCD    1179403612
        0x000012b0:    53425f32    2_BS    DCD    1396858674
        0x000012b4:    72445c50    P\Dr    DCD    1917082704
        0x000012b8:    72657669    iver    DCD    1919252073
        0x000012bc:    746e695c    \int    DCD    1953392988
        0x000012c0:    00632e63    c.c.    DCD    6499939
        0x000012c4:    636e7566    func    DCD    1668183398
        0x000012c8:    203d2120     !=     DCD    540877088
        0x000012cc:    00000030    0...    DCD    48
    $t
    i.SystemInit
    SystemInit
        0x000012d0:    b510        ..      PUSH     {r4,lr}
        0x000012d2:    bf00        ..      NOP      
        0x000012d4:    480f        .H      LDR      r0,[pc,#60] ; [0x1314] = 0x4000b000
        0x000012d6:    6800        .h      LDR      r0,[r0,#0]
        0x000012d8:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x000012dc:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x000012e0:    d1f8        ..      BNE      0x12d4 ; SystemInit + 4
        0x000012e2:    f64e2060    N.`     MOV      r0,#0xea60
        0x000012e6:    f000fa65    ..e.    BL       delay ; 0x17b4
        0x000012ea:    480b        .H      LDR      r0,[pc,#44] ; [0x1318] = 0x5f5e100
        0x000012ec:    490b        .I      LDR      r1,[pc,#44] ; [0x131c] = 0x20000000
        0x000012ee:    6008        .`      STR      r0,[r1,#0]
        0x000012f0:    2008        .       MOVS     r0,#8
        0x000012f2:    f7fffc71    ..q.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xbd8
        0x000012f6:    2002        .       MOVS     r0,#2
        0x000012f8:    f7fffc7a    ..z.    BL       HAL_SYSCON_Set_HClk_Div ; 0xbf0
        0x000012fc:    2004        .       MOVS     r0,#4
        0x000012fe:    f7fffcad    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xc5c
        0x00001302:    2002        .       MOVS     r0,#2
        0x00001304:    f7fffce2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xccc
        0x00001308:    2164        d!      MOVS     r1,#0x64
        0x0000130a:    2001        .       MOVS     r0,#1
        0x0000130c:    f7fffd14    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0xd38
        0x00001310:    bd10        ..      POP      {r4,pc}
    $d
        0x00001312:    0000        ..      DCW    0
        0x00001314:    4000b000    ...@    DCD    1073786880
        0x00001318:    05f5e100    ....    DCD    100000000
        0x0000131c:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00001320:    b570        p.      PUSH     {r4-r6,lr}
        0x00001322:    4d07        .M      LDR      r5,[pc,#28] ; [0x1340] = 0x88
        0x00001324:    f1050458    ..X.    ADD      r4,r5,#0x58
        0x00001328:    b104        ..      CBZ      r4,0x132c ; TIMER_IRQHandler + 12
        0x0000132a:    e004        ..      B        0x1336 ; TIMER_IRQHandler + 22
        0x0000132c:    22a4        ."      MOVS     r2,#0xa4
        0x0000132e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1344
        0x00001330:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1364
        0x00001332:    f000fa1f    ....    BL       __aeabi_assert ; 0x1774
        0x00001336:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000133a:    4788        .G      BLX      r1
        0x0000133c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000133e:    0000        ..      DCW    0
        0x00001340:    00000088    ....    DCD    136
        0x00001344:    2e5c2e2e    ..\.    DCD    777793070
        0x00001348:    2e2e5c2e    .\..    DCD    774790190
        0x0000134c:    464c455c    \ELF    DCD    1179403612
        0x00001350:    53425f32    2_BS    DCD    1396858674
        0x00001354:    72445c50    P\Dr    DCD    1917082704
        0x00001358:    72657669    iver    DCD    1919252073
        0x0000135c:    746e695c    \int    DCD    1953392988
        0x00001360:    00632e63    c.c.    DCD    6499939
        0x00001364:    636e7566    func    DCD    1668183398
        0x00001368:    203d2120     !=     DCD    540877088
        0x0000136c:    00000030    0...    DCD    48
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001370:    b570        p.      PUSH     {r4-r6,lr}
        0x00001372:    4d07        .M      LDR      r5,[pc,#28] ; [0x1390] = 0x88
        0x00001374:    f1050478    ..x.    ADD      r4,r5,#0x78
        0x00001378:    b104        ..      CBZ      r4,0x137c ; UART_IRQHandler + 12
        0x0000137a:    e004        ..      B        0x1386 ; UART_IRQHandler + 22
        0x0000137c:    22cc        ."      MOVS     r2,#0xcc
        0x0000137e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1394
        0x00001380:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x13b4
        0x00001382:    f000f9f7    ....    BL       __aeabi_assert ; 0x1774
        0x00001386:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000138a:    4788        .G      BLX      r1
        0x0000138c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000138e:    0000        ..      DCW    0
        0x00001390:    00000088    ....    DCD    136
        0x00001394:    2e5c2e2e    ..\.    DCD    777793070
        0x00001398:    2e2e5c2e    .\..    DCD    774790190
        0x0000139c:    464c455c    \ELF    DCD    1179403612
        0x000013a0:    53425f32    2_BS    DCD    1396858674
        0x000013a4:    72445c50    P\Dr    DCD    1917082704
        0x000013a8:    72657669    iver    DCD    1919252073
        0x000013ac:    746e695c    \int    DCD    1953392988
        0x000013b0:    00632e63    c.c.    DCD    6499939
        0x000013b4:    636e7566    func    DCD    1668183398
        0x000013b8:    203d2120     !=     DCD    540877088
        0x000013bc:    00000030    0...    DCD    48
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x000013c0:    b570        p.      PUSH     {r4-r6,lr}
        0x000013c2:    4d06        .M      LDR      r5,[pc,#24] ; [0x13dc] = 0x88
        0x000013c4:    462c        ,F      MOV      r4,r5
        0x000013c6:    b104        ..      CBZ      r4,0x13ca ; WDT_IRQHandler + 10
        0x000013c8:    e004        ..      B        0x13d4 ; WDT_IRQHandler + 20
        0x000013ca:    222f        /"      MOVS     r2,#0x2f
        0x000013cc:    a104        ..      ADR      r1,{pc}+0x14 ; 0x13e0
        0x000013ce:    a00c        ..      ADR      r0,{pc}+0x32 ; 0x1400
        0x000013d0:    f000f9d0    ....    BL       __aeabi_assert ; 0x1774
        0x000013d4:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000013d8:    4788        .G      BLX      r1
        0x000013da:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000013dc:    00000088    ....    DCD    136
        0x000013e0:    2e5c2e2e    ..\.    DCD    777793070
        0x000013e4:    2e2e5c2e    .\..    DCD    774790190
        0x000013e8:    464c455c    \ELF    DCD    1179403612
        0x000013ec:    53425f32    2_BS    DCD    1396858674
        0x000013f0:    72445c50    P\Dr    DCD    1917082704
        0x000013f4:    72657669    iver    DCD    1919252073
        0x000013f8:    746e695c    \int    DCD    1953392988
        0x000013fc:    00632e63    c.c.    DCD    6499939
        0x00001400:    636e7566    func    DCD    1668183398
        0x00001404:    203d2120     !=     DCD    540877088
        0x00001408:    00000030    0...    DCD    48
    $t
    i._DoInit
    _DoInit
        0x0000140c:    b510        ..      PUSH     {r4,lr}
        0x0000140e:    4c12        .L      LDR      r4,[pc,#72] ; [0x1458] = 0x20000008
        0x00001410:    2003        .       MOVS     r0,#3
        0x00001412:    6120         a      STR      r0,[r4,#0x10]
        0x00001414:    6160        `a      STR      r0,[r4,#0x14]
        0x00001416:    a011        ..      ADR      r0,{pc}+0x46 ; 0x145c
        0x00001418:    61a0        .a      STR      r0,[r4,#0x18]
        0x0000141a:    4913        .I      LDR      r1,[pc,#76] ; [0x1468] = 0x200000b0
        0x0000141c:    61e1        .a      STR      r1,[r4,#0x1c]
        0x0000141e:    f44f6180    O..a    MOV      r1,#0x400
        0x00001422:    6221        !b      STR      r1,[r4,#0x20]
        0x00001424:    2100        .!      MOVS     r1,#0
        0x00001426:    62a1        .b      STR      r1,[r4,#0x28]
        0x00001428:    6261        ab      STR      r1,[r4,#0x24]
        0x0000142a:    62e1        .b      STR      r1,[r4,#0x2c]
        0x0000142c:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x145c
        0x0000142e:    6620         f      STR      r0,[r4,#0x60]
        0x00001430:    490e        .I      LDR      r1,[pc,#56] ; [0x146c] = 0x200004b0
        0x00001432:    6661        af      STR      r1,[r4,#0x64]
        0x00001434:    2110        .!      MOVS     r1,#0x10
        0x00001436:    66a1        .f      STR      r1,[r4,#0x68]
        0x00001438:    2100        .!      MOVS     r1,#0
        0x0000143a:    6721        !g      STR      r1,[r4,#0x70]
        0x0000143c:    66e1        .f      STR      r1,[r4,#0x6c]
        0x0000143e:    6761        ag      STR      r1,[r4,#0x74]
        0x00001440:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x1470
        0x00001442:    1de0        ..      ADDS     r0,r4,#7
        0x00001444:    f7feff84    ....    BL       strcpy ; 0x350
        0x00001448:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x1474
        0x0000144a:    4620         F      MOV      r0,r4
        0x0000144c:    f7feff80    ....    BL       strcpy ; 0x350
        0x00001450:    2020                MOVS     r0,#0x20
        0x00001452:    71a0        .q      STRB     r0,[r4,#6]
        0x00001454:    bd10        ..      POP      {r4,pc}
    $d
        0x00001456:    0000        ..      DCW    0
        0x00001458:    20000008    ...     DCD    536870920
        0x0000145c:    6d726554    Term    DCD    1836213588
        0x00001460:    6c616e69    inal    DCD    1818324585
        0x00001464:    00000000    ....    DCD    0
        0x00001468:    200000b0    ...     DCD    536871088
        0x0000146c:    200004b0    ...     DCD    536872112
        0x00001470:    00545452    RTT.    DCD    5526610
        0x00001474:    47474553    SEGG    DCD    1195853139
        0x00001478:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x0000147c:    b510        ..      PUSH     {r4,lr}
        0x0000147e:    4601        .F      MOV      r1,r0
        0x00001480:    690a        .i      LDR      r2,[r1,#0x10]
        0x00001482:    68cb        .h      LDR      r3,[r1,#0xc]
        0x00001484:    429a        .B      CMP      r2,r3
        0x00001486:    d804        ..      BHI      0x1492 ; _GetAvailWriteSpace + 22
        0x00001488:    688c        .h      LDR      r4,[r1,#8]
        0x0000148a:    1e64        d.      SUBS     r4,r4,#1
        0x0000148c:    1ae4        ..      SUBS     r4,r4,r3
        0x0000148e:    18a0        ..      ADDS     r0,r4,r2
        0x00001490:    e001        ..      B        0x1496 ; _GetAvailWriteSpace + 26
        0x00001492:    1ad4        ..      SUBS     r4,r2,r3
        0x00001494:    1e60        `.      SUBS     r0,r4,#1
        0x00001496:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x00001498:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x0000149c:    4606        .F      MOV      r6,r0
        0x0000149e:    460f        .F      MOV      r7,r1
        0x000014a0:    4692        .F      MOV      r10,r2
        0x000014a2:    4698        .F      MOV      r8,r3
        0x000014a4:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x000014a8:    2f00        ./      CMP      r7,#0
        0x000014aa:    da01        ..      BGE      0x14b0 ; _PrintInt + 24
        0x000014ac:    4278        xB      RSBS     r0,r7,#0
        0x000014ae:    e000        ..      B        0x14b2 ; _PrintInt + 26
        0x000014b0:    4638        8F      MOV      r0,r7
        0x000014b2:    4683        .F      MOV      r11,r0
        0x000014b4:    f04f0901    O...    MOV      r9,#1
        0x000014b8:    e003        ..      B        0x14c2 ; _PrintInt + 42
        0x000014ba:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x000014be:    f1090901    ....    ADD      r9,r9,#1
        0x000014c2:    45d3        .E      CMP      r11,r10
        0x000014c4:    daf9        ..      BGE      0x14ba ; _PrintInt + 34
        0x000014c6:    45c8        .E      CMP      r8,r9
        0x000014c8:    d900        ..      BLS      0x14cc ; _PrintInt + 52
        0x000014ca:    46c1        .F      MOV      r9,r8
        0x000014cc:    b134        4.      CBZ      r4,0x14dc ; _PrintInt + 68
        0x000014ce:    2f00        ./      CMP      r7,#0
        0x000014d0:    db03        ..      BLT      0x14da ; _PrintInt + 66
        0x000014d2:    f0050004    ....    AND      r0,r5,#4
        0x000014d6:    2804        .(      CMP      r0,#4
        0x000014d8:    d100        ..      BNE      0x14dc ; _PrintInt + 68
        0x000014da:    1e64        d.      SUBS     r4,r4,#1
        0x000014dc:    f0050002    ....    AND      r0,r5,#2
        0x000014e0:    b110        ..      CBZ      r0,0x14e8 ; _PrintInt + 80
        0x000014e2:    f1b80f00    ....    CMP      r8,#0
        0x000014e6:    d011        ..      BEQ      0x150c ; _PrintInt + 116
        0x000014e8:    f0050001    ....    AND      r0,r5,#1
        0x000014ec:    b970        p.      CBNZ     r0,0x150c ; _PrintInt + 116
        0x000014ee:    b16c        l.      CBZ      r4,0x150c ; _PrintInt + 116
        0x000014f0:    e008        ..      B        0x1504 ; _PrintInt + 108
        0x000014f2:    1e64        d.      SUBS     r4,r4,#1
        0x000014f4:    2120         !      MOVS     r1,#0x20
        0x000014f6:    4630        0F      MOV      r0,r6
        0x000014f8:    f000f8ba    ....    BL       _StoreChar ; 0x1670
        0x000014fc:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000014fe:    2800        .(      CMP      r0,#0
        0x00001500:    da00        ..      BGE      0x1504 ; _PrintInt + 108
        0x00001502:    e002        ..      B        0x150a ; _PrintInt + 114
        0x00001504:    b10c        ..      CBZ      r4,0x150a ; _PrintInt + 114
        0x00001506:    45a1        .E      CMP      r9,r4
        0x00001508:    d3f3        ..      BCC      0x14f2 ; _PrintInt + 90
        0x0000150a:    bf00        ..      NOP      
        0x0000150c:    68f0        .h      LDR      r0,[r6,#0xc]
        0x0000150e:    2800        .(      CMP      r0,#0
        0x00001510:    db36        6.      BLT      0x1580 ; _PrintInt + 232
        0x00001512:    2f00        ./      CMP      r7,#0
        0x00001514:    da05        ..      BGE      0x1522 ; _PrintInt + 138
        0x00001516:    427f        .B      RSBS     r7,r7,#0
        0x00001518:    212d        -!      MOVS     r1,#0x2d
        0x0000151a:    4630        0F      MOV      r0,r6
        0x0000151c:    f000f8a8    ....    BL       _StoreChar ; 0x1670
        0x00001520:    e007        ..      B        0x1532 ; _PrintInt + 154
        0x00001522:    f0050004    ....    AND      r0,r5,#4
        0x00001526:    2804        .(      CMP      r0,#4
        0x00001528:    d103        ..      BNE      0x1532 ; _PrintInt + 154
        0x0000152a:    212b        +!      MOVS     r1,#0x2b
        0x0000152c:    4630        0F      MOV      r0,r6
        0x0000152e:    f000f89f    ....    BL       _StoreChar ; 0x1670
        0x00001532:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001534:    2800        .(      CMP      r0,#0
        0x00001536:    db23        #.      BLT      0x1580 ; _PrintInt + 232
        0x00001538:    f0050002    ....    AND      r0,r5,#2
        0x0000153c:    2802        .(      CMP      r0,#2
        0x0000153e:    d114        ..      BNE      0x156a ; _PrintInt + 210
        0x00001540:    f0050001    ....    AND      r0,r5,#1
        0x00001544:    b988        ..      CBNZ     r0,0x156a ; _PrintInt + 210
        0x00001546:    f1b80f00    ....    CMP      r8,#0
        0x0000154a:    d10e        ..      BNE      0x156a ; _PrintInt + 210
        0x0000154c:    b16c        l.      CBZ      r4,0x156a ; _PrintInt + 210
        0x0000154e:    e008        ..      B        0x1562 ; _PrintInt + 202
        0x00001550:    1e64        d.      SUBS     r4,r4,#1
        0x00001552:    2130        0!      MOVS     r1,#0x30
        0x00001554:    4630        0F      MOV      r0,r6
        0x00001556:    f000f88b    ....    BL       _StoreChar ; 0x1670
        0x0000155a:    68f0        .h      LDR      r0,[r6,#0xc]
        0x0000155c:    2800        .(      CMP      r0,#0
        0x0000155e:    da00        ..      BGE      0x1562 ; _PrintInt + 202
        0x00001560:    e002        ..      B        0x1568 ; _PrintInt + 208
        0x00001562:    b10c        ..      CBZ      r4,0x1568 ; _PrintInt + 208
        0x00001564:    45a1        .E      CMP      r9,r4
        0x00001566:    d3f3        ..      BCC      0x1550 ; _PrintInt + 184
        0x00001568:    bf00        ..      NOP      
        0x0000156a:    68f0        .h      LDR      r0,[r6,#0xc]
        0x0000156c:    2800        .(      CMP      r0,#0
        0x0000156e:    db07        ..      BLT      0x1580 ; _PrintInt + 232
        0x00001570:    4643        CF      MOV      r3,r8
        0x00001572:    4652        RF      MOV      r2,r10
        0x00001574:    4639        9F      MOV      r1,r7
        0x00001576:    4630        0F      MOV      r0,r6
        0x00001578:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x0000157c:    f000f802    ....    BL       _PrintUnsigned ; 0x1584
        0x00001580:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x00001584:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001588:    4680        .F      MOV      r8,r0
        0x0000158a:    4689        .F      MOV      r9,r1
        0x0000158c:    4615        .F      MOV      r5,r2
        0x0000158e:    461e        .F      MOV      r6,r3
        0x00001590:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x00001592:    f8cd9004    ....    STR      r9,[sp,#4]
        0x00001596:    2701        .'      MOVS     r7,#1
        0x00001598:    46bb        .F      MOV      r11,r7
        0x0000159a:    e005        ..      B        0x15a8 ; _PrintUnsigned + 36
        0x0000159c:    9801        ..      LDR      r0,[sp,#4]
        0x0000159e:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x000015a2:    9001        ..      STR      r0,[sp,#4]
        0x000015a4:    f10b0b01    ....    ADD      r11,r11,#1
        0x000015a8:    9801        ..      LDR      r0,[sp,#4]
        0x000015aa:    42a8        .B      CMP      r0,r5
        0x000015ac:    d2f6        ..      BCS      0x159c ; _PrintUnsigned + 24
        0x000015ae:    455e        ^E      CMP      r6,r11
        0x000015b0:    d900        ..      BLS      0x15b4 ; _PrintUnsigned + 48
        0x000015b2:    46b3        .F      MOV      r11,r6
        0x000015b4:    980d        ..      LDR      r0,[sp,#0x34]
        0x000015b6:    f0000001    ....    AND      r0,r0,#1
        0x000015ba:    b9d0        ..      CBNZ     r0,0x15f2 ; _PrintUnsigned + 110
        0x000015bc:    b1cc        ..      CBZ      r4,0x15f2 ; _PrintUnsigned + 110
        0x000015be:    980d        ..      LDR      r0,[sp,#0x34]
        0x000015c0:    f0000002    ....    AND      r0,r0,#2
        0x000015c4:    2802        .(      CMP      r0,#2
        0x000015c6:    d103        ..      BNE      0x15d0 ; _PrintUnsigned + 76
        0x000015c8:    b916        ..      CBNZ     r6,0x15d0 ; _PrintUnsigned + 76
        0x000015ca:    2030        0       MOVS     r0,#0x30
        0x000015cc:    9000        ..      STR      r0,[sp,#0]
        0x000015ce:    e001        ..      B        0x15d4 ; _PrintUnsigned + 80
        0x000015d0:    2020                MOVS     r0,#0x20
        0x000015d2:    9000        ..      STR      r0,[sp,#0]
        0x000015d4:    e009        ..      B        0x15ea ; _PrintUnsigned + 102
        0x000015d6:    1e64        d.      SUBS     r4,r4,#1
        0x000015d8:    4640        @F      MOV      r0,r8
        0x000015da:    9900        ..      LDR      r1,[sp,#0]
        0x000015dc:    f000f848    ..H.    BL       _StoreChar ; 0x1670
        0x000015e0:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015e4:    2800        .(      CMP      r0,#0
        0x000015e6:    da00        ..      BGE      0x15ea ; _PrintUnsigned + 102
        0x000015e8:    e002        ..      B        0x15f0 ; _PrintUnsigned + 108
        0x000015ea:    b10c        ..      CBZ      r4,0x15f0 ; _PrintUnsigned + 108
        0x000015ec:    45a3        .E      CMP      r11,r4
        0x000015ee:    d3f2        ..      BCC      0x15d6 ; _PrintUnsigned + 82
        0x000015f0:    bf00        ..      NOP      
        0x000015f2:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015f6:    2800        .(      CMP      r0,#0
        0x000015f8:    db35        5.      BLT      0x1666 ; _PrintUnsigned + 226
        0x000015fa:    e009        ..      B        0x1610 ; _PrintUnsigned + 140
        0x000015fc:    2e01        ..      CMP      r6,#1
        0x000015fe:    d901        ..      BLS      0x1604 ; _PrintUnsigned + 128
        0x00001600:    1e76        v.      SUBS     r6,r6,#1
        0x00001602:    e004        ..      B        0x160e ; _PrintUnsigned + 138
        0x00001604:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00001608:    45aa        .E      CMP      r10,r5
        0x0000160a:    d200        ..      BCS      0x160e ; _PrintUnsigned + 138
        0x0000160c:    e001        ..      B        0x1612 ; _PrintUnsigned + 142
        0x0000160e:    436f        oC      MULS     r7,r5,r7
        0x00001610:    e7f4        ..      B        0x15fc ; _PrintUnsigned + 120
        0x00001612:    bf00        ..      NOP      
        0x00001614:    bf00        ..      NOP      
        0x00001616:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x0000161a:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x0000161e:    4813        .H      LDR      r0,[pc,#76] ; [0x166c] = 0x19f8
        0x00001620:    f810100a    ....    LDRB     r1,[r0,r10]
        0x00001624:    4640        @F      MOV      r0,r8
        0x00001626:    f000f823    ..#.    BL       _StoreChar ; 0x1670
        0x0000162a:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000162e:    2800        .(      CMP      r0,#0
        0x00001630:    da00        ..      BGE      0x1634 ; _PrintUnsigned + 176
        0x00001632:    e003        ..      B        0x163c ; _PrintUnsigned + 184
        0x00001634:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x00001638:    2f00        ./      CMP      r7,#0
        0x0000163a:    d1ec        ..      BNE      0x1616 ; _PrintUnsigned + 146
        0x0000163c:    bf00        ..      NOP      
        0x0000163e:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001640:    f0000001    ....    AND      r0,r0,#1
        0x00001644:    b178        x.      CBZ      r0,0x1666 ; _PrintUnsigned + 226
        0x00001646:    b174        t.      CBZ      r4,0x1666 ; _PrintUnsigned + 226
        0x00001648:    e009        ..      B        0x165e ; _PrintUnsigned + 218
        0x0000164a:    1e64        d.      SUBS     r4,r4,#1
        0x0000164c:    2120         !      MOVS     r1,#0x20
        0x0000164e:    4640        @F      MOV      r0,r8
        0x00001650:    f000f80e    ....    BL       _StoreChar ; 0x1670
        0x00001654:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001658:    2800        .(      CMP      r0,#0
        0x0000165a:    da00        ..      BGE      0x165e ; _PrintUnsigned + 218
        0x0000165c:    e002        ..      B        0x1664 ; _PrintUnsigned + 224
        0x0000165e:    b10c        ..      CBZ      r4,0x1664 ; _PrintUnsigned + 224
        0x00001660:    45a3        .E      CMP      r11,r4
        0x00001662:    d3f2        ..      BCC      0x164a ; _PrintUnsigned + 198
        0x00001664:    bf00        ..      NOP      
        0x00001666:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x0000166a:    0000        ..      DCW    0
        0x0000166c:    000019f8    ....    DCD    6648
    $t
    i._StoreChar
    _StoreChar
        0x00001670:    b570        p.      PUSH     {r4-r6,lr}
        0x00001672:    4604        .F      MOV      r4,r0
        0x00001674:    460e        .F      MOV      r6,r1
        0x00001676:    68a5        .h      LDR      r5,[r4,#8]
        0x00001678:    1c68        h.      ADDS     r0,r5,#1
        0x0000167a:    6861        ah      LDR      r1,[r4,#4]
        0x0000167c:    4281        .B      CMP      r1,r0
        0x0000167e:    d306        ..      BCC      0x168e ; _StoreChar + 30
        0x00001680:    6820         h      LDR      r0,[r4,#0]
        0x00001682:    5546        FU      STRB     r6,[r0,r5]
        0x00001684:    1c68        h.      ADDS     r0,r5,#1
        0x00001686:    60a0        .`      STR      r0,[r4,#8]
        0x00001688:    68e0        .h      LDR      r0,[r4,#0xc]
        0x0000168a:    1c40        @.      ADDS     r0,r0,#1
        0x0000168c:    60e0        .`      STR      r0,[r4,#0xc]
        0x0000168e:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x00001692:    4288        .B      CMP      r0,r1
        0x00001694:    d10d        ..      BNE      0x16b2 ; _StoreChar + 66
        0x00001696:    68a2        .h      LDR      r2,[r4,#8]
        0x00001698:    6821        !h      LDR      r1,[r4,#0]
        0x0000169a:    6920         i      LDR      r0,[r4,#0x10]
        0x0000169c:    f7fffc74    ..t.    BL       SEGGER_RTT_Write ; 0xf88
        0x000016a0:    68a1        .h      LDR      r1,[r4,#8]
        0x000016a2:    4288        .B      CMP      r0,r1
        0x000016a4:    d003        ..      BEQ      0x16ae ; _StoreChar + 62
        0x000016a6:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000016aa:    60e0        .`      STR      r0,[r4,#0xc]
        0x000016ac:    e001        ..      B        0x16b2 ; _StoreChar + 66
        0x000016ae:    2000        .       MOVS     r0,#0
        0x000016b0:    60a0        .`      STR      r0,[r4,#8]
        0x000016b2:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x000016b4:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x000016b8:    4604        .F      MOV      r4,r0
        0x000016ba:    4689        .F      MOV      r9,r1
        0x000016bc:    4617        .F      MOV      r7,r2
        0x000016be:    f04f0a00    O...    MOV      r10,#0
        0x000016c2:    68e5        .h      LDR      r5,[r4,#0xc]
        0x000016c4:    bf00        ..      NOP      
        0x000016c6:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x000016ca:    45a8        .E      CMP      r8,r5
        0x000016cc:    d903        ..      BLS      0x16d6 ; _WriteBlocking + 34
        0x000016ce:    eba80005    ....    SUB      r0,r8,r5
        0x000016d2:    1e46        F.      SUBS     r6,r0,#1
        0x000016d4:    e004        ..      B        0x16e0 ; _WriteBlocking + 44
        0x000016d6:    eba50008    ....    SUB      r0,r5,r8
        0x000016da:    1c40        @.      ADDS     r0,r0,#1
        0x000016dc:    68a1        .h      LDR      r1,[r4,#8]
        0x000016de:    1a0e        ..      SUBS     r6,r1,r0
        0x000016e0:    68a0        .h      LDR      r0,[r4,#8]
        0x000016e2:    1b40        @.      SUBS     r0,r0,r5
        0x000016e4:    42b0        .B      CMP      r0,r6
        0x000016e6:    d901        ..      BLS      0x16ec ; _WriteBlocking + 56
        0x000016e8:    4630        0F      MOV      r0,r6
        0x000016ea:    e001        ..      B        0x16f0 ; _WriteBlocking + 60
        0x000016ec:    68a0        .h      LDR      r0,[r4,#8]
        0x000016ee:    1b40        @.      SUBS     r0,r0,r5
        0x000016f0:    4606        .F      MOV      r6,r0
        0x000016f2:    42be        .B      CMP      r6,r7
        0x000016f4:    d201        ..      BCS      0x16fa ; _WriteBlocking + 70
        0x000016f6:    4630        0F      MOV      r0,r6
        0x000016f8:    e000        ..      B        0x16fc ; _WriteBlocking + 72
        0x000016fa:    4638        8F      MOV      r0,r7
        0x000016fc:    4606        .F      MOV      r6,r0
        0x000016fe:    6861        ah      LDR      r1,[r4,#4]
        0x00001700:    1948        H.      ADDS     r0,r1,r5
        0x00001702:    4632        2F      MOV      r2,r6
        0x00001704:    4649        IF      MOV      r1,r9
        0x00001706:    f7fefe47    ..G.    BL       __aeabi_memcpy ; 0x398
        0x0000170a:    44b2        .D      ADD      r10,r10,r6
        0x0000170c:    44b1        .D      ADD      r9,r9,r6
        0x0000170e:    1bbf        ..      SUBS     r7,r7,r6
        0x00001710:    4435        5D      ADD      r5,r5,r6
        0x00001712:    68a0        .h      LDR      r0,[r4,#8]
        0x00001714:    42a8        .B      CMP      r0,r5
        0x00001716:    d100        ..      BNE      0x171a ; _WriteBlocking + 102
        0x00001718:    2500        .%      MOVS     r5,#0
        0x0000171a:    60e5        .`      STR      r5,[r4,#0xc]
        0x0000171c:    2f00        ./      CMP      r7,#0
        0x0000171e:    d1d2        ..      BNE      0x16c6 ; _WriteBlocking + 18
        0x00001720:    4650        PF      MOV      r0,r10
        0x00001722:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001726:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000172a:    4604        .F      MOV      r4,r0
        0x0000172c:    4689        .F      MOV      r9,r1
        0x0000172e:    4615        .F      MOV      r5,r2
        0x00001730:    68e6        .h      LDR      r6,[r4,#0xc]
        0x00001732:    68a0        .h      LDR      r0,[r4,#8]
        0x00001734:    1b87        ..      SUBS     r7,r0,r6
        0x00001736:    42af        .B      CMP      r7,r5
        0x00001738:    d908        ..      BLS      0x174c ; _WriteNoCheck + 38
        0x0000173a:    6861        ah      LDR      r1,[r4,#4]
        0x0000173c:    1988        ..      ADDS     r0,r1,r6
        0x0000173e:    462a        *F      MOV      r2,r5
        0x00001740:    4649        IF      MOV      r1,r9
        0x00001742:    f7fefe29    ..).    BL       __aeabi_memcpy ; 0x398
        0x00001746:    1970        p.      ADDS     r0,r6,r5
        0x00001748:    60e0        .`      STR      r0,[r4,#0xc]
        0x0000174a:    e010        ..      B        0x176e ; _WriteNoCheck + 72
        0x0000174c:    46b8        .F      MOV      r8,r7
        0x0000174e:    6861        ah      LDR      r1,[r4,#4]
        0x00001750:    1988        ..      ADDS     r0,r1,r6
        0x00001752:    4642        BF      MOV      r2,r8
        0x00001754:    4649        IF      MOV      r1,r9
        0x00001756:    f7fefe1f    ....    BL       __aeabi_memcpy ; 0x398
        0x0000175a:    eba50807    ....    SUB      r8,r5,r7
        0x0000175e:    eb090107    ....    ADD      r1,r9,r7
        0x00001762:    4642        BF      MOV      r2,r8
        0x00001764:    6860        `h      LDR      r0,[r4,#4]
        0x00001766:    f7fefe17    ....    BL       __aeabi_memcpy ; 0x398
        0x0000176a:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x0000176e:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00001772:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00001774:    4604        .F      MOV      r4,r0
        0x00001776:    460d        .F      MOV      r5,r1
        0x00001778:    4616        .F      MOV      r6,r2
        0x0000177a:    b672        r.      CPSID    i
        0x0000177c:    4623        #F      MOV      r3,r4
        0x0000177e:    4632        2F      MOV      r2,r6
        0x00001780:    4629        )F      MOV      r1,r5
        0x00001782:    a002        ..      ADR      r0,{pc}+0xa ; 0x178c
        0x00001784:    f7fefd3e    ..>.    BL       __2printf ; 0x204
        0x00001788:    bf00        ..      NOP      
        0x0000178a:    e7fe        ..      B        0x178a ; __aeabi_assert + 22
    $d
        0x0000178c:    65737341    Asse    DCD    1702064961
        0x00001790:    6f697472    rtio    DCD    1869182066
        0x00001794:    6146206e    n Fa    DCD    1631985774
        0x00001798:    64656c69    iled    DCD    1684368489
        0x0000179c:    6966203a    : fi    DCD    1768300602
        0x000017a0:    2520656c    le %    DCD    622880108
        0x000017a4:    6c202c73    s, l    DCD    1814047859
        0x000017a8:    20656e69    ine     DCD    543518313
        0x000017ac:    202c6425    %d,     DCD    539780133
        0x000017b0:    000a7325    %s..    DCD    684837
    $t
    i.delay
    delay
        0x000017b4:    2100        .!      MOVS     r1,#0
        0x000017b6:    e006        ..      B        0x17c6 ; delay + 18
        0x000017b8:    bf00        ..      NOP      
        0x000017ba:    bf00        ..      NOP      
        0x000017bc:    bf00        ..      NOP      
        0x000017be:    bf00        ..      NOP      
        0x000017c0:    bf00        ..      NOP      
        0x000017c2:    bf00        ..      NOP      
        0x000017c4:    1c49        I.      ADDS     r1,r1,#1
        0x000017c6:    4281        .B      CMP      r1,r0
        0x000017c8:    d3f6        ..      BCC      0x17b8 ; delay + 4
        0x000017ca:    4770        pG      BX       lr
    i.fputc
    fputc
        0x000017cc:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000017ce:    460c        .F      MOV      r4,r1
        0x000017d0:    2201        ."      MOVS     r2,#1
        0x000017d2:    4669        iF      MOV      r1,sp
        0x000017d4:    2000        .       MOVS     r0,#0
        0x000017d6:    f7fffbd7    ....    BL       SEGGER_RTT_Write ; 0xf88
        0x000017da:    9800        ..      LDR      r0,[sp,#0]
        0x000017dc:    bd1c        ..      POP      {r2-r4,pc}
        0x000017de:    0000        ..      MOVS     r0,r0
    i.gpio_int_mask_setf
    gpio_int_mask_setf
        0x000017e0:    4903        .I      LDR      r1,[pc,#12] ; [0x17f0] = 0x40007000
        0x000017e2:    6b49        Ik      LDR      r1,[r1,#0x34]
        0x000017e4:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000017e8:    4a01        .J      LDR      r2,[pc,#4] ; [0x17f0] = 0x40007000
        0x000017ea:    6351        Qc      STR      r1,[r2,#0x34]
        0x000017ec:    4770        pG      BX       lr
    $d
        0x000017ee:    0000        ..      DCW    0
        0x000017f0:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_interruptenable_setf
    gpio_interruptenable_setf
        0x000017f4:    4903        .I      LDR      r1,[pc,#12] ; [0x1804] = 0x40007000
        0x000017f6:    6b09        .k      LDR      r1,[r1,#0x30]
        0x000017f8:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000017fc:    4a01        .J      LDR      r2,[pc,#4] ; [0x1804] = 0x40007000
        0x000017fe:    6311        .c      STR      r1,[r2,#0x30]
        0x00001800:    4770        pG      BX       lr
    $d
        0x00001802:    0000        ..      DCW    0
        0x00001804:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_isr
    gpio_isr
        0x00001808:    b57c        |.      PUSH     {r2-r6,lr}
        0x0000180a:    4604        .F      MOV      r4,r0
        0x0000180c:    2005        .       MOVS     r0,#5
        0x0000180e:    9001        ..      STR      r0,[sp,#4]
        0x00001810:    4625        %F      MOV      r5,r4
        0x00001812:    7829        )x      LDRB     r1,[r5,#0]
        0x00001814:    a009        ..      ADR      r0,{pc}+0x28 ; 0x183c
        0x00001816:    f7fefcf5    ....    BL       __2printf ; 0x204
        0x0000181a:    2006        .       MOVS     r0,#6
        0x0000181c:    9001        ..      STR      r0,[sp,#4]
        0x0000181e:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00001822:    1c40        @.      ADDS     r0,r0,#1
        0x00001824:    b2c0        ..      UXTB     r0,r0
        0x00001826:    9001        ..      STR      r0,[sp,#4]
        0x00001828:    f7fff8d0    ....    BL       HAL_GPIO_IntStatus ; 0x9cc
        0x0000182c:    9000        ..      STR      r0,[sp,#0]
        0x0000182e:    2007        .       MOVS     r0,#7
        0x00001830:    f7fff896    ....    BL       HAL_GPIO_ClrIrq ; 0x960
        0x00001834:    a006        ..      ADR      r0,{pc}+0x1c ; 0x1850
        0x00001836:    f7fefce5    ....    BL       __2printf ; 0x204
        0x0000183a:    bd7c        |.      POP      {r2-r6,pc}
    $d
        0x0000183c:    70746e69    intp    DCD    1886678633
        0x00001840:    70207475    ut p    DCD    1881175157
        0x00001844:    6d617261    aram    DCD    1835102817
        0x00001848:    25203d20     = %    DCD    622869792
        0x0000184c:    00000a64    d...    DCD    2660
        0x00001850:    6f697067    gpio    DCD    1869181031
        0x00001854:    746e6920     int    DCD    1953392928
        0x00001858:    75727265    erru    DCD    1970434661
        0x0000185c:    21217470    pt!!    DCD    555840624
        0x00001860:    00000a21    !...    DCD    2593
    $t
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00001864:    4903        .I      LDR      r1,[pc,#12] ; [0x1874] = 0x40007000
        0x00001866:    6809        .h      LDR      r1,[r1,#0]
        0x00001868:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000186c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1874] = 0x40007000
        0x0000186e:    6011        .`      STR      r1,[r2,#0]
        0x00001870:    4770        pG      BX       lr
    $d
        0x00001872:    0000        ..      DCW    0
        0x00001874:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00001878:    4903        .I      LDR      r1,[pc,#12] ; [0x1888] = 0x40007000
        0x0000187a:    68c9        .h      LDR      r1,[r1,#0xc]
        0x0000187c:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001880:    4a01        .J      LDR      r2,[pc,#4] ; [0x1888] = 0x40007000
        0x00001882:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001884:    4770        pG      BX       lr
    $d
        0x00001886:    0000        ..      DCW    0
        0x00001888:    40007000    .p.@    DCD    1073770496
    $t
    i.int_callback_register
    int_callback_register
        0x0000188c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000188e:    4604        .F      MOV      r4,r0
        0x00001890:    460e        .F      MOV      r6,r1
        0x00001892:    4615        .F      MOV      r5,r2
        0x00001894:    2c12        .,      CMP      r4,#0x12
        0x00001896:    da00        ..      BGE      0x189a ; int_callback_register + 14
        0x00001898:    e004        ..      B        0x18a4 ; int_callback_register + 24
        0x0000189a:    220b        ."      MOVS     r2,#0xb
        0x0000189c:    a106        ..      ADR      r1,{pc}+0x1c ; 0x18b8
        0x0000189e:    a010        ..      ADR      r0,{pc}+0x42 ; 0x18e0
        0x000018a0:    f7ffff68    ..h.    BL       __aeabi_assert ; 0x1774
        0x000018a4:    4815        .H      LDR      r0,[pc,#84] ; [0x18fc] = 0x88
        0x000018a6:    f8406034    @.4`    STR      r6,[r0,r4,LSL #3]
        0x000018aa:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x000018ae:    6045        E`      STR      r5,[r0,#4]
        0x000018b0:    4812        .H      LDR      r0,[pc,#72] ; [0x18fc] = 0x88
        0x000018b2:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x000018b6:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000018b8:    2e5c2e2e    ..\.    DCD    777793070
        0x000018bc:    2e2e5c2e    .\..    DCD    774790190
        0x000018c0:    464c455c    \ELF    DCD    1179403612
        0x000018c4:    53425f32    2_BS    DCD    1396858674
        0x000018c8:    72445c50    P\Dr    DCD    1917082704
        0x000018cc:    72657669    iver    DCD    1919252073
        0x000018d0:    746e695c    \int    DCD    1953392988
        0x000018d4:    6765725f    _reg    DCD    1734701663
        0x000018d8:    65747369    iste    DCD    1702130537
        0x000018dc:    00632e72    r.c.    DCD    6499954
        0x000018e0:    65646e69    inde    DCD    1701080681
        0x000018e4:    203c2078    x <     DCD    540811384
        0x000018e8:    5f565244    DRV_    DCD    1599492676
        0x000018ec:    4c4c4143    CALL    DCD    1280065859
        0x000018f0:    4b434142    BACK    DCD    1262698818
        0x000018f4:    58414d5f    _MAX    DCD    1480674655
        0x000018f8:    00000000    ....    DCD    0
        0x000018fc:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x00001900:    a103        ..      ADR      r1,{pc}+0x10 ; 0x1910
        0x00001902:    2000        .       MOVS     r0,#0
        0x00001904:    f7fffba6    ....    BL       SEGGER_RTT_printf ; 0x1054
        0x00001908:    f000f81e    ....    BL       test_demo ; 0x1948
        0x0000190c:    bf00        ..      NOP      
        0x0000190e:    e7fe        ..      B        0x190e ; main + 14
    $d
        0x00001910:    6c6c6548    Hell    DCD    1819043144
        0x00001914:    6f57206f    o Wo    DCD    1867980911
        0x00001918:    20646c72    rld     DCD    543452274
        0x0000191c:    38313032    2018    DCD    942747698
        0x00001920:    38303830    0808    DCD    942684208
        0x00001924:    00000a7e    ~...    DCD    2686
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001928:    4901        .I      LDR      r1,[pc,#4] ; [0x1930] = 0x40020000
        0x0000192a:    6008        .`      STR      r0,[r1,#0]
        0x0000192c:    4770        pG      BX       lr
    $d
        0x0000192e:    0000        ..      DCW    0
        0x00001930:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001934:    4903        .I      LDR      r1,[pc,#12] ; [0x1944] = 0x40020000
        0x00001936:    6849        Ih      LDR      r1,[r1,#4]
        0x00001938:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x0000193c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1944] = 0x40020000
        0x0000193e:    6051        Q`      STR      r1,[r2,#4]
        0x00001940:    4770        pG      BX       lr
    $d
        0x00001942:    0000        ..      DCW    0
        0x00001944:    40020000    ...@    DCD    1073872896
    $t
    i.test_demo
    test_demo
        0x00001948:    b51f        ..      PUSH     {r0-r4,lr}
        0x0000194a:    20aa        .       MOVS     r0,#0xaa
        0x0000194c:    9003        ..      STR      r0,[sp,#0xc]
        0x0000194e:    2001        .       MOVS     r0,#1
        0x00001950:    f88d0008    ....    STRB     r0,[sp,#8]
        0x00001954:    f88d0009    ....    STRB     r0,[sp,#9]
        0x00001958:    f88d000a    ....    STRB     r0,[sp,#0xa]
        0x0000195c:    2000        .       MOVS     r0,#0
        0x0000195e:    f88d0004    ....    STRB     r0,[sp,#4]
        0x00001962:    2001        .       MOVS     r0,#1
        0x00001964:    f88d0005    ....    STRB     r0,[sp,#5]
        0x00001968:    2000        .       MOVS     r0,#0
        0x0000196a:    f88d0000    ....    STRB     r0,[sp,#0]
        0x0000196e:    2003        .       MOVS     r0,#3
        0x00001970:    f88d0003    ....    STRB     r0,[sp,#3]
        0x00001974:    2007        .       MOVS     r0,#7
        0x00001976:    9900        ..      LDR      r1,[sp,#0]
        0x00001978:    f7fefffc    ....    BL       HAL_GPIO_Init ; 0x974
        0x0000197c:    2007        .       MOVS     r0,#7
        0x0000197e:    f7fff8d1    ....    BL       HAL_GPIO_UnmaskIrq ; 0xb24
        0x00001982:    2007        .       MOVS     r0,#7
        0x00001984:    f7fff812    ....    BL       HAL_GPIO_IntEnable ; 0x9ac
        0x00001988:    a903        ..      ADD      r1,sp,#0xc
        0x0000198a:    481a        .H      LDR      r0,[pc,#104] ; [0x19f4] = 0x1809
        0x0000198c:    f7feffbc    ....    BL       GPIO_Int_Register ; 0x908
        0x00001990:    2010        .       MOVS     r0,#0x10
        0x00001992:    2800        .(      CMP      r0,#0
        0x00001994:    db09        ..      BLT      0x19aa ; test_demo + 98
        0x00001996:    f000021f    ....    AND      r2,r0,#0x1f
        0x0000199a:    2101        .!      MOVS     r1,#1
        0x0000199c:    4091        .@      LSLS     r1,r1,r2
        0x0000199e:    0942        B.      LSRS     r2,r0,#5
        0x000019a0:    0092        ..      LSLS     r2,r2,#2
        0x000019a2:    f10222e0    ..."    ADD      r2,r2,#0xe000e000
        0x000019a6:    f8c21100    ....    STR      r1,[r2,#0x100]
        0x000019aa:    bf00        ..      NOP      
        0x000019ac:    2010        .       MOVS     r0,#0x10
        0x000019ae:    9902        ..      LDR      r1,[sp,#8]
        0x000019b0:    f7feffe0    ....    BL       HAL_GPIO_Init ; 0x974
        0x000019b4:    e01d        ..      B        0x19f2 ; test_demo + 170
        0x000019b6:    2100        .!      MOVS     r1,#0
        0x000019b8:    2010        .       MOVS     r0,#0x10
        0x000019ba:    f7fff8c3    ....    BL       HAL_GPIO_WritePin ; 0xb44
        0x000019be:    2482        .$      MOVS     r4,#0x82
        0x000019c0:    e006        ..      B        0x19d0 ; test_demo + 136
        0x000019c2:    f2427510    B..u    MOV      r5,#0x2710
        0x000019c6:    e000        ..      B        0x19ca ; test_demo + 130
        0x000019c8:    1e6d        m.      SUBS     r5,r5,#1
        0x000019ca:    2d00        .-      CMP      r5,#0
        0x000019cc:    d1fc        ..      BNE      0x19c8 ; test_demo + 128
        0x000019ce:    1e64        d.      SUBS     r4,r4,#1
        0x000019d0:    2c00        .,      CMP      r4,#0
        0x000019d2:    d1f6        ..      BNE      0x19c2 ; test_demo + 122
        0x000019d4:    2101        .!      MOVS     r1,#1
        0x000019d6:    2010        .       MOVS     r0,#0x10
        0x000019d8:    f7fff8b4    ....    BL       HAL_GPIO_WritePin ; 0xb44
        0x000019dc:    2482        .$      MOVS     r4,#0x82
        0x000019de:    e006        ..      B        0x19ee ; test_demo + 166
        0x000019e0:    f2427510    B..u    MOV      r5,#0x2710
        0x000019e4:    e000        ..      B        0x19e8 ; test_demo + 160
        0x000019e6:    1e6d        m.      SUBS     r5,r5,#1
        0x000019e8:    2d00        .-      CMP      r5,#0
        0x000019ea:    d1fc        ..      BNE      0x19e6 ; test_demo + 158
        0x000019ec:    1e64        d.      SUBS     r4,r4,#1
        0x000019ee:    2c00        .,      CMP      r4,#0
        0x000019f0:    d1f6        ..      BNE      0x19e0 ; test_demo + 152
        0x000019f2:    e7e0        ..      B        0x19b6 ; test_demo + 110
    $d
        0x000019f4:    00001809    ....    DCD    6153
    $d.realdata
    .constdata
    _aV2C
        0x000019f8:    33323130    0123    DCD    858927408
        0x000019fc:    37363534    4567    DCD    926299444
        0x00001a00:    42413938    89AB    DCD    1111570744
        0x00001a04:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001a08:    00001a28    (...    DCD    6696
        0x00001a0c:    20000000    ...     DCD    536870912
        0x00001a10:    00000008    ....    DCD    8
        0x00001a14:    00000154    T...    DCD    340
        0x00001a18:    00001a30    0...    DCD    6704
        0x00001a1c:    20000008    ...     DCD    536870920
        0x00001a20:    00000a18    ....    DCD    2584
        0x00001a24:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 6748 (0x1a5c)
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
    File Offset : 6756 (0x1a64)
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
    File Offset : 6756 (0x1a64)
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
    File Offset : 8232 (0x2028)
    Size        : 2788 bytes (0xae4)
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
    File Offset : 11020 (0x2b0c)
    Size        : 65904 bytes (0x10170)
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
    File Offset : 76924 (0x12c7c)
    Size        : 11912 bytes (0x2e88)
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
    File Offset : 88836 (0x15b04)
    Size        : 3824 bytes (0xef0)
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
    File Offset : 92660 (0x169f4)
    Size        : 28136 bytes (0x6de8)
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
    File Offset : 120796 (0x1d7dc)
    Size        : 1958 bytes (0x7a6)
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
    File Offset : 122756 (0x1df84)
    Size        : 8368 bytes (0x20b0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 373
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 131124 (0x20034)
    Size        : 7036 bytes (0x1b7c)
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
    File Offset : 138160 (0x21bb0)
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
    File Offset : 138196 (0x21bd4)
    Size        : 11676 bytes (0x2d9c)
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
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_demo.o --vfemode=force

    Input Comments:
    
    p4c2c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4c2c-2
    
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_demo.o --depend=.\objects\test_demo.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_demo.crf src\test_demo.c
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    pa4c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\pa4c-2
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p63fc-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p63fc-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\GPIO_Demo\INTC_Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
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

** Section #17

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 149872 (0x24970)
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

