
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

    Program header offset: 158492 (0x00026b1c)
    Section header offset: 158524 (0x00026b3c)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 6724 bytes (0x1a44)
    Size in memory: 9324 bytes (0x246c)
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
    Size        : 6436 bytes (0x1924)
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
        0x0000014c:    000018d0    ....    DCD    6352
        0x00000150:    000018f0    ....    DCD    6384
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
        0x000001ae:    f001fbff    ....    BL       main ; 0x19b0
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
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x1405
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
        0x000001e0:    4804        .H      LDR      r0,[pc,#16] ; [0x1f4] = 0x20000530
        0x000001e2:    4905        .I      LDR      r1,[pc,#20] ; [0x1f8] = 0x20000a30
        0x000001e4:    4a05        .J      LDR      r2,[pc,#20] ; [0x1fc] = 0x20000630
        0x000001e6:    4b06        .K      LDR      r3,[pc,#24] ; [0x200] = 0x20000630
        0x000001e8:    4770        pG      BX       lr
    $d
        0x000001ea:    0000        ..      DCW    0
        0x000001ec:    00001405    ....    DCD    5125
        0x000001f0:    00000119    ....    DCD    281
        0x000001f4:    20000530    0..     DCD    536872240
        0x000001f8:    20000a30    0..     DCD    536873520
        0x000001fc:    20000630    0..     DCD    536872496
        0x00000200:    20000630    0..     DCD    536872496
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
        0x00000508:    4b07        .K      LDR      r3,[pc,#28] ; [0x528] = 0x13ef
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
        0x00000528:    000013ef    ....    DCD    5103
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
        0x00000620:    4800        .H      LDR      r0,[pc,#0] ; [0x624] = 0x200004cc
        0x00000622:    4770        pG      BX       lr
    $d
        0x00000624:    200004cc    ...     DCD    536872140
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
        0x0000064a:    f001f92d    ..-.    BL       __aeabi_assert ; 0x18a8
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
        0x0000069a:    f001f905    ....    BL       __aeabi_assert ; 0x18a8
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
        0x000006ea:    f001f8dd    ....    BL       __aeabi_assert ; 0x18a8
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
        0x0000073a:    f001f8b5    ....    BL       __aeabi_assert ; 0x18a8
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
        0x0000078a:    f001f88d    ....    BL       __aeabi_assert ; 0x18a8
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
        0x000007da:    f001f865    ..e.    BL       __aeabi_assert ; 0x18a8
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
        0x0000082a:    f001f83d    ..=.    BL       __aeabi_assert ; 0x18a8
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
        0x0000087a:    f001f815    ....    BL       __aeabi_assert ; 0x18a8
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
        0x000008ca:    f000ffed    ....    BL       __aeabi_assert ; 0x18a8
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
    i.GPIO_Init
    GPIO_Init
        0x00000908:    b508        ..      PUSH     {r3,lr}
        0x0000090a:    2001        .       MOVS     r0,#1
        0x0000090c:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000910:    f88d0001    ....    STRB     r0,[sp,#1]
        0x00000914:    f88d0002    ....    STRB     r0,[sp,#2]
        0x00000918:    2007        .       MOVS     r0,#7
        0x0000091a:    9900        ..      LDR      r1,[sp,#0]
        0x0000091c:    f000f801    ....    BL       HAL_GPIO_Init ; 0x922
        0x00000920:    bd08        ..      POP      {r3,pc}
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x00000922:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000924:    4604        .F      MOV      r4,r0
        0x00000926:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x0000092a:    4620         F      MOV      r0,r4
        0x0000092c:    f000f832    ..2.    BL       HAL_GPIO_SetDir ; 0x994
        0x00000930:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000934:    2801        .(      CMP      r0,#1
        0x00000936:    d105        ..      BNE      0x944 ; HAL_GPIO_Init + 34
        0x00000938:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x0000093c:    4620         F      MOV      r0,r4
        0x0000093e:    f000f8e5    ....    BL       HAL_GPIO_WritePin ; 0xb0c
        0x00000942:    e009        ..      B        0x958 ; HAL_GPIO_Init + 54
        0x00000944:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x00000948:    4620         F      MOV      r0,r4
        0x0000094a:    f000f807    ....    BL       HAL_GPIO_SetDebounce ; 0x95c
        0x0000094e:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00000952:    4620         F      MOV      r0,r4
        0x00000954:    f000f8a8    ....    BL       HAL_GPIO_TrigType ; 0xaa8
        0x00000958:    bd1c        ..      POP      {r2-r4,pc}
        0x0000095a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x0000095c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000095e:    460a        .F      MOV      r2,r1
        0x00000960:    bf00        ..      NOP      
        0x00000962:    4b0b        .K      LDR      r3,[pc,#44] ; [0x990] = 0x40007000
        0x00000964:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x00000966:    b29b        ..      UXTH     r3,r3
        0x00000968:    4619        .F      MOV      r1,r3
        0x0000096a:    2a01        .*      CMP      r2,#1
        0x0000096c:    d103        ..      BNE      0x976 ; HAL_GPIO_SetDebounce + 26
        0x0000096e:    2301        .#      MOVS     r3,#1
        0x00000970:    4083        .@      LSLS     r3,r3,r0
        0x00000972:    4319        .C      ORRS     r1,r1,r3
        0x00000974:    e002        ..      B        0x97c ; HAL_GPIO_SetDebounce + 32
        0x00000976:    2301        .#      MOVS     r3,#1
        0x00000978:    4083        .@      LSLS     r3,r3,r0
        0x0000097a:    4399        .C      BICS     r1,r1,r3
        0x0000097c:    b28b        ..      UXTH     r3,r1
        0x0000097e:    4c04        .L      LDR      r4,[pc,#16] ; [0x990] = 0x40007000
        0x00000980:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000982:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000986:    4d02        .M      LDR      r5,[pc,#8] ; [0x990] = 0x40007000
        0x00000988:    64ac        .d      STR      r4,[r5,#0x48]
        0x0000098a:    bf00        ..      NOP      
        0x0000098c:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x0000098e:    0000        ..      DCW    0
        0x00000990:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000994:    b530        0.      PUSH     {r4,r5,lr}
        0x00000996:    4602        .F      MOV      r2,r0
        0x00000998:    2a10        .*      CMP      r2,#0x10
        0x0000099a:    da16        ..      BGE      0x9ca ; HAL_GPIO_SetDir + 54
        0x0000099c:    bf00        ..      NOP      
        0x0000099e:    4b19        .K      LDR      r3,[pc,#100] ; [0xa04] = 0x40007000
        0x000009a0:    685b        [h      LDR      r3,[r3,#4]
        0x000009a2:    b298        ..      UXTH     r0,r3
        0x000009a4:    bf00        ..      NOP      
        0x000009a6:    2901        .)      CMP      r1,#1
        0x000009a8:    d103        ..      BNE      0x9b2 ; HAL_GPIO_SetDir + 30
        0x000009aa:    2301        .#      MOVS     r3,#1
        0x000009ac:    4093        .@      LSLS     r3,r3,r2
        0x000009ae:    4318        .C      ORRS     r0,r0,r3
        0x000009b0:    e002        ..      B        0x9b8 ; HAL_GPIO_SetDir + 36
        0x000009b2:    2301        .#      MOVS     r3,#1
        0x000009b4:    4093        .@      LSLS     r3,r3,r2
        0x000009b6:    4398        .C      BICS     r0,r0,r3
        0x000009b8:    b283        ..      UXTH     r3,r0
        0x000009ba:    4c12        .L      LDR      r4,[pc,#72] ; [0xa04] = 0x40007000
        0x000009bc:    6864        dh      LDR      r4,[r4,#4]
        0x000009be:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000009c2:    4d10        .M      LDR      r5,[pc,#64] ; [0xa04] = 0x40007000
        0x000009c4:    606c        l`      STR      r4,[r5,#4]
        0x000009c6:    bf00        ..      NOP      
        0x000009c8:    e01b        ..      B        0xa02 ; HAL_GPIO_SetDir + 110
        0x000009ca:    bf00        ..      NOP      
        0x000009cc:    4b0d        .K      LDR      r3,[pc,#52] ; [0xa04] = 0x40007000
        0x000009ce:    691b        .i      LDR      r3,[r3,#0x10]
        0x000009d0:    b298        ..      UXTH     r0,r3
        0x000009d2:    bf00        ..      NOP      
        0x000009d4:    2901        .)      CMP      r1,#1
        0x000009d6:    d106        ..      BNE      0x9e6 ; HAL_GPIO_SetDir + 82
        0x000009d8:    f1a20310    ....    SUB      r3,r2,#0x10
        0x000009dc:    2401        .$      MOVS     r4,#1
        0x000009de:    fa04f303    ....    LSL      r3,r4,r3
        0x000009e2:    4318        .C      ORRS     r0,r0,r3
        0x000009e4:    e004        ..      B        0x9f0 ; HAL_GPIO_SetDir + 92
        0x000009e6:    f1a20310    ....    SUB      r3,r2,#0x10
        0x000009ea:    2401        .$      MOVS     r4,#1
        0x000009ec:    409c        .@      LSLS     r4,r4,r3
        0x000009ee:    43a0        .C      BICS     r0,r0,r4
        0x000009f0:    b283        ..      UXTH     r3,r0
        0x000009f2:    4c04        .L      LDR      r4,[pc,#16] ; [0xa04] = 0x40007000
        0x000009f4:    6924        $i      LDR      r4,[r4,#0x10]
        0x000009f6:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000009fa:    4d02        .M      LDR      r5,[pc,#8] ; [0xa04] = 0x40007000
        0x000009fc:    612c        ,a      STR      r4,[r5,#0x10]
        0x000009fe:    bf00        ..      NOP      
        0x00000a00:    bf00        ..      NOP      
        0x00000a02:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000a04:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000a08:    b530        0.      PUSH     {r4,r5,lr}
        0x00000a0a:    460a        .F      MOV      r2,r1
        0x00000a0c:    bf00        ..      NOP      
        0x00000a0e:    4b0b        .K      LDR      r3,[pc,#44] ; [0xa3c] = 0x40007000
        0x00000a10:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000a12:    b29b        ..      UXTH     r3,r3
        0x00000a14:    4619        .F      MOV      r1,r3
        0x00000a16:    2a01        .*      CMP      r2,#1
        0x00000a18:    d103        ..      BNE      0xa22 ; HAL_GPIO_SetPly + 26
        0x00000a1a:    2301        .#      MOVS     r3,#1
        0x00000a1c:    4083        .@      LSLS     r3,r3,r0
        0x00000a1e:    4319        .C      ORRS     r1,r1,r3
        0x00000a20:    e002        ..      B        0xa28 ; HAL_GPIO_SetPly + 32
        0x00000a22:    2301        .#      MOVS     r3,#1
        0x00000a24:    4083        .@      LSLS     r3,r3,r0
        0x00000a26:    4399        .C      BICS     r1,r1,r3
        0x00000a28:    b28b        ..      UXTH     r3,r1
        0x00000a2a:    4c04        .L      LDR      r4,[pc,#16] ; [0xa3c] = 0x40007000
        0x00000a2c:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000a2e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000a32:    4d02        .M      LDR      r5,[pc,#8] ; [0xa3c] = 0x40007000
        0x00000a34:    63ec        .c      STR      r4,[r5,#0x3c]
        0x00000a36:    bf00        ..      NOP      
        0x00000a38:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000a3a:    0000        ..      DCW    0
        0x00000a3c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TogglePin
    HAL_GPIO_TogglePin
        0x00000a40:    b570        p.      PUSH     {r4-r6,lr}
        0x00000a42:    4604        .F      MOV      r4,r0
        0x00000a44:    2c10        .,      CMP      r4,#0x10
        0x00000a46:    da15        ..      BGE      0xa74 ; HAL_GPIO_TogglePin + 52
        0x00000a48:    bf00        ..      NOP      
        0x00000a4a:    4816        .H      LDR      r0,[pc,#88] ; [0xaa4] = 0x40007000
        0x00000a4c:    6d00        .m      LDR      r0,[r0,#0x50]
        0x00000a4e:    b280        ..      UXTH     r0,r0
        0x00000a50:    4120         A      ASRS     r0,r0,r4
        0x00000a52:    f0000501    ....    AND      r5,r0,#1
        0x00000a56:    bf00        ..      NOP      
        0x00000a58:    4812        .H      LDR      r0,[pc,#72] ; [0xaa4] = 0x40007000
        0x00000a5a:    6800        .h      LDR      r0,[r0,#0]
        0x00000a5c:    b280        ..      UXTH     r0,r0
        0x00000a5e:    2101        .!      MOVS     r1,#1
        0x00000a60:    40a1        .@      LSLS     r1,r1,r4
        0x00000a62:    4388        .C      BICS     r0,r0,r1
        0x00000a64:    43e9        .C      MVNS     r1,r5
        0x00000a66:    40a1        .@      LSLS     r1,r1,r4
        0x00000a68:    ea400601    @...    ORR      r6,r0,r1
        0x00000a6c:    b2b0        ..      UXTH     r0,r6
        0x00000a6e:    f000ff51    ..Q.    BL       gpio_portadataregister_setf ; 0x1914
        0x00000a72:    e016        ..      B        0xaa2 ; HAL_GPIO_TogglePin + 98
        0x00000a74:    bf00        ..      NOP      
        0x00000a76:    480b        .H      LDR      r0,[pc,#44] ; [0xaa4] = 0x40007000
        0x00000a78:    6d40        @m      LDR      r0,[r0,#0x54]
        0x00000a7a:    b280        ..      UXTH     r0,r0
        0x00000a7c:    f1a40110    ....    SUB      r1,r4,#0x10
        0x00000a80:    4108        .A      ASRS     r0,r0,r1
        0x00000a82:    f0000501    ....    AND      r5,r0,#1
        0x00000a86:    bf00        ..      NOP      
        0x00000a88:    4806        .H      LDR      r0,[pc,#24] ; [0xaa4] = 0x40007000
        0x00000a8a:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000a8c:    b280        ..      UXTH     r0,r0
        0x00000a8e:    2201        ."      MOVS     r2,#1
        0x00000a90:    408a        .@      LSLS     r2,r2,r1
        0x00000a92:    4390        .C      BICS     r0,r0,r2
        0x00000a94:    43ea        .C      MVNS     r2,r5
        0x00000a96:    408a        .@      LSLS     r2,r2,r1
        0x00000a98:    ea400602    @...    ORR      r6,r0,r2
        0x00000a9c:    b2b0        ..      UXTH     r0,r6
        0x00000a9e:    f000ff43    ..C.    BL       gpio_portbdataregister_setf ; 0x1928
        0x00000aa2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000aa4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000aa8:    b570        p.      PUSH     {r4-r6,lr}
        0x00000aaa:    4605        .F      MOV      r5,r0
        0x00000aac:    460c        .F      MOV      r4,r1
        0x00000aae:    b134        4.      CBZ      r4,0xabe ; HAL_GPIO_TrigType + 22
        0x00000ab0:    2c01        .,      CMP      r4,#1
        0x00000ab2:    d00d        ..      BEQ      0xad0 ; HAL_GPIO_TrigType + 40
        0x00000ab4:    2c02        .,      CMP      r4,#2
        0x00000ab6:    d014        ..      BEQ      0xae2 ; HAL_GPIO_TrigType + 58
        0x00000ab8:    2c03        .,      CMP      r4,#3
        0x00000aba:    d124        $.      BNE      0xb06 ; HAL_GPIO_TrigType + 94
        0x00000abc:    e01a        ..      B        0xaf4 ; HAL_GPIO_TrigType + 76
        0x00000abe:    2100        .!      MOVS     r1,#0
        0x00000ac0:    4628        (F      MOV      r0,r5
        0x00000ac2:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0xb68
        0x00000ac6:    2100        .!      MOVS     r1,#0
        0x00000ac8:    4628        (F      MOV      r0,r5
        0x00000aca:    f7ffff9d    ....    BL       HAL_GPIO_SetPly ; 0xa08
        0x00000ace:    e01a        ..      B        0xb06 ; HAL_GPIO_TrigType + 94
        0x00000ad0:    2100        .!      MOVS     r1,#0
        0x00000ad2:    4628        (F      MOV      r0,r5
        0x00000ad4:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0xb68
        0x00000ad8:    2101        .!      MOVS     r1,#1
        0x00000ada:    4628        (F      MOV      r0,r5
        0x00000adc:    f7ffff94    ....    BL       HAL_GPIO_SetPly ; 0xa08
        0x00000ae0:    e011        ..      B        0xb06 ; HAL_GPIO_TrigType + 94
        0x00000ae2:    2101        .!      MOVS     r1,#1
        0x00000ae4:    4628        (F      MOV      r0,r5
        0x00000ae6:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0xb68
        0x00000aea:    2100        .!      MOVS     r1,#0
        0x00000aec:    4628        (F      MOV      r0,r5
        0x00000aee:    f7ffff8b    ....    BL       HAL_GPIO_SetPly ; 0xa08
        0x00000af2:    e008        ..      B        0xb06 ; HAL_GPIO_TrigType + 94
        0x00000af4:    2101        .!      MOVS     r1,#1
        0x00000af6:    4628        (F      MOV      r0,r5
        0x00000af8:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0xb68
        0x00000afc:    2101        .!      MOVS     r1,#1
        0x00000afe:    4628        (F      MOV      r0,r5
        0x00000b00:    f7ffff82    ....    BL       HAL_GPIO_SetPly ; 0xa08
        0x00000b04:    bf00        ..      NOP      
        0x00000b06:    bf00        ..      NOP      
        0x00000b08:    bd70        p.      POP      {r4-r6,pc}
        0x00000b0a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000b0c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b0e:    4605        .F      MOV      r5,r0
        0x00000b10:    460e        .F      MOV      r6,r1
        0x00000b12:    2d10        .-      CMP      r5,#0x10
        0x00000b14:    da10        ..      BGE      0xb38 ; HAL_GPIO_WritePin + 44
        0x00000b16:    bf00        ..      NOP      
        0x00000b18:    4812        .H      LDR      r0,[pc,#72] ; [0xb64] = 0x40007000
        0x00000b1a:    6800        .h      LDR      r0,[r0,#0]
        0x00000b1c:    b284        ..      UXTH     r4,r0
        0x00000b1e:    bf00        ..      NOP      
        0x00000b20:    b91e        ..      CBNZ     r6,0xb2a ; HAL_GPIO_WritePin + 30
        0x00000b22:    2001        .       MOVS     r0,#1
        0x00000b24:    40a8        .@      LSLS     r0,r0,r5
        0x00000b26:    4384        .C      BICS     r4,r4,r0
        0x00000b28:    e002        ..      B        0xb30 ; HAL_GPIO_WritePin + 36
        0x00000b2a:    2001        .       MOVS     r0,#1
        0x00000b2c:    40a8        .@      LSLS     r0,r0,r5
        0x00000b2e:    4304        .C      ORRS     r4,r4,r0
        0x00000b30:    b2a0        ..      UXTH     r0,r4
        0x00000b32:    f000feef    ....    BL       gpio_portadataregister_setf ; 0x1914
        0x00000b36:    e014        ..      B        0xb62 ; HAL_GPIO_WritePin + 86
        0x00000b38:    bf00        ..      NOP      
        0x00000b3a:    480a        .H      LDR      r0,[pc,#40] ; [0xb64] = 0x40007000
        0x00000b3c:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000b3e:    b284        ..      UXTH     r4,r0
        0x00000b40:    bf00        ..      NOP      
        0x00000b42:    b92e        ..      CBNZ     r6,0xb50 ; HAL_GPIO_WritePin + 68
        0x00000b44:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000b48:    2101        .!      MOVS     r1,#1
        0x00000b4a:    4081        .@      LSLS     r1,r1,r0
        0x00000b4c:    438c        .C      BICS     r4,r4,r1
        0x00000b4e:    e005        ..      B        0xb5c ; HAL_GPIO_WritePin + 80
        0x00000b50:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000b54:    2101        .!      MOVS     r1,#1
        0x00000b56:    fa01f000    ....    LSL      r0,r1,r0
        0x00000b5a:    4304        .C      ORRS     r4,r4,r0
        0x00000b5c:    b2a0        ..      UXTH     r0,r4
        0x00000b5e:    f000fee3    ....    BL       gpio_portbdataregister_setf ; 0x1928
        0x00000b62:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000b64:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000b68:    b530        0.      PUSH     {r4,r5,lr}
        0x00000b6a:    460a        .F      MOV      r2,r1
        0x00000b6c:    bf00        ..      NOP      
        0x00000b6e:    4b0b        .K      LDR      r3,[pc,#44] ; [0xb9c] = 0x40007000
        0x00000b70:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000b72:    b29b        ..      UXTH     r3,r3
        0x00000b74:    4619        .F      MOV      r1,r3
        0x00000b76:    2a01        .*      CMP      r2,#1
        0x00000b78:    d103        ..      BNE      0xb82 ; HAL_GPIO_setIrqLevel + 26
        0x00000b7a:    2301        .#      MOVS     r3,#1
        0x00000b7c:    4083        .@      LSLS     r3,r3,r0
        0x00000b7e:    4319        .C      ORRS     r1,r1,r3
        0x00000b80:    e002        ..      B        0xb88 ; HAL_GPIO_setIrqLevel + 32
        0x00000b82:    2301        .#      MOVS     r3,#1
        0x00000b84:    4083        .@      LSLS     r3,r3,r0
        0x00000b86:    4399        .C      BICS     r1,r1,r3
        0x00000b88:    b28b        ..      UXTH     r3,r1
        0x00000b8a:    4c04        .L      LDR      r4,[pc,#16] ; [0xb9c] = 0x40007000
        0x00000b8c:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000b8e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000b92:    4d02        .M      LDR      r5,[pc,#8] ; [0xb9c] = 0x40007000
        0x00000b94:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000b96:    bf00        ..      NOP      
        0x00000b98:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000b9a:    0000        ..      DCW    0
        0x00000b9c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_RTC_ClearIrq
    HAL_RTC_ClearIrq
        0x00000ba0:    bf00        ..      NOP      
        0x00000ba2:    4801        .H      LDR      r0,[pc,#4] ; [0xba8] = 0x40021000
        0x00000ba4:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ba6:    4770        pG      BX       lr
    $d
        0x00000ba8:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_Enable
    HAL_RTC_Enable
        0x00000bac:    bf00        ..      NOP      
        0x00000bae:    4904        .I      LDR      r1,[pc,#16] ; [0xbc0] = 0x40021000
        0x00000bb0:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000bb2:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00000bb6:    4a02        .J      LDR      r2,[pc,#8] ; [0xbc0] = 0x40021000
        0x00000bb8:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000bba:    bf00        ..      NOP      
        0x00000bbc:    4770        pG      BX       lr
    $d
        0x00000bbe:    0000        ..      DCW    0
        0x00000bc0:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_Init
    HAL_RTC_Init
        0x00000bc4:    b507        ..      PUSH     {r0-r2,lr}
        0x00000bc6:    9800        ..      LDR      r0,[sp,#0]
        0x00000bc8:    f000f832    ..2.    BL       HAL_RTC_SetMatchCounter ; 0xc30
        0x00000bcc:    9801        ..      LDR      r0,[sp,#4]
        0x00000bce:    f000f825    ..%.    BL       HAL_RTC_SetLoadCounter ; 0xc1c
        0x00000bd2:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00000bd6:    f000f835    ..5.    BL       HAL_RTC_Wrap ; 0xc44
        0x00000bda:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x00000bde:    f000f811    ....    BL       HAL_RTC_Irq_Mask ; 0xc04
        0x00000be2:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x00000be6:    f000f801    ....    BL       HAL_RTC_Irq_Enable ; 0xbec
        0x00000bea:    bd0e        ..      POP      {r1-r3,pc}
    i.HAL_RTC_Irq_Enable
    HAL_RTC_Irq_Enable
        0x00000bec:    bf00        ..      NOP      
        0x00000bee:    4904        .I      LDR      r1,[pc,#16] ; [0xc00] = 0x40021000
        0x00000bf0:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000bf2:    f3600100    `...    BFI      r1,r0,#0,#1
        0x00000bf6:    4a02        .J      LDR      r2,[pc,#8] ; [0xc00] = 0x40021000
        0x00000bf8:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000bfa:    bf00        ..      NOP      
        0x00000bfc:    4770        pG      BX       lr
    $d
        0x00000bfe:    0000        ..      DCW    0
        0x00000c00:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_Irq_Mask
    HAL_RTC_Irq_Mask
        0x00000c04:    bf00        ..      NOP      
        0x00000c06:    4904        .I      LDR      r1,[pc,#16] ; [0xc18] = 0x40021000
        0x00000c08:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000c0a:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x00000c0e:    4a02        .J      LDR      r2,[pc,#8] ; [0xc18] = 0x40021000
        0x00000c10:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000c12:    bf00        ..      NOP      
        0x00000c14:    4770        pG      BX       lr
    $d
        0x00000c16:    0000        ..      DCW    0
        0x00000c18:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_SetLoadCounter
    HAL_RTC_SetLoadCounter
        0x00000c1c:    bf00        ..      NOP      
        0x00000c1e:    4903        .I      LDR      r1,[pc,#12] ; [0xc2c] = 0x40021000
        0x00000c20:    6889        .h      LDR      r1,[r1,#8]
        0x00000c22:    4902        .I      LDR      r1,[pc,#8] ; [0xc2c] = 0x40021000
        0x00000c24:    6088        .`      STR      r0,[r1,#8]
        0x00000c26:    bf00        ..      NOP      
        0x00000c28:    4770        pG      BX       lr
    $d
        0x00000c2a:    0000        ..      DCW    0
        0x00000c2c:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_SetMatchCounter
    HAL_RTC_SetMatchCounter
        0x00000c30:    bf00        ..      NOP      
        0x00000c32:    4903        .I      LDR      r1,[pc,#12] ; [0xc40] = 0x40021000
        0x00000c34:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c36:    4902        .I      LDR      r1,[pc,#8] ; [0xc40] = 0x40021000
        0x00000c38:    6048        H`      STR      r0,[r1,#4]
        0x00000c3a:    bf00        ..      NOP      
        0x00000c3c:    4770        pG      BX       lr
    $d
        0x00000c3e:    0000        ..      DCW    0
        0x00000c40:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_RTC_Wrap
    HAL_RTC_Wrap
        0x00000c44:    bf00        ..      NOP      
        0x00000c46:    4904        .I      LDR      r1,[pc,#16] ; [0xc58] = 0x40021000
        0x00000c48:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000c4a:    f36001c3    `...    BFI      r1,r0,#3,#1
        0x00000c4e:    4a02        .J      LDR      r2,[pc,#8] ; [0xc58] = 0x40021000
        0x00000c50:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000c52:    bf00        ..      NOP      
        0x00000c54:    4770        pG      BX       lr
    $d
        0x00000c56:    0000        ..      DCW    0
        0x00000c58:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000c5c:    bf00        ..      NOP      
        0x00000c5e:    4904        .I      LDR      r1,[pc,#16] ; [0xc70] = 0x40020000
        0x00000c60:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000c62:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000c66:    4a02        .J      LDR      r2,[pc,#8] ; [0xc70] = 0x40020000
        0x00000c68:    6111        .a      STR      r1,[r2,#0x10]
        0x00000c6a:    bf00        ..      NOP      
        0x00000c6c:    4770        pG      BX       lr
    $d
        0x00000c6e:    0000        ..      DCW    0
        0x00000c70:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000c74:    b510        ..      PUSH     {r4,lr}
        0x00000c76:    4604        .F      MOV      r4,r0
        0x00000c78:    1e60        `.      SUBS     r0,r4,#1
        0x00000c7a:    280f        .(      CMP      r0,#0xf
        0x00000c7c:    dc00        ..      BGT      0xc80 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000c7e:    e004        ..      B        0xc8a ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000c80:    2225        %"      MOVS     r2,#0x25
        0x00000c82:    a108        ..      ADR      r1,{pc}+0x22 ; 0xca4
        0x00000c84:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xcc4
        0x00000c86:    f000fe0f    ....    BL       __aeabi_assert ; 0x18a8
        0x00000c8a:    1e61        a.      SUBS     r1,r4,#1
        0x00000c8c:    b2c8        ..      UXTB     r0,r1
        0x00000c8e:    4913        .I      LDR      r1,[pc,#76] ; [0xcdc] = 0x40020000
        0x00000c90:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c92:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000c96:    4a11        .J      LDR      r2,[pc,#68] ; [0xcdc] = 0x40020000
        0x00000c98:    6051        Q`      STR      r1,[r2,#4]
        0x00000c9a:    bf00        ..      NOP      
        0x00000c9c:    2001        .       MOVS     r0,#1
        0x00000c9e:    f000fea5    ....    BL       sysc_awo_div_update_set ; 0x19ec
        0x00000ca2:    bd10        ..      POP      {r4,pc}
    $d
        0x00000ca4:    735c2e2e    ..\s    DCD    1935420974
        0x00000ca8:    735c6b64    dk\s    DCD    1935436644
        0x00000cac:    735c6372    rc\s    DCD    1935434610
        0x00000cb0:    645c636f    oc\d    DCD    1683776367
        0x00000cb4:    65766972    rive    DCD    1702259058
        0x00000cb8:    79735c72    r\sy    DCD    2037603442
        0x00000cbc:    6e6f6373    scon    DCD    1852793715
        0x00000cc0:    0000632e    .c..    DCD    25390
        0x00000cc4:    62686128    (ahb    DCD    1651007784
        0x00000cc8:    7669645f    _div    DCD    1986618463
        0x00000ccc:    72656469    ider    DCD    1919247465
        0x00000cd0:    3c29312d    -1)<    DCD    1009332525
        0x00000cd4:    6678303d    =0xf    DCD    1719152701
        0x00000cd8:    00000000    ....    DCD    0
        0x00000cdc:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000ce0:    b510        ..      PUSH     {r4,lr}
        0x00000ce2:    4604        .F      MOV      r4,r0
        0x00000ce4:    1e60        `.      SUBS     r0,r4,#1
        0x00000ce6:    280f        .(      CMP      r0,#0xf
        0x00000ce8:    dc00        ..      BGT      0xcec ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000cea:    e004        ..      B        0xcf6 ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000cec:    222c        ,"      MOVS     r2,#0x2c
        0x00000cee:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xd18
        0x00000cf0:    a011        ..      ADR      r0,{pc}+0x48 ; 0xd38
        0x00000cf2:    f000fdd9    ....    BL       __aeabi_assert ; 0x18a8
        0x00000cf6:    1e61        a.      SUBS     r1,r4,#1
        0x00000cf8:    b2c8        ..      UXTB     r0,r1
        0x00000cfa:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000cfe:    6849        Ih      LDR      r1,[r1,#4]
        0x00000d00:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000d04:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000d08:    6051        Q`      STR      r1,[r2,#4]
        0x00000d0a:    bf00        ..      NOP      
        0x00000d0c:    2001        .       MOVS     r0,#1
        0x00000d0e:    0781        ..      LSLS     r1,r0,#30
        0x00000d10:    6008        .`      STR      r0,[r1,#0]
        0x00000d12:    bf00        ..      NOP      
        0x00000d14:    bd10        ..      POP      {r4,pc}
    $d
        0x00000d16:    0000        ..      DCW    0
        0x00000d18:    735c2e2e    ..\s    DCD    1935420974
        0x00000d1c:    735c6b64    dk\s    DCD    1935436644
        0x00000d20:    735c6372    rc\s    DCD    1935434610
        0x00000d24:    645c636f    oc\d    DCD    1683776367
        0x00000d28:    65766972    rive    DCD    1702259058
        0x00000d2c:    79735c72    r\sy    DCD    2037603442
        0x00000d30:    6e6f6373    scon    DCD    1852793715
        0x00000d34:    0000632e    .c..    DCD    25390
        0x00000d38:    62706128    (apb    DCD    1651532072
        0x00000d3c:    69645f30    0_di    DCD    1768185648
        0x00000d40:    65646976    vide    DCD    1701079414
        0x00000d44:    29312d72    r-1)    DCD    691088754
        0x00000d48:    78303d3c    <=0x    DCD    2016427324
        0x00000d4c:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000d50:    b510        ..      PUSH     {r4,lr}
        0x00000d52:    4604        .F      MOV      r4,r0
        0x00000d54:    1e60        `.      SUBS     r0,r4,#1
        0x00000d56:    280f        .(      CMP      r0,#0xf
        0x00000d58:    dc00        ..      BGT      0xd5c ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000d5a:    e004        ..      B        0xd66 ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000d5c:    2234        4"      MOVS     r2,#0x34
        0x00000d5e:    a108        ..      ADR      r1,{pc}+0x22 ; 0xd80
        0x00000d60:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xda0
        0x00000d62:    f000fda1    ....    BL       __aeabi_assert ; 0x18a8
        0x00000d66:    1e61        a.      SUBS     r1,r4,#1
        0x00000d68:    b2c8        ..      UXTB     r0,r1
        0x00000d6a:    4913        .I      LDR      r1,[pc,#76] ; [0xdb8] = 0x40020000
        0x00000d6c:    6849        Ih      LDR      r1,[r1,#4]
        0x00000d6e:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000d72:    4a11        .J      LDR      r2,[pc,#68] ; [0xdb8] = 0x40020000
        0x00000d74:    6051        Q`      STR      r1,[r2,#4]
        0x00000d76:    bf00        ..      NOP      
        0x00000d78:    2002        .       MOVS     r0,#2
        0x00000d7a:    f000fe37    ..7.    BL       sysc_awo_div_update_set ; 0x19ec
        0x00000d7e:    bd10        ..      POP      {r4,pc}
    $d
        0x00000d80:    735c2e2e    ..\s    DCD    1935420974
        0x00000d84:    735c6b64    dk\s    DCD    1935436644
        0x00000d88:    735c6372    rc\s    DCD    1935434610
        0x00000d8c:    645c636f    oc\d    DCD    1683776367
        0x00000d90:    65766972    rive    DCD    1702259058
        0x00000d94:    79735c72    r\sy    DCD    2037603442
        0x00000d98:    6e6f6373    scon    DCD    1852793715
        0x00000d9c:    0000632e    .c..    DCD    25390
        0x00000da0:    62706128    (apb    DCD    1651532072
        0x00000da4:    69645f31    1_di    DCD    1768185649
        0x00000da8:    65646976    vide    DCD    1701079414
        0x00000dac:    29312d72    r-1)    DCD    691088754
        0x00000db0:    78303d3c    <=0x    DCD    2016427324
        0x00000db4:    00000066    f...    DCD    102
        0x00000db8:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000dbc:    b570        p.      PUSH     {r4-r6,lr}
        0x00000dbe:    4605        .F      MOV      r5,r0
        0x00000dc0:    460c        .F      MOV      r4,r1
        0x00000dc2:    1e60        `.      SUBS     r0,r4,#1
        0x00000dc4:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000dc8:    da00        ..      BGE      0xdcc ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000dca:    e004        ..      B        0xdd6 ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000dcc:    223c        <"      MOVS     r2,#0x3c
        0x00000dce:    a112        ..      ADR      r1,{pc}+0x4a ; 0xe18
        0x00000dd0:    a019        ..      ADR      r0,{pc}+0x68 ; 0xe38
        0x00000dd2:    f000fd69    ..i.    BL       __aeabi_assert ; 0x18a8
        0x00000dd6:    2d01        .-      CMP      r5,#1
        0x00000dd8:    dc00        ..      BGT      0xddc ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000dda:    e004        ..      B        0xde6 ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000ddc:    223d        ="      MOVS     r2,#0x3d
        0x00000dde:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xe18
        0x00000de0:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xe50
        0x00000de2:    f000fd61    ..a.    BL       __aeabi_assert ; 0x18a8
        0x00000de6:    b935        5.      CBNZ     r5,0xdf6 ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000de8:    2000        .       MOVS     r0,#0
        0x00000dea:    f000fe05    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x19f8
        0x00000dee:    2004        .       MOVS     r0,#4
        0x00000df0:    f000fdfc    ....    BL       sysc_awo_div_update_set ; 0x19ec
        0x00000df4:    e00e        ..      B        0xe14 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000df6:    2c02        .,      CMP      r4,#2
        0x00000df8:    db00        ..      BLT      0xdfc ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000dfa:    e004        ..      B        0xe06 ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000dfc:    2247        G"      MOVS     r2,#0x47
        0x00000dfe:    a106        ..      ADR      r1,{pc}+0x1a ; 0xe18
        0x00000e00:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xe6c
        0x00000e02:    f000fd51    ..Q.    BL       __aeabi_assert ; 0x18a8
        0x00000e06:    1e61        a.      SUBS     r1,r4,#1
        0x00000e08:    b288        ..      UXTH     r0,r1
        0x00000e0a:    f000fdf5    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x19f8
        0x00000e0e:    2004        .       MOVS     r0,#4
        0x00000e10:    f000fdec    ....    BL       sysc_awo_div_update_set ; 0x19ec
        0x00000e14:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e16:    0000        ..      DCW    0
        0x00000e18:    735c2e2e    ..\s    DCD    1935420974
        0x00000e1c:    735c6b64    dk\s    DCD    1935436644
        0x00000e20:    735c6372    rc\s    DCD    1935434610
        0x00000e24:    645c636f    oc\d    DCD    1683776367
        0x00000e28:    65766972    rive    DCD    1702259058
        0x00000e2c:    79735c72    r\sy    DCD    2037603442
        0x00000e30:    6e6f6373    scon    DCD    1852793715
        0x00000e34:    0000632e    .c..    DCD    25390
        0x00000e38:    63747228    (rtc    DCD    1668575784
        0x00000e3c:    7669645f    _div    DCD    1986618463
        0x00000e40:    72656469    ider    DCD    1919247465
        0x00000e44:    3c29312d    -1)<    DCD    1009332525
        0x00000e48:    3178303d    =0x1    DCD    829960253
        0x00000e4c:    00666666    fff.    DCD    6710886
        0x00000e50:    5f637472    rtc_    DCD    1600353394
        0x00000e54:    3c637273    src<    DCD    1013150323
        0x00000e58:    6374723d    =rtc    DCD    1668575805
        0x00000e5c:    5f6b6c63    clk_    DCD    1600875619
        0x00000e60:    6d6f7266    from    DCD    1836020326
        0x00000e64:    6268615f    _ahb    DCD    1651007839
        0x00000e68:    00000000    ....    DCD    0
        0x00000e6c:    5f637472    rtc_    DCD    1600353394
        0x00000e70:    69766964    divi    DCD    1769367908
        0x00000e74:    3e726564    der>    DCD    1047684452
        0x00000e78:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000e7c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e7e:    4d07        .M      LDR      r5,[pc,#28] ; [0xe9c] = 0x88
        0x00000e80:    f1050460    ..`.    ADD      r4,r5,#0x60
        0x00000e84:    b104        ..      CBZ      r4,0xe88 ; I2C0_IRQHandler + 12
        0x00000e86:    e004        ..      B        0xe92 ; I2C0_IRQHandler + 22
        0x00000e88:    22ae        ."      MOVS     r2,#0xae
        0x00000e8a:    a105        ..      ADR      r1,{pc}+0x16 ; 0xea0
        0x00000e8c:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xec0
        0x00000e8e:    f000fd0b    ....    BL       __aeabi_assert ; 0x18a8
        0x00000e92:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000e96:    4788        .G      BLX      r1
        0x00000e98:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e9a:    0000        ..      DCW    0
        0x00000e9c:    00000088    ....    DCD    136
        0x00000ea0:    2e5c2e2e    ..\.    DCD    777793070
        0x00000ea4:    2e2e5c2e    .\..    DCD    774790190
        0x00000ea8:    464c455c    \ELF    DCD    1179403612
        0x00000eac:    53425f32    2_BS    DCD    1396858674
        0x00000eb0:    72445c50    P\Dr    DCD    1917082704
        0x00000eb4:    72657669    iver    DCD    1919252073
        0x00000eb8:    746e695c    \int    DCD    1953392988
        0x00000ebc:    00632e63    c.c.    DCD    6499939
        0x00000ec0:    636e7566    func    DCD    1668183398
        0x00000ec4:    203d2120     !=     DCD    540877088
        0x00000ec8:    00000030    0...    DCD    48
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000ecc:    b570        p.      PUSH     {r4-r6,lr}
        0x00000ece:    4d07        .M      LDR      r5,[pc,#28] ; [0xeec] = 0x88
        0x00000ed0:    f1050468    ..h.    ADD      r4,r5,#0x68
        0x00000ed4:    b104        ..      CBZ      r4,0xed8 ; I2C1_IRQHandler + 12
        0x00000ed6:    e004        ..      B        0xee2 ; I2C1_IRQHandler + 22
        0x00000ed8:    22b8        ."      MOVS     r2,#0xb8
        0x00000eda:    a105        ..      ADR      r1,{pc}+0x16 ; 0xef0
        0x00000edc:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xf10
        0x00000ede:    f000fce3    ....    BL       __aeabi_assert ; 0x18a8
        0x00000ee2:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000ee6:    4788        .G      BLX      r1
        0x00000ee8:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000eea:    0000        ..      DCW    0
        0x00000eec:    00000088    ....    DCD    136
        0x00000ef0:    2e5c2e2e    ..\.    DCD    777793070
        0x00000ef4:    2e2e5c2e    .\..    DCD    774790190
        0x00000ef8:    464c455c    \ELF    DCD    1179403612
        0x00000efc:    53425f32    2_BS    DCD    1396858674
        0x00000f00:    72445c50    P\Dr    DCD    1917082704
        0x00000f04:    72657669    iver    DCD    1919252073
        0x00000f08:    746e695c    \int    DCD    1953392988
        0x00000f0c:    00632e63    c.c.    DCD    6499939
        0x00000f10:    636e7566    func    DCD    1668183398
        0x00000f14:    203d2120     !=     DCD    540877088
        0x00000f18:    00000030    0...    DCD    48
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00000f1c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f1e:    4d07        .M      LDR      r5,[pc,#28] ; [0xf3c] = 0x88
        0x00000f20:    f1050488    ....    ADD      r4,r5,#0x88
        0x00000f24:    b104        ..      CBZ      r4,0xf28 ; I2S_IRQHandler + 12
        0x00000f26:    e004        ..      B        0xf32 ; I2S_IRQHandler + 22
        0x00000f28:    22e0        ."      MOVS     r2,#0xe0
        0x00000f2a:    a105        ..      ADR      r1,{pc}+0x16 ; 0xf40
        0x00000f2c:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xf60
        0x00000f2e:    f000fcbb    ....    BL       __aeabi_assert ; 0x18a8
        0x00000f32:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000f36:    4788        .G      BLX      r1
        0x00000f38:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f3a:    0000        ..      DCW    0
        0x00000f3c:    00000088    ....    DCD    136
        0x00000f40:    2e5c2e2e    ..\.    DCD    777793070
        0x00000f44:    2e2e5c2e    .\..    DCD    774790190
        0x00000f48:    464c455c    \ELF    DCD    1179403612
        0x00000f4c:    53425f32    2_BS    DCD    1396858674
        0x00000f50:    72445c50    P\Dr    DCD    1917082704
        0x00000f54:    72657669    iver    DCD    1919252073
        0x00000f58:    746e695c    \int    DCD    1953392988
        0x00000f5c:    00632e63    c.c.    DCD    6499939
        0x00000f60:    636e7566    func    DCD    1668183398
        0x00000f64:    203d2120     !=     DCD    540877088
        0x00000f68:    00000030    0...    DCD    48
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00000f6c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f6e:    4d07        .M      LDR      r5,[pc,#28] ; [0xf8c] = 0x88
        0x00000f70:    f1050420    .. .    ADD      r4,r5,#0x20
        0x00000f74:    b104        ..      CBZ      r4,0xf78 ; QSPI_IRQHandler + 12
        0x00000f76:    e004        ..      B        0xf82 ; QSPI_IRQHandler + 22
        0x00000f78:    2259        Y"      MOVS     r2,#0x59
        0x00000f7a:    a105        ..      ADR      r1,{pc}+0x16 ; 0xf90
        0x00000f7c:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xfb0
        0x00000f7e:    f000fc93    ....    BL       __aeabi_assert ; 0x18a8
        0x00000f82:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000f86:    4788        .G      BLX      r1
        0x00000f88:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f8a:    0000        ..      DCW    0
        0x00000f8c:    00000088    ....    DCD    136
        0x00000f90:    2e5c2e2e    ..\.    DCD    777793070
        0x00000f94:    2e2e5c2e    .\..    DCD    774790190
        0x00000f98:    464c455c    \ELF    DCD    1179403612
        0x00000f9c:    53425f32    2_BS    DCD    1396858674
        0x00000fa0:    72445c50    P\Dr    DCD    1917082704
        0x00000fa4:    72657669    iver    DCD    1919252073
        0x00000fa8:    746e695c    \int    DCD    1953392988
        0x00000fac:    00632e63    c.c.    DCD    6499939
        0x00000fb0:    636e7566    func    DCD    1668183398
        0x00000fb4:    203d2120     !=     DCD    540877088
        0x00000fb8:    00000030    0...    DCD    48
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00000fbc:    b570        p.      PUSH     {r4-r6,lr}
        0x00000fbe:    4d07        .M      LDR      r5,[pc,#28] ; [0xfdc] = 0x88
        0x00000fc0:    f1050410    ....    ADD      r4,r5,#0x10
        0x00000fc4:    b104        ..      CBZ      r4,0xfc8 ; RTC_IRQHandler + 12
        0x00000fc6:    e004        ..      B        0xfd2 ; RTC_IRQHandler + 22
        0x00000fc8:    2243        C"      MOVS     r2,#0x43
        0x00000fca:    a105        ..      ADR      r1,{pc}+0x16 ; 0xfe0
        0x00000fcc:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1000
        0x00000fce:    f000fc6b    ..k.    BL       __aeabi_assert ; 0x18a8
        0x00000fd2:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000fd6:    4788        .G      BLX      r1
        0x00000fd8:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000fda:    0000        ..      DCW    0
        0x00000fdc:    00000088    ....    DCD    136
        0x00000fe0:    2e5c2e2e    ..\.    DCD    777793070
        0x00000fe4:    2e2e5c2e    .\..    DCD    774790190
        0x00000fe8:    464c455c    \ELF    DCD    1179403612
        0x00000fec:    53425f32    2_BS    DCD    1396858674
        0x00000ff0:    72445c50    P\Dr    DCD    1917082704
        0x00000ff4:    72657669    iver    DCD    1919252073
        0x00000ff8:    746e695c    \int    DCD    1953392988
        0x00000ffc:    00632e63    c.c.    DCD    6499939
        0x00001000:    636e7566    func    DCD    1668183398
        0x00001004:    203d2120     !=     DCD    540877088
        0x00001008:    00000030    0...    DCD    48
    $t
    i.RTC_Init
    RTC_Init
        0x0000100c:    b510        ..      PUSH     {r4,lr}
        0x0000100e:    2000        .       MOVS     r0,#0
        0x00001010:    4911        .I      LDR      r1,[pc,#68] ; [0x1058] = 0x20000008
        0x00001012:    6048        H`      STR      r0,[r1,#4]
        0x00001014:    4811        .H      LDR      r0,[pc,#68] ; [0x105c] = 0xf4240
        0x00001016:    6008        .`      STR      r0,[r1,#0]
        0x00001018:    2000        .       MOVS     r0,#0
        0x0000101a:    7248        Hr      STRB     r0,[r1,#9]
        0x0000101c:    2001        .       MOVS     r0,#1
        0x0000101e:    7208        .r      STRB     r0,[r1,#8]
        0x00001020:    7288        .r      STRB     r0,[r1,#0xa]
        0x00001022:    4608        .F      MOV      r0,r1
        0x00001024:    c807        ..      LDM      r0,{r0-r2}
        0x00001026:    f7fffdcd    ....    BL       HAL_RTC_Init ; 0xbc4
        0x0000102a:    2100        .!      MOVS     r1,#0
        0x0000102c:    480c        .H      LDR      r0,[pc,#48] ; [0x1060] = 0x19dd
        0x0000102e:    f000f819    ....    BL       RTC_Int_Register ; 0x1064
        0x00001032:    2002        .       MOVS     r0,#2
        0x00001034:    2800        .(      CMP      r0,#0
        0x00001036:    db09        ..      BLT      0x104c ; RTC_Init + 64
        0x00001038:    f000021f    ....    AND      r2,r0,#0x1f
        0x0000103c:    2101        .!      MOVS     r1,#1
        0x0000103e:    4091        .@      LSLS     r1,r1,r2
        0x00001040:    0942        B.      LSRS     r2,r0,#5
        0x00001042:    0092        ..      LSLS     r2,r2,#2
        0x00001044:    f10222e0    ..."    ADD      r2,r2,#0xe000e000
        0x00001048:    f8c21100    ....    STR      r1,[r2,#0x100]
        0x0000104c:    bf00        ..      NOP      
        0x0000104e:    2001        .       MOVS     r0,#1
        0x00001050:    f7fffdac    ....    BL       HAL_RTC_Enable ; 0xbac
        0x00001054:    bd10        ..      POP      {r4,pc}
    $d
        0x00001056:    0000        ..      DCW    0
        0x00001058:    20000008    ...     DCD    536870920
        0x0000105c:    000f4240    @B..    DCD    1000000
        0x00001060:    000019dd    ....    DCD    6621
    $t
    i.RTC_Int_Register
    RTC_Int_Register
        0x00001064:    b570        p.      PUSH     {r4-r6,lr}
        0x00001066:    4604        .F      MOV      r4,r0
        0x00001068:    460d        .F      MOV      r5,r1
        0x0000106a:    b104        ..      CBZ      r4,0x106e ; RTC_Int_Register + 10
        0x0000106c:    e004        ..      B        0x1078 ; RTC_Int_Register + 20
        0x0000106e:    2237        7"      MOVS     r2,#0x37
        0x00001070:    a104        ..      ADR      r1,{pc}+0x14 ; 0x1084
        0x00001072:    a00e        ..      ADR      r0,{pc}+0x3a ; 0x10ac
        0x00001074:    f000fc18    ....    BL       __aeabi_assert ; 0x18a8
        0x00001078:    462a        *F      MOV      r2,r5
        0x0000107a:    4621        !F      MOV      r1,r4
        0x0000107c:    2002        .       MOVS     r0,#2
        0x0000107e:    f000fc5d    ..].    BL       int_callback_register ; 0x193c
        0x00001082:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001084:    2e5c2e2e    ..\.    DCD    777793070
        0x00001088:    2e2e5c2e    .\..    DCD    774790190
        0x0000108c:    464c455c    \ELF    DCD    1179403612
        0x00001090:    53425f32    2_BS    DCD    1396858674
        0x00001094:    72445c50    P\Dr    DCD    1917082704
        0x00001098:    72657669    iver    DCD    1919252073
        0x0000109c:    746e695c    \int    DCD    1953392988
        0x000010a0:    6765725f    _reg    DCD    1734701663
        0x000010a4:    65747369    iste    DCD    1702130537
        0x000010a8:    00632e72    r.c.    DCD    6499954
        0x000010ac:    5f727369    isr_    DCD    1601336169
        0x000010b0:    636e7566    func    DCD    1668183398
        0x000010b4:    203d2120     !=     DCD    540877088
        0x000010b8:    00000030    0...    DCD    48
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000010bc:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000010c0:    4604        .F      MOV      r4,r0
        0x000010c2:    460d        .F      MOV      r5,r1
        0x000010c4:    4616        .F      MOV      r6,r2
        0x000010c6:    bf00        ..      NOP      
        0x000010c8:    480d        .H      LDR      r0,[pc,#52] ; [0x1100] = 0x20000014
        0x000010ca:    7800        .x      LDRB     r0,[r0,#0]
        0x000010cc:    b908        ..      CBNZ     r0,0x10d2 ; SEGGER_RTT_Write + 22
        0x000010ce:    f000fa37    ..7.    BL       _DoInit ; 0x1540
        0x000010d2:    bf00        ..      NOP      
        0x000010d4:    f3ef8011    ....    MRS      r0,BASEPRI
        0x000010d8:    4607        .F      MOV      r7,r0
        0x000010da:    2020                MOVS     r0,#0x20
        0x000010dc:    f3808811    ....    MSR      BASEPRI,r0
        0x000010e0:    bf00        ..      NOP      
        0x000010e2:    bf00        ..      NOP      
        0x000010e4:    4632        2F      MOV      r2,r6
        0x000010e6:    4629        )F      MOV      r1,r5
        0x000010e8:    4620         F      MOV      r0,r4
        0x000010ea:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0x1104
        0x000010ee:    4680        .F      MOV      r8,r0
        0x000010f0:    b2f8        ..      UXTB     r0,r7
        0x000010f2:    f3808811    ....    MSR      BASEPRI,r0
        0x000010f6:    bf00        ..      NOP      
        0x000010f8:    bf00        ..      NOP      
        0x000010fa:    4640        @F      MOV      r0,r8
        0x000010fc:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001100:    20000014    ...     DCD    536870932
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00001104:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001108:    4607        .F      MOV      r7,r0
        0x0000110a:    4688        .F      MOV      r8,r1
        0x0000110c:    4616        .F      MOV      r6,r2
        0x0000110e:    46c2        .F      MOV      r10,r8
        0x00001110:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x00001114:    481b        .H      LDR      r0,[pc,#108] ; [0x1184] = 0x2000002c
        0x00001116:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x0000111a:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x0000111e:    b120         .      CBZ      r0,0x112a ; SEGGER_RTT_WriteNoLock + 38
        0x00001120:    2801        .(      CMP      r0,#1
        0x00001122:    d011        ..      BEQ      0x1148 ; SEGGER_RTT_WriteNoLock + 68
        0x00001124:    2802        .(      CMP      r0,#2
        0x00001126:    d126        &.      BNE      0x1176 ; SEGGER_RTT_WriteNoLock + 114
        0x00001128:    e01e        ..      B        0x1168 ; SEGGER_RTT_WriteNoLock + 100
        0x0000112a:    4648        HF      MOV      r0,r9
        0x0000112c:    f000fa40    ..@.    BL       _GetAvailWriteSpace ; 0x15b0
        0x00001130:    4605        .F      MOV      r5,r0
        0x00001132:    42b5        .B      CMP      r5,r6
        0x00001134:    d201        ..      BCS      0x113a ; SEGGER_RTT_WriteNoLock + 54
        0x00001136:    2400        .$      MOVS     r4,#0
        0x00001138:    e005        ..      B        0x1146 ; SEGGER_RTT_WriteNoLock + 66
        0x0000113a:    4634        4F      MOV      r4,r6
        0x0000113c:    4632        2F      MOV      r2,r6
        0x0000113e:    4651        QF      MOV      r1,r10
        0x00001140:    4648        HF      MOV      r0,r9
        0x00001142:    f000fb8a    ....    BL       _WriteNoCheck ; 0x185a
        0x00001146:    e018        ..      B        0x117a ; SEGGER_RTT_WriteNoLock + 118
        0x00001148:    4648        HF      MOV      r0,r9
        0x0000114a:    f000fa31    ..1.    BL       _GetAvailWriteSpace ; 0x15b0
        0x0000114e:    4605        .F      MOV      r5,r0
        0x00001150:    42b5        .B      CMP      r5,r6
        0x00001152:    d201        ..      BCS      0x1158 ; SEGGER_RTT_WriteNoLock + 84
        0x00001154:    4628        (F      MOV      r0,r5
        0x00001156:    e000        ..      B        0x115a ; SEGGER_RTT_WriteNoLock + 86
        0x00001158:    4630        0F      MOV      r0,r6
        0x0000115a:    4604        .F      MOV      r4,r0
        0x0000115c:    4622        "F      MOV      r2,r4
        0x0000115e:    4651        QF      MOV      r1,r10
        0x00001160:    4648        HF      MOV      r0,r9
        0x00001162:    f000fb7a    ..z.    BL       _WriteNoCheck ; 0x185a
        0x00001166:    e008        ..      B        0x117a ; SEGGER_RTT_WriteNoLock + 118
        0x00001168:    4632        2F      MOV      r2,r6
        0x0000116a:    4651        QF      MOV      r1,r10
        0x0000116c:    4648        HF      MOV      r0,r9
        0x0000116e:    f000fb3b    ..;.    BL       _WriteBlocking ; 0x17e8
        0x00001172:    4604        .F      MOV      r4,r0
        0x00001174:    e001        ..      B        0x117a ; SEGGER_RTT_WriteNoLock + 118
        0x00001176:    2400        .$      MOVS     r4,#0
        0x00001178:    bf00        ..      NOP      
        0x0000117a:    bf00        ..      NOP      
        0x0000117c:    4620         F      MOV      r0,r4
        0x0000117e:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x00001182:    0000        ..      DCW    0
        0x00001184:    2000002c    ,..     DCD    536870956
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00001188:    b40f        ..      PUSH     {r0-r3}
        0x0000118a:    b538        8.      PUSH     {r3-r5,lr}
        0x0000118c:    4604        .F      MOV      r4,r0
        0x0000118e:    a806        ..      ADD      r0,sp,#0x18
        0x00001190:    9000        ..      STR      r0,[sp,#0]
        0x00001192:    466a        jF      MOV      r2,sp
        0x00001194:    4620         F      MOV      r0,r4
        0x00001196:    9905        ..      LDR      r1,[sp,#0x14]
        0x00001198:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0x11aa
        0x0000119c:    4605        .F      MOV      r5,r0
        0x0000119e:    2000        .       MOVS     r0,#0
        0x000011a0:    9000        ..      STR      r0,[sp,#0]
        0x000011a2:    4628        (F      MOV      r0,r5
        0x000011a4:    bc38        8.      POP      {r3-r5}
        0x000011a6:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x000011aa:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x000011ae:    b099        ..      SUB      sp,sp,#0x64
        0x000011b0:    4682        .F      MOV      r10,r0
        0x000011b2:    460d        .F      MOV      r5,r1
        0x000011b4:    4614        .F      MOV      r4,r2
        0x000011b6:    a803        ..      ADD      r0,sp,#0xc
        0x000011b8:    9014        ..      STR      r0,[sp,#0x50]
        0x000011ba:    2040        @       MOVS     r0,#0x40
        0x000011bc:    9015        ..      STR      r0,[sp,#0x54]
        0x000011be:    2000        .       MOVS     r0,#0
        0x000011c0:    9016        ..      STR      r0,[sp,#0x58]
        0x000011c2:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x000011c6:    9017        ..      STR      r0,[sp,#0x5c]
        0x000011c8:    bf00        ..      NOP      
        0x000011ca:    782e        .x      LDRB     r6,[r5,#0]
        0x000011cc:    1c6d        m.      ADDS     r5,r5,#1
        0x000011ce:    b906        ..      CBNZ     r6,0x11d2 ; SEGGER_RTT_vprintf + 40
        0x000011d0:    e0dd        ..      B        0x138e ; SEGGER_RTT_vprintf + 484
        0x000011d2:    2e25        %.      CMP      r6,#0x25
        0x000011d4:    d179        y.      BNE      0x12ca ; SEGGER_RTT_vprintf + 288
        0x000011d6:    2700        .'      MOVS     r7,#0
        0x000011d8:    f04f0901    O...    MOV      r9,#1
        0x000011dc:    bf00        ..      NOP      
        0x000011de:    782e        .x      LDRB     r6,[r5,#0]
        0x000011e0:    2e23        #.      CMP      r6,#0x23
        0x000011e2:    d012        ..      BEQ      0x120a ; SEGGER_RTT_vprintf + 96
        0x000011e4:    2e2b        +.      CMP      r6,#0x2b
        0x000011e6:    d00c        ..      BEQ      0x1202 ; SEGGER_RTT_vprintf + 88
        0x000011e8:    2e2d        -.      CMP      r6,#0x2d
        0x000011ea:    d002        ..      BEQ      0x11f2 ; SEGGER_RTT_vprintf + 72
        0x000011ec:    2e30        0.      CMP      r6,#0x30
        0x000011ee:    d110        ..      BNE      0x1212 ; SEGGER_RTT_vprintf + 104
        0x000011f0:    e003        ..      B        0x11fa ; SEGGER_RTT_vprintf + 80
        0x000011f2:    f0470701    G...    ORR      r7,r7,#1
        0x000011f6:    1c6d        m.      ADDS     r5,r5,#1
        0x000011f8:    e00e        ..      B        0x1218 ; SEGGER_RTT_vprintf + 110
        0x000011fa:    f0470702    G...    ORR      r7,r7,#2
        0x000011fe:    1c6d        m.      ADDS     r5,r5,#1
        0x00001200:    e00a        ..      B        0x1218 ; SEGGER_RTT_vprintf + 110
        0x00001202:    f0470704    G...    ORR      r7,r7,#4
        0x00001206:    1c6d        m.      ADDS     r5,r5,#1
        0x00001208:    e006        ..      B        0x1218 ; SEGGER_RTT_vprintf + 110
        0x0000120a:    f0470708    G...    ORR      r7,r7,#8
        0x0000120e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001210:    e002        ..      B        0x1218 ; SEGGER_RTT_vprintf + 110
        0x00001212:    f04f0900    O...    MOV      r9,#0
        0x00001216:    bf00        ..      NOP      
        0x00001218:    bf00        ..      NOP      
        0x0000121a:    f1b90f00    ....    CMP      r9,#0
        0x0000121e:    d1de        ..      BNE      0x11de ; SEGGER_RTT_vprintf + 52
        0x00001220:    f04f0800    O...    MOV      r8,#0
        0x00001224:    bf00        ..      NOP      
        0x00001226:    782e        .x      LDRB     r6,[r5,#0]
        0x00001228:    2e30        0.      CMP      r6,#0x30
        0x0000122a:    db01        ..      BLT      0x1230 ; SEGGER_RTT_vprintf + 134
        0x0000122c:    2e39        9.      CMP      r6,#0x39
        0x0000122e:    dd00        ..      BLE      0x1232 ; SEGGER_RTT_vprintf + 136
        0x00001230:    e007        ..      B        0x1242 ; SEGGER_RTT_vprintf + 152
        0x00001232:    1c6d        m.      ADDS     r5,r5,#1
        0x00001234:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00001238:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x0000123c:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x00001240:    e7f1        ..      B        0x1226 ; SEGGER_RTT_vprintf + 124
        0x00001242:    bf00        ..      NOP      
        0x00001244:    2000        .       MOVS     r0,#0
        0x00001246:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001248:    782e        .x      LDRB     r6,[r5,#0]
        0x0000124a:    2e2e        ..      CMP      r6,#0x2e
        0x0000124c:    d112        ..      BNE      0x1274 ; SEGGER_RTT_vprintf + 202
        0x0000124e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001250:    bf00        ..      NOP      
        0x00001252:    782e        .x      LDRB     r6,[r5,#0]
        0x00001254:    2e30        0.      CMP      r6,#0x30
        0x00001256:    db01        ..      BLT      0x125c ; SEGGER_RTT_vprintf + 178
        0x00001258:    2e39        9.      CMP      r6,#0x39
        0x0000125a:    dd00        ..      BLE      0x125e ; SEGGER_RTT_vprintf + 180
        0x0000125c:    e009        ..      B        0x1272 ; SEGGER_RTT_vprintf + 200
        0x0000125e:    1c6d        m.      ADDS     r5,r5,#1
        0x00001260:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x00001264:    9913        ..      LDR      r1,[sp,#0x4c]
        0x00001266:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x0000126a:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x0000126e:    9013        ..      STR      r0,[sp,#0x4c]
        0x00001270:    e7ef        ..      B        0x1252 ; SEGGER_RTT_vprintf + 168
        0x00001272:    bf00        ..      NOP      
        0x00001274:    782e        .x      LDRB     r6,[r5,#0]
        0x00001276:    bf00        ..      NOP      
        0x00001278:    2e6c        l.      CMP      r6,#0x6c
        0x0000127a:    d001        ..      BEQ      0x1280 ; SEGGER_RTT_vprintf + 214
        0x0000127c:    2e68        h.      CMP      r6,#0x68
        0x0000127e:    d102        ..      BNE      0x1286 ; SEGGER_RTT_vprintf + 220
        0x00001280:    1c6d        m.      ADDS     r5,r5,#1
        0x00001282:    782e        .x      LDRB     r6,[r5,#0]
        0x00001284:    e000        ..      B        0x1288 ; SEGGER_RTT_vprintf + 222
        0x00001286:    e000        ..      B        0x128a ; SEGGER_RTT_vprintf + 224
        0x00001288:    e7f6        ..      B        0x1278 ; SEGGER_RTT_vprintf + 206
        0x0000128a:    bf00        ..      NOP      
        0x0000128c:    2e70        p.      CMP      r6,#0x70
        0x0000128e:    d05d        ].      BEQ      0x134c ; SEGGER_RTT_vprintf + 418
        0x00001290:    dc08        ..      BGT      0x12a4 ; SEGGER_RTT_vprintf + 250
        0x00001292:    2e25        %.      CMP      r6,#0x25
        0x00001294:    d06a        j.      BEQ      0x136c ; SEGGER_RTT_vprintf + 450
        0x00001296:    2e58        X.      CMP      r6,#0x58
        0x00001298:    d035        5.      BEQ      0x1306 ; SEGGER_RTT_vprintf + 348
        0x0000129a:    2e63        c.      CMP      r6,#0x63
        0x0000129c:    d009        ..      BEQ      0x12b2 ; SEGGER_RTT_vprintf + 264
        0x0000129e:    2e64        d.      CMP      r6,#0x64
        0x000012a0:    d169        i.      BNE      0x1376 ; SEGGER_RTT_vprintf + 460
        0x000012a2:    e013        ..      B        0x12cc ; SEGGER_RTT_vprintf + 290
        0x000012a4:    2e73        s.      CMP      r6,#0x73
        0x000012a6:    d03c        <.      BEQ      0x1322 ; SEGGER_RTT_vprintf + 376
        0x000012a8:    2e75        u.      CMP      r6,#0x75
        0x000012aa:    d01d        ..      BEQ      0x12e8 ; SEGGER_RTT_vprintf + 318
        0x000012ac:    2e78        x.      CMP      r6,#0x78
        0x000012ae:    d162        b.      BNE      0x1376 ; SEGGER_RTT_vprintf + 460
        0x000012b0:    e028        (.      B        0x1304 ; SEGGER_RTT_vprintf + 346
        0x000012b2:    6821        !h      LDR      r1,[r4,#0]
        0x000012b4:    1d08        ..      ADDS     r0,r1,#4
        0x000012b6:    6020         `      STR      r0,[r4,#0]
        0x000012b8:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000012bc:    f0090bff    ....    AND      r11,r9,#0xff
        0x000012c0:    4659        YF      MOV      r1,r11
        0x000012c2:    a814        ..      ADD      r0,sp,#0x50
        0x000012c4:    f000fa6e    ..n.    BL       _StoreChar ; 0x17a4
        0x000012c8:    e056        V.      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x000012ca:    e058        X.      B        0x137e ; SEGGER_RTT_vprintf + 468
        0x000012cc:    6821        !h      LDR      r1,[r4,#0]
        0x000012ce:    1d08        ..      ADDS     r0,r1,#4
        0x000012d0:    6020         `      STR      r0,[r4,#0]
        0x000012d2:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000012d6:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000012da:    220a        ."      MOVS     r2,#0xa
        0x000012dc:    4649        IF      MOV      r1,r9
        0x000012de:    a814        ..      ADD      r0,sp,#0x50
        0x000012e0:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000012e2:    f000f973    ..s.    BL       _PrintInt ; 0x15cc
        0x000012e6:    e047        G.      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x000012e8:    6821        !h      LDR      r1,[r4,#0]
        0x000012ea:    1d08        ..      ADDS     r0,r1,#4
        0x000012ec:    6020         `      STR      r0,[r4,#0]
        0x000012ee:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000012f2:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x000012f6:    220a        ."      MOVS     r2,#0xa
        0x000012f8:    4649        IF      MOV      r1,r9
        0x000012fa:    a814        ..      ADD      r0,sp,#0x50
        0x000012fc:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x000012fe:    f000f9db    ....    BL       _PrintUnsigned ; 0x16b8
        0x00001302:    e039        9.      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x00001304:    bf00        ..      NOP      
        0x00001306:    6821        !h      LDR      r1,[r4,#0]
        0x00001308:    1d08        ..      ADDS     r0,r1,#4
        0x0000130a:    6020         `      STR      r0,[r4,#0]
        0x0000130c:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001310:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x00001314:    2210        ."      MOVS     r2,#0x10
        0x00001316:    4649        IF      MOV      r1,r9
        0x00001318:    a814        ..      ADD      r0,sp,#0x50
        0x0000131a:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x0000131c:    f000f9cc    ....    BL       _PrintUnsigned ; 0x16b8
        0x00001320:    e02a        *.      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x00001322:    6821        !h      LDR      r1,[r4,#0]
        0x00001324:    1d08        ..      ADDS     r0,r1,#4
        0x00001326:    6020         `      STR      r0,[r4,#0]
        0x00001328:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x0000132c:    bf00        ..      NOP      
        0x0000132e:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x00001332:    f10b0b01    ....    ADD      r11,r11,#1
        0x00001336:    b906        ..      CBNZ     r6,0x133a ; SEGGER_RTT_vprintf + 400
        0x00001338:    e006        ..      B        0x1348 ; SEGGER_RTT_vprintf + 414
        0x0000133a:    4631        1F      MOV      r1,r6
        0x0000133c:    a814        ..      ADD      r0,sp,#0x50
        0x0000133e:    f000fa31    ..1.    BL       _StoreChar ; 0x17a4
        0x00001342:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001344:    2800        .(      CMP      r0,#0
        0x00001346:    daf2        ..      BGE      0x132e ; SEGGER_RTT_vprintf + 388
        0x00001348:    bf00        ..      NOP      
        0x0000134a:    e015        ..      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x0000134c:    6821        !h      LDR      r1,[r4,#0]
        0x0000134e:    1d08        ..      ADDS     r0,r1,#4
        0x00001350:    6020         `      STR      r0,[r4,#0]
        0x00001352:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001356:    2000        .       MOVS     r0,#0
        0x00001358:    2108        .!      MOVS     r1,#8
        0x0000135a:    460b        .F      MOV      r3,r1
        0x0000135c:    2210        ."      MOVS     r2,#0x10
        0x0000135e:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x00001362:    4649        IF      MOV      r1,r9
        0x00001364:    a814        ..      ADD      r0,sp,#0x50
        0x00001366:    f000f9a7    ....    BL       _PrintUnsigned ; 0x16b8
        0x0000136a:    e005        ..      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x0000136c:    2125        %!      MOVS     r1,#0x25
        0x0000136e:    a814        ..      ADD      r0,sp,#0x50
        0x00001370:    f000fa18    ....    BL       _StoreChar ; 0x17a4
        0x00001374:    e000        ..      B        0x1378 ; SEGGER_RTT_vprintf + 462
        0x00001376:    bf00        ..      NOP      
        0x00001378:    bf00        ..      NOP      
        0x0000137a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000137c:    e003        ..      B        0x1386 ; SEGGER_RTT_vprintf + 476
        0x0000137e:    4631        1F      MOV      r1,r6
        0x00001380:    a814        ..      ADD      r0,sp,#0x50
        0x00001382:    f000fa0f    ....    BL       _StoreChar ; 0x17a4
        0x00001386:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001388:    2800        .(      CMP      r0,#0
        0x0000138a:    f6bfaf1e    ....    BGE      0x11ca ; SEGGER_RTT_vprintf + 32
        0x0000138e:    bf00        ..      NOP      
        0x00001390:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001392:    2800        .(      CMP      r0,#0
        0x00001394:    dd0a        ..      BLE      0x13ac ; SEGGER_RTT_vprintf + 514
        0x00001396:    9816        ..      LDR      r0,[sp,#0x58]
        0x00001398:    b120         .      CBZ      r0,0x13a4 ; SEGGER_RTT_vprintf + 506
        0x0000139a:    a903        ..      ADD      r1,sp,#0xc
        0x0000139c:    4650        PF      MOV      r0,r10
        0x0000139e:    9a16        ..      LDR      r2,[sp,#0x58]
        0x000013a0:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0x10bc
        0x000013a4:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x000013a8:    4408        .D      ADD      r0,r0,r1
        0x000013aa:    9017        ..      STR      r0,[sp,#0x5c]
        0x000013ac:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000013ae:    b019        ..      ADD      sp,sp,#0x64
        0x000013b0:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x000013b4:    b570        p.      PUSH     {r4-r6,lr}
        0x000013b6:    4d07        .M      LDR      r5,[pc,#28] ; [0x13d4] = 0x88
        0x000013b8:    f1050470    ..p.    ADD      r4,r5,#0x70
        0x000013bc:    b104        ..      CBZ      r4,0x13c0 ; SPIM_IRQHandler + 12
        0x000013be:    e004        ..      B        0x13ca ; SPIM_IRQHandler + 22
        0x000013c0:    22c2        ."      MOVS     r2,#0xc2
        0x000013c2:    a105        ..      ADR      r1,{pc}+0x16 ; 0x13d8
        0x000013c4:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x13f8
        0x000013c6:    f000fa6f    ..o.    BL       __aeabi_assert ; 0x18a8
        0x000013ca:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000013ce:    4788        .G      BLX      r1
        0x000013d0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000013d2:    0000        ..      DCW    0
        0x000013d4:    00000088    ....    DCD    136
        0x000013d8:    2e5c2e2e    ..\.    DCD    777793070
        0x000013dc:    2e2e5c2e    .\..    DCD    774790190
        0x000013e0:    464c455c    \ELF    DCD    1179403612
        0x000013e4:    53425f32    2_BS    DCD    1396858674
        0x000013e8:    72445c50    P\Dr    DCD    1917082704
        0x000013ec:    72657669    iver    DCD    1919252073
        0x000013f0:    746e695c    \int    DCD    1953392988
        0x000013f4:    00632e63    c.c.    DCD    6499939
        0x000013f8:    636e7566    func    DCD    1668183398
        0x000013fc:    203d2120     !=     DCD    540877088
        0x00001400:    00000030    0...    DCD    48
    $t
    i.SystemInit
    SystemInit
        0x00001404:    b510        ..      PUSH     {r4,lr}
        0x00001406:    bf00        ..      NOP      
        0x00001408:    480f        .H      LDR      r0,[pc,#60] ; [0x1448] = 0x4000b000
        0x0000140a:    6800        .h      LDR      r0,[r0,#0]
        0x0000140c:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x00001410:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x00001414:    d1f8        ..      BNE      0x1408 ; SystemInit + 4
        0x00001416:    f64e2060    N.`     MOV      r0,#0xea60
        0x0000141a:    f000fa65    ..e.    BL       delay ; 0x18e8
        0x0000141e:    480b        .H      LDR      r0,[pc,#44] ; [0x144c] = 0x5f5e100
        0x00001420:    490b        .I      LDR      r1,[pc,#44] ; [0x1450] = 0x20000000
        0x00001422:    6008        .`      STR      r0,[r1,#0]
        0x00001424:    2008        .       MOVS     r0,#8
        0x00001426:    f7fffc19    ....    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xc5c
        0x0000142a:    2002        .       MOVS     r0,#2
        0x0000142c:    f7fffc22    ..".    BL       HAL_SYSCON_Set_HClk_Div ; 0xc74
        0x00001430:    2004        .       MOVS     r0,#4
        0x00001432:    f7fffc55    ..U.    BL       HAL_SYSCON_Set_PClk0_Div ; 0xce0
        0x00001436:    2002        .       MOVS     r0,#2
        0x00001438:    f7fffc8a    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xd50
        0x0000143c:    2164        d!      MOVS     r1,#0x64
        0x0000143e:    2001        .       MOVS     r0,#1
        0x00001440:    f7fffcbc    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0xdbc
        0x00001444:    bd10        ..      POP      {r4,pc}
    $d
        0x00001446:    0000        ..      DCW    0
        0x00001448:    4000b000    ...@    DCD    1073786880
        0x0000144c:    05f5e100    ....    DCD    100000000
        0x00001450:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00001454:    b570        p.      PUSH     {r4-r6,lr}
        0x00001456:    4d07        .M      LDR      r5,[pc,#28] ; [0x1474] = 0x88
        0x00001458:    f1050458    ..X.    ADD      r4,r5,#0x58
        0x0000145c:    b104        ..      CBZ      r4,0x1460 ; TIMER_IRQHandler + 12
        0x0000145e:    e004        ..      B        0x146a ; TIMER_IRQHandler + 22
        0x00001460:    22a4        ."      MOVS     r2,#0xa4
        0x00001462:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1478
        0x00001464:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1498
        0x00001466:    f000fa1f    ....    BL       __aeabi_assert ; 0x18a8
        0x0000146a:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000146e:    4788        .G      BLX      r1
        0x00001470:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001472:    0000        ..      DCW    0
        0x00001474:    00000088    ....    DCD    136
        0x00001478:    2e5c2e2e    ..\.    DCD    777793070
        0x0000147c:    2e2e5c2e    .\..    DCD    774790190
        0x00001480:    464c455c    \ELF    DCD    1179403612
        0x00001484:    53425f32    2_BS    DCD    1396858674
        0x00001488:    72445c50    P\Dr    DCD    1917082704
        0x0000148c:    72657669    iver    DCD    1919252073
        0x00001490:    746e695c    \int    DCD    1953392988
        0x00001494:    00632e63    c.c.    DCD    6499939
        0x00001498:    636e7566    func    DCD    1668183398
        0x0000149c:    203d2120     !=     DCD    540877088
        0x000014a0:    00000030    0...    DCD    48
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x000014a4:    b570        p.      PUSH     {r4-r6,lr}
        0x000014a6:    4d07        .M      LDR      r5,[pc,#28] ; [0x14c4] = 0x88
        0x000014a8:    f1050478    ..x.    ADD      r4,r5,#0x78
        0x000014ac:    b104        ..      CBZ      r4,0x14b0 ; UART_IRQHandler + 12
        0x000014ae:    e004        ..      B        0x14ba ; UART_IRQHandler + 22
        0x000014b0:    22cc        ."      MOVS     r2,#0xcc
        0x000014b2:    a105        ..      ADR      r1,{pc}+0x16 ; 0x14c8
        0x000014b4:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x14e8
        0x000014b6:    f000f9f7    ....    BL       __aeabi_assert ; 0x18a8
        0x000014ba:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000014be:    4788        .G      BLX      r1
        0x000014c0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000014c2:    0000        ..      DCW    0
        0x000014c4:    00000088    ....    DCD    136
        0x000014c8:    2e5c2e2e    ..\.    DCD    777793070
        0x000014cc:    2e2e5c2e    .\..    DCD    774790190
        0x000014d0:    464c455c    \ELF    DCD    1179403612
        0x000014d4:    53425f32    2_BS    DCD    1396858674
        0x000014d8:    72445c50    P\Dr    DCD    1917082704
        0x000014dc:    72657669    iver    DCD    1919252073
        0x000014e0:    746e695c    \int    DCD    1953392988
        0x000014e4:    00632e63    c.c.    DCD    6499939
        0x000014e8:    636e7566    func    DCD    1668183398
        0x000014ec:    203d2120     !=     DCD    540877088
        0x000014f0:    00000030    0...    DCD    48
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x000014f4:    b570        p.      PUSH     {r4-r6,lr}
        0x000014f6:    4d06        .M      LDR      r5,[pc,#24] ; [0x1510] = 0x88
        0x000014f8:    462c        ,F      MOV      r4,r5
        0x000014fa:    b104        ..      CBZ      r4,0x14fe ; WDT_IRQHandler + 10
        0x000014fc:    e004        ..      B        0x1508 ; WDT_IRQHandler + 20
        0x000014fe:    222f        /"      MOVS     r2,#0x2f
        0x00001500:    a104        ..      ADR      r1,{pc}+0x14 ; 0x1514
        0x00001502:    a00c        ..      ADR      r0,{pc}+0x32 ; 0x1534
        0x00001504:    f000f9d0    ....    BL       __aeabi_assert ; 0x18a8
        0x00001508:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000150c:    4788        .G      BLX      r1
        0x0000150e:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001510:    00000088    ....    DCD    136
        0x00001514:    2e5c2e2e    ..\.    DCD    777793070
        0x00001518:    2e2e5c2e    .\..    DCD    774790190
        0x0000151c:    464c455c    \ELF    DCD    1179403612
        0x00001520:    53425f32    2_BS    DCD    1396858674
        0x00001524:    72445c50    P\Dr    DCD    1917082704
        0x00001528:    72657669    iver    DCD    1919252073
        0x0000152c:    746e695c    \int    DCD    1953392988
        0x00001530:    00632e63    c.c.    DCD    6499939
        0x00001534:    636e7566    func    DCD    1668183398
        0x00001538:    203d2120     !=     DCD    540877088
        0x0000153c:    00000030    0...    DCD    48
    $t
    i._DoInit
    _DoInit
        0x00001540:    b510        ..      PUSH     {r4,lr}
        0x00001542:    4c12        .L      LDR      r4,[pc,#72] ; [0x158c] = 0x20000014
        0x00001544:    2003        .       MOVS     r0,#3
        0x00001546:    6120         a      STR      r0,[r4,#0x10]
        0x00001548:    6160        `a      STR      r0,[r4,#0x14]
        0x0000154a:    a011        ..      ADR      r0,{pc}+0x46 ; 0x1590
        0x0000154c:    61a0        .a      STR      r0,[r4,#0x18]
        0x0000154e:    4913        .I      LDR      r1,[pc,#76] ; [0x159c] = 0x200000bc
        0x00001550:    61e1        .a      STR      r1,[r4,#0x1c]
        0x00001552:    f44f6180    O..a    MOV      r1,#0x400
        0x00001556:    6221        !b      STR      r1,[r4,#0x20]
        0x00001558:    2100        .!      MOVS     r1,#0
        0x0000155a:    62a1        .b      STR      r1,[r4,#0x28]
        0x0000155c:    6261        ab      STR      r1,[r4,#0x24]
        0x0000155e:    62e1        .b      STR      r1,[r4,#0x2c]
        0x00001560:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x1590
        0x00001562:    6620         f      STR      r0,[r4,#0x60]
        0x00001564:    490e        .I      LDR      r1,[pc,#56] ; [0x15a0] = 0x200004bc
        0x00001566:    6661        af      STR      r1,[r4,#0x64]
        0x00001568:    2110        .!      MOVS     r1,#0x10
        0x0000156a:    66a1        .f      STR      r1,[r4,#0x68]
        0x0000156c:    2100        .!      MOVS     r1,#0
        0x0000156e:    6721        !g      STR      r1,[r4,#0x70]
        0x00001570:    66e1        .f      STR      r1,[r4,#0x6c]
        0x00001572:    6761        ag      STR      r1,[r4,#0x74]
        0x00001574:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x15a4
        0x00001576:    1de0        ..      ADDS     r0,r4,#7
        0x00001578:    f7fefeea    ....    BL       strcpy ; 0x350
        0x0000157c:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x15a8
        0x0000157e:    4620         F      MOV      r0,r4
        0x00001580:    f7fefee6    ....    BL       strcpy ; 0x350
        0x00001584:    2020                MOVS     r0,#0x20
        0x00001586:    71a0        .q      STRB     r0,[r4,#6]
        0x00001588:    bd10        ..      POP      {r4,pc}
    $d
        0x0000158a:    0000        ..      DCW    0
        0x0000158c:    20000014    ...     DCD    536870932
        0x00001590:    6d726554    Term    DCD    1836213588
        0x00001594:    6c616e69    inal    DCD    1818324585
        0x00001598:    00000000    ....    DCD    0
        0x0000159c:    200000bc    ...     DCD    536871100
        0x000015a0:    200004bc    ...     DCD    536872124
        0x000015a4:    00545452    RTT.    DCD    5526610
        0x000015a8:    47474553    SEGG    DCD    1195853139
        0x000015ac:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x000015b0:    b510        ..      PUSH     {r4,lr}
        0x000015b2:    4601        .F      MOV      r1,r0
        0x000015b4:    690a        .i      LDR      r2,[r1,#0x10]
        0x000015b6:    68cb        .h      LDR      r3,[r1,#0xc]
        0x000015b8:    429a        .B      CMP      r2,r3
        0x000015ba:    d804        ..      BHI      0x15c6 ; _GetAvailWriteSpace + 22
        0x000015bc:    688c        .h      LDR      r4,[r1,#8]
        0x000015be:    1e64        d.      SUBS     r4,r4,#1
        0x000015c0:    1ae4        ..      SUBS     r4,r4,r3
        0x000015c2:    18a0        ..      ADDS     r0,r4,r2
        0x000015c4:    e001        ..      B        0x15ca ; _GetAvailWriteSpace + 26
        0x000015c6:    1ad4        ..      SUBS     r4,r2,r3
        0x000015c8:    1e60        `.      SUBS     r0,r4,#1
        0x000015ca:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x000015cc:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x000015d0:    4606        .F      MOV      r6,r0
        0x000015d2:    460f        .F      MOV      r7,r1
        0x000015d4:    4692        .F      MOV      r10,r2
        0x000015d6:    4698        .F      MOV      r8,r3
        0x000015d8:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x000015dc:    2f00        ./      CMP      r7,#0
        0x000015de:    da01        ..      BGE      0x15e4 ; _PrintInt + 24
        0x000015e0:    4278        xB      RSBS     r0,r7,#0
        0x000015e2:    e000        ..      B        0x15e6 ; _PrintInt + 26
        0x000015e4:    4638        8F      MOV      r0,r7
        0x000015e6:    4683        .F      MOV      r11,r0
        0x000015e8:    f04f0901    O...    MOV      r9,#1
        0x000015ec:    e003        ..      B        0x15f6 ; _PrintInt + 42
        0x000015ee:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x000015f2:    f1090901    ....    ADD      r9,r9,#1
        0x000015f6:    45d3        .E      CMP      r11,r10
        0x000015f8:    daf9        ..      BGE      0x15ee ; _PrintInt + 34
        0x000015fa:    45c8        .E      CMP      r8,r9
        0x000015fc:    d900        ..      BLS      0x1600 ; _PrintInt + 52
        0x000015fe:    46c1        .F      MOV      r9,r8
        0x00001600:    b134        4.      CBZ      r4,0x1610 ; _PrintInt + 68
        0x00001602:    2f00        ./      CMP      r7,#0
        0x00001604:    db03        ..      BLT      0x160e ; _PrintInt + 66
        0x00001606:    f0050004    ....    AND      r0,r5,#4
        0x0000160a:    2804        .(      CMP      r0,#4
        0x0000160c:    d100        ..      BNE      0x1610 ; _PrintInt + 68
        0x0000160e:    1e64        d.      SUBS     r4,r4,#1
        0x00001610:    f0050002    ....    AND      r0,r5,#2
        0x00001614:    b110        ..      CBZ      r0,0x161c ; _PrintInt + 80
        0x00001616:    f1b80f00    ....    CMP      r8,#0
        0x0000161a:    d011        ..      BEQ      0x1640 ; _PrintInt + 116
        0x0000161c:    f0050001    ....    AND      r0,r5,#1
        0x00001620:    b970        p.      CBNZ     r0,0x1640 ; _PrintInt + 116
        0x00001622:    b16c        l.      CBZ      r4,0x1640 ; _PrintInt + 116
        0x00001624:    e008        ..      B        0x1638 ; _PrintInt + 108
        0x00001626:    1e64        d.      SUBS     r4,r4,#1
        0x00001628:    2120         !      MOVS     r1,#0x20
        0x0000162a:    4630        0F      MOV      r0,r6
        0x0000162c:    f000f8ba    ....    BL       _StoreChar ; 0x17a4
        0x00001630:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001632:    2800        .(      CMP      r0,#0
        0x00001634:    da00        ..      BGE      0x1638 ; _PrintInt + 108
        0x00001636:    e002        ..      B        0x163e ; _PrintInt + 114
        0x00001638:    b10c        ..      CBZ      r4,0x163e ; _PrintInt + 114
        0x0000163a:    45a1        .E      CMP      r9,r4
        0x0000163c:    d3f3        ..      BCC      0x1626 ; _PrintInt + 90
        0x0000163e:    bf00        ..      NOP      
        0x00001640:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001642:    2800        .(      CMP      r0,#0
        0x00001644:    db36        6.      BLT      0x16b4 ; _PrintInt + 232
        0x00001646:    2f00        ./      CMP      r7,#0
        0x00001648:    da05        ..      BGE      0x1656 ; _PrintInt + 138
        0x0000164a:    427f        .B      RSBS     r7,r7,#0
        0x0000164c:    212d        -!      MOVS     r1,#0x2d
        0x0000164e:    4630        0F      MOV      r0,r6
        0x00001650:    f000f8a8    ....    BL       _StoreChar ; 0x17a4
        0x00001654:    e007        ..      B        0x1666 ; _PrintInt + 154
        0x00001656:    f0050004    ....    AND      r0,r5,#4
        0x0000165a:    2804        .(      CMP      r0,#4
        0x0000165c:    d103        ..      BNE      0x1666 ; _PrintInt + 154
        0x0000165e:    212b        +!      MOVS     r1,#0x2b
        0x00001660:    4630        0F      MOV      r0,r6
        0x00001662:    f000f89f    ....    BL       _StoreChar ; 0x17a4
        0x00001666:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001668:    2800        .(      CMP      r0,#0
        0x0000166a:    db23        #.      BLT      0x16b4 ; _PrintInt + 232
        0x0000166c:    f0050002    ....    AND      r0,r5,#2
        0x00001670:    2802        .(      CMP      r0,#2
        0x00001672:    d114        ..      BNE      0x169e ; _PrintInt + 210
        0x00001674:    f0050001    ....    AND      r0,r5,#1
        0x00001678:    b988        ..      CBNZ     r0,0x169e ; _PrintInt + 210
        0x0000167a:    f1b80f00    ....    CMP      r8,#0
        0x0000167e:    d10e        ..      BNE      0x169e ; _PrintInt + 210
        0x00001680:    b16c        l.      CBZ      r4,0x169e ; _PrintInt + 210
        0x00001682:    e008        ..      B        0x1696 ; _PrintInt + 202
        0x00001684:    1e64        d.      SUBS     r4,r4,#1
        0x00001686:    2130        0!      MOVS     r1,#0x30
        0x00001688:    4630        0F      MOV      r0,r6
        0x0000168a:    f000f88b    ....    BL       _StoreChar ; 0x17a4
        0x0000168e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001690:    2800        .(      CMP      r0,#0
        0x00001692:    da00        ..      BGE      0x1696 ; _PrintInt + 202
        0x00001694:    e002        ..      B        0x169c ; _PrintInt + 208
        0x00001696:    b10c        ..      CBZ      r4,0x169c ; _PrintInt + 208
        0x00001698:    45a1        .E      CMP      r9,r4
        0x0000169a:    d3f3        ..      BCC      0x1684 ; _PrintInt + 184
        0x0000169c:    bf00        ..      NOP      
        0x0000169e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x000016a0:    2800        .(      CMP      r0,#0
        0x000016a2:    db07        ..      BLT      0x16b4 ; _PrintInt + 232
        0x000016a4:    4643        CF      MOV      r3,r8
        0x000016a6:    4652        RF      MOV      r2,r10
        0x000016a8:    4639        9F      MOV      r1,r7
        0x000016aa:    4630        0F      MOV      r0,r6
        0x000016ac:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x000016b0:    f000f802    ....    BL       _PrintUnsigned ; 0x16b8
        0x000016b4:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x000016b8:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x000016bc:    4680        .F      MOV      r8,r0
        0x000016be:    4689        .F      MOV      r9,r1
        0x000016c0:    4615        .F      MOV      r5,r2
        0x000016c2:    461e        .F      MOV      r6,r3
        0x000016c4:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x000016c6:    f8cd9004    ....    STR      r9,[sp,#4]
        0x000016ca:    2701        .'      MOVS     r7,#1
        0x000016cc:    46bb        .F      MOV      r11,r7
        0x000016ce:    e005        ..      B        0x16dc ; _PrintUnsigned + 36
        0x000016d0:    9801        ..      LDR      r0,[sp,#4]
        0x000016d2:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x000016d6:    9001        ..      STR      r0,[sp,#4]
        0x000016d8:    f10b0b01    ....    ADD      r11,r11,#1
        0x000016dc:    9801        ..      LDR      r0,[sp,#4]
        0x000016de:    42a8        .B      CMP      r0,r5
        0x000016e0:    d2f6        ..      BCS      0x16d0 ; _PrintUnsigned + 24
        0x000016e2:    455e        ^E      CMP      r6,r11
        0x000016e4:    d900        ..      BLS      0x16e8 ; _PrintUnsigned + 48
        0x000016e6:    46b3        .F      MOV      r11,r6
        0x000016e8:    980d        ..      LDR      r0,[sp,#0x34]
        0x000016ea:    f0000001    ....    AND      r0,r0,#1
        0x000016ee:    b9d0        ..      CBNZ     r0,0x1726 ; _PrintUnsigned + 110
        0x000016f0:    b1cc        ..      CBZ      r4,0x1726 ; _PrintUnsigned + 110
        0x000016f2:    980d        ..      LDR      r0,[sp,#0x34]
        0x000016f4:    f0000002    ....    AND      r0,r0,#2
        0x000016f8:    2802        .(      CMP      r0,#2
        0x000016fa:    d103        ..      BNE      0x1704 ; _PrintUnsigned + 76
        0x000016fc:    b916        ..      CBNZ     r6,0x1704 ; _PrintUnsigned + 76
        0x000016fe:    2030        0       MOVS     r0,#0x30
        0x00001700:    9000        ..      STR      r0,[sp,#0]
        0x00001702:    e001        ..      B        0x1708 ; _PrintUnsigned + 80
        0x00001704:    2020                MOVS     r0,#0x20
        0x00001706:    9000        ..      STR      r0,[sp,#0]
        0x00001708:    e009        ..      B        0x171e ; _PrintUnsigned + 102
        0x0000170a:    1e64        d.      SUBS     r4,r4,#1
        0x0000170c:    4640        @F      MOV      r0,r8
        0x0000170e:    9900        ..      LDR      r1,[sp,#0]
        0x00001710:    f000f848    ..H.    BL       _StoreChar ; 0x17a4
        0x00001714:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001718:    2800        .(      CMP      r0,#0
        0x0000171a:    da00        ..      BGE      0x171e ; _PrintUnsigned + 102
        0x0000171c:    e002        ..      B        0x1724 ; _PrintUnsigned + 108
        0x0000171e:    b10c        ..      CBZ      r4,0x1724 ; _PrintUnsigned + 108
        0x00001720:    45a3        .E      CMP      r11,r4
        0x00001722:    d3f2        ..      BCC      0x170a ; _PrintUnsigned + 82
        0x00001724:    bf00        ..      NOP      
        0x00001726:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000172a:    2800        .(      CMP      r0,#0
        0x0000172c:    db35        5.      BLT      0x179a ; _PrintUnsigned + 226
        0x0000172e:    e009        ..      B        0x1744 ; _PrintUnsigned + 140
        0x00001730:    2e01        ..      CMP      r6,#1
        0x00001732:    d901        ..      BLS      0x1738 ; _PrintUnsigned + 128
        0x00001734:    1e76        v.      SUBS     r6,r6,#1
        0x00001736:    e004        ..      B        0x1742 ; _PrintUnsigned + 138
        0x00001738:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x0000173c:    45aa        .E      CMP      r10,r5
        0x0000173e:    d200        ..      BCS      0x1742 ; _PrintUnsigned + 138
        0x00001740:    e001        ..      B        0x1746 ; _PrintUnsigned + 142
        0x00001742:    436f        oC      MULS     r7,r5,r7
        0x00001744:    e7f4        ..      B        0x1730 ; _PrintUnsigned + 120
        0x00001746:    bf00        ..      NOP      
        0x00001748:    bf00        ..      NOP      
        0x0000174a:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x0000174e:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x00001752:    4813        .H      LDR      r0,[pc,#76] ; [0x17a0] = 0x1a0c
        0x00001754:    f810100a    ....    LDRB     r1,[r0,r10]
        0x00001758:    4640        @F      MOV      r0,r8
        0x0000175a:    f000f823    ..#.    BL       _StoreChar ; 0x17a4
        0x0000175e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001762:    2800        .(      CMP      r0,#0
        0x00001764:    da00        ..      BGE      0x1768 ; _PrintUnsigned + 176
        0x00001766:    e003        ..      B        0x1770 ; _PrintUnsigned + 184
        0x00001768:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x0000176c:    2f00        ./      CMP      r7,#0
        0x0000176e:    d1ec        ..      BNE      0x174a ; _PrintUnsigned + 146
        0x00001770:    bf00        ..      NOP      
        0x00001772:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001774:    f0000001    ....    AND      r0,r0,#1
        0x00001778:    b178        x.      CBZ      r0,0x179a ; _PrintUnsigned + 226
        0x0000177a:    b174        t.      CBZ      r4,0x179a ; _PrintUnsigned + 226
        0x0000177c:    e009        ..      B        0x1792 ; _PrintUnsigned + 218
        0x0000177e:    1e64        d.      SUBS     r4,r4,#1
        0x00001780:    2120         !      MOVS     r1,#0x20
        0x00001782:    4640        @F      MOV      r0,r8
        0x00001784:    f000f80e    ....    BL       _StoreChar ; 0x17a4
        0x00001788:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000178c:    2800        .(      CMP      r0,#0
        0x0000178e:    da00        ..      BGE      0x1792 ; _PrintUnsigned + 218
        0x00001790:    e002        ..      B        0x1798 ; _PrintUnsigned + 224
        0x00001792:    b10c        ..      CBZ      r4,0x1798 ; _PrintUnsigned + 224
        0x00001794:    45a3        .E      CMP      r11,r4
        0x00001796:    d3f2        ..      BCC      0x177e ; _PrintUnsigned + 198
        0x00001798:    bf00        ..      NOP      
        0x0000179a:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x0000179e:    0000        ..      DCW    0
        0x000017a0:    00001a0c    ....    DCD    6668
    $t
    i._StoreChar
    _StoreChar
        0x000017a4:    b570        p.      PUSH     {r4-r6,lr}
        0x000017a6:    4604        .F      MOV      r4,r0
        0x000017a8:    460e        .F      MOV      r6,r1
        0x000017aa:    68a5        .h      LDR      r5,[r4,#8]
        0x000017ac:    1c68        h.      ADDS     r0,r5,#1
        0x000017ae:    6861        ah      LDR      r1,[r4,#4]
        0x000017b0:    4281        .B      CMP      r1,r0
        0x000017b2:    d306        ..      BCC      0x17c2 ; _StoreChar + 30
        0x000017b4:    6820         h      LDR      r0,[r4,#0]
        0x000017b6:    5546        FU      STRB     r6,[r0,r5]
        0x000017b8:    1c68        h.      ADDS     r0,r5,#1
        0x000017ba:    60a0        .`      STR      r0,[r4,#8]
        0x000017bc:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000017be:    1c40        @.      ADDS     r0,r0,#1
        0x000017c0:    60e0        .`      STR      r0,[r4,#0xc]
        0x000017c2:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x000017c6:    4288        .B      CMP      r0,r1
        0x000017c8:    d10d        ..      BNE      0x17e6 ; _StoreChar + 66
        0x000017ca:    68a2        .h      LDR      r2,[r4,#8]
        0x000017cc:    6821        !h      LDR      r1,[r4,#0]
        0x000017ce:    6920         i      LDR      r0,[r4,#0x10]
        0x000017d0:    f7fffc74    ..t.    BL       SEGGER_RTT_Write ; 0x10bc
        0x000017d4:    68a1        .h      LDR      r1,[r4,#8]
        0x000017d6:    4288        .B      CMP      r0,r1
        0x000017d8:    d003        ..      BEQ      0x17e2 ; _StoreChar + 62
        0x000017da:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000017de:    60e0        .`      STR      r0,[r4,#0xc]
        0x000017e0:    e001        ..      B        0x17e6 ; _StoreChar + 66
        0x000017e2:    2000        .       MOVS     r0,#0
        0x000017e4:    60a0        .`      STR      r0,[r4,#8]
        0x000017e6:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x000017e8:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x000017ec:    4604        .F      MOV      r4,r0
        0x000017ee:    4689        .F      MOV      r9,r1
        0x000017f0:    4617        .F      MOV      r7,r2
        0x000017f2:    f04f0a00    O...    MOV      r10,#0
        0x000017f6:    68e5        .h      LDR      r5,[r4,#0xc]
        0x000017f8:    bf00        ..      NOP      
        0x000017fa:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x000017fe:    45a8        .E      CMP      r8,r5
        0x00001800:    d903        ..      BLS      0x180a ; _WriteBlocking + 34
        0x00001802:    eba80005    ....    SUB      r0,r8,r5
        0x00001806:    1e46        F.      SUBS     r6,r0,#1
        0x00001808:    e004        ..      B        0x1814 ; _WriteBlocking + 44
        0x0000180a:    eba50008    ....    SUB      r0,r5,r8
        0x0000180e:    1c40        @.      ADDS     r0,r0,#1
        0x00001810:    68a1        .h      LDR      r1,[r4,#8]
        0x00001812:    1a0e        ..      SUBS     r6,r1,r0
        0x00001814:    68a0        .h      LDR      r0,[r4,#8]
        0x00001816:    1b40        @.      SUBS     r0,r0,r5
        0x00001818:    42b0        .B      CMP      r0,r6
        0x0000181a:    d901        ..      BLS      0x1820 ; _WriteBlocking + 56
        0x0000181c:    4630        0F      MOV      r0,r6
        0x0000181e:    e001        ..      B        0x1824 ; _WriteBlocking + 60
        0x00001820:    68a0        .h      LDR      r0,[r4,#8]
        0x00001822:    1b40        @.      SUBS     r0,r0,r5
        0x00001824:    4606        .F      MOV      r6,r0
        0x00001826:    42be        .B      CMP      r6,r7
        0x00001828:    d201        ..      BCS      0x182e ; _WriteBlocking + 70
        0x0000182a:    4630        0F      MOV      r0,r6
        0x0000182c:    e000        ..      B        0x1830 ; _WriteBlocking + 72
        0x0000182e:    4638        8F      MOV      r0,r7
        0x00001830:    4606        .F      MOV      r6,r0
        0x00001832:    6861        ah      LDR      r1,[r4,#4]
        0x00001834:    1948        H.      ADDS     r0,r1,r5
        0x00001836:    4632        2F      MOV      r2,r6
        0x00001838:    4649        IF      MOV      r1,r9
        0x0000183a:    f7fefdad    ....    BL       __aeabi_memcpy ; 0x398
        0x0000183e:    44b2        .D      ADD      r10,r10,r6
        0x00001840:    44b1        .D      ADD      r9,r9,r6
        0x00001842:    1bbf        ..      SUBS     r7,r7,r6
        0x00001844:    4435        5D      ADD      r5,r5,r6
        0x00001846:    68a0        .h      LDR      r0,[r4,#8]
        0x00001848:    42a8        .B      CMP      r0,r5
        0x0000184a:    d100        ..      BNE      0x184e ; _WriteBlocking + 102
        0x0000184c:    2500        .%      MOVS     r5,#0
        0x0000184e:    60e5        .`      STR      r5,[r4,#0xc]
        0x00001850:    2f00        ./      CMP      r7,#0
        0x00001852:    d1d2        ..      BNE      0x17fa ; _WriteBlocking + 18
        0x00001854:    4650        PF      MOV      r0,r10
        0x00001856:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x0000185a:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000185e:    4604        .F      MOV      r4,r0
        0x00001860:    4689        .F      MOV      r9,r1
        0x00001862:    4615        .F      MOV      r5,r2
        0x00001864:    68e6        .h      LDR      r6,[r4,#0xc]
        0x00001866:    68a0        .h      LDR      r0,[r4,#8]
        0x00001868:    1b87        ..      SUBS     r7,r0,r6
        0x0000186a:    42af        .B      CMP      r7,r5
        0x0000186c:    d908        ..      BLS      0x1880 ; _WriteNoCheck + 38
        0x0000186e:    6861        ah      LDR      r1,[r4,#4]
        0x00001870:    1988        ..      ADDS     r0,r1,r6
        0x00001872:    462a        *F      MOV      r2,r5
        0x00001874:    4649        IF      MOV      r1,r9
        0x00001876:    f7fefd8f    ....    BL       __aeabi_memcpy ; 0x398
        0x0000187a:    1970        p.      ADDS     r0,r6,r5
        0x0000187c:    60e0        .`      STR      r0,[r4,#0xc]
        0x0000187e:    e010        ..      B        0x18a2 ; _WriteNoCheck + 72
        0x00001880:    46b8        .F      MOV      r8,r7
        0x00001882:    6861        ah      LDR      r1,[r4,#4]
        0x00001884:    1988        ..      ADDS     r0,r1,r6
        0x00001886:    4642        BF      MOV      r2,r8
        0x00001888:    4649        IF      MOV      r1,r9
        0x0000188a:    f7fefd85    ....    BL       __aeabi_memcpy ; 0x398
        0x0000188e:    eba50807    ....    SUB      r8,r5,r7
        0x00001892:    eb090107    ....    ADD      r1,r9,r7
        0x00001896:    4642        BF      MOV      r2,r8
        0x00001898:    6860        `h      LDR      r0,[r4,#4]
        0x0000189a:    f7fefd7d    ..}.    BL       __aeabi_memcpy ; 0x398
        0x0000189e:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x000018a2:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000018a6:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x000018a8:    4604        .F      MOV      r4,r0
        0x000018aa:    460d        .F      MOV      r5,r1
        0x000018ac:    4616        .F      MOV      r6,r2
        0x000018ae:    b672        r.      CPSID    i
        0x000018b0:    4623        #F      MOV      r3,r4
        0x000018b2:    4632        2F      MOV      r2,r6
        0x000018b4:    4629        )F      MOV      r1,r5
        0x000018b6:    a002        ..      ADR      r0,{pc}+0xa ; 0x18c0
        0x000018b8:    f7fefca4    ....    BL       __2printf ; 0x204
        0x000018bc:    bf00        ..      NOP      
        0x000018be:    e7fe        ..      B        0x18be ; __aeabi_assert + 22
    $d
        0x000018c0:    65737341    Asse    DCD    1702064961
        0x000018c4:    6f697472    rtio    DCD    1869182066
        0x000018c8:    6146206e    n Fa    DCD    1631985774
        0x000018cc:    64656c69    iled    DCD    1684368489
        0x000018d0:    6966203a    : fi    DCD    1768300602
        0x000018d4:    2520656c    le %    DCD    622880108
        0x000018d8:    6c202c73    s, l    DCD    1814047859
        0x000018dc:    20656e69    ine     DCD    543518313
        0x000018e0:    202c6425    %d,     DCD    539780133
        0x000018e4:    000a7325    %s..    DCD    684837
    $t
    i.delay
    delay
        0x000018e8:    2100        .!      MOVS     r1,#0
        0x000018ea:    e006        ..      B        0x18fa ; delay + 18
        0x000018ec:    bf00        ..      NOP      
        0x000018ee:    bf00        ..      NOP      
        0x000018f0:    bf00        ..      NOP      
        0x000018f2:    bf00        ..      NOP      
        0x000018f4:    bf00        ..      NOP      
        0x000018f6:    bf00        ..      NOP      
        0x000018f8:    1c49        I.      ADDS     r1,r1,#1
        0x000018fa:    4281        .B      CMP      r1,r0
        0x000018fc:    d3f6        ..      BCC      0x18ec ; delay + 4
        0x000018fe:    4770        pG      BX       lr
    i.fputc
    fputc
        0x00001900:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00001902:    460c        .F      MOV      r4,r1
        0x00001904:    2201        ."      MOVS     r2,#1
        0x00001906:    4669        iF      MOV      r1,sp
        0x00001908:    2000        .       MOVS     r0,#0
        0x0000190a:    f7fffbd7    ....    BL       SEGGER_RTT_Write ; 0x10bc
        0x0000190e:    9800        ..      LDR      r0,[sp,#0]
        0x00001910:    bd1c        ..      POP      {r2-r4,pc}
        0x00001912:    0000        ..      MOVS     r0,r0
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00001914:    4903        .I      LDR      r1,[pc,#12] ; [0x1924] = 0x40007000
        0x00001916:    6809        .h      LDR      r1,[r1,#0]
        0x00001918:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000191c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1924] = 0x40007000
        0x0000191e:    6011        .`      STR      r1,[r2,#0]
        0x00001920:    4770        pG      BX       lr
    $d
        0x00001922:    0000        ..      DCW    0
        0x00001924:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00001928:    4903        .I      LDR      r1,[pc,#12] ; [0x1938] = 0x40007000
        0x0000192a:    68c9        .h      LDR      r1,[r1,#0xc]
        0x0000192c:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001930:    4a01        .J      LDR      r2,[pc,#4] ; [0x1938] = 0x40007000
        0x00001932:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001934:    4770        pG      BX       lr
    $d
        0x00001936:    0000        ..      DCW    0
        0x00001938:    40007000    .p.@    DCD    1073770496
    $t
    i.int_callback_register
    int_callback_register
        0x0000193c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000193e:    4604        .F      MOV      r4,r0
        0x00001940:    460e        .F      MOV      r6,r1
        0x00001942:    4615        .F      MOV      r5,r2
        0x00001944:    2c12        .,      CMP      r4,#0x12
        0x00001946:    da00        ..      BGE      0x194a ; int_callback_register + 14
        0x00001948:    e004        ..      B        0x1954 ; int_callback_register + 24
        0x0000194a:    220b        ."      MOVS     r2,#0xb
        0x0000194c:    a106        ..      ADR      r1,{pc}+0x1c ; 0x1968
        0x0000194e:    a010        ..      ADR      r0,{pc}+0x42 ; 0x1990
        0x00001950:    f7ffffaa    ....    BL       __aeabi_assert ; 0x18a8
        0x00001954:    4815        .H      LDR      r0,[pc,#84] ; [0x19ac] = 0x88
        0x00001956:    f8406034    @.4`    STR      r6,[r0,r4,LSL #3]
        0x0000195a:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x0000195e:    6045        E`      STR      r5,[r0,#4]
        0x00001960:    4812        .H      LDR      r0,[pc,#72] ; [0x19ac] = 0x88
        0x00001962:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x00001966:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001968:    2e5c2e2e    ..\.    DCD    777793070
        0x0000196c:    2e2e5c2e    .\..    DCD    774790190
        0x00001970:    464c455c    \ELF    DCD    1179403612
        0x00001974:    53425f32    2_BS    DCD    1396858674
        0x00001978:    72445c50    P\Dr    DCD    1917082704
        0x0000197c:    72657669    iver    DCD    1919252073
        0x00001980:    746e695c    \int    DCD    1953392988
        0x00001984:    6765725f    _reg    DCD    1734701663
        0x00001988:    65747369    iste    DCD    1702130537
        0x0000198c:    00632e72    r.c.    DCD    6499954
        0x00001990:    65646e69    inde    DCD    1701080681
        0x00001994:    203c2078    x <     DCD    540811384
        0x00001998:    5f565244    DRV_    DCD    1599492676
        0x0000199c:    4c4c4143    CALL    DCD    1280065859
        0x000019a0:    4b434142    BACK    DCD    1262698818
        0x000019a4:    58414d5f    _MAX    DCD    1480674655
        0x000019a8:    00000000    ....    DCD    0
        0x000019ac:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x000019b0:    a104        ..      ADR      r1,{pc}+0x14 ; 0x19c4
        0x000019b2:    2000        .       MOVS     r0,#0
        0x000019b4:    f7fffbe8    ....    BL       SEGGER_RTT_printf ; 0x1188
        0x000019b8:    f7fffb28    ..(.    BL       RTC_Init ; 0x100c
        0x000019bc:    f7feffa4    ....    BL       GPIO_Init ; 0x908
        0x000019c0:    bf00        ..      NOP      
        0x000019c2:    e7fe        ..      B        0x19c2 ; main + 18
    $d
        0x000019c4:    6c6c6548    Hell    DCD    1819043144
        0x000019c8:    6f57206f    o Wo    DCD    1867980911
        0x000019cc:    20646c72    rld     DCD    543452274
        0x000019d0:    38313032    2018    DCD    942747698
        0x000019d4:    38303830    0808    DCD    942684208
        0x000019d8:    00000a7e    ~...    DCD    2686
    $t
    i.my_rtc_isr
    my_rtc_isr
        0x000019dc:    b510        ..      PUSH     {r4,lr}
        0x000019de:    f7fff8df    ....    BL       HAL_RTC_ClearIrq ; 0xba0
        0x000019e2:    2007        .       MOVS     r0,#7
        0x000019e4:    f7fff82c    ..,.    BL       HAL_GPIO_TogglePin ; 0xa40
        0x000019e8:    bd10        ..      POP      {r4,pc}
        0x000019ea:    0000        ..      MOVS     r0,r0
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x000019ec:    4901        .I      LDR      r1,[pc,#4] ; [0x19f4] = 0x40020000
        0x000019ee:    6008        .`      STR      r0,[r1,#0]
        0x000019f0:    4770        pG      BX       lr
    $d
        0x000019f2:    0000        ..      DCW    0
        0x000019f4:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x000019f8:    4903        .I      LDR      r1,[pc,#12] ; [0x1a08] = 0x40020000
        0x000019fa:    6849        Ih      LDR      r1,[r1,#4]
        0x000019fc:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001a00:    4a01        .J      LDR      r2,[pc,#4] ; [0x1a08] = 0x40020000
        0x00001a02:    6051        Q`      STR      r1,[r2,#4]
        0x00001a04:    4770        pG      BX       lr
    $d
        0x00001a06:    0000        ..      DCW    0
        0x00001a08:    40020000    ...@    DCD    1073872896
    $d.realdata
    .constdata
    _aV2C
        0x00001a0c:    33323130    0123    DCD    858927408
        0x00001a10:    37363534    4567    DCD    926299444
        0x00001a14:    42413938    89AB    DCD    1111570744
        0x00001a18:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001a1c:    00001a3c    <...    DCD    6716
        0x00001a20:    20000000    ...     DCD    536870912
        0x00001a24:    00000008    ....    DCD    8
        0x00001a28:    00000154    T...    DCD    340
        0x00001a2c:    00001a44    D...    DCD    6724
        0x00001a30:    20000008    ...     DCD    536870920
        0x00001a34:    00000a28    (...    DCD    2600
        0x00001a38:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 6768 (0x1a70)
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
    File Offset : 6776 (0x1a78)
    Size        : 2600 bytes (0xa28)
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
    File Offset : 6776 (0x1a78)
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
    File Offset : 8252 (0x203c)
    Size        : 2904 bytes (0xb58)
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
    File Offset : 11156 (0x2b94)
    Size        : 70736 bytes (0x11450)
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
    File Offset : 81892 (0x13fe4)
    Size        : 12692 bytes (0x3194)
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
    File Offset : 94584 (0x17178)
    Size        : 4096 bytes (0x1000)
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
    File Offset : 98680 (0x18178)
    Size        : 28216 bytes (0x6e38)
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
    File Offset : 126896 (0x1efb0)
    Size        : 2217 bytes (0x8a9)
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
    File Offset : 129116 (0x1f85c)
    Size        : 8608 bytes (0x21a0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 381
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 137724 (0x219fc)
    Size        : 7228 bytes (0x1c3c)
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
    File Offset : 144952 (0x23638)
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
    File Offset : 144988 (0x2365c)
    Size        : 13324 bytes (0x340c)
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
    
    p45fc-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p45fc-2
    
    
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_demo.o --vfemode=force

    Input Comments:
    
    p4e9c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4e9c-2
    
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_demo.o --depend=.\objects\test_demo.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_demo.crf src\test_demo.c
    
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p4948-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4948-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p6210-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p6210-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\RTC_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
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
    
    
    
    
    
    rtc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\rtc.o --vfemode=force

    Input Comments:
    
    p38c0-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p38c0-2
    
    
    
    rtc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\rtc.o --depend=.\objects\rtc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\rtc.crf ..\sdk\src\soc\driver\rtc.c
    
    
    
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
    File Offset : 158312 (0x26a68)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x20000014  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x20000014  0x10       _SEGGER_RTT.acID                         array[16] of char
0x20000024  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x20000028  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x2000002c  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x20000074  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x200004bc  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x200000bc  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x20000004  0x4        __stdout                                 FILE
0x20000004  0x4        __stdout.handle                          int

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000008  0xc        rtc_cfg                                  RTC_InitTypeDef
0x20000008  0x4        rtc_cfg.counter_match                    uint32_t
0x2000000c  0x4        rtc_cfg.counter_load                     uint32_t
0x20000010  0x1        rtc_cfg.wrap_en                          RTC_WrapEn
0x20000011  0x1        rtc_cfg.int_mask                         RTC_IntMask
0x20000012  0x1        rtc_cfg.int_en                           RTC_IntEn

