
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

    Program header offset: 151216 (0x00024eb0)
    Section header offset: 151248 (0x00024ed0)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 6404 bytes (0x1904)
    Size in memory: 8988 bytes (0x231c)
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
    Size        : 6116 bytes (0x17e4)
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
        0x0000014c:    00001790    ....    DCD    6032
        0x00000150:    000017b0    ....    DCD    6064
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
        0x000001ae:    f001fb45    ..E.    BL       main ; 0x183c
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
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x1299
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
        0x000001ec:    00001299    ....    DCD    4761
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
        0x00000508:    4b07        .K      LDR      r3,[pc,#28] ; [0x528] = 0x12a3
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
        0x00000528:    000012a3    ....    DCD    4771
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
        0x0000064a:    f001f877    ..w.    BL       __aeabi_assert ; 0x173c
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
        0x0000069a:    f001f84f    ..O.    BL       __aeabi_assert ; 0x173c
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
        0x000006ea:    f001f827    ..'.    BL       __aeabi_assert ; 0x173c
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
        0x0000073a:    f000ffff    ....    BL       __aeabi_assert ; 0x173c
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
        0x0000078a:    f000ffd7    ....    BL       __aeabi_assert ; 0x173c
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
        0x000007da:    f000ffaf    ....    BL       __aeabi_assert ; 0x173c
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
        0x0000082a:    f000ff87    ....    BL       __aeabi_assert ; 0x173c
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
    i.EXTINT_Int_Register
    EXTINT_Int_Register
        0x00000868:    b570        p.      PUSH     {r4-r6,lr}
        0x0000086a:    4604        .F      MOV      r4,r0
        0x0000086c:    460d        .F      MOV      r5,r1
        0x0000086e:    b104        ..      CBZ      r4,0x872 ; EXTINT_Int_Register + 10
        0x00000870:    e004        ..      B        0x87c ; EXTINT_Int_Register + 20
        0x00000872:    2230        0"      MOVS     r2,#0x30
        0x00000874:    a104        ..      ADR      r1,{pc}+0x14 ; 0x888
        0x00000876:    a00e        ..      ADR      r0,{pc}+0x3a ; 0x8b0
        0x00000878:    f000ff60    ..`.    BL       __aeabi_assert ; 0x173c
        0x0000087c:    462a        *F      MOV      r2,r5
        0x0000087e:    4621        !F      MOV      r1,r4
        0x00000880:    2001        .       MOVS     r0,#1
        0x00000882:    f000ffa1    ....    BL       int_callback_register ; 0x17c8
        0x00000886:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000888:    2e5c2e2e    ..\.    DCD    777793070
        0x0000088c:    2e2e5c2e    .\..    DCD    774790190
        0x00000890:    464c455c    \ELF    DCD    1179403612
        0x00000894:    53425f32    2_BS    DCD    1396858674
        0x00000898:    72445c50    P\Dr    DCD    1917082704
        0x0000089c:    72657669    iver    DCD    1919252073
        0x000008a0:    746e695c    \int    DCD    1953392988
        0x000008a4:    6765725f    _reg    DCD    1734701663
        0x000008a8:    65747369    iste    DCD    1702130537
        0x000008ac:    00632e72    r.c.    DCD    6499954
        0x000008b0:    5f727369    isr_    DCD    1601336169
        0x000008b4:    636e7566    func    DCD    1668183398
        0x000008b8:    203d2120     !=     DCD    540877088
        0x000008bc:    00000030    0...    DCD    48
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x000008c0:    b570        p.      PUSH     {r4-r6,lr}
        0x000008c2:    4d07        .M      LDR      r5,[pc,#28] ; [0x8e0] = 0x88
        0x000008c4:    f1050408    ....    ADD      r4,r5,#8
        0x000008c8:    b104        ..      CBZ      r4,0x8cc ; EXT_IRQHandler + 12
        0x000008ca:    e004        ..      B        0x8d6 ; EXT_IRQHandler + 22
        0x000008cc:    2238        8"      MOVS     r2,#0x38
        0x000008ce:    a105        ..      ADR      r1,{pc}+0x16 ; 0x8e4
        0x000008d0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x904
        0x000008d2:    f000ff33    ..3.    BL       __aeabi_assert ; 0x173c
        0x000008d6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000008da:    4788        .G      BLX      r1
        0x000008dc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000008de:    0000        ..      DCW    0
        0x000008e0:    00000088    ....    DCD    136
        0x000008e4:    2e5c2e2e    ..\.    DCD    777793070
        0x000008e8:    2e2e5c2e    .\..    DCD    774790190
        0x000008ec:    464c455c    \ELF    DCD    1179403612
        0x000008f0:    53425f32    2_BS    DCD    1396858674
        0x000008f4:    72445c50    P\Dr    DCD    1917082704
        0x000008f8:    72657669    iver    DCD    1919252073
        0x000008fc:    746e695c    \int    DCD    1953392988
        0x00000900:    00632e63    c.c.    DCD    6499939
        0x00000904:    636e7566    func    DCD    1668183398
        0x00000908:    203d2120     !=     DCD    540877088
        0x0000090c:    00000030    0...    DCD    48
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x00000910:    b570        p.      PUSH     {r4-r6,lr}
        0x00000912:    4d07        .M      LDR      r5,[pc,#28] ; [0x930] = 0x88
        0x00000914:    f1050480    ....    ADD      r4,r5,#0x80
        0x00000918:    b104        ..      CBZ      r4,0x91c ; GPIO_IRQHandler + 12
        0x0000091a:    e004        ..      B        0x926 ; GPIO_IRQHandler + 22
        0x0000091c:    22d6        ."      MOVS     r2,#0xd6
        0x0000091e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x934
        0x00000920:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x954
        0x00000922:    f000ff0b    ....    BL       __aeabi_assert ; 0x173c
        0x00000926:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000092a:    4788        .G      BLX      r1
        0x0000092c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000092e:    0000        ..      DCW    0
        0x00000930:    00000088    ....    DCD    136
        0x00000934:    2e5c2e2e    ..\.    DCD    777793070
        0x00000938:    2e2e5c2e    .\..    DCD    774790190
        0x0000093c:    464c455c    \ELF    DCD    1179403612
        0x00000940:    53425f32    2_BS    DCD    1396858674
        0x00000944:    72445c50    P\Dr    DCD    1917082704
        0x00000948:    72657669    iver    DCD    1919252073
        0x0000094c:    746e695c    \int    DCD    1953392988
        0x00000950:    00632e63    c.c.    DCD    6499939
        0x00000954:    636e7566    func    DCD    1668183398
        0x00000958:    203d2120     !=     DCD    540877088
        0x0000095c:    00000030    0...    DCD    48
    $t
    i.HAL_EXTI_En
    HAL_EXTI_En
        0x00000960:    bf00        ..      NOP      
        0x00000962:    4904        .I      LDR      r1,[pc,#16] ; [0x974] = 0x40020000
        0x00000964:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00000966:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000096a:    4a02        .J      LDR      r2,[pc,#8] ; [0x974] = 0x40020000
        0x0000096c:    61d1        .a      STR      r1,[r2,#0x1c]
        0x0000096e:    bf00        ..      NOP      
        0x00000970:    4770        pG      BX       lr
    $d
        0x00000972:    0000        ..      DCW    0
        0x00000974:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_EXTI_Init
    HAL_EXTI_Init
        0x00000978:    b531        1.      PUSH     {r0,r4,r5,lr}
        0x0000097a:    f89d1001    ....    LDRB     r1,[sp,#1]
        0x0000097e:    f89d0000    ....    LDRB     r0,[sp,#0]
        0x00000982:    f000f833    ..3.    BL       HAL_EXTI_Trig ; 0x9ec
        0x00000986:    bf00        ..      NOP      
        0x00000988:    480c        .H      LDR      r0,[pc,#48] ; [0x9bc] = 0x40020000
        0x0000098a:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x0000098c:    0c00        ..      LSRS     r0,r0,#16
        0x0000098e:    f89d2000    ...     LDRB     r2,[sp,#0]
        0x00000992:    2101        .!      MOVS     r1,#1
        0x00000994:    4091        .@      LSLS     r1,r1,r2
        0x00000996:    4308        .C      ORRS     r0,r0,r1
        0x00000998:    b284        ..      UXTH     r4,r0
        0x0000099a:    4620         F      MOV      r0,r4
        0x0000099c:    f000f81a    ....    BL       HAL_EXTI_PinIsInt ; 0x9d4
        0x000009a0:    bf00        ..      NOP      
        0x000009a2:    4806        .H      LDR      r0,[pc,#24] ; [0x9bc] = 0x40020000
        0x000009a4:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x000009a6:    f89d1002    ....    LDRB     r1,[sp,#2]
        0x000009aa:    f89d2000    ...     LDRB     r2,[sp,#0]
        0x000009ae:    4091        .@      LSLS     r1,r1,r2
        0x000009b0:    4308        .C      ORRS     r0,r0,r1
        0x000009b2:    b284        ..      UXTH     r4,r0
        0x000009b4:    4620         F      MOV      r0,r4
        0x000009b6:    f7ffffd3    ....    BL       HAL_EXTI_En ; 0x960
        0x000009ba:    bd38        8.      POP      {r3-r5,pc}
    $d
        0x000009bc:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_EXTI_IntClr
    HAL_EXTI_IntClr
        0x000009c0:    2201        ."      MOVS     r2,#1
        0x000009c2:    fa02f100    ....    LSL      r1,r2,r0
        0x000009c6:    4a02        .J      LDR      r2,[pc,#8] ; [0x9d0] = 0x40020000
        0x000009c8:    6251        Qb      STR      r1,[r2,#0x24]
        0x000009ca:    bf00        ..      NOP      
        0x000009cc:    4770        pG      BX       lr
    $d
        0x000009ce:    0000        ..      DCW    0
        0x000009d0:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_EXTI_PinIsInt
    HAL_EXTI_PinIsInt
        0x000009d4:    bf00        ..      NOP      
        0x000009d6:    4904        .I      LDR      r1,[pc,#16] ; [0x9e8] = 0x40020000
        0x000009d8:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x000009da:    f360411f    `..A    BFI      r1,r0,#16,#16
        0x000009de:    4a02        .J      LDR      r2,[pc,#8] ; [0x9e8] = 0x40020000
        0x000009e0:    61d1        .a      STR      r1,[r2,#0x1c]
        0x000009e2:    bf00        ..      NOP      
        0x000009e4:    4770        pG      BX       lr
    $d
        0x000009e6:    0000        ..      DCW    0
        0x000009e8:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_EXTI_Trig
    HAL_EXTI_Trig
        0x000009ec:    b570        p.      PUSH     {r4-r6,lr}
        0x000009ee:    4605        .F      MOV      r5,r0
        0x000009f0:    460c        .F      MOV      r4,r1
        0x000009f2:    2c03        .,      CMP      r4,#3
        0x000009f4:    dc00        ..      BGT      0x9f8 ; HAL_EXTI_Trig + 12
        0x000009f6:    e004        ..      B        0xa02 ; HAL_EXTI_Trig + 22
        0x000009f8:    220d        ."      MOVS     r2,#0xd
        0x000009fa:    a156        V.      ADR      r1,{pc}+0x15a ; 0xb54
        0x000009fc:    a05d        ].      ADR      r0,{pc}+0x178 ; 0xb74
        0x000009fe:    f000fe9d    ....    BL       __aeabi_assert ; 0x173c
        0x00000a02:    2d10        .-      CMP      r5,#0x10
        0x00000a04:    d275        u.      BCS      0xaf2 ; HAL_EXTI_Trig + 262
        0x00000a06:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x00000a0a:    1108        ..      DCW    4360
        0x00000a0c:    352c231a    .#,5    DCD    892085018
        0x00000a10:    5950473e    >GPY    DCD    1498433342
        0x00000a14:    7e756b62    bku~    DCD    2121624418
        0x00000a18:    9087        ..      DCW    36999
    $t
        0x00000a1a:    bf00        ..      NOP      
        0x00000a1c:    485a        ZH      LDR      r0,[pc,#360] ; [0xb88] = 0x40020000
        0x00000a1e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a20:    f3640001    d...    BFI      r0,r4,#0,#2
        0x00000a24:    4958        XI      LDR      r1,[pc,#352] ; [0xb88] = 0x40020000
        0x00000a26:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a28:    bf00        ..      NOP      
        0x00000a2a:    e090        ..      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a2c:    bf00        ..      NOP      
        0x00000a2e:    4856        VH      LDR      r0,[pc,#344] ; [0xb88] = 0x40020000
        0x00000a30:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a32:    f3640083    d...    BFI      r0,r4,#2,#2
        0x00000a36:    4954        TI      LDR      r1,[pc,#336] ; [0xb88] = 0x40020000
        0x00000a38:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a3a:    bf00        ..      NOP      
        0x00000a3c:    e087        ..      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a3e:    bf00        ..      NOP      
        0x00000a40:    4851        QH      LDR      r0,[pc,#324] ; [0xb88] = 0x40020000
        0x00000a42:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a44:    f3641005    d...    BFI      r0,r4,#4,#2
        0x00000a48:    494f        OI      LDR      r1,[pc,#316] ; [0xb88] = 0x40020000
        0x00000a4a:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a4c:    bf00        ..      NOP      
        0x00000a4e:    e07e        ~.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a50:    bf00        ..      NOP      
        0x00000a52:    484d        MH      LDR      r0,[pc,#308] ; [0xb88] = 0x40020000
        0x00000a54:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a56:    f3641087    d...    BFI      r0,r4,#6,#2
        0x00000a5a:    494b        KI      LDR      r1,[pc,#300] ; [0xb88] = 0x40020000
        0x00000a5c:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a5e:    bf00        ..      NOP      
        0x00000a60:    e075        u.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a62:    bf00        ..      NOP      
        0x00000a64:    4848        HH      LDR      r0,[pc,#288] ; [0xb88] = 0x40020000
        0x00000a66:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a68:    f3642009    d..     BFI      r0,r4,#8,#2
        0x00000a6c:    4946        FI      LDR      r1,[pc,#280] ; [0xb88] = 0x40020000
        0x00000a6e:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a70:    bf00        ..      NOP      
        0x00000a72:    e06c        l.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a74:    bf00        ..      NOP      
        0x00000a76:    4844        DH      LDR      r0,[pc,#272] ; [0xb88] = 0x40020000
        0x00000a78:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a7a:    f364208b    d..     BFI      r0,r4,#10,#2
        0x00000a7e:    4942        BI      LDR      r1,[pc,#264] ; [0xb88] = 0x40020000
        0x00000a80:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a82:    bf00        ..      NOP      
        0x00000a84:    e063        c.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a86:    bf00        ..      NOP      
        0x00000a88:    483f        ?H      LDR      r0,[pc,#252] ; [0xb88] = 0x40020000
        0x00000a8a:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a8c:    f364300d    d..0    BFI      r0,r4,#12,#2
        0x00000a90:    493d        =I      LDR      r1,[pc,#244] ; [0xb88] = 0x40020000
        0x00000a92:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a94:    bf00        ..      NOP      
        0x00000a96:    e05a        Z.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000a98:    bf00        ..      NOP      
        0x00000a9a:    483b        ;H      LDR      r0,[pc,#236] ; [0xb88] = 0x40020000
        0x00000a9c:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a9e:    f364308f    d..0    BFI      r0,r4,#14,#2
        0x00000aa2:    4939        9I      LDR      r1,[pc,#228] ; [0xb88] = 0x40020000
        0x00000aa4:    6188        .a      STR      r0,[r1,#0x18]
        0x00000aa6:    bf00        ..      NOP      
        0x00000aa8:    e051        Q.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000aaa:    bf00        ..      NOP      
        0x00000aac:    4836        6H      LDR      r0,[pc,#216] ; [0xb88] = 0x40020000
        0x00000aae:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ab0:    f3644011    d..@    BFI      r0,r4,#16,#2
        0x00000ab4:    4934        4I      LDR      r1,[pc,#208] ; [0xb88] = 0x40020000
        0x00000ab6:    6188        .a      STR      r0,[r1,#0x18]
        0x00000ab8:    bf00        ..      NOP      
        0x00000aba:    e048        H.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000abc:    bf00        ..      NOP      
        0x00000abe:    4832        2H      LDR      r0,[pc,#200] ; [0xb88] = 0x40020000
        0x00000ac0:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ac2:    f3644093    d..@    BFI      r0,r4,#18,#2
        0x00000ac6:    4930        0I      LDR      r1,[pc,#192] ; [0xb88] = 0x40020000
        0x00000ac8:    6188        .a      STR      r0,[r1,#0x18]
        0x00000aca:    bf00        ..      NOP      
        0x00000acc:    e03f        ?.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000ace:    bf00        ..      NOP      
        0x00000ad0:    482d        -H      LDR      r0,[pc,#180] ; [0xb88] = 0x40020000
        0x00000ad2:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ad4:    f3645015    d..P    BFI      r0,r4,#20,#2
        0x00000ad8:    492b        +I      LDR      r1,[pc,#172] ; [0xb88] = 0x40020000
        0x00000ada:    6188        .a      STR      r0,[r1,#0x18]
        0x00000adc:    bf00        ..      NOP      
        0x00000ade:    e036        6.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000ae0:    bf00        ..      NOP      
        0x00000ae2:    4829        )H      LDR      r0,[pc,#164] ; [0xb88] = 0x40020000
        0x00000ae4:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ae6:    f3645097    d..P    BFI      r0,r4,#22,#2
        0x00000aea:    4927        'I      LDR      r1,[pc,#156] ; [0xb88] = 0x40020000
        0x00000aec:    6188        .a      STR      r0,[r1,#0x18]
        0x00000aee:    bf00        ..      NOP      
        0x00000af0:    e02d        -.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000af2:    e023        #.      B        0xb3c ; HAL_EXTI_Trig + 336
        0x00000af4:    bf00        ..      NOP      
        0x00000af6:    4824        $H      LDR      r0,[pc,#144] ; [0xb88] = 0x40020000
        0x00000af8:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000afa:    f3646019    d..`    BFI      r0,r4,#24,#2
        0x00000afe:    4922        "I      LDR      r1,[pc,#136] ; [0xb88] = 0x40020000
        0x00000b00:    6188        .a      STR      r0,[r1,#0x18]
        0x00000b02:    bf00        ..      NOP      
        0x00000b04:    e023        #.      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000b06:    bf00        ..      NOP      
        0x00000b08:    481f        .H      LDR      r0,[pc,#124] ; [0xb88] = 0x40020000
        0x00000b0a:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000b0c:    f364609b    d..`    BFI      r0,r4,#26,#2
        0x00000b10:    491d        .I      LDR      r1,[pc,#116] ; [0xb88] = 0x40020000
        0x00000b12:    6188        .a      STR      r0,[r1,#0x18]
        0x00000b14:    bf00        ..      NOP      
        0x00000b16:    e01a        ..      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000b18:    bf00        ..      NOP      
        0x00000b1a:    481b        .H      LDR      r0,[pc,#108] ; [0xb88] = 0x40020000
        0x00000b1c:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000b1e:    f364701d    d..p    BFI      r0,r4,#28,#2
        0x00000b22:    4919        .I      LDR      r1,[pc,#100] ; [0xb88] = 0x40020000
        0x00000b24:    6188        .a      STR      r0,[r1,#0x18]
        0x00000b26:    bf00        ..      NOP      
        0x00000b28:    e011        ..      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000b2a:    bf00        ..      NOP      
        0x00000b2c:    4816        .H      LDR      r0,[pc,#88] ; [0xb88] = 0x40020000
        0x00000b2e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000b30:    f364709f    d..p    BFI      r0,r4,#30,#2
        0x00000b34:    4914        .I      LDR      r1,[pc,#80] ; [0xb88] = 0x40020000
        0x00000b36:    6188        .a      STR      r0,[r1,#0x18]
        0x00000b38:    bf00        ..      NOP      
        0x00000b3a:    e008        ..      B        0xb4e ; HAL_EXTI_Trig + 354
        0x00000b3c:    2d0f        .-      CMP      r5,#0xf
        0x00000b3e:    dc00        ..      BGT      0xb42 ; HAL_EXTI_Trig + 342
        0x00000b40:    e004        ..      B        0xb4c ; HAL_EXTI_Trig + 352
        0x00000b42:    2241        A"      MOVS     r2,#0x41
        0x00000b44:    a103        ..      ADR      r1,{pc}+0x10 ; 0xb54
        0x00000b46:    a011        ..      ADR      r0,{pc}+0x46 ; 0xb8c
        0x00000b48:    f000fdf8    ....    BL       __aeabi_assert ; 0x173c
        0x00000b4c:    bf00        ..      NOP      
        0x00000b4e:    bf00        ..      NOP      
        0x00000b50:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000b52:    0000        ..      DCW    0
        0x00000b54:    735c2e2e    ..\s    DCD    1935420974
        0x00000b58:    735c6b64    dk\s    DCD    1935436644
        0x00000b5c:    735c6372    rc\s    DCD    1935434610
        0x00000b60:    645c636f    oc\d    DCD    1683776367
        0x00000b64:    65766972    rive    DCD    1702259058
        0x00000b68:    78655c72    r\ex    DCD    2019908722
        0x00000b6c:    632e6974    ti.c    DCD    1663986036
        0x00000b70:    00000000    ....    DCD    0
        0x00000b74:    65707974    type    DCD    1701869940
        0x00000b78:    454e3d3c    <=NE    DCD    1162755388
        0x00000b7c:    49544547    GETI    DCD    1230259527
        0x00000b80:    455f4556    VE_E    DCD    1163871574
        0x00000b84:    00454744    DGE.    DCD    4540228
        0x00000b88:    40020000    ...@    DCD    1073872896
        0x00000b8c:    5f746e69    int_    DCD    1601465961
        0x00000b90:    3c637273    src<    DCD    1013150323
        0x00000b94:    5458453d    =EXT    DCD    1415071037
        0x00000b98:    544e495f    _INT    DCD    1414416735
        0x00000b9c:    0035315f    _15.    DCD    3486047
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000ba0:    bf00        ..      NOP      
        0x00000ba2:    4904        .I      LDR      r1,[pc,#16] ; [0xbb4] = 0x40020000
        0x00000ba4:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000ba6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000baa:    4a02        .J      LDR      r2,[pc,#8] ; [0xbb4] = 0x40020000
        0x00000bac:    6111        .a      STR      r1,[r2,#0x10]
        0x00000bae:    bf00        ..      NOP      
        0x00000bb0:    4770        pG      BX       lr
    $d
        0x00000bb2:    0000        ..      DCW    0
        0x00000bb4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000bb8:    b510        ..      PUSH     {r4,lr}
        0x00000bba:    4604        .F      MOV      r4,r0
        0x00000bbc:    1e60        `.      SUBS     r0,r4,#1
        0x00000bbe:    280f        .(      CMP      r0,#0xf
        0x00000bc0:    dc00        ..      BGT      0xbc4 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000bc2:    e004        ..      B        0xbce ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000bc4:    2225        %"      MOVS     r2,#0x25
        0x00000bc6:    a108        ..      ADR      r1,{pc}+0x22 ; 0xbe8
        0x00000bc8:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xc08
        0x00000bca:    f000fdb7    ....    BL       __aeabi_assert ; 0x173c
        0x00000bce:    1e61        a.      SUBS     r1,r4,#1
        0x00000bd0:    b2c8        ..      UXTB     r0,r1
        0x00000bd2:    4913        .I      LDR      r1,[pc,#76] ; [0xc20] = 0x40020000
        0x00000bd4:    6849        Ih      LDR      r1,[r1,#4]
        0x00000bd6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000bda:    4a11        .J      LDR      r2,[pc,#68] ; [0xc20] = 0x40020000
        0x00000bdc:    6051        Q`      STR      r1,[r2,#4]
        0x00000bde:    bf00        ..      NOP      
        0x00000be0:    2001        .       MOVS     r0,#1
        0x00000be2:    f000fe41    ..A.    BL       sysc_awo_div_update_set ; 0x1868
        0x00000be6:    bd10        ..      POP      {r4,pc}
    $d
        0x00000be8:    735c2e2e    ..\s    DCD    1935420974
        0x00000bec:    735c6b64    dk\s    DCD    1935436644
        0x00000bf0:    735c6372    rc\s    DCD    1935434610
        0x00000bf4:    645c636f    oc\d    DCD    1683776367
        0x00000bf8:    65766972    rive    DCD    1702259058
        0x00000bfc:    79735c72    r\sy    DCD    2037603442
        0x00000c00:    6e6f6373    scon    DCD    1852793715
        0x00000c04:    0000632e    .c..    DCD    25390
        0x00000c08:    62686128    (ahb    DCD    1651007784
        0x00000c0c:    7669645f    _div    DCD    1986618463
        0x00000c10:    72656469    ider    DCD    1919247465
        0x00000c14:    3c29312d    -1)<    DCD    1009332525
        0x00000c18:    6678303d    =0xf    DCD    1719152701
        0x00000c1c:    00000000    ....    DCD    0
        0x00000c20:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000c24:    b510        ..      PUSH     {r4,lr}
        0x00000c26:    4604        .F      MOV      r4,r0
        0x00000c28:    1e60        `.      SUBS     r0,r4,#1
        0x00000c2a:    280f        .(      CMP      r0,#0xf
        0x00000c2c:    dc00        ..      BGT      0xc30 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000c2e:    e004        ..      B        0xc3a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000c30:    222c        ,"      MOVS     r2,#0x2c
        0x00000c32:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xc5c
        0x00000c34:    a011        ..      ADR      r0,{pc}+0x48 ; 0xc7c
        0x00000c36:    f000fd81    ....    BL       __aeabi_assert ; 0x173c
        0x00000c3a:    1e61        a.      SUBS     r1,r4,#1
        0x00000c3c:    b2c8        ..      UXTB     r0,r1
        0x00000c3e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000c42:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c44:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000c48:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000c4c:    6051        Q`      STR      r1,[r2,#4]
        0x00000c4e:    bf00        ..      NOP      
        0x00000c50:    2001        .       MOVS     r0,#1
        0x00000c52:    0781        ..      LSLS     r1,r0,#30
        0x00000c54:    6008        .`      STR      r0,[r1,#0]
        0x00000c56:    bf00        ..      NOP      
        0x00000c58:    bd10        ..      POP      {r4,pc}
    $d
        0x00000c5a:    0000        ..      DCW    0
        0x00000c5c:    735c2e2e    ..\s    DCD    1935420974
        0x00000c60:    735c6b64    dk\s    DCD    1935436644
        0x00000c64:    735c6372    rc\s    DCD    1935434610
        0x00000c68:    645c636f    oc\d    DCD    1683776367
        0x00000c6c:    65766972    rive    DCD    1702259058
        0x00000c70:    79735c72    r\sy    DCD    2037603442
        0x00000c74:    6e6f6373    scon    DCD    1852793715
        0x00000c78:    0000632e    .c..    DCD    25390
        0x00000c7c:    62706128    (apb    DCD    1651532072
        0x00000c80:    69645f30    0_di    DCD    1768185648
        0x00000c84:    65646976    vide    DCD    1701079414
        0x00000c88:    29312d72    r-1)    DCD    691088754
        0x00000c8c:    78303d3c    <=0x    DCD    2016427324
        0x00000c90:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000c94:    b510        ..      PUSH     {r4,lr}
        0x00000c96:    4604        .F      MOV      r4,r0
        0x00000c98:    1e60        `.      SUBS     r0,r4,#1
        0x00000c9a:    280f        .(      CMP      r0,#0xf
        0x00000c9c:    dc00        ..      BGT      0xca0 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000c9e:    e004        ..      B        0xcaa ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000ca0:    2234        4"      MOVS     r2,#0x34
        0x00000ca2:    a108        ..      ADR      r1,{pc}+0x22 ; 0xcc4
        0x00000ca4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xce4
        0x00000ca6:    f000fd49    ..I.    BL       __aeabi_assert ; 0x173c
        0x00000caa:    1e61        a.      SUBS     r1,r4,#1
        0x00000cac:    b2c8        ..      UXTB     r0,r1
        0x00000cae:    4913        .I      LDR      r1,[pc,#76] ; [0xcfc] = 0x40020000
        0x00000cb0:    6849        Ih      LDR      r1,[r1,#4]
        0x00000cb2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000cb6:    4a11        .J      LDR      r2,[pc,#68] ; [0xcfc] = 0x40020000
        0x00000cb8:    6051        Q`      STR      r1,[r2,#4]
        0x00000cba:    bf00        ..      NOP      
        0x00000cbc:    2002        .       MOVS     r0,#2
        0x00000cbe:    f000fdd3    ....    BL       sysc_awo_div_update_set ; 0x1868
        0x00000cc2:    bd10        ..      POP      {r4,pc}
    $d
        0x00000cc4:    735c2e2e    ..\s    DCD    1935420974
        0x00000cc8:    735c6b64    dk\s    DCD    1935436644
        0x00000ccc:    735c6372    rc\s    DCD    1935434610
        0x00000cd0:    645c636f    oc\d    DCD    1683776367
        0x00000cd4:    65766972    rive    DCD    1702259058
        0x00000cd8:    79735c72    r\sy    DCD    2037603442
        0x00000cdc:    6e6f6373    scon    DCD    1852793715
        0x00000ce0:    0000632e    .c..    DCD    25390
        0x00000ce4:    62706128    (apb    DCD    1651532072
        0x00000ce8:    69645f31    1_di    DCD    1768185649
        0x00000cec:    65646976    vide    DCD    1701079414
        0x00000cf0:    29312d72    r-1)    DCD    691088754
        0x00000cf4:    78303d3c    <=0x    DCD    2016427324
        0x00000cf8:    00000066    f...    DCD    102
        0x00000cfc:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000d00:    b570        p.      PUSH     {r4-r6,lr}
        0x00000d02:    4605        .F      MOV      r5,r0
        0x00000d04:    460c        .F      MOV      r4,r1
        0x00000d06:    1e60        `.      SUBS     r0,r4,#1
        0x00000d08:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000d0c:    da00        ..      BGE      0xd10 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000d0e:    e004        ..      B        0xd1a ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000d10:    223c        <"      MOVS     r2,#0x3c
        0x00000d12:    a112        ..      ADR      r1,{pc}+0x4a ; 0xd5c
        0x00000d14:    a019        ..      ADR      r0,{pc}+0x68 ; 0xd7c
        0x00000d16:    f000fd11    ....    BL       __aeabi_assert ; 0x173c
        0x00000d1a:    2d01        .-      CMP      r5,#1
        0x00000d1c:    dc00        ..      BGT      0xd20 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000d1e:    e004        ..      B        0xd2a ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000d20:    223d        ="      MOVS     r2,#0x3d
        0x00000d22:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xd5c
        0x00000d24:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xd94
        0x00000d26:    f000fd09    ....    BL       __aeabi_assert ; 0x173c
        0x00000d2a:    b935        5.      CBNZ     r5,0xd3a ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000d2c:    2000        .       MOVS     r0,#0
        0x00000d2e:    f000fda1    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1874
        0x00000d32:    2004        .       MOVS     r0,#4
        0x00000d34:    f000fd98    ....    BL       sysc_awo_div_update_set ; 0x1868
        0x00000d38:    e00e        ..      B        0xd58 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000d3a:    2c02        .,      CMP      r4,#2
        0x00000d3c:    db00        ..      BLT      0xd40 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000d3e:    e004        ..      B        0xd4a ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000d40:    2247        G"      MOVS     r2,#0x47
        0x00000d42:    a106        ..      ADR      r1,{pc}+0x1a ; 0xd5c
        0x00000d44:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xdb0
        0x00000d46:    f000fcf9    ....    BL       __aeabi_assert ; 0x173c
        0x00000d4a:    1e61        a.      SUBS     r1,r4,#1
        0x00000d4c:    b288        ..      UXTH     r0,r1
        0x00000d4e:    f000fd91    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1874
        0x00000d52:    2004        .       MOVS     r0,#4
        0x00000d54:    f000fd88    ....    BL       sysc_awo_div_update_set ; 0x1868
        0x00000d58:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000d5a:    0000        ..      DCW    0
        0x00000d5c:    735c2e2e    ..\s    DCD    1935420974
        0x00000d60:    735c6b64    dk\s    DCD    1935436644
        0x00000d64:    735c6372    rc\s    DCD    1935434610
        0x00000d68:    645c636f    oc\d    DCD    1683776367
        0x00000d6c:    65766972    rive    DCD    1702259058
        0x00000d70:    79735c72    r\sy    DCD    2037603442
        0x00000d74:    6e6f6373    scon    DCD    1852793715
        0x00000d78:    0000632e    .c..    DCD    25390
        0x00000d7c:    63747228    (rtc    DCD    1668575784
        0x00000d80:    7669645f    _div    DCD    1986618463
        0x00000d84:    72656469    ider    DCD    1919247465
        0x00000d88:    3c29312d    -1)<    DCD    1009332525
        0x00000d8c:    3178303d    =0x1    DCD    829960253
        0x00000d90:    00666666    fff.    DCD    6710886
        0x00000d94:    5f637472    rtc_    DCD    1600353394
        0x00000d98:    3c637273    src<    DCD    1013150323
        0x00000d9c:    6374723d    =rtc    DCD    1668575805
        0x00000da0:    5f6b6c63    clk_    DCD    1600875619
        0x00000da4:    6d6f7266    from    DCD    1836020326
        0x00000da8:    6268615f    _ahb    DCD    1651007839
        0x00000dac:    00000000    ....    DCD    0
        0x00000db0:    5f637472    rtc_    DCD    1600353394
        0x00000db4:    69766964    divi    DCD    1769367908
        0x00000db8:    3e726564    der>    DCD    1047684452
        0x00000dbc:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000dc0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000dc2:    4d07        .M      LDR      r5,[pc,#28] ; [0xde0] = 0x88
        0x00000dc4:    f1050460    ..`.    ADD      r4,r5,#0x60
        0x00000dc8:    b104        ..      CBZ      r4,0xdcc ; I2C0_IRQHandler + 12
        0x00000dca:    e004        ..      B        0xdd6 ; I2C0_IRQHandler + 22
        0x00000dcc:    22ae        ."      MOVS     r2,#0xae
        0x00000dce:    a105        ..      ADR      r1,{pc}+0x16 ; 0xde4
        0x00000dd0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xe04
        0x00000dd2:    f000fcb3    ....    BL       __aeabi_assert ; 0x173c
        0x00000dd6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000dda:    4788        .G      BLX      r1
        0x00000ddc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000dde:    0000        ..      DCW    0
        0x00000de0:    00000088    ....    DCD    136
        0x00000de4:    2e5c2e2e    ..\.    DCD    777793070
        0x00000de8:    2e2e5c2e    .\..    DCD    774790190
        0x00000dec:    464c455c    \ELF    DCD    1179403612
        0x00000df0:    53425f32    2_BS    DCD    1396858674
        0x00000df4:    72445c50    P\Dr    DCD    1917082704
        0x00000df8:    72657669    iver    DCD    1919252073
        0x00000dfc:    746e695c    \int    DCD    1953392988
        0x00000e00:    00632e63    c.c.    DCD    6499939
        0x00000e04:    636e7566    func    DCD    1668183398
        0x00000e08:    203d2120     !=     DCD    540877088
        0x00000e0c:    00000030    0...    DCD    48
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000e10:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e12:    4d07        .M      LDR      r5,[pc,#28] ; [0xe30] = 0x88
        0x00000e14:    f1050468    ..h.    ADD      r4,r5,#0x68
        0x00000e18:    b104        ..      CBZ      r4,0xe1c ; I2C1_IRQHandler + 12
        0x00000e1a:    e004        ..      B        0xe26 ; I2C1_IRQHandler + 22
        0x00000e1c:    22b8        ."      MOVS     r2,#0xb8
        0x00000e1e:    a105        ..      ADR      r1,{pc}+0x16 ; 0xe34
        0x00000e20:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xe54
        0x00000e22:    f000fc8b    ....    BL       __aeabi_assert ; 0x173c
        0x00000e26:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000e2a:    4788        .G      BLX      r1
        0x00000e2c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e2e:    0000        ..      DCW    0
        0x00000e30:    00000088    ....    DCD    136
        0x00000e34:    2e5c2e2e    ..\.    DCD    777793070
        0x00000e38:    2e2e5c2e    .\..    DCD    774790190
        0x00000e3c:    464c455c    \ELF    DCD    1179403612
        0x00000e40:    53425f32    2_BS    DCD    1396858674
        0x00000e44:    72445c50    P\Dr    DCD    1917082704
        0x00000e48:    72657669    iver    DCD    1919252073
        0x00000e4c:    746e695c    \int    DCD    1953392988
        0x00000e50:    00632e63    c.c.    DCD    6499939
        0x00000e54:    636e7566    func    DCD    1668183398
        0x00000e58:    203d2120     !=     DCD    540877088
        0x00000e5c:    00000030    0...    DCD    48
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00000e60:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e62:    4d07        .M      LDR      r5,[pc,#28] ; [0xe80] = 0x88
        0x00000e64:    f1050488    ....    ADD      r4,r5,#0x88
        0x00000e68:    b104        ..      CBZ      r4,0xe6c ; I2S_IRQHandler + 12
        0x00000e6a:    e004        ..      B        0xe76 ; I2S_IRQHandler + 22
        0x00000e6c:    22e0        ."      MOVS     r2,#0xe0
        0x00000e6e:    a105        ..      ADR      r1,{pc}+0x16 ; 0xe84
        0x00000e70:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xea4
        0x00000e72:    f000fc63    ..c.    BL       __aeabi_assert ; 0x173c
        0x00000e76:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000e7a:    4788        .G      BLX      r1
        0x00000e7c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e7e:    0000        ..      DCW    0
        0x00000e80:    00000088    ....    DCD    136
        0x00000e84:    2e5c2e2e    ..\.    DCD    777793070
        0x00000e88:    2e2e5c2e    .\..    DCD    774790190
        0x00000e8c:    464c455c    \ELF    DCD    1179403612
        0x00000e90:    53425f32    2_BS    DCD    1396858674
        0x00000e94:    72445c50    P\Dr    DCD    1917082704
        0x00000e98:    72657669    iver    DCD    1919252073
        0x00000e9c:    746e695c    \int    DCD    1953392988
        0x00000ea0:    00632e63    c.c.    DCD    6499939
        0x00000ea4:    636e7566    func    DCD    1668183398
        0x00000ea8:    203d2120     !=     DCD    540877088
        0x00000eac:    00000030    0...    DCD    48
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00000eb0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000eb2:    4d07        .M      LDR      r5,[pc,#28] ; [0xed0] = 0x88
        0x00000eb4:    f1050420    .. .    ADD      r4,r5,#0x20
        0x00000eb8:    b104        ..      CBZ      r4,0xebc ; QSPI_IRQHandler + 12
        0x00000eba:    e004        ..      B        0xec6 ; QSPI_IRQHandler + 22
        0x00000ebc:    2259        Y"      MOVS     r2,#0x59
        0x00000ebe:    a105        ..      ADR      r1,{pc}+0x16 ; 0xed4
        0x00000ec0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xef4
        0x00000ec2:    f000fc3b    ..;.    BL       __aeabi_assert ; 0x173c
        0x00000ec6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000eca:    4788        .G      BLX      r1
        0x00000ecc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000ece:    0000        ..      DCW    0
        0x00000ed0:    00000088    ....    DCD    136
        0x00000ed4:    2e5c2e2e    ..\.    DCD    777793070
        0x00000ed8:    2e2e5c2e    .\..    DCD    774790190
        0x00000edc:    464c455c    \ELF    DCD    1179403612
        0x00000ee0:    53425f32    2_BS    DCD    1396858674
        0x00000ee4:    72445c50    P\Dr    DCD    1917082704
        0x00000ee8:    72657669    iver    DCD    1919252073
        0x00000eec:    746e695c    \int    DCD    1953392988
        0x00000ef0:    00632e63    c.c.    DCD    6499939
        0x00000ef4:    636e7566    func    DCD    1668183398
        0x00000ef8:    203d2120     !=     DCD    540877088
        0x00000efc:    00000030    0...    DCD    48
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00000f00:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f02:    4d07        .M      LDR      r5,[pc,#28] ; [0xf20] = 0x88
        0x00000f04:    f1050410    ....    ADD      r4,r5,#0x10
        0x00000f08:    b104        ..      CBZ      r4,0xf0c ; RTC_IRQHandler + 12
        0x00000f0a:    e004        ..      B        0xf16 ; RTC_IRQHandler + 22
        0x00000f0c:    2243        C"      MOVS     r2,#0x43
        0x00000f0e:    a105        ..      ADR      r1,{pc}+0x16 ; 0xf24
        0x00000f10:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xf44
        0x00000f12:    f000fc13    ....    BL       __aeabi_assert ; 0x173c
        0x00000f16:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000f1a:    4788        .G      BLX      r1
        0x00000f1c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f1e:    0000        ..      DCW    0
        0x00000f20:    00000088    ....    DCD    136
        0x00000f24:    2e5c2e2e    ..\.    DCD    777793070
        0x00000f28:    2e2e5c2e    .\..    DCD    774790190
        0x00000f2c:    464c455c    \ELF    DCD    1179403612
        0x00000f30:    53425f32    2_BS    DCD    1396858674
        0x00000f34:    72445c50    P\Dr    DCD    1917082704
        0x00000f38:    72657669    iver    DCD    1919252073
        0x00000f3c:    746e695c    \int    DCD    1953392988
        0x00000f40:    00632e63    c.c.    DCD    6499939
        0x00000f44:    636e7566    func    DCD    1668183398
        0x00000f48:    203d2120     !=     DCD    540877088
        0x00000f4c:    00000030    0...    DCD    48
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00000f50:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000f54:    4604        .F      MOV      r4,r0
        0x00000f56:    460d        .F      MOV      r5,r1
        0x00000f58:    4616        .F      MOV      r6,r2
        0x00000f5a:    bf00        ..      NOP      
        0x00000f5c:    480d        .H      LDR      r0,[pc,#52] ; [0xf94] = 0x20000008
        0x00000f5e:    7800        .x      LDRB     r0,[r0,#0]
        0x00000f60:    b908        ..      CBNZ     r0,0xf66 ; SEGGER_RTT_Write + 22
        0x00000f62:    f000fa37    ..7.    BL       _DoInit ; 0x13d4
        0x00000f66:    bf00        ..      NOP      
        0x00000f68:    f3ef8011    ....    MRS      r0,BASEPRI
        0x00000f6c:    4607        .F      MOV      r7,r0
        0x00000f6e:    2020                MOVS     r0,#0x20
        0x00000f70:    f3808811    ....    MSR      BASEPRI,r0
        0x00000f74:    bf00        ..      NOP      
        0x00000f76:    bf00        ..      NOP      
        0x00000f78:    4632        2F      MOV      r2,r6
        0x00000f7a:    4629        )F      MOV      r1,r5
        0x00000f7c:    4620         F      MOV      r0,r4
        0x00000f7e:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0xf98
        0x00000f82:    4680        .F      MOV      r8,r0
        0x00000f84:    b2f8        ..      UXTB     r0,r7
        0x00000f86:    f3808811    ....    MSR      BASEPRI,r0
        0x00000f8a:    bf00        ..      NOP      
        0x00000f8c:    bf00        ..      NOP      
        0x00000f8e:    4640        @F      MOV      r0,r8
        0x00000f90:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000f94:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000f98:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000f9c:    4607        .F      MOV      r7,r0
        0x00000f9e:    4688        .F      MOV      r8,r1
        0x00000fa0:    4616        .F      MOV      r6,r2
        0x00000fa2:    46c2        .F      MOV      r10,r8
        0x00000fa4:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x00000fa8:    481b        .H      LDR      r0,[pc,#108] ; [0x1018] = 0x20000020
        0x00000faa:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x00000fae:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x00000fb2:    b120         .      CBZ      r0,0xfbe ; SEGGER_RTT_WriteNoLock + 38
        0x00000fb4:    2801        .(      CMP      r0,#1
        0x00000fb6:    d011        ..      BEQ      0xfdc ; SEGGER_RTT_WriteNoLock + 68
        0x00000fb8:    2802        .(      CMP      r0,#2
        0x00000fba:    d126        &.      BNE      0x100a ; SEGGER_RTT_WriteNoLock + 114
        0x00000fbc:    e01e        ..      B        0xffc ; SEGGER_RTT_WriteNoLock + 100
        0x00000fbe:    4648        HF      MOV      r0,r9
        0x00000fc0:    f000fa40    ..@.    BL       _GetAvailWriteSpace ; 0x1444
        0x00000fc4:    4605        .F      MOV      r5,r0
        0x00000fc6:    42b5        .B      CMP      r5,r6
        0x00000fc8:    d201        ..      BCS      0xfce ; SEGGER_RTT_WriteNoLock + 54
        0x00000fca:    2400        .$      MOVS     r4,#0
        0x00000fcc:    e005        ..      B        0xfda ; SEGGER_RTT_WriteNoLock + 66
        0x00000fce:    4634        4F      MOV      r4,r6
        0x00000fd0:    4632        2F      MOV      r2,r6
        0x00000fd2:    4651        QF      MOV      r1,r10
        0x00000fd4:    4648        HF      MOV      r0,r9
        0x00000fd6:    f000fb8a    ....    BL       _WriteNoCheck ; 0x16ee
        0x00000fda:    e018        ..      B        0x100e ; SEGGER_RTT_WriteNoLock + 118
        0x00000fdc:    4648        HF      MOV      r0,r9
        0x00000fde:    f000fa31    ..1.    BL       _GetAvailWriteSpace ; 0x1444
        0x00000fe2:    4605        .F      MOV      r5,r0
        0x00000fe4:    42b5        .B      CMP      r5,r6
        0x00000fe6:    d201        ..      BCS      0xfec ; SEGGER_RTT_WriteNoLock + 84
        0x00000fe8:    4628        (F      MOV      r0,r5
        0x00000fea:    e000        ..      B        0xfee ; SEGGER_RTT_WriteNoLock + 86
        0x00000fec:    4630        0F      MOV      r0,r6
        0x00000fee:    4604        .F      MOV      r4,r0
        0x00000ff0:    4622        "F      MOV      r2,r4
        0x00000ff2:    4651        QF      MOV      r1,r10
        0x00000ff4:    4648        HF      MOV      r0,r9
        0x00000ff6:    f000fb7a    ..z.    BL       _WriteNoCheck ; 0x16ee
        0x00000ffa:    e008        ..      B        0x100e ; SEGGER_RTT_WriteNoLock + 118
        0x00000ffc:    4632        2F      MOV      r2,r6
        0x00000ffe:    4651        QF      MOV      r1,r10
        0x00001000:    4648        HF      MOV      r0,r9
        0x00001002:    f000fb3b    ..;.    BL       _WriteBlocking ; 0x167c
        0x00001006:    4604        .F      MOV      r4,r0
        0x00001008:    e001        ..      B        0x100e ; SEGGER_RTT_WriteNoLock + 118
        0x0000100a:    2400        .$      MOVS     r4,#0
        0x0000100c:    bf00        ..      NOP      
        0x0000100e:    bf00        ..      NOP      
        0x00001010:    4620         F      MOV      r0,r4
        0x00001012:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x00001016:    0000        ..      DCW    0
        0x00001018:    20000020     ..     DCD    536870944
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x0000101c:    b40f        ..      PUSH     {r0-r3}
        0x0000101e:    b538        8.      PUSH     {r3-r5,lr}
        0x00001020:    4604        .F      MOV      r4,r0
        0x00001022:    a806        ..      ADD      r0,sp,#0x18
        0x00001024:    9000        ..      STR      r0,[sp,#0]
        0x00001026:    466a        jF      MOV      r2,sp
        0x00001028:    4620         F      MOV      r0,r4
        0x0000102a:    9905        ..      LDR      r1,[sp,#0x14]
        0x0000102c:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0x103e
        0x00001030:    4605        .F      MOV      r5,r0
        0x00001032:    2000        .       MOVS     r0,#0
        0x00001034:    9000        ..      STR      r0,[sp,#0]
        0x00001036:    4628        (F      MOV      r0,r5
        0x00001038:    bc38        8.      POP      {r3-r5}
        0x0000103a:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x0000103e:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001042:    b099        ..      SUB      sp,sp,#0x64
        0x00001044:    4682        .F      MOV      r10,r0
        0x00001046:    460d        .F      MOV      r5,r1
        0x00001048:    4614        .F      MOV      r4,r2
        0x0000104a:    a803        ..      ADD      r0,sp,#0xc
        0x0000104c:    9014        ..      STR      r0,[sp,#0x50]
        0x0000104e:    2040        @       MOVS     r0,#0x40
        0x00001050:    9015        ..      STR      r0,[sp,#0x54]
        0x00001052:    2000        .       MOVS     r0,#0
        0x00001054:    9016        ..      STR      r0,[sp,#0x58]
        0x00001056:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x0000105a:    9017        ..      STR      r0,[sp,#0x5c]
        0x0000105c:    bf00        ..      NOP      
        0x0000105e:    782e        .x      LDRB     r6,[r5,#0]
        0x00001060:    1c6d        m.      ADDS     r5,r5,#1
        0x00001062:    b906        ..      CBNZ     r6,0x1066 ; SEGGER_RTT_vprintf + 40
        0x00001064:    e0dd        ..      B        0x1222 ; SEGGER_RTT_vprintf + 484
        0x00001066:    2e25        %.      CMP      r6,#0x25
        0x00001068:    d179        y.      BNE      0x115e ; SEGGER_RTT_vprintf + 288
        0x0000106a:    2700        .'      MOVS     r7,#0
        0x0000106c:    f04f0901    O...    MOV      r9,#1
        0x00001070:    bf00        ..      NOP      
        0x00001072:    782e        .x      LDRB     r6,[r5,#0]
        0x00001074:    2e23        #.      CMP      r6,#0x23
        0x00001076:    d012        ..      BEQ      0x109e ; SEGGER_RTT_vprintf + 96
        0x00001078:    2e2b        +.      CMP      r6,#0x2b
        0x0000107a:    d00c        ..      BEQ      0x1096 ; SEGGER_RTT_vprintf + 88
        0x0000107c:    2e2d        -.      CMP      r6,#0x2d
        0x0000107e:    d002        ..      BEQ      0x1086 ; SEGGER_RTT_vprintf + 72
        0x00001080:    2e30        0.      CMP      r6,#0x30
        0x00001082:    d110        ..      BNE      0x10a6 ; SEGGER_RTT_vprintf + 104
        0x00001084:    e003        ..      B        0x108e ; SEGGER_RTT_vprintf + 80
        0x00001086:    f0470701    G...    ORR      r7,r7,#1
        0x0000108a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000108c:    e00e        ..      B        0x10ac ; SEGGER_RTT_vprintf + 110
        0x0000108e:    f0470702    G...    ORR      r7,r7,#2
        0x00001092:    1c6d        m.      ADDS     r5,r5,#1
        0x00001094:    e00a        ..      B        0x10ac ; SEGGER_RTT_vprintf + 110
        0x00001096:    f0470704    G...    ORR      r7,r7,#4
        0x0000109a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000109c:    e006        ..      B        0x10ac ; SEGGER_RTT_vprintf + 110
        0x0000109e:    f0470708    G...    ORR      r7,r7,#8
        0x000010a2:    1c6d        m.      ADDS     r5,r5,#1
        0x000010a4:    e002        ..      B        0x10ac ; SEGGER_RTT_vprintf + 110
        0x000010a6:    f04f0900    O...    MOV      r9,#0
        0x000010aa:    bf00        ..      NOP      
        0x000010ac:    bf00        ..      NOP      
        0x000010ae:    f1b90f00    ....    CMP      r9,#0
        0x000010b2:    d1de        ..      BNE      0x1072 ; SEGGER_RTT_vprintf + 52
        0x000010b4:    f04f0800    O...    MOV      r8,#0
        0x000010b8:    bf00        ..      NOP      
        0x000010ba:    782e        .x      LDRB     r6,[r5,#0]
        0x000010bc:    2e30        0.      CMP      r6,#0x30
        0x000010be:    db01        ..      BLT      0x10c4 ; SEGGER_RTT_vprintf + 134
        0x000010c0:    2e39        9.      CMP      r6,#0x39
        0x000010c2:    dd00        ..      BLE      0x10c6 ; SEGGER_RTT_vprintf + 136
        0x000010c4:    e007        ..      B        0x10d6 ; SEGGER_RTT_vprintf + 152
        0x000010c6:    1c6d        m.      ADDS     r5,r5,#1
        0x000010c8:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x000010cc:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x000010d0:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x000010d4:    e7f1        ..      B        0x10ba ; SEGGER_RTT_vprintf + 124
        0x000010d6:    bf00        ..      NOP      
        0x000010d8:    2000        .       MOVS     r0,#0
        0x000010da:    9013        ..      STR      r0,[sp,#0x4c]
        0x000010dc:    782e        .x      LDRB     r6,[r5,#0]
        0x000010de:    2e2e        ..      CMP      r6,#0x2e
        0x000010e0:    d112        ..      BNE      0x1108 ; SEGGER_RTT_vprintf + 202
        0x000010e2:    1c6d        m.      ADDS     r5,r5,#1
        0x000010e4:    bf00        ..      NOP      
        0x000010e6:    782e        .x      LDRB     r6,[r5,#0]
        0x000010e8:    2e30        0.      CMP      r6,#0x30
        0x000010ea:    db01        ..      BLT      0x10f0 ; SEGGER_RTT_vprintf + 178
        0x000010ec:    2e39        9.      CMP      r6,#0x39
        0x000010ee:    dd00        ..      BLE      0x10f2 ; SEGGER_RTT_vprintf + 180
        0x000010f0:    e009        ..      B        0x1106 ; SEGGER_RTT_vprintf + 200
        0x000010f2:    1c6d        m.      ADDS     r5,r5,#1
        0x000010f4:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x000010f8:    9913        ..      LDR      r1,[sp,#0x4c]
        0x000010fa:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000010fe:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x00001102:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001104:    e7ef        ..      B        0x10e6 ; SEGGER_RTT_vprintf + 168
        0x00001106:    bf00        ..      NOP      
        0x00001108:    782e        .x      LDRB     r6,[r5,#0]
        0x0000110a:    bf00        ..      NOP      
        0x0000110c:    2e6c        l.      CMP      r6,#0x6c
        0x0000110e:    d001        ..      BEQ      0x1114 ; SEGGER_RTT_vprintf + 214
        0x00001110:    2e68        h.      CMP      r6,#0x68
        0x00001112:    d102        ..      BNE      0x111a ; SEGGER_RTT_vprintf + 220
        0x00001114:    1c6d        m.      ADDS     r5,r5,#1
        0x00001116:    782e        .x      LDRB     r6,[r5,#0]
        0x00001118:    e000        ..      B        0x111c ; SEGGER_RTT_vprintf + 222
        0x0000111a:    e000        ..      B        0x111e ; SEGGER_RTT_vprintf + 224
        0x0000111c:    e7f6        ..      B        0x110c ; SEGGER_RTT_vprintf + 206
        0x0000111e:    bf00        ..      NOP      
        0x00001120:    2e70        p.      CMP      r6,#0x70
        0x00001122:    d05d        ].      BEQ      0x11e0 ; SEGGER_RTT_vprintf + 418
        0x00001124:    dc08        ..      BGT      0x1138 ; SEGGER_RTT_vprintf + 250
        0x00001126:    2e25        %.      CMP      r6,#0x25
        0x00001128:    d06a        j.      BEQ      0x1200 ; SEGGER_RTT_vprintf + 450
        0x0000112a:    2e58        X.      CMP      r6,#0x58
        0x0000112c:    d035        5.      BEQ      0x119a ; SEGGER_RTT_vprintf + 348
        0x0000112e:    2e63        c.      CMP      r6,#0x63
        0x00001130:    d009        ..      BEQ      0x1146 ; SEGGER_RTT_vprintf + 264
        0x00001132:    2e64        d.      CMP      r6,#0x64
        0x00001134:    d169        i.      BNE      0x120a ; SEGGER_RTT_vprintf + 460
        0x00001136:    e013        ..      B        0x1160 ; SEGGER_RTT_vprintf + 290
        0x00001138:    2e73        s.      CMP      r6,#0x73
        0x0000113a:    d03c        <.      BEQ      0x11b6 ; SEGGER_RTT_vprintf + 376
        0x0000113c:    2e75        u.      CMP      r6,#0x75
        0x0000113e:    d01d        ..      BEQ      0x117c ; SEGGER_RTT_vprintf + 318
        0x00001140:    2e78        x.      CMP      r6,#0x78
        0x00001142:    d162        b.      BNE      0x120a ; SEGGER_RTT_vprintf + 460
        0x00001144:    e028        (.      B        0x1198 ; SEGGER_RTT_vprintf + 346
        0x00001146:    6821        !h      LDR      r1,[r4,#0]
        0x00001148:    1d08        ..      ADDS     r0,r1,#4
        0x0000114a:    6020         `      STR      r0,[r4,#0]
        0x0000114c:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001150:    f0090bff    ....    AND      r11,r9,#0xff
        0x00001154:    4659        YF      MOV      r1,r11
        0x00001156:    a814        ..      ADD      r0,sp,#0x50
        0x00001158:    f000fa6e    ..n.    BL       _StoreChar ; 0x1638
        0x0000115c:    e056        V.      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x0000115e:    e058        X.      B        0x1212 ; SEGGER_RTT_vprintf + 468
        0x00001160:    6821        !h      LDR      r1,[r4,#0]
        0x00001162:    1d08        ..      ADDS     r0,r1,#4
        0x00001164:    6020         `      STR      r0,[r4,#0]
        0x00001166:    f8d19000    ....    LDR      r9,[r1,#0]
        0x0000116a:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000116e:    220a        ."      MOVS     r2,#0xa
        0x00001170:    4649        IF      MOV      r1,r9
        0x00001172:    a814        ..      ADD      r0,sp,#0x50
        0x00001174:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001176:    f000f973    ..s.    BL       _PrintInt ; 0x1460
        0x0000117a:    e047        G.      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x0000117c:    6821        !h      LDR      r1,[r4,#0]
        0x0000117e:    1d08        ..      ADDS     r0,r1,#4
        0x00001180:    6020         `      STR      r0,[r4,#0]
        0x00001182:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001186:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000118a:    220a        ."      MOVS     r2,#0xa
        0x0000118c:    4649        IF      MOV      r1,r9
        0x0000118e:    a814        ..      ADD      r0,sp,#0x50
        0x00001190:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001192:    f000f9db    ....    BL       _PrintUnsigned ; 0x154c
        0x00001196:    e039        9.      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x00001198:    bf00        ..      NOP      
        0x0000119a:    6821        !h      LDR      r1,[r4,#0]
        0x0000119c:    1d08        ..      ADDS     r0,r1,#4
        0x0000119e:    6020         `      STR      r0,[r4,#0]
        0x000011a0:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000011a4:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000011a8:    2210        ."      MOVS     r2,#0x10
        0x000011aa:    4649        IF      MOV      r1,r9
        0x000011ac:    a814        ..      ADD      r0,sp,#0x50
        0x000011ae:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000011b0:    f000f9cc    ....    BL       _PrintUnsigned ; 0x154c
        0x000011b4:    e02a        *.      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x000011b6:    6821        !h      LDR      r1,[r4,#0]
        0x000011b8:    1d08        ..      ADDS     r0,r1,#4
        0x000011ba:    6020         `      STR      r0,[r4,#0]
        0x000011bc:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x000011c0:    bf00        ..      NOP      
        0x000011c2:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x000011c6:    f10b0b01    ....    ADD      r11,r11,#1
        0x000011ca:    b906        ..      CBNZ     r6,0x11ce ; SEGGER_RTT_vprintf + 400
        0x000011cc:    e006        ..      B        0x11dc ; SEGGER_RTT_vprintf + 414
        0x000011ce:    4631        1F      MOV      r1,r6
        0x000011d0:    a814        ..      ADD      r0,sp,#0x50
        0x000011d2:    f000fa31    ..1.    BL       _StoreChar ; 0x1638
        0x000011d6:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000011d8:    2800        .(      CMP      r0,#0
        0x000011da:    daf2        ..      BGE      0x11c2 ; SEGGER_RTT_vprintf + 388
        0x000011dc:    bf00        ..      NOP      
        0x000011de:    e015        ..      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x000011e0:    6821        !h      LDR      r1,[r4,#0]
        0x000011e2:    1d08        ..      ADDS     r0,r1,#4
        0x000011e4:    6020         `      STR      r0,[r4,#0]
        0x000011e6:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000011ea:    2000        .       MOVS     r0,#0
        0x000011ec:    2108        .!      MOVS     r1,#8
        0x000011ee:    460b        .F      MOV      r3,r1
        0x000011f0:    2210        ."      MOVS     r2,#0x10
        0x000011f2:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x000011f6:    4649        IF      MOV      r1,r9
        0x000011f8:    a814        ..      ADD      r0,sp,#0x50
        0x000011fa:    f000f9a7    ....    BL       _PrintUnsigned ; 0x154c
        0x000011fe:    e005        ..      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x00001200:    2125        %!      MOVS     r1,#0x25
        0x00001202:    a814        ..      ADD      r0,sp,#0x50
        0x00001204:    f000fa18    ....    BL       _StoreChar ; 0x1638
        0x00001208:    e000        ..      B        0x120c ; SEGGER_RTT_vprintf + 462
        0x0000120a:    bf00        ..      NOP      
        0x0000120c:    bf00        ..      NOP      
        0x0000120e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001210:    e003        ..      B        0x121a ; SEGGER_RTT_vprintf + 476
        0x00001212:    4631        1F      MOV      r1,r6
        0x00001214:    a814        ..      ADD      r0,sp,#0x50
        0x00001216:    f000fa0f    ....    BL       _StoreChar ; 0x1638
        0x0000121a:    9817        ..      LDR      r0,[sp,#0x5c]
        0x0000121c:    2800        .(      CMP      r0,#0
        0x0000121e:    f6bfaf1e    ....    BGE      0x105e ; SEGGER_RTT_vprintf + 32
        0x00001222:    bf00        ..      NOP      
        0x00001224:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001226:    2800        .(      CMP      r0,#0
        0x00001228:    dd0a        ..      BLE      0x1240 ; SEGGER_RTT_vprintf + 514
        0x0000122a:    9816        ..      LDR      r0,[sp,#0x58]
        0x0000122c:    b120         .      CBZ      r0,0x1238 ; SEGGER_RTT_vprintf + 506
        0x0000122e:    a903        ..      ADD      r1,sp,#0xc
        0x00001230:    4650        PF      MOV      r0,r10
        0x00001232:    9a16        ..      LDR      r2,[sp,#0x58]
        0x00001234:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0xf50
        0x00001238:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x0000123c:    4408        .D      ADD      r0,r0,r1
        0x0000123e:    9017        ..      STR      r0,[sp,#0x5c]
        0x00001240:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001242:    b019        ..      ADD      sp,sp,#0x64
        0x00001244:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00001248:    b570        p.      PUSH     {r4-r6,lr}
        0x0000124a:    4d07        .M      LDR      r5,[pc,#28] ; [0x1268] = 0x88
        0x0000124c:    f1050470    ..p.    ADD      r4,r5,#0x70
        0x00001250:    b104        ..      CBZ      r4,0x1254 ; SPIM_IRQHandler + 12
        0x00001252:    e004        ..      B        0x125e ; SPIM_IRQHandler + 22
        0x00001254:    22c2        ."      MOVS     r2,#0xc2
        0x00001256:    a105        ..      ADR      r1,{pc}+0x16 ; 0x126c
        0x00001258:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x128c
        0x0000125a:    f000fa6f    ..o.    BL       __aeabi_assert ; 0x173c
        0x0000125e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001262:    4788        .G      BLX      r1
        0x00001264:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001266:    0000        ..      DCW    0
        0x00001268:    00000088    ....    DCD    136
        0x0000126c:    2e5c2e2e    ..\.    DCD    777793070
        0x00001270:    2e2e5c2e    .\..    DCD    774790190
        0x00001274:    464c455c    \ELF    DCD    1179403612
        0x00001278:    53425f32    2_BS    DCD    1396858674
        0x0000127c:    72445c50    P\Dr    DCD    1917082704
        0x00001280:    72657669    iver    DCD    1919252073
        0x00001284:    746e695c    \int    DCD    1953392988
        0x00001288:    00632e63    c.c.    DCD    6499939
        0x0000128c:    636e7566    func    DCD    1668183398
        0x00001290:    203d2120     !=     DCD    540877088
        0x00001294:    00000030    0...    DCD    48
    $t
    i.SystemInit
    SystemInit
        0x00001298:    b510        ..      PUSH     {r4,lr}
        0x0000129a:    bf00        ..      NOP      
        0x0000129c:    480f        .H      LDR      r0,[pc,#60] ; [0x12dc] = 0x4000b000
        0x0000129e:    6800        .h      LDR      r0,[r0,#0]
        0x000012a0:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x000012a4:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x000012a8:    d1f8        ..      BNE      0x129c ; SystemInit + 4
        0x000012aa:    f64e2060    N.`     MOV      r0,#0xea60
        0x000012ae:    f000fa65    ..e.    BL       delay ; 0x177c
        0x000012b2:    480b        .H      LDR      r0,[pc,#44] ; [0x12e0] = 0x5f5e100
        0x000012b4:    490b        .I      LDR      r1,[pc,#44] ; [0x12e4] = 0x20000000
        0x000012b6:    6008        .`      STR      r0,[r1,#0]
        0x000012b8:    2008        .       MOVS     r0,#8
        0x000012ba:    f7fffc71    ..q.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xba0
        0x000012be:    2002        .       MOVS     r0,#2
        0x000012c0:    f7fffc7a    ..z.    BL       HAL_SYSCON_Set_HClk_Div ; 0xbb8
        0x000012c4:    2004        .       MOVS     r0,#4
        0x000012c6:    f7fffcad    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xc24
        0x000012ca:    2002        .       MOVS     r0,#2
        0x000012cc:    f7fffce2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xc94
        0x000012d0:    2164        d!      MOVS     r1,#0x64
        0x000012d2:    2001        .       MOVS     r0,#1
        0x000012d4:    f7fffd14    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0xd00
        0x000012d8:    bd10        ..      POP      {r4,pc}
    $d
        0x000012da:    0000        ..      DCW    0
        0x000012dc:    4000b000    ...@    DCD    1073786880
        0x000012e0:    05f5e100    ....    DCD    100000000
        0x000012e4:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x000012e8:    b570        p.      PUSH     {r4-r6,lr}
        0x000012ea:    4d07        .M      LDR      r5,[pc,#28] ; [0x1308] = 0x88
        0x000012ec:    f1050458    ..X.    ADD      r4,r5,#0x58
        0x000012f0:    b104        ..      CBZ      r4,0x12f4 ; TIMER_IRQHandler + 12
        0x000012f2:    e004        ..      B        0x12fe ; TIMER_IRQHandler + 22
        0x000012f4:    22a4        ."      MOVS     r2,#0xa4
        0x000012f6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x130c
        0x000012f8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x132c
        0x000012fa:    f000fa1f    ....    BL       __aeabi_assert ; 0x173c
        0x000012fe:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001302:    4788        .G      BLX      r1
        0x00001304:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001306:    0000        ..      DCW    0
        0x00001308:    00000088    ....    DCD    136
        0x0000130c:    2e5c2e2e    ..\.    DCD    777793070
        0x00001310:    2e2e5c2e    .\..    DCD    774790190
        0x00001314:    464c455c    \ELF    DCD    1179403612
        0x00001318:    53425f32    2_BS    DCD    1396858674
        0x0000131c:    72445c50    P\Dr    DCD    1917082704
        0x00001320:    72657669    iver    DCD    1919252073
        0x00001324:    746e695c    \int    DCD    1953392988
        0x00001328:    00632e63    c.c.    DCD    6499939
        0x0000132c:    636e7566    func    DCD    1668183398
        0x00001330:    203d2120     !=     DCD    540877088
        0x00001334:    00000030    0...    DCD    48
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001338:    b570        p.      PUSH     {r4-r6,lr}
        0x0000133a:    4d07        .M      LDR      r5,[pc,#28] ; [0x1358] = 0x88
        0x0000133c:    f1050478    ..x.    ADD      r4,r5,#0x78
        0x00001340:    b104        ..      CBZ      r4,0x1344 ; UART_IRQHandler + 12
        0x00001342:    e004        ..      B        0x134e ; UART_IRQHandler + 22
        0x00001344:    22cc        ."      MOVS     r2,#0xcc
        0x00001346:    a105        ..      ADR      r1,{pc}+0x16 ; 0x135c
        0x00001348:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x137c
        0x0000134a:    f000f9f7    ....    BL       __aeabi_assert ; 0x173c
        0x0000134e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001352:    4788        .G      BLX      r1
        0x00001354:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001356:    0000        ..      DCW    0
        0x00001358:    00000088    ....    DCD    136
        0x0000135c:    2e5c2e2e    ..\.    DCD    777793070
        0x00001360:    2e2e5c2e    .\..    DCD    774790190
        0x00001364:    464c455c    \ELF    DCD    1179403612
        0x00001368:    53425f32    2_BS    DCD    1396858674
        0x0000136c:    72445c50    P\Dr    DCD    1917082704
        0x00001370:    72657669    iver    DCD    1919252073
        0x00001374:    746e695c    \int    DCD    1953392988
        0x00001378:    00632e63    c.c.    DCD    6499939
        0x0000137c:    636e7566    func    DCD    1668183398
        0x00001380:    203d2120     !=     DCD    540877088
        0x00001384:    00000030    0...    DCD    48
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x00001388:    b570        p.      PUSH     {r4-r6,lr}
        0x0000138a:    4d06        .M      LDR      r5,[pc,#24] ; [0x13a4] = 0x88
        0x0000138c:    462c        ,F      MOV      r4,r5
        0x0000138e:    b104        ..      CBZ      r4,0x1392 ; WDT_IRQHandler + 10
        0x00001390:    e004        ..      B        0x139c ; WDT_IRQHandler + 20
        0x00001392:    222f        /"      MOVS     r2,#0x2f
        0x00001394:    a104        ..      ADR      r1,{pc}+0x14 ; 0x13a8
        0x00001396:    a00c        ..      ADR      r0,{pc}+0x32 ; 0x13c8
        0x00001398:    f000f9d0    ....    BL       __aeabi_assert ; 0x173c
        0x0000139c:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000013a0:    4788        .G      BLX      r1
        0x000013a2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000013a4:    00000088    ....    DCD    136
        0x000013a8:    2e5c2e2e    ..\.    DCD    777793070
        0x000013ac:    2e2e5c2e    .\..    DCD    774790190
        0x000013b0:    464c455c    \ELF    DCD    1179403612
        0x000013b4:    53425f32    2_BS    DCD    1396858674
        0x000013b8:    72445c50    P\Dr    DCD    1917082704
        0x000013bc:    72657669    iver    DCD    1919252073
        0x000013c0:    746e695c    \int    DCD    1953392988
        0x000013c4:    00632e63    c.c.    DCD    6499939
        0x000013c8:    636e7566    func    DCD    1668183398
        0x000013cc:    203d2120     !=     DCD    540877088
        0x000013d0:    00000030    0...    DCD    48
    $t
    i._DoInit
    _DoInit
        0x000013d4:    b510        ..      PUSH     {r4,lr}
        0x000013d6:    4c12        .L      LDR      r4,[pc,#72] ; [0x1420] = 0x20000008
        0x000013d8:    2003        .       MOVS     r0,#3
        0x000013da:    6120         a      STR      r0,[r4,#0x10]
        0x000013dc:    6160        `a      STR      r0,[r4,#0x14]
        0x000013de:    a011        ..      ADR      r0,{pc}+0x46 ; 0x1424
        0x000013e0:    61a0        .a      STR      r0,[r4,#0x18]
        0x000013e2:    4913        .I      LDR      r1,[pc,#76] ; [0x1430] = 0x200000b0
        0x000013e4:    61e1        .a      STR      r1,[r4,#0x1c]
        0x000013e6:    f44f6180    O..a    MOV      r1,#0x400
        0x000013ea:    6221        !b      STR      r1,[r4,#0x20]
        0x000013ec:    2100        .!      MOVS     r1,#0
        0x000013ee:    62a1        .b      STR      r1,[r4,#0x28]
        0x000013f0:    6261        ab      STR      r1,[r4,#0x24]
        0x000013f2:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000013f4:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x1424
        0x000013f6:    6620         f      STR      r0,[r4,#0x60]
        0x000013f8:    490e        .I      LDR      r1,[pc,#56] ; [0x1434] = 0x200004b0
        0x000013fa:    6661        af      STR      r1,[r4,#0x64]
        0x000013fc:    2110        .!      MOVS     r1,#0x10
        0x000013fe:    66a1        .f      STR      r1,[r4,#0x68]
        0x00001400:    2100        .!      MOVS     r1,#0
        0x00001402:    6721        !g      STR      r1,[r4,#0x70]
        0x00001404:    66e1        .f      STR      r1,[r4,#0x6c]
        0x00001406:    6761        ag      STR      r1,[r4,#0x74]
        0x00001408:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x1438
        0x0000140a:    1de0        ..      ADDS     r0,r4,#7
        0x0000140c:    f7feffa0    ....    BL       strcpy ; 0x350
        0x00001410:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x143c
        0x00001412:    4620         F      MOV      r0,r4
        0x00001414:    f7feff9c    ....    BL       strcpy ; 0x350
        0x00001418:    2020                MOVS     r0,#0x20
        0x0000141a:    71a0        .q      STRB     r0,[r4,#6]
        0x0000141c:    bd10        ..      POP      {r4,pc}
    $d
        0x0000141e:    0000        ..      DCW    0
        0x00001420:    20000008    ...     DCD    536870920
        0x00001424:    6d726554    Term    DCD    1836213588
        0x00001428:    6c616e69    inal    DCD    1818324585
        0x0000142c:    00000000    ....    DCD    0
        0x00001430:    200000b0    ...     DCD    536871088
        0x00001434:    200004b0    ...     DCD    536872112
        0x00001438:    00545452    RTT.    DCD    5526610
        0x0000143c:    47474553    SEGG    DCD    1195853139
        0x00001440:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001444:    b510        ..      PUSH     {r4,lr}
        0x00001446:    4601        .F      MOV      r1,r0
        0x00001448:    690a        .i      LDR      r2,[r1,#0x10]
        0x0000144a:    68cb        .h      LDR      r3,[r1,#0xc]
        0x0000144c:    429a        .B      CMP      r2,r3
        0x0000144e:    d804        ..      BHI      0x145a ; _GetAvailWriteSpace + 22
        0x00001450:    688c        .h      LDR      r4,[r1,#8]
        0x00001452:    1e64        d.      SUBS     r4,r4,#1
        0x00001454:    1ae4        ..      SUBS     r4,r4,r3
        0x00001456:    18a0        ..      ADDS     r0,r4,r2
        0x00001458:    e001        ..      B        0x145e ; _GetAvailWriteSpace + 26
        0x0000145a:    1ad4        ..      SUBS     r4,r2,r3
        0x0000145c:    1e60        `.      SUBS     r0,r4,#1
        0x0000145e:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x00001460:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001464:    4606        .F      MOV      r6,r0
        0x00001466:    460f        .F      MOV      r7,r1
        0x00001468:    4692        .F      MOV      r10,r2
        0x0000146a:    4698        .F      MOV      r8,r3
        0x0000146c:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x00001470:    2f00        ./      CMP      r7,#0
        0x00001472:    da01        ..      BGE      0x1478 ; _PrintInt + 24
        0x00001474:    4278        xB      RSBS     r0,r7,#0
        0x00001476:    e000        ..      B        0x147a ; _PrintInt + 26
        0x00001478:    4638        8F      MOV      r0,r7
        0x0000147a:    4683        .F      MOV      r11,r0
        0x0000147c:    f04f0901    O...    MOV      r9,#1
        0x00001480:    e003        ..      B        0x148a ; _PrintInt + 42
        0x00001482:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x00001486:    f1090901    ....    ADD      r9,r9,#1
        0x0000148a:    45d3        .E      CMP      r11,r10
        0x0000148c:    daf9        ..      BGE      0x1482 ; _PrintInt + 34
        0x0000148e:    45c8        .E      CMP      r8,r9
        0x00001490:    d900        ..      BLS      0x1494 ; _PrintInt + 52
        0x00001492:    46c1        .F      MOV      r9,r8
        0x00001494:    b134        4.      CBZ      r4,0x14a4 ; _PrintInt + 68
        0x00001496:    2f00        ./      CMP      r7,#0
        0x00001498:    db03        ..      BLT      0x14a2 ; _PrintInt + 66
        0x0000149a:    f0050004    ....    AND      r0,r5,#4
        0x0000149e:    2804        .(      CMP      r0,#4
        0x000014a0:    d100        ..      BNE      0x14a4 ; _PrintInt + 68
        0x000014a2:    1e64        d.      SUBS     r4,r4,#1
        0x000014a4:    f0050002    ....    AND      r0,r5,#2
        0x000014a8:    b110        ..      CBZ      r0,0x14b0 ; _PrintInt + 80
        0x000014aa:    f1b80f00    ....    CMP      r8,#0
        0x000014ae:    d011        ..      BEQ      0x14d4 ; _PrintInt + 116
        0x000014b0:    f0050001    ....    AND      r0,r5,#1
        0x000014b4:    b970        p.      CBNZ     r0,0x14d4 ; _PrintInt + 116
        0x000014b6:    b16c        l.      CBZ      r4,0x14d4 ; _PrintInt + 116
        0x000014b8:    e008        ..      B        0x14cc ; _PrintInt + 108
        0x000014ba:    1e64        d.      SUBS     r4,r4,#1
        0x000014bc:    2120         !      MOVS     r1,#0x20
        0x000014be:    4630        0F      MOV      r0,r6
        0x000014c0:    f000f8ba    ....    BL       _StoreChar ; 0x1638
        0x000014c4:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000014c6:    2800        .(      CMP      r0,#0
        0x000014c8:    da00        ..      BGE      0x14cc ; _PrintInt + 108
        0x000014ca:    e002        ..      B        0x14d2 ; _PrintInt + 114
        0x000014cc:    b10c        ..      CBZ      r4,0x14d2 ; _PrintInt + 114
        0x000014ce:    45a1        .E      CMP      r9,r4
        0x000014d0:    d3f3        ..      BCC      0x14ba ; _PrintInt + 90
        0x000014d2:    bf00        ..      NOP      
        0x000014d4:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000014d6:    2800        .(      CMP      r0,#0
        0x000014d8:    db36        6.      BLT      0x1548 ; _PrintInt + 232
        0x000014da:    2f00        ./      CMP      r7,#0
        0x000014dc:    da05        ..      BGE      0x14ea ; _PrintInt + 138
        0x000014de:    427f        .B      RSBS     r7,r7,#0
        0x000014e0:    212d        -!      MOVS     r1,#0x2d
        0x000014e2:    4630        0F      MOV      r0,r6
        0x000014e4:    f000f8a8    ....    BL       _StoreChar ; 0x1638
        0x000014e8:    e007        ..      B        0x14fa ; _PrintInt + 154
        0x000014ea:    f0050004    ....    AND      r0,r5,#4
        0x000014ee:    2804        .(      CMP      r0,#4
        0x000014f0:    d103        ..      BNE      0x14fa ; _PrintInt + 154
        0x000014f2:    212b        +!      MOVS     r1,#0x2b
        0x000014f4:    4630        0F      MOV      r0,r6
        0x000014f6:    f000f89f    ....    BL       _StoreChar ; 0x1638
        0x000014fa:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000014fc:    2800        .(      CMP      r0,#0
        0x000014fe:    db23        #.      BLT      0x1548 ; _PrintInt + 232
        0x00001500:    f0050002    ....    AND      r0,r5,#2
        0x00001504:    2802        .(      CMP      r0,#2
        0x00001506:    d114        ..      BNE      0x1532 ; _PrintInt + 210
        0x00001508:    f0050001    ....    AND      r0,r5,#1
        0x0000150c:    b988        ..      CBNZ     r0,0x1532 ; _PrintInt + 210
        0x0000150e:    f1b80f00    ....    CMP      r8,#0
        0x00001512:    d10e        ..      BNE      0x1532 ; _PrintInt + 210
        0x00001514:    b16c        l.      CBZ      r4,0x1532 ; _PrintInt + 210
        0x00001516:    e008        ..      B        0x152a ; _PrintInt + 202
        0x00001518:    1e64        d.      SUBS     r4,r4,#1
        0x0000151a:    2130        0!      MOVS     r1,#0x30
        0x0000151c:    4630        0F      MOV      r0,r6
        0x0000151e:    f000f88b    ....    BL       _StoreChar ; 0x1638
        0x00001522:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001524:    2800        .(      CMP      r0,#0
        0x00001526:    da00        ..      BGE      0x152a ; _PrintInt + 202
        0x00001528:    e002        ..      B        0x1530 ; _PrintInt + 208
        0x0000152a:    b10c        ..      CBZ      r4,0x1530 ; _PrintInt + 208
        0x0000152c:    45a1        .E      CMP      r9,r4
        0x0000152e:    d3f3        ..      BCC      0x1518 ; _PrintInt + 184
        0x00001530:    bf00        ..      NOP      
        0x00001532:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001534:    2800        .(      CMP      r0,#0
        0x00001536:    db07        ..      BLT      0x1548 ; _PrintInt + 232
        0x00001538:    4643        CF      MOV      r3,r8
        0x0000153a:    4652        RF      MOV      r2,r10
        0x0000153c:    4639        9F      MOV      r1,r7
        0x0000153e:    4630        0F      MOV      r0,r6
        0x00001540:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x00001544:    f000f802    ....    BL       _PrintUnsigned ; 0x154c
        0x00001548:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x0000154c:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001550:    4680        .F      MOV      r8,r0
        0x00001552:    4689        .F      MOV      r9,r1
        0x00001554:    4615        .F      MOV      r5,r2
        0x00001556:    461e        .F      MOV      r6,r3
        0x00001558:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x0000155a:    f8cd9004    ....    STR      r9,[sp,#4]
        0x0000155e:    2701        .'      MOVS     r7,#1
        0x00001560:    46bb        .F      MOV      r11,r7
        0x00001562:    e005        ..      B        0x1570 ; _PrintUnsigned + 36
        0x00001564:    9801        ..      LDR      r0,[sp,#4]
        0x00001566:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x0000156a:    9001        ..      STR      r0,[sp,#4]
        0x0000156c:    f10b0b01    ....    ADD      r11,r11,#1
        0x00001570:    9801        ..      LDR      r0,[sp,#4]
        0x00001572:    42a8        .B      CMP      r0,r5
        0x00001574:    d2f6        ..      BCS      0x1564 ; _PrintUnsigned + 24
        0x00001576:    455e        ^E      CMP      r6,r11
        0x00001578:    d900        ..      BLS      0x157c ; _PrintUnsigned + 48
        0x0000157a:    46b3        .F      MOV      r11,r6
        0x0000157c:    980d        ..      LDR      r0,[sp,#0x34]
        0x0000157e:    f0000001    ....    AND      r0,r0,#1
        0x00001582:    b9d0        ..      CBNZ     r0,0x15ba ; _PrintUnsigned + 110
        0x00001584:    b1cc        ..      CBZ      r4,0x15ba ; _PrintUnsigned + 110
        0x00001586:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001588:    f0000002    ....    AND      r0,r0,#2
        0x0000158c:    2802        .(      CMP      r0,#2
        0x0000158e:    d103        ..      BNE      0x1598 ; _PrintUnsigned + 76
        0x00001590:    b916        ..      CBNZ     r6,0x1598 ; _PrintUnsigned + 76
        0x00001592:    2030        0       MOVS     r0,#0x30
        0x00001594:    9000        ..      STR      r0,[sp,#0]
        0x00001596:    e001        ..      B        0x159c ; _PrintUnsigned + 80
        0x00001598:    2020                MOVS     r0,#0x20
        0x0000159a:    9000        ..      STR      r0,[sp,#0]
        0x0000159c:    e009        ..      B        0x15b2 ; _PrintUnsigned + 102
        0x0000159e:    1e64        d.      SUBS     r4,r4,#1
        0x000015a0:    4640        @F      MOV      r0,r8
        0x000015a2:    9900        ..      LDR      r1,[sp,#0]
        0x000015a4:    f000f848    ..H.    BL       _StoreChar ; 0x1638
        0x000015a8:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015ac:    2800        .(      CMP      r0,#0
        0x000015ae:    da00        ..      BGE      0x15b2 ; _PrintUnsigned + 102
        0x000015b0:    e002        ..      B        0x15b8 ; _PrintUnsigned + 108
        0x000015b2:    b10c        ..      CBZ      r4,0x15b8 ; _PrintUnsigned + 108
        0x000015b4:    45a3        .E      CMP      r11,r4
        0x000015b6:    d3f2        ..      BCC      0x159e ; _PrintUnsigned + 82
        0x000015b8:    bf00        ..      NOP      
        0x000015ba:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015be:    2800        .(      CMP      r0,#0
        0x000015c0:    db35        5.      BLT      0x162e ; _PrintUnsigned + 226
        0x000015c2:    e009        ..      B        0x15d8 ; _PrintUnsigned + 140
        0x000015c4:    2e01        ..      CMP      r6,#1
        0x000015c6:    d901        ..      BLS      0x15cc ; _PrintUnsigned + 128
        0x000015c8:    1e76        v.      SUBS     r6,r6,#1
        0x000015ca:    e004        ..      B        0x15d6 ; _PrintUnsigned + 138
        0x000015cc:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x000015d0:    45aa        .E      CMP      r10,r5
        0x000015d2:    d200        ..      BCS      0x15d6 ; _PrintUnsigned + 138
        0x000015d4:    e001        ..      B        0x15da ; _PrintUnsigned + 142
        0x000015d6:    436f        oC      MULS     r7,r5,r7
        0x000015d8:    e7f4        ..      B        0x15c4 ; _PrintUnsigned + 120
        0x000015da:    bf00        ..      NOP      
        0x000015dc:    bf00        ..      NOP      
        0x000015de:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x000015e2:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x000015e6:    4813        .H      LDR      r0,[pc,#76] ; [0x1634] = 0x18cc
        0x000015e8:    f810100a    ....    LDRB     r1,[r0,r10]
        0x000015ec:    4640        @F      MOV      r0,r8
        0x000015ee:    f000f823    ..#.    BL       _StoreChar ; 0x1638
        0x000015f2:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015f6:    2800        .(      CMP      r0,#0
        0x000015f8:    da00        ..      BGE      0x15fc ; _PrintUnsigned + 176
        0x000015fa:    e003        ..      B        0x1604 ; _PrintUnsigned + 184
        0x000015fc:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x00001600:    2f00        ./      CMP      r7,#0
        0x00001602:    d1ec        ..      BNE      0x15de ; _PrintUnsigned + 146
        0x00001604:    bf00        ..      NOP      
        0x00001606:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001608:    f0000001    ....    AND      r0,r0,#1
        0x0000160c:    b178        x.      CBZ      r0,0x162e ; _PrintUnsigned + 226
        0x0000160e:    b174        t.      CBZ      r4,0x162e ; _PrintUnsigned + 226
        0x00001610:    e009        ..      B        0x1626 ; _PrintUnsigned + 218
        0x00001612:    1e64        d.      SUBS     r4,r4,#1
        0x00001614:    2120         !      MOVS     r1,#0x20
        0x00001616:    4640        @F      MOV      r0,r8
        0x00001618:    f000f80e    ....    BL       _StoreChar ; 0x1638
        0x0000161c:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001620:    2800        .(      CMP      r0,#0
        0x00001622:    da00        ..      BGE      0x1626 ; _PrintUnsigned + 218
        0x00001624:    e002        ..      B        0x162c ; _PrintUnsigned + 224
        0x00001626:    b10c        ..      CBZ      r4,0x162c ; _PrintUnsigned + 224
        0x00001628:    45a3        .E      CMP      r11,r4
        0x0000162a:    d3f2        ..      BCC      0x1612 ; _PrintUnsigned + 198
        0x0000162c:    bf00        ..      NOP      
        0x0000162e:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x00001632:    0000        ..      DCW    0
        0x00001634:    000018cc    ....    DCD    6348
    $t
    i._StoreChar
    _StoreChar
        0x00001638:    b570        p.      PUSH     {r4-r6,lr}
        0x0000163a:    4604        .F      MOV      r4,r0
        0x0000163c:    460e        .F      MOV      r6,r1
        0x0000163e:    68a5        .h      LDR      r5,[r4,#8]
        0x00001640:    1c68        h.      ADDS     r0,r5,#1
        0x00001642:    6861        ah      LDR      r1,[r4,#4]
        0x00001644:    4281        .B      CMP      r1,r0
        0x00001646:    d306        ..      BCC      0x1656 ; _StoreChar + 30
        0x00001648:    6820         h      LDR      r0,[r4,#0]
        0x0000164a:    5546        FU      STRB     r6,[r0,r5]
        0x0000164c:    1c68        h.      ADDS     r0,r5,#1
        0x0000164e:    60a0        .`      STR      r0,[r4,#8]
        0x00001650:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00001652:    1c40        @.      ADDS     r0,r0,#1
        0x00001654:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001656:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x0000165a:    4288        .B      CMP      r0,r1
        0x0000165c:    d10d        ..      BNE      0x167a ; _StoreChar + 66
        0x0000165e:    68a2        .h      LDR      r2,[r4,#8]
        0x00001660:    6821        !h      LDR      r1,[r4,#0]
        0x00001662:    6920         i      LDR      r0,[r4,#0x10]
        0x00001664:    f7fffc74    ..t.    BL       SEGGER_RTT_Write ; 0xf50
        0x00001668:    68a1        .h      LDR      r1,[r4,#8]
        0x0000166a:    4288        .B      CMP      r0,r1
        0x0000166c:    d003        ..      BEQ      0x1676 ; _StoreChar + 62
        0x0000166e:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001672:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001674:    e001        ..      B        0x167a ; _StoreChar + 66
        0x00001676:    2000        .       MOVS     r0,#0
        0x00001678:    60a0        .`      STR      r0,[r4,#8]
        0x0000167a:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x0000167c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001680:    4604        .F      MOV      r4,r0
        0x00001682:    4689        .F      MOV      r9,r1
        0x00001684:    4617        .F      MOV      r7,r2
        0x00001686:    f04f0a00    O...    MOV      r10,#0
        0x0000168a:    68e5        .h      LDR      r5,[r4,#0xc]
        0x0000168c:    bf00        ..      NOP      
        0x0000168e:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x00001692:    45a8        .E      CMP      r8,r5
        0x00001694:    d903        ..      BLS      0x169e ; _WriteBlocking + 34
        0x00001696:    eba80005    ....    SUB      r0,r8,r5
        0x0000169a:    1e46        F.      SUBS     r6,r0,#1
        0x0000169c:    e004        ..      B        0x16a8 ; _WriteBlocking + 44
        0x0000169e:    eba50008    ....    SUB      r0,r5,r8
        0x000016a2:    1c40        @.      ADDS     r0,r0,#1
        0x000016a4:    68a1        .h      LDR      r1,[r4,#8]
        0x000016a6:    1a0e        ..      SUBS     r6,r1,r0
        0x000016a8:    68a0        .h      LDR      r0,[r4,#8]
        0x000016aa:    1b40        @.      SUBS     r0,r0,r5
        0x000016ac:    42b0        .B      CMP      r0,r6
        0x000016ae:    d901        ..      BLS      0x16b4 ; _WriteBlocking + 56
        0x000016b0:    4630        0F      MOV      r0,r6
        0x000016b2:    e001        ..      B        0x16b8 ; _WriteBlocking + 60
        0x000016b4:    68a0        .h      LDR      r0,[r4,#8]
        0x000016b6:    1b40        @.      SUBS     r0,r0,r5
        0x000016b8:    4606        .F      MOV      r6,r0
        0x000016ba:    42be        .B      CMP      r6,r7
        0x000016bc:    d201        ..      BCS      0x16c2 ; _WriteBlocking + 70
        0x000016be:    4630        0F      MOV      r0,r6
        0x000016c0:    e000        ..      B        0x16c4 ; _WriteBlocking + 72
        0x000016c2:    4638        8F      MOV      r0,r7
        0x000016c4:    4606        .F      MOV      r6,r0
        0x000016c6:    6861        ah      LDR      r1,[r4,#4]
        0x000016c8:    1948        H.      ADDS     r0,r1,r5
        0x000016ca:    4632        2F      MOV      r2,r6
        0x000016cc:    4649        IF      MOV      r1,r9
        0x000016ce:    f7fefe63    ..c.    BL       __aeabi_memcpy ; 0x398
        0x000016d2:    44b2        .D      ADD      r10,r10,r6
        0x000016d4:    44b1        .D      ADD      r9,r9,r6
        0x000016d6:    1bbf        ..      SUBS     r7,r7,r6
        0x000016d8:    4435        5D      ADD      r5,r5,r6
        0x000016da:    68a0        .h      LDR      r0,[r4,#8]
        0x000016dc:    42a8        .B      CMP      r0,r5
        0x000016de:    d100        ..      BNE      0x16e2 ; _WriteBlocking + 102
        0x000016e0:    2500        .%      MOVS     r5,#0
        0x000016e2:    60e5        .`      STR      r5,[r4,#0xc]
        0x000016e4:    2f00        ./      CMP      r7,#0
        0x000016e6:    d1d2        ..      BNE      0x168e ; _WriteBlocking + 18
        0x000016e8:    4650        PF      MOV      r0,r10
        0x000016ea:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x000016ee:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x000016f2:    4604        .F      MOV      r4,r0
        0x000016f4:    4689        .F      MOV      r9,r1
        0x000016f6:    4615        .F      MOV      r5,r2
        0x000016f8:    68e6        .h      LDR      r6,[r4,#0xc]
        0x000016fa:    68a0        .h      LDR      r0,[r4,#8]
        0x000016fc:    1b87        ..      SUBS     r7,r0,r6
        0x000016fe:    42af        .B      CMP      r7,r5
        0x00001700:    d908        ..      BLS      0x1714 ; _WriteNoCheck + 38
        0x00001702:    6861        ah      LDR      r1,[r4,#4]
        0x00001704:    1988        ..      ADDS     r0,r1,r6
        0x00001706:    462a        *F      MOV      r2,r5
        0x00001708:    4649        IF      MOV      r1,r9
        0x0000170a:    f7fefe45    ..E.    BL       __aeabi_memcpy ; 0x398
        0x0000170e:    1970        p.      ADDS     r0,r6,r5
        0x00001710:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001712:    e010        ..      B        0x1736 ; _WriteNoCheck + 72
        0x00001714:    46b8        .F      MOV      r8,r7
        0x00001716:    6861        ah      LDR      r1,[r4,#4]
        0x00001718:    1988        ..      ADDS     r0,r1,r6
        0x0000171a:    4642        BF      MOV      r2,r8
        0x0000171c:    4649        IF      MOV      r1,r9
        0x0000171e:    f7fefe3b    ..;.    BL       __aeabi_memcpy ; 0x398
        0x00001722:    eba50807    ....    SUB      r8,r5,r7
        0x00001726:    eb090107    ....    ADD      r1,r9,r7
        0x0000172a:    4642        BF      MOV      r2,r8
        0x0000172c:    6860        `h      LDR      r0,[r4,#4]
        0x0000172e:    f7fefe33    ..3.    BL       __aeabi_memcpy ; 0x398
        0x00001732:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x00001736:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0000173a:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x0000173c:    4604        .F      MOV      r4,r0
        0x0000173e:    460d        .F      MOV      r5,r1
        0x00001740:    4616        .F      MOV      r6,r2
        0x00001742:    b672        r.      CPSID    i
        0x00001744:    4623        #F      MOV      r3,r4
        0x00001746:    4632        2F      MOV      r2,r6
        0x00001748:    4629        )F      MOV      r1,r5
        0x0000174a:    a002        ..      ADR      r0,{pc}+0xa ; 0x1754
        0x0000174c:    f7fefd5a    ..Z.    BL       __2printf ; 0x204
        0x00001750:    bf00        ..      NOP      
        0x00001752:    e7fe        ..      B        0x1752 ; __aeabi_assert + 22
    $d
        0x00001754:    65737341    Asse    DCD    1702064961
        0x00001758:    6f697472    rtio    DCD    1869182066
        0x0000175c:    6146206e    n Fa    DCD    1631985774
        0x00001760:    64656c69    iled    DCD    1684368489
        0x00001764:    6966203a    : fi    DCD    1768300602
        0x00001768:    2520656c    le %    DCD    622880108
        0x0000176c:    6c202c73    s, l    DCD    1814047859
        0x00001770:    20656e69    ine     DCD    543518313
        0x00001774:    202c6425    %d,     DCD    539780133
        0x00001778:    000a7325    %s..    DCD    684837
    $t
    i.delay
    delay
        0x0000177c:    2100        .!      MOVS     r1,#0
        0x0000177e:    e006        ..      B        0x178e ; delay + 18
        0x00001780:    bf00        ..      NOP      
        0x00001782:    bf00        ..      NOP      
        0x00001784:    bf00        ..      NOP      
        0x00001786:    bf00        ..      NOP      
        0x00001788:    bf00        ..      NOP      
        0x0000178a:    bf00        ..      NOP      
        0x0000178c:    1c49        I.      ADDS     r1,r1,#1
        0x0000178e:    4281        .B      CMP      r1,r0
        0x00001790:    d3f6        ..      BCC      0x1780 ; delay + 4
        0x00001792:    4770        pG      BX       lr
    i.exti_isr
    exti_isr
        0x00001794:    b510        ..      PUSH     {r4,lr}
        0x00001796:    2007        .       MOVS     r0,#7
        0x00001798:    f7fff912    ....    BL       HAL_EXTI_IntClr ; 0x9c0
        0x0000179c:    a001        ..      ADR      r0,{pc}+8 ; 0x17a4
        0x0000179e:    f7fefd31    ..1.    BL       __2printf ; 0x204
        0x000017a2:    bd10        ..      POP      {r4,pc}
    $d
        0x000017a4:    5f746e69    int_    DCD    1601465961
        0x000017a8:    67697274    trig    DCD    1734963828
        0x000017ac:    65726567    gere    DCD    1701995879
        0x000017b0:    00000a64    d...    DCD    2660
    $t
    i.fputc
    fputc
        0x000017b4:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000017b6:    460c        .F      MOV      r4,r1
        0x000017b8:    2201        ."      MOVS     r2,#1
        0x000017ba:    4669        iF      MOV      r1,sp
        0x000017bc:    2000        .       MOVS     r0,#0
        0x000017be:    f7fffbc7    ....    BL       SEGGER_RTT_Write ; 0xf50
        0x000017c2:    9800        ..      LDR      r0,[sp,#0]
        0x000017c4:    bd1c        ..      POP      {r2-r4,pc}
        0x000017c6:    0000        ..      MOVS     r0,r0
    i.int_callback_register
    int_callback_register
        0x000017c8:    b570        p.      PUSH     {r4-r6,lr}
        0x000017ca:    4604        .F      MOV      r4,r0
        0x000017cc:    460e        .F      MOV      r6,r1
        0x000017ce:    4615        .F      MOV      r5,r2
        0x000017d0:    2c12        .,      CMP      r4,#0x12
        0x000017d2:    da00        ..      BGE      0x17d6 ; int_callback_register + 14
        0x000017d4:    e004        ..      B        0x17e0 ; int_callback_register + 24
        0x000017d6:    220b        ."      MOVS     r2,#0xb
        0x000017d8:    a106        ..      ADR      r1,{pc}+0x1c ; 0x17f4
        0x000017da:    a010        ..      ADR      r0,{pc}+0x42 ; 0x181c
        0x000017dc:    f7ffffae    ....    BL       __aeabi_assert ; 0x173c
        0x000017e0:    4815        .H      LDR      r0,[pc,#84] ; [0x1838] = 0x88
        0x000017e2:    f8406034    @.4`    STR      r6,[r0,r4,LSL #3]
        0x000017e6:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x000017ea:    6045        E`      STR      r5,[r0,#4]
        0x000017ec:    4812        .H      LDR      r0,[pc,#72] ; [0x1838] = 0x88
        0x000017ee:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x000017f2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000017f4:    2e5c2e2e    ..\.    DCD    777793070
        0x000017f8:    2e2e5c2e    .\..    DCD    774790190
        0x000017fc:    464c455c    \ELF    DCD    1179403612
        0x00001800:    53425f32    2_BS    DCD    1396858674
        0x00001804:    72445c50    P\Dr    DCD    1917082704
        0x00001808:    72657669    iver    DCD    1919252073
        0x0000180c:    746e695c    \int    DCD    1953392988
        0x00001810:    6765725f    _reg    DCD    1734701663
        0x00001814:    65747369    iste    DCD    1702130537
        0x00001818:    00632e72    r.c.    DCD    6499954
        0x0000181c:    65646e69    inde    DCD    1701080681
        0x00001820:    203c2078    x <     DCD    540811384
        0x00001824:    5f565244    DRV_    DCD    1599492676
        0x00001828:    4c4c4143    CALL    DCD    1280065859
        0x0000182c:    4b434142    BACK    DCD    1262698818
        0x00001830:    58414d5f    _MAX    DCD    1480674655
        0x00001834:    00000000    ....    DCD    0
        0x00001838:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x0000183c:    a103        ..      ADR      r1,{pc}+0x10 ; 0x184c
        0x0000183e:    2000        .       MOVS     r0,#0
        0x00001840:    f7fffbec    ....    BL       SEGGER_RTT_printf ; 0x101c
        0x00001844:    f000f820    .. .    BL       test_extint ; 0x1888
        0x00001848:    bf00        ..      NOP      
        0x0000184a:    e7fe        ..      B        0x184a ; main + 14
    $d
        0x0000184c:    6c6c6548    Hell    DCD    1819043144
        0x00001850:    6f57206f    o Wo    DCD    1867980911
        0x00001854:    20646c72    rld     DCD    543452274
        0x00001858:    38313032    2018    DCD    942747698
        0x0000185c:    38303830    0808    DCD    942684208
        0x00001860:    0a7e3131    11~.    DCD    176042289
        0x00001864:    00000000    ....    DCD    0
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001868:    4901        .I      LDR      r1,[pc,#4] ; [0x1870] = 0x40020000
        0x0000186a:    6008        .`      STR      r0,[r1,#0]
        0x0000186c:    4770        pG      BX       lr
    $d
        0x0000186e:    0000        ..      DCW    0
        0x00001870:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001874:    4903        .I      LDR      r1,[pc,#12] ; [0x1884] = 0x40020000
        0x00001876:    6849        Ih      LDR      r1,[r1,#4]
        0x00001878:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x0000187c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1884] = 0x40020000
        0x0000187e:    6051        Q`      STR      r1,[r2,#4]
        0x00001880:    4770        pG      BX       lr
    $d
        0x00001882:    0000        ..      DCW    0
        0x00001884:    40020000    ...@    DCD    1073872896
    $t
    i.test_extint
    test_extint
        0x00001888:    b508        ..      PUSH     {r3,lr}
        0x0000188a:    2001        .       MOVS     r0,#1
        0x0000188c:    f88d0002    ....    STRB     r0,[sp,#2]
        0x00001890:    2007        .       MOVS     r0,#7
        0x00001892:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00001896:    2001        .       MOVS     r0,#1
        0x00001898:    f88d0001    ....    STRB     r0,[sp,#1]
        0x0000189c:    2100        .!      MOVS     r1,#0
        0x0000189e:    480a        .H      LDR      r0,[pc,#40] ; [0x18c8] = 0x1795
        0x000018a0:    f7feffe2    ....    BL       EXTINT_Int_Register ; 0x868
        0x000018a4:    9800        ..      LDR      r0,[sp,#0]
        0x000018a6:    f7fff867    ..g.    BL       HAL_EXTI_Init ; 0x978
        0x000018aa:    2001        .       MOVS     r0,#1
        0x000018ac:    2800        .(      CMP      r0,#0
        0x000018ae:    db09        ..      BLT      0x18c4 ; test_extint + 60
        0x000018b0:    f000021f    ....    AND      r2,r0,#0x1f
        0x000018b4:    2101        .!      MOVS     r1,#1
        0x000018b6:    4091        .@      LSLS     r1,r1,r2
        0x000018b8:    0942        B.      LSRS     r2,r0,#5
        0x000018ba:    0092        ..      LSLS     r2,r2,#2
        0x000018bc:    f10222e0    ..."    ADD      r2,r2,#0xe000e000
        0x000018c0:    f8c21100    ....    STR      r1,[r2,#0x100]
        0x000018c4:    bf00        ..      NOP      
        0x000018c6:    bd08        ..      POP      {r3,pc}
    $d
        0x000018c8:    00001795    ....    DCD    6037
    $d.realdata
    .constdata
    _aV2C
        0x000018cc:    33323130    0123    DCD    858927408
        0x000018d0:    37363534    4567    DCD    926299444
        0x000018d4:    42413938    89AB    DCD    1111570744
        0x000018d8:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x000018dc:    000018fc    ....    DCD    6396
        0x000018e0:    20000000    ...     DCD    536870912
        0x000018e4:    00000008    ....    DCD    8
        0x000018e8:    00000154    T...    DCD    340
        0x000018ec:    00001904    ....    DCD    6404
        0x000018f0:    20000008    ...     DCD    536870920
        0x000018f4:    00000a18    ....    DCD    2584
        0x000018f8:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 6448 (0x1930)
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
    File Offset : 6456 (0x1938)
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
    File Offset : 6456 (0x1938)
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
    File Offset : 7932 (0x1efc)
    Size        : 2492 bytes (0x9bc)
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
    File Offset : 10424 (0x28b8)
    Size        : 69068 bytes (0x10dcc)
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
    File Offset : 79492 (0x13684)
    Size        : 10412 bytes (0x28ac)
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
    File Offset : 89904 (0x15f30)
    Size        : 3408 bytes (0xd50)
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
    File Offset : 93312 (0x16c80)
    Size        : 28104 bytes (0x6dc8)
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
    File Offset : 121416 (0x1da48)
    Size        : 1714 bytes (0x6b2)
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
    File Offset : 123132 (0x1e0fc)
    Size        : 7872 bytes (0x1ec0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 348
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 131004 (0x1ffbc)
    Size        : 6652 bytes (0x19fc)
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
    File Offset : 137656 (0x219b8)
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
    File Offset : 137692 (0x219dc)
    Size        : 13344 bytes (0x3420)
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
    
    p5b1c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p5b1c-2
    
    
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    
    
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_demo.o --vfemode=force

    Input Comments:
    
    p6774-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p6774-2
    
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_demo.o --depend=.\objects\test_demo.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_demo.crf src\test_demo.c
    
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p10cc-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p10cc-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Kei
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p3008-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p3008-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\EXTI_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
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
    
    
    
    
    
    exti.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\exti.o --vfemode=force

    Input Comments:
    
    p56e4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p56e4-2
    
    
    
    exti.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\exti.o --depend=.\objects\exti.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\exti.crf ..\sdk\src\soc\driver\exti.c
    
    
    
    
    
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
    File Offset : 151036 (0x24dfc)
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

