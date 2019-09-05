
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

    Image Entry point: 0x00000119
    Flags: EF_ARM_HASENTRY + EF_ARM_ABI_FLOAT_SOFT (0x05000202)

    ARM ELF revision: 5 (ABI version 2)

    Conforms to Soft float procedure-call standard

    Built with
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 18

    Program header offset: 200376 (0x00030eb8)
    Section header offset: 200408 (0x00030ed8)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 6536 bytes (0x1988)
    Size in memory: 9120 bytes (0x23a0)
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
    Size        : 6248 bytes (0x1868)
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
        0x0000014c:    00001814    ....    DCD    6164
        0x00000150:    00001834    4...    DCD    6196
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
        0x00000194:    f00081c5    ....    BEQ.W    _printf_string ; 0x522
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
    .ARM.Collect$$libshutdown$$00000002
    .ARM.Collect$$libshutdown$$00000004
    .ARM.Collect$$libshutdown$$00000007
    .ARM.Collect$$libshutdown$$0000000A
    .ARM.Collect$$libshutdown$$0000000C
    .ARM.Collect$$libshutdown$$0000000F
    .ARM.Collect$$libshutdown$$00000010
    __rt_lib_shutdown_cpp_1
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
        0x000001a4:    f000fa48    ..H.    BL       __user_setup_stackheap ; 0x638
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
        0x000001ae:    f001fa8b    ....    BL       main ; 0x16c8
        0x000001b2:    f000fa66    ..f.    BL       exit ; 0x682
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
        0x000001be:    f000f93f    ..?.    BL       _sys_exit ; 0x440
        0x000001c2:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x11d1
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
        0x000001ec:    000011d1    ....    DCD    4561
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
        0x0000020e:    f000f98d    ....    BL       _printf_char_file ; 0x52c
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
        0x0000033c:    f000b886    ....    B.W      _printf_int_common ; 0x44c
    $d
        0x00000340:    00000000    ....    DCD    0
        0x00000344:    0000002d    -...    DCD    45
        0x00000348:    0000002b    +...    DCD    43
        0x0000034c:    00000020     ...    DCD    32
    $t
    .text
    abort
        0x00000350:    b510        ..      PUSH     {r4,lr}
        0x00000352:    2000        .       MOVS     r0,#0
        0x00000354:    f000f8fc    ....    BL       __rt_SIGABRT ; 0x550
        0x00000358:    f7ffff22    ..".    BL       __rt_lib_shutdown ; 0x1a0
        0x0000035c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000360:    2001        .       MOVS     r0,#1
        0x00000362:    f000b86d    ..m.    B.W      _sys_exit ; 0x440
    .text
    strcpy
        0x00000366:    ea400301    @...    ORR      r3,r0,r1
        0x0000036a:    4602        .F      MOV      r2,r0
        0x0000036c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000036e:    079b        ..      LSLS     r3,r3,#30
        0x00000370:    d110        ..      BNE      0x394 ; strcpy + 46
        0x00000372:    f04f3401    O..4    MOV      r4,#0x1010101
        0x00000376:    e000        ..      B        0x37a ; strcpy + 20
        0x00000378:    c208        ..      STM      r2!,{r3}
        0x0000037a:    c908        ..      LDM      r1!,{r3}
        0x0000037c:    1b1d        ..      SUBS     r5,r3,r4
        0x0000037e:    439d        .C      BICS     r5,r5,r3
        0x00000380:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x00000384:    d0f8        ..      BEQ      0x378 ; strcpy + 18
        0x00000386:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x0000038a:    f8021b01    ....    STRB     r1,[r2],#1
        0x0000038e:    d00d        ..      BEQ      0x3ac ; strcpy + 70
        0x00000390:    0a1b        ..      LSRS     r3,r3,#8
        0x00000392:    e7f8        ..      B        0x386 ; strcpy + 32
        0x00000394:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000398:    2b00        .+      CMP      r3,#0
        0x0000039a:    f8023b01    ...;    STRB     r3,[r2],#1
        0x0000039e:    d005        ..      BEQ      0x3ac ; strcpy + 70
        0x000003a0:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003a4:    2b00        .+      CMP      r3,#0
        0x000003a6:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003aa:    d1f3        ..      BNE      0x394 ; strcpy + 46
        0x000003ac:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x000003ae:    2a03        .*      CMP      r2,#3
        0x000003b0:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x414
        0x000003b4:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003b8:    f0008015    ....    BEQ.W    0x3e6 ; __aeabi_memcpy + 56
        0x000003bc:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003c0:    f1bc0f02    ....    CMP      r12,#2
        0x000003c4:    4462        bD      ADD      r2,r2,r12
        0x000003c6:    bf98        ..      IT       LS
        0x000003c8:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x000003cc:    f8003b01    ...;    STRB     r3,[r0],#1
        0x000003d0:    bf38        8.      IT       CC
        0x000003d2:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x000003d6:    f1a20204    ....    SUB      r2,r2,#4
        0x000003da:    bf98        ..      IT       LS
        0x000003dc:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x000003e0:    bf38        8.      IT       CC
        0x000003e2:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x000003e6:    f0110303    ....    ANDS     r3,r1,#3
        0x000003ea:    f00080b8    ....    BEQ.W    __aeabi_memcpy4 ; 0x55e
        0x000003ee:    3a08        .:      SUBS     r2,r2,#8
        0x000003f0:    f0c08008    ....    BCC.W    0x404 ; __aeabi_memcpy + 86
        0x000003f4:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x000003f8:    3a08        .:      SUBS     r2,r2,#8
        0x000003fa:    f851cb04    Q...    LDR      r12,[r1],#4
        0x000003fe:    e8a01008    ....    STM      r0!,{r3,r12}
        0x00000402:    e7f5        ..      B        0x3f0 ; __aeabi_memcpy + 66
        0x00000404:    1d12        ..      ADDS     r2,r2,#4
        0x00000406:    bf5c        \.      ITT      PL
        0x00000408:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x0000040c:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x00000410:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x00000414:    07d2        ..      LSLS     r2,r2,#31
        0x00000416:    bf24        $.      ITT      CS
        0x00000418:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x0000041c:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x00000420:    bf48        H.      IT       MI
        0x00000422:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000426:    bf24        $.      ITT      CS
        0x00000428:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x0000042c:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x00000430:    bf48        H.      IT       MI
        0x00000432:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000436:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000438:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x0000043a:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x0000043c:    4770        pG      BX       lr
        0x0000043e:    0000        ..      MOVS     r0,r0
    .text
    _sys_exit
        0x00000440:    4901        .I      LDR      r1,[pc,#4] ; [0x448] = 0x20026
        0x00000442:    2018        .       MOVS     r0,#0x18
        0x00000444:    beab        ..      BKPT     #0xab
        0x00000446:    e7fe        ..      B        0x446 ; _sys_exit + 6
    $d
        0x00000448:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x0000044c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000450:    460d        .F      MOV      r5,r1
        0x00000452:    4699        .F      MOV      r9,r3
        0x00000454:    4692        .F      MOV      r10,r2
        0x00000456:    4604        .F      MOV      r4,r0
        0x00000458:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x0000045c:    6801        .h      LDR      r1,[r0,#0]
        0x0000045e:    0688        ..      LSLS     r0,r1,#26
        0x00000460:    d504        ..      BPL      0x46c ; _printf_int_common + 32
        0x00000462:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00000464:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000468:    6021        !`      STR      r1,[r4,#0]
        0x0000046a:    e000        ..      B        0x46e ; _printf_int_common + 34
        0x0000046c:    2001        .       MOVS     r0,#1
        0x0000046e:    42a8        .B      CMP      r0,r5
        0x00000470:    dd01        ..      BLE      0x476 ; _printf_int_common + 42
        0x00000472:    1b47        G.      SUBS     r7,r0,r5
        0x00000474:    e000        ..      B        0x478 ; _printf_int_common + 44
        0x00000476:    2700        .'      MOVS     r7,#0
        0x00000478:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0000047a:    197a        z.      ADDS     r2,r7,r5
        0x0000047c:    eb020009    ....    ADD      r0,r2,r9
        0x00000480:    1a08        ..      SUBS     r0,r1,r0
        0x00000482:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000484:    7820         x      LDRB     r0,[r4,#0]
        0x00000486:    06c0        ..      LSLS     r0,r0,#27
        0x00000488:    d402        ..      BMI      0x490 ; _printf_int_common + 68
        0x0000048a:    4620         F      MOV      r0,r4
        0x0000048c:    f3af8000    ....    NOP.W    
        0x00000490:    2600        .&      MOVS     r6,#0
        0x00000492:    e008        ..      B        0x4a6 ; _printf_int_common + 90
        0x00000494:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000498:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x0000049c:    4790        .G      BLX      r2
        0x0000049e:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004a0:    1c40        @.      ADDS     r0,r0,#1
        0x000004a2:    1c76        v.      ADDS     r6,r6,#1
        0x000004a4:    6220         b      STR      r0,[r4,#0x20]
        0x000004a6:    454e        NE      CMP      r6,r9
        0x000004a8:    dbf4        ..      BLT      0x494 ; _printf_int_common + 72
        0x000004aa:    7820         x      LDRB     r0,[r4,#0]
        0x000004ac:    06c0        ..      LSLS     r0,r0,#27
        0x000004ae:    d50a        ..      BPL      0x4c6 ; _printf_int_common + 122
        0x000004b0:    4620         F      MOV      r0,r4
        0x000004b2:    f3af8000    ....    NOP.W    
        0x000004b6:    e006        ..      B        0x4c6 ; _printf_int_common + 122
        0x000004b8:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004bc:    2030        0       MOVS     r0,#0x30
        0x000004be:    4790        .G      BLX      r2
        0x000004c0:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004c2:    1c40        @.      ADDS     r0,r0,#1
        0x000004c4:    6220         b      STR      r0,[r4,#0x20]
        0x000004c6:    1e38        8.      SUBS     r0,r7,#0
        0x000004c8:    f1a70701    ....    SUB      r7,r7,#1
        0x000004cc:    dcf4        ..      BGT      0x4b8 ; _printf_int_common + 108
        0x000004ce:    e007        ..      B        0x4e0 ; _printf_int_common + 148
        0x000004d0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004d4:    f8180005    ....    LDRB     r0,[r8,r5]
        0x000004d8:    4790        .G      BLX      r2
        0x000004da:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004dc:    1c40        @.      ADDS     r0,r0,#1
        0x000004de:    6220         b      STR      r0,[r4,#0x20]
        0x000004e0:    1e28        (.      SUBS     r0,r5,#0
        0x000004e2:    f1a50501    ....    SUB      r5,r5,#1
        0x000004e6:    dcf3        ..      BGT      0x4d0 ; _printf_int_common + 132
        0x000004e8:    4620         F      MOV      r0,r4
        0x000004ea:    f3af8000    ....    NOP.W    
        0x000004ee:    7820         x      LDRB     r0,[r4,#0]
        0x000004f0:    0600        ..      LSLS     r0,r0,#24
        0x000004f2:    d502        ..      BPL      0x4fa ; _printf_int_common + 174
        0x000004f4:    2002        .       MOVS     r0,#2
        0x000004f6:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000004fa:    2001        .       MOVS     r0,#1
        0x000004fc:    e7fb        ..      B        0x4f6 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x000004fe:    b510        ..      PUSH     {r4,lr}
        0x00000500:    6943        Ci      LDR      r3,[r0,#0x14]
        0x00000502:    b113        ..      CBZ      r3,0x50a ; _printf_cs_common + 12
        0x00000504:    f3af8000    ....    NOP.W    
        0x00000508:    e001        ..      B        0x50e ; _printf_cs_common + 16
        0x0000050a:    f7fffebb    ....    BL       _printf_str ; 0x284
        0x0000050e:    2001        .       MOVS     r0,#1
        0x00000510:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x00000512:    7812        .x      LDRB     r2,[r2,#0]
        0x00000514:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000518:    700a        .p      STRB     r2,[r1,#0]
        0x0000051a:    2200        ."      MOVS     r2,#0
        0x0000051c:    704a        Jp      STRB     r2,[r1,#1]
        0x0000051e:    2201        ."      MOVS     r2,#1
        0x00000520:    e7ed        ..      B        _printf_cs_common ; 0x4fe
    _printf_string
        0x00000522:    6811        .h      LDR      r1,[r2,#0]
        0x00000524:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000528:    e7e9        ..      B        _printf_cs_common ; 0x4fe
        0x0000052a:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x0000052c:    4b07        .K      LDR      r3,[pc,#28] ; [0x54c] = 0x115b
        0x0000052e:    b570        p.      PUSH     {r4-r6,lr}
        0x00000530:    460d        .F      MOV      r5,r1
        0x00000532:    447b        {D      ADD      r3,r3,pc
        0x00000534:    f000f84b    ..K.    BL       _printf_char_common ; 0x5ce
        0x00000538:    4604        .F      MOV      r4,r0
        0x0000053a:    4628        (F      MOV      r0,r5
        0x0000053c:    f000f85a    ..Z.    BL       ferror ; 0x5f4
        0x00000540:    b110        ..      CBZ      r0,0x548 ; _printf_char_file + 28
        0x00000542:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000546:    bd70        p.      POP      {r4-r6,pc}
        0x00000548:    4620         F      MOV      r0,r4
        0x0000054a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000054c:    0000115b    [...    DCD    4443
    $t
    .text
    __rt_SIGABRT
        0x00000550:    b510        ..      PUSH     {r4,lr}
        0x00000552:    f000f859    ..Y.    BL       __rt_SIGABRT_inner ; 0x608
        0x00000556:    e8bd4010    ...@    POP      {r4,lr}
        0x0000055a:    f000b84f    ..O.    B.W      __sig_exit ; 0x5fc
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x0000055e:    b510        ..      PUSH     {r4,lr}
        0x00000560:    3a20         :      SUBS     r2,r2,#0x20
        0x00000562:    f0c0800b    ....    BCC.W    0x57c ; __aeabi_memcpy4 + 30
        0x00000566:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000056a:    3a20         :      SUBS     r2,r2,#0x20
        0x0000056c:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000570:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000574:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000578:    f4bfaff5    ....    BCS.W    0x566 ; __aeabi_memcpy4 + 8
        0x0000057c:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x00000580:    bf24        $.      ITT      CS
        0x00000582:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x00000586:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x0000058a:    bf44        D.      ITT      MI
        0x0000058c:    c918        ..      LDMMI    r1!,{r3,r4}
        0x0000058e:    c018        ..      STMMI    r0!,{r3,r4}
        0x00000590:    e8bd4010    ...@    POP      {r4,lr}
        0x00000594:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x00000598:    bf24        $.      ITT      CS
        0x0000059a:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x0000059e:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000005a2:    bf08        ..      IT       EQ
        0x000005a4:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000005a6:    07d2        ..      LSLS     r2,r2,#31
        0x000005a8:    bf28        (.      IT       CS
        0x000005aa:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000005ae:    bf48        H.      IT       MI
        0x000005b0:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000005b4:    bf28        (.      IT       CS
        0x000005b6:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000005ba:    bf48        H.      IT       MI
        0x000005bc:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000005c0:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x000005c2:    4770        pG      BX       lr
    .text
    .text
    _printf_input_char
    __semihosting_library_function
        0x000005c4:    6901        .i      LDR      r1,[r0,#0x10]
        0x000005c6:    1c4a        J.      ADDS     r2,r1,#1
        0x000005c8:    6102        .a      STR      r2,[r0,#0x10]
        0x000005ca:    7808        .x      LDRB     r0,[r1,#0]
        0x000005cc:    4770        pG      BX       lr
    _printf_char_common
        0x000005ce:    b500        ..      PUSH     {lr}
        0x000005d0:    b08f        ..      SUB      sp,sp,#0x3c
        0x000005d2:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000005d6:    2100        .!      MOVS     r1,#0
        0x000005d8:    9105        ..      STR      r1,[sp,#0x14]
        0x000005da:    4905        .I      LDR      r1,[pc,#20] ; [0x5f0] = 0xffffffe5
        0x000005dc:    4479        yD      ADD      r1,r1,pc
        0x000005de:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x000005e2:    4611        .F      MOV      r1,r2
        0x000005e4:    4668        hF      MOV      r0,sp
        0x000005e6:    f7fffe19    ....    BL       __printf ; 0x21c
        0x000005ea:    b00f        ..      ADD      sp,sp,#0x3c
        0x000005ec:    bd00        ..      POP      {pc}
    $d
        0x000005ee:    0000        ..      DCW    0
        0x000005f0:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x000005f4:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x000005f6:    f0000080    ....    AND      r0,r0,#0x80
        0x000005fa:    4770        pG      BX       lr
    .text
    __sig_exit
        0x000005fc:    2800        .(      CMP      r0,#0
        0x000005fe:    d001        ..      BEQ      0x604 ; __sig_exit + 8
        0x00000600:    f7ffbf1e    ....    B.W      _sys_exit ; 0x440
        0x00000604:    4770        pG      BX       lr
        0x00000606:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x00000608:    b510        ..      PUSH     {r4,lr}
        0x0000060a:    2100        .!      MOVS     r1,#0
        0x0000060c:    a002        ..      ADR      r0,{pc}+0xc ; 0x618
        0x0000060e:    f000f841    ..A.    BL       __default_signal_display ; 0x694
        0x00000612:    2001        .       MOVS     r0,#1
        0x00000614:    bd10        ..      POP      {r4,pc}
    $d
        0x00000616:    0000        ..      DCW    0
        0x00000618:    41474953    SIGA    DCD    1095190867
        0x0000061c:    3a545242    BRT:    DCD    978604610
        0x00000620:    6e624120     Abn    DCD    1851932960
        0x00000624:    616d726f    orma    DCD    1634562671
        0x00000628:    6574206c    l te    DCD    1702109292
        0x0000062c:    6e696d72    rmin    DCD    1852403058
        0x00000630:    6f697461    atio    DCD    1869182049
        0x00000634:    0000006e    n...    DCD    110
    $t
    .text
    __user_setup_stackheap
        0x00000638:    4675        uF      MOV      r5,lr
        0x0000063a:    f000f84b    ..K.    BL       __user_libspace ; 0x6d4
        0x0000063e:    46ae        .F      MOV      lr,r5
        0x00000640:    0005        ..      MOVS     r5,r0
        0x00000642:    4669        iF      MOV      r1,sp
        0x00000644:    4653        SF      MOV      r3,r10
        0x00000646:    f0200007     ...    BIC      r0,r0,#7
        0x0000064a:    4685        .F      MOV      sp,r0
        0x0000064c:    b018        ..      ADD      sp,sp,#0x60
        0x0000064e:    b520         .      PUSH     {r5,lr}
        0x00000650:    f7fffdc6    ....    BL       __user_initial_stackheap ; 0x1e0
        0x00000654:    e8bd4020    .. @    POP      {r5,lr}
        0x00000658:    f04f0600    O...    MOV      r6,#0
        0x0000065c:    f04f0700    O...    MOV      r7,#0
        0x00000660:    f04f0800    O...    MOV      r8,#0
        0x00000664:    f04f0b00    O...    MOV      r11,#0
        0x00000668:    f0210107    !...    BIC      r1,r1,#7
        0x0000066c:    46ac        .F      MOV      r12,r5
        0x0000066e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000672:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000676:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000067a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000067e:    468d        .F      MOV      sp,r1
        0x00000680:    4770        pG      BX       lr
    .text
    exit
        0x00000682:    b510        ..      PUSH     {r4,lr}
        0x00000684:    4604        .F      MOV      r4,r0
        0x00000686:    f3af8000    ....    NOP.W    
        0x0000068a:    4620         F      MOV      r0,r4
        0x0000068c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000690:    f7ffbd91    ....    B.W      __rt_exit ; 0x1b6
    .text
    __default_signal_display
        0x00000694:    b570        p.      PUSH     {r4-r6,lr}
        0x00000696:    4605        .F      MOV      r5,r0
        0x00000698:    460c        .F      MOV      r4,r1
        0x0000069a:    200a        .       MOVS     r0,#0xa
        0x0000069c:    e000        ..      B        0x6a0 ; __default_signal_display + 12
        0x0000069e:    1c6d        m.      ADDS     r5,r5,#1
        0x000006a0:    f000f811    ....    BL       _ttywrch ; 0x6c6
        0x000006a4:    b135        5.      CBZ      r5,0x6b4 ; __default_signal_display + 32
        0x000006a6:    7828        (x      LDRB     r0,[r5,#0]
        0x000006a8:    2800        .(      CMP      r0,#0
        0x000006aa:    d1f8        ..      BNE      0x69e ; __default_signal_display + 10
        0x000006ac:    e002        ..      B        0x6b4 ; __default_signal_display + 32
        0x000006ae:    1c64        d.      ADDS     r4,r4,#1
        0x000006b0:    f000f809    ....    BL       _ttywrch ; 0x6c6
        0x000006b4:    b114        ..      CBZ      r4,0x6bc ; __default_signal_display + 40
        0x000006b6:    7820         x      LDRB     r0,[r4,#0]
        0x000006b8:    2800        .(      CMP      r0,#0
        0x000006ba:    d1f8        ..      BNE      0x6ae ; __default_signal_display + 26
        0x000006bc:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x000006c0:    200a        .       MOVS     r0,#0xa
        0x000006c2:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x000006c6:    b508        ..      PUSH     {r3,lr}
        0x000006c8:    4669        iF      MOV      r1,sp
        0x000006ca:    f88d0000    ....    STRB     r0,[sp,#0]
        0x000006ce:    2003        .       MOVS     r0,#3
        0x000006d0:    beab        ..      BKPT     #0xab
        0x000006d2:    bd08        ..      POP      {r3,pc}
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x000006d4:    4800        .H      LDR      r0,[pc,#0] ; [0x6d8] = 0x200004c0
        0x000006d6:    4770        pG      BX       lr
    $d
        0x000006d8:    200004c0    ...     DCD    536872128
    $t
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x000006dc:    4905        .I      LDR      r1,[pc,#20] ; [0x6f4] = 0x88
        0x000006de:    b510        ..      PUSH     {r4,lr}
        0x000006e0:    3128        (1      ADDS     r1,r1,#0x28
        0x000006e2:    d004        ..      BEQ      0x6ee ; ADCC0_IRQHandler + 18
        0x000006e4:    6848        Hh      LDR      r0,[r1,#4]
        0x000006e6:    6809        .h      LDR      r1,[r1,#0]
        0x000006e8:    e8bd4010    ...@    POP      {r4,lr}
        0x000006ec:    4708        .G      BX       r1
        0x000006ee:    f7fffe2f    ../.    BL       abort ; 0x350
    $d
        0x000006f2:    0000        ..      DCW    0
        0x000006f4:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x000006f8:    4905        .I      LDR      r1,[pc,#20] ; [0x710] = 0x88
        0x000006fa:    b510        ..      PUSH     {r4,lr}
        0x000006fc:    3130        01      ADDS     r1,r1,#0x30
        0x000006fe:    d004        ..      BEQ      0x70a ; ADCC1_IRQHandler + 18
        0x00000700:    6848        Hh      LDR      r0,[r1,#4]
        0x00000702:    6809        .h      LDR      r1,[r1,#0]
        0x00000704:    e8bd4010    ...@    POP      {r4,lr}
        0x00000708:    4708        .G      BX       r1
        0x0000070a:    f7fffe21    ..!.    BL       abort ; 0x350
    $d
        0x0000070e:    0000        ..      DCW    0
        0x00000710:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x00000714:    4905        .I      LDR      r1,[pc,#20] ; [0x72c] = 0x88
        0x00000716:    b510        ..      PUSH     {r4,lr}
        0x00000718:    3138        81      ADDS     r1,r1,#0x38
        0x0000071a:    d004        ..      BEQ      0x726 ; ADCC2_IRQHandler + 18
        0x0000071c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000071e:    6809        .h      LDR      r1,[r1,#0]
        0x00000720:    e8bd4010    ...@    POP      {r4,lr}
        0x00000724:    4708        .G      BX       r1
        0x00000726:    f7fffe13    ....    BL       abort ; 0x350
    $d
        0x0000072a:    0000        ..      DCW    0
        0x0000072c:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000730:    4905        .I      LDR      r1,[pc,#20] ; [0x748] = 0x88
        0x00000732:    b510        ..      PUSH     {r4,lr}
        0x00000734:    3140        @1      ADDS     r1,r1,#0x40
        0x00000736:    d004        ..      BEQ      0x742 ; ADCC3_IRQHandler + 18
        0x00000738:    6848        Hh      LDR      r0,[r1,#4]
        0x0000073a:    6809        .h      LDR      r1,[r1,#0]
        0x0000073c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000740:    4708        .G      BX       r1
        0x00000742:    f7fffe05    ....    BL       abort ; 0x350
    $d
        0x00000746:    0000        ..      DCW    0
        0x00000748:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x0000074c:    4905        .I      LDR      r1,[pc,#20] ; [0x764] = 0x88
        0x0000074e:    b510        ..      PUSH     {r4,lr}
        0x00000750:    3148        H1      ADDS     r1,r1,#0x48
        0x00000752:    d004        ..      BEQ      0x75e ; ADCC4_IRQHandler + 18
        0x00000754:    6848        Hh      LDR      r0,[r1,#4]
        0x00000756:    6809        .h      LDR      r1,[r1,#0]
        0x00000758:    e8bd4010    ...@    POP      {r4,lr}
        0x0000075c:    4708        .G      BX       r1
        0x0000075e:    f7fffdf7    ....    BL       abort ; 0x350
    $d
        0x00000762:    0000        ..      DCW    0
        0x00000764:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x00000768:    4905        .I      LDR      r1,[pc,#20] ; [0x780] = 0x88
        0x0000076a:    b510        ..      PUSH     {r4,lr}
        0x0000076c:    3150        P1      ADDS     r1,r1,#0x50
        0x0000076e:    d004        ..      BEQ      0x77a ; ADCC5_IRQHandler + 18
        0x00000770:    6848        Hh      LDR      r0,[r1,#4]
        0x00000772:    6809        .h      LDR      r1,[r1,#0]
        0x00000774:    e8bd4010    ...@    POP      {r4,lr}
        0x00000778:    4708        .G      BX       r1
        0x0000077a:    f7fffde9    ....    BL       abort ; 0x350
    $d
        0x0000077e:    0000        ..      DCW    0
        0x00000780:    00000088    ....    DCD    136
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000784:    4905        .I      LDR      r1,[pc,#20] ; [0x79c] = 0x88
        0x00000786:    b510        ..      PUSH     {r4,lr}
        0x00000788:    3118        .1      ADDS     r1,r1,#0x18
        0x0000078a:    d004        ..      BEQ      0x796 ; DMAC_IRQHandler + 18
        0x0000078c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000078e:    6809        .h      LDR      r1,[r1,#0]
        0x00000790:    e8bd4010    ...@    POP      {r4,lr}
        0x00000794:    4708        .G      BX       r1
        0x00000796:    f7fffddb    ....    BL       abort ; 0x350
    $d
        0x0000079a:    0000        ..      DCW    0
        0x0000079c:    00000088    ....    DCD    136
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x000007a0:    4905        .I      LDR      r1,[pc,#20] ; [0x7b8] = 0x88
        0x000007a2:    b510        ..      PUSH     {r4,lr}
        0x000007a4:    3108        .1      ADDS     r1,r1,#8
        0x000007a6:    d004        ..      BEQ      0x7b2 ; EXT_IRQHandler + 18
        0x000007a8:    6848        Hh      LDR      r0,[r1,#4]
        0x000007aa:    6809        .h      LDR      r1,[r1,#0]
        0x000007ac:    e8bd4010    ...@    POP      {r4,lr}
        0x000007b0:    4708        .G      BX       r1
        0x000007b2:    f7fffdcd    ....    BL       abort ; 0x350
    $d
        0x000007b6:    0000        ..      DCW    0
        0x000007b8:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000007bc:    4905        .I      LDR      r1,[pc,#20] ; [0x7d4] = 0x88
        0x000007be:    b510        ..      PUSH     {r4,lr}
        0x000007c0:    3180        .1      ADDS     r1,r1,#0x80
        0x000007c2:    d004        ..      BEQ      0x7ce ; GPIO_IRQHandler + 18
        0x000007c4:    6848        Hh      LDR      r0,[r1,#4]
        0x000007c6:    6809        .h      LDR      r1,[r1,#0]
        0x000007c8:    e8bd4010    ...@    POP      {r4,lr}
        0x000007cc:    4708        .G      BX       r1
        0x000007ce:    f7fffdbf    ....    BL       abort ; 0x350
    $d
        0x000007d2:    0000        ..      DCW    0
        0x000007d4:    00000088    ....    DCD    136
    $t
    i.HAL_DMAC_Get_Busy_Channel
    HAL_DMAC_Get_Busy_Channel
        0x000007d8:    bf00        ..      NOP      
        0x000007da:    4802        .H      LDR      r0,[pc,#8] ; [0x7e4] = 0x400103a0
        0x000007dc:    6800        .h      LDR      r0,[r0,#0]
        0x000007de:    f0000003    ....    AND      r0,r0,#3
        0x000007e2:    4770        pG      BX       lr
    $d
        0x000007e4:    400103a0    ...@    DCD    1073808288
    $t
    i.HAL_DMAC_Init
    HAL_DMAC_Init
        0x000007e8:    e92d43f7    -..C    PUSH     {r0-r2,r4-r9,lr}
        0x000007ec:    b084        ..      SUB      sp,sp,#0x10
        0x000007ee:    4604        .F      MOV      r4,r0
        0x000007f0:    2001        .       MOVS     r0,#1
        0x000007f2:    f000ff41    ..A.    BL       dmac_dmacfgreg_l_set ; 0x1678
        0x000007f6:    2c01        .,      CMP      r4,#1
        0x000007f8:    d14e        N.      BNE      0x898 ; HAL_DMAC_Init + 176
        0x000007fa:    2001        .       MOVS     r0,#1
        0x000007fc:    2100        .!      MOVS     r1,#0
        0x000007fe:    9100        ..      STR      r1,[sp,#0]
        0x00000800:    460b        .F      MOV      r3,r1
        0x00000802:    460a        .F      MOV      r2,r1
        0x00000804:    e9cd1001    ....    STRD     r1,r0,[sp,#4]
        0x00000808:    4608        .F      MOV      r0,r1
        0x0000080a:    f000fecf    ....    BL       dmac_ch0_cfg_l_pack ; 0x15ac
        0x0000080e:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000812:    b938        8.      CBNZ     r0,0x824 ; HAL_DMAC_Init + 60
        0x00000814:    2000        .       MOVS     r0,#0
        0x00000816:    4603        .F      MOV      r3,r0
        0x00000818:    2201        ."      MOVS     r2,#1
        0x0000081a:    4601        .F      MOV      r1,r0
        0x0000081c:    9000        ..      STR      r0,[sp,#0]
        0x0000081e:    f000feb5    ....    BL       dmac_ch0_cfg_h_pack ; 0x158c
        0x00000822:    e025        %.      B        0x870 ; HAL_DMAC_Init + 136
        0x00000824:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000828:    2801        .(      CMP      r0,#1
        0x0000082a:    d109        ..      BNE      0x840 ; HAL_DMAC_Init + 88
        0x0000082c:    2000        .       MOVS     r0,#0
        0x0000082e:    9000        ..      STR      r0,[sp,#0]
        0x00000830:    f89d0014    ....    LDRB     r0,[sp,#0x14]
        0x00000834:    2300        .#      MOVS     r3,#0
        0x00000836:    2201        ."      MOVS     r2,#1
        0x00000838:    4619        .F      MOV      r1,r3
        0x0000083a:    f000fea7    ....    BL       dmac_ch0_cfg_h_pack ; 0x158c
        0x0000083e:    e017        ..      B        0x870 ; HAL_DMAC_Init + 136
        0x00000840:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000844:    2802        .(      CMP      r0,#2
        0x00000846:    d108        ..      BNE      0x85a ; HAL_DMAC_Init + 114
        0x00000848:    2000        .       MOVS     r0,#0
        0x0000084a:    9000        ..      STR      r0,[sp,#0]
        0x0000084c:    f89d1014    ....    LDRB     r1,[sp,#0x14]
        0x00000850:    4603        .F      MOV      r3,r0
        0x00000852:    2201        ."      MOVS     r2,#1
        0x00000854:    f000fe9a    ....    BL       dmac_ch0_cfg_h_pack ; 0x158c
        0x00000858:    e00a        ..      B        0x870 ; HAL_DMAC_Init + 136
        0x0000085a:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x0000085e:    2802        .(      CMP      r0,#2
        0x00000860:    dc00        ..      BGT      0x864 ; HAL_DMAC_Init + 124
        0x00000862:    e004        ..      B        0x86e ; HAL_DMAC_Init + 134
        0x00000864:    2257        W"      MOVS     r2,#0x57
        0x00000866:    a14b        K.      ADR      r1,{pc}+0x12e ; 0x994
        0x00000868:    a051        Q.      ADR      r0,{pc}+0x148 ; 0x9b0
        0x0000086a:    f000fe75    ..u.    BL       __aeabi_assert ; 0x1558
        0x0000086e:    bf00        ..      NOP      
        0x00000870:    f89d001a    ....    LDRB     r0,[sp,#0x1a]
        0x00000874:    f89d1017    ....    LDRB     r1,[sp,#0x17]
        0x00000878:    f89d3019    ...0    LDRB     r3,[sp,#0x19]
        0x0000087c:    e9cd3100    ...1    STRD     r3,r1,[sp,#0]
        0x00000880:    e9cd1002    ....    STRD     r1,r0,[sp,#8]
        0x00000884:    f89d3018    ...0    LDRB     r3,[sp,#0x18]
        0x00000888:    f89d2016    ...     LDRB     r2,[sp,#0x16]
        0x0000088c:    4611        .F      MOV      r1,r2
        0x0000088e:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000892:    f000feab    ....    BL       dmac_ch0_ctrl_l_pack ; 0x15ec
        0x00000896:    e07a        z.      B        0x98e ; HAL_DMAC_Init + 422
        0x00000898:    2c02        .,      CMP      r4,#2
        0x0000089a:    d16f        o.      BNE      0x97c ; HAL_DMAC_Init + 404
        0x0000089c:    2000        .       MOVS     r0,#0
        0x0000089e:    4601        .F      MOV      r1,r0
        0x000008a0:    4602        .F      MOV      r2,r0
        0x000008a2:    4603        .F      MOV      r3,r0
        0x000008a4:    4605        .F      MOV      r5,r0
        0x000008a6:    4606        .F      MOV      r6,r0
        0x000008a8:    4607        .F      MOV      r7,r0
        0x000008aa:    ea4f5c00    O..\    LSL      r12,r0,#20
        0x000008ae:    ea4c4cc1    L..L    ORR      r12,r12,r1,LSL #19
        0x000008b2:    ea4c4c82    L..L    ORR      r12,r12,r2,LSL #18
        0x000008b6:    ea4c2cc3    L..,    ORR      r12,r12,r3,LSL #11
        0x000008ba:    ea4c2c85    L..,    ORR      r12,r12,r5,LSL #10
        0x000008be:    ea4c2c06    L..,    ORR      r12,r12,r6,LSL #8
        0x000008c2:    ea4c1c47    L.G.    ORR      r12,r12,r7,LSL #5
        0x000008c6:    f8df8120    .. .    LDR      r8,[pc,#288] ; [0x9e8] = 0x40010000
        0x000008ca:    f8c8c098    ....    STR      r12,[r8,#0x98]
        0x000008ce:    bf00        ..      NOP      
        0x000008d0:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x000008d4:    b938        8.      CBNZ     r0,0x8e6 ; HAL_DMAC_Init + 254
        0x000008d6:    2000        .       MOVS     r0,#0
        0x000008d8:    4603        .F      MOV      r3,r0
        0x000008da:    2201        ."      MOVS     r2,#1
        0x000008dc:    4601        .F      MOV      r1,r0
        0x000008de:    9000        ..      STR      r0,[sp,#0]
        0x000008e0:    f000feac    ....    BL       dmac_ch1_cfg_h_pack ; 0x163c
        0x000008e4:    e025        %.      B        0x932 ; HAL_DMAC_Init + 330
        0x000008e6:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x000008ea:    2801        .(      CMP      r0,#1
        0x000008ec:    d109        ..      BNE      0x902 ; HAL_DMAC_Init + 282
        0x000008ee:    2000        .       MOVS     r0,#0
        0x000008f0:    9000        ..      STR      r0,[sp,#0]
        0x000008f2:    f89d0014    ....    LDRB     r0,[sp,#0x14]
        0x000008f6:    2300        .#      MOVS     r3,#0
        0x000008f8:    2201        ."      MOVS     r2,#1
        0x000008fa:    4619        .F      MOV      r1,r3
        0x000008fc:    f000fe9e    ....    BL       dmac_ch1_cfg_h_pack ; 0x163c
        0x00000900:    e017        ..      B        0x932 ; HAL_DMAC_Init + 330
        0x00000902:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000906:    2802        .(      CMP      r0,#2
        0x00000908:    d108        ..      BNE      0x91c ; HAL_DMAC_Init + 308
        0x0000090a:    2000        .       MOVS     r0,#0
        0x0000090c:    9000        ..      STR      r0,[sp,#0]
        0x0000090e:    f89d1014    ....    LDRB     r1,[sp,#0x14]
        0x00000912:    4603        .F      MOV      r3,r0
        0x00000914:    2201        ."      MOVS     r2,#1
        0x00000916:    f000fe91    ....    BL       dmac_ch1_cfg_h_pack ; 0x163c
        0x0000091a:    e00a        ..      B        0x932 ; HAL_DMAC_Init + 330
        0x0000091c:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000920:    2802        .(      CMP      r0,#2
        0x00000922:    dc00        ..      BGT      0x926 ; HAL_DMAC_Init + 318
        0x00000924:    e004        ..      B        0x930 ; HAL_DMAC_Init + 328
        0x00000926:    226c        l"      MOVS     r2,#0x6c
        0x00000928:    a11a        ..      ADR      r1,{pc}+0x6c ; 0x994
        0x0000092a:    a021        !.      ADR      r0,{pc}+0x86 ; 0x9b0
        0x0000092c:    f000fe14    ....    BL       __aeabi_assert ; 0x1558
        0x00000930:    bf00        ..      NOP      
        0x00000932:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000936:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x0000093a:    460a        .F      MOV      r2,r1
        0x0000093c:    f89d3018    ...0    LDRB     r3,[sp,#0x18]
        0x00000940:    f89d5019    ...P    LDRB     r5,[sp,#0x19]
        0x00000944:    f89d6017    ...`    LDRB     r6,[sp,#0x17]
        0x00000948:    4637        7F      MOV      r7,r6
        0x0000094a:    f89dc01a    ....    LDRB     r12,[sp,#0x1a]
        0x0000094e:    ea4f5800    O..X    LSL      r8,r0,#20
        0x00000952:    ea483881    H..8    ORR      r8,r8,r1,LSL #14
        0x00000956:    ea4828c2    H..(    ORR      r8,r8,r2,LSL #11
        0x0000095a:    ea482843    H.C(    ORR      r8,r8,r3,LSL #9
        0x0000095e:    ea4818c5    H...    ORR      r8,r8,r5,LSL #7
        0x00000962:    ea481806    H...    ORR      r8,r8,r6,LSL #4
        0x00000966:    ea480847    H.G.    ORR      r8,r8,r7,LSL #1
        0x0000096a:    ea48080c    H...    ORR      r8,r8,r12
        0x0000096e:    f8df9078    ..x.    LDR      r9,[pc,#120] ; [0x9e8] = 0x40010000
        0x00000972:    f8c98070    ..p.    STR      r8,[r9,#0x70]
        0x00000976:    bf00        ..      NOP      
        0x00000978:    e009        ..      B        0x98e ; HAL_DMAC_Init + 422
        0x0000097a:    e7ff        ..      B        0x97c ; HAL_DMAC_Init + 404
        0x0000097c:    2c02        .,      CMP      r4,#2
        0x0000097e:    dc00        ..      BGT      0x982 ; HAL_DMAC_Init + 410
        0x00000980:    e004        ..      B        0x98c ; HAL_DMAC_Init + 420
        0x00000982:    2271        q"      MOVS     r2,#0x71
        0x00000984:    a103        ..      ADR      r1,{pc}+0x10 ; 0x994
        0x00000986:    a019        ..      ADR      r0,{pc}+0x66 ; 0x9ec
        0x00000988:    f000fde6    ....    BL       __aeabi_assert ; 0x1558
        0x0000098c:    bf00        ..      NOP      
        0x0000098e:    b007        ..      ADD      sp,sp,#0x1c
        0x00000990:    e8bd83f0    ....    POP      {r4-r9,pc}
    $d
        0x00000994:    735c2e2e    ..\s    DCD    1935420974
        0x00000998:    735c6b64    dk\s    DCD    1935436644
        0x0000099c:    735c6372    rc\s    DCD    1935434610
        0x000009a0:    645c636f    oc\d    DCD    1683776367
        0x000009a4:    65766972    rive    DCD    1702259058
        0x000009a8:    6d645c72    r\dm    DCD    1835293810
        0x000009ac:    00632e61    a.c.    DCD    6499937
        0x000009b0:    666e6f63    conf    DCD    1718513507
        0x000009b4:    742e6769    ig.t    DCD    1949198185
        0x000009b8:    3c657079    ype<    DCD    1013280889
        0x000009bc:    7265503d    =Per    DCD    1919242301
        0x000009c0:    65687069    iphe    DCD    1701343337
        0x000009c4:    5f6c6172    ral_    DCD    1600938354
        0x000009c8:    4d5f6f74    to_M    DCD    1298100084
        0x000009cc:    726f6d65    emor    DCD    1919905125
        0x000009d0:    4d445f79    y_DM    DCD    1296326521
        0x000009d4:    465f4341    AC_F    DCD    1180648257
        0x000009d8:    5f776f6c    low_    DCD    1601662828
        0x000009dc:    746e6f43    Cont    DCD    1953394499
        0x000009e0:    6c6c6f72    roll    DCD    1819045746
        0x000009e4:    00007265    er..    DCD    29285
        0x000009e8:    40010000    ...@    DCD    1073807360
        0x000009ec:    695f6863    ch_i    DCD    1767860323
        0x000009f0:    3c207864    dx <    DCD    1008760932
        0x000009f4:    4d44203d    = DM    DCD    1296310333
        0x000009f8:    435f4341    AC_C    DCD    1130316609
        0x000009fc:    4e4e4148    HANN    DCD    1313751368
        0x00000a00:    315f4c45    EL_1    DCD    828329029
        0x00000a04:    00000000    ....    DCD    0
    $t
    i.HAL_DMAC_Start_Transfer
    HAL_DMAC_Start_Transfer
        0x00000a08:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000a0c:    4606        .F      MOV      r6,r0
        0x00000a0e:    460c        .F      MOV      r4,r1
        0x00000a10:    4615        .F      MOV      r5,r2
        0x00000a12:    461f        .F      MOV      r7,r3
        0x00000a14:    2e01        ..      CMP      r6,#1
        0x00000a16:    d10e        ..      BNE      0xa36 ; HAL_DMAC_Start_Transfer + 46
        0x00000a18:    4620         F      MOV      r0,r4
        0x00000a1a:    f000fe09    ....    BL       dmac_ch0_sar_l_set ; 0x1630
        0x00000a1e:    4628        (F      MOV      r0,r5
        0x00000a20:    f000fe00    ....    BL       dmac_ch0_dar_l_set ; 0x1624
        0x00000a24:    b2b9        ..      UXTH     r1,r7
        0x00000a26:    2000        .       MOVS     r0,#0
        0x00000a28:    f000fdd8    ....    BL       dmac_ch0_ctrl_h_pack ; 0x15dc
        0x00000a2c:    2101        .!      MOVS     r1,#1
        0x00000a2e:    4608        .F      MOV      r0,r1
        0x00000a30:    f000fe14    ....    BL       dmac_chenreg_l_pack ; 0x165c
        0x00000a34:    e01d        ..      B        0xa72 ; HAL_DMAC_Start_Transfer + 106
        0x00000a36:    2e02        ..      CMP      r6,#2
        0x00000a38:    d112        ..      BNE      0xa60 ; HAL_DMAC_Start_Transfer + 88
        0x00000a3a:    bf00        ..      NOP      
        0x00000a3c:    480e        .H      LDR      r0,[pc,#56] ; [0xa78] = 0x40010000
        0x00000a3e:    6584        .e      STR      r4,[r0,#0x58]
        0x00000a40:    bf00        ..      NOP      
        0x00000a42:    bf00        ..      NOP      
        0x00000a44:    6605        .f      STR      r5,[r0,#0x60]
        0x00000a46:    bf00        ..      NOP      
        0x00000a48:    2000        .       MOVS     r0,#0
        0x00000a4a:    b2b9        ..      UXTH     r1,r7
        0x00000a4c:    ea413200    A..2    ORR      r2,r1,r0,LSL #12
        0x00000a50:    4b09        .K      LDR      r3,[pc,#36] ; [0xa78] = 0x40010000
        0x00000a52:    675a        Zg      STR      r2,[r3,#0x74]
        0x00000a54:    bf00        ..      NOP      
        0x00000a56:    2102        .!      MOVS     r1,#2
        0x00000a58:    4608        .F      MOV      r0,r1
        0x00000a5a:    f000fdff    ....    BL       dmac_chenreg_l_pack ; 0x165c
        0x00000a5e:    e008        ..      B        0xa72 ; HAL_DMAC_Start_Transfer + 106
        0x00000a60:    2e02        ..      CMP      r6,#2
        0x00000a62:    dc00        ..      BGT      0xa66 ; HAL_DMAC_Start_Transfer + 94
        0x00000a64:    e004        ..      B        0xa70 ; HAL_DMAC_Start_Transfer + 104
        0x00000a66:    2287        ."      MOVS     r2,#0x87
        0x00000a68:    a104        ..      ADR      r1,{pc}+0x14 ; 0xa7c
        0x00000a6a:    a00b        ..      ADR      r0,{pc}+0x2e ; 0xa98
        0x00000a6c:    f000fd74    ..t.    BL       __aeabi_assert ; 0x1558
        0x00000a70:    bf00        ..      NOP      
        0x00000a72:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000a76:    0000        ..      DCW    0
        0x00000a78:    40010000    ...@    DCD    1073807360
        0x00000a7c:    735c2e2e    ..\s    DCD    1935420974
        0x00000a80:    735c6b64    dk\s    DCD    1935436644
        0x00000a84:    735c6372    rc\s    DCD    1935434610
        0x00000a88:    645c636f    oc\d    DCD    1683776367
        0x00000a8c:    65766972    rive    DCD    1702259058
        0x00000a90:    6d645c72    r\dm    DCD    1835293810
        0x00000a94:    00632e61    a.c.    DCD    6499937
        0x00000a98:    695f6863    ch_i    DCD    1767860323
        0x00000a9c:    3c207864    dx <    DCD    1008760932
        0x00000aa0:    4d44203d    = DM    DCD    1296310333
        0x00000aa4:    435f4341    AC_C    DCD    1130316609
        0x00000aa8:    4e4e4148    HANN    DCD    1313751368
        0x00000aac:    315f4c45    EL_1    DCD    828329029
        0x00000ab0:    00000000    ....    DCD    0
    $t
    i.HAL_DMAC_Wait_Done
    HAL_DMAC_Wait_Done
        0x00000ab4:    b510        ..      PUSH     {r4,lr}
        0x00000ab6:    4604        .F      MOV      r4,r0
        0x00000ab8:    bf00        ..      NOP      
        0x00000aba:    f000fde3    ....    BL       dmac_rawblock_l_get ; 0x1684
        0x00000abe:    4020         @      ANDS     r0,r0,r4
        0x00000ac0:    2800        .(      CMP      r0,#0
        0x00000ac2:    d0fa        ..      BEQ      0xaba ; HAL_DMAC_Wait_Done + 6
        0x00000ac4:    4620         F      MOV      r0,r4
        0x00000ac6:    f000fdd1    ....    BL       dmac_clearblock_l_set ; 0x166c
        0x00000aca:    bd10        ..      POP      {r4,pc}
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x00000acc:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000ace:    4604        .F      MOV      r4,r0
        0x00000ad0:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x00000ad4:    4620         F      MOV      r0,r4
        0x00000ad6:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0xb3c
        0x00000ada:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000ade:    2801        .(      CMP      r0,#1
        0x00000ae0:    d105        ..      BNE      0xaee ; HAL_GPIO_Init + 34
        0x00000ae2:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x00000ae6:    4620         F      MOV      r0,r4
        0x00000ae8:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0xc4c
        0x00000aec:    e009        ..      B        0xb02 ; HAL_GPIO_Init + 54
        0x00000aee:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x00000af2:    4620         F      MOV      r0,r4
        0x00000af4:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0xb04
        0x00000af8:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00000afc:    4620         F      MOV      r0,r4
        0x00000afe:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0xbe8
        0x00000b02:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x00000b04:    b530        0.      PUSH     {r4,r5,lr}
        0x00000b06:    460a        .F      MOV      r2,r1
        0x00000b08:    bf00        ..      NOP      
        0x00000b0a:    4b0b        .K      LDR      r3,[pc,#44] ; [0xb38] = 0x40007000
        0x00000b0c:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x00000b0e:    b29b        ..      UXTH     r3,r3
        0x00000b10:    4619        .F      MOV      r1,r3
        0x00000b12:    2a01        .*      CMP      r2,#1
        0x00000b14:    d103        ..      BNE      0xb1e ; HAL_GPIO_SetDebounce + 26
        0x00000b16:    2301        .#      MOVS     r3,#1
        0x00000b18:    4083        .@      LSLS     r3,r3,r0
        0x00000b1a:    4319        .C      ORRS     r1,r1,r3
        0x00000b1c:    e002        ..      B        0xb24 ; HAL_GPIO_SetDebounce + 32
        0x00000b1e:    2301        .#      MOVS     r3,#1
        0x00000b20:    4083        .@      LSLS     r3,r3,r0
        0x00000b22:    4399        .C      BICS     r1,r1,r3
        0x00000b24:    b28b        ..      UXTH     r3,r1
        0x00000b26:    4c04        .L      LDR      r4,[pc,#16] ; [0xb38] = 0x40007000
        0x00000b28:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000b2a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000b2e:    4d02        .M      LDR      r5,[pc,#8] ; [0xb38] = 0x40007000
        0x00000b30:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000b32:    bf00        ..      NOP      
        0x00000b34:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000b36:    0000        ..      DCW    0
        0x00000b38:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000b3c:    b530        0.      PUSH     {r4,r5,lr}
        0x00000b3e:    4602        .F      MOV      r2,r0
        0x00000b40:    2a10        .*      CMP      r2,#0x10
        0x00000b42:    da16        ..      BGE      0xb72 ; HAL_GPIO_SetDir + 54
        0x00000b44:    bf00        ..      NOP      
        0x00000b46:    4b19        .K      LDR      r3,[pc,#100] ; [0xbac] = 0x40007000
        0x00000b48:    685b        [h      LDR      r3,[r3,#4]
        0x00000b4a:    b298        ..      UXTH     r0,r3
        0x00000b4c:    bf00        ..      NOP      
        0x00000b4e:    2901        .)      CMP      r1,#1
        0x00000b50:    d103        ..      BNE      0xb5a ; HAL_GPIO_SetDir + 30
        0x00000b52:    2301        .#      MOVS     r3,#1
        0x00000b54:    4093        .@      LSLS     r3,r3,r2
        0x00000b56:    4318        .C      ORRS     r0,r0,r3
        0x00000b58:    e002        ..      B        0xb60 ; HAL_GPIO_SetDir + 36
        0x00000b5a:    2301        .#      MOVS     r3,#1
        0x00000b5c:    4093        .@      LSLS     r3,r3,r2
        0x00000b5e:    4398        .C      BICS     r0,r0,r3
        0x00000b60:    b283        ..      UXTH     r3,r0
        0x00000b62:    4c12        .L      LDR      r4,[pc,#72] ; [0xbac] = 0x40007000
        0x00000b64:    6864        dh      LDR      r4,[r4,#4]
        0x00000b66:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000b6a:    4d10        .M      LDR      r5,[pc,#64] ; [0xbac] = 0x40007000
        0x00000b6c:    606c        l`      STR      r4,[r5,#4]
        0x00000b6e:    bf00        ..      NOP      
        0x00000b70:    e01b        ..      B        0xbaa ; HAL_GPIO_SetDir + 110
        0x00000b72:    bf00        ..      NOP      
        0x00000b74:    4b0d        .K      LDR      r3,[pc,#52] ; [0xbac] = 0x40007000
        0x00000b76:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000b78:    b298        ..      UXTH     r0,r3
        0x00000b7a:    bf00        ..      NOP      
        0x00000b7c:    2901        .)      CMP      r1,#1
        0x00000b7e:    d106        ..      BNE      0xb8e ; HAL_GPIO_SetDir + 82
        0x00000b80:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000b84:    2401        .$      MOVS     r4,#1
        0x00000b86:    fa04f303    ....    LSL      r3,r4,r3
        0x00000b8a:    4318        .C      ORRS     r0,r0,r3
        0x00000b8c:    e004        ..      B        0xb98 ; HAL_GPIO_SetDir + 92
        0x00000b8e:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000b92:    2401        .$      MOVS     r4,#1
        0x00000b94:    409c        .@      LSLS     r4,r4,r3
        0x00000b96:    43a0        .C      BICS     r0,r0,r4
        0x00000b98:    b283        ..      UXTH     r3,r0
        0x00000b9a:    4c04        .L      LDR      r4,[pc,#16] ; [0xbac] = 0x40007000
        0x00000b9c:    6924        $i      LDR      r4,[r4,#0x10]
        0x00000b9e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000ba2:    4d02        .M      LDR      r5,[pc,#8] ; [0xbac] = 0x40007000
        0x00000ba4:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000ba6:    bf00        ..      NOP      
        0x00000ba8:    bf00        ..      NOP      
        0x00000baa:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000bac:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000bb0:    b530        0.      PUSH     {r4,r5,lr}
        0x00000bb2:    460a        .F      MOV      r2,r1
        0x00000bb4:    bf00        ..      NOP      
        0x00000bb6:    4b0b        .K      LDR      r3,[pc,#44] ; [0xbe4] = 0x40007000
        0x00000bb8:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000bba:    b29b        ..      UXTH     r3,r3
        0x00000bbc:    4619        .F      MOV      r1,r3
        0x00000bbe:    2a01        .*      CMP      r2,#1
        0x00000bc0:    d103        ..      BNE      0xbca ; HAL_GPIO_SetPly + 26
        0x00000bc2:    2301        .#      MOVS     r3,#1
        0x00000bc4:    4083        .@      LSLS     r3,r3,r0
        0x00000bc6:    4319        .C      ORRS     r1,r1,r3
        0x00000bc8:    e002        ..      B        0xbd0 ; HAL_GPIO_SetPly + 32
        0x00000bca:    2301        .#      MOVS     r3,#1
        0x00000bcc:    4083        .@      LSLS     r3,r3,r0
        0x00000bce:    4399        .C      BICS     r1,r1,r3
        0x00000bd0:    b28b        ..      UXTH     r3,r1
        0x00000bd2:    4c04        .L      LDR      r4,[pc,#16] ; [0xbe4] = 0x40007000
        0x00000bd4:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000bd6:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000bda:    4d02        .M      LDR      r5,[pc,#8] ; [0xbe4] = 0x40007000
        0x00000bdc:    63ec        .c      STR      r4,[r5,#0x3c]
        0x00000bde:    bf00        ..      NOP      
        0x00000be0:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000be2:    0000        ..      DCW    0
        0x00000be4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000be8:    b570        p.      PUSH     {r4-r6,lr}
        0x00000bea:    4605        .F      MOV      r5,r0
        0x00000bec:    460c        .F      MOV      r4,r1
        0x00000bee:    b134        4.      CBZ      r4,0xbfe ; HAL_GPIO_TrigType + 22
        0x00000bf0:    2c01        .,      CMP      r4,#1
        0x00000bf2:    d00d        ..      BEQ      0xc10 ; HAL_GPIO_TrigType + 40
        0x00000bf4:    2c02        .,      CMP      r4,#2
        0x00000bf6:    d014        ..      BEQ      0xc22 ; HAL_GPIO_TrigType + 58
        0x00000bf8:    2c03        .,      CMP      r4,#3
        0x00000bfa:    d124        $.      BNE      0xc46 ; HAL_GPIO_TrigType + 94
        0x00000bfc:    e01a        ..      B        0xc34 ; HAL_GPIO_TrigType + 76
        0x00000bfe:    2100        .!      MOVS     r1,#0
        0x00000c00:    4628        (F      MOV      r0,r5
        0x00000c02:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0xca8
        0x00000c06:    2100        .!      MOVS     r1,#0
        0x00000c08:    4628        (F      MOV      r0,r5
        0x00000c0a:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0xbb0
        0x00000c0e:    e01a        ..      B        0xc46 ; HAL_GPIO_TrigType + 94
        0x00000c10:    2100        .!      MOVS     r1,#0
        0x00000c12:    4628        (F      MOV      r0,r5
        0x00000c14:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0xca8
        0x00000c18:    2101        .!      MOVS     r1,#1
        0x00000c1a:    4628        (F      MOV      r0,r5
        0x00000c1c:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0xbb0
        0x00000c20:    e011        ..      B        0xc46 ; HAL_GPIO_TrigType + 94
        0x00000c22:    2101        .!      MOVS     r1,#1
        0x00000c24:    4628        (F      MOV      r0,r5
        0x00000c26:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0xca8
        0x00000c2a:    2100        .!      MOVS     r1,#0
        0x00000c2c:    4628        (F      MOV      r0,r5
        0x00000c2e:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0xbb0
        0x00000c32:    e008        ..      B        0xc46 ; HAL_GPIO_TrigType + 94
        0x00000c34:    2101        .!      MOVS     r1,#1
        0x00000c36:    4628        (F      MOV      r0,r5
        0x00000c38:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0xca8
        0x00000c3c:    2101        .!      MOVS     r1,#1
        0x00000c3e:    4628        (F      MOV      r0,r5
        0x00000c40:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0xbb0
        0x00000c44:    bf00        ..      NOP      
        0x00000c46:    bf00        ..      NOP      
        0x00000c48:    bd70        p.      POP      {r4-r6,pc}
        0x00000c4a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000c4c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000c4e:    4605        .F      MOV      r5,r0
        0x00000c50:    460e        .F      MOV      r6,r1
        0x00000c52:    2d10        .-      CMP      r5,#0x10
        0x00000c54:    da10        ..      BGE      0xc78 ; HAL_GPIO_WritePin + 44
        0x00000c56:    bf00        ..      NOP      
        0x00000c58:    4812        .H      LDR      r0,[pc,#72] ; [0xca4] = 0x40007000
        0x00000c5a:    6800        .h      LDR      r0,[r0,#0]
        0x00000c5c:    b284        ..      UXTH     r4,r0
        0x00000c5e:    bf00        ..      NOP      
        0x00000c60:    b91e        ..      CBNZ     r6,0xc6a ; HAL_GPIO_WritePin + 30
        0x00000c62:    2001        .       MOVS     r0,#1
        0x00000c64:    40a8        .@      LSLS     r0,r0,r5
        0x00000c66:    4384        .C      BICS     r4,r4,r0
        0x00000c68:    e002        ..      B        0xc70 ; HAL_GPIO_WritePin + 36
        0x00000c6a:    2001        .       MOVS     r0,#1
        0x00000c6c:    40a8        .@      LSLS     r0,r0,r5
        0x00000c6e:    4304        .C      ORRS     r4,r4,r0
        0x00000c70:    b2a0        ..      UXTH     r0,r4
        0x00000c72:    f000fd15    ....    BL       gpio_portadataregister_setf ; 0x16a0
        0x00000c76:    e014        ..      B        0xca2 ; HAL_GPIO_WritePin + 86
        0x00000c78:    bf00        ..      NOP      
        0x00000c7a:    480a        .H      LDR      r0,[pc,#40] ; [0xca4] = 0x40007000
        0x00000c7c:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000c7e:    b284        ..      UXTH     r4,r0
        0x00000c80:    bf00        ..      NOP      
        0x00000c82:    b92e        ..      CBNZ     r6,0xc90 ; HAL_GPIO_WritePin + 68
        0x00000c84:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000c88:    2101        .!      MOVS     r1,#1
        0x00000c8a:    4081        .@      LSLS     r1,r1,r0
        0x00000c8c:    438c        .C      BICS     r4,r4,r1
        0x00000c8e:    e005        ..      B        0xc9c ; HAL_GPIO_WritePin + 80
        0x00000c90:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000c94:    2101        .!      MOVS     r1,#1
        0x00000c96:    fa01f000    ....    LSL      r0,r1,r0
        0x00000c9a:    4304        .C      ORRS     r4,r4,r0
        0x00000c9c:    b2a0        ..      UXTH     r0,r4
        0x00000c9e:    f000fd09    ....    BL       gpio_portbdataregister_setf ; 0x16b4
        0x00000ca2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000ca4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000ca8:    b530        0.      PUSH     {r4,r5,lr}
        0x00000caa:    460a        .F      MOV      r2,r1
        0x00000cac:    bf00        ..      NOP      
        0x00000cae:    4b0b        .K      LDR      r3,[pc,#44] ; [0xcdc] = 0x40007000
        0x00000cb0:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000cb2:    b29b        ..      UXTH     r3,r3
        0x00000cb4:    4619        .F      MOV      r1,r3
        0x00000cb6:    2a01        .*      CMP      r2,#1
        0x00000cb8:    d103        ..      BNE      0xcc2 ; HAL_GPIO_setIrqLevel + 26
        0x00000cba:    2301        .#      MOVS     r3,#1
        0x00000cbc:    4083        .@      LSLS     r3,r3,r0
        0x00000cbe:    4319        .C      ORRS     r1,r1,r3
        0x00000cc0:    e002        ..      B        0xcc8 ; HAL_GPIO_setIrqLevel + 32
        0x00000cc2:    2301        .#      MOVS     r3,#1
        0x00000cc4:    4083        .@      LSLS     r3,r3,r0
        0x00000cc6:    4399        .C      BICS     r1,r1,r3
        0x00000cc8:    b28b        ..      UXTH     r3,r1
        0x00000cca:    4c04        .L      LDR      r4,[pc,#16] ; [0xcdc] = 0x40007000
        0x00000ccc:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000cce:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000cd2:    4d02        .M      LDR      r5,[pc,#8] ; [0xcdc] = 0x40007000
        0x00000cd4:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000cd6:    bf00        ..      NOP      
        0x00000cd8:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000cda:    0000        ..      DCW    0
        0x00000cdc:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000ce0:    bf00        ..      NOP      
        0x00000ce2:    4904        .I      LDR      r1,[pc,#16] ; [0xcf4] = 0x40020000
        0x00000ce4:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000ce6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000cea:    4a02        .J      LDR      r2,[pc,#8] ; [0xcf4] = 0x40020000
        0x00000cec:    6111        .a      STR      r1,[r2,#0x10]
        0x00000cee:    bf00        ..      NOP      
        0x00000cf0:    4770        pG      BX       lr
    $d
        0x00000cf2:    0000        ..      DCW    0
        0x00000cf4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000cf8:    b510        ..      PUSH     {r4,lr}
        0x00000cfa:    4604        .F      MOV      r4,r0
        0x00000cfc:    1e60        `.      SUBS     r0,r4,#1
        0x00000cfe:    280f        .(      CMP      r0,#0xf
        0x00000d00:    dc00        ..      BGT      0xd04 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000d02:    e004        ..      B        0xd0e ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000d04:    2225        %"      MOVS     r2,#0x25
        0x00000d06:    a108        ..      ADR      r1,{pc}+0x22 ; 0xd28
        0x00000d08:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xd48
        0x00000d0a:    f000fc25    ..%.    BL       __aeabi_assert ; 0x1558
        0x00000d0e:    1e61        a.      SUBS     r1,r4,#1
        0x00000d10:    b2c8        ..      UXTB     r0,r1
        0x00000d12:    4913        .I      LDR      r1,[pc,#76] ; [0xd60] = 0x40020000
        0x00000d14:    6849        Ih      LDR      r1,[r1,#4]
        0x00000d16:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000d1a:    4a11        .J      LDR      r2,[pc,#68] ; [0xd60] = 0x40020000
        0x00000d1c:    6051        Q`      STR      r1,[r2,#4]
        0x00000d1e:    bf00        ..      NOP      
        0x00000d20:    2001        .       MOVS     r0,#1
        0x00000d22:    f000fd6d    ..m.    BL       sysc_awo_div_update_set ; 0x1800
        0x00000d26:    bd10        ..      POP      {r4,pc}
    $d
        0x00000d28:    735c2e2e    ..\s    DCD    1935420974
        0x00000d2c:    735c6b64    dk\s    DCD    1935436644
        0x00000d30:    735c6372    rc\s    DCD    1935434610
        0x00000d34:    645c636f    oc\d    DCD    1683776367
        0x00000d38:    65766972    rive    DCD    1702259058
        0x00000d3c:    79735c72    r\sy    DCD    2037603442
        0x00000d40:    6e6f6373    scon    DCD    1852793715
        0x00000d44:    0000632e    .c..    DCD    25390
        0x00000d48:    62686128    (ahb    DCD    1651007784
        0x00000d4c:    7669645f    _div    DCD    1986618463
        0x00000d50:    72656469    ider    DCD    1919247465
        0x00000d54:    3c29312d    -1)<    DCD    1009332525
        0x00000d58:    6678303d    =0xf    DCD    1719152701
        0x00000d5c:    00000000    ....    DCD    0
        0x00000d60:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000d64:    b510        ..      PUSH     {r4,lr}
        0x00000d66:    4604        .F      MOV      r4,r0
        0x00000d68:    1e60        `.      SUBS     r0,r4,#1
        0x00000d6a:    280f        .(      CMP      r0,#0xf
        0x00000d6c:    dc00        ..      BGT      0xd70 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000d6e:    e004        ..      B        0xd7a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000d70:    222c        ,"      MOVS     r2,#0x2c
        0x00000d72:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xd9c
        0x00000d74:    a011        ..      ADR      r0,{pc}+0x48 ; 0xdbc
        0x00000d76:    f000fbef    ....    BL       __aeabi_assert ; 0x1558
        0x00000d7a:    1e61        a.      SUBS     r1,r4,#1
        0x00000d7c:    b2c8        ..      UXTB     r0,r1
        0x00000d7e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d82:    6849        Ih      LDR      r1,[r1,#4]
        0x00000d84:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000d88:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000d8c:    6051        Q`      STR      r1,[r2,#4]
        0x00000d8e:    bf00        ..      NOP      
        0x00000d90:    2001        .       MOVS     r0,#1
        0x00000d92:    0781        ..      LSLS     r1,r0,#30
        0x00000d94:    6008        .`      STR      r0,[r1,#0]
        0x00000d96:    bf00        ..      NOP      
        0x00000d98:    bd10        ..      POP      {r4,pc}
    $d
        0x00000d9a:    0000        ..      DCW    0
        0x00000d9c:    735c2e2e    ..\s    DCD    1935420974
        0x00000da0:    735c6b64    dk\s    DCD    1935436644
        0x00000da4:    735c6372    rc\s    DCD    1935434610
        0x00000da8:    645c636f    oc\d    DCD    1683776367
        0x00000dac:    65766972    rive    DCD    1702259058
        0x00000db0:    79735c72    r\sy    DCD    2037603442
        0x00000db4:    6e6f6373    scon    DCD    1852793715
        0x00000db8:    0000632e    .c..    DCD    25390
        0x00000dbc:    62706128    (apb    DCD    1651532072
        0x00000dc0:    69645f30    0_di    DCD    1768185648
        0x00000dc4:    65646976    vide    DCD    1701079414
        0x00000dc8:    29312d72    r-1)    DCD    691088754
        0x00000dcc:    78303d3c    <=0x    DCD    2016427324
        0x00000dd0:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000dd4:    b510        ..      PUSH     {r4,lr}
        0x00000dd6:    4604        .F      MOV      r4,r0
        0x00000dd8:    1e60        `.      SUBS     r0,r4,#1
        0x00000dda:    280f        .(      CMP      r0,#0xf
        0x00000ddc:    dc00        ..      BGT      0xde0 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000dde:    e004        ..      B        0xdea ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000de0:    2234        4"      MOVS     r2,#0x34
        0x00000de2:    a108        ..      ADR      r1,{pc}+0x22 ; 0xe04
        0x00000de4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xe24
        0x00000de6:    f000fbb7    ....    BL       __aeabi_assert ; 0x1558
        0x00000dea:    1e61        a.      SUBS     r1,r4,#1
        0x00000dec:    b2c8        ..      UXTB     r0,r1
        0x00000dee:    4913        .I      LDR      r1,[pc,#76] ; [0xe3c] = 0x40020000
        0x00000df0:    6849        Ih      LDR      r1,[r1,#4]
        0x00000df2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000df6:    4a11        .J      LDR      r2,[pc,#68] ; [0xe3c] = 0x40020000
        0x00000df8:    6051        Q`      STR      r1,[r2,#4]
        0x00000dfa:    bf00        ..      NOP      
        0x00000dfc:    2002        .       MOVS     r0,#2
        0x00000dfe:    f000fcff    ....    BL       sysc_awo_div_update_set ; 0x1800
        0x00000e02:    bd10        ..      POP      {r4,pc}
    $d
        0x00000e04:    735c2e2e    ..\s    DCD    1935420974
        0x00000e08:    735c6b64    dk\s    DCD    1935436644
        0x00000e0c:    735c6372    rc\s    DCD    1935434610
        0x00000e10:    645c636f    oc\d    DCD    1683776367
        0x00000e14:    65766972    rive    DCD    1702259058
        0x00000e18:    79735c72    r\sy    DCD    2037603442
        0x00000e1c:    6e6f6373    scon    DCD    1852793715
        0x00000e20:    0000632e    .c..    DCD    25390
        0x00000e24:    62706128    (apb    DCD    1651532072
        0x00000e28:    69645f31    1_di    DCD    1768185649
        0x00000e2c:    65646976    vide    DCD    1701079414
        0x00000e30:    29312d72    r-1)    DCD    691088754
        0x00000e34:    78303d3c    <=0x    DCD    2016427324
        0x00000e38:    00000066    f...    DCD    102
        0x00000e3c:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000e40:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e42:    4605        .F      MOV      r5,r0
        0x00000e44:    460c        .F      MOV      r4,r1
        0x00000e46:    1e60        `.      SUBS     r0,r4,#1
        0x00000e48:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000e4c:    da00        ..      BGE      0xe50 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000e4e:    e004        ..      B        0xe5a ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000e50:    223c        <"      MOVS     r2,#0x3c
        0x00000e52:    a112        ..      ADR      r1,{pc}+0x4a ; 0xe9c
        0x00000e54:    a019        ..      ADR      r0,{pc}+0x68 ; 0xebc
        0x00000e56:    f000fb7f    ....    BL       __aeabi_assert ; 0x1558
        0x00000e5a:    2d01        .-      CMP      r5,#1
        0x00000e5c:    dc00        ..      BGT      0xe60 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000e5e:    e004        ..      B        0xe6a ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000e60:    223d        ="      MOVS     r2,#0x3d
        0x00000e62:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xe9c
        0x00000e64:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xed4
        0x00000e66:    f000fb77    ..w.    BL       __aeabi_assert ; 0x1558
        0x00000e6a:    b935        5.      CBNZ     r5,0xe7a ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000e6c:    2000        .       MOVS     r0,#0
        0x00000e6e:    f000fccd    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x180c
        0x00000e72:    2004        .       MOVS     r0,#4
        0x00000e74:    f000fcc4    ....    BL       sysc_awo_div_update_set ; 0x1800
        0x00000e78:    e00e        ..      B        0xe98 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000e7a:    2c02        .,      CMP      r4,#2
        0x00000e7c:    db00        ..      BLT      0xe80 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000e7e:    e004        ..      B        0xe8a ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000e80:    2247        G"      MOVS     r2,#0x47
        0x00000e82:    a106        ..      ADR      r1,{pc}+0x1a ; 0xe9c
        0x00000e84:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xef0
        0x00000e86:    f000fb67    ..g.    BL       __aeabi_assert ; 0x1558
        0x00000e8a:    1e61        a.      SUBS     r1,r4,#1
        0x00000e8c:    b288        ..      UXTH     r0,r1
        0x00000e8e:    f000fcbd    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x180c
        0x00000e92:    2004        .       MOVS     r0,#4
        0x00000e94:    f000fcb4    ....    BL       sysc_awo_div_update_set ; 0x1800
        0x00000e98:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e9a:    0000        ..      DCW    0
        0x00000e9c:    735c2e2e    ..\s    DCD    1935420974
        0x00000ea0:    735c6b64    dk\s    DCD    1935436644
        0x00000ea4:    735c6372    rc\s    DCD    1935434610
        0x00000ea8:    645c636f    oc\d    DCD    1683776367
        0x00000eac:    65766972    rive    DCD    1702259058
        0x00000eb0:    79735c72    r\sy    DCD    2037603442
        0x00000eb4:    6e6f6373    scon    DCD    1852793715
        0x00000eb8:    0000632e    .c..    DCD    25390
        0x00000ebc:    63747228    (rtc    DCD    1668575784
        0x00000ec0:    7669645f    _div    DCD    1986618463
        0x00000ec4:    72656469    ider    DCD    1919247465
        0x00000ec8:    3c29312d    -1)<    DCD    1009332525
        0x00000ecc:    3178303d    =0x1    DCD    829960253
        0x00000ed0:    00666666    fff.    DCD    6710886
        0x00000ed4:    5f637472    rtc_    DCD    1600353394
        0x00000ed8:    3c637273    src<    DCD    1013150323
        0x00000edc:    6374723d    =rtc    DCD    1668575805
        0x00000ee0:    5f6b6c63    clk_    DCD    1600875619
        0x00000ee4:    6d6f7266    from    DCD    1836020326
        0x00000ee8:    6268615f    _ahb    DCD    1651007839
        0x00000eec:    00000000    ....    DCD    0
        0x00000ef0:    5f637472    rtc_    DCD    1600353394
        0x00000ef4:    69766964    divi    DCD    1769367908
        0x00000ef8:    3e726564    der>    DCD    1047684452
        0x00000efc:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000f00:    4905        .I      LDR      r1,[pc,#20] ; [0xf18] = 0x88
        0x00000f02:    b510        ..      PUSH     {r4,lr}
        0x00000f04:    3160        `1      ADDS     r1,r1,#0x60
        0x00000f06:    d004        ..      BEQ      0xf12 ; I2C0_IRQHandler + 18
        0x00000f08:    6848        Hh      LDR      r0,[r1,#4]
        0x00000f0a:    6809        .h      LDR      r1,[r1,#0]
        0x00000f0c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000f10:    4708        .G      BX       r1
        0x00000f12:    f7fffa1d    ....    BL       abort ; 0x350
    $d
        0x00000f16:    0000        ..      DCW    0
        0x00000f18:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000f1c:    4905        .I      LDR      r1,[pc,#20] ; [0xf34] = 0x88
        0x00000f1e:    b510        ..      PUSH     {r4,lr}
        0x00000f20:    3168        h1      ADDS     r1,r1,#0x68
        0x00000f22:    d004        ..      BEQ      0xf2e ; I2C1_IRQHandler + 18
        0x00000f24:    6848        Hh      LDR      r0,[r1,#4]
        0x00000f26:    6809        .h      LDR      r1,[r1,#0]
        0x00000f28:    e8bd4010    ...@    POP      {r4,lr}
        0x00000f2c:    4708        .G      BX       r1
        0x00000f2e:    f7fffa0f    ....    BL       abort ; 0x350
    $d
        0x00000f32:    0000        ..      DCW    0
        0x00000f34:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00000f38:    4905        .I      LDR      r1,[pc,#20] ; [0xf50] = 0x88
        0x00000f3a:    b510        ..      PUSH     {r4,lr}
        0x00000f3c:    3188        .1      ADDS     r1,r1,#0x88
        0x00000f3e:    d004        ..      BEQ      0xf4a ; I2S_IRQHandler + 18
        0x00000f40:    6848        Hh      LDR      r0,[r1,#4]
        0x00000f42:    6809        .h      LDR      r1,[r1,#0]
        0x00000f44:    e8bd4010    ...@    POP      {r4,lr}
        0x00000f48:    4708        .G      BX       r1
        0x00000f4a:    f7fffa01    ....    BL       abort ; 0x350
    $d
        0x00000f4e:    0000        ..      DCW    0
        0x00000f50:    00000088    ....    DCD    136
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00000f54:    4905        .I      LDR      r1,[pc,#20] ; [0xf6c] = 0x88
        0x00000f56:    b510        ..      PUSH     {r4,lr}
        0x00000f58:    3120         1      ADDS     r1,r1,#0x20
        0x00000f5a:    d004        ..      BEQ      0xf66 ; QSPI_IRQHandler + 18
        0x00000f5c:    6848        Hh      LDR      r0,[r1,#4]
        0x00000f5e:    6809        .h      LDR      r1,[r1,#0]
        0x00000f60:    e8bd4010    ...@    POP      {r4,lr}
        0x00000f64:    4708        .G      BX       r1
        0x00000f66:    f7fff9f3    ....    BL       abort ; 0x350
    $d
        0x00000f6a:    0000        ..      DCW    0
        0x00000f6c:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00000f70:    4905        .I      LDR      r1,[pc,#20] ; [0xf88] = 0x88
        0x00000f72:    b510        ..      PUSH     {r4,lr}
        0x00000f74:    3110        .1      ADDS     r1,r1,#0x10
        0x00000f76:    d004        ..      BEQ      0xf82 ; RTC_IRQHandler + 18
        0x00000f78:    6848        Hh      LDR      r0,[r1,#4]
        0x00000f7a:    6809        .h      LDR      r1,[r1,#0]
        0x00000f7c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000f80:    4708        .G      BX       r1
        0x00000f82:    f7fff9e5    ....    BL       abort ; 0x350
    $d
        0x00000f86:    0000        ..      DCW    0
        0x00000f88:    00000088    ....    DCD    136
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00000f8c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000f90:    4607        .F      MOV      r7,r0
        0x00000f92:    480b        .H      LDR      r0,[pc,#44] ; [0xfc0] = 0x20000008
        0x00000f94:    4615        .F      MOV      r5,r2
        0x00000f96:    460e        .F      MOV      r6,r1
        0x00000f98:    7800        .x      LDRB     r0,[r0,#0]
        0x00000f9a:    b908        ..      CBNZ     r0,0xfa0 ; SEGGER_RTT_Write + 20
        0x00000f9c:    f000f966    ..f.    BL       _DoInit ; 0x126c
        0x00000fa0:    f3ef8411    ....    MRS      r4,BASEPRI
        0x00000fa4:    2020                MOVS     r0,#0x20
        0x00000fa6:    f3808811    ....    MSR      BASEPRI,r0
        0x00000faa:    462a        *F      MOV      r2,r5
        0x00000fac:    4631        1F      MOV      r1,r6
        0x00000fae:    4638        8F      MOV      r0,r7
        0x00000fb0:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0xfc4
        0x00000fb4:    b2e1        ..      UXTB     r1,r4
        0x00000fb6:    f3818811    ....    MSR      BASEPRI,r1
        0x00000fba:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000fbe:    0000        ..      DCW    0
        0x00000fc0:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000fc4:    b570        p.      PUSH     {r4-r6,lr}
        0x00000fc6:    460e        .F      MOV      r6,r1
        0x00000fc8:    4914        .I      LDR      r1,[pc,#80] ; [0x101c] = 0x20000008
        0x00000fca:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x00000fce:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x00000fd2:    4614        .F      MOV      r4,r2
        0x00000fd4:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x00000fd6:    3518        .5      ADDS     r5,r5,#0x18
        0x00000fd8:    b120         .      CBZ      r0,0xfe4 ; SEGGER_RTT_WriteNoLock + 32
        0x00000fda:    2801        .(      CMP      r0,#1
        0x00000fdc:    d00f        ..      BEQ      0xffe ; SEGGER_RTT_WriteNoLock + 58
        0x00000fde:    2802        .(      CMP      r0,#2
        0x00000fe0:    d105        ..      BNE      0xfee ; SEGGER_RTT_WriteNoLock + 42
        0x00000fe2:    e013        ..      B        0x100c ; SEGGER_RTT_WriteNoLock + 72
        0x00000fe4:    4628        (F      MOV      r0,r5
        0x00000fe6:    f000f975    ..u.    BL       _GetAvailWriteSpace ; 0x12d4
        0x00000fea:    42a0        .B      CMP      r0,r4
        0x00000fec:    d201        ..      BCS      0xff2 ; SEGGER_RTT_WriteNoLock + 46
        0x00000fee:    2400        .$      MOVS     r4,#0
        0x00000ff0:    e011        ..      B        0x1016 ; SEGGER_RTT_WriteNoLock + 82
        0x00000ff2:    4622        "F      MOV      r2,r4
        0x00000ff4:    4631        1F      MOV      r1,r6
        0x00000ff6:    4628        (F      MOV      r0,r5
        0x00000ff8:    f000fa8c    ....    BL       _WriteNoCheck ; 0x1514
        0x00000ffc:    e00b        ..      B        0x1016 ; SEGGER_RTT_WriteNoLock + 82
        0x00000ffe:    4628        (F      MOV      r0,r5
        0x00001000:    f000f968    ..h.    BL       _GetAvailWriteSpace ; 0x12d4
        0x00001004:    42a0        .B      CMP      r0,r4
        0x00001006:    d2f4        ..      BCS      0xff2 ; SEGGER_RTT_WriteNoLock + 46
        0x00001008:    4604        .F      MOV      r4,r0
        0x0000100a:    e7f2        ..      B        0xff2 ; SEGGER_RTT_WriteNoLock + 46
        0x0000100c:    4631        1F      MOV      r1,r6
        0x0000100e:    4628        (F      MOV      r0,r5
        0x00001010:    f000fa53    ..S.    BL       _WriteBlocking ; 0x14ba
        0x00001014:    4604        .F      MOV      r4,r0
        0x00001016:    4620         F      MOV      r0,r4
        0x00001018:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000101a:    0000        ..      DCW    0
        0x0000101c:    20000008    ...     DCD    536870920
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00001020:    b40f        ..      PUSH     {r0-r3}
        0x00001022:    b508        ..      PUSH     {r3,lr}
        0x00001024:    a904        ..      ADD      r1,sp,#0x10
        0x00001026:    9100        ..      STR      r1,[sp,#0]
        0x00001028:    466a        jF      MOV      r2,sp
        0x0000102a:    9903        ..      LDR      r1,[sp,#0xc]
        0x0000102c:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0x1036
        0x00001030:    b001        ..      ADD      sp,sp,#4
        0x00001032:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x00001036:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000103a:    b098        ..      SUB      sp,sp,#0x60
        0x0000103c:    4680        .F      MOV      r8,r0
        0x0000103e:    a807        ..      ADD      r0,sp,#0x1c
        0x00001040:    9002        ..      STR      r0,[sp,#8]
        0x00001042:    2040        @       MOVS     r0,#0x40
        0x00001044:    2600        .&      MOVS     r6,#0
        0x00001046:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x0000104a:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x0000104e:    4615        .F      MOV      r5,r2
        0x00001050:    460c        .F      MOV      r4,r1
        0x00001052:    f8141b01    ....    LDRB     r1,[r4],#1
        0x00001056:    2900        .)      CMP      r1,#0
        0x00001058:    d06f        o.      BEQ      0x113a ; SEGGER_RTT_vprintf + 260
        0x0000105a:    2925        %)      CMP      r1,#0x25
        0x0000105c:    d008        ..      BEQ      0x1070 ; SEGGER_RTT_vprintf + 58
        0x0000105e:    a802        ..      ADD      r0,sp,#8
        0x00001060:    f000fa0c    ....    BL       _StoreChar ; 0x147c
        0x00001064:    9805        ..      LDR      r0,[sp,#0x14]
        0x00001066:    2800        .(      CMP      r0,#0
        0x00001068:    daf3        ..      BGE      0x1052 ; SEGGER_RTT_vprintf + 28
        0x0000106a:    b018        ..      ADD      sp,sp,#0x60
        0x0000106c:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00001070:    2000        .       MOVS     r0,#0
        0x00001072:    2201        ."      MOVS     r2,#1
        0x00001074:    7821        !x      LDRB     r1,[r4,#0]
        0x00001076:    2923        #)      CMP      r1,#0x23
        0x00001078:    d01e        ..      BEQ      0x10b8 ; SEGGER_RTT_vprintf + 130
        0x0000107a:    292b        +)      CMP      r1,#0x2b
        0x0000107c:    d019        ..      BEQ      0x10b2 ; SEGGER_RTT_vprintf + 124
        0x0000107e:    292d        -)      CMP      r1,#0x2d
        0x00001080:    d002        ..      BEQ      0x1088 ; SEGGER_RTT_vprintf + 82
        0x00001082:    2930        0)      CMP      r1,#0x30
        0x00001084:    d108        ..      BNE      0x1098 ; SEGGER_RTT_vprintf + 98
        0x00001086:    e002        ..      B        0x108e ; SEGGER_RTT_vprintf + 88
        0x00001088:    f0400001    @...    ORR      r0,r0,#1
        0x0000108c:    e001        ..      B        0x1092 ; SEGGER_RTT_vprintf + 92
        0x0000108e:    f0400002    @...    ORR      r0,r0,#2
        0x00001092:    1c64        d.      ADDS     r4,r4,#1
        0x00001094:    2a00        .*      CMP      r2,#0
        0x00001096:    d1ed        ..      BNE      0x1074 ; SEGGER_RTT_vprintf + 62
        0x00001098:    2200        ."      MOVS     r2,#0
        0x0000109a:    7821        !x      LDRB     r1,[r4,#0]
        0x0000109c:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x000010a0:    2b0a        .+      CMP      r3,#0xa
        0x000010a2:    d20c        ..      BCS      0x10be ; SEGGER_RTT_vprintf + 136
        0x000010a4:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x000010a8:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x000010ac:    3a30        0:      SUBS     r2,r2,#0x30
        0x000010ae:    1c64        d.      ADDS     r4,r4,#1
        0x000010b0:    e7f3        ..      B        0x109a ; SEGGER_RTT_vprintf + 100
        0x000010b2:    f0400004    @...    ORR      r0,r0,#4
        0x000010b6:    e7ec        ..      B        0x1092 ; SEGGER_RTT_vprintf + 92
        0x000010b8:    f0400008    @...    ORR      r0,r0,#8
        0x000010bc:    e7e9        ..      B        0x1092 ; SEGGER_RTT_vprintf + 92
        0x000010be:    2300        .#      MOVS     r3,#0
        0x000010c0:    b2cf        ..      UXTB     r7,r1
        0x000010c2:    2f2e        ./      CMP      r7,#0x2e
        0x000010c4:    d10b        ..      BNE      0x10de ; SEGGER_RTT_vprintf + 168
        0x000010c6:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x000010ca:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x000010ce:    2f0a        ./      CMP      r7,#0xa
        0x000010d0:    d205        ..      BCS      0x10de ; SEGGER_RTT_vprintf + 168
        0x000010d2:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x000010d6:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x000010da:    3b30        0;      SUBS     r3,r3,#0x30
        0x000010dc:    e7f3        ..      B        0x10c6 ; SEGGER_RTT_vprintf + 144
        0x000010de:    296c        l)      CMP      r1,#0x6c
        0x000010e0:    d00d        ..      BEQ      0x10fe ; SEGGER_RTT_vprintf + 200
        0x000010e2:    2968        h)      CMP      r1,#0x68
        0x000010e4:    d00b        ..      BEQ      0x10fe ; SEGGER_RTT_vprintf + 200
        0x000010e6:    2970        p)      CMP      r1,#0x70
        0x000010e8:    d04a        J.      BEQ      0x1180 ; SEGGER_RTT_vprintf + 330
        0x000010ea:    dc0b        ..      BGT      0x1104 ; SEGGER_RTT_vprintf + 206
        0x000010ec:    2925        %)      CMP      r1,#0x25
        0x000010ee:    d014        ..      BEQ      0x111a ; SEGGER_RTT_vprintf + 228
        0x000010f0:    2958        X)      CMP      r1,#0x58
        0x000010f2:    d02b        +.      BEQ      0x114c ; SEGGER_RTT_vprintf + 278
        0x000010f4:    2963        c)      CMP      r1,#0x63
        0x000010f6:    d00c        ..      BEQ      0x1112 ; SEGGER_RTT_vprintf + 220
        0x000010f8:    2964        d)      CMP      r1,#0x64
        0x000010fa:    d111        ..      BNE      0x1120 ; SEGGER_RTT_vprintf + 234
        0x000010fc:    e012        ..      B        0x1124 ; SEGGER_RTT_vprintf + 238
        0x000010fe:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00001102:    e7ec        ..      B        0x10de ; SEGGER_RTT_vprintf + 168
        0x00001104:    2973        s)      CMP      r1,#0x73
        0x00001106:    d02c        ,.      BEQ      0x1162 ; SEGGER_RTT_vprintf + 300
        0x00001108:    2975        u)      CMP      r1,#0x75
        0x0000110a:    d017        ..      BEQ      0x113c ; SEGGER_RTT_vprintf + 262
        0x0000110c:    2978        x)      CMP      r1,#0x78
        0x0000110e:    d107        ..      BNE      0x1120 ; SEGGER_RTT_vprintf + 234
        0x00001110:    e01c        ..      B        0x114c ; SEGGER_RTT_vprintf + 278
        0x00001112:    6828        (h      LDR      r0,[r5,#0]
        0x00001114:    1d01        ..      ADDS     r1,r0,#4
        0x00001116:    6029        )`      STR      r1,[r5,#0]
        0x00001118:    7801        .x      LDRB     r1,[r0,#0]
        0x0000111a:    a802        ..      ADD      r0,sp,#8
        0x0000111c:    f000f9ae    ....    BL       _StoreChar ; 0x147c
        0x00001120:    1c64        d.      ADDS     r4,r4,#1
        0x00001122:    e79f        ..      B        0x1064 ; SEGGER_RTT_vprintf + 46
        0x00001124:    6829        )h      LDR      r1,[r5,#0]
        0x00001126:    1d0f        ..      ADDS     r7,r1,#4
        0x00001128:    602f        /`      STR      r7,[r5,#0]
        0x0000112a:    6809        .h      LDR      r1,[r1,#0]
        0x0000112c:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00001130:    220a        ."      MOVS     r2,#0xa
        0x00001132:    a802        ..      ADD      r0,sp,#8
        0x00001134:    f000f8d9    ....    BL       _PrintInt ; 0x12ea
        0x00001138:    e7f2        ..      B        0x1120 ; SEGGER_RTT_vprintf + 234
        0x0000113a:    e02b        +.      B        0x1194 ; SEGGER_RTT_vprintf + 350
        0x0000113c:    6829        )h      LDR      r1,[r5,#0]
        0x0000113e:    1d0f        ..      ADDS     r7,r1,#4
        0x00001140:    602f        /`      STR      r7,[r5,#0]
        0x00001142:    6809        .h      LDR      r1,[r1,#0]
        0x00001144:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00001148:    220a        ."      MOVS     r2,#0xa
        0x0000114a:    e006        ..      B        0x115a ; SEGGER_RTT_vprintf + 292
        0x0000114c:    6829        )h      LDR      r1,[r5,#0]
        0x0000114e:    1d0f        ..      ADDS     r7,r1,#4
        0x00001150:    602f        /`      STR      r7,[r5,#0]
        0x00001152:    6809        .h      LDR      r1,[r1,#0]
        0x00001154:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00001158:    2210        ."      MOVS     r2,#0x10
        0x0000115a:    a802        ..      ADD      r0,sp,#8
        0x0000115c:    f000f928    ..(.    BL       _PrintUnsigned ; 0x13b0
        0x00001160:    e7de        ..      B        0x1120 ; SEGGER_RTT_vprintf + 234
        0x00001162:    6828        (h      LDR      r0,[r5,#0]
        0x00001164:    1d01        ..      ADDS     r1,r0,#4
        0x00001166:    6029        )`      STR      r1,[r5,#0]
        0x00001168:    6807        .h      LDR      r7,[r0,#0]
        0x0000116a:    f8171b01    ....    LDRB     r1,[r7],#1
        0x0000116e:    2900        .)      CMP      r1,#0
        0x00001170:    d0d6        ..      BEQ      0x1120 ; SEGGER_RTT_vprintf + 234
        0x00001172:    a802        ..      ADD      r0,sp,#8
        0x00001174:    f000f982    ....    BL       _StoreChar ; 0x147c
        0x00001178:    9805        ..      LDR      r0,[sp,#0x14]
        0x0000117a:    2800        .(      CMP      r0,#0
        0x0000117c:    daf5        ..      BGE      0x116a ; SEGGER_RTT_vprintf + 308
        0x0000117e:    e7cf        ..      B        0x1120 ; SEGGER_RTT_vprintf + 234
        0x00001180:    6828        (h      LDR      r0,[r5,#0]
        0x00001182:    1d01        ..      ADDS     r1,r0,#4
        0x00001184:    6029        )`      STR      r1,[r5,#0]
        0x00001186:    6801        .h      LDR      r1,[r0,#0]
        0x00001188:    2008        .       MOVS     r0,#8
        0x0000118a:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x0000118e:    4603        .F      MOV      r3,r0
        0x00001190:    2210        ."      MOVS     r2,#0x10
        0x00001192:    e7e2        ..      B        0x115a ; SEGGER_RTT_vprintf + 292
        0x00001194:    9805        ..      LDR      r0,[sp,#0x14]
        0x00001196:    2800        .(      CMP      r0,#0
        0x00001198:    f77faf67    ..g.    BLE      0x106a ; SEGGER_RTT_vprintf + 52
        0x0000119c:    9804        ..      LDR      r0,[sp,#0x10]
        0x0000119e:    b120         .      CBZ      r0,0x11aa ; SEGGER_RTT_vprintf + 372
        0x000011a0:    4602        .F      MOV      r2,r0
        0x000011a2:    a907        ..      ADD      r1,sp,#0x1c
        0x000011a4:    4640        @F      MOV      r0,r8
        0x000011a6:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0xf8c
        0x000011aa:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x000011ae:    4408        .D      ADD      r0,r0,r1
        0x000011b0:    9005        ..      STR      r0,[sp,#0x14]
        0x000011b2:    e75a        Z.      B        0x106a ; SEGGER_RTT_vprintf + 52
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x000011b4:    4905        .I      LDR      r1,[pc,#20] ; [0x11cc] = 0x88
        0x000011b6:    b510        ..      PUSH     {r4,lr}
        0x000011b8:    3170        p1      ADDS     r1,r1,#0x70
        0x000011ba:    d004        ..      BEQ      0x11c6 ; SPIM_IRQHandler + 18
        0x000011bc:    6848        Hh      LDR      r0,[r1,#4]
        0x000011be:    6809        .h      LDR      r1,[r1,#0]
        0x000011c0:    e8bd4010    ...@    POP      {r4,lr}
        0x000011c4:    4708        .G      BX       r1
        0x000011c6:    f7fff8c3    ....    BL       abort ; 0x350
    $d
        0x000011ca:    0000        ..      DCW    0
        0x000011cc:    00000088    ....    DCD    136
    $t
    i.SystemInit
    SystemInit
        0x000011d0:    b510        ..      PUSH     {r4,lr}
        0x000011d2:    4812        .H      LDR      r0,[pc,#72] ; [0x121c] = 0x4000b000
        0x000011d4:    6801        .h      LDR      r1,[r0,#0]
        0x000011d6:    0149        I.      LSLS     r1,r1,#5
        0x000011d8:    d5fc        ..      BPL      0x11d4 ; SystemInit + 4
        0x000011da:    f64e2160    N.`!    MOV      r1,#0xea60
        0x000011de:    2000        .       MOVS     r0,#0
        0x000011e0:    bf00        ..      NOP      
        0x000011e2:    bf00        ..      NOP      
        0x000011e4:    bf00        ..      NOP      
        0x000011e6:    bf00        ..      NOP      
        0x000011e8:    bf00        ..      NOP      
        0x000011ea:    bf00        ..      NOP      
        0x000011ec:    1c40        @.      ADDS     r0,r0,#1
        0x000011ee:    4288        .B      CMP      r0,r1
        0x000011f0:    d3f6        ..      BCC      0x11e0 ; SystemInit + 16
        0x000011f2:    490c        .I      LDR      r1,[pc,#48] ; [0x1224] = 0x20000000
        0x000011f4:    480a        .H      LDR      r0,[pc,#40] ; [0x1220] = 0x5f5e100
        0x000011f6:    6008        .`      STR      r0,[r1,#0]
        0x000011f8:    2008        .       MOVS     r0,#8
        0x000011fa:    f7fffd71    ..q.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xce0
        0x000011fe:    2002        .       MOVS     r0,#2
        0x00001200:    f7fffd7a    ..z.    BL       HAL_SYSCON_Set_HClk_Div ; 0xcf8
        0x00001204:    2004        .       MOVS     r0,#4
        0x00001206:    f7fffdad    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xd64
        0x0000120a:    2002        .       MOVS     r0,#2
        0x0000120c:    f7fffde2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xdd4
        0x00001210:    2164        d!      MOVS     r1,#0x64
        0x00001212:    e8bd4010    ...@    POP      {r4,lr}
        0x00001216:    2001        .       MOVS     r0,#1
        0x00001218:    f7ffbe12    ....    B.W      HAL_SYSCON_Set_RTC_Div ; 0xe40
    $d
        0x0000121c:    4000b000    ...@    DCD    1073786880
        0x00001220:    05f5e100    ....    DCD    100000000
        0x00001224:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00001228:    4905        .I      LDR      r1,[pc,#20] ; [0x1240] = 0x88
        0x0000122a:    b510        ..      PUSH     {r4,lr}
        0x0000122c:    3158        X1      ADDS     r1,r1,#0x58
        0x0000122e:    d004        ..      BEQ      0x123a ; TIMER_IRQHandler + 18
        0x00001230:    6848        Hh      LDR      r0,[r1,#4]
        0x00001232:    6809        .h      LDR      r1,[r1,#0]
        0x00001234:    e8bd4010    ...@    POP      {r4,lr}
        0x00001238:    4708        .G      BX       r1
        0x0000123a:    f7fff889    ....    BL       abort ; 0x350
    $d
        0x0000123e:    0000        ..      DCW    0
        0x00001240:    00000088    ....    DCD    136
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001244:    4905        .I      LDR      r1,[pc,#20] ; [0x125c] = 0x88
        0x00001246:    b510        ..      PUSH     {r4,lr}
        0x00001248:    3178        x1      ADDS     r1,r1,#0x78
        0x0000124a:    d004        ..      BEQ      0x1256 ; UART_IRQHandler + 18
        0x0000124c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000124e:    6809        .h      LDR      r1,[r1,#0]
        0x00001250:    e8bd4010    ...@    POP      {r4,lr}
        0x00001254:    4708        .G      BX       r1
        0x00001256:    f7fff87b    ..{.    BL       abort ; 0x350
    $d
        0x0000125a:    0000        ..      DCW    0
        0x0000125c:    00000088    ....    DCD    136
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x00001260:    4901        .I      LDR      r1,[pc,#4] ; [0x1268] = 0x88
        0x00001262:    6848        Hh      LDR      r0,[r1,#4]
        0x00001264:    6809        .h      LDR      r1,[r1,#0]
        0x00001266:    4708        .G      BX       r1
    $d
        0x00001268:    00000088    ....    DCD    136
    $t
    i._DoInit
    _DoInit
        0x0000126c:    b510        ..      PUSH     {r4,lr}
        0x0000126e:    4c12        .L      LDR      r4,[pc,#72] ; [0x12b8] = 0x20000008
        0x00001270:    2003        .       MOVS     r0,#3
        0x00001272:    2100        .!      MOVS     r1,#0
        0x00001274:    6120         a      STR      r0,[r4,#0x10]
        0x00001276:    6160        `a      STR      r0,[r4,#0x14]
        0x00001278:    a010        ..      ADR      r0,{pc}+0x44 ; 0x12bc
        0x0000127a:    61a0        .a      STR      r0,[r4,#0x18]
        0x0000127c:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x00001280:    61e0        .a      STR      r0,[r4,#0x1c]
        0x00001282:    f44f6080    O..`    MOV      r0,#0x400
        0x00001286:    62a1        .b      STR      r1,[r4,#0x28]
        0x00001288:    6220         b      STR      r0,[r4,#0x20]
        0x0000128a:    6261        ab      STR      r1,[r4,#0x24]
        0x0000128c:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x12bc
        0x0000128e:    62e1        .b      STR      r1,[r4,#0x2c]
        0x00001290:    6620         f      STR      r0,[r4,#0x60]
        0x00001292:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x00001296:    6660        `f      STR      r0,[r4,#0x64]
        0x00001298:    2010        .       MOVS     r0,#0x10
        0x0000129a:    6721        !g      STR      r1,[r4,#0x70]
        0x0000129c:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x000012a0:    6761        ag      STR      r1,[r4,#0x74]
        0x000012a2:    a109        ..      ADR      r1,{pc}+0x26 ; 0x12c8
        0x000012a4:    1de0        ..      ADDS     r0,r4,#7
        0x000012a6:    f7fff85e    ..^.    BL       strcpy ; 0x366
        0x000012aa:    a108        ..      ADR      r1,{pc}+0x22 ; 0x12cc
        0x000012ac:    4620         F      MOV      r0,r4
        0x000012ae:    f7fff85a    ..Z.    BL       strcpy ; 0x366
        0x000012b2:    2020                MOVS     r0,#0x20
        0x000012b4:    71a0        .q      STRB     r0,[r4,#6]
        0x000012b6:    bd10        ..      POP      {r4,pc}
    $d
        0x000012b8:    20000008    ...     DCD    536870920
        0x000012bc:    6d726554    Term    DCD    1836213588
        0x000012c0:    6c616e69    inal    DCD    1818324585
        0x000012c4:    00000000    ....    DCD    0
        0x000012c8:    00545452    RTT.    DCD    5526610
        0x000012cc:    47474553    SEGG    DCD    1195853139
        0x000012d0:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x000012d4:    6902        .i      LDR      r2,[r0,#0x10]
        0x000012d6:    68c1        .h      LDR      r1,[r0,#0xc]
        0x000012d8:    428a        .B      CMP      r2,r1
        0x000012da:    d803        ..      BHI      0x12e4 ; _GetAvailWriteSpace + 16
        0x000012dc:    6880        .h      LDR      r0,[r0,#8]
        0x000012de:    1a40        @.      SUBS     r0,r0,r1
        0x000012e0:    4410        .D      ADD      r0,r0,r2
        0x000012e2:    e000        ..      B        0x12e6 ; _GetAvailWriteSpace + 18
        0x000012e4:    1a50        P.      SUBS     r0,r2,r1
        0x000012e6:    1e40        @.      SUBS     r0,r0,#1
        0x000012e8:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x000012ea:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x000012ee:    000e        ..      MOVS     r6,r1
        0x000012f0:    4680        .F      MOV      r8,r0
        0x000012f2:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x000012f6:    f1c60000    ....    RSB      r0,r6,#0
        0x000012fa:    4699        .F      MOV      r9,r3
        0x000012fc:    4692        .F      MOV      r10,r2
        0x000012fe:    4683        .F      MOV      r11,r0
        0x00001300:    d400        ..      BMI      0x1304 ; _PrintInt + 26
        0x00001302:    4608        .F      MOV      r0,r1
        0x00001304:    2501        .%      MOVS     r5,#1
        0x00001306:    e002        ..      B        0x130e ; _PrintInt + 36
        0x00001308:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x0000130c:    1c6d        m.      ADDS     r5,r5,#1
        0x0000130e:    4550        PE      CMP      r0,r10
        0x00001310:    dafa        ..      BGE      0x1308 ; _PrintInt + 30
        0x00001312:    45a9        .E      CMP      r9,r5
        0x00001314:    d900        ..      BLS      0x1318 ; _PrintInt + 46
        0x00001316:    464d        MF      MOV      r5,r9
        0x00001318:    b124        $.      CBZ      r4,0x1324 ; _PrintInt + 58
        0x0000131a:    2e00        ..      CMP      r6,#0
        0x0000131c:    db01        ..      BLT      0x1322 ; _PrintInt + 56
        0x0000131e:    0778        x.      LSLS     r0,r7,#29
        0x00001320:    d500        ..      BPL      0x1324 ; _PrintInt + 58
        0x00001322:    1e64        d.      SUBS     r4,r4,#1
        0x00001324:    07b8        ..      LSLS     r0,r7,#30
        0x00001326:    d502        ..      BPL      0x132e ; _PrintInt + 68
        0x00001328:    f1b90f00    ....    CMP      r9,#0
        0x0000132c:    d00f        ..      BEQ      0x134e ; _PrintInt + 100
        0x0000132e:    07f8        ..      LSLS     r0,r7,#31
        0x00001330:    d10d        ..      BNE      0x134e ; _PrintInt + 100
        0x00001332:    b164        d.      CBZ      r4,0x134e ; _PrintInt + 100
        0x00001334:    42a5        .B      CMP      r5,r4
        0x00001336:    d20a        ..      BCS      0x134e ; _PrintInt + 100
        0x00001338:    2120         !      MOVS     r1,#0x20
        0x0000133a:    4640        @F      MOV      r0,r8
        0x0000133c:    1e64        d.      SUBS     r4,r4,#1
        0x0000133e:    f000f89d    ....    BL       _StoreChar ; 0x147c
        0x00001342:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001346:    2800        .(      CMP      r0,#0
        0x00001348:    daf3        ..      BGE      0x1332 ; _PrintInt + 72
        0x0000134a:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x0000134e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001352:    2800        .(      CMP      r0,#0
        0x00001354:    dbf9        ..      BLT      0x134a ; _PrintInt + 96
        0x00001356:    2e00        ..      CMP      r6,#0
        0x00001358:    da02        ..      BGE      0x1360 ; _PrintInt + 118
        0x0000135a:    465e        ^F      MOV      r6,r11
        0x0000135c:    212d        -!      MOVS     r1,#0x2d
        0x0000135e:    e002        ..      B        0x1366 ; _PrintInt + 124
        0x00001360:    0778        x.      LSLS     r0,r7,#29
        0x00001362:    d507        ..      BPL      0x1374 ; _PrintInt + 138
        0x00001364:    212b        +!      MOVS     r1,#0x2b
        0x00001366:    4640        @F      MOV      r0,r8
        0x00001368:    f000f888    ....    BL       _StoreChar ; 0x147c
        0x0000136c:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001370:    2800        .(      CMP      r0,#0
        0x00001372:    dbea        ..      BLT      0x134a ; _PrintInt + 96
        0x00001374:    f0070003    ....    AND      r0,r7,#3
        0x00001378:    2802        .(      CMP      r0,#2
        0x0000137a:    d10f        ..      BNE      0x139c ; _PrintInt + 178
        0x0000137c:    f1b90f00    ....    CMP      r9,#0
        0x00001380:    d10c        ..      BNE      0x139c ; _PrintInt + 178
        0x00001382:    b15c        \.      CBZ      r4,0x139c ; _PrintInt + 178
        0x00001384:    42a5        .B      CMP      r5,r4
        0x00001386:    d209        ..      BCS      0x139c ; _PrintInt + 178
        0x00001388:    2130        0!      MOVS     r1,#0x30
        0x0000138a:    4640        @F      MOV      r0,r8
        0x0000138c:    1e64        d.      SUBS     r4,r4,#1
        0x0000138e:    f000f875    ..u.    BL       _StoreChar ; 0x147c
        0x00001392:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001396:    2800        .(      CMP      r0,#0
        0x00001398:    daf3        ..      BGE      0x1382 ; _PrintInt + 152
        0x0000139a:    e7d6        ..      B        0x134a ; _PrintInt + 96
        0x0000139c:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x000013a0:    464b        KF      MOV      r3,r9
        0x000013a2:    4652        RF      MOV      r2,r10
        0x000013a4:    4631        1F      MOV      r1,r6
        0x000013a6:    4640        @F      MOV      r0,r8
        0x000013a8:    f000f802    ....    BL       _PrintUnsigned ; 0x13b0
        0x000013ac:    e7cd        ..      B        0x134a ; _PrintInt + 96
        0x000013ae:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x000013b0:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x000013b4:    4682        .F      MOV      r10,r0
        0x000013b6:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x000013ba:    2501        .%      MOVS     r5,#1
        0x000013bc:    4699        .F      MOV      r9,r3
        0x000013be:    4617        .F      MOV      r7,r2
        0x000013c0:    4688        .F      MOV      r8,r1
        0x000013c2:    4608        .F      MOV      r0,r1
        0x000013c4:    462e        .F      MOV      r6,r5
        0x000013c6:    e002        ..      B        0x13ce ; _PrintUnsigned + 30
        0x000013c8:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x000013cc:    1c76        v.      ADDS     r6,r6,#1
        0x000013ce:    42b8        .B      CMP      r0,r7
        0x000013d0:    d2fa        ..      BCS      0x13c8 ; _PrintUnsigned + 24
        0x000013d2:    45b1        .E      CMP      r9,r6
        0x000013d4:    d900        ..      BLS      0x13d8 ; _PrintUnsigned + 40
        0x000013d6:    464e        NF      MOV      r6,r9
        0x000013d8:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x000013dc:    d117        ..      BNE      0x140e ; _PrintUnsigned + 94
        0x000013de:    b1b4        ..      CBZ      r4,0x140e ; _PrintUnsigned + 94
        0x000013e0:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x000013e4:    d502        ..      BPL      0x13ec ; _PrintUnsigned + 60
        0x000013e6:    f1b90f00    ....    CMP      r9,#0
        0x000013ea:    d002        ..      BEQ      0x13f2 ; _PrintUnsigned + 66
        0x000013ec:    2020                MOVS     r0,#0x20
        0x000013ee:    9000        ..      STR      r0,[sp,#0]
        0x000013f0:    e00b        ..      B        0x140a ; _PrintUnsigned + 90
        0x000013f2:    2030        0       MOVS     r0,#0x30
        0x000013f4:    e7fb        ..      B        0x13ee ; _PrintUnsigned + 62
        0x000013f6:    4650        PF      MOV      r0,r10
        0x000013f8:    1e64        d.      SUBS     r4,r4,#1
        0x000013fa:    9900        ..      LDR      r1,[sp,#0]
        0x000013fc:    f000f83e    ..>.    BL       _StoreChar ; 0x147c
        0x00001400:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001404:    2800        .(      CMP      r0,#0
        0x00001406:    db35        5.      BLT      0x1474 ; _PrintUnsigned + 196
        0x00001408:    b10c        ..      CBZ      r4,0x140e ; _PrintUnsigned + 94
        0x0000140a:    42a6        .B      CMP      r6,r4
        0x0000140c:    d3f3        ..      BCC      0x13f6 ; _PrintUnsigned + 70
        0x0000140e:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001412:    2800        .(      CMP      r0,#0
        0x00001414:    db2e        ..      BLT      0x1474 ; _PrintUnsigned + 196
        0x00001416:    f1b90f01    ....    CMP      r9,#1
        0x0000141a:    d902        ..      BLS      0x1422 ; _PrintUnsigned + 114
        0x0000141c:    f1a90901    ....    SUB      r9,r9,#1
        0x00001420:    e003        ..      B        0x142a ; _PrintUnsigned + 122
        0x00001422:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001426:    42b8        .B      CMP      r0,r7
        0x00001428:    d301        ..      BCC      0x142e ; _PrintUnsigned + 126
        0x0000142a:    437d        }C      MULS     r5,r7,r5
        0x0000142c:    e7f3        ..      B        0x1416 ; _PrintUnsigned + 102
        0x0000142e:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0x1478] = 0x1950
        0x00001432:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001436:    fb008815    ....    MLS      r8,r0,r5,r8
        0x0000143a:    f8191000    ....    LDRB     r1,[r9,r0]
        0x0000143e:    4650        PF      MOV      r0,r10
        0x00001440:    f000f81c    ....    BL       _StoreChar ; 0x147c
        0x00001444:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001448:    2800        .(      CMP      r0,#0
        0x0000144a:    db03        ..      BLT      0x1454 ; _PrintUnsigned + 164
        0x0000144c:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x00001450:    2d00        .-      CMP      r5,#0
        0x00001452:    d1ee        ..      BNE      0x1432 ; _PrintUnsigned + 130
        0x00001454:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00001458:    d00c        ..      BEQ      0x1474 ; _PrintUnsigned + 196
        0x0000145a:    2c00        .,      CMP      r4,#0
        0x0000145c:    d00a        ..      BEQ      0x1474 ; _PrintUnsigned + 196
        0x0000145e:    42a6        .B      CMP      r6,r4
        0x00001460:    d208        ..      BCS      0x1474 ; _PrintUnsigned + 196
        0x00001462:    2120         !      MOVS     r1,#0x20
        0x00001464:    4650        PF      MOV      r0,r10
        0x00001466:    1e64        d.      SUBS     r4,r4,#1
        0x00001468:    f000f808    ....    BL       _StoreChar ; 0x147c
        0x0000146c:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001470:    2800        .(      CMP      r0,#0
        0x00001472:    daf2        ..      BGE      0x145a ; _PrintUnsigned + 170
        0x00001474:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x00001478:    00001950    P...    DCD    6480
    $t
    i._StoreChar
    _StoreChar
        0x0000147c:    b510        ..      PUSH     {r4,lr}
        0x0000147e:    4604        .F      MOV      r4,r0
        0x00001480:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x00001484:    1c42        B.      ADDS     r2,r0,#1
        0x00001486:    4293        .B      CMP      r3,r2
        0x00001488:    d305        ..      BCC      0x1496 ; _StoreChar + 26
        0x0000148a:    6823        #h      LDR      r3,[r4,#0]
        0x0000148c:    5419        .T      STRB     r1,[r3,r0]
        0x0000148e:    60a2        .`      STR      r2,[r4,#8]
        0x00001490:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00001492:    1c40        @.      ADDS     r0,r0,#1
        0x00001494:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001496:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x0000149a:    4282        .B      CMP      r2,r0
        0x0000149c:    d109        ..      BNE      0x14b2 ; _StoreChar + 54
        0x0000149e:    6821        !h      LDR      r1,[r4,#0]
        0x000014a0:    6920         i      LDR      r0,[r4,#0x10]
        0x000014a2:    f7fffd73    ..s.    BL       SEGGER_RTT_Write ; 0xf8c
        0x000014a6:    68a1        .h      LDR      r1,[r4,#8]
        0x000014a8:    4288        .B      CMP      r0,r1
        0x000014aa:    d003        ..      BEQ      0x14b4 ; _StoreChar + 56
        0x000014ac:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000014b0:    60e0        .`      STR      r0,[r4,#0xc]
        0x000014b2:    bd10        ..      POP      {r4,pc}
        0x000014b4:    2000        .       MOVS     r0,#0
        0x000014b6:    60a0        .`      STR      r0,[r4,#8]
        0x000014b8:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x000014ba:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x000014be:    68c4        .h      LDR      r4,[r0,#0xc]
        0x000014c0:    4617        .F      MOV      r7,r2
        0x000014c2:    4689        .F      MOV      r9,r1
        0x000014c4:    4605        .F      MOV      r5,r0
        0x000014c6:    f04f0800    O...    MOV      r8,#0
        0x000014ca:    6928        (i      LDR      r0,[r5,#0x10]
        0x000014cc:    42a0        .B      CMP      r0,r4
        0x000014ce:    d901        ..      BLS      0x14d4 ; _WriteBlocking + 26
        0x000014d0:    1b06        ..      SUBS     r6,r0,r4
        0x000014d2:    e002        ..      B        0x14da ; _WriteBlocking + 32
        0x000014d4:    68a9        .h      LDR      r1,[r5,#8]
        0x000014d6:    1a20         .      SUBS     r0,r4,r0
        0x000014d8:    1a0e        ..      SUBS     r6,r1,r0
        0x000014da:    68a8        .h      LDR      r0,[r5,#8]
        0x000014dc:    1e76        v.      SUBS     r6,r6,#1
        0x000014de:    1b00        ..      SUBS     r0,r0,r4
        0x000014e0:    42b0        .B      CMP      r0,r6
        0x000014e2:    d800        ..      BHI      0x14e6 ; _WriteBlocking + 44
        0x000014e4:    4606        .F      MOV      r6,r0
        0x000014e6:    42be        .B      CMP      r6,r7
        0x000014e8:    d300        ..      BCC      0x14ec ; _WriteBlocking + 50
        0x000014ea:    463e        >F      MOV      r6,r7
        0x000014ec:    6868        hh      LDR      r0,[r5,#4]
        0x000014ee:    4632        2F      MOV      r2,r6
        0x000014f0:    4420         D      ADD      r0,r0,r4
        0x000014f2:    4649        IF      MOV      r1,r9
        0x000014f4:    f7feff5b    ..[.    BL       __aeabi_memcpy ; 0x3ae
        0x000014f8:    68a8        .h      LDR      r0,[r5,#8]
        0x000014fa:    1bbf        ..      SUBS     r7,r7,r6
        0x000014fc:    4434        4D      ADD      r4,r4,r6
        0x000014fe:    44b0        .D      ADD      r8,r8,r6
        0x00001500:    44b1        .D      ADD      r9,r9,r6
        0x00001502:    42a0        .B      CMP      r0,r4
        0x00001504:    d100        ..      BNE      0x1508 ; _WriteBlocking + 78
        0x00001506:    2400        .$      MOVS     r4,#0
        0x00001508:    60ec        .`      STR      r4,[r5,#0xc]
        0x0000150a:    2f00        ./      CMP      r7,#0
        0x0000150c:    d1dd        ..      BNE      0x14ca ; _WriteBlocking + 16
        0x0000150e:    4640        @F      MOV      r0,r8
        0x00001510:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001514:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001518:    4604        .F      MOV      r4,r0
        0x0000151a:    4688        .F      MOV      r8,r1
        0x0000151c:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x00001520:    1bc5        ..      SUBS     r5,r0,r7
        0x00001522:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00001524:    6860        `h      LDR      r0,[r4,#4]
        0x00001526:    4616        .F      MOV      r6,r2
        0x00001528:    4408        .D      ADD      r0,r0,r1
        0x0000152a:    42b5        .B      CMP      r5,r6
        0x0000152c:    d906        ..      BLS      0x153c ; _WriteNoCheck + 40
        0x0000152e:    4641        AF      MOV      r1,r8
        0x00001530:    f7feff3d    ..=.    BL       __aeabi_memcpy ; 0x3ae
        0x00001534:    19b8        ..      ADDS     r0,r7,r6
        0x00001536:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001538:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x0000153c:    462a        *F      MOV      r2,r5
        0x0000153e:    4641        AF      MOV      r1,r8
        0x00001540:    f7feff35    ..5.    BL       __aeabi_memcpy ; 0x3ae
        0x00001544:    1b76        v.      SUBS     r6,r6,r5
        0x00001546:    eb080105    ....    ADD      r1,r8,r5
        0x0000154a:    4632        2F      MOV      r2,r6
        0x0000154c:    6860        `h      LDR      r0,[r4,#4]
        0x0000154e:    f7feff2e    ....    BL       __aeabi_memcpy ; 0x3ae
        0x00001552:    60e6        .`      STR      r6,[r4,#0xc]
        0x00001554:    e7f0        ..      B        0x1538 ; _WriteNoCheck + 36
        0x00001556:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00001558:    b672        r.      CPSID    i
        0x0000155a:    4603        .F      MOV      r3,r0
        0x0000155c:    a001        ..      ADR      r0,{pc}+8 ; 0x1564
        0x0000155e:    f7fefe51    ..Q.    BL       __2printf ; 0x204
        0x00001562:    e7fe        ..      B        0x1562 ; __aeabi_assert + 10
    $d
        0x00001564:    65737341    Asse    DCD    1702064961
        0x00001568:    6f697472    rtio    DCD    1869182066
        0x0000156c:    6146206e    n Fa    DCD    1631985774
        0x00001570:    64656c69    iled    DCD    1684368489
        0x00001574:    6966203a    : fi    DCD    1768300602
        0x00001578:    2520656c    le %    DCD    622880108
        0x0000157c:    6c202c73    s, l    DCD    1814047859
        0x00001580:    20656e69    ine     DCD    543518313
        0x00001584:    202c6425    %d,     DCD    539780133
        0x00001588:    000a7325    %s..    DCD    684837
    $t
    i.dmac_ch0_cfg_h_pack
    dmac_ch0_cfg_h_pack
        0x0000158c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000158e:    9c04        ..      LDR      r4,[sp,#0x10]
        0x00001590:    02c5        ..      LSLS     r5,r0,#11
        0x00001592:    ea4515c1    E...    ORR      r5,r5,r1,LSL #7
        0x00001596:    ea450582    E...    ORR      r5,r5,r2,LSL #2
        0x0000159a:    ea450543    E.C.    ORR      r5,r5,r3,LSL #1
        0x0000159e:    4325        %C      ORRS     r5,r5,r4
        0x000015a0:    4e01        .N      LDR      r6,[pc,#4] ; [0x15a8] = 0x40010000
        0x000015a2:    6475        ud      STR      r5,[r6,#0x44]
        0x000015a4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000015a6:    0000        ..      DCW    0
        0x000015a8:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_cfg_l_pack
    dmac_ch0_cfg_l_pack
        0x000015ac:    b5f0        ..      PUSH     {r4-r7,lr}
        0x000015ae:    ac05        ..      ADD      r4,sp,#0x14
        0x000015b0:    cc70        p.      LDM      r4,{r4-r6}
        0x000015b2:    0507        ..      LSLS     r7,r0,#20
        0x000015b4:    ea4747c1    G..G    ORR      r7,r7,r1,LSL #19
        0x000015b8:    ea474782    G..G    ORR      r7,r7,r2,LSL #18
        0x000015bc:    ea4727c3    G..'    ORR      r7,r7,r3,LSL #11
        0x000015c0:    ea472784    G..'    ORR      r7,r7,r4,LSL #10
        0x000015c4:    ea472705    G..'    ORR      r7,r7,r5,LSL #8
        0x000015c8:    ea471746    G.F.    ORR      r7,r7,r6,LSL #5
        0x000015cc:    f8dfc008    ....    LDR      r12,[pc,#8] ; [0x15d8] = 0x40010000
        0x000015d0:    f8cc7040    ..@p    STR      r7,[r12,#0x40]
        0x000015d4:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x000015d6:    0000        ..      DCW    0
        0x000015d8:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_h_pack
    dmac_ch0_ctrl_h_pack
        0x000015dc:    ea413200    A..2    ORR      r2,r1,r0,LSL #12
        0x000015e0:    4b01        .K      LDR      r3,[pc,#4] ; [0x15e8] = 0x40010000
        0x000015e2:    61da        .a      STR      r2,[r3,#0x1c]
        0x000015e4:    4770        pG      BX       lr
    $d
        0x000015e6:    0000        ..      DCW    0
        0x000015e8:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_l_pack
    dmac_ch0_ctrl_l_pack
        0x000015ec:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000015f0:    ac06        ..      ADD      r4,sp,#0x18
        0x000015f2:    ccf0        ..      LDM      r4,{r4-r7}
        0x000015f4:    ea4f5c00    O..\    LSL      r12,r0,#20
        0x000015f8:    ea4c3c81    L..<    ORR      r12,r12,r1,LSL #14
        0x000015fc:    ea4c2cc2    L..,    ORR      r12,r12,r2,LSL #11
        0x00001600:    ea4c2c43    L.C,    ORR      r12,r12,r3,LSL #9
        0x00001604:    ea4c1cc4    L...    ORR      r12,r12,r4,LSL #7
        0x00001608:    ea4c1c05    L...    ORR      r12,r12,r5,LSL #4
        0x0000160c:    ea4c0c46    L.F.    ORR      r12,r12,r6,LSL #1
        0x00001610:    ea4c0c07    L...    ORR      r12,r12,r7
        0x00001614:    f8df8008    ....    LDR      r8,[pc,#8] ; [0x1620] = 0x40010000
        0x00001618:    f8c8c018    ....    STR      r12,[r8,#0x18]
        0x0000161c:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001620:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_dar_l_set
    dmac_ch0_dar_l_set
        0x00001624:    4901        .I      LDR      r1,[pc,#4] ; [0x162c] = 0x40010000
        0x00001626:    6088        .`      STR      r0,[r1,#8]
        0x00001628:    4770        pG      BX       lr
    $d
        0x0000162a:    0000        ..      DCW    0
        0x0000162c:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_sar_l_set
    dmac_ch0_sar_l_set
        0x00001630:    4901        .I      LDR      r1,[pc,#4] ; [0x1638] = 0x40010000
        0x00001632:    6008        .`      STR      r0,[r1,#0]
        0x00001634:    4770        pG      BX       lr
    $d
        0x00001636:    0000        ..      DCW    0
        0x00001638:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch1_cfg_h_pack
    dmac_ch1_cfg_h_pack
        0x0000163c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000163e:    9c04        ..      LDR      r4,[sp,#0x10]
        0x00001640:    02c5        ..      LSLS     r5,r0,#11
        0x00001642:    ea4515c1    E...    ORR      r5,r5,r1,LSL #7
        0x00001646:    ea450582    E...    ORR      r5,r5,r2,LSL #2
        0x0000164a:    ea450543    E.C.    ORR      r5,r5,r3,LSL #1
        0x0000164e:    4325        %C      ORRS     r5,r5,r4
        0x00001650:    4e01        .N      LDR      r6,[pc,#4] ; [0x1658] = 0x4001009c
        0x00001652:    6035        5`      STR      r5,[r6,#0]
        0x00001654:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001656:    0000        ..      DCW    0
        0x00001658:    4001009c    ...@    DCD    1073807516
    $t
    i.dmac_chenreg_l_pack
    dmac_chenreg_l_pack
        0x0000165c:    ea412200    A.."    ORR      r2,r1,r0,LSL #8
        0x00001660:    4b01        .K      LDR      r3,[pc,#4] ; [0x1668] = 0x400103a0
        0x00001662:    601a        .`      STR      r2,[r3,#0]
        0x00001664:    4770        pG      BX       lr
    $d
        0x00001666:    0000        ..      DCW    0
        0x00001668:    400103a0    ...@    DCD    1073808288
    $t
    i.dmac_clearblock_l_set
    dmac_clearblock_l_set
        0x0000166c:    4901        .I      LDR      r1,[pc,#4] ; [0x1674] = 0x40010340
        0x0000166e:    6008        .`      STR      r0,[r1,#0]
        0x00001670:    4770        pG      BX       lr
    $d
        0x00001672:    0000        ..      DCW    0
        0x00001674:    40010340    @..@    DCD    1073808192
    $t
    i.dmac_dmacfgreg_l_set
    dmac_dmacfgreg_l_set
        0x00001678:    4901        .I      LDR      r1,[pc,#4] ; [0x1680] = 0x40010398
        0x0000167a:    6008        .`      STR      r0,[r1,#0]
        0x0000167c:    4770        pG      BX       lr
    $d
        0x0000167e:    0000        ..      DCW    0
        0x00001680:    40010398    ...@    DCD    1073808280
    $t
    i.dmac_rawblock_l_get
    dmac_rawblock_l_get
        0x00001684:    4801        .H      LDR      r0,[pc,#4] ; [0x168c] = 0x400102c8
        0x00001686:    6800        .h      LDR      r0,[r0,#0]
        0x00001688:    4770        pG      BX       lr
    $d
        0x0000168a:    0000        ..      DCW    0
        0x0000168c:    400102c8    ...@    DCD    1073808072
    $t
    i.fputc
    fputc
        0x00001690:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00001692:    2201        ."      MOVS     r2,#1
        0x00001694:    4669        iF      MOV      r1,sp
        0x00001696:    2000        .       MOVS     r0,#0
        0x00001698:    f7fffc78    ..x.    BL       SEGGER_RTT_Write ; 0xf8c
        0x0000169c:    9800        ..      LDR      r0,[sp,#0]
        0x0000169e:    bd1c        ..      POP      {r2-r4,pc}
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x000016a0:    4903        .I      LDR      r1,[pc,#12] ; [0x16b0] = 0x40007000
        0x000016a2:    6809        .h      LDR      r1,[r1,#0]
        0x000016a4:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000016a8:    4a01        .J      LDR      r2,[pc,#4] ; [0x16b0] = 0x40007000
        0x000016aa:    6011        .`      STR      r1,[r2,#0]
        0x000016ac:    4770        pG      BX       lr
    $d
        0x000016ae:    0000        ..      DCW    0
        0x000016b0:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x000016b4:    4903        .I      LDR      r1,[pc,#12] ; [0x16c4] = 0x40007000
        0x000016b6:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000016b8:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000016bc:    4a01        .J      LDR      r2,[pc,#4] ; [0x16c4] = 0x40007000
        0x000016be:    60d1        .`      STR      r1,[r2,#0xc]
        0x000016c0:    4770        pG      BX       lr
    $d
        0x000016c2:    0000        ..      DCW    0
        0x000016c4:    40007000    .p.@    DCD    1073770496
    $t
    i.main
    main
        0x000016c8:    a103        ..      ADR      r1,{pc}+0x10 ; 0x16d8
        0x000016ca:    2000        .       MOVS     r0,#0
        0x000016cc:    f7fffca8    ....    BL       SEGGER_RTT_printf ; 0x1020
        0x000016d0:    f000f8a6    ....    BL       test_gpio ; 0x1820
        0x000016d4:    e7fe        ..      B        0x16d4 ; main + 12
    $d
        0x000016d6:    0000        ..      DCW    0
        0x000016d8:    20555043    CPU     DCD    542462019
        0x000016dc:    72617473    star    DCD    1918989427
        0x000016e0:    2e2e2e74    t...    DCD    774778484
        0x000016e4:    00000a2e    ....    DCD    2606
    $t
    i.mem2mem
    mem2mem
        0x000016e8:    b570        p.      PUSH     {r4-r6,lr}
        0x000016ea:    b096        ..      SUB      sp,sp,#0x58
        0x000016ec:    2000        .       MOVS     r0,#0
        0x000016ee:    466c        lF      MOV      r4,sp
        0x000016f0:    f8440020    D. .    STR      r0,[r4,r0,LSL #2]
        0x000016f4:    1c40        @.      ADDS     r0,r0,#1
        0x000016f6:    280a        .(      CMP      r0,#0xa
        0x000016f8:    d3fa        ..      BCC      0x16f0 ; mem2mem + 8
        0x000016fa:    2500        .%      MOVS     r5,#0
        0x000016fc:    4629        )F      MOV      r1,r5
        0x000016fe:    f8542025    T.%     LDR      r2,[r4,r5,LSL #2]
        0x00001702:    a02a        *.      ADR      r0,{pc}+0xaa ; 0x17ac
        0x00001704:    f7fefd7e    ..~.    BL       __2printf ; 0x204
        0x00001708:    1c6d        m.      ADDS     r5,r5,#1
        0x0000170a:    2d0a        .-      CMP      r5,#0xa
        0x0000170c:    d3f6        ..      BCC      0x16fc ; mem2mem + 20
        0x0000170e:    2000        .       MOVS     r0,#0
        0x00001710:    4606        .F      MOV      r6,r0
        0x00001712:    ad0a        ..      ADD      r5,sp,#0x28
        0x00001714:    f8456020    E. `    STR      r6,[r5,r0,LSL #2]
        0x00001718:    1c40        @.      ADDS     r0,r0,#1
        0x0000171a:    280a        .(      CMP      r0,#0xa
        0x0000171c:    d3fa        ..      BCC      0x1714 ; mem2mem + 44
        0x0000171e:    2400        .$      MOVS     r4,#0
        0x00001720:    4621        !F      MOV      r1,r4
        0x00001722:    f8552024    U.$     LDR      r2,[r5,r4,LSL #2]
        0x00001726:    a027        '.      ADR      r0,{pc}+0x9e ; 0x17c4
        0x00001728:    f7fefd6c    ..l.    BL       __2printf ; 0x204
        0x0000172c:    1c64        d.      ADDS     r4,r4,#1
        0x0000172e:    2c0a        .,      CMP      r4,#0xa
        0x00001730:    d3f6        ..      BCC      0x1720 ; mem2mem + 56
        0x00001732:    4639        9F      MOV      r1,r7
        0x00001734:    463a        :F      MOV      r2,r7
        0x00001736:    f366210f    f..!    BFI      r1,r6,#8,#8
        0x0000173a:    f3660207    f...    BFI      r2,r6,#0,#8
        0x0000173e:    f3664117    f..A    BFI      r1,r6,#16,#8
        0x00001742:    2002        .       MOVS     r0,#2
        0x00001744:    f366220f    f.."    BFI      r2,r6,#8,#8
        0x00001748:    f360611f    `..a    BFI      r1,r0,#24,#8
        0x0000174c:    f3664217    f..B    BFI      r2,r6,#16,#8
        0x00001750:    f7fff84a    ..J.    BL       HAL_DMAC_Init ; 0x7e8
        0x00001754:    f04f21e0    O..!    MOV      r1,#0xe000e000
        0x00001758:    2008        .       MOVS     r0,#8
        0x0000175a:    f8c10100    ....    STR      r0,[r1,#0x100]
        0x0000175e:    230a        .#      MOVS     r3,#0xa
        0x00001760:    aa0a        ..      ADD      r2,sp,#0x28
        0x00001762:    4669        iF      MOV      r1,sp
        0x00001764:    2002        .       MOVS     r0,#2
        0x00001766:    f7fff94f    ..O.    BL       HAL_DMAC_Start_Transfer ; 0xa08
        0x0000176a:    f7fff835    ..5.    BL       HAL_DMAC_Get_Busy_Channel ; 0x7d8
        0x0000176e:    f88d0050    ..P.    STRB     r0,[sp,#0x50]
        0x00001772:    f89d1050    ..P.    LDRB     r1,[sp,#0x50]
        0x00001776:    a019        ..      ADR      r0,{pc}+0x66 ; 0x17dc
        0x00001778:    f7fefd44    ..D.    BL       __2printf ; 0x204
        0x0000177c:    2002        .       MOVS     r0,#2
        0x0000177e:    f7fff999    ....    BL       HAL_DMAC_Wait_Done ; 0xab4
        0x00001782:    f7fff829    ..).    BL       HAL_DMAC_Get_Busy_Channel ; 0x7d8
        0x00001786:    f88d0050    ..P.    STRB     r0,[sp,#0x50]
        0x0000178a:    f89d1050    ..P.    LDRB     r1,[sp,#0x50]
        0x0000178e:    a013        ..      ADR      r0,{pc}+0x4e ; 0x17dc
        0x00001790:    f7fefd38    ..8.    BL       __2printf ; 0x204
        0x00001794:    2400        .$      MOVS     r4,#0
        0x00001796:    4621        !F      MOV      r1,r4
        0x00001798:    f8552024    U.$     LDR      r2,[r5,r4,LSL #2]
        0x0000179c:    a013        ..      ADR      r0,{pc}+0x50 ; 0x17ec
        0x0000179e:    f7fefd31    ..1.    BL       __2printf ; 0x204
        0x000017a2:    1c64        d.      ADDS     r4,r4,#1
        0x000017a4:    2c0a        .,      CMP      r4,#0xa
        0x000017a6:    d3f6        ..      BCC      0x1796 ; mem2mem + 174
        0x000017a8:    b016        ..      ADD      sp,sp,#0x58
        0x000017aa:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000017ac:    5f667562    buf_    DCD    1600550242
        0x000017b0:    615f7874    tx_a    DCD    1633646708
        0x000017b4:    64616568    head    DCD    1684104552
        0x000017b8:    5d64255b    [%d]    DCD    1566844251
        0x000017bc:    0a64253d    =%d.    DCD    174335293
        0x000017c0:    00000000    ....    DCD    0
        0x000017c4:    5f667562    buf_    DCD    1600550242
        0x000017c8:    615f7872    rx_a    DCD    1633646706
        0x000017cc:    64616568    head    DCD    1684104552
        0x000017d0:    5d64255b    [%d]    DCD    1566844251
        0x000017d4:    0a64253d    =%d.    DCD    174335293
        0x000017d8:    00000000    ....    DCD    0
        0x000017dc:    79737562    busy    DCD    2037609826
        0x000017e0:    74617473    stat    DCD    1952543859
        0x000017e4:    64253d65    e=%d    DCD    1680162149
        0x000017e8:    0000000a    ....    DCD    10
        0x000017ec:    5f667562    buf_    DCD    1600550242
        0x000017f0:    655f7872    rx_e    DCD    1700755570
        0x000017f4:    255b646e    nd[%    DCD    626746478
        0x000017f8:    253d5d64    d]=%    DCD    624778596
        0x000017fc:    00000a64    d...    DCD    2660
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001800:    4901        .I      LDR      r1,[pc,#4] ; [0x1808] = 0x40020000
        0x00001802:    6008        .`      STR      r0,[r1,#0]
        0x00001804:    4770        pG      BX       lr
    $d
        0x00001806:    0000        ..      DCW    0
        0x00001808:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x0000180c:    4903        .I      LDR      r1,[pc,#12] ; [0x181c] = 0x40020000
        0x0000180e:    6849        Ih      LDR      r1,[r1,#4]
        0x00001810:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001814:    4a01        .J      LDR      r2,[pc,#4] ; [0x181c] = 0x40020000
        0x00001816:    6051        Q`      STR      r1,[r2,#4]
        0x00001818:    4770        pG      BX       lr
    $d
        0x0000181a:    0000        ..      DCW    0
        0x0000181c:    40020000    ...@    DCD    1073872896
    $t
    i.test_gpio
    test_gpio
        0x00001820:    2500        .%      MOVS     r5,#0
        0x00001822:    f7ffff61    ..a.    BL       mem2mem ; 0x16e8
        0x00001826:    492e        .I      LDR      r1,[pc,#184] ; [0x18e0] = 0x20008000
        0x00001828:    2000        .       MOVS     r0,#0
        0x0000182a:    148a        ..      ASRS     r2,r1,#18
        0x0000182c:    f8410020    A. .    STR      r0,[r1,r0,LSL #2]
        0x00001830:    1c40        @.      ADDS     r0,r0,#1
        0x00001832:    4290        .B      CMP      r0,r2
        0x00001834:    d3fa        ..      BCC      0x182c ; test_gpio + 12
        0x00001836:    2400        .$      MOVS     r4,#0
        0x00001838:    4688        .F      MOV      r8,r1
        0x0000183a:    4691        .F      MOV      r9,r2
        0x0000183c:    f8580024    X.$.    LDR      r0,[r8,r4,LSL #2]
        0x00001840:    4621        !F      MOV      r1,r4
        0x00001842:    b287        ..      UXTH     r7,r0
        0x00001844:    463a        :F      MOV      r2,r7
        0x00001846:    a027        '.      ADR      r0,{pc}+0x9e ; 0x18e4
        0x00001848:    f7fefcdc    ....    BL       __2printf ; 0x204
        0x0000184c:    42bc        .B      CMP      r4,r7
        0x0000184e:    d00a        ..      BEQ      0x1866 ; test_gpio + 70
        0x00001850:    1ca2        ..      ADDS     r2,r4,#2
        0x00001852:    4621        !F      MOV      r1,r4
        0x00001854:    a028        (.      ADR      r0,{pc}+0xa4 ; 0x18f8
        0x00001856:    1c6d        m.      ADDS     r5,r5,#1
        0x00001858:    f7fefcd4    ....    BL       __2printf ; 0x204
        0x0000185c:    463a        :F      MOV      r2,r7
        0x0000185e:    4621        !F      MOV      r1,r4
        0x00001860:    a020         .      ADR      r0,{pc}+0x84 ; 0x18e4
        0x00001862:    f7fefccf    ....    BL       __2printf ; 0x204
        0x00001866:    1c64        d.      ADDS     r4,r4,#1
        0x00001868:    454c        LE      CMP      r4,r9
        0x0000186a:    d3e7        ..      BCC      0x183c ; test_gpio + 28
        0x0000186c:    b10d        ..      CBZ      r5,0x1872 ; test_gpio + 82
        0x0000186e:    a027        '.      ADR      r0,{pc}+0x9e ; 0x190c
        0x00001870:    e000        ..      B        0x1874 ; test_gpio + 84
        0x00001872:    a02b        +.      ADR      r0,{pc}+0xae ; 0x1920
        0x00001874:    f7fefcc6    ....    BL       __2printf ; 0x204
        0x00001878:    2001        .       MOVS     r0,#1
        0x0000187a:    4631        1F      MOV      r1,r6
        0x0000187c:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001880:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00001884:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x00001888:    460c        .F      MOV      r4,r1
        0x0000188a:    2010        .       MOVS     r0,#0x10
        0x0000188c:    f7fff91e    ....    BL       HAL_GPIO_Init ; 0xacc
        0x00001890:    4621        !F      MOV      r1,r4
        0x00001892:    2011        .       MOVS     r0,#0x11
        0x00001894:    f7fff91a    ....    BL       HAL_GPIO_Init ; 0xacc
        0x00001898:    f44f777a    O.zw    MOV      r7,#0x3e8
        0x0000189c:    f2413688    A..6    MOV      r6,#0x1388
        0x000018a0:    2101        .!      MOVS     r1,#1
        0x000018a2:    2010        .       MOVS     r0,#0x10
        0x000018a4:    f7fff9d2    ....    BL       HAL_GPIO_WritePin ; 0xc4c
        0x000018a8:    2101        .!      MOVS     r1,#1
        0x000018aa:    2011        .       MOVS     r0,#0x11
        0x000018ac:    f7fff9ce    ....    BL       HAL_GPIO_WritePin ; 0xc4c
        0x000018b0:    4638        8F      MOV      r0,r7
        0x000018b2:    4634        4F      MOV      r4,r6
        0x000018b4:    1e64        d.      SUBS     r4,r4,#1
        0x000018b6:    d1fd        ..      BNE      0x18b4 ; test_gpio + 148
        0x000018b8:    1e40        @.      SUBS     r0,r0,#1
        0x000018ba:    d1fa        ..      BNE      0x18b2 ; test_gpio + 146
        0x000018bc:    2100        .!      MOVS     r1,#0
        0x000018be:    2010        .       MOVS     r0,#0x10
        0x000018c0:    f7fff9c4    ....    BL       HAL_GPIO_WritePin ; 0xc4c
        0x000018c4:    2100        .!      MOVS     r1,#0
        0x000018c6:    2011        .       MOVS     r0,#0x11
        0x000018c8:    f7fff9c0    ....    BL       HAL_GPIO_WritePin ; 0xc4c
        0x000018cc:    4638        8F      MOV      r0,r7
        0x000018ce:    4635        5F      MOV      r5,r6
        0x000018d0:    1e6d        m.      SUBS     r5,r5,#1
        0x000018d2:    d1fd        ..      BNE      0x18d0 ; test_gpio + 176
        0x000018d4:    1e40        @.      SUBS     r0,r0,#1
        0x000018d6:    d1fa        ..      BNE      0x18ce ; test_gpio + 174
        0x000018d8:    a015        ..      ADR      r0,{pc}+0x58 ; 0x1930
        0x000018da:    f7fefc93    ....    BL       __2printf ; 0x204
        0x000018de:    e7df        ..      B        0x18a0 ; test_gpio + 128
    $d
        0x000018e0:    20008000    ...     DCD    536903680
        0x000018e4:    415f6472    rd_A    DCD    1096770674
        0x000018e8:    255b4248    HB[%    DCD    626737736
        0x000018ec:    3d205d64    d] =    DCD    1025531236
        0x000018f0:    20642520     %d     DCD    543434016
        0x000018f4:    00000d0a    ....    DCD    3338
        0x000018f8:    415f7277    wr_A    DCD    1096774263
        0x000018fc:    255b4248    HB[%    DCD    626737736
        0x00001900:    3d205d64    d] =    DCD    1025531236
        0x00001904:    20642520     %d     DCD    543434016
        0x00001908:    00000d0a    ....    DCD    3338
        0x0000190c:    6f6d654d    Memo    DCD    1869440333
        0x00001910:    54207972    ry T    DCD    1411414386
        0x00001914:    20747365    est     DCD    544502629
        0x00001918:    6f727245    Erro    DCD    1869771333
        0x0000191c:    00000a72    r...    DCD    2674
        0x00001920:    6f6d654d    Memo    DCD    1869440333
        0x00001924:    54207972    ry T    DCD    1411414386
        0x00001928:    20747365    est     DCD    544502629
        0x0000192c:    000a6b4f    Ok..    DCD    682831
        0x00001930:    32666c45    Elf2    DCD    845573189
        0x00001934:    55434d20     MCU    DCD    1430474016
        0x00001938:    69755120     Qui    DCD    1769296160
        0x0000193c:    74736b63    ckst    DCD    1953721187
        0x00001940:    20747261    art     DCD    544502369
        0x00001944:    6a6f7250    Proj    DCD    1785688656
        0x00001948:    7e746365    ect~    DCD    2121556837
        0x0000194c:    0000000a    ....    DCD    10
    $d.realdata
    .constdata
    _aV2C
        0x00001950:    33323130    0123    DCD    858927408
        0x00001954:    37363534    4567    DCD    926299444
        0x00001958:    42413938    89AB    DCD    1111570744
        0x0000195c:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001960:    00001980    ....    DCD    6528
        0x00001964:    20000000    ...     DCD    536870912
        0x00001968:    00000008    ....    DCD    8
        0x0000196c:    00000154    T...    DCD    340
        0x00001970:    00001988    ....    DCD    6536
        0x00001974:    20000008    ...     DCD    536870920
        0x00001978:    00000a18    ....    DCD    2584
        0x0000197c:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 6580 (0x19b4)
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
    File Offset : 6588 (0x19bc)
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
    File Offset : 6588 (0x19bc)
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
    File Offset : 8064 (0x1f80)
    Size        : 3128 bytes (0xc38)
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
    File Offset : 11192 (0x2bb8)
    Size        : 107320 bytes (0x1a338)
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
    File Offset : 118512 (0x1cef0)
    Size        : 13600 bytes (0x3520)
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
    File Offset : 132112 (0x20410)
    Size        : 6476 bytes (0x194c)
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
    File Offset : 138588 (0x21d5c)
    Size        : 30988 bytes (0x790c)
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
    File Offset : 169576 (0x29668)
    Size        : 1987 bytes (0x7c3)
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
    File Offset : 171564 (0x29e2c)
    Size        : 9088 bytes (0x2380)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 412
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 180652 (0x2c1ac)
    Size        : 7532 bytes (0x1d6c)
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
    File Offset : 188184 (0x2df18)
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
    File Offset : 188220 (0x2df3c)
    Size        : 11976 bytes (0x2ec8)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0

    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    ArmLink --strict --callgraph --load_addr_map_info --map --symbols --xref --diag_suppress=9931 --cpu=Cortex-M3 --list=.\Listings\demo.map --output=.\Objects\demo.axf --scatter=.\elf2_example.sct --keep=int_register.o(int_callback_area) --info=summarysizes,sizes,totals,unused,veneers

    D:\keil\ARM\ARMCC\Bin\..\lib\armlib\c_w.l
    D:\keil\ARM\ARMCC\Bin\..\lib\armlib\fz_ws.l
    D:\keil\ARM\ARMCC\Bin\..\lib\armlib\h_w.l
    D:\keil\ARM\ARMCC\Bin\..\lib\armlib\m_ws.l
    D:\keil\ARM\ARMCC\Bin\..\lib\armlib\vfpsupport.l
    Input Comments:
    
    main.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    system_elf2.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p2abc-3
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    system_elf2.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include --predefine="__UVISION
    
    
    int_register.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p1914-3
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    intc.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    
    debug.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    log.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    test_gpio.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_gpio.o --vfemode=force

    Input Comments:
    
    p13f4-3
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    test_gpio.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    
    
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

** Section #17

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 200196 (0x30e04)
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
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

