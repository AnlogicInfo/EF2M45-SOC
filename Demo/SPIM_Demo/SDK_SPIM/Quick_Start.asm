
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

    Program header offset: 210980 (0x00033824)
    Section header offset: 211012 (0x00033844)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 13724 bytes (0x359c)
    Size in memory: 22024 bytes (0x5608)
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
    Size        : 13416 bytes (0x3468)
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
        0x0000014c:    00003414    .4..    DCD    13332
        0x00000150:    00003434    44..    DCD    13364
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
        0x00000194:    f00081c9    ....    BEQ.W    _printf_string ; 0x52a
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
        0x000001a4:    f000fa95    ....    BL       __user_setup_stackheap ; 0x6d2
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
        0x000001ae:    f002fcaf    ....    BL       main ; 0x2b10
        0x000001b2:    f000fab3    ....    BL       exit ; 0x71c
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
        0x000001be:    f000f943    ..C.    BL       _sys_exit ; 0x448
        0x000001c2:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x17fd
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
        0x000001e0:    4804        .H      LDR      r0,[pc,#16] ; [0x1f4] = 0x20001b88
        0x000001e2:    4905        .I      LDR      r1,[pc,#20] ; [0x1f8] = 0x20002088
        0x000001e4:    4a05        .J      LDR      r2,[pc,#20] ; [0x1fc] = 0x20001c88
        0x000001e6:    4b06        .K      LDR      r3,[pc,#24] ; [0x200] = 0x20001c88
        0x000001e8:    4770        pG      BX       lr
    $d
        0x000001ea:    0000        ..      DCW    0
        0x000001ec:    000017fd    ....    DCD    6141
        0x000001f0:    00000119    ....    DCD    281
        0x000001f4:    20001b88    ...     DCD    536877960
        0x000001f8:    20002088    . .     DCD    536879240
        0x000001fc:    20001c88    ...     DCD    536878216
        0x00000200:    20001c88    ...     DCD    536878216
    $t
    .text
    __2printf
        0x00000204:    b40f        ..      PUSH     {r0-r3}
        0x00000206:    4904        .I      LDR      r1,[pc,#16] ; [0x218] = 0x2000000c
        0x00000208:    b510        ..      PUSH     {r4,lr}
        0x0000020a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000020c:    9802        ..      LDR      r0,[sp,#8]
        0x0000020e:    f000f991    ....    BL       _printf_char_file ; 0x534
        0x00000212:    bc10        ..      POP      {r4}
        0x00000214:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000218:    2000000c    ...     DCD    536870924
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
        0x0000033c:    f000b88a    ....    B.W      _printf_int_common ; 0x454
    $d
        0x00000340:    00000000    ....    DCD    0
        0x00000344:    0000002d    -...    DCD    45
        0x00000348:    0000002b    +...    DCD    43
        0x0000034c:    00000020     ...    DCD    32
    $t
    .text
    abort
        0x00000350:    2000        .       MOVS     r0,#0
        0x00000352:    f000f901    ....    BL       __rt_SIGABRT ; 0x558
        0x00000356:    f7ffff23    ..#.    BL       __rt_lib_shutdown ; 0x1a0
        0x0000035a:    2001        .       MOVS     r0,#1
        0x0000035c:    f000f874    ..t.    BL       _sys_exit ; 0x448
    .text
    strcpy
        0x00000360:    ea400301    @...    ORR      r3,r0,r1
        0x00000364:    4602        .F      MOV      r2,r0
        0x00000366:    b530        0.      PUSH     {r4,r5,lr}
        0x00000368:    079b        ..      LSLS     r3,r3,#30
        0x0000036a:    d110        ..      BNE      0x38e ; strcpy + 46
        0x0000036c:    f04f3401    O..4    MOV      r4,#0x1010101
        0x00000370:    e000        ..      B        0x374 ; strcpy + 20
        0x00000372:    c208        ..      STM      r2!,{r3}
        0x00000374:    c908        ..      LDM      r1!,{r3}
        0x00000376:    1b1d        ..      SUBS     r5,r3,r4
        0x00000378:    439d        .C      BICS     r5,r5,r3
        0x0000037a:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x0000037e:    d0f8        ..      BEQ      0x372 ; strcpy + 18
        0x00000380:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x00000384:    f8021b01    ....    STRB     r1,[r2],#1
        0x00000388:    d00d        ..      BEQ      0x3a6 ; strcpy + 70
        0x0000038a:    0a1b        ..      LSRS     r3,r3,#8
        0x0000038c:    e7f8        ..      B        0x380 ; strcpy + 32
        0x0000038e:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000392:    2b00        .+      CMP      r3,#0
        0x00000394:    f8023b01    ...;    STRB     r3,[r2],#1
        0x00000398:    d005        ..      BEQ      0x3a6 ; strcpy + 70
        0x0000039a:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x0000039e:    2b00        .+      CMP      r3,#0
        0x000003a0:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003a4:    d1f3        ..      BNE      0x38e ; strcpy + 46
        0x000003a6:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x000003a8:    2a03        .*      CMP      r2,#3
        0x000003aa:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x40e
        0x000003ae:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003b2:    f0008015    ....    BEQ.W    0x3e0 ; __aeabi_memcpy + 56
        0x000003b6:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003ba:    f1bc0f02    ....    CMP      r12,#2
        0x000003be:    4462        bD      ADD      r2,r2,r12
        0x000003c0:    bf98        ..      IT       LS
        0x000003c2:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x000003c6:    f8003b01    ...;    STRB     r3,[r0],#1
        0x000003ca:    bf38        8.      IT       CC
        0x000003cc:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x000003d0:    f1a20204    ....    SUB      r2,r2,#4
        0x000003d4:    bf98        ..      IT       LS
        0x000003d6:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x000003da:    bf38        8.      IT       CC
        0x000003dc:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x000003e0:    f0110303    ....    ANDS     r3,r1,#3
        0x000003e4:    f00080bf    ....    BEQ.W    __aeabi_memcpy4 ; 0x566
        0x000003e8:    3a08        .:      SUBS     r2,r2,#8
        0x000003ea:    f0c08008    ....    BCC.W    0x3fe ; __aeabi_memcpy + 86
        0x000003ee:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x000003f2:    3a08        .:      SUBS     r2,r2,#8
        0x000003f4:    f851cb04    Q...    LDR      r12,[r1],#4
        0x000003f8:    e8a01008    ....    STM      r0!,{r3,r12}
        0x000003fc:    e7f5        ..      B        0x3ea ; __aeabi_memcpy + 66
        0x000003fe:    1d12        ..      ADDS     r2,r2,#4
        0x00000400:    bf5c        \.      ITT      PL
        0x00000402:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x00000406:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x0000040a:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x0000040e:    07d2        ..      LSLS     r2,r2,#31
        0x00000410:    bf24        $.      ITT      CS
        0x00000412:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x00000416:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000041a:    bf48        H.      IT       MI
        0x0000041c:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000420:    bf24        $.      ITT      CS
        0x00000422:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x00000426:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000042a:    bf48        H.      IT       MI
        0x0000042c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000430:    4770        pG      BX       lr
    .text
    __aeabi_memset
        0x00000432:    f00203ff    ....    AND      r3,r2,#0xff
        0x00000436:    ea432203    C.."    ORR      r2,r3,r3,LSL #8
        0x0000043a:    ea424202    B..B    ORR      r2,r2,r2,LSL #16
        0x0000043e:    f000b8c6    ....    B.W      _memset ; 0x5ce
    .text
    __use_two_region_memory
        0x00000442:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000444:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x00000446:    4770        pG      BX       lr
    .text
    _sys_exit
        0x00000448:    4901        .I      LDR      r1,[pc,#4] ; [0x450] = 0x20026
        0x0000044a:    2018        .       MOVS     r0,#0x18
        0x0000044c:    beab        ..      BKPT     #0xab
        0x0000044e:    e7fe        ..      B        0x44e ; _sys_exit + 6
    $d
        0x00000450:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x00000454:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000458:    460d        .F      MOV      r5,r1
        0x0000045a:    4699        .F      MOV      r9,r3
        0x0000045c:    4692        .F      MOV      r10,r2
        0x0000045e:    4604        .F      MOV      r4,r0
        0x00000460:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x00000464:    6801        .h      LDR      r1,[r0,#0]
        0x00000466:    0688        ..      LSLS     r0,r1,#26
        0x00000468:    d504        ..      BPL      0x474 ; _printf_int_common + 32
        0x0000046a:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x0000046c:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000470:    6021        !`      STR      r1,[r4,#0]
        0x00000472:    e000        ..      B        0x476 ; _printf_int_common + 34
        0x00000474:    2001        .       MOVS     r0,#1
        0x00000476:    42a8        .B      CMP      r0,r5
        0x00000478:    dd01        ..      BLE      0x47e ; _printf_int_common + 42
        0x0000047a:    1b47        G.      SUBS     r7,r0,r5
        0x0000047c:    e000        ..      B        0x480 ; _printf_int_common + 44
        0x0000047e:    2700        .'      MOVS     r7,#0
        0x00000480:    69a1        .i      LDR      r1,[r4,#0x18]
        0x00000482:    197a        z.      ADDS     r2,r7,r5
        0x00000484:    eb020009    ....    ADD      r0,r2,r9
        0x00000488:    1a08        ..      SUBS     r0,r1,r0
        0x0000048a:    61a0        .a      STR      r0,[r4,#0x18]
        0x0000048c:    7820         x      LDRB     r0,[r4,#0]
        0x0000048e:    06c0        ..      LSLS     r0,r0,#27
        0x00000490:    d402        ..      BMI      0x498 ; _printf_int_common + 68
        0x00000492:    4620         F      MOV      r0,r4
        0x00000494:    f3af8000    ....    NOP.W    
        0x00000498:    2600        .&      MOVS     r6,#0
        0x0000049a:    e008        ..      B        0x4ae ; _printf_int_common + 90
        0x0000049c:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004a0:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x000004a4:    4790        .G      BLX      r2
        0x000004a6:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004a8:    1c40        @.      ADDS     r0,r0,#1
        0x000004aa:    1c76        v.      ADDS     r6,r6,#1
        0x000004ac:    6220         b      STR      r0,[r4,#0x20]
        0x000004ae:    454e        NE      CMP      r6,r9
        0x000004b0:    dbf4        ..      BLT      0x49c ; _printf_int_common + 72
        0x000004b2:    7820         x      LDRB     r0,[r4,#0]
        0x000004b4:    06c0        ..      LSLS     r0,r0,#27
        0x000004b6:    d50a        ..      BPL      0x4ce ; _printf_int_common + 122
        0x000004b8:    4620         F      MOV      r0,r4
        0x000004ba:    f3af8000    ....    NOP.W    
        0x000004be:    e006        ..      B        0x4ce ; _printf_int_common + 122
        0x000004c0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004c4:    2030        0       MOVS     r0,#0x30
        0x000004c6:    4790        .G      BLX      r2
        0x000004c8:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004ca:    1c40        @.      ADDS     r0,r0,#1
        0x000004cc:    6220         b      STR      r0,[r4,#0x20]
        0x000004ce:    1e38        8.      SUBS     r0,r7,#0
        0x000004d0:    f1a70701    ....    SUB      r7,r7,#1
        0x000004d4:    dcf4        ..      BGT      0x4c0 ; _printf_int_common + 108
        0x000004d6:    e007        ..      B        0x4e8 ; _printf_int_common + 148
        0x000004d8:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004dc:    f8180005    ....    LDRB     r0,[r8,r5]
        0x000004e0:    4790        .G      BLX      r2
        0x000004e2:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004e4:    1c40        @.      ADDS     r0,r0,#1
        0x000004e6:    6220         b      STR      r0,[r4,#0x20]
        0x000004e8:    1e28        (.      SUBS     r0,r5,#0
        0x000004ea:    f1a50501    ....    SUB      r5,r5,#1
        0x000004ee:    dcf3        ..      BGT      0x4d8 ; _printf_int_common + 132
        0x000004f0:    4620         F      MOV      r0,r4
        0x000004f2:    f3af8000    ....    NOP.W    
        0x000004f6:    7820         x      LDRB     r0,[r4,#0]
        0x000004f8:    0600        ..      LSLS     r0,r0,#24
        0x000004fa:    d502        ..      BPL      0x502 ; _printf_int_common + 174
        0x000004fc:    2002        .       MOVS     r0,#2
        0x000004fe:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00000502:    2001        .       MOVS     r0,#1
        0x00000504:    e7fb        ..      B        0x4fe ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x00000506:    b510        ..      PUSH     {r4,lr}
        0x00000508:    6943        Ci      LDR      r3,[r0,#0x14]
        0x0000050a:    b113        ..      CBZ      r3,0x512 ; _printf_cs_common + 12
        0x0000050c:    f3af8000    ....    NOP.W    
        0x00000510:    e001        ..      B        0x516 ; _printf_cs_common + 16
        0x00000512:    f7fffeb7    ....    BL       _printf_str ; 0x284
        0x00000516:    2001        .       MOVS     r0,#1
        0x00000518:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x0000051a:    7812        .x      LDRB     r2,[r2,#0]
        0x0000051c:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000520:    700a        .p      STRB     r2,[r1,#0]
        0x00000522:    2200        ."      MOVS     r2,#0
        0x00000524:    704a        Jp      STRB     r2,[r1,#1]
        0x00000526:    2201        ."      MOVS     r2,#1
        0x00000528:    e7ed        ..      B        _printf_cs_common ; 0x506
    _printf_string
        0x0000052a:    6811        .h      LDR      r1,[r2,#0]
        0x0000052c:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000530:    e7e9        ..      B        _printf_cs_common ; 0x506
        0x00000532:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x00000534:    4b07        .K      LDR      r3,[pc,#28] ; [0x554] = 0x2477
        0x00000536:    b570        p.      PUSH     {r4-r6,lr}
        0x00000538:    460d        .F      MOV      r5,r1
        0x0000053a:    447b        {D      ADD      r3,r3,pc
        0x0000053c:    f000f86d    ..m.    BL       _printf_char_common ; 0x61a
        0x00000540:    4604        .F      MOV      r4,r0
        0x00000542:    4628        (F      MOV      r0,r5
        0x00000544:    f000f87c    ..|.    BL       ferror ; 0x640
        0x00000548:    b110        ..      CBZ      r0,0x550 ; _printf_char_file + 28
        0x0000054a:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0000054e:    bd70        p.      POP      {r4-r6,pc}
        0x00000550:    4620         F      MOV      r0,r4
        0x00000552:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000554:    00002477    w$..    DCD    9335
    $t
    .text
    __rt_SIGABRT
        0x00000558:    b510        ..      PUSH     {r4,lr}
        0x0000055a:    f000f87b    ..{.    BL       __rt_SIGABRT_inner ; 0x654
        0x0000055e:    e8bd4010    ...@    POP      {r4,lr}
        0x00000562:    f000b871    ..q.    B.W      __sig_exit ; 0x648
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x00000566:    b510        ..      PUSH     {r4,lr}
        0x00000568:    3a20         :      SUBS     r2,r2,#0x20
        0x0000056a:    f0c0800b    ....    BCC.W    0x584 ; __aeabi_memcpy4 + 30
        0x0000056e:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000572:    3a20         :      SUBS     r2,r2,#0x20
        0x00000574:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000578:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000057c:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000580:    f4bfaff5    ....    BCS.W    0x56e ; __aeabi_memcpy4 + 8
        0x00000584:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x00000588:    bf24        $.      ITT      CS
        0x0000058a:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x0000058e:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x00000592:    bf44        D.      ITT      MI
        0x00000594:    c918        ..      LDMMI    r1!,{r3,r4}
        0x00000596:    c018        ..      STMMI    r0!,{r3,r4}
        0x00000598:    e8bd4010    ...@    POP      {r4,lr}
        0x0000059c:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x000005a0:    bf24        $.      ITT      CS
        0x000005a2:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x000005a6:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000005aa:    bf08        ..      IT       EQ
        0x000005ac:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000005ae:    07d2        ..      LSLS     r2,r2,#31
        0x000005b0:    bf28        (.      IT       CS
        0x000005b2:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000005b6:    bf48        H.      IT       MI
        0x000005b8:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000005bc:    bf28        (.      IT       CS
        0x000005be:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000005c2:    bf48        H.      IT       MI
        0x000005c4:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000005c8:    4770        pG      BX       lr
    .text
    __aeabi_memclr
    __rt_memclr
        0x000005ca:    f04f0200    O...    MOV      r2,#0
    _memset
        0x000005ce:    2904        .)      CMP      r1,#4
        0x000005d0:    f0c08012    ....    BCC.W    0x5f8 ; _memset + 42
        0x000005d4:    f0100c03    ....    ANDS     r12,r0,#3
        0x000005d8:    f0008056    ..V.    BEQ.W    _memset_w ; 0x688
        0x000005dc:    f1cc0c04    ....    RSB      r12,r12,#4
        0x000005e0:    f1bc0f02    ....    CMP      r12,#2
        0x000005e4:    bf18        ..      IT       NE
        0x000005e6:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x000005ea:    bfa8        ..      IT       GE
        0x000005ec:    f8202b02     ..+    STRHGE   r2,[r0],#2
        0x000005f0:    eba1010c    ....    SUB      r1,r1,r12
        0x000005f4:    f000b848    ..H.    B.W      _memset_w ; 0x688
        0x000005f8:    ea5f7cc1    _..|    LSLS     r12,r1,#31
        0x000005fc:    bf24        $.      ITT      CS
        0x000005fe:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x00000602:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x00000606:    bf48        H.      IT       MI
        0x00000608:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x0000060c:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x0000060e:    4770        pG      BX       lr
    .text
    .text
    _printf_input_char
    __semihosting_library_function
        0x00000610:    6901        .i      LDR      r1,[r0,#0x10]
        0x00000612:    1c4a        J.      ADDS     r2,r1,#1
        0x00000614:    6102        .a      STR      r2,[r0,#0x10]
        0x00000616:    7808        .x      LDRB     r0,[r1,#0]
        0x00000618:    4770        pG      BX       lr
    _printf_char_common
        0x0000061a:    b500        ..      PUSH     {lr}
        0x0000061c:    b08f        ..      SUB      sp,sp,#0x3c
        0x0000061e:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x00000622:    2100        .!      MOVS     r1,#0
        0x00000624:    9105        ..      STR      r1,[sp,#0x14]
        0x00000626:    4905        .I      LDR      r1,[pc,#20] ; [0x63c] = 0xffffffe5
        0x00000628:    4479        yD      ADD      r1,r1,pc
        0x0000062a:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x0000062e:    4611        .F      MOV      r1,r2
        0x00000630:    4668        hF      MOV      r0,sp
        0x00000632:    f7fffdf3    ....    BL       __printf ; 0x21c
        0x00000636:    b00f        ..      ADD      sp,sp,#0x3c
        0x00000638:    bd00        ..      POP      {pc}
    $d
        0x0000063a:    0000        ..      DCW    0
        0x0000063c:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x00000640:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x00000642:    f0000080    ....    AND      r0,r0,#0x80
        0x00000646:    4770        pG      BX       lr
    .text
    __sig_exit
        0x00000648:    2800        .(      CMP      r0,#0
        0x0000064a:    d001        ..      BEQ      0x650 ; __sig_exit + 8
        0x0000064c:    f7ffbefc    ....    B.W      _sys_exit ; 0x448
        0x00000650:    4770        pG      BX       lr
        0x00000652:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x00000654:    b510        ..      PUSH     {r4,lr}
        0x00000656:    2100        .!      MOVS     r1,#0
        0x00000658:    a002        ..      ADR      r0,{pc}+0xc ; 0x664
        0x0000065a:    f000f865    ..e.    BL       __default_signal_display ; 0x728
        0x0000065e:    2001        .       MOVS     r0,#1
        0x00000660:    bd10        ..      POP      {r4,pc}
    $d
        0x00000662:    0000        ..      DCW    0
        0x00000664:    41474953    SIGA    DCD    1095190867
        0x00000668:    3a545242    BRT:    DCD    978604610
        0x0000066c:    6e624120     Abn    DCD    1851932960
        0x00000670:    616d726f    orma    DCD    1634562671
        0x00000674:    6574206c    l te    DCD    1702109292
        0x00000678:    6e696d72    rmin    DCD    1852403058
        0x0000067c:    6f697461    atio    DCD    1869182049
        0x00000680:    0000006e    n...    DCD    110
    $t
    .text
    __aeabi_memclr4
    __aeabi_memclr8
    __rt_memclr_w
        0x00000684:    f04f0200    O...    MOV      r2,#0
    _memset_w
        0x00000688:    b500        ..      PUSH     {lr}
        0x0000068a:    4613        .F      MOV      r3,r2
        0x0000068c:    4694        .F      MOV      r12,r2
        0x0000068e:    4696        .F      MOV      lr,r2
        0x00000690:    3920         9      SUBS     r1,r1,#0x20
        0x00000692:    bf22        ".      ITTT     CS
        0x00000694:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x00000698:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x0000069c:    f1b10120    .. .    SUBSCS   r1,r1,#0x20
        0x000006a0:    f4bfaff7    ....    BCS.W    0x692 ; _memset_w + 10
        0x000006a4:    0709        ..      LSLS     r1,r1,#28
        0x000006a6:    bf28        (.      IT       CS
        0x000006a8:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x000006ac:    bf48        H.      IT       MI
        0x000006ae:    c00c        ..      STMMI    r0!,{r2,r3}
        0x000006b0:    f85deb04    ]...    POP      {lr}
        0x000006b4:    0089        ..      LSLS     r1,r1,#2
        0x000006b6:    bf28        (.      IT       CS
        0x000006b8:    f8402b04    @..+    STRCS    r2,[r0],#4
        0x000006bc:    bf08        ..      IT       EQ
        0x000006be:    4770        pG      BXEQ     lr
        0x000006c0:    bf48        H.      IT       MI
        0x000006c2:    f8202b02     ..+    STRHMI   r2,[r0],#2
        0x000006c6:    f0114f80    ...O    TST      r1,#0x40000000
        0x000006ca:    bf18        ..      IT       NE
        0x000006cc:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x000006d0:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x000006d2:    4675        uF      MOV      r5,lr
        0x000006d4:    f000f848    ..H.    BL       __user_libspace ; 0x768
        0x000006d8:    46ae        .F      MOV      lr,r5
        0x000006da:    0005        ..      MOVS     r5,r0
        0x000006dc:    4669        iF      MOV      r1,sp
        0x000006de:    4653        SF      MOV      r3,r10
        0x000006e0:    f0200007     ...    BIC      r0,r0,#7
        0x000006e4:    4685        .F      MOV      sp,r0
        0x000006e6:    b018        ..      ADD      sp,sp,#0x60
        0x000006e8:    b520         .      PUSH     {r5,lr}
        0x000006ea:    f7fffd79    ..y.    BL       __user_initial_stackheap ; 0x1e0
        0x000006ee:    e8bd4020    .. @    POP      {r5,lr}
        0x000006f2:    f04f0600    O...    MOV      r6,#0
        0x000006f6:    f04f0700    O...    MOV      r7,#0
        0x000006fa:    f04f0800    O...    MOV      r8,#0
        0x000006fe:    f04f0b00    O...    MOV      r11,#0
        0x00000702:    f0210107    !...    BIC      r1,r1,#7
        0x00000706:    46ac        .F      MOV      r12,r5
        0x00000708:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000070c:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000710:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000714:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000718:    468d        .F      MOV      sp,r1
        0x0000071a:    4770        pG      BX       lr
    .text
    exit
        0x0000071c:    4604        .F      MOV      r4,r0
        0x0000071e:    f3af8000    ....    NOP.W    
        0x00000722:    4620         F      MOV      r0,r4
        0x00000724:    f7fffd47    ..G.    BL       __rt_exit ; 0x1b6
    .text
    __default_signal_display
        0x00000728:    b570        p.      PUSH     {r4-r6,lr}
        0x0000072a:    4605        .F      MOV      r5,r0
        0x0000072c:    460c        .F      MOV      r4,r1
        0x0000072e:    200a        .       MOVS     r0,#0xa
        0x00000730:    e000        ..      B        0x734 ; __default_signal_display + 12
        0x00000732:    1c6d        m.      ADDS     r5,r5,#1
        0x00000734:    f000f811    ....    BL       _ttywrch ; 0x75a
        0x00000738:    b135        5.      CBZ      r5,0x748 ; __default_signal_display + 32
        0x0000073a:    7828        (x      LDRB     r0,[r5,#0]
        0x0000073c:    2800        .(      CMP      r0,#0
        0x0000073e:    d1f8        ..      BNE      0x732 ; __default_signal_display + 10
        0x00000740:    e002        ..      B        0x748 ; __default_signal_display + 32
        0x00000742:    1c64        d.      ADDS     r4,r4,#1
        0x00000744:    f000f809    ....    BL       _ttywrch ; 0x75a
        0x00000748:    b114        ..      CBZ      r4,0x750 ; __default_signal_display + 40
        0x0000074a:    7820         x      LDRB     r0,[r4,#0]
        0x0000074c:    2800        .(      CMP      r0,#0
        0x0000074e:    d1f8        ..      BNE      0x742 ; __default_signal_display + 26
        0x00000750:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x00000754:    200a        .       MOVS     r0,#0xa
        0x00000756:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x0000075a:    b508        ..      PUSH     {r3,lr}
        0x0000075c:    4669        iF      MOV      r1,sp
        0x0000075e:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000762:    2003        .       MOVS     r0,#3
        0x00000764:    beab        ..      BKPT     #0xab
        0x00000766:    bd08        ..      POP      {r3,pc}
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000768:    4800        .H      LDR      r0,[pc,#0] ; [0x76c] = 0x20001b28
        0x0000076a:    4770        pG      BX       lr
    $d
        0x0000076c:    20001b28    (..     DCD    536877864
    $t
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x00000770:    4905        .I      LDR      r1,[pc,#20] ; [0x788] = 0x88
        0x00000772:    b510        ..      PUSH     {r4,lr}
        0x00000774:    3128        (1      ADDS     r1,r1,#0x28
        0x00000776:    d004        ..      BEQ      0x782 ; ADCC0_IRQHandler + 18
        0x00000778:    6848        Hh      LDR      r0,[r1,#4]
        0x0000077a:    6809        .h      LDR      r1,[r1,#0]
        0x0000077c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000780:    4708        .G      BX       r1
        0x00000782:    f7fffde5    ....    BL       abort ; 0x350
    $d
        0x00000786:    0000        ..      DCW    0
        0x00000788:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x0000078c:    4905        .I      LDR      r1,[pc,#20] ; [0x7a4] = 0x88
        0x0000078e:    b510        ..      PUSH     {r4,lr}
        0x00000790:    3130        01      ADDS     r1,r1,#0x30
        0x00000792:    d004        ..      BEQ      0x79e ; ADCC1_IRQHandler + 18
        0x00000794:    6848        Hh      LDR      r0,[r1,#4]
        0x00000796:    6809        .h      LDR      r1,[r1,#0]
        0x00000798:    e8bd4010    ...@    POP      {r4,lr}
        0x0000079c:    4708        .G      BX       r1
        0x0000079e:    f7fffdd7    ....    BL       abort ; 0x350
    $d
        0x000007a2:    0000        ..      DCW    0
        0x000007a4:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x000007a8:    4905        .I      LDR      r1,[pc,#20] ; [0x7c0] = 0x88
        0x000007aa:    b510        ..      PUSH     {r4,lr}
        0x000007ac:    3138        81      ADDS     r1,r1,#0x38
        0x000007ae:    d004        ..      BEQ      0x7ba ; ADCC2_IRQHandler + 18
        0x000007b0:    6848        Hh      LDR      r0,[r1,#4]
        0x000007b2:    6809        .h      LDR      r1,[r1,#0]
        0x000007b4:    e8bd4010    ...@    POP      {r4,lr}
        0x000007b8:    4708        .G      BX       r1
        0x000007ba:    f7fffdc9    ....    BL       abort ; 0x350
    $d
        0x000007be:    0000        ..      DCW    0
        0x000007c0:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x000007c4:    4905        .I      LDR      r1,[pc,#20] ; [0x7dc] = 0x88
        0x000007c6:    b510        ..      PUSH     {r4,lr}
        0x000007c8:    3140        @1      ADDS     r1,r1,#0x40
        0x000007ca:    d004        ..      BEQ      0x7d6 ; ADCC3_IRQHandler + 18
        0x000007cc:    6848        Hh      LDR      r0,[r1,#4]
        0x000007ce:    6809        .h      LDR      r1,[r1,#0]
        0x000007d0:    e8bd4010    ...@    POP      {r4,lr}
        0x000007d4:    4708        .G      BX       r1
        0x000007d6:    f7fffdbb    ....    BL       abort ; 0x350
    $d
        0x000007da:    0000        ..      DCW    0
        0x000007dc:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x000007e0:    4905        .I      LDR      r1,[pc,#20] ; [0x7f8] = 0x88
        0x000007e2:    b510        ..      PUSH     {r4,lr}
        0x000007e4:    3148        H1      ADDS     r1,r1,#0x48
        0x000007e6:    d004        ..      BEQ      0x7f2 ; ADCC4_IRQHandler + 18
        0x000007e8:    6848        Hh      LDR      r0,[r1,#4]
        0x000007ea:    6809        .h      LDR      r1,[r1,#0]
        0x000007ec:    e8bd4010    ...@    POP      {r4,lr}
        0x000007f0:    4708        .G      BX       r1
        0x000007f2:    f7fffdad    ....    BL       abort ; 0x350
    $d
        0x000007f6:    0000        ..      DCW    0
        0x000007f8:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x000007fc:    4905        .I      LDR      r1,[pc,#20] ; [0x814] = 0x88
        0x000007fe:    b510        ..      PUSH     {r4,lr}
        0x00000800:    3150        P1      ADDS     r1,r1,#0x50
        0x00000802:    d004        ..      BEQ      0x80e ; ADCC5_IRQHandler + 18
        0x00000804:    6848        Hh      LDR      r0,[r1,#4]
        0x00000806:    6809        .h      LDR      r1,[r1,#0]
        0x00000808:    e8bd4010    ...@    POP      {r4,lr}
        0x0000080c:    4708        .G      BX       r1
        0x0000080e:    f7fffd9f    ....    BL       abort ; 0x350
    $d
        0x00000812:    0000        ..      DCW    0
        0x00000814:    00000088    ....    DCD    136
    $t
    i.CS_Gpio_Init
    CS_Gpio_Init
        0x00000818:    2001        .       MOVS     r0,#1
        0x0000081a:    f3600107    `...    BFI      r1,r0,#0,#8
        0x0000081e:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00000822:    b510        ..      PUSH     {r4,lr}
        0x00000824:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x00000828:    200a        .       MOVS     r0,#0xa
        0x0000082a:    f000f845    ..E.    BL       HAL_GPIO_Init ; 0x8b8
        0x0000082e:    2101        .!      MOVS     r1,#1
        0x00000830:    200a        .       MOVS     r0,#0xa
        0x00000832:    f000f901    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x00000836:    e8bd4010    ...@    POP      {r4,lr}
        0x0000083a:    a001        ..      ADR      r0,{pc}+6 ; 0x840
        0x0000083c:    f7ffbce2    ....    B.W      __2printf ; 0x204
    $d
        0x00000840:    636e7546    Func    DCD    1668183366
        0x00000844:    6e6f6974    tion    DCD    1852795252
        0x00000848:    5f534320     CS_    DCD    1599292192
        0x0000084c:    6f697047    Gpio    DCD    1869180999
        0x00000850:    696e495f    _Ini    DCD    1768835423
        0x00000854:    20292874    t()     DCD    539568244
        0x00000858:    6e6e7552    Runn    DCD    1852732754
        0x0000085c:    0a676e69    ing.    DCD    174550633
        0x00000860:    00000000    ....    DCD    0
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000864:    4905        .I      LDR      r1,[pc,#20] ; [0x87c] = 0x88
        0x00000866:    b510        ..      PUSH     {r4,lr}
        0x00000868:    3118        .1      ADDS     r1,r1,#0x18
        0x0000086a:    d004        ..      BEQ      0x876 ; DMAC_IRQHandler + 18
        0x0000086c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000086e:    6809        .h      LDR      r1,[r1,#0]
        0x00000870:    e8bd4010    ...@    POP      {r4,lr}
        0x00000874:    4708        .G      BX       r1
        0x00000876:    f7fffd6b    ..k.    BL       abort ; 0x350
    $d
        0x0000087a:    0000        ..      DCW    0
        0x0000087c:    00000088    ....    DCD    136
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x00000880:    4905        .I      LDR      r1,[pc,#20] ; [0x898] = 0x88
        0x00000882:    b510        ..      PUSH     {r4,lr}
        0x00000884:    3108        .1      ADDS     r1,r1,#8
        0x00000886:    d004        ..      BEQ      0x892 ; EXT_IRQHandler + 18
        0x00000888:    6848        Hh      LDR      r0,[r1,#4]
        0x0000088a:    6809        .h      LDR      r1,[r1,#0]
        0x0000088c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000890:    4708        .G      BX       r1
        0x00000892:    f7fffd5d    ..].    BL       abort ; 0x350
    $d
        0x00000896:    0000        ..      DCW    0
        0x00000898:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x0000089c:    4905        .I      LDR      r1,[pc,#20] ; [0x8b4] = 0x88
        0x0000089e:    b510        ..      PUSH     {r4,lr}
        0x000008a0:    3180        .1      ADDS     r1,r1,#0x80
        0x000008a2:    d004        ..      BEQ      0x8ae ; GPIO_IRQHandler + 18
        0x000008a4:    6848        Hh      LDR      r0,[r1,#4]
        0x000008a6:    6809        .h      LDR      r1,[r1,#0]
        0x000008a8:    e8bd4010    ...@    POP      {r4,lr}
        0x000008ac:    4708        .G      BX       r1
        0x000008ae:    f7fffd4f    ..O.    BL       abort ; 0x350
    $d
        0x000008b2:    0000        ..      DCW    0
        0x000008b4:    00000088    ....    DCD    136
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x000008b8:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000008ba:    4604        .F      MOV      r4,r0
        0x000008bc:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x000008c0:    4620         F      MOV      r0,r4
        0x000008c2:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0x928
        0x000008c6:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x000008ca:    2801        .(      CMP      r0,#1
        0x000008cc:    d105        ..      BNE      0x8da ; HAL_GPIO_Init + 34
        0x000008ce:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x000008d2:    4620         F      MOV      r0,r4
        0x000008d4:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x000008d8:    e009        ..      B        0x8ee ; HAL_GPIO_Init + 54
        0x000008da:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x000008de:    4620         F      MOV      r0,r4
        0x000008e0:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0x8f0
        0x000008e4:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000008e8:    4620         F      MOV      r0,r4
        0x000008ea:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0x9d4
        0x000008ee:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x000008f0:    b530        0.      PUSH     {r4,r5,lr}
        0x000008f2:    460a        .F      MOV      r2,r1
        0x000008f4:    bf00        ..      NOP      
        0x000008f6:    4b0b        .K      LDR      r3,[pc,#44] ; [0x924] = 0x40007000
        0x000008f8:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x000008fa:    b29b        ..      UXTH     r3,r3
        0x000008fc:    4619        .F      MOV      r1,r3
        0x000008fe:    2a01        .*      CMP      r2,#1
        0x00000900:    d103        ..      BNE      0x90a ; HAL_GPIO_SetDebounce + 26
        0x00000902:    2301        .#      MOVS     r3,#1
        0x00000904:    4083        .@      LSLS     r3,r3,r0
        0x00000906:    4319        .C      ORRS     r1,r1,r3
        0x00000908:    e002        ..      B        0x910 ; HAL_GPIO_SetDebounce + 32
        0x0000090a:    2301        .#      MOVS     r3,#1
        0x0000090c:    4083        .@      LSLS     r3,r3,r0
        0x0000090e:    4399        .C      BICS     r1,r1,r3
        0x00000910:    b28b        ..      UXTH     r3,r1
        0x00000912:    4c04        .L      LDR      r4,[pc,#16] ; [0x924] = 0x40007000
        0x00000914:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000916:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000091a:    4d02        .M      LDR      r5,[pc,#8] ; [0x924] = 0x40007000
        0x0000091c:    64ac        .d      STR      r4,[r5,#0x48]
        0x0000091e:    bf00        ..      NOP      
        0x00000920:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000922:    0000        ..      DCW    0
        0x00000924:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000928:    b530        0.      PUSH     {r4,r5,lr}
        0x0000092a:    4602        .F      MOV      r2,r0
        0x0000092c:    2a10        .*      CMP      r2,#0x10
        0x0000092e:    da16        ..      BGE      0x95e ; HAL_GPIO_SetDir + 54
        0x00000930:    bf00        ..      NOP      
        0x00000932:    4b19        .K      LDR      r3,[pc,#100] ; [0x998] = 0x40007000
        0x00000934:    685b        [h      LDR      r3,[r3,#4]
        0x00000936:    b298        ..      UXTH     r0,r3
        0x00000938:    bf00        ..      NOP      
        0x0000093a:    2901        .)      CMP      r1,#1
        0x0000093c:    d103        ..      BNE      0x946 ; HAL_GPIO_SetDir + 30
        0x0000093e:    2301        .#      MOVS     r3,#1
        0x00000940:    4093        .@      LSLS     r3,r3,r2
        0x00000942:    4318        .C      ORRS     r0,r0,r3
        0x00000944:    e002        ..      B        0x94c ; HAL_GPIO_SetDir + 36
        0x00000946:    2301        .#      MOVS     r3,#1
        0x00000948:    4093        .@      LSLS     r3,r3,r2
        0x0000094a:    4398        .C      BICS     r0,r0,r3
        0x0000094c:    b283        ..      UXTH     r3,r0
        0x0000094e:    4c12        .L      LDR      r4,[pc,#72] ; [0x998] = 0x40007000
        0x00000950:    6864        dh      LDR      r4,[r4,#4]
        0x00000952:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000956:    4d10        .M      LDR      r5,[pc,#64] ; [0x998] = 0x40007000
        0x00000958:    606c        l`      STR      r4,[r5,#4]
        0x0000095a:    bf00        ..      NOP      
        0x0000095c:    e01b        ..      B        0x996 ; HAL_GPIO_SetDir + 110
        0x0000095e:    bf00        ..      NOP      
        0x00000960:    4b0d        .K      LDR      r3,[pc,#52] ; [0x998] = 0x40007000
        0x00000962:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000964:    b298        ..      UXTH     r0,r3
        0x00000966:    bf00        ..      NOP      
        0x00000968:    2901        .)      CMP      r1,#1
        0x0000096a:    d106        ..      BNE      0x97a ; HAL_GPIO_SetDir + 82
        0x0000096c:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000970:    2401        .$      MOVS     r4,#1
        0x00000972:    fa04f303    ....    LSL      r3,r4,r3
        0x00000976:    4318        .C      ORRS     r0,r0,r3
        0x00000978:    e004        ..      B        0x984 ; HAL_GPIO_SetDir + 92
        0x0000097a:    f1a20310    ....    SUB      r3,r2,#0x10
        0x0000097e:    2401        .$      MOVS     r4,#1
        0x00000980:    409c        .@      LSLS     r4,r4,r3
        0x00000982:    43a0        .C      BICS     r0,r0,r4
        0x00000984:    b283        ..      UXTH     r3,r0
        0x00000986:    4c04        .L      LDR      r4,[pc,#16] ; [0x998] = 0x40007000
        0x00000988:    6924        $i      LDR      r4,[r4,#0x10]
        0x0000098a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000098e:    4d02        .M      LDR      r5,[pc,#8] ; [0x998] = 0x40007000
        0x00000990:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000992:    bf00        ..      NOP      
        0x00000994:    bf00        ..      NOP      
        0x00000996:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000998:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x0000099c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000099e:    460a        .F      MOV      r2,r1
        0x000009a0:    bf00        ..      NOP      
        0x000009a2:    4b0b        .K      LDR      r3,[pc,#44] ; [0x9d0] = 0x40007000
        0x000009a4:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x000009a6:    b29b        ..      UXTH     r3,r3
        0x000009a8:    4619        .F      MOV      r1,r3
        0x000009aa:    2a01        .*      CMP      r2,#1
        0x000009ac:    d103        ..      BNE      0x9b6 ; HAL_GPIO_SetPly + 26
        0x000009ae:    2301        .#      MOVS     r3,#1
        0x000009b0:    4083        .@      LSLS     r3,r3,r0
        0x000009b2:    4319        .C      ORRS     r1,r1,r3
        0x000009b4:    e002        ..      B        0x9bc ; HAL_GPIO_SetPly + 32
        0x000009b6:    2301        .#      MOVS     r3,#1
        0x000009b8:    4083        .@      LSLS     r3,r3,r0
        0x000009ba:    4399        .C      BICS     r1,r1,r3
        0x000009bc:    b28b        ..      UXTH     r3,r1
        0x000009be:    4c04        .L      LDR      r4,[pc,#16] ; [0x9d0] = 0x40007000
        0x000009c0:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x000009c2:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000009c6:    4d02        .M      LDR      r5,[pc,#8] ; [0x9d0] = 0x40007000
        0x000009c8:    63ec        .c      STR      r4,[r5,#0x3c]
        0x000009ca:    bf00        ..      NOP      
        0x000009cc:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000009ce:    0000        ..      DCW    0
        0x000009d0:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x000009d4:    b570        p.      PUSH     {r4-r6,lr}
        0x000009d6:    4605        .F      MOV      r5,r0
        0x000009d8:    460c        .F      MOV      r4,r1
        0x000009da:    b134        4.      CBZ      r4,0x9ea ; HAL_GPIO_TrigType + 22
        0x000009dc:    2c01        .,      CMP      r4,#1
        0x000009de:    d00d        ..      BEQ      0x9fc ; HAL_GPIO_TrigType + 40
        0x000009e0:    2c02        .,      CMP      r4,#2
        0x000009e2:    d014        ..      BEQ      0xa0e ; HAL_GPIO_TrigType + 58
        0x000009e4:    2c03        .,      CMP      r4,#3
        0x000009e6:    d124        $.      BNE      0xa32 ; HAL_GPIO_TrigType + 94
        0x000009e8:    e01a        ..      B        0xa20 ; HAL_GPIO_TrigType + 76
        0x000009ea:    2100        .!      MOVS     r1,#0
        0x000009ec:    4628        (F      MOV      r0,r5
        0x000009ee:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0xa94
        0x000009f2:    2100        .!      MOVS     r1,#0
        0x000009f4:    4628        (F      MOV      r0,r5
        0x000009f6:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0x99c
        0x000009fa:    e01a        ..      B        0xa32 ; HAL_GPIO_TrigType + 94
        0x000009fc:    2100        .!      MOVS     r1,#0
        0x000009fe:    4628        (F      MOV      r0,r5
        0x00000a00:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0xa94
        0x00000a04:    2101        .!      MOVS     r1,#1
        0x00000a06:    4628        (F      MOV      r0,r5
        0x00000a08:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0x99c
        0x00000a0c:    e011        ..      B        0xa32 ; HAL_GPIO_TrigType + 94
        0x00000a0e:    2101        .!      MOVS     r1,#1
        0x00000a10:    4628        (F      MOV      r0,r5
        0x00000a12:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0xa94
        0x00000a16:    2100        .!      MOVS     r1,#0
        0x00000a18:    4628        (F      MOV      r0,r5
        0x00000a1a:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0x99c
        0x00000a1e:    e008        ..      B        0xa32 ; HAL_GPIO_TrigType + 94
        0x00000a20:    2101        .!      MOVS     r1,#1
        0x00000a22:    4628        (F      MOV      r0,r5
        0x00000a24:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0xa94
        0x00000a28:    2101        .!      MOVS     r1,#1
        0x00000a2a:    4628        (F      MOV      r0,r5
        0x00000a2c:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0x99c
        0x00000a30:    bf00        ..      NOP      
        0x00000a32:    bf00        ..      NOP      
        0x00000a34:    bd70        p.      POP      {r4-r6,pc}
        0x00000a36:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000a38:    b570        p.      PUSH     {r4-r6,lr}
        0x00000a3a:    4605        .F      MOV      r5,r0
        0x00000a3c:    460e        .F      MOV      r6,r1
        0x00000a3e:    2d10        .-      CMP      r5,#0x10
        0x00000a40:    da10        ..      BGE      0xa64 ; HAL_GPIO_WritePin + 44
        0x00000a42:    bf00        ..      NOP      
        0x00000a44:    4812        .H      LDR      r0,[pc,#72] ; [0xa90] = 0x40007000
        0x00000a46:    6800        .h      LDR      r0,[r0,#0]
        0x00000a48:    b284        ..      UXTH     r4,r0
        0x00000a4a:    bf00        ..      NOP      
        0x00000a4c:    b91e        ..      CBNZ     r6,0xa56 ; HAL_GPIO_WritePin + 30
        0x00000a4e:    2001        .       MOVS     r0,#1
        0x00000a50:    40a8        .@      LSLS     r0,r0,r5
        0x00000a52:    4384        .C      BICS     r4,r4,r0
        0x00000a54:    e002        ..      B        0xa5c ; HAL_GPIO_WritePin + 36
        0x00000a56:    2001        .       MOVS     r0,#1
        0x00000a58:    40a8        .@      LSLS     r0,r0,r5
        0x00000a5a:    4304        .C      ORRS     r4,r4,r0
        0x00000a5c:    b2a0        ..      UXTH     r0,r4
        0x00000a5e:    f002f843    ..C.    BL       gpio_portadataregister_setf ; 0x2ae8
        0x00000a62:    e014        ..      B        0xa8e ; HAL_GPIO_WritePin + 86
        0x00000a64:    bf00        ..      NOP      
        0x00000a66:    480a        .H      LDR      r0,[pc,#40] ; [0xa90] = 0x40007000
        0x00000a68:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000a6a:    b284        ..      UXTH     r4,r0
        0x00000a6c:    bf00        ..      NOP      
        0x00000a6e:    b92e        ..      CBNZ     r6,0xa7c ; HAL_GPIO_WritePin + 68
        0x00000a70:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000a74:    2101        .!      MOVS     r1,#1
        0x00000a76:    4081        .@      LSLS     r1,r1,r0
        0x00000a78:    438c        .C      BICS     r4,r4,r1
        0x00000a7a:    e005        ..      B        0xa88 ; HAL_GPIO_WritePin + 80
        0x00000a7c:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000a80:    2101        .!      MOVS     r1,#1
        0x00000a82:    fa01f000    ....    LSL      r0,r1,r0
        0x00000a86:    4304        .C      ORRS     r4,r4,r0
        0x00000a88:    b2a0        ..      UXTH     r0,r4
        0x00000a8a:    f002f837    ..7.    BL       gpio_portbdataregister_setf ; 0x2afc
        0x00000a8e:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000a90:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000a94:    b530        0.      PUSH     {r4,r5,lr}
        0x00000a96:    460a        .F      MOV      r2,r1
        0x00000a98:    bf00        ..      NOP      
        0x00000a9a:    4b0b        .K      LDR      r3,[pc,#44] ; [0xac8] = 0x40007000
        0x00000a9c:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000a9e:    b29b        ..      UXTH     r3,r3
        0x00000aa0:    4619        .F      MOV      r1,r3
        0x00000aa2:    2a01        .*      CMP      r2,#1
        0x00000aa4:    d103        ..      BNE      0xaae ; HAL_GPIO_setIrqLevel + 26
        0x00000aa6:    2301        .#      MOVS     r3,#1
        0x00000aa8:    4083        .@      LSLS     r3,r3,r0
        0x00000aaa:    4319        .C      ORRS     r1,r1,r3
        0x00000aac:    e002        ..      B        0xab4 ; HAL_GPIO_setIrqLevel + 32
        0x00000aae:    2301        .#      MOVS     r3,#1
        0x00000ab0:    4083        .@      LSLS     r3,r3,r0
        0x00000ab2:    4399        .C      BICS     r1,r1,r3
        0x00000ab4:    b28b        ..      UXTH     r3,r1
        0x00000ab6:    4c04        .L      LDR      r4,[pc,#16] ; [0xac8] = 0x40007000
        0x00000ab8:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000aba:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000abe:    4d02        .M      LDR      r5,[pc,#8] ; [0xac8] = 0x40007000
        0x00000ac0:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000ac2:    bf00        ..      NOP      
        0x00000ac4:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000ac6:    0000        ..      DCW    0
        0x00000ac8:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SPIM_Init
    HAL_SPIM_Init
        0x00000acc:    e92d47ff    -..G    PUSH     {r0-r10,lr}
        0x00000ad0:    4604        .F      MOV      r4,r0
        0x00000ad2:    2000        .       MOVS     r0,#0
        0x00000ad4:    f002f9e2    ....    BL       spim_ssi_en_setf ; 0x2e9c
        0x00000ad8:    9801        ..      LDR      r0,[sp,#4]
        0x00000ada:    fbb4f0f0    ....    UDIV     r0,r4,r0
        0x00000ade:    b285        ..      UXTH     r5,r0
        0x00000ae0:    4628        (F      MOV      r0,r5
        0x00000ae2:    f002f9cb    ....    BL       spim_sckdv_setf ; 0x2e7c
        0x00000ae6:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x00000aea:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x00000aee:    2200        ."      MOVS     r2,#0
        0x00000af0:    4613        .F      MOV      r3,r2
        0x00000af2:    4615        .F      MOV      r5,r2
        0x00000af4:    f89d600b    ...`    LDRB     r6,[sp,#0xb]
        0x00000af8:    f89d700c    ...p    LDRB     r7,[sp,#0xc]
        0x00000afc:    f89dc008    ....    LDRB     r12,[sp,#8]
        0x00000b00:    ea4f4800    O..H    LSL      r8,r0,#16
        0x00000b04:    ea483801    H..8    ORR      r8,r8,r1,LSL #12
        0x00000b08:    ea4828c2    H..(    ORR      r8,r8,r2,LSL #11
        0x00000b0c:    ea482883    H..(    ORR      r8,r8,r3,LSL #10
        0x00000b10:    ea482805    H..(    ORR      r8,r8,r5,LSL #8
        0x00000b14:    ea4818c6    H...    ORR      r8,r8,r6,LSL #7
        0x00000b18:    ea481887    H...    ORR      r8,r8,r7,LSL #6
        0x00000b1c:    ea48180c    H...    ORR      r8,r8,r12,LSL #4
        0x00000b20:    f8df900c    ....    LDR      r9,[pc,#12] ; [0xb30] = 0x40006000
        0x00000b24:    f8c98000    ....    STR      r8,[r9,#0]
        0x00000b28:    bf00        ..      NOP      
        0x00000b2a:    e8bd87ff    ....    POP      {r0-r10,pc}
    $d
        0x00000b2e:    0000        ..      DCW    0
        0x00000b30:    40006000    .`.@    DCD    1073766400
    $t
    i.HAL_SPIM_Read_Only_Polling
    HAL_SPIM_Read_Only_Polling
        0x00000b34:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b36:    4604        .F      MOV      r4,r0
        0x00000b38:    460d        .F      MOV      r5,r1
        0x00000b3a:    2002        .       MOVS     r0,#2
        0x00000b3c:    f002f9c8    ....    BL       spim_tmod_setf ; 0x2ed0
        0x00000b40:    1e69        i.      SUBS     r1,r5,#1
        0x00000b42:    b288        ..      UXTH     r0,r1
        0x00000b44:    f002f980    ....    BL       spim_ctrlr1_pack ; 0x2e48
        0x00000b48:    2001        .       MOVS     r0,#1
        0x00000b4a:    f002f9a7    ....    BL       spim_ssi_en_setf ; 0x2e9c
        0x00000b4e:    2000        .       MOVS     r0,#0
        0x00000b50:    f002f99e    ....    BL       spim_ser_set ; 0x2e90
        0x00000b54:    2001        .       MOVS     r0,#1
        0x00000b56:    f002f99b    ....    BL       spim_ser_set ; 0x2e90
        0x00000b5a:    20ff        .       MOVS     r0,#0xff
        0x00000b5c:    f002f980    ....    BL       spim_dr_set ; 0x2e60
        0x00000b60:    2600        .&      MOVS     r6,#0
        0x00000b62:    e009        ..      B        0xb78 ; HAL_SPIM_Read_Only_Polling + 68
        0x00000b64:    bf00        ..      NOP      
        0x00000b66:    f002f981    ....    BL       spim_rfne_getf ; 0x2e6c
        0x00000b6a:    2800        .(      CMP      r0,#0
        0x00000b6c:    d0fb        ..      BEQ      0xb66 ; HAL_SPIM_Read_Only_Polling + 50
        0x00000b6e:    f002f971    ..q.    BL       spim_dr_get ; 0x2e54
        0x00000b72:    c401        ..      STM      r4!,{r0}
        0x00000b74:    1c70        p.      ADDS     r0,r6,#1
        0x00000b76:    b2c6        ..      UXTB     r6,r0
        0x00000b78:    42ae        .B      CMP      r6,r5
        0x00000b7a:    dbf3        ..      BLT      0xb64 ; HAL_SPIM_Read_Only_Polling + 48
        0x00000b7c:    bf00        ..      NOP      
        0x00000b7e:    f002f95b    ..[.    BL       spim_busy_getf ; 0x2e38
        0x00000b82:    2801        .(      CMP      r0,#1
        0x00000b84:    d0fb        ..      BEQ      0xb7e ; HAL_SPIM_Read_Only_Polling + 74
        0x00000b86:    2000        .       MOVS     r0,#0
        0x00000b88:    f002f988    ....    BL       spim_ssi_en_setf ; 0x2e9c
        0x00000b8c:    bd70        p.      POP      {r4-r6,pc}
    i.HAL_SPIM_Write_Polling
    HAL_SPIM_Write_Polling
        0x00000b8e:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b90:    4605        .F      MOV      r5,r0
        0x00000b92:    460e        .F      MOV      r6,r1
        0x00000b94:    2001        .       MOVS     r0,#1
        0x00000b96:    f002f99b    ....    BL       spim_tmod_setf ; 0x2ed0
        0x00000b9a:    2001        .       MOVS     r0,#1
        0x00000b9c:    f002f97e    ..~.    BL       spim_ssi_en_setf ; 0x2e9c
        0x00000ba0:    2000        .       MOVS     r0,#0
        0x00000ba2:    f002f975    ..u.    BL       spim_ser_set ; 0x2e90
        0x00000ba6:    2e10        ..      CMP      r6,#0x10
        0x00000ba8:    dc0c        ..      BGT      0xbc4 ; HAL_SPIM_Write_Polling + 54
        0x00000baa:    2400        .$      MOVS     r4,#0
        0x00000bac:    e004        ..      B        0xbb8 ; HAL_SPIM_Write_Polling + 42
        0x00000bae:    cd01        ..      LDM      r5!,{r0}
        0x00000bb0:    f002f956    ..V.    BL       spim_dr_set ; 0x2e60
        0x00000bb4:    1c60        `.      ADDS     r0,r4,#1
        0x00000bb6:    b2c4        ..      UXTB     r4,r0
        0x00000bb8:    42b4        .B      CMP      r4,r6
        0x00000bba:    dbf8        ..      BLT      0xbae ; HAL_SPIM_Write_Polling + 32
        0x00000bbc:    2001        .       MOVS     r0,#1
        0x00000bbe:    f002f967    ..g.    BL       spim_ser_set ; 0x2e90
        0x00000bc2:    e019        ..      B        0xbf8 ; HAL_SPIM_Write_Polling + 106
        0x00000bc4:    2400        .$      MOVS     r4,#0
        0x00000bc6:    e004        ..      B        0xbd2 ; HAL_SPIM_Write_Polling + 68
        0x00000bc8:    cd01        ..      LDM      r5!,{r0}
        0x00000bca:    f002f949    ..I.    BL       spim_dr_set ; 0x2e60
        0x00000bce:    1c60        `.      ADDS     r0,r4,#1
        0x00000bd0:    b2c4        ..      UXTB     r4,r0
        0x00000bd2:    2c10        .,      CMP      r4,#0x10
        0x00000bd4:    dbf8        ..      BLT      0xbc8 ; HAL_SPIM_Write_Polling + 58
        0x00000bd6:    2001        .       MOVS     r0,#1
        0x00000bd8:    f002f95a    ..Z.    BL       spim_ser_set ; 0x2e90
        0x00000bdc:    2410        .$      MOVS     r4,#0x10
        0x00000bde:    e009        ..      B        0xbf4 ; HAL_SPIM_Write_Polling + 102
        0x00000be0:    bf00        ..      NOP      
        0x00000be2:    f002f96d    ..m.    BL       spim_tfnf_getf ; 0x2ec0
        0x00000be6:    2800        .(      CMP      r0,#0
        0x00000be8:    d0fb        ..      BEQ      0xbe2 ; HAL_SPIM_Write_Polling + 84
        0x00000bea:    cd01        ..      LDM      r5!,{r0}
        0x00000bec:    f002f938    ..8.    BL       spim_dr_set ; 0x2e60
        0x00000bf0:    1c60        `.      ADDS     r0,r4,#1
        0x00000bf2:    b2c4        ..      UXTB     r4,r0
        0x00000bf4:    42b4        .B      CMP      r4,r6
        0x00000bf6:    dbf3        ..      BLT      0xbe0 ; HAL_SPIM_Write_Polling + 82
        0x00000bf8:    bf00        ..      NOP      
        0x00000bfa:    f002f959    ..Y.    BL       spim_tfe_getf ; 0x2eb0
        0x00000bfe:    2800        .(      CMP      r0,#0
        0x00000c00:    d0fb        ..      BEQ      0xbfa ; HAL_SPIM_Write_Polling + 108
        0x00000c02:    bf00        ..      NOP      
        0x00000c04:    f002f918    ....    BL       spim_busy_getf ; 0x2e38
        0x00000c08:    2801        .(      CMP      r0,#1
        0x00000c0a:    d0fb        ..      BEQ      0xc04 ; HAL_SPIM_Write_Polling + 118
        0x00000c0c:    2000        .       MOVS     r0,#0
        0x00000c0e:    f002f945    ..E.    BL       spim_ssi_en_setf ; 0x2e9c
        0x00000c12:    bd70        p.      POP      {r4-r6,pc}
    i.HAL_SYSCON_Function_IO_Set
    HAL_SYSCON_Function_IO_Set
        0x00000c14:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000c18:    4604        .F      MOV      r4,r0
        0x00000c1a:    460d        .F      MOV      r5,r1
        0x00000c1c:    4617        .F      MOV      r7,r2
        0x00000c1e:    bf00        ..      NOP      
        0x00000c20:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000c24:    6940        @i      LDR      r0,[r0,#0x14]
        0x00000c26:    4606        .F      MOV      r6,r0
        0x00000c28:    b93f        ?.      CBNZ     r7,0xc3a ; HAL_SYSCON_Function_IO_Set + 38
        0x00000c2a:    2001        .       MOVS     r0,#1
        0x00000c2c:    40a8        .@      LSLS     r0,r0,r5
        0x00000c2e:    4386        .C      BICS     r6,r6,r0
        0x00000c30:    4630        0F      MOV      r0,r6
        0x00000c32:    f002f9d1    ....    BL       sysc_cpu_func_en_set ; 0x2fd8
        0x00000c36:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00000c3a:    2d10        .-      CMP      r5,#0x10
        0x00000c3c:    d277        w.      BCS      0xd2e ; HAL_SYSCON_Function_IO_Set + 282
        0x00000c3e:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x00000c42:    1308        ..      DCW    4872
        0x00000c44:    3f34291e    .)4?    DCD    1060383006
        0x00000c48:    6b60554a    JU`k    DCD    1801475402
        0x00000c4c:    988d8277    w...    DCD    2559410807
        0x00000c50:    aea3        ..      DCW    44707
    $t
        0x00000c52:    bf00        ..      NOP      
        0x00000c54:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000c58:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000c5a:    f3640003    d...    BFI      r0,r4,#0,#4
        0x00000c5e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000c62:    6188        .a      STR      r0,[r1,#0x18]
        0x00000c64:    bf00        ..      NOP      
        0x00000c66:    e0a6        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000c68:    bf00        ..      NOP      
        0x00000c6a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000c6e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000c70:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00000c74:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000c78:    6188        .a      STR      r0,[r1,#0x18]
        0x00000c7a:    bf00        ..      NOP      
        0x00000c7c:    e09b        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000c7e:    bf00        ..      NOP      
        0x00000c80:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000c84:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000c86:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00000c8a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000c8e:    6188        .a      STR      r0,[r1,#0x18]
        0x00000c90:    bf00        ..      NOP      
        0x00000c92:    e090        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000c94:    bf00        ..      NOP      
        0x00000c96:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000c9a:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000c9c:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x00000ca0:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ca4:    6188        .a      STR      r0,[r1,#0x18]
        0x00000ca6:    bf00        ..      NOP      
        0x00000ca8:    e085        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000caa:    bf00        ..      NOP      
        0x00000cac:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000cb0:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000cb2:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00000cb6:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000cba:    6188        .a      STR      r0,[r1,#0x18]
        0x00000cbc:    bf00        ..      NOP      
        0x00000cbe:    e07a        z.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000cc0:    bf00        ..      NOP      
        0x00000cc2:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000cc6:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000cc8:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000ccc:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000cd0:    6188        .a      STR      r0,[r1,#0x18]
        0x00000cd2:    bf00        ..      NOP      
        0x00000cd4:    e06f        o.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000cd6:    bf00        ..      NOP      
        0x00000cd8:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000cdc:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000cde:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000ce2:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ce6:    6188        .a      STR      r0,[r1,#0x18]
        0x00000ce8:    bf00        ..      NOP      
        0x00000cea:    e064        d.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000cec:    bf00        ..      NOP      
        0x00000cee:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000cf2:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000cf4:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000cf8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000cfc:    6188        .a      STR      r0,[r1,#0x18]
        0x00000cfe:    bf00        ..      NOP      
        0x00000d00:    e059        Y.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d02:    bf00        ..      NOP      
        0x00000d04:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d08:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d0a:    f3640003    d...    BFI      r0,r4,#0,#4
        0x00000d0e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d12:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d14:    bf00        ..      NOP      
        0x00000d16:    e04e        N.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d18:    bf00        ..      NOP      
        0x00000d1a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d1e:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d20:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00000d24:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d28:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d2a:    bf00        ..      NOP      
        0x00000d2c:    e043        C.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d2e:    e041        A.      B        0xdb4 ; HAL_SYSCON_Function_IO_Set + 416
        0x00000d30:    bf00        ..      NOP      
        0x00000d32:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d36:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d38:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00000d3c:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d40:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d42:    bf00        ..      NOP      
        0x00000d44:    e037        7.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d46:    bf00        ..      NOP      
        0x00000d48:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d4c:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d4e:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x00000d52:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d56:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d58:    bf00        ..      NOP      
        0x00000d5a:    e02c        ,.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d5c:    bf00        ..      NOP      
        0x00000d5e:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d62:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d64:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00000d68:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d6c:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d6e:    bf00        ..      NOP      
        0x00000d70:    e021        !.      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d72:    bf00        ..      NOP      
        0x00000d74:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d78:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d7a:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000d7e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d82:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d84:    bf00        ..      NOP      
        0x00000d86:    e016        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d88:    bf00        ..      NOP      
        0x00000d8a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000d8e:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000d90:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000d94:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000d98:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000d9a:    bf00        ..      NOP      
        0x00000d9c:    e00b        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000d9e:    bf00        ..      NOP      
        0x00000da0:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000da4:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000da6:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000daa:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000dae:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000db0:    bf00        ..      NOP      
        0x00000db2:    e000        ..      B        0xdb6 ; HAL_SYSCON_Function_IO_Set + 418
        0x00000db4:    bf00        ..      NOP      
        0x00000db6:    bf00        ..      NOP      
        0x00000db8:    2001        .       MOVS     r0,#1
        0x00000dba:    40a8        .@      LSLS     r0,r0,r5
        0x00000dbc:    4306        .C      ORRS     r6,r6,r0
        0x00000dbe:    4630        0F      MOV      r0,r6
        0x00000dc0:    f002f90a    ....    BL       sysc_cpu_func_en_set ; 0x2fd8
        0x00000dc4:    bf00        ..      NOP      
        0x00000dc6:    e736        6.      B        0xc36 ; HAL_SYSCON_Function_IO_Set + 34
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000dc8:    bf00        ..      NOP      
        0x00000dca:    4904        .I      LDR      r1,[pc,#16] ; [0xddc] = 0x40020000
        0x00000dcc:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000dce:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000dd2:    4a02        .J      LDR      r2,[pc,#8] ; [0xddc] = 0x40020000
        0x00000dd4:    6111        .a      STR      r1,[r2,#0x10]
        0x00000dd6:    bf00        ..      NOP      
        0x00000dd8:    4770        pG      BX       lr
    $d
        0x00000dda:    0000        ..      DCW    0
        0x00000ddc:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000de0:    b510        ..      PUSH     {r4,lr}
        0x00000de2:    4604        .F      MOV      r4,r0
        0x00000de4:    1e60        `.      SUBS     r0,r4,#1
        0x00000de6:    280f        .(      CMP      r0,#0xf
        0x00000de8:    dc00        ..      BGT      0xdec ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000dea:    e004        ..      B        0xdf6 ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000dec:    2225        %"      MOVS     r2,#0x25
        0x00000dee:    a108        ..      ADR      r1,{pc}+0x22 ; 0xe10
        0x00000df0:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xe30
        0x00000df2:    f000fec7    ....    BL       __aeabi_assert ; 0x1b84
        0x00000df6:    1e61        a.      SUBS     r1,r4,#1
        0x00000df8:    b2c8        ..      UXTB     r0,r1
        0x00000dfa:    4913        .I      LDR      r1,[pc,#76] ; [0xe48] = 0x40020000
        0x00000dfc:    6849        Ih      LDR      r1,[r1,#4]
        0x00000dfe:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000e02:    4a11        .J      LDR      r2,[pc,#68] ; [0xe48] = 0x40020000
        0x00000e04:    6051        Q`      STR      r1,[r2,#4]
        0x00000e06:    bf00        ..      NOP      
        0x00000e08:    2001        .       MOVS     r0,#1
        0x00000e0a:    f002f8d5    ....    BL       sysc_awo_div_update_set ; 0x2fb8
        0x00000e0e:    bd10        ..      POP      {r4,pc}
    $d
        0x00000e10:    735c2e2e    ..\s    DCD    1935420974
        0x00000e14:    735c6b64    dk\s    DCD    1935436644
        0x00000e18:    735c6372    rc\s    DCD    1935434610
        0x00000e1c:    645c636f    oc\d    DCD    1683776367
        0x00000e20:    65766972    rive    DCD    1702259058
        0x00000e24:    79735c72    r\sy    DCD    2037603442
        0x00000e28:    6e6f6373    scon    DCD    1852793715
        0x00000e2c:    0000632e    .c..    DCD    25390
        0x00000e30:    62686128    (ahb    DCD    1651007784
        0x00000e34:    7669645f    _div    DCD    1986618463
        0x00000e38:    72656469    ider    DCD    1919247465
        0x00000e3c:    3c29312d    -1)<    DCD    1009332525
        0x00000e40:    6678303d    =0xf    DCD    1719152701
        0x00000e44:    00000000    ....    DCD    0
        0x00000e48:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000e4c:    b510        ..      PUSH     {r4,lr}
        0x00000e4e:    4604        .F      MOV      r4,r0
        0x00000e50:    1e60        `.      SUBS     r0,r4,#1
        0x00000e52:    280f        .(      CMP      r0,#0xf
        0x00000e54:    dc00        ..      BGT      0xe58 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000e56:    e004        ..      B        0xe62 ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000e58:    222c        ,"      MOVS     r2,#0x2c
        0x00000e5a:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xe84
        0x00000e5c:    a011        ..      ADR      r0,{pc}+0x48 ; 0xea4
        0x00000e5e:    f000fe91    ....    BL       __aeabi_assert ; 0x1b84
        0x00000e62:    1e61        a.      SUBS     r1,r4,#1
        0x00000e64:    b2c8        ..      UXTB     r0,r1
        0x00000e66:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e6a:    6849        Ih      LDR      r1,[r1,#4]
        0x00000e6c:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000e70:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000e74:    6051        Q`      STR      r1,[r2,#4]
        0x00000e76:    bf00        ..      NOP      
        0x00000e78:    2001        .       MOVS     r0,#1
        0x00000e7a:    0781        ..      LSLS     r1,r0,#30
        0x00000e7c:    6008        .`      STR      r0,[r1,#0]
        0x00000e7e:    bf00        ..      NOP      
        0x00000e80:    bd10        ..      POP      {r4,pc}
    $d
        0x00000e82:    0000        ..      DCW    0
        0x00000e84:    735c2e2e    ..\s    DCD    1935420974
        0x00000e88:    735c6b64    dk\s    DCD    1935436644
        0x00000e8c:    735c6372    rc\s    DCD    1935434610
        0x00000e90:    645c636f    oc\d    DCD    1683776367
        0x00000e94:    65766972    rive    DCD    1702259058
        0x00000e98:    79735c72    r\sy    DCD    2037603442
        0x00000e9c:    6e6f6373    scon    DCD    1852793715
        0x00000ea0:    0000632e    .c..    DCD    25390
        0x00000ea4:    62706128    (apb    DCD    1651532072
        0x00000ea8:    69645f30    0_di    DCD    1768185648
        0x00000eac:    65646976    vide    DCD    1701079414
        0x00000eb0:    29312d72    r-1)    DCD    691088754
        0x00000eb4:    78303d3c    <=0x    DCD    2016427324
        0x00000eb8:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000ebc:    b510        ..      PUSH     {r4,lr}
        0x00000ebe:    4604        .F      MOV      r4,r0
        0x00000ec0:    1e60        `.      SUBS     r0,r4,#1
        0x00000ec2:    280f        .(      CMP      r0,#0xf
        0x00000ec4:    dc00        ..      BGT      0xec8 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000ec6:    e004        ..      B        0xed2 ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000ec8:    2234        4"      MOVS     r2,#0x34
        0x00000eca:    a108        ..      ADR      r1,{pc}+0x22 ; 0xeec
        0x00000ecc:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xf0c
        0x00000ece:    f000fe59    ..Y.    BL       __aeabi_assert ; 0x1b84
        0x00000ed2:    1e61        a.      SUBS     r1,r4,#1
        0x00000ed4:    b2c8        ..      UXTB     r0,r1
        0x00000ed6:    4913        .I      LDR      r1,[pc,#76] ; [0xf24] = 0x40020000
        0x00000ed8:    6849        Ih      LDR      r1,[r1,#4]
        0x00000eda:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000ede:    4a11        .J      LDR      r2,[pc,#68] ; [0xf24] = 0x40020000
        0x00000ee0:    6051        Q`      STR      r1,[r2,#4]
        0x00000ee2:    bf00        ..      NOP      
        0x00000ee4:    2002        .       MOVS     r0,#2
        0x00000ee6:    f002f867    ..g.    BL       sysc_awo_div_update_set ; 0x2fb8
        0x00000eea:    bd10        ..      POP      {r4,pc}
    $d
        0x00000eec:    735c2e2e    ..\s    DCD    1935420974
        0x00000ef0:    735c6b64    dk\s    DCD    1935436644
        0x00000ef4:    735c6372    rc\s    DCD    1935434610
        0x00000ef8:    645c636f    oc\d    DCD    1683776367
        0x00000efc:    65766972    rive    DCD    1702259058
        0x00000f00:    79735c72    r\sy    DCD    2037603442
        0x00000f04:    6e6f6373    scon    DCD    1852793715
        0x00000f08:    0000632e    .c..    DCD    25390
        0x00000f0c:    62706128    (apb    DCD    1651532072
        0x00000f10:    69645f31    1_di    DCD    1768185649
        0x00000f14:    65646976    vide    DCD    1701079414
        0x00000f18:    29312d72    r-1)    DCD    691088754
        0x00000f1c:    78303d3c    <=0x    DCD    2016427324
        0x00000f20:    00000066    f...    DCD    102
        0x00000f24:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000f28:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f2a:    4605        .F      MOV      r5,r0
        0x00000f2c:    460c        .F      MOV      r4,r1
        0x00000f2e:    1e60        `.      SUBS     r0,r4,#1
        0x00000f30:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000f34:    da00        ..      BGE      0xf38 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000f36:    e004        ..      B        0xf42 ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000f38:    223c        <"      MOVS     r2,#0x3c
        0x00000f3a:    a112        ..      ADR      r1,{pc}+0x4a ; 0xf84
        0x00000f3c:    a019        ..      ADR      r0,{pc}+0x68 ; 0xfa4
        0x00000f3e:    f000fe21    ..!.    BL       __aeabi_assert ; 0x1b84
        0x00000f42:    2d01        .-      CMP      r5,#1
        0x00000f44:    dc00        ..      BGT      0xf48 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000f46:    e004        ..      B        0xf52 ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000f48:    223d        ="      MOVS     r2,#0x3d
        0x00000f4a:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xf84
        0x00000f4c:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xfbc
        0x00000f4e:    f000fe19    ....    BL       __aeabi_assert ; 0x1b84
        0x00000f52:    b935        5.      CBNZ     r5,0xf62 ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000f54:    2000        .       MOVS     r0,#0
        0x00000f56:    f002f835    ..5.    BL       sysc_awo_rtc_div_para_m1_setf ; 0x2fc4
        0x00000f5a:    2004        .       MOVS     r0,#4
        0x00000f5c:    f002f82c    ..,.    BL       sysc_awo_div_update_set ; 0x2fb8
        0x00000f60:    e00e        ..      B        0xf80 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000f62:    2c02        .,      CMP      r4,#2
        0x00000f64:    db00        ..      BLT      0xf68 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000f66:    e004        ..      B        0xf72 ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000f68:    2247        G"      MOVS     r2,#0x47
        0x00000f6a:    a106        ..      ADR      r1,{pc}+0x1a ; 0xf84
        0x00000f6c:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xfd8
        0x00000f6e:    f000fe09    ....    BL       __aeabi_assert ; 0x1b84
        0x00000f72:    1e61        a.      SUBS     r1,r4,#1
        0x00000f74:    b288        ..      UXTH     r0,r1
        0x00000f76:    f002f825    ..%.    BL       sysc_awo_rtc_div_para_m1_setf ; 0x2fc4
        0x00000f7a:    2004        .       MOVS     r0,#4
        0x00000f7c:    f002f81c    ....    BL       sysc_awo_div_update_set ; 0x2fb8
        0x00000f80:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f82:    0000        ..      DCW    0
        0x00000f84:    735c2e2e    ..\s    DCD    1935420974
        0x00000f88:    735c6b64    dk\s    DCD    1935436644
        0x00000f8c:    735c6372    rc\s    DCD    1935434610
        0x00000f90:    645c636f    oc\d    DCD    1683776367
        0x00000f94:    65766972    rive    DCD    1702259058
        0x00000f98:    79735c72    r\sy    DCD    2037603442
        0x00000f9c:    6e6f6373    scon    DCD    1852793715
        0x00000fa0:    0000632e    .c..    DCD    25390
        0x00000fa4:    63747228    (rtc    DCD    1668575784
        0x00000fa8:    7669645f    _div    DCD    1986618463
        0x00000fac:    72656469    ider    DCD    1919247465
        0x00000fb0:    3c29312d    -1)<    DCD    1009332525
        0x00000fb4:    3178303d    =0x1    DCD    829960253
        0x00000fb8:    00666666    fff.    DCD    6710886
        0x00000fbc:    5f637472    rtc_    DCD    1600353394
        0x00000fc0:    3c637273    src<    DCD    1013150323
        0x00000fc4:    6374723d    =rtc    DCD    1668575805
        0x00000fc8:    5f6b6c63    clk_    DCD    1600875619
        0x00000fcc:    6d6f7266    from    DCD    1836020326
        0x00000fd0:    6268615f    _ahb    DCD    1651007839
        0x00000fd4:    00000000    ....    DCD    0
        0x00000fd8:    5f637472    rtc_    DCD    1600353394
        0x00000fdc:    69766964    divi    DCD    1769367908
        0x00000fe0:    3e726564    der>    DCD    1047684452
        0x00000fe4:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000fe8:    4905        .I      LDR      r1,[pc,#20] ; [0x1000] = 0x88
        0x00000fea:    b510        ..      PUSH     {r4,lr}
        0x00000fec:    3160        `1      ADDS     r1,r1,#0x60
        0x00000fee:    d004        ..      BEQ      0xffa ; I2C0_IRQHandler + 18
        0x00000ff0:    6848        Hh      LDR      r0,[r1,#4]
        0x00000ff2:    6809        .h      LDR      r1,[r1,#0]
        0x00000ff4:    e8bd4010    ...@    POP      {r4,lr}
        0x00000ff8:    4708        .G      BX       r1
        0x00000ffa:    f7fff9a9    ....    BL       abort ; 0x350
    $d
        0x00000ffe:    0000        ..      DCW    0
        0x00001000:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00001004:    4905        .I      LDR      r1,[pc,#20] ; [0x101c] = 0x88
        0x00001006:    b510        ..      PUSH     {r4,lr}
        0x00001008:    3168        h1      ADDS     r1,r1,#0x68
        0x0000100a:    d004        ..      BEQ      0x1016 ; I2C1_IRQHandler + 18
        0x0000100c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000100e:    6809        .h      LDR      r1,[r1,#0]
        0x00001010:    e8bd4010    ...@    POP      {r4,lr}
        0x00001014:    4708        .G      BX       r1
        0x00001016:    f7fff99b    ....    BL       abort ; 0x350
    $d
        0x0000101a:    0000        ..      DCW    0
        0x0000101c:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00001020:    4905        .I      LDR      r1,[pc,#20] ; [0x1038] = 0x88
        0x00001022:    b510        ..      PUSH     {r4,lr}
        0x00001024:    3188        .1      ADDS     r1,r1,#0x88
        0x00001026:    d004        ..      BEQ      0x1032 ; I2S_IRQHandler + 18
        0x00001028:    6848        Hh      LDR      r0,[r1,#4]
        0x0000102a:    6809        .h      LDR      r1,[r1,#0]
        0x0000102c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001030:    4708        .G      BX       r1
        0x00001032:    f7fff98d    ....    BL       abort ; 0x350
    $d
        0x00001036:    0000        ..      DCW    0
        0x00001038:    00000088    ....    DCD    136
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x0000103c:    4905        .I      LDR      r1,[pc,#20] ; [0x1054] = 0x88
        0x0000103e:    b510        ..      PUSH     {r4,lr}
        0x00001040:    3120         1      ADDS     r1,r1,#0x20
        0x00001042:    d004        ..      BEQ      0x104e ; QSPI_IRQHandler + 18
        0x00001044:    6848        Hh      LDR      r0,[r1,#4]
        0x00001046:    6809        .h      LDR      r1,[r1,#0]
        0x00001048:    e8bd4010    ...@    POP      {r4,lr}
        0x0000104c:    4708        .G      BX       r1
        0x0000104e:    f7fff97f    ....    BL       abort ; 0x350
    $d
        0x00001052:    0000        ..      DCW    0
        0x00001054:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00001058:    4905        .I      LDR      r1,[pc,#20] ; [0x1070] = 0x88
        0x0000105a:    b510        ..      PUSH     {r4,lr}
        0x0000105c:    3110        .1      ADDS     r1,r1,#0x10
        0x0000105e:    d004        ..      BEQ      0x106a ; RTC_IRQHandler + 18
        0x00001060:    6848        Hh      LDR      r0,[r1,#4]
        0x00001062:    6809        .h      LDR      r1,[r1,#0]
        0x00001064:    e8bd4010    ...@    POP      {r4,lr}
        0x00001068:    4708        .G      BX       r1
        0x0000106a:    f7fff971    ..q.    BL       abort ; 0x350
    $d
        0x0000106e:    0000        ..      DCW    0
        0x00001070:    00000088    ....    DCD    136
    $t
    i.SDReadDisk
    SDReadDisk
        0x00001074:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001078:    4606        .F      MOV      r6,r0
        0x0000107a:    481d        .H      LDR      r0,[pc,#116] ; [0x10f0] = 0x20000010
        0x0000107c:    4615        .F      MOV      r5,r2
        0x0000107e:    460c        .F      MOV      r4,r1
        0x00001080:    7800        .x      LDRB     r0,[r0,#0]
        0x00001082:    2806        .(      CMP      r0,#6
        0x00001084:    d000        ..      BEQ      0x1088 ; SDReadDisk + 20
        0x00001086:    024c        L.      LSLS     r4,r1,#9
        0x00001088:    f44f7700    O..w    MOV      r7,#0x200
        0x0000108c:    2d01        .-      CMP      r5,#1
        0x0000108e:    d01d        ..      BEQ      0x10cc ; SDReadDisk + 88
        0x00001090:    2301        .#      MOVS     r3,#1
        0x00001092:    461a        .F      MOV      r2,r3
        0x00001094:    4621        !F      MOV      r1,r4
        0x00001096:    2012        .       MOVS     r0,#0x12
        0x00001098:    f000fa15    ....    BL       SD_SendCmd ; 0x14c6
        0x0000109c:    4639        9F      MOV      r1,r7
        0x0000109e:    4630        0F      MOV      r0,r6
        0x000010a0:    f000fb86    ....    BL       SdRecvData ; 0x17b0
        0x000010a4:    1e6d        m.      SUBS     r5,r5,#1
        0x000010a6:    4604        .F      MOV      r4,r0
        0x000010a8:    f5067600    ...v    ADD      r6,r6,#0x200
        0x000010ac:    f01505ff    ....    ANDS     r5,r5,#0xff
        0x000010b0:    d001        ..      BEQ      0x10b6 ; SDReadDisk + 66
        0x000010b2:    2c00        .,      CMP      r4,#0
        0x000010b4:    d0f2        ..      BEQ      0x109c ; SDReadDisk + 40
        0x000010b6:    2301        .#      MOVS     r3,#1
        0x000010b8:    461a        .F      MOV      r2,r3
        0x000010ba:    2100        .!      MOVS     r1,#0
        0x000010bc:    200c        .       MOVS     r0,#0xc
        0x000010be:    f000fa02    ....    BL       SD_SendCmd ; 0x14c6
        0x000010c2:    f000f899    ....    BL       SD_DisSelect ; 0x11f8
        0x000010c6:    4620         F      MOV      r0,r4
        0x000010c8:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000010cc:    2100        .!      MOVS     r1,#0
        0x000010ce:    200a        .       MOVS     r0,#0xa
        0x000010d0:    f7fffcb2    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x000010d4:    2301        .#      MOVS     r3,#1
        0x000010d6:    461a        .F      MOV      r2,r3
        0x000010d8:    4621        !F      MOV      r1,r4
        0x000010da:    2011        .       MOVS     r0,#0x11
        0x000010dc:    f000f9f3    ....    BL       SD_SendCmd ; 0x14c6
        0x000010e0:    0004        ..      MOVS     r4,r0
        0x000010e2:    d1ee        ..      BNE      0x10c2 ; SDReadDisk + 78
        0x000010e4:    4639        9F      MOV      r1,r7
        0x000010e6:    4630        0F      MOV      r0,r6
        0x000010e8:    f000fb62    ..b.    BL       SdRecvData ; 0x17b0
        0x000010ec:    4604        .F      MOV      r4,r0
        0x000010ee:    e7e8        ..      B        0x10c2 ; SDReadDisk + 78
    $d
        0x000010f0:    20000010    ...     DCD    536870928
    $t
    i.SDWriteDisk
    SDWriteDisk
        0x000010f4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000010f8:    4f25        %O      LDR      r7,[pc,#148] ; [0x1190] = 0x20000010
        0x000010fa:    4606        .F      MOV      r6,r0
        0x000010fc:    4615        .F      MOV      r5,r2
        0x000010fe:    7838        8x      LDRB     r0,[r7,#0]
        0x00001100:    460c        .F      MOV      r4,r1
        0x00001102:    2806        .(      CMP      r0,#6
        0x00001104:    d000        ..      BEQ      0x1108 ; SDWriteDisk + 20
        0x00001106:    024c        L.      LSLS     r4,r1,#9
        0x00001108:    2d01        .-      CMP      r5,#1
        0x0000110a:    f04f0100    O...    MOV      r1,#0
        0x0000110e:    f04f000a    O...    MOV      r0,#0xa
        0x00001112:    d019        ..      BEQ      0x1148 ; SDWriteDisk + 84
        0x00001114:    f7fffc90    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x00001118:    7838        8x      LDRB     r0,[r7,#0]
        0x0000111a:    2801        .(      CMP      r0,#1
        0x0000111c:    d00b        ..      BEQ      0x1136 ; SDWriteDisk + 66
        0x0000111e:    2301        .#      MOVS     r3,#1
        0x00001120:    461a        .F      MOV      r2,r3
        0x00001122:    2100        .!      MOVS     r1,#0
        0x00001124:    2037        7       MOVS     r0,#0x37
        0x00001126:    f000f9ce    ....    BL       SD_SendCmd ; 0x14c6
        0x0000112a:    2301        .#      MOVS     r3,#1
        0x0000112c:    461a        .F      MOV      r2,r3
        0x0000112e:    4629        )F      MOV      r1,r5
        0x00001130:    2017        .       MOVS     r0,#0x17
        0x00001132:    f000f9c8    ....    BL       SD_SendCmd ; 0x14c6
        0x00001136:    2301        .#      MOVS     r3,#1
        0x00001138:    461a        .F      MOV      r2,r3
        0x0000113a:    4621        !F      MOV      r1,r4
        0x0000113c:    2019        .       MOVS     r0,#0x19
        0x0000113e:    f000f9c2    ....    BL       SD_SendCmd ; 0x14c6
        0x00001142:    0004        ..      MOVS     r4,r0
        0x00001144:    d00d        ..      BEQ      0x1162 ; SDWriteDisk + 110
        0x00001146:    e01d        ..      B        0x1184 ; SDWriteDisk + 144
        0x00001148:    f7fffc76    ..v.    BL       HAL_GPIO_WritePin ; 0xa38
        0x0000114c:    2301        .#      MOVS     r3,#1
        0x0000114e:    461a        .F      MOV      r2,r3
        0x00001150:    4621        !F      MOV      r1,r4
        0x00001152:    2018        .       MOVS     r0,#0x18
        0x00001154:    f000f9b7    ....    BL       SD_SendCmd ; 0x14c6
        0x00001158:    0004        ..      MOVS     r4,r0
        0x0000115a:    d113        ..      BNE      0x1184 ; SDWriteDisk + 144
        0x0000115c:    21fe        .!      MOVS     r1,#0xfe
        0x0000115e:    4630        0F      MOV      r0,r6
        0x00001160:    e00d        ..      B        0x117e ; SDWriteDisk + 138
        0x00001162:    21fc        .!      MOVS     r1,#0xfc
        0x00001164:    4630        0F      MOV      r0,r6
        0x00001166:    f000f98c    ....    BL       SD_SendBlock ; 0x1482
        0x0000116a:    1e6d        m.      SUBS     r5,r5,#1
        0x0000116c:    f5067600    ...v    ADD      r6,r6,#0x200
        0x00001170:    f01505ff    ....    ANDS     r5,r5,#0xff
        0x00001174:    d001        ..      BEQ      0x117a ; SDWriteDisk + 134
        0x00001176:    2800        .(      CMP      r0,#0
        0x00001178:    d0f3        ..      BEQ      0x1162 ; SDWriteDisk + 110
        0x0000117a:    21fd        .!      MOVS     r1,#0xfd
        0x0000117c:    2000        .       MOVS     r0,#0
        0x0000117e:    f000f980    ....    BL       SD_SendBlock ; 0x1482
        0x00001182:    4604        .F      MOV      r4,r0
        0x00001184:    f000f838    ..8.    BL       SD_DisSelect ; 0x11f8
        0x00001188:    4620         F      MOV      r0,r4
        0x0000118a:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x0000118e:    0000        ..      DCW    0
        0x00001190:    20000010    ...     DCD    536870928
    $t
    i.SD_Device_Init
    SD_Device_Init
        0x00001194:    b510        ..      PUSH     {r4,lr}
        0x00001196:    f000fae1    ....    BL       SPIM_IoMux ; 0x175c
        0x0000119a:    f7fffb3d    ..=.    BL       CS_Gpio_Init ; 0x818
        0x0000119e:    2007        .       MOVS     r0,#7
        0x000011a0:    4622        "F      MOV      r2,r4
        0x000011a2:    f360220f    `.."    BFI      r2,r0,#8,#8
        0x000011a6:    2000        .       MOVS     r0,#0
        0x000011a8:    f3604217    `..B    BFI      r2,r0,#16,#8
        0x000011ac:    f360621f    `..b    BFI      r2,r0,#24,#8
        0x000011b0:    462b        +F      MOV      r3,r5
        0x000011b2:    f3600307    `...    BFI      r3,r0,#0,#8
        0x000011b6:    f3600207    `...    BFI      r2,r0,#0,#8
        0x000011ba:    4904        .I      LDR      r1,[pc,#16] ; [0x11cc] = 0x3d090
        0x000011bc:    4804        .H      LDR      r0,[pc,#16] ; [0x11d0] = 0x17d7840
        0x000011be:    f7fffc85    ....    BL       HAL_SPIM_Init ; 0xacc
        0x000011c2:    e8bd4010    ...@    POP      {r4,lr}
        0x000011c6:    a003        ..      ADR      r0,{pc}+0xe ; 0x11d4
        0x000011c8:    f7ffb81c    ....    B        __2printf ; 0x204
    $d
        0x000011cc:    0003d090    ....    DCD    250000
        0x000011d0:    017d7840    @x}.    DCD    25000000
        0x000011d4:    636e7546    Func    DCD    1668183366
        0x000011d8:    6e6f6974    tion    DCD    1852795252
        0x000011dc:    5f445320     SD_    DCD    1598313248
        0x000011e0:    69766544    Devi    DCD    1769366852
        0x000011e4:    495f6563    ce_I    DCD    1230988643
        0x000011e8:    2874696e    nit(    DCD    678717806
        0x000011ec:    75522029    ) Ru    DCD    1968316457
        0x000011f0:    6e696e6e    nnin    DCD    1852403310
        0x000011f4:    00000a67    g...    DCD    2663
    $t
    i.SD_DisSelect
    SD_DisSelect
        0x000011f8:    b508        ..      PUSH     {r3,lr}
        0x000011fa:    2101        .!      MOVS     r1,#1
        0x000011fc:    200a        .       MOVS     r0,#0xa
        0x000011fe:    f7fffc1b    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x00001202:    20ff        .       MOVS     r0,#0xff
        0x00001204:    9000        ..      STR      r0,[sp,#0]
        0x00001206:    2101        .!      MOVS     r1,#1
        0x00001208:    4668        hF      MOV      r0,sp
        0x0000120a:    f7fffcc0    ....    BL       HAL_SPIM_Write_Polling ; 0xb8e
        0x0000120e:    bd08        ..      POP      {r3,pc}
    i.SD_GetResponse
    SD_GetResponse
        0x00001210:    b570        p.      PUSH     {r4-r6,lr}
        0x00001212:    4605        .F      MOV      r5,r0
        0x00001214:    f2413488    A..4    MOV      r4,#0x1388
        0x00001218:    f000f924    ..$.    BL       SD_SPI_ReadByte ; 0x1464
        0x0000121c:    42a8        .B      CMP      r0,r5
        0x0000121e:    d004        ..      BEQ      0x122a ; SD_GetResponse + 26
        0x00001220:    1e64        d.      SUBS     r4,r4,#1
        0x00001222:    0424        $.      LSLS     r4,r4,#16
        0x00001224:    0c24        $.      LSRS     r4,r4,#16
        0x00001226:    d1f7        ..      BNE      0x1218 ; SD_GetResponse + 8
        0x00001228:    e002        ..      B        0x1230 ; SD_GetResponse + 32
        0x0000122a:    b10c        ..      CBZ      r4,0x1230 ; SD_GetResponse + 32
        0x0000122c:    2000        .       MOVS     r0,#0
        0x0000122e:    bd70        p.      POP      {r4-r6,pc}
        0x00001230:    2001        .       MOVS     r0,#1
        0x00001232:    bd70        p.      POP      {r4-r6,pc}
    i.SD_Initialize
    SD_Initialize
        0x00001234:    b570        p.      PUSH     {r4-r6,lr}
        0x00001236:    b08a        ..      SUB      sp,sp,#0x28
        0x00001238:    2235        5"      MOVS     r2,#0x35
        0x0000123a:    2128        (!      MOVS     r1,#0x28
        0x0000123c:    4668        hF      MOV      r0,sp
        0x0000123e:    f7fff8f8    ....    BL       __aeabi_memset ; 0x432
        0x00001242:    f7ffffa7    ....    BL       SD_Device_Init ; 0x1194
        0x00001246:    a170        p.      ADR      r1,{pc}+0x1c2 ; 0x1408
        0x00001248:    2000        .       MOVS     r0,#0
        0x0000124a:    f000f9af    ....    BL       SEGGER_RTT_printf ; 0x15ac
        0x0000124e:    a177        w.      ADR      r1,{pc}+0x1de ; 0x142c
        0x00001250:    2000        .       MOVS     r0,#0
        0x00001252:    f000f9ab    ....    BL       SEGGER_RTT_printf ; 0x15ac
        0x00001256:    2101        .!      MOVS     r1,#1
        0x00001258:    200a        .       MOVS     r0,#0xa
        0x0000125a:    f7fffbed    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x0000125e:    210a        .!      MOVS     r1,#0xa
        0x00001260:    4668        hF      MOV      r0,sp
        0x00001262:    f7fffc94    ....    BL       HAL_SPIM_Write_Polling ; 0xb8e
        0x00001266:    2101        .!      MOVS     r1,#1
        0x00001268:    200a        .       MOVS     r0,#0xa
        0x0000126a:    f7fffbe5    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x0000126e:    2400        .$      MOVS     r4,#0
        0x00001270:    2100        .!      MOVS     r1,#0
        0x00001272:    2301        .#      MOVS     r3,#1
        0x00001274:    2295        ."      MOVS     r2,#0x95
        0x00001276:    4608        .F      MOV      r0,r1
        0x00001278:    f000f925    ..%.    BL       SD_SendCmd ; 0x14c6
        0x0000127c:    1c64        d.      ADDS     r4,r4,#1
        0x0000127e:    b2a4        ..      UXTH     r4,r4
        0x00001280:    2801        .(      CMP      r0,#1
        0x00001282:    d003        ..      BEQ      0x128c ; SD_Initialize + 88
        0x00001284:    2cc8        .,      CMP      r4,#0xc8
        0x00001286:    d3f3        ..      BCC      0x1270 ; SD_Initialize + 60
        0x00001288:    28c8        .(      CMP      r0,#0xc8
        0x0000128a:    d045        E.      BEQ      0x1318 ; SD_Initialize + 228
        0x0000128c:    2100        .!      MOVS     r1,#0
        0x0000128e:    200a        .       MOVS     r0,#0xa
        0x00001290:    f7fffbd2    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x00001294:    2300        .#      MOVS     r3,#0
        0x00001296:    2287        ."      MOVS     r2,#0x87
        0x00001298:    f44f71d5    O..q    MOV      r1,#0x1aa
        0x0000129c:    2008        .       MOVS     r0,#8
        0x0000129e:    f000f912    ....    BL       SD_SendCmd ; 0x14c6
        0x000012a2:    4604        .F      MOV      r4,r0
        0x000012a4:    4602        .F      MOV      r2,r0
        0x000012a6:    a165        e.      ADR      r1,{pc}+0x196 ; 0x143c
        0x000012a8:    2000        .       MOVS     r0,#0
        0x000012aa:    f000f97f    ....    BL       SEGGER_RTT_printf ; 0x15ac
        0x000012ae:    4d67        gM      LDR      r5,[pc,#412] ; [0x144c] = 0x20000010
        0x000012b0:    2c05        .,      CMP      r4,#5
        0x000012b2:    d002        ..      BEQ      0x12ba ; SD_Initialize + 134
        0x000012b4:    2c01        .,      CMP      r4,#1
        0x000012b6:    d048        H.      BEQ      0x134a ; SD_Initialize + 278
        0x000012b8:    e09f        ..      B        0x13fa ; SD_Initialize + 454
        0x000012ba:    2002        .       MOVS     r0,#2
        0x000012bc:    7028        (p      STRB     r0,[r5,#0]
        0x000012be:    2101        .!      MOVS     r1,#1
        0x000012c0:    200a        .       MOVS     r0,#0xa
        0x000012c2:    f7fffbb9    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x000012c6:    20ff        .       MOVS     r0,#0xff
        0x000012c8:    f000f8d4    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000012cc:    2400        .$      MOVS     r4,#0
        0x000012ce:    f44f76c8    O..v    MOV      r6,#0x190
        0x000012d2:    2200        ."      MOVS     r2,#0
        0x000012d4:    2301        .#      MOVS     r3,#1
        0x000012d6:    4611        .F      MOV      r1,r2
        0x000012d8:    2037        7       MOVS     r0,#0x37
        0x000012da:    f000f8f4    ....    BL       SD_SendCmd ; 0x14c6
        0x000012de:    28ff        .(      CMP      r0,#0xff
        0x000012e0:    d01b        ..      BEQ      0x131a ; SD_Initialize + 230
        0x000012e2:    2200        ."      MOVS     r2,#0
        0x000012e4:    2301        .#      MOVS     r3,#1
        0x000012e6:    4611        .F      MOV      r1,r2
        0x000012e8:    2029        )       MOVS     r0,#0x29
        0x000012ea:    f000f8ec    ....    BL       SD_SendCmd ; 0x14c6
        0x000012ee:    1c64        d.      ADDS     r4,r4,#1
        0x000012f0:    b2a4        ..      UXTH     r4,r4
        0x000012f2:    b108        ..      CBZ      r0,0x12f8 ; SD_Initialize + 196
        0x000012f4:    42b4        .B      CMP      r4,r6
        0x000012f6:    d3ec        ..      BCC      0x12d2 ; SD_Initialize + 158
        0x000012f8:    42b4        .B      CMP      r4,r6
        0x000012fa:    d112        ..      BNE      0x1322 ; SD_Initialize + 238
        0x000012fc:    2400        .$      MOVS     r4,#0
        0x000012fe:    2301        .#      MOVS     r3,#1
        0x00001300:    2200        ."      MOVS     r2,#0
        0x00001302:    4611        .F      MOV      r1,r2
        0x00001304:    4618        .F      MOV      r0,r3
        0x00001306:    f000f8de    ....    BL       SD_SendCmd ; 0x14c6
        0x0000130a:    1c64        d.      ADDS     r4,r4,#1
        0x0000130c:    b2a4        ..      UXTH     r4,r4
        0x0000130e:    b108        ..      CBZ      r0,0x1314 ; SD_Initialize + 224
        0x00001310:    42b4        .B      CMP      r4,r6
        0x00001312:    d3f4        ..      BCC      0x12fe ; SD_Initialize + 202
        0x00001314:    42b4        .B      CMP      r4,r6
        0x00001316:    d102        ..      BNE      0x131e ; SD_Initialize + 234
        0x00001318:    2001        .       MOVS     r0,#1
        0x0000131a:    b00a        ..      ADD      sp,sp,#0x28
        0x0000131c:    bd70        p.      POP      {r4-r6,pc}
        0x0000131e:    2001        .       MOVS     r0,#1
        0x00001320:    7028        (p      STRB     r0,[r5,#0]
        0x00001322:    20ff        .       MOVS     r0,#0xff
        0x00001324:    f000f8a6    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001328:    2301        .#      MOVS     r3,#1
        0x0000132a:    2295        ."      MOVS     r2,#0x95
        0x0000132c:    2100        .!      MOVS     r1,#0
        0x0000132e:    203b        ;       MOVS     r0,#0x3b
        0x00001330:    f000f8c9    ....    BL       SD_SendCmd ; 0x14c6
        0x00001334:    2800        .(      CMP      r0,#0
        0x00001336:    d1f0        ..      BNE      0x131a ; SD_Initialize + 230
        0x00001338:    2301        .#      MOVS     r3,#1
        0x0000133a:    2295        ."      MOVS     r2,#0x95
        0x0000133c:    0259        Y.      LSLS     r1,r3,#9
        0x0000133e:    2010        .       MOVS     r0,#0x10
        0x00001340:    f000f8c1    ....    BL       SD_SendCmd ; 0x14c6
        0x00001344:    0004        ..      MOVS     r4,r0
        0x00001346:    d1e8        ..      BNE      0x131a ; SD_Initialize + 230
        0x00001348:    e057        W.      B        0x13fa ; SD_Initialize + 454
        0x0000134a:    20ff        .       MOVS     r0,#0xff
        0x0000134c:    f000f892    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001350:    20ff        .       MOVS     r0,#0xff
        0x00001352:    f000f88f    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001356:    20ff        .       MOVS     r0,#0xff
        0x00001358:    f000f88c    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x0000135c:    20ff        .       MOVS     r0,#0xff
        0x0000135e:    f000f889    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001362:    2101        .!      MOVS     r1,#1
        0x00001364:    200a        .       MOVS     r0,#0xa
        0x00001366:    f7fffb67    ..g.    BL       HAL_GPIO_WritePin ; 0xa38
        0x0000136a:    20ff        .       MOVS     r0,#0xff
        0x0000136c:    f000f882    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001370:    2400        .$      MOVS     r4,#0
        0x00001372:    f04f4680    O..F    MOV      r6,#0x40000000
        0x00001376:    2200        ."      MOVS     r2,#0
        0x00001378:    2301        .#      MOVS     r3,#1
        0x0000137a:    4611        .F      MOV      r1,r2
        0x0000137c:    2037        7       MOVS     r0,#0x37
        0x0000137e:    f000f8a2    ....    BL       SD_SendCmd ; 0x14c6
        0x00001382:    2801        .(      CMP      r0,#1
        0x00001384:    d1c9        ..      BNE      0x131a ; SD_Initialize + 230
        0x00001386:    2301        .#      MOVS     r3,#1
        0x00001388:    2200        ."      MOVS     r2,#0
        0x0000138a:    4631        1F      MOV      r1,r6
        0x0000138c:    2029        )       MOVS     r0,#0x29
        0x0000138e:    f000f89a    ....    BL       SD_SendCmd ; 0x14c6
        0x00001392:    2cc8        .,      CMP      r4,#0xc8
        0x00001394:    d8c1        ..      BHI      0x131a ; SD_Initialize + 230
        0x00001396:    2800        .(      CMP      r0,#0
        0x00001398:    d1ed        ..      BNE      0x1376 ; SD_Initialize + 322
        0x0000139a:    2300        .#      MOVS     r3,#0
        0x0000139c:    461a        .F      MOV      r2,r3
        0x0000139e:    4619        .F      MOV      r1,r3
        0x000013a0:    203a        :       MOVS     r0,#0x3a
        0x000013a2:    f000f890    ....    BL       SD_SendCmd ; 0x14c6
        0x000013a6:    0004        ..      MOVS     r4,r0
        0x000013a8:    d005        ..      BEQ      0x13b6 ; SD_Initialize + 386
        0x000013aa:    2101        .!      MOVS     r1,#1
        0x000013ac:    200a        .       MOVS     r0,#0xa
        0x000013ae:    f7fffb43    ..C.    BL       HAL_GPIO_WritePin ; 0xa38
        0x000013b2:    4620         F      MOV      r0,r4
        0x000013b4:    e7b1        ..      B        0x131a ; SD_Initialize + 230
        0x000013b6:    20ff        .       MOVS     r0,#0xff
        0x000013b8:    f000f85c    ..\.    BL       SD_SPI_WriteByte ; 0x1474
        0x000013bc:    f000f852    ..R.    BL       SD_SPI_ReadByte ; 0x1464
        0x000013c0:    4606        .F      MOV      r6,r0
        0x000013c2:    20ff        .       MOVS     r0,#0xff
        0x000013c4:    f000f856    ..V.    BL       SD_SPI_WriteByte ; 0x1474
        0x000013c8:    f000f84c    ..L.    BL       SD_SPI_ReadByte ; 0x1464
        0x000013cc:    20ff        .       MOVS     r0,#0xff
        0x000013ce:    f000f851    ..Q.    BL       SD_SPI_WriteByte ; 0x1474
        0x000013d2:    f000f847    ..G.    BL       SD_SPI_ReadByte ; 0x1464
        0x000013d6:    20ff        .       MOVS     r0,#0xff
        0x000013d8:    f000f84c    ..L.    BL       SD_SPI_WriteByte ; 0x1474
        0x000013dc:    f000f842    ..B.    BL       SD_SPI_ReadByte ; 0x1464
        0x000013e0:    2101        .!      MOVS     r1,#1
        0x000013e2:    200a        .       MOVS     r0,#0xa
        0x000013e4:    f7fffb28    ..(.    BL       HAL_GPIO_WritePin ; 0xa38
        0x000013e8:    20ff        .       MOVS     r0,#0xff
        0x000013ea:    f000f843    ..C.    BL       SD_SPI_WriteByte ; 0x1474
        0x000013ee:    0670        p.      LSLS     r0,r6,#25
        0x000013f0:    d501        ..      BPL      0x13f6 ; SD_Initialize + 450
        0x000013f2:    2006        .       MOVS     r0,#6
        0x000013f4:    e000        ..      B        0x13f8 ; SD_Initialize + 452
        0x000013f6:    2004        .       MOVS     r0,#4
        0x000013f8:    7028        (p      STRB     r0,[r5,#0]
        0x000013fa:    782a        *x      LDRB     r2,[r5,#0]
        0x000013fc:    a114        ..      ADR      r1,{pc}+0x54 ; 0x1450
        0x000013fe:    2000        .       MOVS     r0,#0
        0x00001400:    f000f8d4    ....    BL       SEGGER_RTT_printf ; 0x15ac
        0x00001404:    e7d5        ..      B        0x13b2 ; SD_Initialize + 382
    $d
        0x00001406:    0000        ..      DCW    0
        0x00001408:    74736554    Test    DCD    1953719636
        0x0000140c:    20445320     SD     DCD    541348640
        0x00001410:    64726143    Card    DCD    1685217603
        0x00001414:    20796220     by     DCD    544825888
        0x00001418:    20495053    SPI     DCD    541675603
        0x0000141c:    65646f4d    Mode    DCD    1701080909
        0x00001420:    202e2e2e    ...     DCD    539897390
        0x00001424:    0a2e2e2e    ....    DCD    170798638
        0x00001428:    00000000    ....    DCD    0
        0x0000142c:    646e6553    Send    DCD    1684956499
        0x00001430:    20343720     74     DCD    540292896
        0x00001434:    736c7570    puls    DCD    1936487792
        0x00001438:    00000a65    e...    DCD    2661
        0x0000143c:    31204453    SD 1    DCD    824198227
        0x00001440:    2e726556    Ver.    DCD    779248982
        0x00001444:    7e642520     %d~    DCD    2120492320
        0x00001448:    0000000a    ....    DCD    10
        0x0000144c:    20000010    ...     DCD    536870928
        0x00001450:    53204453    SD S    DCD    1394623571
        0x00001454:    79545f44    D_Ty    DCD    2035572548
        0x00001458:    202e6570    pe.     DCD    539911536
        0x0000145c:    0a7e6425    %d~.    DCD    176055333
        0x00001460:    00000000    ....    DCD    0
    $t
    i.SD_SPI_ReadByte
    SD_SPI_ReadByte
        0x00001464:    b508        ..      PUSH     {r3,lr}
        0x00001466:    2101        .!      MOVS     r1,#1
        0x00001468:    4668        hF      MOV      r0,sp
        0x0000146a:    f7fffb63    ..c.    BL       HAL_SPIM_Read_Only_Polling ; 0xb34
        0x0000146e:    9800        ..      LDR      r0,[sp,#0]
        0x00001470:    b2c0        ..      UXTB     r0,r0
        0x00001472:    bd08        ..      POP      {r3,pc}
    i.SD_SPI_WriteByte
    SD_SPI_WriteByte
        0x00001474:    b508        ..      PUSH     {r3,lr}
        0x00001476:    2101        .!      MOVS     r1,#1
        0x00001478:    9000        ..      STR      r0,[sp,#0]
        0x0000147a:    4668        hF      MOV      r0,sp
        0x0000147c:    f7fffb87    ....    BL       HAL_SPIM_Write_Polling ; 0xb8e
        0x00001480:    bd08        ..      POP      {r3,pc}
    i.SD_SendBlock
    SD_SendBlock
        0x00001482:    b570        p.      PUSH     {r4-r6,lr}
        0x00001484:    4605        .F      MOV      r5,r0
        0x00001486:    460c        .F      MOV      r4,r1
        0x00001488:    4608        .F      MOV      r0,r1
        0x0000148a:    f7fffff3    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x0000148e:    2cfd        .,      CMP      r4,#0xfd
        0x00001490:    d017        ..      BEQ      0x14c2 ; SD_SendBlock + 64
        0x00001492:    2400        .$      MOVS     r4,#0
        0x00001494:    f44f7600    O..v    MOV      r6,#0x200
        0x00001498:    5d28        (]      LDRB     r0,[r5,r4]
        0x0000149a:    f7ffffeb    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x0000149e:    1c64        d.      ADDS     r4,r4,#1
        0x000014a0:    b2a4        ..      UXTH     r4,r4
        0x000014a2:    42b4        .B      CMP      r4,r6
        0x000014a4:    d3f8        ..      BCC      0x1498 ; SD_SendBlock + 22
        0x000014a6:    20ff        .       MOVS     r0,#0xff
        0x000014a8:    f7ffffe4    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014ac:    20ff        .       MOVS     r0,#0xff
        0x000014ae:    f7ffffe1    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014b2:    f7ffffd7    ....    BL       SD_SPI_ReadByte ; 0x1464
        0x000014b6:    f000001f    ....    AND      r0,r0,#0x1f
        0x000014ba:    2805        .(      CMP      r0,#5
        0x000014bc:    d001        ..      BEQ      0x14c2 ; SD_SendBlock + 64
        0x000014be:    2002        .       MOVS     r0,#2
        0x000014c0:    bd70        p.      POP      {r4-r6,pc}
        0x000014c2:    2000        .       MOVS     r0,#0
        0x000014c4:    bd70        p.      POP      {r4-r6,pc}
    i.SD_SendCmd
    SD_SendCmd
        0x000014c6:    b570        p.      PUSH     {r4-r6,lr}
        0x000014c8:    4615        .F      MOV      r5,r2
        0x000014ca:    460c        .F      MOV      r4,r1
        0x000014cc:    4606        .F      MOV      r6,r0
        0x000014ce:    f7fffe93    ....    BL       SD_DisSelect ; 0x11f8
        0x000014d2:    2100        .!      MOVS     r1,#0
        0x000014d4:    200a        .       MOVS     r0,#0xa
        0x000014d6:    f7fffaaf    ....    BL       HAL_GPIO_WritePin ; 0xa38
        0x000014da:    f0460040    F.@.    ORR      r0,r6,#0x40
        0x000014de:    f7ffffc9    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014e2:    0e20         .      LSRS     r0,r4,#24
        0x000014e4:    f7ffffc6    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014e8:    f3c44007    ...@    UBFX     r0,r4,#16,#8
        0x000014ec:    f7ffffc2    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014f0:    f3c42007    ...     UBFX     r0,r4,#8,#8
        0x000014f4:    f7ffffbe    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014f8:    b2e0        ..      UXTB     r0,r4
        0x000014fa:    f7ffffbb    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x000014fe:    4628        (F      MOV      r0,r5
        0x00001500:    f7ffffb8    ....    BL       SD_SPI_WriteByte ; 0x1474
        0x00001504:    2400        .$      MOVS     r4,#0
        0x00001506:    f7ffffad    ....    BL       SD_SPI_ReadByte ; 0x1464
        0x0000150a:    1c64        d.      ADDS     r4,r4,#1
        0x0000150c:    b2e4        ..      UXTB     r4,r4
        0x0000150e:    2cc8        .,      CMP      r4,#0xc8
        0x00001510:    d801        ..      BHI      0x1516 ; SD_SendCmd + 80
        0x00001512:    28ff        .(      CMP      r0,#0xff
        0x00001514:    d0f7        ..      BEQ      0x1506 ; SD_SendCmd + 64
        0x00001516:    bd70        p.      POP      {r4-r6,pc}
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00001518:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000151c:    4607        .F      MOV      r7,r0
        0x0000151e:    480b        .H      LDR      r0,[pc,#44] ; [0x154c] = 0x20001470
        0x00001520:    4615        .F      MOV      r5,r2
        0x00001522:    460e        .F      MOV      r6,r1
        0x00001524:    7800        .x      LDRB     r0,[r0,#0]
        0x00001526:    b908        ..      CBNZ     r0,0x152c ; SEGGER_RTT_Write + 20
        0x00001528:    f000f9b6    ....    BL       _DoInit ; 0x1898
        0x0000152c:    f3ef8411    ....    MRS      r4,BASEPRI
        0x00001530:    2020                MOVS     r0,#0x20
        0x00001532:    f3808811    ....    MSR      BASEPRI,r0
        0x00001536:    462a        *F      MOV      r2,r5
        0x00001538:    4631        1F      MOV      r1,r6
        0x0000153a:    4638        8F      MOV      r0,r7
        0x0000153c:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0x1550
        0x00001540:    b2e1        ..      UXTB     r1,r4
        0x00001542:    f3818811    ....    MSR      BASEPRI,r1
        0x00001546:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x0000154a:    0000        ..      DCW    0
        0x0000154c:    20001470    p..     DCD    536876144
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00001550:    b570        p.      PUSH     {r4-r6,lr}
        0x00001552:    460e        .F      MOV      r6,r1
        0x00001554:    4914        .I      LDR      r1,[pc,#80] ; [0x15a8] = 0x20001470
        0x00001556:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x0000155a:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x0000155e:    4614        .F      MOV      r4,r2
        0x00001560:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x00001562:    3518        .5      ADDS     r5,r5,#0x18
        0x00001564:    b120         .      CBZ      r0,0x1570 ; SEGGER_RTT_WriteNoLock + 32
        0x00001566:    2801        .(      CMP      r0,#1
        0x00001568:    d00f        ..      BEQ      0x158a ; SEGGER_RTT_WriteNoLock + 58
        0x0000156a:    2802        .(      CMP      r0,#2
        0x0000156c:    d105        ..      BNE      0x157a ; SEGGER_RTT_WriteNoLock + 42
        0x0000156e:    e013        ..      B        0x1598 ; SEGGER_RTT_WriteNoLock + 72
        0x00001570:    4628        (F      MOV      r0,r5
        0x00001572:    f000f9c5    ....    BL       _GetAvailWriteSpace ; 0x1900
        0x00001576:    42a0        .B      CMP      r0,r4
        0x00001578:    d201        ..      BCS      0x157e ; SEGGER_RTT_WriteNoLock + 46
        0x0000157a:    2400        .$      MOVS     r4,#0
        0x0000157c:    e011        ..      B        0x15a2 ; SEGGER_RTT_WriteNoLock + 82
        0x0000157e:    4622        "F      MOV      r2,r4
        0x00001580:    4631        1F      MOV      r1,r6
        0x00001582:    4628        (F      MOV      r0,r5
        0x00001584:    f000fadc    ....    BL       _WriteNoCheck ; 0x1b40
        0x00001588:    e00b        ..      B        0x15a2 ; SEGGER_RTT_WriteNoLock + 82
        0x0000158a:    4628        (F      MOV      r0,r5
        0x0000158c:    f000f9b8    ....    BL       _GetAvailWriteSpace ; 0x1900
        0x00001590:    42a0        .B      CMP      r0,r4
        0x00001592:    d2f4        ..      BCS      0x157e ; SEGGER_RTT_WriteNoLock + 46
        0x00001594:    4604        .F      MOV      r4,r0
        0x00001596:    e7f2        ..      B        0x157e ; SEGGER_RTT_WriteNoLock + 46
        0x00001598:    4631        1F      MOV      r1,r6
        0x0000159a:    4628        (F      MOV      r0,r5
        0x0000159c:    f000faa3    ....    BL       _WriteBlocking ; 0x1ae6
        0x000015a0:    4604        .F      MOV      r4,r0
        0x000015a2:    4620         F      MOV      r0,r4
        0x000015a4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000015a6:    0000        ..      DCW    0
        0x000015a8:    20001470    p..     DCD    536876144
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x000015ac:    b40f        ..      PUSH     {r0-r3}
        0x000015ae:    b508        ..      PUSH     {r3,lr}
        0x000015b0:    a904        ..      ADD      r1,sp,#0x10
        0x000015b2:    9100        ..      STR      r1,[sp,#0]
        0x000015b4:    466a        jF      MOV      r2,sp
        0x000015b6:    9903        ..      LDR      r1,[sp,#0xc]
        0x000015b8:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0x15c2
        0x000015bc:    b001        ..      ADD      sp,sp,#4
        0x000015be:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x000015c2:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000015c6:    b098        ..      SUB      sp,sp,#0x60
        0x000015c8:    4680        .F      MOV      r8,r0
        0x000015ca:    a807        ..      ADD      r0,sp,#0x1c
        0x000015cc:    9002        ..      STR      r0,[sp,#8]
        0x000015ce:    2040        @       MOVS     r0,#0x40
        0x000015d0:    2600        .&      MOVS     r6,#0
        0x000015d2:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x000015d6:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x000015da:    4615        .F      MOV      r5,r2
        0x000015dc:    460c        .F      MOV      r4,r1
        0x000015de:    f8141b01    ....    LDRB     r1,[r4],#1
        0x000015e2:    2900        .)      CMP      r1,#0
        0x000015e4:    d06f        o.      BEQ      0x16c6 ; SEGGER_RTT_vprintf + 260
        0x000015e6:    2925        %)      CMP      r1,#0x25
        0x000015e8:    d008        ..      BEQ      0x15fc ; SEGGER_RTT_vprintf + 58
        0x000015ea:    a802        ..      ADD      r0,sp,#8
        0x000015ec:    f000fa5c    ..\.    BL       _StoreChar ; 0x1aa8
        0x000015f0:    9805        ..      LDR      r0,[sp,#0x14]
        0x000015f2:    2800        .(      CMP      r0,#0
        0x000015f4:    daf3        ..      BGE      0x15de ; SEGGER_RTT_vprintf + 28
        0x000015f6:    b018        ..      ADD      sp,sp,#0x60
        0x000015f8:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000015fc:    2000        .       MOVS     r0,#0
        0x000015fe:    2201        ."      MOVS     r2,#1
        0x00001600:    7821        !x      LDRB     r1,[r4,#0]
        0x00001602:    2923        #)      CMP      r1,#0x23
        0x00001604:    d01e        ..      BEQ      0x1644 ; SEGGER_RTT_vprintf + 130
        0x00001606:    292b        +)      CMP      r1,#0x2b
        0x00001608:    d019        ..      BEQ      0x163e ; SEGGER_RTT_vprintf + 124
        0x0000160a:    292d        -)      CMP      r1,#0x2d
        0x0000160c:    d002        ..      BEQ      0x1614 ; SEGGER_RTT_vprintf + 82
        0x0000160e:    2930        0)      CMP      r1,#0x30
        0x00001610:    d108        ..      BNE      0x1624 ; SEGGER_RTT_vprintf + 98
        0x00001612:    e002        ..      B        0x161a ; SEGGER_RTT_vprintf + 88
        0x00001614:    f0400001    @...    ORR      r0,r0,#1
        0x00001618:    e001        ..      B        0x161e ; SEGGER_RTT_vprintf + 92
        0x0000161a:    f0400002    @...    ORR      r0,r0,#2
        0x0000161e:    1c64        d.      ADDS     r4,r4,#1
        0x00001620:    2a00        .*      CMP      r2,#0
        0x00001622:    d1ed        ..      BNE      0x1600 ; SEGGER_RTT_vprintf + 62
        0x00001624:    2200        ."      MOVS     r2,#0
        0x00001626:    7821        !x      LDRB     r1,[r4,#0]
        0x00001628:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x0000162c:    2b0a        .+      CMP      r3,#0xa
        0x0000162e:    d20c        ..      BCS      0x164a ; SEGGER_RTT_vprintf + 136
        0x00001630:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x00001634:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x00001638:    3a30        0:      SUBS     r2,r2,#0x30
        0x0000163a:    1c64        d.      ADDS     r4,r4,#1
        0x0000163c:    e7f3        ..      B        0x1626 ; SEGGER_RTT_vprintf + 100
        0x0000163e:    f0400004    @...    ORR      r0,r0,#4
        0x00001642:    e7ec        ..      B        0x161e ; SEGGER_RTT_vprintf + 92
        0x00001644:    f0400008    @...    ORR      r0,r0,#8
        0x00001648:    e7e9        ..      B        0x161e ; SEGGER_RTT_vprintf + 92
        0x0000164a:    2300        .#      MOVS     r3,#0
        0x0000164c:    b2cf        ..      UXTB     r7,r1
        0x0000164e:    2f2e        ./      CMP      r7,#0x2e
        0x00001650:    d10b        ..      BNE      0x166a ; SEGGER_RTT_vprintf + 168
        0x00001652:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00001656:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x0000165a:    2f0a        ./      CMP      r7,#0xa
        0x0000165c:    d205        ..      BCS      0x166a ; SEGGER_RTT_vprintf + 168
        0x0000165e:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x00001662:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x00001666:    3b30        0;      SUBS     r3,r3,#0x30
        0x00001668:    e7f3        ..      B        0x1652 ; SEGGER_RTT_vprintf + 144
        0x0000166a:    296c        l)      CMP      r1,#0x6c
        0x0000166c:    d00d        ..      BEQ      0x168a ; SEGGER_RTT_vprintf + 200
        0x0000166e:    2968        h)      CMP      r1,#0x68
        0x00001670:    d00b        ..      BEQ      0x168a ; SEGGER_RTT_vprintf + 200
        0x00001672:    2970        p)      CMP      r1,#0x70
        0x00001674:    d04a        J.      BEQ      0x170c ; SEGGER_RTT_vprintf + 330
        0x00001676:    dc0b        ..      BGT      0x1690 ; SEGGER_RTT_vprintf + 206
        0x00001678:    2925        %)      CMP      r1,#0x25
        0x0000167a:    d014        ..      BEQ      0x16a6 ; SEGGER_RTT_vprintf + 228
        0x0000167c:    2958        X)      CMP      r1,#0x58
        0x0000167e:    d02b        +.      BEQ      0x16d8 ; SEGGER_RTT_vprintf + 278
        0x00001680:    2963        c)      CMP      r1,#0x63
        0x00001682:    d00c        ..      BEQ      0x169e ; SEGGER_RTT_vprintf + 220
        0x00001684:    2964        d)      CMP      r1,#0x64
        0x00001686:    d111        ..      BNE      0x16ac ; SEGGER_RTT_vprintf + 234
        0x00001688:    e012        ..      B        0x16b0 ; SEGGER_RTT_vprintf + 238
        0x0000168a:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x0000168e:    e7ec        ..      B        0x166a ; SEGGER_RTT_vprintf + 168
        0x00001690:    2973        s)      CMP      r1,#0x73
        0x00001692:    d02c        ,.      BEQ      0x16ee ; SEGGER_RTT_vprintf + 300
        0x00001694:    2975        u)      CMP      r1,#0x75
        0x00001696:    d017        ..      BEQ      0x16c8 ; SEGGER_RTT_vprintf + 262
        0x00001698:    2978        x)      CMP      r1,#0x78
        0x0000169a:    d107        ..      BNE      0x16ac ; SEGGER_RTT_vprintf + 234
        0x0000169c:    e01c        ..      B        0x16d8 ; SEGGER_RTT_vprintf + 278
        0x0000169e:    6828        (h      LDR      r0,[r5,#0]
        0x000016a0:    1d01        ..      ADDS     r1,r0,#4
        0x000016a2:    6029        )`      STR      r1,[r5,#0]
        0x000016a4:    7801        .x      LDRB     r1,[r0,#0]
        0x000016a6:    a802        ..      ADD      r0,sp,#8
        0x000016a8:    f000f9fe    ....    BL       _StoreChar ; 0x1aa8
        0x000016ac:    1c64        d.      ADDS     r4,r4,#1
        0x000016ae:    e79f        ..      B        0x15f0 ; SEGGER_RTT_vprintf + 46
        0x000016b0:    6829        )h      LDR      r1,[r5,#0]
        0x000016b2:    1d0f        ..      ADDS     r7,r1,#4
        0x000016b4:    602f        /`      STR      r7,[r5,#0]
        0x000016b6:    6809        .h      LDR      r1,[r1,#0]
        0x000016b8:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x000016bc:    220a        ."      MOVS     r2,#0xa
        0x000016be:    a802        ..      ADD      r0,sp,#8
        0x000016c0:    f000f929    ..).    BL       _PrintInt ; 0x1916
        0x000016c4:    e7f2        ..      B        0x16ac ; SEGGER_RTT_vprintf + 234
        0x000016c6:    e02b        +.      B        0x1720 ; SEGGER_RTT_vprintf + 350
        0x000016c8:    6829        )h      LDR      r1,[r5,#0]
        0x000016ca:    1d0f        ..      ADDS     r7,r1,#4
        0x000016cc:    602f        /`      STR      r7,[r5,#0]
        0x000016ce:    6809        .h      LDR      r1,[r1,#0]
        0x000016d0:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x000016d4:    220a        ."      MOVS     r2,#0xa
        0x000016d6:    e006        ..      B        0x16e6 ; SEGGER_RTT_vprintf + 292
        0x000016d8:    6829        )h      LDR      r1,[r5,#0]
        0x000016da:    1d0f        ..      ADDS     r7,r1,#4
        0x000016dc:    602f        /`      STR      r7,[r5,#0]
        0x000016de:    6809        .h      LDR      r1,[r1,#0]
        0x000016e0:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x000016e4:    2210        ."      MOVS     r2,#0x10
        0x000016e6:    a802        ..      ADD      r0,sp,#8
        0x000016e8:    f000f978    ..x.    BL       _PrintUnsigned ; 0x19dc
        0x000016ec:    e7de        ..      B        0x16ac ; SEGGER_RTT_vprintf + 234
        0x000016ee:    6828        (h      LDR      r0,[r5,#0]
        0x000016f0:    1d01        ..      ADDS     r1,r0,#4
        0x000016f2:    6029        )`      STR      r1,[r5,#0]
        0x000016f4:    6807        .h      LDR      r7,[r0,#0]
        0x000016f6:    f8171b01    ....    LDRB     r1,[r7],#1
        0x000016fa:    2900        .)      CMP      r1,#0
        0x000016fc:    d0d6        ..      BEQ      0x16ac ; SEGGER_RTT_vprintf + 234
        0x000016fe:    a802        ..      ADD      r0,sp,#8
        0x00001700:    f000f9d2    ....    BL       _StoreChar ; 0x1aa8
        0x00001704:    9805        ..      LDR      r0,[sp,#0x14]
        0x00001706:    2800        .(      CMP      r0,#0
        0x00001708:    daf5        ..      BGE      0x16f6 ; SEGGER_RTT_vprintf + 308
        0x0000170a:    e7cf        ..      B        0x16ac ; SEGGER_RTT_vprintf + 234
        0x0000170c:    6828        (h      LDR      r0,[r5,#0]
        0x0000170e:    1d01        ..      ADDS     r1,r0,#4
        0x00001710:    6029        )`      STR      r1,[r5,#0]
        0x00001712:    6801        .h      LDR      r1,[r0,#0]
        0x00001714:    2008        .       MOVS     r0,#8
        0x00001716:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x0000171a:    4603        .F      MOV      r3,r0
        0x0000171c:    2210        ."      MOVS     r2,#0x10
        0x0000171e:    e7e2        ..      B        0x16e6 ; SEGGER_RTT_vprintf + 292
        0x00001720:    9805        ..      LDR      r0,[sp,#0x14]
        0x00001722:    2800        .(      CMP      r0,#0
        0x00001724:    f77faf67    ..g.    BLE      0x15f6 ; SEGGER_RTT_vprintf + 52
        0x00001728:    9804        ..      LDR      r0,[sp,#0x10]
        0x0000172a:    b120         .      CBZ      r0,0x1736 ; SEGGER_RTT_vprintf + 372
        0x0000172c:    4602        .F      MOV      r2,r0
        0x0000172e:    a907        ..      ADD      r1,sp,#0x1c
        0x00001730:    4640        @F      MOV      r0,r8
        0x00001732:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0x1518
        0x00001736:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x0000173a:    4408        .D      ADD      r0,r0,r1
        0x0000173c:    9005        ..      STR      r0,[sp,#0x14]
        0x0000173e:    e75a        Z.      B        0x15f6 ; SEGGER_RTT_vprintf + 52
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00001740:    4905        .I      LDR      r1,[pc,#20] ; [0x1758] = 0x88
        0x00001742:    b510        ..      PUSH     {r4,lr}
        0x00001744:    3170        p1      ADDS     r1,r1,#0x70
        0x00001746:    d004        ..      BEQ      0x1752 ; SPIM_IRQHandler + 18
        0x00001748:    6848        Hh      LDR      r0,[r1,#4]
        0x0000174a:    6809        .h      LDR      r1,[r1,#0]
        0x0000174c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001750:    4708        .G      BX       r1
        0x00001752:    f7fefdfd    ....    BL       abort ; 0x350
    $d
        0x00001756:    0000        ..      DCW    0
        0x00001758:    00000088    ....    DCD    136
    $t
    i.SPIM_IoMux
    SPIM_IoMux
        0x0000175c:    b510        ..      PUSH     {r4,lr}
        0x0000175e:    2201        ."      MOVS     r2,#1
        0x00001760:    211f        .!      MOVS     r1,#0x1f
        0x00001762:    2005        .       MOVS     r0,#5
        0x00001764:    f7fffa56    ..V.    BL       HAL_SYSCON_Function_IO_Set ; 0xc14
        0x00001768:    2201        ."      MOVS     r2,#1
        0x0000176a:    210b        .!      MOVS     r1,#0xb
        0x0000176c:    2004        .       MOVS     r0,#4
        0x0000176e:    f7fffa51    ..Q.    BL       HAL_SYSCON_Function_IO_Set ; 0xc14
        0x00001772:    2201        ."      MOVS     r2,#1
        0x00001774:    2109        .!      MOVS     r1,#9
        0x00001776:    2006        .       MOVS     r0,#6
        0x00001778:    f7fffa4c    ..L.    BL       HAL_SYSCON_Function_IO_Set ; 0xc14
        0x0000177c:    2201        ."      MOVS     r2,#1
        0x0000177e:    2108        .!      MOVS     r1,#8
        0x00001780:    2007        .       MOVS     r0,#7
        0x00001782:    f7fffa47    ..G.    BL       HAL_SYSCON_Function_IO_Set ; 0xc14
        0x00001786:    e8bd4010    ...@    POP      {r4,lr}
        0x0000178a:    a001        ..      ADR      r0,{pc}+6 ; 0x1790
        0x0000178c:    f7febd3a    ..:.    B        __2printf ; 0x204
    $d
        0x00001790:    636e7546    Func    DCD    1668183366
        0x00001794:    6e6f6974    tion    DCD    1852795252
        0x00001798:    49505320     SPI    DCD    1230000928
        0x0000179c:    6f495f4d    M_Io    DCD    1867079501
        0x000017a0:    2878754d    Mux(    DCD    678982989
        0x000017a4:    75522029    ) Ru    DCD    1968316457
        0x000017a8:    6e696e6e    nnin    DCD    1852403310
        0x000017ac:    00000a67    g...    DCD    2663
    $t
    i.SdRecvData
    SdRecvData
        0x000017b0:    b570        p.      PUSH     {r4-r6,lr}
        0x000017b2:    460e        .F      MOV      r6,r1
        0x000017b4:    4605        .F      MOV      r5,r0
        0x000017b6:    2100        .!      MOVS     r1,#0
        0x000017b8:    200a        .       MOVS     r0,#0xa
        0x000017ba:    f7fff93d    ..=.    BL       HAL_GPIO_WritePin ; 0xa38
        0x000017be:    20fe        .       MOVS     r0,#0xfe
        0x000017c0:    f7fffd26    ..&.    BL       SD_GetResponse ; 0x1210
        0x000017c4:    b128        (.      CBZ      r0,0x17d2 ; SdRecvData + 34
        0x000017c6:    2101        .!      MOVS     r1,#1
        0x000017c8:    200a        .       MOVS     r0,#0xa
        0x000017ca:    f7fff935    ..5.    BL       HAL_GPIO_WritePin ; 0xa38
        0x000017ce:    2001        .       MOVS     r0,#1
        0x000017d0:    bd70        p.      POP      {r4-r6,pc}
        0x000017d2:    2400        .$      MOVS     r4,#0
        0x000017d4:    e005        ..      B        0x17e2 ; SdRecvData + 50
        0x000017d6:    f7fffe45    ..E.    BL       SD_SPI_ReadByte ; 0x1464
        0x000017da:    1c64        d.      ADDS     r4,r4,#1
        0x000017dc:    f8050b01    ....    STRB     r0,[r5],#1
        0x000017e0:    b2a4        ..      UXTH     r4,r4
        0x000017e2:    42b4        .B      CMP      r4,r6
        0x000017e4:    d3f7        ..      BCC      0x17d6 ; SdRecvData + 38
        0x000017e6:    f7fffe3d    ..=.    BL       SD_SPI_ReadByte ; 0x1464
        0x000017ea:    f7fffe3b    ..;.    BL       SD_SPI_ReadByte ; 0x1464
        0x000017ee:    2101        .!      MOVS     r1,#1
        0x000017f0:    200a        .       MOVS     r0,#0xa
        0x000017f2:    f7fff921    ..!.    BL       HAL_GPIO_WritePin ; 0xa38
        0x000017f6:    2000        .       MOVS     r0,#0
        0x000017f8:    bd70        p.      POP      {r4-r6,pc}
        0x000017fa:    0000        ..      MOVS     r0,r0
    i.SystemInit
    SystemInit
        0x000017fc:    b510        ..      PUSH     {r4,lr}
        0x000017fe:    4812        .H      LDR      r0,[pc,#72] ; [0x1848] = 0x4000b000
        0x00001800:    6801        .h      LDR      r1,[r0,#0]
        0x00001802:    0149        I.      LSLS     r1,r1,#5
        0x00001804:    d5fc        ..      BPL      0x1800 ; SystemInit + 4
        0x00001806:    f64e2160    N.`!    MOV      r1,#0xea60
        0x0000180a:    2000        .       MOVS     r0,#0
        0x0000180c:    bf00        ..      NOP      
        0x0000180e:    bf00        ..      NOP      
        0x00001810:    bf00        ..      NOP      
        0x00001812:    bf00        ..      NOP      
        0x00001814:    bf00        ..      NOP      
        0x00001816:    bf00        ..      NOP      
        0x00001818:    1c40        @.      ADDS     r0,r0,#1
        0x0000181a:    4288        .B      CMP      r0,r1
        0x0000181c:    d3f6        ..      BCC      0x180c ; SystemInit + 16
        0x0000181e:    490c        .I      LDR      r1,[pc,#48] ; [0x1850] = 0x20000008
        0x00001820:    480a        .H      LDR      r0,[pc,#40] ; [0x184c] = 0x5f5e100
        0x00001822:    6008        .`      STR      r0,[r1,#0]
        0x00001824:    2008        .       MOVS     r0,#8
        0x00001826:    f7fffacf    ....    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xdc8
        0x0000182a:    2002        .       MOVS     r0,#2
        0x0000182c:    f7fffad8    ....    BL       HAL_SYSCON_Set_HClk_Div ; 0xde0
        0x00001830:    2004        .       MOVS     r0,#4
        0x00001832:    f7fffb0b    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xe4c
        0x00001836:    2002        .       MOVS     r0,#2
        0x00001838:    f7fffb40    ..@.    BL       HAL_SYSCON_Set_PClk1_Div ; 0xebc
        0x0000183c:    2164        d!      MOVS     r1,#0x64
        0x0000183e:    e8bd4010    ...@    POP      {r4,lr}
        0x00001842:    2001        .       MOVS     r0,#1
        0x00001844:    f7ffbb70    ..p.    B        HAL_SYSCON_Set_RTC_Div ; 0xf28
    $d
        0x00001848:    4000b000    ...@    DCD    1073786880
        0x0000184c:    05f5e100    ....    DCD    100000000
        0x00001850:    20000008    ...     DCD    536870920
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00001854:    4905        .I      LDR      r1,[pc,#20] ; [0x186c] = 0x88
        0x00001856:    b510        ..      PUSH     {r4,lr}
        0x00001858:    3158        X1      ADDS     r1,r1,#0x58
        0x0000185a:    d004        ..      BEQ      0x1866 ; TIMER_IRQHandler + 18
        0x0000185c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000185e:    6809        .h      LDR      r1,[r1,#0]
        0x00001860:    e8bd4010    ...@    POP      {r4,lr}
        0x00001864:    4708        .G      BX       r1
        0x00001866:    f7fefd73    ..s.    BL       abort ; 0x350
    $d
        0x0000186a:    0000        ..      DCW    0
        0x0000186c:    00000088    ....    DCD    136
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001870:    4905        .I      LDR      r1,[pc,#20] ; [0x1888] = 0x88
        0x00001872:    b510        ..      PUSH     {r4,lr}
        0x00001874:    3178        x1      ADDS     r1,r1,#0x78
        0x00001876:    d004        ..      BEQ      0x1882 ; UART_IRQHandler + 18
        0x00001878:    6848        Hh      LDR      r0,[r1,#4]
        0x0000187a:    6809        .h      LDR      r1,[r1,#0]
        0x0000187c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001880:    4708        .G      BX       r1
        0x00001882:    f7fefd65    ..e.    BL       abort ; 0x350
    $d
        0x00001886:    0000        ..      DCW    0
        0x00001888:    00000088    ....    DCD    136
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x0000188c:    4901        .I      LDR      r1,[pc,#4] ; [0x1894] = 0x88
        0x0000188e:    6848        Hh      LDR      r0,[r1,#4]
        0x00001890:    6809        .h      LDR      r1,[r1,#0]
        0x00001892:    4708        .G      BX       r1
    $d
        0x00001894:    00000088    ....    DCD    136
    $t
    i._DoInit
    _DoInit
        0x00001898:    b510        ..      PUSH     {r4,lr}
        0x0000189a:    4c12        .L      LDR      r4,[pc,#72] ; [0x18e4] = 0x20001470
        0x0000189c:    2003        .       MOVS     r0,#3
        0x0000189e:    2100        .!      MOVS     r1,#0
        0x000018a0:    6120         a      STR      r0,[r4,#0x10]
        0x000018a2:    6160        `a      STR      r0,[r4,#0x14]
        0x000018a4:    a010        ..      ADR      r0,{pc}+0x44 ; 0x18e8
        0x000018a6:    61a0        .a      STR      r0,[r4,#0x18]
        0x000018a8:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x000018ac:    61e0        .a      STR      r0,[r4,#0x1c]
        0x000018ae:    f44f6080    O..`    MOV      r0,#0x400
        0x000018b2:    62a1        .b      STR      r1,[r4,#0x28]
        0x000018b4:    6220         b      STR      r0,[r4,#0x20]
        0x000018b6:    6261        ab      STR      r1,[r4,#0x24]
        0x000018b8:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x18e8
        0x000018ba:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000018bc:    6620         f      STR      r0,[r4,#0x60]
        0x000018be:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x000018c2:    6660        `f      STR      r0,[r4,#0x64]
        0x000018c4:    2010        .       MOVS     r0,#0x10
        0x000018c6:    6721        !g      STR      r1,[r4,#0x70]
        0x000018c8:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x000018cc:    6761        ag      STR      r1,[r4,#0x74]
        0x000018ce:    a109        ..      ADR      r1,{pc}+0x26 ; 0x18f4
        0x000018d0:    1de0        ..      ADDS     r0,r4,#7
        0x000018d2:    f7fefd45    ..E.    BL       strcpy ; 0x360
        0x000018d6:    a108        ..      ADR      r1,{pc}+0x22 ; 0x18f8
        0x000018d8:    4620         F      MOV      r0,r4
        0x000018da:    f7fefd41    ..A.    BL       strcpy ; 0x360
        0x000018de:    2020                MOVS     r0,#0x20
        0x000018e0:    71a0        .q      STRB     r0,[r4,#6]
        0x000018e2:    bd10        ..      POP      {r4,pc}
    $d
        0x000018e4:    20001470    p..     DCD    536876144
        0x000018e8:    6d726554    Term    DCD    1836213588
        0x000018ec:    6c616e69    inal    DCD    1818324585
        0x000018f0:    00000000    ....    DCD    0
        0x000018f4:    00545452    RTT.    DCD    5526610
        0x000018f8:    47474553    SEGG    DCD    1195853139
        0x000018fc:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001900:    6902        .i      LDR      r2,[r0,#0x10]
        0x00001902:    68c1        .h      LDR      r1,[r0,#0xc]
        0x00001904:    428a        .B      CMP      r2,r1
        0x00001906:    d803        ..      BHI      0x1910 ; _GetAvailWriteSpace + 16
        0x00001908:    6880        .h      LDR      r0,[r0,#8]
        0x0000190a:    1a40        @.      SUBS     r0,r0,r1
        0x0000190c:    4410        .D      ADD      r0,r0,r2
        0x0000190e:    e000        ..      B        0x1912 ; _GetAvailWriteSpace + 18
        0x00001910:    1a50        P.      SUBS     r0,r2,r1
        0x00001912:    1e40        @.      SUBS     r0,r0,#1
        0x00001914:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x00001916:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x0000191a:    000e        ..      MOVS     r6,r1
        0x0000191c:    4680        .F      MOV      r8,r0
        0x0000191e:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x00001922:    f1c60000    ....    RSB      r0,r6,#0
        0x00001926:    4699        .F      MOV      r9,r3
        0x00001928:    4692        .F      MOV      r10,r2
        0x0000192a:    4683        .F      MOV      r11,r0
        0x0000192c:    d400        ..      BMI      0x1930 ; _PrintInt + 26
        0x0000192e:    4608        .F      MOV      r0,r1
        0x00001930:    2501        .%      MOVS     r5,#1
        0x00001932:    e002        ..      B        0x193a ; _PrintInt + 36
        0x00001934:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x00001938:    1c6d        m.      ADDS     r5,r5,#1
        0x0000193a:    4550        PE      CMP      r0,r10
        0x0000193c:    dafa        ..      BGE      0x1934 ; _PrintInt + 30
        0x0000193e:    45a9        .E      CMP      r9,r5
        0x00001940:    d900        ..      BLS      0x1944 ; _PrintInt + 46
        0x00001942:    464d        MF      MOV      r5,r9
        0x00001944:    b124        $.      CBZ      r4,0x1950 ; _PrintInt + 58
        0x00001946:    2e00        ..      CMP      r6,#0
        0x00001948:    db01        ..      BLT      0x194e ; _PrintInt + 56
        0x0000194a:    0778        x.      LSLS     r0,r7,#29
        0x0000194c:    d500        ..      BPL      0x1950 ; _PrintInt + 58
        0x0000194e:    1e64        d.      SUBS     r4,r4,#1
        0x00001950:    07b8        ..      LSLS     r0,r7,#30
        0x00001952:    d502        ..      BPL      0x195a ; _PrintInt + 68
        0x00001954:    f1b90f00    ....    CMP      r9,#0
        0x00001958:    d00f        ..      BEQ      0x197a ; _PrintInt + 100
        0x0000195a:    07f8        ..      LSLS     r0,r7,#31
        0x0000195c:    d10d        ..      BNE      0x197a ; _PrintInt + 100
        0x0000195e:    b164        d.      CBZ      r4,0x197a ; _PrintInt + 100
        0x00001960:    42a5        .B      CMP      r5,r4
        0x00001962:    d20a        ..      BCS      0x197a ; _PrintInt + 100
        0x00001964:    2120         !      MOVS     r1,#0x20
        0x00001966:    4640        @F      MOV      r0,r8
        0x00001968:    1e64        d.      SUBS     r4,r4,#1
        0x0000196a:    f000f89d    ....    BL       _StoreChar ; 0x1aa8
        0x0000196e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001972:    2800        .(      CMP      r0,#0
        0x00001974:    daf3        ..      BGE      0x195e ; _PrintInt + 72
        0x00001976:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x0000197a:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000197e:    2800        .(      CMP      r0,#0
        0x00001980:    dbf9        ..      BLT      0x1976 ; _PrintInt + 96
        0x00001982:    2e00        ..      CMP      r6,#0
        0x00001984:    da02        ..      BGE      0x198c ; _PrintInt + 118
        0x00001986:    465e        ^F      MOV      r6,r11
        0x00001988:    212d        -!      MOVS     r1,#0x2d
        0x0000198a:    e002        ..      B        0x1992 ; _PrintInt + 124
        0x0000198c:    0778        x.      LSLS     r0,r7,#29
        0x0000198e:    d507        ..      BPL      0x19a0 ; _PrintInt + 138
        0x00001990:    212b        +!      MOVS     r1,#0x2b
        0x00001992:    4640        @F      MOV      r0,r8
        0x00001994:    f000f888    ....    BL       _StoreChar ; 0x1aa8
        0x00001998:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000199c:    2800        .(      CMP      r0,#0
        0x0000199e:    dbea        ..      BLT      0x1976 ; _PrintInt + 96
        0x000019a0:    f0070003    ....    AND      r0,r7,#3
        0x000019a4:    2802        .(      CMP      r0,#2
        0x000019a6:    d10f        ..      BNE      0x19c8 ; _PrintInt + 178
        0x000019a8:    f1b90f00    ....    CMP      r9,#0
        0x000019ac:    d10c        ..      BNE      0x19c8 ; _PrintInt + 178
        0x000019ae:    b15c        \.      CBZ      r4,0x19c8 ; _PrintInt + 178
        0x000019b0:    42a5        .B      CMP      r5,r4
        0x000019b2:    d209        ..      BCS      0x19c8 ; _PrintInt + 178
        0x000019b4:    2130        0!      MOVS     r1,#0x30
        0x000019b6:    4640        @F      MOV      r0,r8
        0x000019b8:    1e64        d.      SUBS     r4,r4,#1
        0x000019ba:    f000f875    ..u.    BL       _StoreChar ; 0x1aa8
        0x000019be:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000019c2:    2800        .(      CMP      r0,#0
        0x000019c4:    daf3        ..      BGE      0x19ae ; _PrintInt + 152
        0x000019c6:    e7d6        ..      B        0x1976 ; _PrintInt + 96
        0x000019c8:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x000019cc:    464b        KF      MOV      r3,r9
        0x000019ce:    4652        RF      MOV      r2,r10
        0x000019d0:    4631        1F      MOV      r1,r6
        0x000019d2:    4640        @F      MOV      r0,r8
        0x000019d4:    f000f802    ....    BL       _PrintUnsigned ; 0x19dc
        0x000019d8:    e7cd        ..      B        0x1976 ; _PrintInt + 96
        0x000019da:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x000019dc:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x000019e0:    4682        .F      MOV      r10,r0
        0x000019e2:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x000019e6:    2501        .%      MOVS     r5,#1
        0x000019e8:    4699        .F      MOV      r9,r3
        0x000019ea:    4617        .F      MOV      r7,r2
        0x000019ec:    4688        .F      MOV      r8,r1
        0x000019ee:    4608        .F      MOV      r0,r1
        0x000019f0:    462e        .F      MOV      r6,r5
        0x000019f2:    e002        ..      B        0x19fa ; _PrintUnsigned + 30
        0x000019f4:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x000019f8:    1c76        v.      ADDS     r6,r6,#1
        0x000019fa:    42b8        .B      CMP      r0,r7
        0x000019fc:    d2fa        ..      BCS      0x19f4 ; _PrintUnsigned + 24
        0x000019fe:    45b1        .E      CMP      r9,r6
        0x00001a00:    d900        ..      BLS      0x1a04 ; _PrintUnsigned + 40
        0x00001a02:    464e        NF      MOV      r6,r9
        0x00001a04:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00001a08:    d117        ..      BNE      0x1a3a ; _PrintUnsigned + 94
        0x00001a0a:    b1b4        ..      CBZ      r4,0x1a3a ; _PrintUnsigned + 94
        0x00001a0c:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x00001a10:    d502        ..      BPL      0x1a18 ; _PrintUnsigned + 60
        0x00001a12:    f1b90f00    ....    CMP      r9,#0
        0x00001a16:    d002        ..      BEQ      0x1a1e ; _PrintUnsigned + 66
        0x00001a18:    2020                MOVS     r0,#0x20
        0x00001a1a:    9000        ..      STR      r0,[sp,#0]
        0x00001a1c:    e00b        ..      B        0x1a36 ; _PrintUnsigned + 90
        0x00001a1e:    2030        0       MOVS     r0,#0x30
        0x00001a20:    e7fb        ..      B        0x1a1a ; _PrintUnsigned + 62
        0x00001a22:    4650        PF      MOV      r0,r10
        0x00001a24:    1e64        d.      SUBS     r4,r4,#1
        0x00001a26:    9900        ..      LDR      r1,[sp,#0]
        0x00001a28:    f000f83e    ..>.    BL       _StoreChar ; 0x1aa8
        0x00001a2c:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001a30:    2800        .(      CMP      r0,#0
        0x00001a32:    db35        5.      BLT      0x1aa0 ; _PrintUnsigned + 196
        0x00001a34:    b10c        ..      CBZ      r4,0x1a3a ; _PrintUnsigned + 94
        0x00001a36:    42a6        .B      CMP      r6,r4
        0x00001a38:    d3f3        ..      BCC      0x1a22 ; _PrintUnsigned + 70
        0x00001a3a:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001a3e:    2800        .(      CMP      r0,#0
        0x00001a40:    db2e        ..      BLT      0x1aa0 ; _PrintUnsigned + 196
        0x00001a42:    f1b90f01    ....    CMP      r9,#1
        0x00001a46:    d902        ..      BLS      0x1a4e ; _PrintUnsigned + 114
        0x00001a48:    f1a90901    ....    SUB      r9,r9,#1
        0x00001a4c:    e003        ..      B        0x1a56 ; _PrintUnsigned + 122
        0x00001a4e:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001a52:    42b8        .B      CMP      r0,r7
        0x00001a54:    d301        ..      BCC      0x1a5a ; _PrintUnsigned + 126
        0x00001a56:    437d        }C      MULS     r5,r7,r5
        0x00001a58:    e7f3        ..      B        0x1a42 ; _PrintUnsigned + 102
        0x00001a5a:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0x1aa4] = 0x3000
        0x00001a5e:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001a62:    fb008815    ....    MLS      r8,r0,r5,r8
        0x00001a66:    f8191000    ....    LDRB     r1,[r9,r0]
        0x00001a6a:    4650        PF      MOV      r0,r10
        0x00001a6c:    f000f81c    ....    BL       _StoreChar ; 0x1aa8
        0x00001a70:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001a74:    2800        .(      CMP      r0,#0
        0x00001a76:    db03        ..      BLT      0x1a80 ; _PrintUnsigned + 164
        0x00001a78:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x00001a7c:    2d00        .-      CMP      r5,#0
        0x00001a7e:    d1ee        ..      BNE      0x1a5e ; _PrintUnsigned + 130
        0x00001a80:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00001a84:    d00c        ..      BEQ      0x1aa0 ; _PrintUnsigned + 196
        0x00001a86:    2c00        .,      CMP      r4,#0
        0x00001a88:    d00a        ..      BEQ      0x1aa0 ; _PrintUnsigned + 196
        0x00001a8a:    42a6        .B      CMP      r6,r4
        0x00001a8c:    d208        ..      BCS      0x1aa0 ; _PrintUnsigned + 196
        0x00001a8e:    2120         !      MOVS     r1,#0x20
        0x00001a90:    4650        PF      MOV      r0,r10
        0x00001a92:    1e64        d.      SUBS     r4,r4,#1
        0x00001a94:    f000f808    ....    BL       _StoreChar ; 0x1aa8
        0x00001a98:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001a9c:    2800        .(      CMP      r0,#0
        0x00001a9e:    daf2        ..      BGE      0x1a86 ; _PrintUnsigned + 170
        0x00001aa0:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x00001aa4:    00003000    .0..    DCD    12288
    $t
    i._StoreChar
    _StoreChar
        0x00001aa8:    b510        ..      PUSH     {r4,lr}
        0x00001aaa:    4604        .F      MOV      r4,r0
        0x00001aac:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x00001ab0:    1c42        B.      ADDS     r2,r0,#1
        0x00001ab2:    4293        .B      CMP      r3,r2
        0x00001ab4:    d305        ..      BCC      0x1ac2 ; _StoreChar + 26
        0x00001ab6:    6823        #h      LDR      r3,[r4,#0]
        0x00001ab8:    5419        .T      STRB     r1,[r3,r0]
        0x00001aba:    60a2        .`      STR      r2,[r4,#8]
        0x00001abc:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00001abe:    1c40        @.      ADDS     r0,r0,#1
        0x00001ac0:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001ac2:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x00001ac6:    4282        .B      CMP      r2,r0
        0x00001ac8:    d109        ..      BNE      0x1ade ; _StoreChar + 54
        0x00001aca:    6821        !h      LDR      r1,[r4,#0]
        0x00001acc:    6920         i      LDR      r0,[r4,#0x10]
        0x00001ace:    f7fffd23    ..#.    BL       SEGGER_RTT_Write ; 0x1518
        0x00001ad2:    68a1        .h      LDR      r1,[r4,#8]
        0x00001ad4:    4288        .B      CMP      r0,r1
        0x00001ad6:    d003        ..      BEQ      0x1ae0 ; _StoreChar + 56
        0x00001ad8:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001adc:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001ade:    bd10        ..      POP      {r4,pc}
        0x00001ae0:    2000        .       MOVS     r0,#0
        0x00001ae2:    60a0        .`      STR      r0,[r4,#8]
        0x00001ae4:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00001ae6:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001aea:    68c4        .h      LDR      r4,[r0,#0xc]
        0x00001aec:    4617        .F      MOV      r7,r2
        0x00001aee:    4689        .F      MOV      r9,r1
        0x00001af0:    4605        .F      MOV      r5,r0
        0x00001af2:    f04f0800    O...    MOV      r8,#0
        0x00001af6:    6928        (i      LDR      r0,[r5,#0x10]
        0x00001af8:    42a0        .B      CMP      r0,r4
        0x00001afa:    d901        ..      BLS      0x1b00 ; _WriteBlocking + 26
        0x00001afc:    1b06        ..      SUBS     r6,r0,r4
        0x00001afe:    e002        ..      B        0x1b06 ; _WriteBlocking + 32
        0x00001b00:    68a9        .h      LDR      r1,[r5,#8]
        0x00001b02:    1a20         .      SUBS     r0,r4,r0
        0x00001b04:    1a0e        ..      SUBS     r6,r1,r0
        0x00001b06:    68a8        .h      LDR      r0,[r5,#8]
        0x00001b08:    1e76        v.      SUBS     r6,r6,#1
        0x00001b0a:    1b00        ..      SUBS     r0,r0,r4
        0x00001b0c:    42b0        .B      CMP      r0,r6
        0x00001b0e:    d800        ..      BHI      0x1b12 ; _WriteBlocking + 44
        0x00001b10:    4606        .F      MOV      r6,r0
        0x00001b12:    42be        .B      CMP      r6,r7
        0x00001b14:    d300        ..      BCC      0x1b18 ; _WriteBlocking + 50
        0x00001b16:    463e        >F      MOV      r6,r7
        0x00001b18:    6868        hh      LDR      r0,[r5,#4]
        0x00001b1a:    4632        2F      MOV      r2,r6
        0x00001b1c:    4420         D      ADD      r0,r0,r4
        0x00001b1e:    4649        IF      MOV      r1,r9
        0x00001b20:    f7fefc42    ..B.    BL       __aeabi_memcpy ; 0x3a8
        0x00001b24:    68a8        .h      LDR      r0,[r5,#8]
        0x00001b26:    1bbf        ..      SUBS     r7,r7,r6
        0x00001b28:    4434        4D      ADD      r4,r4,r6
        0x00001b2a:    44b0        .D      ADD      r8,r8,r6
        0x00001b2c:    44b1        .D      ADD      r9,r9,r6
        0x00001b2e:    42a0        .B      CMP      r0,r4
        0x00001b30:    d100        ..      BNE      0x1b34 ; _WriteBlocking + 78
        0x00001b32:    2400        .$      MOVS     r4,#0
        0x00001b34:    60ec        .`      STR      r4,[r5,#0xc]
        0x00001b36:    2f00        ./      CMP      r7,#0
        0x00001b38:    d1dd        ..      BNE      0x1af6 ; _WriteBlocking + 16
        0x00001b3a:    4640        @F      MOV      r0,r8
        0x00001b3c:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001b40:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001b44:    4604        .F      MOV      r4,r0
        0x00001b46:    4688        .F      MOV      r8,r1
        0x00001b48:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x00001b4c:    1bc5        ..      SUBS     r5,r0,r7
        0x00001b4e:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00001b50:    6860        `h      LDR      r0,[r4,#4]
        0x00001b52:    4616        .F      MOV      r6,r2
        0x00001b54:    4408        .D      ADD      r0,r0,r1
        0x00001b56:    42b5        .B      CMP      r5,r6
        0x00001b58:    d906        ..      BLS      0x1b68 ; _WriteNoCheck + 40
        0x00001b5a:    4641        AF      MOV      r1,r8
        0x00001b5c:    f7fefc24    ..$.    BL       __aeabi_memcpy ; 0x3a8
        0x00001b60:    19b8        ..      ADDS     r0,r7,r6
        0x00001b62:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001b64:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00001b68:    462a        *F      MOV      r2,r5
        0x00001b6a:    4641        AF      MOV      r1,r8
        0x00001b6c:    f7fefc1c    ....    BL       __aeabi_memcpy ; 0x3a8
        0x00001b70:    1b76        v.      SUBS     r6,r6,r5
        0x00001b72:    eb080105    ....    ADD      r1,r8,r5
        0x00001b76:    4632        2F      MOV      r2,r6
        0x00001b78:    6860        `h      LDR      r0,[r4,#4]
        0x00001b7a:    f7fefc15    ....    BL       __aeabi_memcpy ; 0x3a8
        0x00001b7e:    60e6        .`      STR      r6,[r4,#0xc]
        0x00001b80:    e7f0        ..      B        0x1b64 ; _WriteNoCheck + 36
        0x00001b82:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00001b84:    b672        r.      CPSID    i
        0x00001b86:    4603        .F      MOV      r3,r0
        0x00001b88:    a001        ..      ADR      r0,{pc}+8 ; 0x1b90
        0x00001b8a:    f7fefb3b    ..;.    BL       __2printf ; 0x204
        0x00001b8e:    e7fe        ..      B        0x1b8e ; __aeabi_assert + 10
    $d
        0x00001b90:    65737341    Asse    DCD    1702064961
        0x00001b94:    6f697472    rtio    DCD    1869182066
        0x00001b98:    6146206e    n Fa    DCD    1631985774
        0x00001b9c:    64656c69    iled    DCD    1684368489
        0x00001ba0:    6966203a    : fi    DCD    1768300602
        0x00001ba4:    2520656c    le %    DCD    622880108
        0x00001ba8:    6c202c73    s, l    DCD    1814047859
        0x00001bac:    20656e69    ine     DCD    543518313
        0x00001bb0:    202c6425    %d,     DCD    539780133
        0x00001bb4:    000a7325    %s..    DCD    684837
    $t
    i.check_fs
    check_fs
        0x00001bb8:    b510        ..      PUSH     {r4,lr}
        0x00001bba:    4604        .F      MOV      r4,r0
        0x00001bbc:    460a        .F      MOV      r2,r1
        0x00001bbe:    7840        @x      LDRB     r0,[r0,#1]
        0x00001bc0:    2301        .#      MOVS     r3,#1
        0x00001bc2:    f1040130    ..0.    ADD      r1,r4,#0x30
        0x00001bc6:    f000fcb9    ....    BL       disk_read ; 0x253c
        0x00001bca:    b108        ..      CBZ      r0,0x1bd0 ; check_fs + 24
        0x00001bcc:    2003        .       MOVS     r0,#3
        0x00001bce:    bd10        ..      POP      {r4,pc}
        0x00001bd0:    f8b4122e    ....    LDRH     r1,[r4,#0x22e]
        0x00001bd4:    f5a1402a    ..*@    SUB      r0,r1,#0xaa00
        0x00001bd8:    3855        U8      SUBS     r0,r0,#0x55
        0x00001bda:    d001        ..      BEQ      0x1be0 ; check_fs + 40
        0x00001bdc:    2002        .       MOVS     r0,#2
        0x00001bde:    bd10        ..      POP      {r4,pc}
        0x00001be0:    f8940066    ..f.    LDRB     r0,[r4,#0x66]
        0x00001be4:    f8b41067    ..g.    LDRH     r1,[r4,#0x67]
        0x00001be8:    ea402101    @..!    ORR      r1,r0,r1,LSL #8
        0x00001bec:    4808        .H      LDR      r0,[pc,#32] ; [0x1c10] = 0x54414600
        0x00001bee:    ebb02f01    .../    CMP      r0,r1,LSL #8
        0x00001bf2:    d008        ..      BEQ      0x1c06 ; check_fs + 78
        0x00001bf4:    f8941082    ....    LDRB     r1,[r4,#0x82]
        0x00001bf8:    f8b42083    ...     LDRH     r2,[r4,#0x83]
        0x00001bfc:    ea412102    A..!    ORR      r1,r1,r2,LSL #8
        0x00001c00:    ebb02f01    .../    CMP      r0,r1,LSL #8
        0x00001c04:    d101        ..      BNE      0x1c0a ; check_fs + 82
        0x00001c06:    2000        .       MOVS     r0,#0
        0x00001c08:    bd10        ..      POP      {r4,pc}
        0x00001c0a:    2001        .       MOVS     r0,#1
        0x00001c0c:    bd10        ..      POP      {r4,pc}
    $d
        0x00001c0e:    0000        ..      DCW    0
        0x00001c10:    54414600    .FAT    DCD    1413563904
    $t
    i.chk_chr
    chk_chr
        0x00001c14:    e000        ..      B        0x1c18 ; chk_chr + 4
        0x00001c16:    1c40        @.      ADDS     r0,r0,#1
        0x00001c18:    7802        .x      LDRB     r2,[r0,#0]
        0x00001c1a:    b10a        ..      CBZ      r2,0x1c20 ; chk_chr + 12
        0x00001c1c:    428a        .B      CMP      r2,r1
        0x00001c1e:    d1fa        ..      BNE      0x1c16 ; chk_chr + 2
        0x00001c20:    b2d0        ..      UXTB     r0,r2
        0x00001c22:    4770        pG      BX       lr
    i.chk_mounted
    chk_mounted
        0x00001c24:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001c28:    4615        .F      MOV      r5,r2
        0x00001c2a:    460a        .F      MOV      r2,r1
        0x00001c2c:    6801        .h      LDR      r1,[r0,#0]
        0x00001c2e:    780b        .x      LDRB     r3,[r1,#0]
        0x00001c30:    3b30        0;      SUBS     r3,r3,#0x30
        0x00001c32:    2b09        .+      CMP      r3,#9
        0x00001c34:    d808        ..      BHI      0x1c48 ; chk_mounted + 36
        0x00001c36:    784c        Lx      LDRB     r4,[r1,#1]
        0x00001c38:    2c3a        :,      CMP      r4,#0x3a
        0x00001c3a:    d105        ..      BNE      0x1c48 ; chk_mounted + 36
        0x00001c3c:    1c89        ..      ADDS     r1,r1,#2
        0x00001c3e:    6001        .`      STR      r1,[r0,#0]
        0x00001c40:    b113        ..      CBZ      r3,0x1c48 ; chk_mounted + 36
        0x00001c42:    200b        .       MOVS     r0,#0xb
        0x00001c44:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00001c48:    4876        vH      LDR      r0,[pc,#472] ; [0x1e24] = 0x20000018
        0x00001c4a:    6804        .h      LDR      r4,[r0,#0]
        0x00001c4c:    6014        .`      STR      r4,[r2,#0]
        0x00001c4e:    b19c        ..      CBZ      r4,0x1c78 ; chk_mounted + 84
        0x00001c50:    7820         x      LDRB     r0,[r4,#0]
        0x00001c52:    b120         .      CBZ      r0,0x1c5e ; chk_mounted + 58
        0x00001c54:    7860        `x      LDRB     r0,[r4,#1]
        0x00001c56:    f000fc82    ....    BL       disk_status ; 0x255e
        0x00001c5a:    07c1        ..      LSLS     r1,r0,#31
        0x00001c5c:    d00e        ..      BEQ      0x1c7c ; chk_mounted + 88
        0x00001c5e:    f04f0900    O...    MOV      r9,#0
        0x00001c62:    f8849000    ....    STRB     r9,[r4,#0]
        0x00001c66:    4648        HF      MOV      r0,r9
        0x00001c68:    f8849001    ....    STRB     r9,[r4,#1]
        0x00001c6c:    f000fc43    ..C.    BL       disk_initialize ; 0x24f6
        0x00001c70:    07c1        ..      LSLS     r1,r0,#31
        0x00001c72:    d008        ..      BEQ      0x1c86 ; chk_mounted + 98
        0x00001c74:    2003        .       MOVS     r0,#3
        0x00001c76:    e7e5        ..      B        0x1c44 ; chk_mounted + 32
        0x00001c78:    200c        .       MOVS     r0,#0xc
        0x00001c7a:    e7e3        ..      B        0x1c44 ; chk_mounted + 32
        0x00001c7c:    b10d        ..      CBZ      r5,0x1c82 ; chk_mounted + 94
        0x00001c7e:    0740        @.      LSLS     r0,r0,#29
        0x00001c80:    d404        ..      BMI      0x1c8c ; chk_mounted + 104
        0x00001c82:    2000        .       MOVS     r0,#0
        0x00001c84:    e7de        ..      B        0x1c44 ; chk_mounted + 32
        0x00001c86:    b11d        ..      CBZ      r5,0x1c90 ; chk_mounted + 108
        0x00001c88:    0740        @.      LSLS     r0,r0,#29
        0x00001c8a:    d501        ..      BPL      0x1c90 ; chk_mounted + 108
        0x00001c8c:    200a        .       MOVS     r0,#0xa
        0x00001c8e:    e7d9        ..      B        0x1c44 ; chk_mounted + 32
        0x00001c90:    2600        .&      MOVS     r6,#0
        0x00001c92:    4631        1F      MOV      r1,r6
        0x00001c94:    4620         F      MOV      r0,r4
        0x00001c96:    f7ffff8f    ....    BL       check_fs ; 0x1bb8
        0x00001c9a:    2801        .(      CMP      r0,#1
        0x00001c9c:    d10c        ..      BNE      0x1cb8 ; chk_mounted + 148
        0x00001c9e:    f50470f7    ...p    ADD      r0,r4,#0x1ee
        0x00001ca2:    7901        .y      LDRB     r1,[r0,#4]
        0x00001ca4:    b3f1        ..      CBZ      r1,0x1d24 ; chk_mounted + 256
        0x00001ca6:    7a01        .z      LDRB     r1,[r0,#8]
        0x00001ca8:    f8d00009    ....    LDR      r0,[r0,#9]
        0x00001cac:    ea412600    A..&    ORR      r6,r1,r0,LSL #8
        0x00001cb0:    4631        1F      MOV      r1,r6
        0x00001cb2:    4620         F      MOV      r0,r4
        0x00001cb4:    f7ffff80    ....    BL       check_fs ; 0x1bb8
        0x00001cb8:    2803        .(      CMP      r0,#3
        0x00001cba:    d001        ..      BEQ      0x1cc0 ; chk_mounted + 156
        0x00001cbc:    bb90        ..      CBNZ     r0,0x1d24 ; chk_mounted + 256
        0x00001cbe:    e001        ..      B        0x1cc4 ; chk_mounted + 160
        0x00001cc0:    2001        .       MOVS     r0,#1
        0x00001cc2:    e7bf        ..      B        0x1c44 ; chk_mounted + 32
        0x00001cc4:    f8b4003b    ..;.    LDRH     r0,[r4,#0x3b]
        0x00001cc8:    f5b07f00    ....    CMP      r0,#0x200
        0x00001ccc:    d157        W.      BNE      0x1d7e ; chk_mounted + 346
        0x00001cce:    f8b40046    ..F.    LDRH     r0,[r4,#0x46]
        0x00001cd2:    b928        (.      CBNZ     r0,0x1ce0 ; chk_mounted + 188
        0x00001cd4:    f8940054    ..T.    LDRB     r0,[r4,#0x54]
        0x00001cd8:    f8d41055    ..U.    LDR      r1,[r4,#0x55]
        0x00001cdc:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x00001ce0:    61e0        .a      STR      r0,[r4,#0x1c]
        0x00001ce2:    f8941040    ..@.    LDRB     r1,[r4,#0x40]
        0x00001ce6:    4684        .F      MOV      r12,r0
        0x00001ce8:    70e1        .p      STRB     r1,[r4,#3]
        0x00001cea:    2901        .)      CMP      r1,#1
        0x00001cec:    d001        ..      BEQ      0x1cf2 ; chk_mounted + 206
        0x00001cee:    2902        .)      CMP      r1,#2
        0x00001cf0:    d145        E.      BNE      0x1d7e ; chk_mounted + 346
        0x00001cf2:    f894503d    ..=P    LDRB     r5,[r4,#0x3d]
        0x00001cf6:    4348        HC      MULS     r0,r1,r0
        0x00001cf8:    70a5        .p      STRB     r5,[r4,#2]
        0x00001cfa:    b19d        ..      CBZ      r5,0x1d24 ; chk_mounted + 256
        0x00001cfc:    1e6a        j.      SUBS     r2,r5,#1
        0x00001cfe:    4215        .B      TST      r5,r2
        0x00001d00:    d13d        =.      BNE      0x1d7e ; chk_mounted + 346
        0x00001d02:    f8b42041    ..A     LDRH     r2,[r4,#0x41]
        0x00001d06:    8122        ".      STRH     r2,[r4,#8]
        0x00001d08:    0711        ..      LSLS     r1,r2,#28
        0x00001d0a:    d138        8.      BNE      0x1d7e ; chk_mounted + 346
        0x00001d0c:    f8b41043    ..C.    LDRH     r1,[r4,#0x43]
        0x00001d10:    b929        ).      CBNZ     r1,0x1d1e ; chk_mounted + 250
        0x00001d12:    f8941050    ..P.    LDRB     r1,[r4,#0x50]
        0x00001d16:    f8d43051    ..Q0    LDR      r3,[r4,#0x51]
        0x00001d1a:    ea412103    A..!    ORR      r1,r1,r3,LSL #8
        0x00001d1e:    8fe3        ..      LDRH     r3,[r4,#0x3e]
        0x00001d20:    b103        ..      CBZ      r3,0x1d24 ; chk_mounted + 256
        0x00001d22:    e000        ..      B        0x1d26 ; chk_mounted + 258
        0x00001d24:    e02b        +.      B        0x1d7e ; chk_mounted + 346
        0x00001d26:    181f        ..      ADDS     r7,r3,r0
        0x00001d28:    eb071712    ....    ADD      r7,r7,r2,LSR #4
        0x00001d2c:    42b9        .B      CMP      r1,r7
        0x00001d2e:    d326        &.      BCC      0x1d7e ; chk_mounted + 346
        0x00001d30:    1bc9        ..      SUBS     r1,r1,r7
        0x00001d32:    fbb1f1f5    ....    UDIV     r1,r1,r5
        0x00001d36:    b311        ..      CBZ      r1,0x1d7e ; chk_mounted + 346
        0x00001d38:    2501        .%      MOVS     r5,#1
        0x00001d3a:    f64078f6    @..x    MOV      r8,#0xff6
        0x00001d3e:    4541        AE      CMP      r1,r8
        0x00001d40:    d300        ..      BCC      0x1d44 ; chk_mounted + 288
        0x00001d42:    2502        .%      MOVS     r5,#2
        0x00001d44:    f64f78f6    O..x    MOV      r8,#0xfff6
        0x00001d48:    4541        AE      CMP      r1,r8
        0x00001d4a:    d300        ..      BCC      0x1d4e ; chk_mounted + 298
        0x00001d4c:    2503        .%      MOVS     r5,#3
        0x00001d4e:    4437        7D      ADD      r7,r7,r6
        0x00001d50:    1c89        ..      ADDS     r1,r1,#2
        0x00001d52:    4433        3D      ADD      r3,r3,r6
        0x00001d54:    62a7        .b      STR      r7,[r4,#0x28]
        0x00001d56:    6223        #b      STR      r3,[r4,#0x20]
        0x00001d58:    61a1        .a      STR      r1,[r4,#0x18]
        0x00001d5a:    2d03        .-      CMP      r5,#3
        0x00001d5c:    d011        ..      BEQ      0x1d82 ; chk_mounted + 350
        0x00001d5e:    b172        r.      CBZ      r2,0x1d7e ; chk_mounted + 346
        0x00001d60:    4418        .D      ADD      r0,r0,r3
        0x00001d62:    6260        `b      STR      r0,[r4,#0x24]
        0x00001d64:    2d02        .-      CMP      r5,#2
        0x00001d66:    d017        ..      BEQ      0x1d98 ; chk_mounted + 372
        0x00001d68:    f0010001    ....    AND      r0,r1,#1
        0x00001d6c:    eb010141    ..A.    ADD      r1,r1,r1,LSL #1
        0x00001d70:    eb000051    ..Q.    ADD      r0,r0,r1,LSR #1
        0x00001d74:    f20010ff    ....    ADD      r0,r0,#0x1ff
        0x00001d78:    ebbc2f50    ..P/    CMP      r12,r0,LSR #9
        0x00001d7c:    d20e        ..      BCS      0x1d9c ; chk_mounted + 376
        0x00001d7e:    200d        .       MOVS     r0,#0xd
        0x00001d80:    e760        `.      B        0x1c44 ; chk_mounted + 32
        0x00001d82:    2a00        .*      CMP      r2,#0
        0x00001d84:    d1fb        ..      BNE      0x1d7e ; chk_mounted + 346
        0x00001d86:    f894005c    ..\.    LDRB     r0,[r4,#0x5c]
        0x00001d8a:    f8d4205d    ..]     LDR      r2,[r4,#0x5d]
        0x00001d8e:    ea402002    @..     ORR      r0,r0,r2,LSL #8
        0x00001d92:    6260        `b      STR      r0,[r4,#0x24]
        0x00001d94:    0088        ..      LSLS     r0,r1,#2
        0x00001d96:    e7ed        ..      B        0x1d74 ; chk_mounted + 336
        0x00001d98:    0048        H.      LSLS     r0,r1,#1
        0x00001d9a:    e7eb        ..      B        0x1d74 ; chk_mounted + 336
        0x00001d9c:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001da0:    e9c49003    ....    STRD     r9,r0,[r4,#0xc]
        0x00001da4:    464f        OF      MOV      r7,r9
        0x00001da6:    2d03        .-      CMP      r5,#3
        0x00001da8:    d131        1.      BNE      0x1e0e ; chk_mounted + 490
        0x00001daa:    7167        gq      STRB     r7,[r4,#5]
        0x00001dac:    f8b40060    ..`.    LDRH     r0,[r4,#0x60]
        0x00001db0:    2301        .#      MOVS     r3,#1
        0x00001db2:    1982        ..      ADDS     r2,r0,r6
        0x00001db4:    6162        ba      STR      r2,[r4,#0x14]
        0x00001db6:    7860        `x      LDRB     r0,[r4,#1]
        0x00001db8:    f1040130    ..0.    ADD      r1,r4,#0x30
        0x00001dbc:    f000fbbe    ....    BL       disk_read ; 0x253c
        0x00001dc0:    bb28        (.      CBNZ     r0,0x1e0e ; chk_mounted + 490
        0x00001dc2:    f8b4022e    ....    LDRH     r0,[r4,#0x22e]
        0x00001dc6:    f5a0412a    ..*A    SUB      r1,r0,#0xaa00
        0x00001dca:    3955        U9      SUBS     r1,r1,#0x55
        0x00001dcc:    d11f        ..      BNE      0x1e0e ; chk_mounted + 490
        0x00001dce:    f8940030    ..0.    LDRB     r0,[r4,#0x30]
        0x00001dd2:    f8d41031    ..1.    LDR      r1,[r4,#0x31]
        0x00001dd6:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x00001dda:    4913        .I      LDR      r1,[pc,#76] ; [0x1e28] = 0x41615252
        0x00001ddc:    4288        .B      CMP      r0,r1
        0x00001dde:    d116        ..      BNE      0x1e0e ; chk_mounted + 490
        0x00001de0:    f8940214    ....    LDRB     r0,[r4,#0x214]
        0x00001de4:    f8d41215    ....    LDR      r1,[r4,#0x215]
        0x00001de8:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x00001dec:    490f        .I      LDR      r1,[pc,#60] ; [0x1e2c] = 0x61417272
        0x00001dee:    4288        .B      CMP      r0,r1
        0x00001df0:    d10d        ..      BNE      0x1e0e ; chk_mounted + 490
        0x00001df2:    f894021c    ....    LDRB     r0,[r4,#0x21c]
        0x00001df6:    f8d4121d    ....    LDR      r1,[r4,#0x21d]
        0x00001dfa:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x00001dfe:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001e00:    f8940218    ....    LDRB     r0,[r4,#0x218]
        0x00001e04:    f8d41219    ....    LDR      r1,[r4,#0x219]
        0x00001e08:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x00001e0c:    6120         a      STR      r0,[r4,#0x10]
        0x00001e0e:    4905        .I      LDR      r1,[pc,#20] ; [0x1e24] = 0x20000018
        0x00001e10:    7025        %p      STRB     r5,[r4,#0]
        0x00001e12:    1f09        ..      SUBS     r1,r1,#4
        0x00001e14:    8808        ..      LDRH     r0,[r1,#0]
        0x00001e16:    1c40        @.      ADDS     r0,r0,#1
        0x00001e18:    8008        ..      STRH     r0,[r1,#0]
        0x00001e1a:    80e0        ..      STRH     r0,[r4,#6]
        0x00001e1c:    62e7        .b      STR      r7,[r4,#0x2c]
        0x00001e1e:    7127        'q      STRB     r7,[r4,#4]
        0x00001e20:    e72f        /.      B        0x1c82 ; chk_mounted + 94
    $d
        0x00001e22:    0000        ..      DCW    0
        0x00001e24:    20000018    ...     DCD    536870936
        0x00001e28:    41615252    RRaA    DCD    1096897106
        0x00001e2c:    61417272    rrAa    DCD    1631679090
    $t
    i.clust2sect
    clust2sect
        0x00001e30:    6982        .i      LDR      r2,[r0,#0x18]
        0x00001e32:    1e89        ..      SUBS     r1,r1,#2
        0x00001e34:    1e92        ..      SUBS     r2,r2,#2
        0x00001e36:    428a        .B      CMP      r2,r1
        0x00001e38:    d801        ..      BHI      0x1e3e ; clust2sect + 14
        0x00001e3a:    2000        .       MOVS     r0,#0
        0x00001e3c:    4770        pG      BX       lr
        0x00001e3e:    6a82        .j      LDR      r2,[r0,#0x28]
        0x00001e40:    7880        .x      LDRB     r0,[r0,#2]
        0x00001e42:    fb012000    ...     MLA      r0,r1,r0,r2
        0x00001e46:    4770        pG      BX       lr
    i.create_chain
    create_chain
        0x00001e48:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001e4c:    000f        ..      MOVS     r7,r1
        0x00001e4e:    4606        .F      MOV      r6,r0
        0x00001e50:    d006        ..      BEQ      0x1e60 ; create_chain + 24
        0x00001e52:    f000fdeb    ....    BL       get_fat ; 0x2a2c
        0x00001e56:    2802        .(      CMP      r0,#2
        0x00001e58:    d209        ..      BCS      0x1e6e ; create_chain + 38
        0x00001e5a:    2001        .       MOVS     r0,#1
        0x00001e5c:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00001e60:    68f5        .h      LDR      r5,[r6,#0xc]
        0x00001e62:    b115        ..      CBZ      r5,0x1e6a ; create_chain + 34
        0x00001e64:    69b0        .i      LDR      r0,[r6,#0x18]
        0x00001e66:    42a8        .B      CMP      r0,r5
        0x00001e68:    d805        ..      BHI      0x1e76 ; create_chain + 46
        0x00001e6a:    2501        .%      MOVS     r5,#1
        0x00001e6c:    e003        ..      B        0x1e76 ; create_chain + 46
        0x00001e6e:    69b1        .i      LDR      r1,[r6,#0x18]
        0x00001e70:    4281        .B      CMP      r1,r0
        0x00001e72:    d8f3        ..      BHI      0x1e5c ; create_chain + 20
        0x00001e74:    463d        =F      MOV      r5,r7
        0x00001e76:    462c        ,F      MOV      r4,r5
        0x00001e78:    69b0        .i      LDR      r0,[r6,#0x18]
        0x00001e7a:    1c64        d.      ADDS     r4,r4,#1
        0x00001e7c:    42a0        .B      CMP      r0,r4
        0x00001e7e:    d802        ..      BHI      0x1e86 ; create_chain + 62
        0x00001e80:    2402        .$      MOVS     r4,#2
        0x00001e82:    2d02        .-      CMP      r5,#2
        0x00001e84:    d30a        ..      BCC      0x1e9c ; create_chain + 84
        0x00001e86:    4621        !F      MOV      r1,r4
        0x00001e88:    4630        0F      MOV      r0,r6
        0x00001e8a:    f000fdcf    ....    BL       get_fat ; 0x2a2c
        0x00001e8e:    b138        8.      CBZ      r0,0x1ea0 ; create_chain + 88
        0x00001e90:    1c41        A.      ADDS     r1,r0,#1
        0x00001e92:    d0e3        ..      BEQ      0x1e5c ; create_chain + 20
        0x00001e94:    2801        .(      CMP      r0,#1
        0x00001e96:    d0e1        ..      BEQ      0x1e5c ; create_chain + 20
        0x00001e98:    42ac        .B      CMP      r4,r5
        0x00001e9a:    d1ed        ..      BNE      0x1e78 ; create_chain + 48
        0x00001e9c:    2000        .       MOVS     r0,#0
        0x00001e9e:    e7dd        ..      B        0x1e5c ; create_chain + 20
        0x00001ea0:    f06f4270    o.pB    MVN      r2,#0xf0000000
        0x00001ea4:    4621        !F      MOV      r1,r4
        0x00001ea6:    4630        0F      MOV      r0,r6
        0x00001ea8:    f000ff18    ....    BL       put_fat ; 0x2cdc
        0x00001eac:    b930        0.      CBNZ     r0,0x1ebc ; create_chain + 116
        0x00001eae:    b157        W.      CBZ      r7,0x1ec6 ; create_chain + 126
        0x00001eb0:    4622        "F      MOV      r2,r4
        0x00001eb2:    4639        9F      MOV      r1,r7
        0x00001eb4:    4630        0F      MOV      r0,r6
        0x00001eb6:    f000ff11    ....    BL       put_fat ; 0x2cdc
        0x00001eba:    b120         .      CBZ      r0,0x1ec6 ; create_chain + 126
        0x00001ebc:    2801        .(      CMP      r0,#1
        0x00001ebe:    d00b        ..      BEQ      0x1ed8 ; create_chain + 144
        0x00001ec0:    2401        .$      MOVS     r4,#1
        0x00001ec2:    4620         F      MOV      r0,r4
        0x00001ec4:    e7ca        ..      B        0x1e5c ; create_chain + 20
        0x00001ec6:    60f4        .`      STR      r4,[r6,#0xc]
        0x00001ec8:    6930        0i      LDR      r0,[r6,#0x10]
        0x00001eca:    1c41        A.      ADDS     r1,r0,#1
        0x00001ecc:    d0f9        ..      BEQ      0x1ec2 ; create_chain + 122
        0x00001ece:    1e40        @.      SUBS     r0,r0,#1
        0x00001ed0:    6130        0a      STR      r0,[r6,#0x10]
        0x00001ed2:    2001        .       MOVS     r0,#1
        0x00001ed4:    7170        pq      STRB     r0,[r6,#5]
        0x00001ed6:    e7f4        ..      B        0x1ec2 ; create_chain + 122
        0x00001ed8:    f04f34ff    O..4    MOV      r4,#0xffffffff
        0x00001edc:    e7f1        ..      B        0x1ec2 ; create_chain + 122
        0x00001ede:    0000        ..      MOVS     r0,r0
    i.create_name
    create_name
        0x00001ee0:    e92d5ff3    -.._    PUSH     {r0,r1,r4-r12,lr}
        0x00001ee4:    4688        .F      MOV      r8,r1
        0x00001ee6:    680d        .h      LDR      r5,[r1,#0]
        0x00001ee8:    e000        ..      B        0x1eec ; create_name + 12
        0x00001eea:    1c6d        m.      ADDS     r5,r5,#1
        0x00001eec:    7828        (x      LDRB     r0,[r5,#0]
        0x00001eee:    282f        /(      CMP      r0,#0x2f
        0x00001ef0:    d0fb        ..      BEQ      0x1eea ; create_name + 10
        0x00001ef2:    285c        \(      CMP      r0,#0x5c
        0x00001ef4:    d0f9        ..      BEQ      0x1eea ; create_name + 10
        0x00001ef6:    9800        ..      LDR      r0,[sp,#0]
        0x00001ef8:    2400        .$      MOVS     r4,#0
        0x00001efa:    4626        &F      MOV      r6,r4
        0x00001efc:    f8d0901c    ....    LDR      r9,[r0,#0x1c]
        0x00001f00:    5da8        .]      LDRB     r0,[r5,r6]
        0x00001f02:    1c76        v.      ADDS     r6,r6,#1
        0x00001f04:    2820         (      CMP      r0,#0x20
        0x00001f06:    d315        ..      BCC      0x1f34 ; create_name + 84
        0x00001f08:    282f        /(      CMP      r0,#0x2f
        0x00001f0a:    d013        ..      BEQ      0x1f34 ; create_name + 84
        0x00001f0c:    285c        \(      CMP      r0,#0x5c
        0x00001f0e:    d011        ..      BEQ      0x1f34 ; create_name + 84
        0x00001f10:    2cff        .,      CMP      r4,#0xff
        0x00001f12:    d22f        /.      BCS      0x1f74 ; create_name + 148
        0x00001f14:    2101        .!      MOVS     r1,#1
        0x00001f16:    f000fceb    ....    BL       ff_convert ; 0x28f0
        0x00001f1a:    0007        ..      MOVS     r7,r0
        0x00001f1c:    d02a        *.      BEQ      0x1f74 ; create_name + 148
        0x00001f1e:    2f80        ./      CMP      r7,#0x80
        0x00001f20:    d204        ..      BCS      0x1f2c ; create_name + 76
        0x00001f22:    4601        .F      MOV      r1,r0
        0x00001f24:    a05f        _.      ADR      r0,{pc}+0x180 ; 0x20a4
        0x00001f26:    f7fffe75    ..u.    BL       chk_chr ; 0x1c14
        0x00001f2a:    bb18        ..      CBNZ     r0,0x1f74 ; create_name + 148
        0x00001f2c:    f8297014    )..p    STRH     r7,[r9,r4,LSL #1]
        0x00001f30:    1c64        d.      ADDS     r4,r4,#1
        0x00001f32:    e7e5        ..      B        0x1f00 ; create_name + 32
        0x00001f34:    19aa        ..      ADDS     r2,r5,r6
        0x00001f36:    f8c82000    ...     STR      r2,[r8,#0]
        0x00001f3a:    2820         (      CMP      r0,#0x20
        0x00001f3c:    d201        ..      BCS      0x1f42 ; create_name + 98
        0x00001f3e:    2604        .&      MOVS     r6,#4
        0x00001f40:    e016        ..      B        0x1f70 ; create_name + 144
        0x00001f42:    2600        .&      MOVS     r6,#0
        0x00001f44:    e014        ..      B        0x1f70 ; create_name + 144
        0x00001f46:    eb090044    ..D.    ADD      r0,r9,r4,LSL #1
        0x00001f4a:    f8300c02    0...    LDRH     r0,[r0,#-2]
        0x00001f4e:    2820         (      CMP      r0,#0x20
        0x00001f50:    d00d        ..      BEQ      0x1f6e ; create_name + 142
        0x00001f52:    282e        .(      CMP      r0,#0x2e
        0x00001f54:    d00b        ..      BEQ      0x1f6e ; create_name + 142
        0x00001f56:    b16c        l.      CBZ      r4,0x1f74 ; create_name + 148
        0x00001f58:    2100        .!      MOVS     r1,#0
        0x00001f5a:    f8291014    )...    STRH     r1,[r9,r4,LSL #1]
        0x00001f5e:    9800        ..      LDR      r0,[sp,#0]
        0x00001f60:    220b        ."      MOVS     r2,#0xb
        0x00001f62:    2120         !      MOVS     r1,#0x20
        0x00001f64:    6980        .i      LDR      r0,[r0,#0x18]
        0x00001f66:    f000fe7d    ..}.    BL       mem_set ; 0x2c64
        0x00001f6a:    2700        .'      MOVS     r7,#0
        0x00001f6c:    e006        ..      B        0x1f7c ; create_name + 156
        0x00001f6e:    1e64        d.      SUBS     r4,r4,#1
        0x00001f70:    2c00        .,      CMP      r4,#0
        0x00001f72:    d1e8        ..      BNE      0x1f46 ; create_name + 102
        0x00001f74:    2006        .       MOVS     r0,#6
        0x00001f76:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x00001f7a:    1c7f        ..      ADDS     r7,r7,#1
        0x00001f7c:    f8390017    9...    LDRH     r0,[r9,r7,LSL #1]
        0x00001f80:    2820         (      CMP      r0,#0x20
        0x00001f82:    d0fa        ..      BEQ      0x1f7a ; create_name + 154
        0x00001f84:    282e        .(      CMP      r0,#0x2e
        0x00001f86:    d0f8        ..      BEQ      0x1f7a ; create_name + 154
        0x00001f88:    b11f        ..      CBZ      r7,0x1f92 ; create_name + 178
        0x00001f8a:    f0460603    F...    ORR      r6,r6,#3
        0x00001f8e:    e000        ..      B        0x1f92 ; create_name + 178
        0x00001f90:    1e64        d.      SUBS     r4,r4,#1
        0x00001f92:    b12c        ,.      CBZ      r4,0x1fa0 ; create_name + 192
        0x00001f94:    eb090044    ..D.    ADD      r0,r9,r4,LSL #1
        0x00001f98:    f8300c02    0...    LDRH     r0,[r0,#-2]
        0x00001f9c:    282e        .(      CMP      r0,#0x2e
        0x00001f9e:    d1f7        ..      BNE      0x1f90 ; create_name + 176
        0x00001fa0:    f04f0a00    O...    MOV      r10,#0
        0x00001fa4:    46d0        .F      MOV      r8,r10
        0x00001fa6:    f04f0b08    O...    MOV      r11,#8
        0x00001faa:    f8395017    9..P    LDRH     r5,[r9,r7,LSL #1]
        0x00001fae:    1c7f        ..      ADDS     r7,r7,#1
        0x00001fb0:    b305        ..      CBZ      r5,0x1ff4 ; create_name + 276
        0x00001fb2:    2d20         -      CMP      r5,#0x20
        0x00001fb4:    d003        ..      BEQ      0x1fbe ; create_name + 222
        0x00001fb6:    2d2e        .-      CMP      r5,#0x2e
        0x00001fb8:    d104        ..      BNE      0x1fc4 ; create_name + 228
        0x00001fba:    42a7        .B      CMP      r7,r4
        0x00001fbc:    d002        ..      BEQ      0x1fc4 ; create_name + 228
        0x00001fbe:    f0460603    F...    ORR      r6,r6,#3
        0x00001fc2:    e7f2        ..      B        0x1faa ; create_name + 202
        0x00001fc4:    45da        .E      CMP      r10,r11
        0x00001fc6:    d201        ..      BCS      0x1fcc ; create_name + 236
        0x00001fc8:    42a7        .B      CMP      r7,r4
        0x00001fca:    d119        ..      BNE      0x2000 ; create_name + 288
        0x00001fcc:    f1bb0f0b    ....    CMP      r11,#0xb
        0x00001fd0:    d00e        ..      BEQ      0x1ff0 ; create_name + 272
        0x00001fd2:    42a7        .B      CMP      r7,r4
        0x00001fd4:    d001        ..      BEQ      0x1fda ; create_name + 250
        0x00001fd6:    f0460603    F...    ORR      r6,r6,#3
        0x00001fda:    d80b        ..      BHI      0x1ff4 ; create_name + 276
        0x00001fdc:    ea4f6088    O..`    LSL      r0,r8,#26
        0x00001fe0:    4627        'F      MOV      r7,r4
        0x00001fe2:    f04f0a08    O...    MOV      r10,#8
        0x00001fe6:    f04f0b0b    O...    MOV      r11,#0xb
        0x00001fea:    ea4f6810    O..h    LSR      r8,r0,#24
        0x00001fee:    e7dc        ..      B        0x1faa ; create_name + 202
        0x00001ff0:    f0460603    F...    ORR      r6,r6,#3
        0x00001ff4:    9800        ..      LDR      r0,[sp,#0]
        0x00001ff6:    6980        .i      LDR      r0,[r0,#0x18]
        0x00001ff8:    7801        .x      LDRB     r1,[r0,#0]
        0x00001ffa:    29e5        .)      CMP      r1,#0xe5
        0x00001ffc:    d02e        ..      BEQ      0x205c ; create_name + 380
        0x00001ffe:    e02f        /.      B        0x2060 ; create_name + 384
        0x00002000:    2d80        .-      CMP      r5,#0x80
        0x00002002:    d30c        ..      BCC      0x201e ; create_name + 318
        0x00002004:    2100        .!      MOVS     r1,#0
        0x00002006:    4628        (F      MOV      r0,r5
        0x00002008:    f000fc72    ..r.    BL       ff_convert ; 0x28f0
        0x0000200c:    0005        ..      MOVS     r5,r0
        0x0000200e:    d003        ..      BEQ      0x2018 ; create_name + 312
        0x00002010:    4827        'H      LDR      r0,[pc,#156] ; [0x20b0] = 0x301d
        0x00002012:    4428        (D      ADD      r0,r0,r5
        0x00002014:    f8105c80    ...\    LDRB     r5,[r0,#-0x80]
        0x00002018:    f0460602    F...    ORR      r6,r6,#2
        0x0000201c:    b125        %.      CBZ      r5,0x2028 ; create_name + 328
        0x0000201e:    4629        )F      MOV      r1,r5
        0x00002020:    a024        $.      ADR      r0,{pc}+0x94 ; 0x20b4
        0x00002022:    f7fffdf7    ....    BL       chk_chr ; 0x1c14
        0x00002026:    b118        ..      CBZ      r0,0x2030 ; create_name + 336
        0x00002028:    255f        _%      MOVS     r5,#0x5f
        0x0000202a:    f0460603    F...    ORR      r6,r6,#3
        0x0000202e:    e00e        ..      B        0x204e ; create_name + 366
        0x00002030:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x00002034:    2819        .(      CMP      r0,#0x19
        0x00002036:    d802        ..      BHI      0x203e ; create_name + 350
        0x00002038:    f0480802    H...    ORR      r8,r8,#2
        0x0000203c:    e007        ..      B        0x204e ; create_name + 366
        0x0000203e:    f1a50061    ..a.    SUB      r0,r5,#0x61
        0x00002042:    2819        .(      CMP      r0,#0x19
        0x00002044:    d803        ..      BHI      0x204e ; create_name + 366
        0x00002046:    3d20         =      SUBS     r5,r5,#0x20
        0x00002048:    f0480801    H...    ORR      r8,r8,#1
        0x0000204c:    b2ad        ..      UXTH     r5,r5
        0x0000204e:    9800        ..      LDR      r0,[sp,#0]
        0x00002050:    6981        .i      LDR      r1,[r0,#0x18]
        0x00002052:    f801500a    ...P    STRB     r5,[r1,r10]
        0x00002056:    f10a0a01    ....    ADD      r10,r10,#1
        0x0000205a:    e7a6        ..      B        0x1faa ; create_name + 202
        0x0000205c:    2105        .!      MOVS     r1,#5
        0x0000205e:    7001        .p      STRB     r1,[r0,#0]
        0x00002060:    f1bb0f08    ....    CMP      r11,#8
        0x00002064:    d103        ..      BNE      0x206e ; create_name + 398
        0x00002066:    ea4f6088    O..`    LSL      r0,r8,#26
        0x0000206a:    ea4f6810    O..h    LSR      r8,r0,#24
        0x0000206e:    f3c80081    ....    UBFX     r0,r8,#2,#2
        0x00002072:    2803        .(      CMP      r0,#3
        0x00002074:    d003        ..      BEQ      0x207e ; create_name + 414
        0x00002076:    ea6f0108    o...    MVN      r1,r8
        0x0000207a:    0789        ..      LSLS     r1,r1,#30
        0x0000207c:    d101        ..      BNE      0x2082 ; create_name + 418
        0x0000207e:    f0460602    F...    ORR      r6,r6,#2
        0x00002082:    07b1        ..      LSLS     r1,r6,#30
        0x00002084:    d409        ..      BMI      0x209a ; create_name + 442
        0x00002086:    f0080103    ....    AND      r1,r8,#3
        0x0000208a:    2901        .)      CMP      r1,#1
        0x0000208c:    d101        ..      BNE      0x2092 ; create_name + 434
        0x0000208e:    f0460610    F...    ORR      r6,r6,#0x10
        0x00002092:    2801        .(      CMP      r0,#1
        0x00002094:    d101        ..      BNE      0x209a ; create_name + 442
        0x00002096:    f0460608    F...    ORR      r6,r6,#8
        0x0000209a:    9800        ..      LDR      r0,[sp,#0]
        0x0000209c:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000209e:    72c6        .r      STRB     r6,[r0,#0xb]
        0x000020a0:    2000        .       MOVS     r0,#0
        0x000020a2:    e768        h.      B        0x1f76 ; create_name + 150
    $d
        0x000020a4:    3c3a2a22    "*:<    DCD    1010444834
        0x000020a8:    7f7c3f3e    >?|.    DCD    2138849086
        0x000020ac:    00000000    ....    DCD    0
        0x000020b0:    0000301d    .0..    DCD    12317
        0x000020b4:    3d3b2c2b    +,;=    DCD    1027288107
        0x000020b8:    00005d5b    []..    DCD    23899
    $t
    i.dir_find
    dir_find
        0x000020bc:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x000020c0:    4604        .F      MOV      r4,r0
        0x000020c2:    2100        .!      MOVS     r1,#0
        0x000020c4:    f000f9d8    ....    BL       dir_sdi ; 0x2478
        0x000020c8:    2800        .(      CMP      r0,#0
        0x000020ca:    d17c        |.      BNE      0x21c6 ; dir_find + 266
        0x000020cc:    25ff        .%      MOVS     r5,#0xff
        0x000020ce:    46ab        .F      MOV      r11,r5
        0x000020d0:    6921        !i      LDR      r1,[r4,#0x10]
        0x000020d2:    6820         h      LDR      r0,[r4,#0]
        0x000020d4:    f000fdcd    ....    BL       move_window ; 0x2c72
        0x000020d8:    0007        ..      MOVS     r7,r0
        0x000020da:    d17d        }.      BNE      0x21d8 ; dir_find + 284
        0x000020dc:    6966        fi      LDR      r6,[r4,#0x14]
        0x000020de:    7830        0x      LDRB     r0,[r6,#0]
        0x000020e0:    b150        P.      CBZ      r0,0x20f8 ; dir_find + 60
        0x000020e2:    7af1        .z      LDRB     r1,[r6,#0xb]
        0x000020e4:    28e5        .(      CMP      r0,#0xe5
        0x000020e6:    f001013f    ..?.    AND      r1,r1,#0x3f
        0x000020ea:    d003        ..      BEQ      0x20f4 ; dir_find + 56
        0x000020ec:    070a        ..      LSLS     r2,r1,#28
        0x000020ee:    d505        ..      BPL      0x20fc ; dir_find + 64
        0x000020f0:    290f        .)      CMP      r1,#0xf
        0x000020f2:    d007        ..      BEQ      0x2104 ; dir_find + 72
        0x000020f4:    25ff        .%      MOVS     r5,#0xff
        0x000020f6:    e068        h.      B        0x21ca ; dir_find + 270
        0x000020f8:    2704        .'      MOVS     r7,#4
        0x000020fa:    e06d        m.      B        0x21d8 ; dir_find + 284
        0x000020fc:    290f        .)      CMP      r1,#0xf
        0x000020fe:    d001        ..      BEQ      0x2104 ; dir_find + 72
        0x00002100:    b38d        ..      CBZ      r5,0x2166 ; dir_find + 170
        0x00002102:    e04d        M.      B        0x21a0 ; dir_find + 228
        0x00002104:    69e1        .i      LDR      r1,[r4,#0x1c]
        0x00002106:    b379        y.      CBZ      r1,0x2168 ; dir_find + 172
        0x00002108:    0642        B.      LSLS     r2,r0,#25
        0x0000210a:    d506        ..      BPL      0x211a ; dir_find + 94
        0x0000210c:    f896b00d    ....    LDRB     r11,[r6,#0xd]
        0x00002110:    f0200040     .@.    BIC      r0,r0,#0x40
        0x00002114:    88e2        ..      LDRH     r2,[r4,#6]
        0x00002116:    4605        .F      MOV      r5,r0
        0x00002118:    8422        ".      STRH     r2,[r4,#0x20]
        0x0000211a:    42a8        .B      CMP      r0,r5
        0x0000211c:    d136        6.      BNE      0x218c ; dir_find + 208
        0x0000211e:    7b72        r{      LDRB     r2,[r6,#0xd]
        0x00002120:    455a        ZE      CMP      r2,r11
        0x00002122:    d133        3.      BNE      0x218c ; dir_find + 208
        0x00002124:    7830        0x      LDRB     r0,[r6,#0]
        0x00002126:    468a        .F      MOV      r10,r1
        0x00002128:    f0200040     .@.    BIC      r0,r0,#0x40
        0x0000212c:    1e40        @.      SUBS     r0,r0,#1
        0x0000212e:    46b1        .F      MOV      r9,r6
        0x00002130:    eb000180    ....    ADD      r1,r0,r0,LSL #2
        0x00002134:    eb0106c0    ....    ADD      r6,r1,r0,LSL #3
        0x00002138:    f04f0800    O...    MOV      r8,#0
        0x0000213c:    2701        .'      MOVS     r7,#1
        0x0000213e:    4828        (H      LDR      r0,[pc,#160] ; [0x21e0] = 0x3010
        0x00002140:    f8101008    ....    LDRB     r1,[r0,r8]
        0x00002144:    eb010009    ....    ADD      r0,r1,r9
        0x00002148:    8800        ..      LDRH     r0,[r0,#0]
        0x0000214a:    b177        w.      CBZ      r7,0x216a ; dir_find + 174
        0x0000214c:    f000fbec    ....    BL       ff_wtoupper ; 0x2928
        0x00002150:    4607        .F      MOV      r7,r0
        0x00002152:    2eff        ..      CMP      r6,#0xff
        0x00002154:    d21a        ..      BCS      0x218c ; dir_find + 208
        0x00002156:    f83a0016    :...    LDRH     r0,[r10,r6,LSL #1]
        0x0000215a:    1c76        v.      ADDS     r6,r6,#1
        0x0000215c:    f000fbe4    ....    BL       ff_wtoupper ; 0x2928
        0x00002160:    42b8        .B      CMP      r0,r7
        0x00002162:    d113        ..      BNE      0x218c ; dir_find + 208
        0x00002164:    e005        ..      B        0x2172 ; dir_find + 182
        0x00002166:    e016        ..      B        0x2196 ; dir_find + 218
        0x00002168:    e02c        ,.      B        0x21c4 ; dir_find + 264
        0x0000216a:    f5a0417f    ...A    SUB      r1,r0,#0xff00
        0x0000216e:    39ff        .9      SUBS     r1,r1,#0xff
        0x00002170:    d10c        ..      BNE      0x218c ; dir_find + 208
        0x00002172:    f1080801    ....    ADD      r8,r8,#1
        0x00002176:    f1b80f0d    ....    CMP      r8,#0xd
        0x0000217a:    d3e0        ..      BCC      0x213e ; dir_find + 130
        0x0000217c:    f8990000    ....    LDRB     r0,[r9,#0]
        0x00002180:    0640        @.      LSLS     r0,r0,#25
        0x00002182:    d506        ..      BPL      0x2192 ; dir_find + 214
        0x00002184:    b12f        /.      CBZ      r7,0x2192 ; dir_find + 214
        0x00002186:    f83a0016    :...    LDRH     r0,[r10,r6,LSL #1]
        0x0000218a:    b110        ..      CBZ      r0,0x2192 ; dir_find + 214
        0x0000218c:    25ff        .%      MOVS     r5,#0xff
        0x0000218e:    b2ed        ..      UXTB     r5,r5
        0x00002190:    e01b        ..      B        0x21ca ; dir_find + 270
        0x00002192:    1e6d        m.      SUBS     r5,r5,#1
        0x00002194:    e7fb        ..      B        0x218e ; dir_find + 210
        0x00002196:    4630        0F      MOV      r0,r6
        0x00002198:    f000fea4    ....    BL       sum_sfn ; 0x2ee4
        0x0000219c:    4558        XE      CMP      r0,r11
        0x0000219e:    d01b        ..      BEQ      0x21d8 ; dir_find + 284
        0x000021a0:    f64f70ff    O..p    MOV      r0,#0xffff
        0x000021a4:    8420         .      STRH     r0,[r4,#0x20]
        0x000021a6:    69a0        .i      LDR      r0,[r4,#0x18]
        0x000021a8:    25ff        .%      MOVS     r5,#0xff
        0x000021aa:    7ac1        .z      LDRB     r1,[r0,#0xb]
        0x000021ac:    07c9        ..      LSLS     r1,r1,#31
        0x000021ae:    d10c        ..      BNE      0x21ca ; dir_find + 270
        0x000021b0:    210b        .!      MOVS     r1,#0xb
        0x000021b2:    2200        ."      MOVS     r2,#0
        0x000021b4:    1e49        I.      SUBS     r1,r1,#1
        0x000021b6:    d307        ..      BCC      0x21c8 ; dir_find + 268
        0x000021b8:    f8162b01    ...+    LDRB     r2,[r6],#1
        0x000021bc:    f8103b01    ...;    LDRB     r3,[r0],#1
        0x000021c0:    1ad2        ..      SUBS     r2,r2,r3
        0x000021c2:    d0f7        ..      BEQ      0x21b4 ; dir_find + 248
        0x000021c4:    e001        ..      B        0x21ca ; dir_find + 270
        0x000021c6:    e008        ..      B        0x21da ; dir_find + 286
        0x000021c8:    b132        2.      CBZ      r2,0x21d8 ; dir_find + 284
        0x000021ca:    2100        .!      MOVS     r1,#0
        0x000021cc:    4620         F      MOV      r0,r4
        0x000021ce:    f000f809    ....    BL       dir_next ; 0x21e4
        0x000021d2:    0007        ..      MOVS     r7,r0
        0x000021d4:    f43faf7c    ?.|.    BEQ      0x20d0 ; dir_find + 20
        0x000021d8:    4638        8F      MOV      r0,r7
        0x000021da:    e8bd9ff0    ....    POP      {r4-r12,pc}
    $d
        0x000021de:    0000        ..      DCW    0
        0x000021e0:    00003010    .0..    DCD    12304
    $t
    i.dir_next
    dir_next
        0x000021e4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000021e8:    4604        .F      MOV      r4,r0
        0x000021ea:    88c0        ..      LDRH     r0,[r0,#6]
        0x000021ec:    460e        .F      MOV      r6,r1
        0x000021ee:    1c40        @.      ADDS     r0,r0,#1
        0x000021f0:    0407        ..      LSLS     r7,r0,#16
        0x000021f2:    0c3f        ?.      LSRS     r7,r7,#16
        0x000021f4:    d02d        -.      BEQ      0x2252 ; dir_next + 110
        0x000021f6:    6920         i      LDR      r0,[r4,#0x10]
        0x000021f8:    b358        X.      CBZ      r0,0x2252 ; dir_next + 110
        0x000021fa:    0739        9.      LSLS     r1,r7,#28
        0x000021fc:    d15d        ].      BNE      0x22ba ; dir_next + 214
        0x000021fe:    1c40        @.      ADDS     r0,r0,#1
        0x00002200:    6120         a      STR      r0,[r4,#0x10]
        0x00002202:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00002204:    6820         h      LDR      r0,[r4,#0]
        0x00002206:    b129        ).      CBZ      r1,0x2214 ; dir_next + 48
        0x00002208:    7882        .x      LDRB     r2,[r0,#2]
        0x0000220a:    1e52        R.      SUBS     r2,r2,#1
        0x0000220c:    ea121f17    ....    TST      r2,r7,LSR #4
        0x00002210:    d004        ..      BEQ      0x221c ; dir_next + 56
        0x00002212:    e052        R.      B        0x22ba ; dir_next + 214
        0x00002214:    8900        ..      LDRH     r0,[r0,#8]
        0x00002216:    42b8        .B      CMP      r0,r7
        0x00002218:    d91b        ..      BLS      0x2252 ; dir_next + 110
        0x0000221a:    e04e        N.      B        0x22ba ; dir_next + 214
        0x0000221c:    f000fc06    ....    BL       get_fat ; 0x2a2c
        0x00002220:    4605        .F      MOV      r5,r0
        0x00002222:    2801        .(      CMP      r0,#1
        0x00002224:    d91a        ..      BLS      0x225c ; dir_next + 120
        0x00002226:    1c68        h.      ADDS     r0,r5,#1
        0x00002228:    d032        2.      BEQ      0x2290 ; dir_next + 172
        0x0000222a:    6820         h      LDR      r0,[r4,#0]
        0x0000222c:    6981        .i      LDR      r1,[r0,#0x18]
        0x0000222e:    42a9        .B      CMP      r1,r5
        0x00002230:    d83d        =.      BHI      0x22ae ; dir_next + 202
        0x00002232:    b176        v.      CBZ      r6,0x2252 ; dir_next + 110
        0x00002234:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00002236:    f7fffe07    ....    BL       create_chain ; 0x1e48
        0x0000223a:    0005        ..      MOVS     r5,r0
        0x0000223c:    d00c        ..      BEQ      0x2258 ; dir_next + 116
        0x0000223e:    2d01        .-      CMP      r5,#1
        0x00002240:    d00c        ..      BEQ      0x225c ; dir_next + 120
        0x00002242:    1c68        h.      ADDS     r0,r5,#1
        0x00002244:    d024        $.      BEQ      0x2290 ; dir_next + 172
        0x00002246:    2100        .!      MOVS     r1,#0
        0x00002248:    6820         h      LDR      r0,[r4,#0]
        0x0000224a:    f000fd12    ....    BL       move_window ; 0x2c72
        0x0000224e:    b9f8        ..      CBNZ     r0,0x2290 ; dir_next + 172
        0x00002250:    e006        ..      B        0x2260 ; dir_next + 124
        0x00002252:    2004        .       MOVS     r0,#4
        0x00002254:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00002258:    2007        .       MOVS     r0,#7
        0x0000225a:    e7fb        ..      B        0x2254 ; dir_next + 112
        0x0000225c:    2002        .       MOVS     r0,#2
        0x0000225e:    e7f9        ..      B        0x2254 ; dir_next + 112
        0x00002260:    6820         h      LDR      r0,[r4,#0]
        0x00002262:    f44f7200    O..r    MOV      r2,#0x200
        0x00002266:    2100        .!      MOVS     r1,#0
        0x00002268:    3030        00      ADDS     r0,r0,#0x30
        0x0000226a:    f000fcfb    ....    BL       mem_set ; 0x2c64
        0x0000226e:    4629        )F      MOV      r1,r5
        0x00002270:    6820         h      LDR      r0,[r4,#0]
        0x00002272:    f7fffddd    ....    BL       clust2sect ; 0x1e30
        0x00002276:    6821        !h      LDR      r1,[r4,#0]
        0x00002278:    2600        .&      MOVS     r6,#0
        0x0000227a:    f04f0801    O...    MOV      r8,#1
        0x0000227e:    62c8        .b      STR      r0,[r1,#0x2c]
        0x00002280:    e00e        ..      B        0x22a0 ; dir_next + 188
        0x00002282:    f8808004    ....    STRB     r8,[r0,#4]
        0x00002286:    2100        .!      MOVS     r1,#0
        0x00002288:    6820         h      LDR      r0,[r4,#0]
        0x0000228a:    f000fcf2    ....    BL       move_window ; 0x2c72
        0x0000228e:    b108        ..      CBZ      r0,0x2294 ; dir_next + 176
        0x00002290:    2001        .       MOVS     r0,#1
        0x00002292:    e7df        ..      B        0x2254 ; dir_next + 112
        0x00002294:    6820         h      LDR      r0,[r4,#0]
        0x00002296:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x00002298:    1c49        I.      ADDS     r1,r1,#1
        0x0000229a:    1c76        v.      ADDS     r6,r6,#1
        0x0000229c:    b2f6        ..      UXTB     r6,r6
        0x0000229e:    62c1        .b      STR      r1,[r0,#0x2c]
        0x000022a0:    6820         h      LDR      r0,[r4,#0]
        0x000022a2:    7881        .x      LDRB     r1,[r0,#2]
        0x000022a4:    42b1        .B      CMP      r1,r6
        0x000022a6:    d8ec        ..      BHI      0x2282 ; dir_next + 158
        0x000022a8:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x000022aa:    1b89        ..      SUBS     r1,r1,r6
        0x000022ac:    62c1        .b      STR      r1,[r0,#0x2c]
        0x000022ae:    60e5        .`      STR      r5,[r4,#0xc]
        0x000022b0:    4629        )F      MOV      r1,r5
        0x000022b2:    6820         h      LDR      r0,[r4,#0]
        0x000022b4:    f7fffdbc    ....    BL       clust2sect ; 0x1e30
        0x000022b8:    6120         a      STR      r0,[r4,#0x10]
        0x000022ba:    80e7        ..      STRH     r7,[r4,#6]
        0x000022bc:    f007010f    ....    AND      r1,r7,#0xf
        0x000022c0:    2230        0"      MOVS     r2,#0x30
        0x000022c2:    6820         h      LDR      r0,[r4,#0]
        0x000022c4:    eb021141    ..A.    ADD      r1,r2,r1,LSL #5
        0x000022c8:    4408        .D      ADD      r0,r0,r1
        0x000022ca:    6160        `a      STR      r0,[r4,#0x14]
        0x000022cc:    2000        .       MOVS     r0,#0
        0x000022ce:    e7c1        ..      B        0x2254 ; dir_next + 112
    i.dir_register
    dir_register
        0x000022d0:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x000022d4:    4604        .F      MOV      r4,r0
        0x000022d6:    220c        ."      MOVS     r2,#0xc
        0x000022d8:    e9d47606    ...v    LDRD     r7,r6,[r4,#0x18]
        0x000022dc:    4639        9F      MOV      r1,r7
        0x000022de:    4668        hF      MOV      r0,sp
        0x000022e0:    f000fcb8    ....    BL       mem_cpy ; 0x2c54
        0x000022e4:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x000022e8:    07c0        ..      LSLS     r0,r0,#31
        0x000022ea:    d019        ..      BEQ      0x2320 ; dir_register + 80
        0x000022ec:    2000        .       MOVS     r0,#0
        0x000022ee:    72f8        .r      STRB     r0,[r7,#0xb]
        0x000022f0:    2501        .%      MOVS     r5,#1
        0x000022f2:    61e0        .a      STR      r0,[r4,#0x1c]
        0x000022f4:    462b        +F      MOV      r3,r5
        0x000022f6:    4632        2F      MOV      r2,r6
        0x000022f8:    4669        iF      MOV      r1,sp
        0x000022fa:    4638        8F      MOV      r0,r7
        0x000022fc:    f000fb62    ..b.    BL       gen_numname ; 0x29c4
        0x00002300:    4620         F      MOV      r0,r4
        0x00002302:    f7fffedb    ....    BL       dir_find ; 0x20bc
        0x00002306:    b918        ..      CBNZ     r0,0x2310 ; dir_register + 64
        0x00002308:    1c6d        m.      ADDS     r5,r5,#1
        0x0000230a:    b2ad        ..      UXTH     r5,r5
        0x0000230c:    2d64        d-      CMP      r5,#0x64
        0x0000230e:    d3f1        ..      BCC      0x22f4 ; dir_register + 36
        0x00002310:    2d64        d-      CMP      r5,#0x64
        0x00002312:    d00b        ..      BEQ      0x232c ; dir_register + 92
        0x00002314:    2804        .(      CMP      r0,#4
        0x00002316:    d10a        ..      BNE      0x232e ; dir_register + 94
        0x00002318:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x0000231c:    72f8        .r      STRB     r0,[r7,#0xb]
        0x0000231e:    61e6        .a      STR      r6,[r4,#0x1c]
        0x00002320:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x00002324:    0780        ..      LSLS     r0,r0,#30
        0x00002326:    d511        ..      BPL      0x234c ; dir_register + 124
        0x00002328:    2000        .       MOVS     r0,#0
        0x0000232a:    e005        ..      B        0x2338 ; dir_register + 104
        0x0000232c:    2007        .       MOVS     r0,#7
        0x0000232e:    b004        ..      ADD      sp,sp,#0x10
        0x00002330:    e8bd9ff0    ....    POP      {r4-r12,pc}
        0x00002334:    1c40        @.      ADDS     r0,r0,#1
        0x00002336:    b280        ..      UXTH     r0,r0
        0x00002338:    f8361010    6...    LDRH     r1,[r6,r0,LSL #1]
        0x0000233c:    2900        .)      CMP      r1,#0
        0x0000233e:    d1f9        ..      BNE      0x2334 ; dir_register + 100
        0x00002340:    210d        .!      MOVS     r1,#0xd
        0x00002342:    3019        .0      ADDS     r0,r0,#0x19
        0x00002344:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x00002348:    b287        ..      UXTH     r7,r0
        0x0000234a:    e000        ..      B        0x234e ; dir_register + 126
        0x0000234c:    2701        .'      MOVS     r7,#1
        0x0000234e:    2100        .!      MOVS     r1,#0
        0x00002350:    4620         F      MOV      r0,r4
        0x00002352:    f000f891    ....    BL       dir_sdi ; 0x2478
        0x00002356:    2800        .(      CMP      r0,#0
        0x00002358:    d1e9        ..      BNE      0x232e ; dir_register + 94
        0x0000235a:    2500        .%      MOVS     r5,#0
        0x0000235c:    46a8        .F      MOV      r8,r5
        0x0000235e:    6921        !i      LDR      r1,[r4,#0x10]
        0x00002360:    6820         h      LDR      r0,[r4,#0]
        0x00002362:    f000fc86    ....    BL       move_window ; 0x2c72
        0x00002366:    0006        ..      MOVS     r6,r0
        0x00002368:    d10b        ..      BNE      0x2382 ; dir_register + 178
        0x0000236a:    6960        `i      LDR      r0,[r4,#0x14]
        0x0000236c:    7800        .x      LDRB     r0,[r0,#0]
        0x0000236e:    28e5        .(      CMP      r0,#0xe5
        0x00002370:    d008        ..      BEQ      0x2384 ; dir_register + 180
        0x00002372:    b138        8.      CBZ      r0,0x2384 ; dir_register + 180
        0x00002374:    2500        .%      MOVS     r5,#0
        0x00002376:    2101        .!      MOVS     r1,#1
        0x00002378:    4620         F      MOV      r0,r4
        0x0000237a:    f7ffff33    ..3.    BL       dir_next ; 0x21e4
        0x0000237e:    0006        ..      MOVS     r6,r0
        0x00002380:    d0ed        ..      BEQ      0x235e ; dir_register + 142
        0x00002382:    e075        u.      B        0x2470 ; dir_register + 416
        0x00002384:    b90d        ..      CBNZ     r5,0x238a ; dir_register + 186
        0x00002386:    f8b48006    ....    LDRH     r8,[r4,#6]
        0x0000238a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000238c:    b2ad        ..      UXTH     r5,r5
        0x0000238e:    42bd        .B      CMP      r5,r7
        0x00002390:    d1f1        ..      BNE      0x2376 ; dir_register + 166
        0x00002392:    2f01        ./      CMP      r7,#1
        0x00002394:    d953        S.      BLS      0x243e ; dir_register + 366
        0x00002396:    4641        AF      MOV      r1,r8
        0x00002398:    4620         F      MOV      r0,r4
        0x0000239a:    f000f86d    ..m.    BL       dir_sdi ; 0x2478
        0x0000239e:    0006        ..      MOVS     r6,r0
        0x000023a0:    d166        f.      BNE      0x2470 ; dir_register + 416
        0x000023a2:    69a0        .i      LDR      r0,[r4,#0x18]
        0x000023a4:    f000fd9e    ....    BL       sum_sfn ; 0x2ee4
        0x000023a8:    1e7f        ..      SUBS     r7,r7,#1
        0x000023aa:    b2bd        ..      UXTH     r5,r7
        0x000023ac:    f64f7aff    O..z    MOV      r10,#0xffff
        0x000023b0:    9003        ..      STR      r0,[sp,#0xc]
        0x000023b2:    6921        !i      LDR      r1,[r4,#0x10]
        0x000023b4:    6820         h      LDR      r0,[r4,#0]
        0x000023b6:    f000fc5c    ..\.    BL       move_window ; 0x2c72
        0x000023ba:    0006        ..      MOVS     r6,r0
        0x000023bc:    d158        X.      BNE      0x2470 ; dir_register + 416
        0x000023be:    6961        ai      LDR      r1,[r4,#0x14]
        0x000023c0:    f8d4901c    ....    LDR      r9,[r4,#0x1c]
        0x000023c4:    9803        ..      LDR      r0,[sp,#0xc]
        0x000023c6:    7348        Hs      STRB     r0,[r1,#0xd]
        0x000023c8:    200f        .       MOVS     r0,#0xf
        0x000023ca:    72c8        .r      STRB     r0,[r1,#0xb]
        0x000023cc:    2000        .       MOVS     r0,#0
        0x000023ce:    7308        .s      STRB     r0,[r1,#0xc]
        0x000023d0:    7688        .v      STRB     r0,[r1,#0x1a]
        0x000023d2:    b2ee        ..      UXTB     r6,r5
        0x000023d4:    76c8        .v      STRB     r0,[r1,#0x1b]
        0x000023d6:    1e70        p.      SUBS     r0,r6,#1
        0x000023d8:    eb000280    ....    ADD      r2,r0,r0,LSL #2
        0x000023dc:    eb0203c0    ....    ADD      r3,r2,r0,LSL #3
        0x000023e0:    2200        ."      MOVS     r2,#0
        0x000023e2:    f8dfb090    ....    LDR      r11,[pc,#144] ; [0x2474] = 0x3010
        0x000023e6:    f1010801    ....    ADD      r8,r1,#1
        0x000023ea:    e001        ..      B        0x23f0 ; dir_register + 288
        0x000023ec:    4550        PE      CMP      r0,r10
        0x000023ee:    d002        ..      BEQ      0x23f6 ; dir_register + 294
        0x000023f0:    f8390013    9...    LDRH     r0,[r9,r3,LSL #1]
        0x000023f4:    1c5b        [.      ADDS     r3,r3,#1
        0x000023f6:    f81bc002    ....    LDRB     r12,[r11,r2]
        0x000023fa:    f801000c    ....    STRB     r0,[r1,r12]
        0x000023fe:    f81b7002    ...p    LDRB     r7,[r11,r2]
        0x00002402:    ea4f2c10    O..,    LSR      r12,r0,#8
        0x00002406:    f807c008    ....    STRB     r12,[r7,r8]
        0x0000240a:    b900        ..      CBNZ     r0,0x240e ; dir_register + 318
        0x0000240c:    4650        PF      MOV      r0,r10
        0x0000240e:    1c52        R.      ADDS     r2,r2,#1
        0x00002410:    2a0d        .*      CMP      r2,#0xd
        0x00002412:    d3eb        ..      BCC      0x23ec ; dir_register + 284
        0x00002414:    4550        PE      CMP      r0,r10
        0x00002416:    d002        ..      BEQ      0x241e ; dir_register + 334
        0x00002418:    f8390013    9...    LDRH     r0,[r9,r3,LSL #1]
        0x0000241c:    b908        ..      CBNZ     r0,0x2422 ; dir_register + 338
        0x0000241e:    f0460640    F.@.    ORR      r6,r6,#0x40
        0x00002422:    700e        .p      STRB     r6,[r1,#0]
        0x00002424:    6821        !h      LDR      r1,[r4,#0]
        0x00002426:    2001        .       MOVS     r0,#1
        0x00002428:    7108        .q      STRB     r0,[r1,#4]
        0x0000242a:    2100        .!      MOVS     r1,#0
        0x0000242c:    4620         F      MOV      r0,r4
        0x0000242e:    f7fffed9    ....    BL       dir_next ; 0x21e4
        0x00002432:    0006        ..      MOVS     r6,r0
        0x00002434:    d11c        ..      BNE      0x2470 ; dir_register + 416
        0x00002436:    1e6d        m.      SUBS     r5,r5,#1
        0x00002438:    042d        -.      LSLS     r5,r5,#16
        0x0000243a:    0c2d        -.      LSRS     r5,r5,#16
        0x0000243c:    d1b9        ..      BNE      0x23b2 ; dir_register + 226
        0x0000243e:    6921        !i      LDR      r1,[r4,#0x10]
        0x00002440:    6820         h      LDR      r0,[r4,#0]
        0x00002442:    f000fc16    ....    BL       move_window ; 0x2c72
        0x00002446:    0006        ..      MOVS     r6,r0
        0x00002448:    d112        ..      BNE      0x2470 ; dir_register + 416
        0x0000244a:    6965        ei      LDR      r5,[r4,#0x14]
        0x0000244c:    2220         "      MOVS     r2,#0x20
        0x0000244e:    2100        .!      MOVS     r1,#0
        0x00002450:    4628        (F      MOV      r0,r5
        0x00002452:    f000fc07    ....    BL       mem_set ; 0x2c64
        0x00002456:    220b        ."      MOVS     r2,#0xb
        0x00002458:    4628        (F      MOV      r0,r5
        0x0000245a:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0000245c:    f000fbfa    ....    BL       mem_cpy ; 0x2c54
        0x00002460:    69a0        .i      LDR      r0,[r4,#0x18]
        0x00002462:    7ac0        .z      LDRB     r0,[r0,#0xb]
        0x00002464:    f0000018    ....    AND      r0,r0,#0x18
        0x00002468:    7328        (s      STRB     r0,[r5,#0xc]
        0x0000246a:    6821        !h      LDR      r1,[r4,#0]
        0x0000246c:    2001        .       MOVS     r0,#1
        0x0000246e:    7108        .q      STRB     r0,[r1,#4]
        0x00002470:    4630        0F      MOV      r0,r6
        0x00002472:    e75c        \.      B        0x232e ; dir_register + 94
    $d
        0x00002474:    00003010    .0..    DCD    12304
    $t
    i.dir_sdi
    dir_sdi
        0x00002478:    b570        p.      PUSH     {r4-r6,lr}
        0x0000247a:    460d        .F      MOV      r5,r1
        0x0000247c:    80c1        ..      STRH     r1,[r0,#6]
        0x0000247e:    6881        .h      LDR      r1,[r0,#8]
        0x00002480:    4604        .F      MOV      r4,r0
        0x00002482:    2901        .)      CMP      r1,#1
        0x00002484:    d01e        ..      BEQ      0x24c4 ; dir_sdi + 76
        0x00002486:    6820         h      LDR      r0,[r4,#0]
        0x00002488:    6982        .i      LDR      r2,[r0,#0x18]
        0x0000248a:    428a        .B      CMP      r2,r1
        0x0000248c:    d91a        ..      BLS      0x24c4 ; dir_sdi + 76
        0x0000248e:    b921        !.      CBNZ     r1,0x249a ; dir_sdi + 34
        0x00002490:    7802        .x      LDRB     r2,[r0,#0]
        0x00002492:    2a03        .*      CMP      r2,#3
        0x00002494:    d104        ..      BNE      0x24a0 ; dir_sdi + 40
        0x00002496:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x00002498:    b111        ..      CBZ      r1,0x24a0 ; dir_sdi + 40
        0x0000249a:    7880        .x      LDRB     r0,[r0,#2]
        0x0000249c:    0106        ..      LSLS     r6,r0,#4
        0x0000249e:    e017        ..      B        0x24d0 ; dir_sdi + 88
        0x000024a0:    60e1        .`      STR      r1,[r4,#0xc]
        0x000024a2:    8901        ..      LDRH     r1,[r0,#8]
        0x000024a4:    42a9        .B      CMP      r1,r5
        0x000024a6:    d90d        ..      BLS      0x24c4 ; dir_sdi + 76
        0x000024a8:    6a40        @j      LDR      r0,[r0,#0x24]
        0x000024aa:    e017        ..      B        0x24dc ; dir_sdi + 100
        0x000024ac:    6820         h      LDR      r0,[r4,#0]
        0x000024ae:    f000fabd    ....    BL       get_fat ; 0x2a2c
        0x000024b2:    4601        .F      MOV      r1,r0
        0x000024b4:    1c40        @.      ADDS     r0,r0,#1
        0x000024b6:    d007        ..      BEQ      0x24c8 ; dir_sdi + 80
        0x000024b8:    2902        .)      CMP      r1,#2
        0x000024ba:    d303        ..      BCC      0x24c4 ; dir_sdi + 76
        0x000024bc:    6820         h      LDR      r0,[r4,#0]
        0x000024be:    6980        .i      LDR      r0,[r0,#0x18]
        0x000024c0:    4288        .B      CMP      r0,r1
        0x000024c2:    d803        ..      BHI      0x24cc ; dir_sdi + 84
        0x000024c4:    2002        .       MOVS     r0,#2
        0x000024c6:    bd70        p.      POP      {r4-r6,pc}
        0x000024c8:    2001        .       MOVS     r0,#1
        0x000024ca:    bd70        p.      POP      {r4-r6,pc}
        0x000024cc:    1ba8        ..      SUBS     r0,r5,r6
        0x000024ce:    b285        ..      UXTH     r5,r0
        0x000024d0:    42b5        .B      CMP      r5,r6
        0x000024d2:    d2eb        ..      BCS      0x24ac ; dir_sdi + 52
        0x000024d4:    60e1        .`      STR      r1,[r4,#0xc]
        0x000024d6:    6820         h      LDR      r0,[r4,#0]
        0x000024d8:    f7fffcaa    ....    BL       clust2sect ; 0x1e30
        0x000024dc:    eb001015    ....    ADD      r0,r0,r5,LSR #4
        0x000024e0:    6120         a      STR      r0,[r4,#0x10]
        0x000024e2:    f005010f    ....    AND      r1,r5,#0xf
        0x000024e6:    2230        0"      MOVS     r2,#0x30
        0x000024e8:    6820         h      LDR      r0,[r4,#0]
        0x000024ea:    eb021141    ..A.    ADD      r1,r2,r1,LSL #5
        0x000024ee:    4408        .D      ADD      r0,r0,r1
        0x000024f0:    6160        `a      STR      r0,[r4,#0x14]
        0x000024f2:    2000        .       MOVS     r0,#0
        0x000024f4:    bd70        p.      POP      {r4-r6,pc}
    i.disk_initialize
    disk_initialize
        0x000024f6:    b510        ..      PUSH     {r4,lr}
        0x000024f8:    b130        0.      CBZ      r0,0x2508 ; disk_initialize + 18
        0x000024fa:    2801        .(      CMP      r0,#1
        0x000024fc:    d00a        ..      BEQ      0x2514 ; disk_initialize + 30
        0x000024fe:    2802        .(      CMP      r0,#2
        0x00002500:    d008        ..      BEQ      0x2514 ; disk_initialize + 30
        0x00002502:    2803        .(      CMP      r0,#3
        0x00002504:    d104        ..      BNE      0x2510 ; disk_initialize + 26
        0x00002506:    e005        ..      B        0x2514 ; disk_initialize + 30
        0x00002508:    f7fefe94    ....    BL       SD_Initialize ; 0x1234
        0x0000250c:    2800        .(      CMP      r0,#0
        0x0000250e:    d000        ..      BEQ      0x2512 ; disk_initialize + 28
        0x00002510:    2001        .       MOVS     r0,#1
        0x00002512:    bd10        ..      POP      {r4,pc}
        0x00002514:    2000        .       MOVS     r0,#0
        0x00002516:    bd10        ..      POP      {r4,pc}
    i.disk_ioctl
    disk_ioctl
        0x00002518:    b159        Y.      CBZ      r1,0x2532 ; disk_ioctl + 26
        0x0000251a:    2901        .)      CMP      r1,#1
        0x0000251c:    d003        ..      BEQ      0x2526 ; disk_ioctl + 14
        0x0000251e:    2903        .)      CMP      r1,#3
        0x00002520:    d004        ..      BEQ      0x252c ; disk_ioctl + 20
        0x00002522:    2004        .       MOVS     r0,#4
        0x00002524:    4770        pG      BX       lr
        0x00002526:    4804        .H      LDR      r0,[pc,#16] ; [0x2538] = 0x863d0d47
        0x00002528:    6010        .`      STR      r0,[r2,#0]
        0x0000252a:    e002        ..      B        0x2532 ; disk_ioctl + 26
        0x0000252c:    f44f7000    O..p    MOV      r0,#0x200
        0x00002530:    8010        ..      STRH     r0,[r2,#0]
        0x00002532:    2000        .       MOVS     r0,#0
        0x00002534:    4770        pG      BX       lr
    $d
        0x00002536:    0000        ..      DCW    0
        0x00002538:    863d0d47    G.=.    DCD    2252148039
    $t
    i.disk_read
    disk_read
        0x0000253c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000253e:    4614        .F      MOV      r4,r2
        0x00002540:    460d        .F      MOV      r5,r1
        0x00002542:    b10b        ..      CBZ      r3,0x2548 ; disk_read + 12
        0x00002544:    b948        H.      CBNZ     r0,0x255a ; disk_read + 30
        0x00002546:    e001        ..      B        0x254c ; disk_read + 16
        0x00002548:    2004        .       MOVS     r0,#4
        0x0000254a:    bd70        p.      POP      {r4-r6,pc}
        0x0000254c:    461a        .F      MOV      r2,r3
        0x0000254e:    4621        !F      MOV      r1,r4
        0x00002550:    4628        (F      MOV      r0,r5
        0x00002552:    f7fefd8f    ....    BL       SDReadDisk ; 0x1074
        0x00002556:    2800        .(      CMP      r0,#0
        0x00002558:    d0f7        ..      BEQ      0x254a ; disk_read + 14
        0x0000255a:    2001        .       MOVS     r0,#1
        0x0000255c:    bd70        p.      POP      {r4-r6,pc}
    i.disk_status
    disk_status
        0x0000255e:    2800        .(      CMP      r0,#0
        0x00002560:    d004        ..      BEQ      0x256c ; disk_status + 14
        0x00002562:    2801        .(      CMP      r0,#1
        0x00002564:    d003        ..      BEQ      0x256e ; disk_status + 16
        0x00002566:    2802        .(      CMP      r0,#2
        0x00002568:    d001        ..      BEQ      0x256e ; disk_status + 16
        0x0000256a:    2001        .       MOVS     r0,#1
        0x0000256c:    4770        pG      BX       lr
        0x0000256e:    2000        .       MOVS     r0,#0
        0x00002570:    4770        pG      BX       lr
    i.disk_write
    disk_write
        0x00002572:    b570        p.      PUSH     {r4-r6,lr}
        0x00002574:    4614        .F      MOV      r4,r2
        0x00002576:    460d        .F      MOV      r5,r1
        0x00002578:    b10b        ..      CBZ      r3,0x257e ; disk_write + 12
        0x0000257a:    b948        H.      CBNZ     r0,0x2590 ; disk_write + 30
        0x0000257c:    e001        ..      B        0x2582 ; disk_write + 16
        0x0000257e:    2004        .       MOVS     r0,#4
        0x00002580:    bd70        p.      POP      {r4-r6,pc}
        0x00002582:    461a        .F      MOV      r2,r3
        0x00002584:    4621        !F      MOV      r1,r4
        0x00002586:    4628        (F      MOV      r0,r5
        0x00002588:    f7fefdb4    ....    BL       SDWriteDisk ; 0x10f4
        0x0000258c:    2800        .(      CMP      r0,#0
        0x0000258e:    d0f7        ..      BEQ      0x2580 ; disk_write + 14
        0x00002590:    2001        .       MOVS     r0,#1
        0x00002592:    bd70        p.      POP      {r4-r6,pc}
    i.f_close
    f_close
        0x00002594:    b510        ..      PUSH     {r4,lr}
        0x00002596:    4604        .F      MOV      r4,r0
        0x00002598:    f000f958    ..X.    BL       f_sync ; 0x284c
        0x0000259c:    2800        .(      CMP      r0,#0
        0x0000259e:    d101        ..      BNE      0x25a4 ; f_close + 16
        0x000025a0:    2100        .!      MOVS     r1,#0
        0x000025a2:    6021        !`      STR      r1,[r4,#0]
        0x000025a4:    bd10        ..      POP      {r4,pc}
        0x000025a6:    0000        ..      MOVS     r0,r0
    i.f_mount
    f_mount
        0x000025a8:    b108        ..      CBZ      r0,0x25ae ; f_mount + 6
        0x000025aa:    200b        .       MOVS     r0,#0xb
        0x000025ac:    4770        pG      BX       lr
        0x000025ae:    4b05        .K      LDR      r3,[pc,#20] ; [0x25c4] = 0x20000018
        0x000025b0:    2200        ."      MOVS     r2,#0
        0x000025b2:    6818        .h      LDR      r0,[r3,#0]
        0x000025b4:    b100        ..      CBZ      r0,0x25b8 ; f_mount + 16
        0x000025b6:    7002        .p      STRB     r2,[r0,#0]
        0x000025b8:    b101        ..      CBZ      r1,0x25bc ; f_mount + 20
        0x000025ba:    700a        .p      STRB     r2,[r1,#0]
        0x000025bc:    2000        .       MOVS     r0,#0
        0x000025be:    6019        .`      STR      r1,[r3,#0]
        0x000025c0:    4770        pG      BX       lr
    $d
        0x000025c2:    0000        ..      DCW    0
        0x000025c4:    20000018    ...     DCD    536870936
    $t
    i.f_open
    f_open
        0x000025c8:    e92d47f7    -..G    PUSH     {r0-r2,r4-r10,lr}
        0x000025cc:    b08d        ..      SUB      sp,sp,#0x34
        0x000025ce:    f04f0900    O...    MOV      r9,#0
        0x000025d2:    4607        .F      MOV      r7,r0
        0x000025d4:    f002061f    ....    AND      r6,r2,#0x1f
        0x000025d8:    f8c09000    ....    STR      r9,[r0,#0]
        0x000025dc:    f0260201    &...    BIC      r2,r6,#1
        0x000025e0:    4669        iF      MOV      r1,sp
        0x000025e2:    a80e        ..      ADD      r0,sp,#0x38
        0x000025e4:    f7fffb1e    ....    BL       chk_mounted ; 0x1c24
        0x000025e8:    0005        ..      MOVS     r5,r0
        0x000025ea:    a809        ..      ADD      r0,sp,#0x24
        0x000025ec:    9006        ..      STR      r0,[sp,#0x18]
        0x000025ee:    4845        EH      LDR      r0,[pc,#276] ; [0x2704] = 0x20001928
        0x000025f0:    9007        ..      STR      r0,[sp,#0x1c]
        0x000025f2:    d104        ..      BNE      0x25fe ; f_open + 54
        0x000025f4:    4668        hF      MOV      r0,sp
        0x000025f6:    990e        ..      LDR      r1,[sp,#0x38]
        0x000025f8:    f000f9a8    ....    BL       follow_path ; 0x294c
        0x000025fc:    4605        .F      MOV      r5,r0
        0x000025fe:    9c05        ..      LDR      r4,[sp,#0x14]
        0x00002600:    b90d        ..      CBNZ     r5,0x2606 ; f_open + 62
        0x00002602:    b904        ..      CBNZ     r4,0x2606 ; f_open + 62
        0x00002604:    2506        .%      MOVS     r5,#6
        0x00002606:    f0160f1c    ....    TST      r6,#0x1c
        0x0000260a:    d04e        N.      BEQ      0x26aa ; f_open + 226
        0x0000260c:    b155        U.      CBZ      r5,0x2624 ; f_open + 92
        0x0000260e:    2d04        .-      CMP      r5,#4
        0x00002610:    d103        ..      BNE      0x261a ; f_open + 82
        0x00002612:    4668        hF      MOV      r0,sp
        0x00002614:    f7fffe5c    ..\.    BL       dir_register ; 0x22d0
        0x00002618:    4605        .F      MOV      r5,r0
        0x0000261a:    9c05        ..      LDR      r4,[sp,#0x14]
        0x0000261c:    f0460608    F...    ORR      r6,r6,#8
        0x00002620:    b145        E.      CBZ      r5,0x2634 ; f_open + 108
        0x00002622:    e06a        j.      B        0x26fa ; f_open + 306
        0x00002624:    7ae0        .z      LDRB     r0,[r4,#0xb]
        0x00002626:    f0100f11    ....    TST      r0,#0x11
        0x0000262a:    d148        H.      BNE      0x26be ; f_open + 246
        0x0000262c:    0770        p.      LSLS     r0,r6,#29
        0x0000262e:    d501        ..      BPL      0x2634 ; f_open + 108
        0x00002630:    2508        .%      MOVS     r5,#8
        0x00002632:    e062        b.      B        0x26fa ; f_open + 306
        0x00002634:    0730        0.      LSLS     r0,r6,#28
        0x00002636:    d548        H.      BPL      0x26ca ; f_open + 258
        0x00002638:    f000fa54    ..T.    BL       get_fattime ; 0x2ae4
        0x0000263c:    73a0        .s      STRB     r0,[r4,#0xe]
        0x0000263e:    0a01        ..      LSRS     r1,r0,#8
        0x00002640:    73e1        .s      STRB     r1,[r4,#0xf]
        0x00002642:    0c01        ..      LSRS     r1,r0,#16
        0x00002644:    7421        !t      STRB     r1,[r4,#0x10]
        0x00002646:    0e00        ..      LSRS     r0,r0,#24
        0x00002648:    7460        `t      STRB     r0,[r4,#0x11]
        0x0000264a:    f884900b    ....    STRB     r9,[r4,#0xb]
        0x0000264e:    f884901c    ....    STRB     r9,[r4,#0x1c]
        0x00002652:    f884901d    ....    STRB     r9,[r4,#0x1d]
        0x00002656:    f884901e    ....    STRB     r9,[r4,#0x1e]
        0x0000265a:    f884901f    ....    STRB     r9,[r4,#0x1f]
        0x0000265e:    8aa2        ..      LDRH     r2,[r4,#0x14]
        0x00002660:    8b61        a.      LDRH     r1,[r4,#0x1a]
        0x00002662:    f884901a    ....    STRB     r9,[r4,#0x1a]
        0x00002666:    f884901b    ....    STRB     r9,[r4,#0x1b]
        0x0000266a:    f362411f    b..A    BFI      r1,r2,#16,#16
        0x0000266e:    f8849014    ....    STRB     r9,[r4,#0x14]
        0x00002672:    ea5f0801    _...    MOVS     r8,r1
        0x00002676:    f8849015    ....    STRB     r9,[r4,#0x15]
        0x0000267a:    9900        ..      LDR      r1,[sp,#0]
        0x0000267c:    f04f0001    O...    MOV      r0,#1
        0x00002680:    7108        .q      STRB     r0,[r1,#4]
        0x00002682:    4641        AF      MOV      r1,r8
        0x00002684:    d01f        ..      BEQ      0x26c6 ; f_open + 254
        0x00002686:    9800        ..      LDR      r0,[sp,#0]
        0x00002688:    f8d0a02c    ..,.    LDR      r10,[r0,#0x2c]
        0x0000268c:    f000fba2    ....    BL       remove_chain ; 0x2dd4
        0x00002690:    0005        ..      MOVS     r5,r0
        0x00002692:    d132        2.      BNE      0x26fa ; f_open + 306
        0x00002694:    9900        ..      LDR      r1,[sp,#0]
        0x00002696:    f1a80001    ....    SUB      r0,r8,#1
        0x0000269a:    60c8        .`      STR      r0,[r1,#0xc]
        0x0000269c:    4651        QF      MOV      r1,r10
        0x0000269e:    9800        ..      LDR      r0,[sp,#0]
        0x000026a0:    f000fae7    ....    BL       move_window ; 0x2c72
        0x000026a4:    0005        ..      MOVS     r5,r0
        0x000026a6:    d00c        ..      BEQ      0x26c2 ; f_open + 250
        0x000026a8:    e027        '.      B        0x26fa ; f_open + 306
        0x000026aa:    bb35        5.      CBNZ     r5,0x26fa ; f_open + 306
        0x000026ac:    7ae0        .z      LDRB     r0,[r4,#0xb]
        0x000026ae:    06c1        ..      LSLS     r1,r0,#27
        0x000026b0:    d501        ..      BPL      0x26b6 ; f_open + 238
        0x000026b2:    2504        .%      MOVS     r5,#4
        0x000026b4:    e021        !.      B        0x26fa ; f_open + 306
        0x000026b6:    07b1        ..      LSLS     r1,r6,#30
        0x000026b8:    d503        ..      BPL      0x26c2 ; f_open + 250
        0x000026ba:    07c0        ..      LSLS     r0,r0,#31
        0x000026bc:    d001        ..      BEQ      0x26c2 ; f_open + 250
        0x000026be:    2507        .%      MOVS     r5,#7
        0x000026c0:    e01b        ..      B        0x26fa ; f_open + 306
        0x000026c2:    0730        0.      LSLS     r0,r6,#28
        0x000026c4:    d501        ..      BPL      0x26ca ; f_open + 258
        0x000026c6:    f0460620    F. .    ORR      r6,r6,#0x20
        0x000026ca:    9800        ..      LDR      r0,[sp,#0]
        0x000026cc:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x000026ce:    e9c70407    ....    STRD     r0,r4,[r7,#0x1c]
        0x000026d2:    71be        .q      STRB     r6,[r7,#6]
        0x000026d4:    8aa1        ..      LDRH     r1,[r4,#0x14]
        0x000026d6:    8b60        `.      LDRH     r0,[r4,#0x1a]
        0x000026d8:    f361401f    a..@    BFI      r0,r1,#16,#16
        0x000026dc:    6138        8a      STR      r0,[r7,#0x10]
        0x000026de:    7f20         .      LDRB     r0,[r4,#0x1c]
        0x000026e0:    f8d4101d    ....    LDR      r1,[r4,#0x1d]
        0x000026e4:    ea402001    @..     ORR      r0,r0,r1,LSL #8
        0x000026e8:    e9c79002    ....    STRD     r9,r0,[r7,#8]
        0x000026ec:    f8c79018    ....    STR      r9,[r7,#0x18]
        0x000026f0:    9800        ..      LDR      r0,[sp,#0]
        0x000026f2:    6038        8`      STR      r0,[r7,#0]
        0x000026f4:    9800        ..      LDR      r0,[sp,#0]
        0x000026f6:    88c0        ..      LDRH     r0,[r0,#6]
        0x000026f8:    80b8        ..      STRH     r0,[r7,#4]
        0x000026fa:    b010        ..      ADD      sp,sp,#0x40
        0x000026fc:    4628        (F      MOV      r0,r5
        0x000026fe:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x00002702:    0000        ..      DCW    0
        0x00002704:    20001928    (..     DCD    536877352
    $t
    i.f_read
    f_read
        0x00002708:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x0000270c:    4689        .F      MOV      r9,r1
        0x0000270e:    2100        .!      MOVS     r1,#0
        0x00002710:    6019        .`      STR      r1,[r3,#0]
        0x00002712:    4604        .F      MOV      r4,r0
        0x00002714:    8881        ..      LDRH     r1,[r0,#4]
        0x00002716:    469a        .F      MOV      r10,r3
        0x00002718:    4616        .F      MOV      r6,r2
        0x0000271a:    6800        .h      LDR      r0,[r0,#0]
        0x0000271c:    f000fc60    ..`.    BL       validate ; 0x2fe0
        0x00002720:    2800        .(      CMP      r0,#0
        0x00002722:    d103        ..      BNE      0x272c ; f_read + 36
        0x00002724:    79a0        .y      LDRB     r0,[r4,#6]
        0x00002726:    0601        ..      LSLS     r1,r0,#24
        0x00002728:    d502        ..      BPL      0x2730 ; f_read + 40
        0x0000272a:    2002        .       MOVS     r0,#2
        0x0000272c:    e8bd9ff0    ....    POP      {r4-r12,pc}
        0x00002730:    07c0        ..      LSLS     r0,r0,#31
        0x00002732:    d008        ..      BEQ      0x2746 ; f_read + 62
        0x00002734:    e9d41002    ....    LDRD     r1,r0,[r4,#8]
        0x00002738:    1a40        @.      SUBS     r0,r0,r1
        0x0000273a:    f1040b24    ..$.    ADD      r11,r4,#0x24
        0x0000273e:    4286        .B      CMP      r6,r0
        0x00002740:    d900        ..      BLS      0x2744 ; f_read + 60
        0x00002742:    4606        .F      MOV      r6,r0
        0x00002744:    e07e        ~.      B        0x2844 ; f_read + 316
        0x00002746:    2007        .       MOVS     r0,#7
        0x00002748:    e7f0        ..      B        0x272c ; f_read + 36
        0x0000274a:    68a0        .h      LDR      r0,[r4,#8]
        0x0000274c:    05c1        ..      LSLS     r1,r0,#23
        0x0000274e:    d161        a.      BNE      0x2814 ; f_read + 268
        0x00002750:    6822        "h      LDR      r2,[r4,#0]
        0x00002752:    7891        .x      LDRB     r1,[r2,#2]
        0x00002754:    1e49        I.      SUBS     r1,r1,#1
        0x00002756:    ea012150    ..P!    AND      r1,r1,r0,LSR #9
        0x0000275a:    f01107ff    ....    ANDS     r7,r1,#0xff
        0x0000275e:    d109        ..      BNE      0x2774 ; f_read + 108
        0x00002760:    b1f8        ..      CBZ      r0,0x27a2 ; f_read + 154
        0x00002762:    4610        .F      MOV      r0,r2
        0x00002764:    6961        ai      LDR      r1,[r4,#0x14]
        0x00002766:    f000f961    ..a.    BL       get_fat ; 0x2a2c
        0x0000276a:    2802        .(      CMP      r0,#2
        0x0000276c:    d31b        ..      BCC      0x27a6 ; f_read + 158
        0x0000276e:    1c41        A.      ADDS     r1,r0,#1
        0x00002770:    d048        H.      BEQ      0x2804 ; f_read + 252
        0x00002772:    6160        `a      STR      r0,[r4,#0x14]
        0x00002774:    6961        ai      LDR      r1,[r4,#0x14]
        0x00002776:    6820         h      LDR      r0,[r4,#0]
        0x00002778:    f7fffb5a    ..Z.    BL       clust2sect ; 0x1e30
        0x0000277c:    b198        ..      CBZ      r0,0x27a6 ; f_read + 158
        0x0000277e:    eb000807    ....    ADD      r8,r0,r7
        0x00002782:    0a75        u.      LSRS     r5,r6,#9
        0x00002784:    d025        %.      BEQ      0x27d2 ; f_read + 202
        0x00002786:    6820         h      LDR      r0,[r4,#0]
        0x00002788:    197a        z.      ADDS     r2,r7,r5
        0x0000278a:    7881        .x      LDRB     r1,[r0,#2]
        0x0000278c:    428a        .B      CMP      r2,r1
        0x0000278e:    d900        ..      BLS      0x2792 ; f_read + 138
        0x00002790:    1bcd        ..      SUBS     r5,r1,r7
        0x00002792:    b2eb        ..      UXTB     r3,r5
        0x00002794:    7840        @x      LDRB     r0,[r0,#1]
        0x00002796:    4642        BF      MOV      r2,r8
        0x00002798:    4649        IF      MOV      r1,r9
        0x0000279a:    f7fffecf    ....    BL       disk_read ; 0x253c
        0x0000279e:    bb88        ..      CBNZ     r0,0x2804 ; f_read + 252
        0x000027a0:    e006        ..      B        0x27b0 ; f_read + 168
        0x000027a2:    6920         i      LDR      r0,[r4,#0x10]
        0x000027a4:    e7e1        ..      B        0x276a ; f_read + 98
        0x000027a6:    79a0        .y      LDRB     r0,[r4,#6]
        0x000027a8:    f0400080    @...    ORR      r0,r0,#0x80
        0x000027ac:    71a0        .q      STRB     r0,[r4,#6]
        0x000027ae:    e7bc        ..      B        0x272a ; f_read + 34
        0x000027b0:    79a0        .y      LDRB     r0,[r4,#6]
        0x000027b2:    0640        @.      LSLS     r0,r0,#25
        0x000027b4:    d50b        ..      BPL      0x27ce ; f_read + 198
        0x000027b6:    69a1        .i      LDR      r1,[r4,#0x18]
        0x000027b8:    eba10008    ....    SUB      r0,r1,r8
        0x000027bc:    42a8        .B      CMP      r0,r5
        0x000027be:    d206        ..      BCS      0x27ce ; f_read + 198
        0x000027c0:    eb092040    ..@     ADD      r0,r9,r0,LSL #9
        0x000027c4:    f44f7200    O..r    MOV      r2,#0x200
        0x000027c8:    4659        YF      MOV      r1,r11
        0x000027ca:    f000fa43    ..C.    BL       mem_cpy ; 0x2c54
        0x000027ce:    026d        m.      LSLS     r5,r5,#9
        0x000027d0:    e02e        ..      B        0x2830 ; f_read + 296
        0x000027d2:    69a2        .i      LDR      r2,[r4,#0x18]
        0x000027d4:    4542        BE      CMP      r2,r8
        0x000027d6:    d01b        ..      BEQ      0x2810 ; f_read + 264
        0x000027d8:    79a0        .y      LDRB     r0,[r4,#6]
        0x000027da:    0640        @.      LSLS     r0,r0,#25
        0x000027dc:    d50a        ..      BPL      0x27f4 ; f_read + 236
        0x000027de:    6820         h      LDR      r0,[r4,#0]
        0x000027e0:    2301        .#      MOVS     r3,#1
        0x000027e2:    4659        YF      MOV      r1,r11
        0x000027e4:    7840        @x      LDRB     r0,[r0,#1]
        0x000027e6:    f7fffec4    ....    BL       disk_write ; 0x2572
        0x000027ea:    b958        X.      CBNZ     r0,0x2804 ; f_read + 252
        0x000027ec:    79a0        .y      LDRB     r0,[r4,#6]
        0x000027ee:    f0200040     .@.    BIC      r0,r0,#0x40
        0x000027f2:    71a0        .q      STRB     r0,[r4,#6]
        0x000027f4:    6820         h      LDR      r0,[r4,#0]
        0x000027f6:    2301        .#      MOVS     r3,#1
        0x000027f8:    4642        BF      MOV      r2,r8
        0x000027fa:    7840        @x      LDRB     r0,[r0,#1]
        0x000027fc:    4659        YF      MOV      r1,r11
        0x000027fe:    f7fffe9d    ....    BL       disk_read ; 0x253c
        0x00002802:    b128        (.      CBZ      r0,0x2810 ; f_read + 264
        0x00002804:    79a0        .y      LDRB     r0,[r4,#6]
        0x00002806:    f0400080    @...    ORR      r0,r0,#0x80
        0x0000280a:    71a0        .q      STRB     r0,[r4,#6]
        0x0000280c:    2001        .       MOVS     r0,#1
        0x0000280e:    e78d        ..      B        0x272c ; f_read + 36
        0x00002810:    f8c48018    ....    STR      r8,[r4,#0x18]
        0x00002814:    8920         .      LDRH     r0,[r4,#8]
        0x00002816:    f3c00008    ....    UBFX     r0,r0,#0,#9
        0x0000281a:    f5c07500    ...u    RSB      r5,r0,#0x200
        0x0000281e:    42b5        .B      CMP      r5,r6
        0x00002820:    d900        ..      BLS      0x2824 ; f_read + 284
        0x00002822:    4635        5F      MOV      r5,r6
        0x00002824:    1901        ..      ADDS     r1,r0,r4
        0x00002826:    462a        *F      MOV      r2,r5
        0x00002828:    4648        HF      MOV      r0,r9
        0x0000282a:    3124        $1      ADDS     r1,r1,#0x24
        0x0000282c:    f000fa12    ....    BL       mem_cpy ; 0x2c54
        0x00002830:    68a0        .h      LDR      r0,[r4,#8]
        0x00002832:    44a9        .D      ADD      r9,r9,r5
        0x00002834:    4428        (D      ADD      r0,r0,r5
        0x00002836:    60a0        .`      STR      r0,[r4,#8]
        0x00002838:    f8da0000    ....    LDR      r0,[r10,#0]
        0x0000283c:    1941        A.      ADDS     r1,r0,r5
        0x0000283e:    1b76        v.      SUBS     r6,r6,r5
        0x00002840:    f8ca1000    ....    STR      r1,[r10,#0]
        0x00002844:    2e00        ..      CMP      r6,#0
        0x00002846:    d180        ..      BNE      0x274a ; f_read + 66
        0x00002848:    2000        .       MOVS     r0,#0
        0x0000284a:    e76f        o.      B        0x272c ; f_read + 36
    i.f_sync
    f_sync
        0x0000284c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000284e:    4604        .F      MOV      r4,r0
        0x00002850:    8881        ..      LDRH     r1,[r0,#4]
        0x00002852:    6800        .h      LDR      r0,[r0,#0]
        0x00002854:    f000fbc4    ....    BL       validate ; 0x2fe0
        0x00002858:    2800        .(      CMP      r0,#0
        0x0000285a:    d10e        ..      BNE      0x287a ; f_sync + 46
        0x0000285c:    79a1        .y      LDRB     r1,[r4,#6]
        0x0000285e:    068a        ..      LSLS     r2,r1,#26
        0x00002860:    d50b        ..      BPL      0x287a ; f_sync + 46
        0x00002862:    0648        H.      LSLS     r0,r1,#25
        0x00002864:    d50e        ..      BPL      0x2884 ; f_sync + 56
        0x00002866:    6820         h      LDR      r0,[r4,#0]
        0x00002868:    2301        .#      MOVS     r3,#1
        0x0000286a:    f1040124    ..$.    ADD      r1,r4,#0x24
        0x0000286e:    7840        @x      LDRB     r0,[r0,#1]
        0x00002870:    69a2        .i      LDR      r2,[r4,#0x18]
        0x00002872:    f7fffe7e    ..~.    BL       disk_write ; 0x2572
        0x00002876:    b108        ..      CBZ      r0,0x287c ; f_sync + 48
        0x00002878:    2001        .       MOVS     r0,#1
        0x0000287a:    bd70        p.      POP      {r4-r6,pc}
        0x0000287c:    79a0        .y      LDRB     r0,[r4,#6]
        0x0000287e:    f0200040     .@.    BIC      r0,r0,#0x40
        0x00002882:    71a0        .q      STRB     r0,[r4,#6]
        0x00002884:    69e1        .i      LDR      r1,[r4,#0x1c]
        0x00002886:    6820         h      LDR      r0,[r4,#0]
        0x00002888:    f000f9f3    ....    BL       move_window ; 0x2c72
        0x0000288c:    2800        .(      CMP      r0,#0
        0x0000288e:    d1f4        ..      BNE      0x287a ; f_sync + 46
        0x00002890:    6a25        %j      LDR      r5,[r4,#0x20]
        0x00002892:    7ae8        .z      LDRB     r0,[r5,#0xb]
        0x00002894:    f0400020    @. .    ORR      r0,r0,#0x20
        0x00002898:    72e8        .r      STRB     r0,[r5,#0xb]
        0x0000289a:    7b20         {      LDRB     r0,[r4,#0xc]
        0x0000289c:    7728        (w      STRB     r0,[r5,#0x1c]
        0x0000289e:    89a0        ..      LDRH     r0,[r4,#0xc]
        0x000028a0:    0a00        ..      LSRS     r0,r0,#8
        0x000028a2:    7768        hw      STRB     r0,[r5,#0x1d]
        0x000028a4:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000028a6:    0c00        ..      LSRS     r0,r0,#16
        0x000028a8:    77a8        .w      STRB     r0,[r5,#0x1e]
        0x000028aa:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000028ac:    0e00        ..      LSRS     r0,r0,#24
        0x000028ae:    77e8        .w      STRB     r0,[r5,#0x1f]
        0x000028b0:    7c20         |      LDRB     r0,[r4,#0x10]
        0x000028b2:    76a8        .v      STRB     r0,[r5,#0x1a]
        0x000028b4:    8a20         .      LDRH     r0,[r4,#0x10]
        0x000028b6:    0a00        ..      LSRS     r0,r0,#8
        0x000028b8:    76e8        .v      STRB     r0,[r5,#0x1b]
        0x000028ba:    6920         i      LDR      r0,[r4,#0x10]
        0x000028bc:    0c00        ..      LSRS     r0,r0,#16
        0x000028be:    7528        (u      STRB     r0,[r5,#0x14]
        0x000028c0:    6920         i      LDR      r0,[r4,#0x10]
        0x000028c2:    0e00        ..      LSRS     r0,r0,#24
        0x000028c4:    7568        hu      STRB     r0,[r5,#0x15]
        0x000028c6:    f000f90d    ....    BL       get_fattime ; 0x2ae4
        0x000028ca:    75a8        .u      STRB     r0,[r5,#0x16]
        0x000028cc:    0a01        ..      LSRS     r1,r0,#8
        0x000028ce:    75e9        .u      STRB     r1,[r5,#0x17]
        0x000028d0:    0c01        ..      LSRS     r1,r0,#16
        0x000028d2:    7629        )v      STRB     r1,[r5,#0x18]
        0x000028d4:    0e00        ..      LSRS     r0,r0,#24
        0x000028d6:    7668        hv      STRB     r0,[r5,#0x19]
        0x000028d8:    79a0        .y      LDRB     r0,[r4,#6]
        0x000028da:    f0200020     . .    BIC      r0,r0,#0x20
        0x000028de:    71a0        .q      STRB     r0,[r4,#6]
        0x000028e0:    6821        !h      LDR      r1,[r4,#0]
        0x000028e2:    2001        .       MOVS     r0,#1
        0x000028e4:    7108        .q      STRB     r0,[r1,#4]
        0x000028e6:    6820         h      LDR      r0,[r4,#0]
        0x000028e8:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x000028ec:    f000bb07    ....    B.W      sync ; 0x2efe
    i.ff_convert
    ff_convert
        0x000028f0:    2880        .(      CMP      r0,#0x80
        0x000028f2:    d304        ..      BCC      0x28fe ; ff_convert + 14
        0x000028f4:    4a0b        .J      LDR      r2,[pc,#44] ; [0x2924] = 0x309e
        0x000028f6:    b151        Q.      CBZ      r1,0x290e ; ff_convert + 30
        0x000028f8:    28ff        .(      CMP      r0,#0xff
        0x000028fa:    d901        ..      BLS      0x2900 ; ff_convert + 16
        0x000028fc:    2000        .       MOVS     r0,#0
        0x000028fe:    4770        pG      BX       lr
        0x00002900:    eb020040    ..@.    ADD      r0,r2,r0,LSL #1
        0x00002904:    f5a05080    ...P    SUB      r0,r0,#0x1000
        0x00002908:    f8b00f00    ....    LDRH     r0,[r0,#0xf00]
        0x0000290c:    4770        pG      BX       lr
        0x0000290e:    f8323011    2..0    LDRH     r3,[r2,r1,LSL #1]
        0x00002912:    4283        .B      CMP      r3,r0
        0x00002914:    d003        ..      BEQ      0x291e ; ff_convert + 46
        0x00002916:    1c49        I.      ADDS     r1,r1,#1
        0x00002918:    b289        ..      UXTH     r1,r1
        0x0000291a:    2980        .)      CMP      r1,#0x80
        0x0000291c:    d3f7        ..      BCC      0x290e ; ff_convert + 30
        0x0000291e:    3180        .1      ADDS     r1,r1,#0x80
        0x00002920:    b2c8        ..      UXTB     r0,r1
        0x00002922:    4770        pG      BX       lr
    $d
        0x00002924:    0000309e    .0..    DCD    12446
    $t
    i.ff_wtoupper
    ff_wtoupper
        0x00002928:    2100        .!      MOVS     r1,#0
        0x0000292a:    4b06        .K      LDR      r3,[pc,#24] ; [0x2944] = 0x319e
        0x0000292c:    e000        ..      B        0x2930 ; ff_wtoupper + 8
        0x0000292e:    1c49        I.      ADDS     r1,r1,#1
        0x00002930:    f8332011    3..     LDRH     r2,[r3,r1,LSL #1]
        0x00002934:    2a00        .*      CMP      r2,#0
        0x00002936:    d004        ..      BEQ      0x2942 ; ff_wtoupper + 26
        0x00002938:    4282        .B      CMP      r2,r0
        0x0000293a:    d1f8        ..      BNE      0x292e ; ff_wtoupper + 6
        0x0000293c:    4802        .H      LDR      r0,[pc,#8] ; [0x2948] = 0x337e
        0x0000293e:    f8300011    0...    LDRH     r0,[r0,r1,LSL #1]
        0x00002942:    4770        pG      BX       lr
    $d
        0x00002944:    0000319e    .1..    DCD    12702
        0x00002948:    0000337e    ~3..    DCD    13182
    $t
    i.follow_path
    follow_path
        0x0000294c:    b573        s.      PUSH     {r0,r1,r4-r6,lr}
        0x0000294e:    4604        .F      MOV      r4,r0
        0x00002950:    9901        ..      LDR      r1,[sp,#4]
        0x00002952:    7808        .x      LDRB     r0,[r1,#0]
        0x00002954:    282f        /(      CMP      r0,#0x2f
        0x00002956:    d001        ..      BEQ      0x295c ; follow_path + 16
        0x00002958:    285c        \(      CMP      r0,#0x5c
        0x0000295a:    d101        ..      BNE      0x2960 ; follow_path + 20
        0x0000295c:    1c49        I.      ADDS     r1,r1,#1
        0x0000295e:    9101        ..      STR      r1,[sp,#4]
        0x00002960:    2500        .%      MOVS     r5,#0
        0x00002962:    60a5        .`      STR      r5,[r4,#8]
        0x00002964:    9801        ..      LDR      r0,[sp,#4]
        0x00002966:    7800        .x      LDRB     r0,[r0,#0]
        0x00002968:    2820         (      CMP      r0,#0x20
        0x0000296a:    d205        ..      BCS      0x2978 ; follow_path + 44
        0x0000296c:    2100        .!      MOVS     r1,#0
        0x0000296e:    4620         F      MOV      r0,r4
        0x00002970:    f7fffd82    ....    BL       dir_sdi ; 0x2478
        0x00002974:    6165        ea      STR      r5,[r4,#0x14]
        0x00002976:    bd7c        |.      POP      {r2-r6,pc}
        0x00002978:    a901        ..      ADD      r1,sp,#4
        0x0000297a:    4620         F      MOV      r0,r4
        0x0000297c:    f7fffab0    ....    BL       create_name ; 0x1ee0
        0x00002980:    2800        .(      CMP      r0,#0
        0x00002982:    d1f8        ..      BNE      0x2976 ; follow_path + 42
        0x00002984:    4620         F      MOV      r0,r4
        0x00002986:    f7fffb99    ....    BL       dir_find ; 0x20bc
        0x0000298a:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0000298c:    7ac9        .z      LDRB     r1,[r1,#0xb]
        0x0000298e:    b128        (.      CBZ      r0,0x299c ; follow_path + 80
        0x00002990:    2804        .(      CMP      r0,#4
        0x00002992:    d1f0        ..      BNE      0x2976 ; follow_path + 42
        0x00002994:    0749        I.      LSLS     r1,r1,#29
        0x00002996:    d4ee        ..      BMI      0x2976 ; follow_path + 42
        0x00002998:    2005        .       MOVS     r0,#5
        0x0000299a:    bd7c        |.      POP      {r2-r6,pc}
        0x0000299c:    0749        I.      LSLS     r1,r1,#29
        0x0000299e:    d4fc        ..      BMI      0x299a ; follow_path + 78
        0x000029a0:    6960        `i      LDR      r0,[r4,#0x14]
        0x000029a2:    7ac1        .z      LDRB     r1,[r0,#0xb]
        0x000029a4:    06c9        ..      LSLS     r1,r1,#27
        0x000029a6:    d5f7        ..      BPL      0x2998 ; follow_path + 76
        0x000029a8:    8a81        ..      LDRH     r1,[r0,#0x14]
        0x000029aa:    8b40        @.      LDRH     r0,[r0,#0x1a]
        0x000029ac:    f361401f    a..@    BFI      r0,r1,#16,#16
        0x000029b0:    60a0        .`      STR      r0,[r4,#8]
        0x000029b2:    e7e1        ..      B        0x2978 ; follow_path + 44
    i.fputc
    fputc
        0x000029b4:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000029b6:    2201        ."      MOVS     r2,#1
        0x000029b8:    4669        iF      MOV      r1,sp
        0x000029ba:    2000        .       MOVS     r0,#0
        0x000029bc:    f7fefdac    ....    BL       SEGGER_RTT_Write ; 0x1518
        0x000029c0:    9800        ..      LDR      r0,[sp,#0]
        0x000029c2:    bd1c        ..      POP      {r2-r4,pc}
    i.gen_numname
    gen_numname
        0x000029c4:    b57c        |.      PUSH     {r2-r6,lr}
        0x000029c6:    4616        .F      MOV      r6,r2
        0x000029c8:    461c        .F      MOV      r4,r3
        0x000029ca:    4605        .F      MOV      r5,r0
        0x000029cc:    220b        ."      MOVS     r2,#0xb
        0x000029ce:    f000f941    ..A.    BL       mem_cpy ; 0x2c54
        0x000029d2:    2c05        .,      CMP      r4,#5
        0x000029d4:    d909        ..      BLS      0x29ea ; gen_numname + 38
        0x000029d6:    0860        `.      LSRS     r0,r4,#1
        0x000029d8:    f8361b02    6...    LDRH     r1,[r6],#2
        0x000029dc:    eb0030c4    ...0    ADD      r0,r0,r4,LSL #15
        0x000029e0:    4408        .D      ADD      r0,r0,r1
        0x000029e2:    b284        ..      UXTH     r4,r0
        0x000029e4:    8830        0.      LDRH     r0,[r6,#0]
        0x000029e6:    2800        .(      CMP      r0,#0
        0x000029e8:    d1f5        ..      BNE      0x29d6 ; gen_numname + 18
        0x000029ea:    2107        .!      MOVS     r1,#7
        0x000029ec:    466b        kF      MOV      r3,sp
        0x000029ee:    f004000f    ....    AND      r0,r4,#0xf
        0x000029f2:    3030        00      ADDS     r0,r0,#0x30
        0x000029f4:    2839        9(      CMP      r0,#0x39
        0x000029f6:    d900        ..      BLS      0x29fa ; gen_numname + 54
        0x000029f8:    1dc0        ..      ADDS     r0,r0,#7
        0x000029fa:    5458        XT      STRB     r0,[r3,r1]
        0x000029fc:    1e49        I.      SUBS     r1,r1,#1
        0x000029fe:    0924        $.      LSRS     r4,r4,#4
        0x00002a00:    d1f5        ..      BNE      0x29ee ; gen_numname + 42
        0x00002a02:    207e        ~       MOVS     r0,#0x7e
        0x00002a04:    5458        XT      STRB     r0,[r3,r1]
        0x00002a06:    2200        ."      MOVS     r2,#0
        0x00002a08:    e000        ..      B        0x2a0c ; gen_numname + 72
        0x00002a0a:    1c52        R.      ADDS     r2,r2,#1
        0x00002a0c:    428a        .B      CMP      r2,r1
        0x00002a0e:    d202        ..      BCS      0x2a16 ; gen_numname + 82
        0x00002a10:    5ca8        .\      LDRB     r0,[r5,r2]
        0x00002a12:    2820         (      CMP      r0,#0x20
        0x00002a14:    d1f9        ..      BNE      0x2a0a ; gen_numname + 70
        0x00002a16:    2908        .)      CMP      r1,#8
        0x00002a18:    d202        ..      BCS      0x2a20 ; gen_numname + 92
        0x00002a1a:    5c58        X\      LDRB     r0,[r3,r1]
        0x00002a1c:    1c49        I.      ADDS     r1,r1,#1
        0x00002a1e:    e000        ..      B        0x2a22 ; gen_numname + 94
        0x00002a20:    2020                MOVS     r0,#0x20
        0x00002a22:    54a8        .T      STRB     r0,[r5,r2]
        0x00002a24:    1c52        R.      ADDS     r2,r2,#1
        0x00002a26:    2a08        .*      CMP      r2,#8
        0x00002a28:    d3f5        ..      BCC      0x2a16 ; gen_numname + 82
        0x00002a2a:    bd7c        |.      POP      {r2-r6,pc}
    i.get_fat
    get_fat
        0x00002a2c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00002a30:    460d        .F      MOV      r5,r1
        0x00002a32:    4604        .F      MOV      r4,r0
        0x00002a34:    2902        .)      CMP      r1,#2
        0x00002a36:    d302        ..      BCC      0x2a3e ; get_fat + 18
        0x00002a38:    69a0        .i      LDR      r0,[r4,#0x18]
        0x00002a3a:    42a8        .B      CMP      r0,r5
        0x00002a3c:    d802        ..      BHI      0x2a44 ; get_fat + 24
        0x00002a3e:    2001        .       MOVS     r0,#1
        0x00002a40:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00002a44:    7820         x      LDRB     r0,[r4,#0]
        0x00002a46:    2801        .(      CMP      r0,#1
        0x00002a48:    d004        ..      BEQ      0x2a54 ; get_fat + 40
        0x00002a4a:    2802        .(      CMP      r0,#2
        0x00002a4c:    d026        &.      BEQ      0x2a9c ; get_fat + 112
        0x00002a4e:    2803        .(      CMP      r0,#3
        0x00002a50:    d137        7.      BNE      0x2ac2 ; get_fat + 150
        0x00002a52:    e02f        /.      B        0x2ab4 ; get_fat + 136
        0x00002a54:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002a56:    eb050655    ..U.    ADD      r6,r5,r5,LSR #1
        0x00002a5a:    eb002156    ..V!    ADD      r1,r0,r6,LSR #9
        0x00002a5e:    4620         F      MOV      r0,r4
        0x00002a60:    f000f907    ....    BL       move_window ; 0x2c72
        0x00002a64:    bb68        h.      CBNZ     r0,0x2ac2 ; get_fat + 150
        0x00002a66:    f3c60008    ....    UBFX     r0,r6,#0,#9
        0x00002a6a:    4420         D      ADD      r0,r0,r4
        0x00002a6c:    1c76        v.      ADDS     r6,r6,#1
        0x00002a6e:    f8907030    ..0p    LDRB     r7,[r0,#0x30]
        0x00002a72:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002a74:    eb002156    ..V!    ADD      r1,r0,r6,LSR #9
        0x00002a78:    4620         F      MOV      r0,r4
        0x00002a7a:    f000f8fa    ....    BL       move_window ; 0x2c72
        0x00002a7e:    bb00        ..      CBNZ     r0,0x2ac2 ; get_fat + 150
        0x00002a80:    f3c60008    ....    UBFX     r0,r6,#0,#9
        0x00002a84:    4420         D      ADD      r0,r0,r4
        0x00002a86:    07e9        ..      LSLS     r1,r5,#31
        0x00002a88:    f8900030    ..0.    LDRB     r0,[r0,#0x30]
        0x00002a8c:    ea472000    G..     ORR      r0,r7,r0,LSL #8
        0x00002a90:    d001        ..      BEQ      0x2a96 ; get_fat + 106
        0x00002a92:    0900        ..      LSRS     r0,r0,#4
        0x00002a94:    e7d4        ..      B        0x2a40 ; get_fat + 20
        0x00002a96:    f3c0000b    ....    UBFX     r0,r0,#0,#12
        0x00002a9a:    e7d1        ..      B        0x2a40 ; get_fat + 20
        0x00002a9c:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002a9e:    eb002115    ...!    ADD      r1,r0,r5,LSR #8
        0x00002aa2:    4620         F      MOV      r0,r4
        0x00002aa4:    f000f8e5    ....    BL       move_window ; 0x2c72
        0x00002aa8:    b958        X.      CBNZ     r0,0x2ac2 ; get_fat + 150
        0x00002aaa:    b2e8        ..      UXTB     r0,r5
        0x00002aac:    eb040040    ..@.    ADD      r0,r4,r0,LSL #1
        0x00002ab0:    8e00        ..      LDRH     r0,[r0,#0x30]
        0x00002ab2:    e7c5        ..      B        0x2a40 ; get_fat + 20
        0x00002ab4:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002ab6:    eb0011d5    ....    ADD      r1,r0,r5,LSR #7
        0x00002aba:    4620         F      MOV      r0,r4
        0x00002abc:    f000f8d9    ....    BL       move_window ; 0x2c72
        0x00002ac0:    b110        ..      CBZ      r0,0x2ac8 ; get_fat + 156
        0x00002ac2:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00002ac6:    e7bb        ..      B        0x2a40 ; get_fat + 20
        0x00002ac8:    f24010ff    @...    MOV      r0,#0x1ff
        0x00002acc:    ea000085    ....    AND      r0,r0,r5,LSL #2
        0x00002ad0:    4420         D      ADD      r0,r0,r4
        0x00002ad2:    f8901030    ..0.    LDRB     r1,[r0,#0x30]
        0x00002ad6:    f8d00031    ..1.    LDR      r0,[r0,#0x31]
        0x00002ada:    ea412000    A..     ORR      r0,r1,r0,LSL #8
        0x00002ade:    f0204070     .p@    BIC      r0,r0,#0xf0000000
        0x00002ae2:    e7ad        ..      B        0x2a40 ; get_fat + 20
    i.get_fattime
    get_fattime
        0x00002ae4:    2000        .       MOVS     r0,#0
        0x00002ae6:    4770        pG      BX       lr
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00002ae8:    4903        .I      LDR      r1,[pc,#12] ; [0x2af8] = 0x40007000
        0x00002aea:    6809        .h      LDR      r1,[r1,#0]
        0x00002aec:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00002af0:    4a01        .J      LDR      r2,[pc,#4] ; [0x2af8] = 0x40007000
        0x00002af2:    6011        .`      STR      r1,[r2,#0]
        0x00002af4:    4770        pG      BX       lr
    $d
        0x00002af6:    0000        ..      DCW    0
        0x00002af8:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00002afc:    4903        .I      LDR      r1,[pc,#12] ; [0x2b0c] = 0x40007000
        0x00002afe:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002b00:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00002b04:    4a01        .J      LDR      r2,[pc,#4] ; [0x2b0c] = 0x40007000
        0x00002b06:    60d1        .`      STR      r1,[r2,#0xc]
        0x00002b08:    4770        pG      BX       lr
    $d
        0x00002b0a:    0000        ..      DCW    0
        0x00002b0c:    40007000    .p.@    DCD    1073770496
    $t
    i.main
    main
        0x00002b10:    b510        ..      PUSH     {r4,lr}
        0x00002b12:    a01b        ..      ADR      r0,{pc}+0x6e ; 0x2b80
        0x00002b14:    f7fdfb76    ..v.    BL       __2printf ; 0x204
        0x00002b18:    4920         I      LDR      r1,[pc,#128] ; [0x2b9c] = 0x2000001c
        0x00002b1a:    2000        .       MOVS     r0,#0
        0x00002b1c:    f7fffd44    ..D.    BL       f_mount ; 0x25a8
        0x00002b20:    4c1f        .L      LDR      r4,[pc,#124] ; [0x2ba0] = 0x20000000
        0x00002b22:    7020         p      STRB     r0,[r4,#0]
        0x00002b24:    b118        ..      CBZ      r0,0x2b2e ; main + 30
        0x00002b26:    4601        .F      MOV      r1,r0
        0x00002b28:    a01e        ..      ADR      r0,{pc}+0x7c ; 0x2ba4
        0x00002b2a:    f7fdfb6b    ..k.    BL       __2printf ; 0x204
        0x00002b2e:    a026        &.      ADR      r0,{pc}+0x9a ; 0x2bc8
        0x00002b30:    f7fdfb68    ..h.    BL       __2printf ; 0x204
        0x00002b34:    2201        ."      MOVS     r2,#1
        0x00002b36:    a12b        +.      ADR      r1,{pc}+0xae ; 0x2be4
        0x00002b38:    4830        0H      LDR      r0,[pc,#192] ; [0x2bfc] = 0x2000024c
        0x00002b3a:    f7fffd45    ..E.    BL       f_open ; 0x25c8
        0x00002b3e:    7020         p      STRB     r0,[r4,#0]
        0x00002b40:    b120         .      CBZ      r0,0x2b4c ; main + 60
        0x00002b42:    4601        .F      MOV      r1,r0
        0x00002b44:    a02e        ..      ADR      r0,{pc}+0xbc ; 0x2c00
        0x00002b46:    f7fdfb5d    ..].    BL       __2printf ; 0x204
        0x00002b4a:    e00f        ..      B        0x2b6c ; main + 92
        0x00002b4c:    4b14        .K      LDR      r3,[pc,#80] ; [0x2ba0] = 0x20000000
        0x00002b4e:    2237        7"      MOVS     r2,#0x37
        0x00002b50:    1d1b        ..      ADDS     r3,r3,#4
        0x00002b52:    4931        1I      LDR      r1,[pc,#196] ; [0x2c18] = 0x20000470
        0x00002b54:    4829        )H      LDR      r0,[pc,#164] ; [0x2bfc] = 0x2000024c
        0x00002b56:    f7fffdd7    ....    BL       f_read ; 0x2708
        0x00002b5a:    7020         p      STRB     r0,[r4,#0]
        0x00002b5c:    b140        @.      CBZ      r0,0x2b70 ; main + 96
        0x00002b5e:    4601        .F      MOV      r1,r0
        0x00002b60:    a02e        ..      ADR      r0,{pc}+0xbc ; 0x2c1c
        0x00002b62:    f7fdfb4f    ..O.    BL       __2printf ; 0x204
        0x00002b66:    4825        %H      LDR      r0,[pc,#148] ; [0x2bfc] = 0x2000024c
        0x00002b68:    f7fffd14    ....    BL       f_close ; 0x2594
        0x00002b6c:    2000        .       MOVS     r0,#0
        0x00002b6e:    bd10        ..      POP      {r4,pc}
        0x00002b70:    a030        0.      ADR      r0,{pc}+0xc4 ; 0x2c34
        0x00002b72:    6861        ah      LDR      r1,[r4,#4]
        0x00002b74:    f7fdfb46    ..F.    BL       __2printf ; 0x204
        0x00002b78:    4927        'I      LDR      r1,[pc,#156] ; [0x2c18] = 0x20000470
        0x00002b7a:    a034        4.      ADR      r0,{pc}+0xd2 ; 0x2c4c
        0x00002b7c:    e7f1        ..      B        0x2b62 ; main + 82
    $d
        0x00002b7e:    0000        ..      DCW    0
        0x00002b80:    2a2a0a0d    ..**    DCD    707398157
        0x00002b84:    6f6c6e41    Anlo    DCD    1869377089
        0x00002b88:    20636967    gic     DCD    543385959
        0x00002b8c:    20434f53    SOC     DCD    541282131
        0x00002b90:    74616c50    Plat    DCD    1952541776
        0x00002b94:    6d726f66    form    DCD    1836216166
        0x00002b98:    00002a2a    **..    DCD    10794
        0x00002b9c:    2000001c    ...     DCD    536870940
        0x00002ba0:    20000000    ...     DCD    536870912
        0x00002ba4:    6e756f6d    moun    DCD    1853189997
        0x00002ba8:    69662074    t fi    DCD    1768300660
        0x00002bac:    7973656c    lesy    DCD    2037605740
        0x00002bb0:    6d657473    stem    DCD    1835365491
        0x00002bb4:    66203020     0 f    DCD    1713385504
        0x00002bb8:    656c6961    aile    DCD    1701603681
        0x00002bbc:    203a2064    d :     DCD    540680292
        0x00002bc0:    0d0a6425    %d..    DCD    218784805
        0x00002bc4:    00000000    ....    DCD    0
        0x00002bc8:    64616572    read    DCD    1684104562
        0x00002bcc:    6c696620     fil    DCD    1818846752
        0x00002bd0:    65742065    e te    DCD    1702109285
        0x00002bd4:    32207473    st 2    DCD    840987763
        0x00002bd8:    2e2e2e2e    ....    DCD    774778414
        0x00002bdc:    0d0a2e2e    ....    DCD    218770990
        0x00002be0:    00000000    ....    DCD    0
        0x00002be4:    532f3a30    0:/S    DCD    1395604016
        0x00002be8:    50535f44    D_SP    DCD    1347641156
        0x00002bec:    44525f49    I_RD    DCD    1146249033
        0x00002bf0:    7365545f    _Tes    DCD    1936020575
        0x00002bf4:    78742e74    t.tx    DCD    2020879988
        0x00002bf8:    00000074    t...    DCD    116
        0x00002bfc:    2000024c    L..     DCD    536871500
        0x00002c00:    6e65706f    open    DCD    1852141679
        0x00002c04:    6c696620     fil    DCD    1818846752
        0x00002c08:    72652065    e er    DCD    1919230053
        0x00002c0c:    20726f72    ror     DCD    544370546
        0x00002c10:    6425203a    : %d    DCD    1680154682
        0x00002c14:    00000d0a    ....    DCD    3338
        0x00002c18:    20000470    p..     DCD    536872048
        0x00002c1c:    64616572    read    DCD    1684104562
        0x00002c20:    6c696620     fil    DCD    1818846752
        0x00002c24:    72652065    e er    DCD    1919230053
        0x00002c28:    20726f72    ror     DCD    544370546
        0x00002c2c:    6425203a    : %d    DCD    1680154682
        0x00002c30:    00000d0a    ....    DCD    3338
        0x00002c34:    64616572    read    DCD    1684104562
        0x00002c38:    74616420     dat    DCD    1952539680
        0x00002c3c:    756e2061    a nu    DCD    1970151521
        0x00002c40:    203a206d    m :     DCD    540680301
        0x00002c44:    0d0a6425    %d..    DCD    218784805
        0x00002c48:    00000000    ....    DCD    0
        0x00002c4c:    0d0a7325    %s..    DCD    218788645
        0x00002c50:    00000000    ....    DCD    0
    $t
    i.mem_cpy
    mem_cpy
        0x00002c54:    e003        ..      B        0x2c5e ; mem_cpy + 10
        0x00002c56:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00002c5a:    f8003b01    ...;    STRB     r3,[r0],#1
        0x00002c5e:    1e52        R.      SUBS     r2,r2,#1
        0x00002c60:    d2f9        ..      BCS      0x2c56 ; mem_cpy + 2
        0x00002c62:    4770        pG      BX       lr
    i.mem_set
    mem_set
        0x00002c64:    b2c9        ..      UXTB     r1,r1
        0x00002c66:    e001        ..      B        0x2c6c ; mem_set + 8
        0x00002c68:    f8001b01    ....    STRB     r1,[r0],#1
        0x00002c6c:    1e52        R.      SUBS     r2,r2,#1
        0x00002c6e:    d2fb        ..      BCS      0x2c68 ; mem_set + 4
        0x00002c70:    4770        pG      BX       lr
    i.move_window
    move_window
        0x00002c72:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00002c76:    6ac5        .j      LDR      r5,[r0,#0x2c]
        0x00002c78:    460f        .F      MOV      r7,r1
        0x00002c7a:    4604        .F      MOV      r4,r0
        0x00002c7c:    42bd        .B      CMP      r5,r7
        0x00002c7e:    d02b        +.      BEQ      0x2cd8 ; move_window + 102
        0x00002c80:    7921        !y      LDRB     r1,[r4,#4]
        0x00002c82:    f1040830    ..0.    ADD      r8,r4,#0x30
        0x00002c86:    b1d9        ..      CBZ      r1,0x2cc0 ; move_window + 78
        0x00002c88:    7860        `x      LDRB     r0,[r4,#1]
        0x00002c8a:    2301        .#      MOVS     r3,#1
        0x00002c8c:    462a        *F      MOV      r2,r5
        0x00002c8e:    4641        AF      MOV      r1,r8
        0x00002c90:    f7fffc6f    ..o.    BL       disk_write ; 0x2572
        0x00002c94:    b9e0        ..      CBNZ     r0,0x2cd0 ; move_window + 94
        0x00002c96:    2000        .       MOVS     r0,#0
        0x00002c98:    7120         q      STRB     r0,[r4,#4]
        0x00002c9a:    e9d41007    ....    LDRD     r1,r0,[r4,#0x1c]
        0x00002c9e:    4408        .D      ADD      r0,r0,r1
        0x00002ca0:    42a8        .B      CMP      r0,r5
        0x00002ca2:    d90d        ..      BLS      0x2cc0 ; move_window + 78
        0x00002ca4:    78e6        .x      LDRB     r6,[r4,#3]
        0x00002ca6:    e009        ..      B        0x2cbc ; move_window + 74
        0x00002ca8:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00002caa:    2301        .#      MOVS     r3,#1
        0x00002cac:    4405        .D      ADD      r5,r5,r0
        0x00002cae:    7860        `x      LDRB     r0,[r4,#1]
        0x00002cb0:    462a        *F      MOV      r2,r5
        0x00002cb2:    4641        AF      MOV      r1,r8
        0x00002cb4:    f7fffc5d    ..].    BL       disk_write ; 0x2572
        0x00002cb8:    1e76        v.      SUBS     r6,r6,#1
        0x00002cba:    b2f6        ..      UXTB     r6,r6
        0x00002cbc:    2e01        ..      CMP      r6,#1
        0x00002cbe:    d8f3        ..      BHI      0x2ca8 ; move_window + 54
        0x00002cc0:    b157        W.      CBZ      r7,0x2cd8 ; move_window + 102
        0x00002cc2:    7860        `x      LDRB     r0,[r4,#1]
        0x00002cc4:    2301        .#      MOVS     r3,#1
        0x00002cc6:    463a        :F      MOV      r2,r7
        0x00002cc8:    4641        AF      MOV      r1,r8
        0x00002cca:    f7fffc37    ..7.    BL       disk_read ; 0x253c
        0x00002cce:    b110        ..      CBZ      r0,0x2cd6 ; move_window + 100
        0x00002cd0:    2001        .       MOVS     r0,#1
        0x00002cd2:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00002cd6:    62e7        .b      STR      r7,[r4,#0x2c]
        0x00002cd8:    2000        .       MOVS     r0,#0
        0x00002cda:    e7fa        ..      B        0x2cd2 ; move_window + 96
    i.put_fat
    put_fat
        0x00002cdc:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00002ce0:    4616        .F      MOV      r6,r2
        0x00002ce2:    460d        .F      MOV      r5,r1
        0x00002ce4:    4604        .F      MOV      r4,r0
        0x00002ce6:    2902        .)      CMP      r1,#2
        0x00002ce8:    d302        ..      BCC      0x2cf0 ; put_fat + 20
        0x00002cea:    69a0        .i      LDR      r0,[r4,#0x18]
        0x00002cec:    42a8        .B      CMP      r0,r5
        0x00002cee:    d802        ..      BHI      0x2cf6 ; put_fat + 26
        0x00002cf0:    2002        .       MOVS     r0,#2
        0x00002cf2:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00002cf6:    7820         x      LDRB     r0,[r4,#0]
        0x00002cf8:    f00608ff    ....    AND      r8,r6,#0xff
        0x00002cfc:    f04f0901    O...    MOV      r9,#1
        0x00002d00:    2801        .(      CMP      r0,#1
        0x00002d02:    d007        ..      BEQ      0x2d14 ; put_fat + 56
        0x00002d04:    2802        .(      CMP      r0,#2
        0x00002d06:    d037        7.      BEQ      0x2d78 ; put_fat + 156
        0x00002d08:    2803        .(      CMP      r0,#3
        0x00002d0a:    d046        F.      BEQ      0x2d9a ; put_fat + 190
        0x00002d0c:    2002        .       MOVS     r0,#2
        0x00002d0e:    f8849004    ....    STRB     r9,[r4,#4]
        0x00002d12:    e7ee        ..      B        0x2cf2 ; put_fat + 22
        0x00002d14:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002d16:    eb050755    ..U.    ADD      r7,r5,r5,LSR #1
        0x00002d1a:    eb002157    ..W!    ADD      r1,r0,r7,LSR #9
        0x00002d1e:    4620         F      MOV      r0,r4
        0x00002d20:    f7ffffa7    ....    BL       move_window ; 0x2c72
        0x00002d24:    2800        .(      CMP      r0,#0
        0x00002d26:    d1f2        ..      BNE      0x2d0e ; put_fat + 50
        0x00002d28:    f3c70008    ....    UBFX     r0,r7,#0,#9
        0x00002d2c:    4420         D      ADD      r0,r0,r4
        0x00002d2e:    3030        00      ADDS     r0,r0,#0x30
        0x00002d30:    07e9        ..      LSLS     r1,r5,#31
        0x00002d32:    d003        ..      BEQ      0x2d3c ; put_fat + 96
        0x00002d34:    7801        .x      LDRB     r1,[r0,#0]
        0x00002d36:    f368111f    h...    BFI      r1,r8,#4,#28
        0x00002d3a:    e000        ..      B        0x2d3e ; put_fat + 98
        0x00002d3c:    4631        1F      MOV      r1,r6
        0x00002d3e:    7001        .p      STRB     r1,[r0,#0]
        0x00002d40:    f8849004    ....    STRB     r9,[r4,#4]
        0x00002d44:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002d46:    1c7f        ..      ADDS     r7,r7,#1
        0x00002d48:    eb002157    ..W!    ADD      r1,r0,r7,LSR #9
        0x00002d4c:    4620         F      MOV      r0,r4
        0x00002d4e:    f7ffff90    ....    BL       move_window ; 0x2c72
        0x00002d52:    2800        .(      CMP      r0,#0
        0x00002d54:    d1db        ..      BNE      0x2d0e ; put_fat + 50
        0x00002d56:    f3c70108    ....    UBFX     r1,r7,#0,#9
        0x00002d5a:    4421        !D      ADD      r1,r1,r4
        0x00002d5c:    3130        01      ADDS     r1,r1,#0x30
        0x00002d5e:    07ea        ..      LSLS     r2,r5,#31
        0x00002d60:    d002        ..      BEQ      0x2d68 ; put_fat + 140
        0x00002d62:    f3c61207    ....    UBFX     r2,r6,#4,#8
        0x00002d66:    e005        ..      B        0x2d74 ; put_fat + 152
        0x00002d68:    780a        .x      LDRB     r2,[r1,#0]
        0x00002d6a:    f3c62303    ...#    UBFX     r3,r6,#8,#4
        0x00002d6e:    f00202f0    ....    AND      r2,r2,#0xf0
        0x00002d72:    431a        .C      ORRS     r2,r2,r3
        0x00002d74:    700a        .p      STRB     r2,[r1,#0]
        0x00002d76:    e7ca        ..      B        0x2d0e ; put_fat + 50
        0x00002d78:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002d7a:    eb002115    ...!    ADD      r1,r0,r5,LSR #8
        0x00002d7e:    4620         F      MOV      r0,r4
        0x00002d80:    f7ffff77    ..w.    BL       move_window ; 0x2c72
        0x00002d84:    2800        .(      CMP      r0,#0
        0x00002d86:    d1c2        ..      BNE      0x2d0e ; put_fat + 50
        0x00002d88:    b2e9        ..      UXTB     r1,r5
        0x00002d8a:    eb040141    ..A.    ADD      r1,r4,r1,LSL #1
        0x00002d8e:    0a32        2.      LSRS     r2,r6,#8
        0x00002d90:    f8818030    ..0.    STRB     r8,[r1,#0x30]
        0x00002d94:    f8812031    ..1     STRB     r2,[r1,#0x31]
        0x00002d98:    e7b9        ..      B        0x2d0e ; put_fat + 50
        0x00002d9a:    6a20         j      LDR      r0,[r4,#0x20]
        0x00002d9c:    eb0011d5    ....    ADD      r1,r0,r5,LSR #7
        0x00002da0:    4620         F      MOV      r0,r4
        0x00002da2:    f7ffff66    ..f.    BL       move_window ; 0x2c72
        0x00002da6:    2800        .(      CMP      r0,#0
        0x00002da8:    d1b1        ..      BNE      0x2d0e ; put_fat + 50
        0x00002daa:    f24011ff    @...    MOV      r1,#0x1ff
        0x00002dae:    ea010185    ....    AND      r1,r1,r5,LSL #2
        0x00002db2:    4421        !D      ADD      r1,r1,r4
        0x00002db4:    f04f4370    O.pC    MOV      r3,#0xf0000000
        0x00002db8:    f8d12031    ..1     LDR      r2,[r1,#0x31]
        0x00002dbc:    ea032202    ..."    AND      r2,r3,r2,LSL #8
        0x00002dc0:    4332        2C      ORRS     r2,r2,r6
        0x00002dc2:    f8012f30    ..0/    STRB     r2,[r1,#0x30]!
        0x00002dc6:    0a13        ..      LSRS     r3,r2,#8
        0x00002dc8:    704b        Kp      STRB     r3,[r1,#1]
        0x00002dca:    0c13        ..      LSRS     r3,r2,#16
        0x00002dcc:    708b        .p      STRB     r3,[r1,#2]
        0x00002dce:    0e12        ..      LSRS     r2,r2,#24
        0x00002dd0:    70ca        .p      STRB     r2,[r1,#3]
        0x00002dd2:    e79c        ..      B        0x2d0e ; put_fat + 50
    i.remove_chain
    remove_chain
        0x00002dd4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00002dd8:    460f        .F      MOV      r7,r1
        0x00002dda:    4605        .F      MOV      r5,r0
        0x00002ddc:    2902        .)      CMP      r1,#2
        0x00002dde:    d318        ..      BCC      0x2e12 ; remove_chain + 62
        0x00002de0:    69a8        .i      LDR      r0,[r5,#0x18]
        0x00002de2:    42b8        .B      CMP      r0,r7
        0x00002de4:    d915        ..      BLS      0x2e12 ; remove_chain + 62
        0x00002de6:    2600        .&      MOVS     r6,#0
        0x00002de8:    f04f0801    O...    MOV      r8,#1
        0x00002dec:    e01d        ..      B        0x2e2a ; remove_chain + 86
        0x00002dee:    4639        9F      MOV      r1,r7
        0x00002df0:    4628        (F      MOV      r0,r5
        0x00002df2:    f7fffe1b    ....    BL       get_fat ; 0x2a2c
        0x00002df6:    0004        ..      MOVS     r4,r0
        0x00002df8:    d01a        ..      BEQ      0x2e30 ; remove_chain + 92
        0x00002dfa:    2c01        .,      CMP      r4,#1
        0x00002dfc:    d009        ..      BEQ      0x2e12 ; remove_chain + 62
        0x00002dfe:    1c60        `.      ADDS     r0,r4,#1
        0x00002e00:    d009        ..      BEQ      0x2e16 ; remove_chain + 66
        0x00002e02:    2200        ."      MOVS     r2,#0
        0x00002e04:    4639        9F      MOV      r1,r7
        0x00002e06:    4628        (F      MOV      r0,r5
        0x00002e08:    f7ffff68    ..h.    BL       put_fat ; 0x2cdc
        0x00002e0c:    0006        ..      MOVS     r6,r0
        0x00002e0e:    d10f        ..      BNE      0x2e30 ; remove_chain + 92
        0x00002e10:    e003        ..      B        0x2e1a ; remove_chain + 70
        0x00002e12:    2602        .&      MOVS     r6,#2
        0x00002e14:    e00c        ..      B        0x2e30 ; remove_chain + 92
        0x00002e16:    2601        .&      MOVS     r6,#1
        0x00002e18:    e00a        ..      B        0x2e30 ; remove_chain + 92
        0x00002e1a:    6928        (i      LDR      r0,[r5,#0x10]
        0x00002e1c:    1c41        A.      ADDS     r1,r0,#1
        0x00002e1e:    d003        ..      BEQ      0x2e28 ; remove_chain + 84
        0x00002e20:    1c40        @.      ADDS     r0,r0,#1
        0x00002e22:    6128        (a      STR      r0,[r5,#0x10]
        0x00002e24:    f8858005    ....    STRB     r8,[r5,#5]
        0x00002e28:    4627        'F      MOV      r7,r4
        0x00002e2a:    69a8        .i      LDR      r0,[r5,#0x18]
        0x00002e2c:    42b8        .B      CMP      r0,r7
        0x00002e2e:    d8de        ..      BHI      0x2dee ; remove_chain + 26
        0x00002e30:    4630        0F      MOV      r0,r6
        0x00002e32:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00002e36:    0000        ..      MOVS     r0,r0
    i.spim_busy_getf
    spim_busy_getf
        0x00002e38:    4802        .H      LDR      r0,[pc,#8] ; [0x2e44] = 0x40006000
        0x00002e3a:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00002e3c:    f0000001    ....    AND      r0,r0,#1
        0x00002e40:    4770        pG      BX       lr
    $d
        0x00002e42:    0000        ..      DCW    0
        0x00002e44:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_ctrlr1_pack
    spim_ctrlr1_pack
        0x00002e48:    4901        .I      LDR      r1,[pc,#4] ; [0x2e50] = 0x40006000
        0x00002e4a:    6048        H`      STR      r0,[r1,#4]
        0x00002e4c:    4770        pG      BX       lr
    $d
        0x00002e4e:    0000        ..      DCW    0
        0x00002e50:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_dr_get
    spim_dr_get
        0x00002e54:    4801        .H      LDR      r0,[pc,#4] ; [0x2e5c] = 0x40006000
        0x00002e56:    6e00        .n      LDR      r0,[r0,#0x60]
        0x00002e58:    4770        pG      BX       lr
    $d
        0x00002e5a:    0000        ..      DCW    0
        0x00002e5c:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_dr_set
    spim_dr_set
        0x00002e60:    4901        .I      LDR      r1,[pc,#4] ; [0x2e68] = 0x40006000
        0x00002e62:    6608        .f      STR      r0,[r1,#0x60]
        0x00002e64:    4770        pG      BX       lr
    $d
        0x00002e66:    0000        ..      DCW    0
        0x00002e68:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_rfne_getf
    spim_rfne_getf
        0x00002e6c:    4802        .H      LDR      r0,[pc,#8] ; [0x2e78] = 0x40006000
        0x00002e6e:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00002e70:    f3c000c0    ....    UBFX     r0,r0,#3,#1
        0x00002e74:    4770        pG      BX       lr
    $d
        0x00002e76:    0000        ..      DCW    0
        0x00002e78:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_sckdv_setf
    spim_sckdv_setf
        0x00002e7c:    4903        .I      LDR      r1,[pc,#12] ; [0x2e8c] = 0x40006000
        0x00002e7e:    6949        Ii      LDR      r1,[r1,#0x14]
        0x00002e80:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00002e84:    4a01        .J      LDR      r2,[pc,#4] ; [0x2e8c] = 0x40006000
        0x00002e86:    6151        Qa      STR      r1,[r2,#0x14]
        0x00002e88:    4770        pG      BX       lr
    $d
        0x00002e8a:    0000        ..      DCW    0
        0x00002e8c:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_ser_set
    spim_ser_set
        0x00002e90:    4901        .I      LDR      r1,[pc,#4] ; [0x2e98] = 0x40006000
        0x00002e92:    6108        .a      STR      r0,[r1,#0x10]
        0x00002e94:    4770        pG      BX       lr
    $d
        0x00002e96:    0000        ..      DCW    0
        0x00002e98:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_ssi_en_setf
    spim_ssi_en_setf
        0x00002e9c:    4903        .I      LDR      r1,[pc,#12] ; [0x2eac] = 0x40006000
        0x00002e9e:    6889        .h      LDR      r1,[r1,#8]
        0x00002ea0:    f3600100    `...    BFI      r1,r0,#0,#1
        0x00002ea4:    4a01        .J      LDR      r2,[pc,#4] ; [0x2eac] = 0x40006000
        0x00002ea6:    6091        .`      STR      r1,[r2,#8]
        0x00002ea8:    4770        pG      BX       lr
    $d
        0x00002eaa:    0000        ..      DCW    0
        0x00002eac:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_tfe_getf
    spim_tfe_getf
        0x00002eb0:    4802        .H      LDR      r0,[pc,#8] ; [0x2ebc] = 0x40006000
        0x00002eb2:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00002eb4:    f3c00080    ....    UBFX     r0,r0,#2,#1
        0x00002eb8:    4770        pG      BX       lr
    $d
        0x00002eba:    0000        ..      DCW    0
        0x00002ebc:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_tfnf_getf
    spim_tfnf_getf
        0x00002ec0:    4802        .H      LDR      r0,[pc,#8] ; [0x2ecc] = 0x40006000
        0x00002ec2:    6a80        .j      LDR      r0,[r0,#0x28]
        0x00002ec4:    f3c00040    ..@.    UBFX     r0,r0,#1,#1
        0x00002ec8:    4770        pG      BX       lr
    $d
        0x00002eca:    0000        ..      DCW    0
        0x00002ecc:    40006000    .`.@    DCD    1073766400
    $t
    i.spim_tmod_setf
    spim_tmod_setf
        0x00002ed0:    4903        .I      LDR      r1,[pc,#12] ; [0x2ee0] = 0x40006000
        0x00002ed2:    6809        .h      LDR      r1,[r1,#0]
        0x00002ed4:    f3602109    `..!    BFI      r1,r0,#8,#2
        0x00002ed8:    4a01        .J      LDR      r2,[pc,#4] ; [0x2ee0] = 0x40006000
        0x00002eda:    6011        .`      STR      r1,[r2,#0]
        0x00002edc:    4770        pG      BX       lr
    $d
        0x00002ede:    0000        ..      DCW    0
        0x00002ee0:    40006000    .`.@    DCD    1073766400
    $t
    i.sum_sfn
    sum_sfn
        0x00002ee4:    4601        .F      MOV      r1,r0
        0x00002ee6:    2000        .       MOVS     r0,#0
        0x00002ee8:    220b        ."      MOVS     r2,#0xb
        0x00002eea:    0843        C.      LSRS     r3,r0,#1
        0x00002eec:    eb0310c0    ....    ADD      r0,r3,r0,LSL #7
        0x00002ef0:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00002ef4:    1e52        R.      SUBS     r2,r2,#1
        0x00002ef6:    4418        .D      ADD      r0,r0,r3
        0x00002ef8:    b2c0        ..      UXTB     r0,r0
        0x00002efa:    d1f6        ..      BNE      0x2eea ; sum_sfn + 6
        0x00002efc:    4770        pG      BX       lr
    i.sync
    sync
        0x00002efe:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00002f02:    4604        .F      MOV      r4,r0
        0x00002f04:    2100        .!      MOVS     r1,#0
        0x00002f06:    f7fffeb4    ....    BL       move_window ; 0x2c72
        0x00002f0a:    0005        ..      MOVS     r5,r0
        0x00002f0c:    d150        P.      BNE      0x2fb0 ; sync + 178
        0x00002f0e:    7820         x      LDRB     r0,[r4,#0]
        0x00002f10:    2803        .(      CMP      r0,#3
        0x00002f12:    d146        F.      BNE      0x2fa2 ; sync + 164
        0x00002f14:    7960        `y      LDRB     r0,[r4,#5]
        0x00002f16:    b3f0        ..      CBZ      r0,0x2f96 ; sync + 152
        0x00002f18:    2600        .&      MOVS     r6,#0
        0x00002f1a:    f1040030    ..0.    ADD      r0,r4,#0x30
        0x00002f1e:    f44f7200    O..r    MOV      r2,#0x200
        0x00002f22:    4631        1F      MOV      r1,r6
        0x00002f24:    4607        .F      MOV      r7,r0
        0x00002f26:    62e6        .b      STR      r6,[r4,#0x2c]
        0x00002f28:    f7fffe9c    ....    BL       mem_set ; 0x2c64
        0x00002f2c:    2055        U       MOVS     r0,#0x55
        0x00002f2e:    f884022e    ....    STRB     r0,[r4,#0x22e]
        0x00002f32:    20aa        .       MOVS     r0,#0xaa
        0x00002f34:    f884022f    ../.    STRB     r0,[r4,#0x22f]
        0x00002f38:    2052        R       MOVS     r0,#0x52
        0x00002f3a:    f8840030    ..0.    STRB     r0,[r4,#0x30]
        0x00002f3e:    f8840031    ..1.    STRB     r0,[r4,#0x31]
        0x00002f42:    2261        a"      MOVS     r2,#0x61
        0x00002f44:    f8842032    ..2     STRB     r2,[r4,#0x32]
        0x00002f48:    2041        A       MOVS     r0,#0x41
        0x00002f4a:    f8840033    ..3.    STRB     r0,[r4,#0x33]
        0x00002f4e:    2172        r!      MOVS     r1,#0x72
        0x00002f50:    f8841214    ....    STRB     r1,[r4,#0x214]
        0x00002f54:    f8841215    ....    STRB     r1,[r4,#0x215]
        0x00002f58:    f8840216    ....    STRB     r0,[r4,#0x216]
        0x00002f5c:    f8842217    ..."    STRB     r2,[r4,#0x217]
        0x00002f60:    6920         i      LDR      r0,[r4,#0x10]
        0x00002f62:    f8840218    ....    STRB     r0,[r4,#0x218]
        0x00002f66:    0a01        ..      LSRS     r1,r0,#8
        0x00002f68:    f8841219    ....    STRB     r1,[r4,#0x219]
        0x00002f6c:    0c01        ..      LSRS     r1,r0,#16
        0x00002f6e:    f884121a    ....    STRB     r1,[r4,#0x21a]
        0x00002f72:    0e00        ..      LSRS     r0,r0,#24
        0x00002f74:    f884021b    ....    STRB     r0,[r4,#0x21b]
        0x00002f78:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00002f7a:    f884021c    ....    STRB     r0,[r4,#0x21c]
        0x00002f7e:    0a01        ..      LSRS     r1,r0,#8
        0x00002f80:    f884121d    ....    STRB     r1,[r4,#0x21d]
        0x00002f84:    0c01        ..      LSRS     r1,r0,#16
        0x00002f86:    0e00        ..      LSRS     r0,r0,#24
        0x00002f88:    f884121e    ....    STRB     r1,[r4,#0x21e]
        0x00002f8c:    f884021f    ....    STRB     r0,[r4,#0x21f]
        0x00002f90:    7860        `x      LDRB     r0,[r4,#1]
        0x00002f92:    2301        .#      MOVS     r3,#1
        0x00002f94:    e000        ..      B        0x2f98 ; sync + 154
        0x00002f96:    e004        ..      B        0x2fa2 ; sync + 164
        0x00002f98:    4639        9F      MOV      r1,r7
        0x00002f9a:    6962        bi      LDR      r2,[r4,#0x14]
        0x00002f9c:    f7fffae9    ....    BL       disk_write ; 0x2572
        0x00002fa0:    7166        fq      STRB     r6,[r4,#5]
        0x00002fa2:    2200        ."      MOVS     r2,#0
        0x00002fa4:    7860        `x      LDRB     r0,[r4,#1]
        0x00002fa6:    4611        .F      MOV      r1,r2
        0x00002fa8:    f7fffab6    ....    BL       disk_ioctl ; 0x2518
        0x00002fac:    b100        ..      CBZ      r0,0x2fb0 ; sync + 178
        0x00002fae:    2501        .%      MOVS     r5,#1
        0x00002fb0:    4628        (F      MOV      r0,r5
        0x00002fb2:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00002fb6:    0000        ..      MOVS     r0,r0
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00002fb8:    4901        .I      LDR      r1,[pc,#4] ; [0x2fc0] = 0x40020000
        0x00002fba:    6008        .`      STR      r0,[r1,#0]
        0x00002fbc:    4770        pG      BX       lr
    $d
        0x00002fbe:    0000        ..      DCW    0
        0x00002fc0:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00002fc4:    4903        .I      LDR      r1,[pc,#12] ; [0x2fd4] = 0x40020000
        0x00002fc6:    6849        Ih      LDR      r1,[r1,#4]
        0x00002fc8:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00002fcc:    4a01        .J      LDR      r2,[pc,#4] ; [0x2fd4] = 0x40020000
        0x00002fce:    6051        Q`      STR      r1,[r2,#4]
        0x00002fd0:    4770        pG      BX       lr
    $d
        0x00002fd2:    0000        ..      DCW    0
        0x00002fd4:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_cpu_func_en_set
    sysc_cpu_func_en_set
        0x00002fd8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00002fdc:    6148        Ha      STR      r0,[r1,#0x14]
        0x00002fde:    4770        pG      BX       lr
    i.validate
    validate
        0x00002fe0:    b510        ..      PUSH     {r4,lr}
        0x00002fe2:    b120         .      CBZ      r0,0x2fee ; validate + 14
        0x00002fe4:    7802        .x      LDRB     r2,[r0,#0]
        0x00002fe6:    b112        ..      CBZ      r2,0x2fee ; validate + 14
        0x00002fe8:    88c2        ..      LDRH     r2,[r0,#6]
        0x00002fea:    428a        .B      CMP      r2,r1
        0x00002fec:    d001        ..      BEQ      0x2ff2 ; validate + 18
        0x00002fee:    2009        .       MOVS     r0,#9
        0x00002ff0:    bd10        ..      POP      {r4,pc}
        0x00002ff2:    7840        @x      LDRB     r0,[r0,#1]
        0x00002ff4:    f7fffab3    ....    BL       disk_status ; 0x255e
        0x00002ff8:    07c0        ..      LSLS     r0,r0,#31
        0x00002ffa:    d0f9        ..      BEQ      0x2ff0 ; validate + 16
        0x00002ffc:    2003        .       MOVS     r0,#3
        0x00002ffe:    bd10        ..      POP      {r4,pc}
    $d.realdata
    .constdata
    _aV2C
        0x00003000:    33323130    0123    DCD    858927408
        0x00003004:    37363534    4567    DCD    926299444
        0x00003008:    42413938    89AB    DCD    1111570744
        0x0000300c:    46454443    CDEF    DCD    1178944579
    .constdata
    LfnOfs
        0x00003010:    07050301    ....    DCD    117768961
        0x00003014:    12100e09    ....    DCD    303042057
        0x00003018:    1c181614    ....    DCD    471340564
        0x0000301c:    1e          .       DCB    30
    excvt
        0x0000301d:    809a90      ...     DCB    128,154,144
        0x00003020:    8f418e41    A.A.    DCD    2403438145
        0x00003024:    45454580    .EEE    DCD    1162167680
        0x00003028:    8e494949    III.    DCD    2387167561
        0x0000302c:    9292908f    ....    DCD    2459078799
        0x00003030:    554f994f    O.OU    DCD    1431279951
        0x00003034:    9a995955    UY..    DCD    2593741141
        0x00003038:    9e9d9c9b    ....    DCD    2661129371
        0x0000303c:    4f49419f    .AIO    DCD    1330200991
        0x00003040:    a6a5a555    U...    DCD    2795873621
        0x00003044:    aaa9a8a7    ....    DCD    2863245479
        0x00003048:    ae21acab    ..!.    DCD    2921442475
        0x0000304c:    b2b1b0af    ....    DCD    2997989551
        0x00003050:    b6b5b4b3    ....    DCD    3065361587
        0x00003054:    bab9b8b7    ....    DCD    3132733623
        0x00003058:    bebdbcbb    ....    DCD    3200105659
        0x0000305c:    c2c1c0bf    ....    DCD    3267477695
        0x00003060:    c6c5c4c3    ....    DCD    3334849731
        0x00003064:    cac9c8c7    ....    DCD    3402221767
        0x00003068:    cecdcccb    ....    DCD    3469593803
        0x0000306c:    d2d1d0cf    ....    DCD    3536965839
        0x00003070:    d6d5d4d3    ....    DCD    3604337875
        0x00003074:    dad9d8d7    ....    DCD    3671709911
        0x00003078:    dedddcdb    ....    DCD    3739081947
        0x0000307c:    e2e1e0df    ....    DCD    3806453983
        0x00003080:    e6e5e4e3    ....    DCD    3873826019
        0x00003084:    eae9e8e7    ....    DCD    3941198055
        0x00003088:    eeedeceb    ....    DCD    4008570091
        0x0000308c:    f2f1f0ef    ....    DCD    4075942127
        0x00003090:    f6f5f4f3    ....    DCD    4143314163
        0x00003094:    faf9f8f7    ....    DCD    4210686199
        0x00003098:    fefdfcfb    ....    DCD    4278058235
        0x0000309c:    00ff        ..      DCW    255
    .constdata
    Tbl
        0x0000309e:    00c7        ..      DCW    199
        0x000030a0:    00e900fc    ....    DCD    15270140
        0x000030a4:    00e400e2    ....    DCD    14942434
        0x000030a8:    00e500e0    ....    DCD    15007968
        0x000030ac:    00ea00e7    ....    DCD    15335655
        0x000030b0:    00e800eb    ....    DCD    15204587
        0x000030b4:    00ee00ef    ....    DCD    15597807
        0x000030b8:    00c400ec    ....    DCD    12845292
        0x000030bc:    00c900c5    ....    DCD    13172933
        0x000030c0:    00c600e6    ....    DCD    12976358
        0x000030c4:    00f600f4    ....    DCD    16122100
        0x000030c8:    00fb00f2    ....    DCD    16449778
        0x000030cc:    00ff00f9    ....    DCD    16711929
        0x000030d0:    00dc00d6    ....    DCD    14418134
        0x000030d4:    00a300a2    ....    DCD    10682530
        0x000030d8:    20a700a5    ...     DCD    547815589
        0x000030dc:    00e10192    ....    DCD    14746002
        0x000030e0:    00f300ed    ....    DCD    15925485
        0x000030e4:    00f100fa    ....    DCD    15794426
        0x000030e8:    00aa00d1    ....    DCD    11141329
        0x000030ec:    00bf00ba    ....    DCD    12517562
        0x000030f0:    00ac2310    .#..    DCD    11281168
        0x000030f4:    00bc00bd    ....    DCD    12320957
        0x000030f8:    00ab00a1    ....    DCD    11206817
        0x000030fc:    259100bb    ...%    DCD    630259899
        0x00003100:    25932592    .%.%    DCD    630400402
        0x00003104:    25242502    .%$%    DCD    623125762
        0x00003108:    25622561    a%b%    DCD    627189089
        0x0000310c:    25552556    V%U%    DCD    626337110
        0x00003110:    25512563    c%Q%    DCD    626074979
        0x00003114:    255d2557    W%]%    DCD    626861399
        0x00003118:    255b255c    \%[%    DCD    626730332
        0x0000311c:    25142510    .%.%    DCD    622077200
        0x00003120:    252c2534    4%,%    DCD    623650100
        0x00003124:    2500251c    .%.%    DCD    620766492
        0x00003128:    255e253c    <%^%    DCD    626926908
        0x0000312c:    255a255f    _%Z%    DCD    626664799
        0x00003130:    25692554    T%i%    DCD    627647828
        0x00003134:    25602566    f%`%    DCD    627058022
        0x00003138:    256c2550    P%l%    DCD    627844432
        0x0000313c:    25682567    g%h%    DCD    627582311
        0x00003140:    25652564    d%e%    DCD    627385700
        0x00003144:    25582559    Y%X%    DCD    626533721
        0x00003148:    25532552    R%S%    DCD    626206034
        0x0000314c:    256a256b    k%j%    DCD    627713387
        0x00003150:    250c2518    .%.%    DCD    621552920
        0x00003154:    25842588    .%.%    DCD    629417352
        0x00003158:    2590258c    .%.%    DCD    630203788
        0x0000315c:    03b12580    .%..    DCD    61941120
        0x00003160:    039300df    ....    DCD    59965663
        0x00003164:    03a303c0    ....    DCD    61014976
        0x00003168:    00b503c3    ....    DCD    11862979
        0x0000316c:    03a603c4    ....    DCD    61211588
        0x00003170:    03a90398    ....    DCD    61408152
        0x00003174:    221e03b4    ..."    DCD    572392372
        0x00003178:    03b503c6    ....    DCD    62194630
        0x0000317c:    22612229    )"a"    DCD    576791081
        0x00003180:    226500b1    ..e"    DCD    577044657
        0x00003184:    23202264    d" #    DCD    589308516
        0x00003188:    00f72321    !#..    DCD    16196385
        0x0000318c:    00b02248    H"..    DCD    11543112
        0x00003190:    00b72219    ."..    DCD    12001817
        0x00003194:    207f221a    .".     DCD    545202714
        0x00003198:    25a000b2    ...%    DCD    631242930
        0x0000319c:    00a0        ..      DCW    160
    tbl_lower
        0x0000319e:    0061        a.      DCW    97
        0x000031a0:    00630062    b.c.    DCD    6488162
        0x000031a4:    00650064    d.e.    DCD    6619236
        0x000031a8:    00670066    f.g.    DCD    6750310
        0x000031ac:    00690068    h.i.    DCD    6881384
        0x000031b0:    006b006a    j.k.    DCD    7012458
        0x000031b4:    006d006c    l.m.    DCD    7143532
        0x000031b8:    006f006e    n.o.    DCD    7274606
        0x000031bc:    00710070    p.q.    DCD    7405680
        0x000031c0:    00730072    r.s.    DCD    7536754
        0x000031c4:    00750074    t.u.    DCD    7667828
        0x000031c8:    00770076    v.w.    DCD    7798902
        0x000031cc:    00790078    x.y.    DCD    7929976
        0x000031d0:    00a1007a    z...    DCD    10551418
        0x000031d4:    00a300a2    ....    DCD    10682530
        0x000031d8:    00ac00a5    ....    DCD    11272357
        0x000031dc:    00e000af    ....    DCD    14680239
        0x000031e0:    00e200e1    ....    DCD    14811361
        0x000031e4:    00e400e3    ....    DCD    14942435
        0x000031e8:    00e600e5    ....    DCD    15073509
        0x000031ec:    00e800e7    ....    DCD    15204583
        0x000031f0:    00ea00e9    ....    DCD    15335657
        0x000031f4:    00ec00eb    ....    DCD    15466731
        0x000031f8:    00ee00ed    ....    DCD    15597805
        0x000031fc:    00f000ef    ....    DCD    15728879
        0x00003200:    00f200f1    ....    DCD    15859953
        0x00003204:    00f400f3    ....    DCD    15991027
        0x00003208:    00f600f5    ....    DCD    16122101
        0x0000320c:    00f900f8    ....    DCD    16318712
        0x00003210:    00fb00fa    ....    DCD    16449786
        0x00003214:    00fd00fc    ....    DCD    16580860
        0x00003218:    00ff00fe    ....    DCD    16711934
        0x0000321c:    01030101    ....    DCD    16974081
        0x00003220:    01070105    ....    DCD    17236229
        0x00003224:    010b0109    ....    DCD    17498377
        0x00003228:    010f010d    ....    DCD    17760525
        0x0000322c:    01130111    ....    DCD    18022673
        0x00003230:    01170115    ....    DCD    18284821
        0x00003234:    011b0119    ....    DCD    18546969
        0x00003238:    011f011d    ....    DCD    18809117
        0x0000323c:    01230121    !.#.    DCD    19071265
        0x00003240:    01270125    %.'.    DCD    19333413
        0x00003244:    012b0129    ).+.    DCD    19595561
        0x00003248:    012f012d    -./.    DCD    19857709
        0x0000324c:    01330131    1.3.    DCD    20119857
        0x00003250:    01370135    5.7.    DCD    20382005
        0x00003254:    013c013a    :.<.    DCD    20709690
        0x00003258:    0140013e    >.@.    DCD    20971838
        0x0000325c:    01440142    B.D.    DCD    21233986
        0x00003260:    01480146    F.H.    DCD    21496134
        0x00003264:    014d014b    K.M.    DCD    21823819
        0x00003268:    0151014f    O.Q.    DCD    22085967
        0x0000326c:    01550153    S.U.    DCD    22348115
        0x00003270:    01590157    W.Y.    DCD    22610263
        0x00003274:    015d015b    [.].    DCD    22872411
        0x00003278:    0161015f    _.a.    DCD    23134559
        0x0000327c:    01650163    c.e.    DCD    23396707
        0x00003280:    01690167    g.i.    DCD    23658855
        0x00003284:    016d016b    k.m.    DCD    23921003
        0x00003288:    0171016f    o.q.    DCD    24183151
        0x0000328c:    01750173    s.u.    DCD    24445299
        0x00003290:    017a0177    w.z.    DCD    24772983
        0x00003294:    017e017c    |.~.    DCD    25035132
        0x00003298:    03b10192    ....    DCD    61931922
        0x0000329c:    03b303b2    ....    DCD    62063538
        0x000032a0:    03b503b4    ....    DCD    62194612
        0x000032a4:    03b703b6    ....    DCD    62325686
        0x000032a8:    03b903b8    ....    DCD    62456760
        0x000032ac:    03bb03ba    ....    DCD    62587834
        0x000032b0:    03bd03bc    ....    DCD    62718908
        0x000032b4:    03bf03be    ....    DCD    62849982
        0x000032b8:    03c103c0    ....    DCD    62981056
        0x000032bc:    03c403c3    ....    DCD    63177667
        0x000032c0:    03c603c5    ....    DCD    63308741
        0x000032c4:    03c803c7    ....    DCD    63439815
        0x000032c8:    03ca03c9    ....    DCD    63570889
        0x000032cc:    04310430    0.1.    DCD    70321200
        0x000032d0:    04330432    2.3.    DCD    70452274
        0x000032d4:    04350434    4.5.    DCD    70583348
        0x000032d8:    04370436    6.7.    DCD    70714422
        0x000032dc:    04390438    8.9.    DCD    70845496
        0x000032e0:    043b043a    :.;.    DCD    70976570
        0x000032e4:    043d043c    <.=.    DCD    71107644
        0x000032e8:    043f043e    >.?.    DCD    71238718
        0x000032ec:    04410440    @.A.    DCD    71369792
        0x000032f0:    04430442    B.C.    DCD    71500866
        0x000032f4:    04450444    D.E.    DCD    71631940
        0x000032f8:    04470446    F.G.    DCD    71763014
        0x000032fc:    04490448    H.I.    DCD    71894088
        0x00003300:    044b044a    J.K.    DCD    72025162
        0x00003304:    044d044c    L.M.    DCD    72156236
        0x00003308:    044f044e    N.O.    DCD    72287310
        0x0000330c:    04520451    Q.R.    DCD    72483921
        0x00003310:    04540453    S.T.    DCD    72614995
        0x00003314:    04560455    U.V.    DCD    72746069
        0x00003318:    04580457    W.X.    DCD    72877143
        0x0000331c:    045a0459    Y.Z.    DCD    73008217
        0x00003320:    045c045b    [.\.    DCD    73139291
        0x00003324:    045f045e    ^._.    DCD    73335902
        0x00003328:    21712170    p!q!    DCD    561062256
        0x0000332c:    21732172    r!s!    DCD    561193330
        0x00003330:    21752174    t!u!    DCD    561324404
        0x00003334:    21772176    v!w!    DCD    561455478
        0x00003338:    21792178    x!y!    DCD    561586552
        0x0000333c:    217b217a    z!{!    DCD    561717626
        0x00003340:    217d217c    |!}!    DCD    561848700
        0x00003344:    217f217e    ~!.!    DCD    561979774
        0x00003348:    ff42ff41    A.B.    DCD    4282580801
        0x0000334c:    ff44ff43    C.D.    DCD    4282711875
        0x00003350:    ff46ff45    E.F.    DCD    4282842949
        0x00003354:    ff48ff47    G.H.    DCD    4282974023
        0x00003358:    ff4aff49    I.J.    DCD    4283105097
        0x0000335c:    ff4cff4b    K.L.    DCD    4283236171
        0x00003360:    ff4eff4d    M.N.    DCD    4283367245
        0x00003364:    ff50ff4f    O.P.    DCD    4283498319
        0x00003368:    ff52ff51    Q.R.    DCD    4283629393
        0x0000336c:    ff54ff53    S.T.    DCD    4283760467
        0x00003370:    ff56ff55    U.V.    DCD    4283891541
        0x00003374:    ff58ff57    W.X.    DCD    4284022615
        0x00003378:    ff5aff59    Y.Z.    DCD    4284153689
        0x0000337c:    0000        ..      DCW    0
    tbl_upper
        0x0000337e:    0041        A.      DCW    65
        0x00003380:    00430042    B.C.    DCD    4390978
        0x00003384:    00450044    D.E.    DCD    4522052
        0x00003388:    00470046    F.G.    DCD    4653126
        0x0000338c:    00490048    H.I.    DCD    4784200
        0x00003390:    004b004a    J.K.    DCD    4915274
        0x00003394:    004d004c    L.M.    DCD    5046348
        0x00003398:    004f004e    N.O.    DCD    5177422
        0x0000339c:    00510050    P.Q.    DCD    5308496
        0x000033a0:    00530052    R.S.    DCD    5439570
        0x000033a4:    00550054    T.U.    DCD    5570644
        0x000033a8:    00570056    V.W.    DCD    5701718
        0x000033ac:    00590058    X.Y.    DCD    5832792
        0x000033b0:    0021005a    Z.!.    DCD    2162778
        0x000033b4:    ffe1ffe0    ....    DCD    4293001184
        0x000033b8:    ffe2ffe5    ....    DCD    4293066725
        0x000033bc:    00c0ffe3    ....    DCD    12648419
        0x000033c0:    00c200c1    ....    DCD    12714177
        0x000033c4:    00c400c3    ....    DCD    12845251
        0x000033c8:    00c600c5    ....    DCD    12976325
        0x000033cc:    00c800c7    ....    DCD    13107399
        0x000033d0:    00ca00c9    ....    DCD    13238473
        0x000033d4:    00cc00cb    ....    DCD    13369547
        0x000033d8:    00ce00cd    ....    DCD    13500621
        0x000033dc:    00d000cf    ....    DCD    13631695
        0x000033e0:    00d200d1    ....    DCD    13762769
        0x000033e4:    00d400d3    ....    DCD    13893843
        0x000033e8:    00d600d5    ....    DCD    14024917
        0x000033ec:    00d900d8    ....    DCD    14221528
        0x000033f0:    00db00da    ....    DCD    14352602
        0x000033f4:    00dd00dc    ....    DCD    14483676
        0x000033f8:    017800de    ..x.    DCD    24641758
        0x000033fc:    01020100    ....    DCD    16908544
        0x00003400:    01060104    ....    DCD    17170692
        0x00003404:    010a0108    ....    DCD    17432840
        0x00003408:    010e010c    ....    DCD    17694988
        0x0000340c:    01120110    ....    DCD    17957136
        0x00003410:    01160114    ....    DCD    18219284
        0x00003414:    011a0118    ....    DCD    18481432
        0x00003418:    011e011c    ....    DCD    18743580
        0x0000341c:    01220120     .".    DCD    19005728
        0x00003420:    01260124    $.&.    DCD    19267876
        0x00003424:    012a0128    (.*.    DCD    19530024
        0x00003428:    012e012c    ,...    DCD    19792172
        0x0000342c:    01320130    0.2.    DCD    20054320
        0x00003430:    01360134    4.6.    DCD    20316468
        0x00003434:    013b0139    9.;.    DCD    20644153
        0x00003438:    013f013d    =.?.    DCD    20906301
        0x0000343c:    01430141    A.C.    DCD    21168449
        0x00003440:    01470145    E.G.    DCD    21430597
        0x00003444:    014c014a    J.L.    DCD    21758282
        0x00003448:    0150014e    N.P.    DCD    22020430
        0x0000344c:    01540152    R.T.    DCD    22282578
        0x00003450:    01580156    V.X.    DCD    22544726
        0x00003454:    015c015a    Z.\.    DCD    22806874
        0x00003458:    0160015e    ^.`.    DCD    23069022
        0x0000345c:    01640162    b.d.    DCD    23331170
        0x00003460:    01680166    f.h.    DCD    23593318
        0x00003464:    016c016a    j.l.    DCD    23855466
        0x00003468:    0170016e    n.p.    DCD    24117614
        0x0000346c:    01740172    r.t.    DCD    24379762
        0x00003470:    01790176    v.y.    DCD    24707446
        0x00003474:    017d017b    {.}.    DCD    24969595
        0x00003478:    03910191    ....    DCD    59834769
        0x0000347c:    03930392    ....    DCD    59966354
        0x00003480:    03950394    ....    DCD    60097428
        0x00003484:    03970396    ....    DCD    60228502
        0x00003488:    03990398    ....    DCD    60359576
        0x0000348c:    039b039a    ....    DCD    60490650
        0x00003490:    039d039c    ....    DCD    60621724
        0x00003494:    039f039e    ....    DCD    60752798
        0x00003498:    03a103a0    ....    DCD    60883872
        0x0000349c:    03a403a3    ....    DCD    61080483
        0x000034a0:    03a603a5    ....    DCD    61211557
        0x000034a4:    03a803a7    ....    DCD    61342631
        0x000034a8:    03aa03a9    ....    DCD    61473705
        0x000034ac:    04110410    ....    DCD    68224016
        0x000034b0:    04130412    ....    DCD    68355090
        0x000034b4:    04150414    ....    DCD    68486164
        0x000034b8:    04170416    ....    DCD    68617238
        0x000034bc:    04190418    ....    DCD    68748312
        0x000034c0:    041b041a    ....    DCD    68879386
        0x000034c4:    041d041c    ....    DCD    69010460
        0x000034c8:    041f041e    ....    DCD    69141534
        0x000034cc:    04210420     .!.    DCD    69272608
        0x000034d0:    04230422    ".#.    DCD    69403682
        0x000034d4:    04250424    $.%.    DCD    69534756
        0x000034d8:    04270426    &.'.    DCD    69665830
        0x000034dc:    04290428    (.).    DCD    69796904
        0x000034e0:    042b042a    *.+.    DCD    69927978
        0x000034e4:    042d042c    ,.-.    DCD    70059052
        0x000034e8:    042f042e    ../.    DCD    70190126
        0x000034ec:    04020401    ....    DCD    67240961
        0x000034f0:    04040403    ....    DCD    67372035
        0x000034f4:    04060405    ....    DCD    67503109
        0x000034f8:    04080407    ....    DCD    67634183
        0x000034fc:    040a0409    ....    DCD    67765257
        0x00003500:    040c040b    ....    DCD    67896331
        0x00003504:    040f040e    ....    DCD    68092942
        0x00003508:    21612160    `!a!    DCD    560013664
        0x0000350c:    21632162    b!c!    DCD    560144738
        0x00003510:    21652164    d!e!    DCD    560275812
        0x00003514:    21672166    f!g!    DCD    560406886
        0x00003518:    21692168    h!i!    DCD    560537960
        0x0000351c:    216b216a    j!k!    DCD    560669034
        0x00003520:    216d216c    l!m!    DCD    560800108
        0x00003524:    216f216e    n!o!    DCD    560931182
        0x00003528:    ff22ff21    !.".    DCD    4280483617
        0x0000352c:    ff24ff23    #.$.    DCD    4280614691
        0x00003530:    ff26ff25    %.&.    DCD    4280745765
        0x00003534:    ff28ff27    '.(.    DCD    4280876839
        0x00003538:    ff2aff29    ).*.    DCD    4281007913
        0x0000353c:    ff2cff2b    +.,.    DCD    4281138987
        0x00003540:    ff2eff2d    -...    DCD    4281270061
        0x00003544:    ff30ff2f    /.0.    DCD    4281401135
        0x00003548:    ff32ff31    1.2.    DCD    4281532209
        0x0000354c:    ff34ff33    3.4.    DCD    4281663283
        0x00003550:    ff36ff35    5.6.    DCD    4281794357
        0x00003554:    ff38ff37    7.8.    DCD    4281925431
        0x00003558:    ff3aff39    9.:.    DCD    4282056505
        0x0000355c:    00000000    ....    DCD    0
    Region$$Table$$Base
        0x00003560:    00003580    .5..    DCD    13696
        0x00003564:    20000000    ...     DCD    536870912
        0x00003568:    0000001c    ....    DCD    28
        0x0000356c:    00000154    T...    DCD    340
        0x00003570:    0000359c    .5..    DCD    13724
        0x00003574:    2000001c    ...     DCD    536870940
        0x00003578:    0000206c    l ..    DCD    8300
        0x0000357c:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 13748 (0x35b4)
    Size        : 28 bytes (0x1c)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x2000001c
    File Offset : 13776 (0x35d0)
    Size        : 8300 bytes (0x206c)
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
    File Offset : 13776 (0x35d0)
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
    File Offset : 15252 (0x3b94)
    Size        : 4488 bytes (0x1188)
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
    File Offset : 19740 (0x4d1c)
    Size        : 101456 bytes (0x18c50)
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
    File Offset : 121196 (0x1d96c)
    Size        : 24404 bytes (0x5f54)
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
    File Offset : 145600 (0x238c0)
    Size        : 12740 bytes (0x31c4)
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
    File Offset : 158340 (0x26a84)
    Size        : 11684 bytes (0x2da4)
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
    File Offset : 170024 (0x29828)
    Size        : 2982 bytes (0xba6)
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
    File Offset : 173008 (0x2a3d0)
    Size        : 11616 bytes (0x2d60)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 529
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 184624 (0x2d130)
    Size        : 8856 bytes (0x2298)
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
    File Offset : 193480 (0x2f3c8)
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
    File Offset : 193516 (0x2f3ec)
    Size        : 17284 bytes (0x4384)
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
    
    p5a7c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p5a7c-2
    
    
    
    main.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    
    
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_gpio.o --vfemode=force

    Input Comments:
    
    p53ec-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p53ec-2
    
    
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p5ce8-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p5ce8-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p2374-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p2374-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    spi_driver_sd.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\spi_driver_sd.o --vfemode=force

    Input Comments:
    
    p54ec-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p54ec-2
    
    
    
    spi_driver_sd.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\spi_driver_sd.o --depend=.\objects\spi_driver_sd.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\spi_driver_sd.crf src\spi_driver_sd.c
    
    
    diskio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\diskio.o --depend=.\objects\diskio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\diskio.crf ..\..\..\ELF2_BSP\FatFs11a\src\diskio.c
    
    ff.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\ff.o --depend=.\objects\ff.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\ff.crf ..\..\..\ELF2_BSP\FatFs11a\src\ff.c
    
    ccsbcs.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\ccsbcs.o --depend=.\objects\ccsbcs.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I..\..\..\ELF2_BSP\FatFs11a\src -IG:\ELF2_SOC_Shanghai\trunk\Demo\SPIM_Demo\SDK_SPIM\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\ccsbcs.crf ..\..\..\ELF2_BSP\FatFs11a\src\option\ccsbcs.c
    
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
    
    
    
    
    
    spim.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\spim.o --vfemode=force

    Input Comments:
    
    p63e4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p63e4-2
    
    
    
    spim.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\spim.o --depend=.\objects\spim.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\spim.crf ..\sdk\src\soc\driver\spim.c
    
    
    
    
    
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
    File Offset : 210800 (0x33770)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x0000309e  0x100      Tbl                                      array[128] of const WCHAR

address     size       variable name                            type
0x20000018  0x4        FatFs                                    array[1] of pointer to FATFS

address     size       variable name                            type
0x20000014  0x2        Fsid                                     WORD

address     size       variable name                            type
0x20001928  0x200      LfnBuf                                   array[256] of WCHAR

address     size       variable name                            type
0x00003010  0xd        LfnOfs                                   array[13] of const BYTE

address     size       variable name                            type
0x20000010  0x1        SD_Type                                  uint8_t

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x20001470  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x20001470  0x10       _SEGGER_RTT.acID                         array[16] of char
0x20001480  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x20001484  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x20001488  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x200014d0  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x20001918  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x20001518  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x2000000c  0x4        __stdout                                 FILE
0x2000000c  0x4        __stdout.handle                          int

address     size       variable name                            type
0x20000008  0x4        SystemCoreClock                          uint32_t

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000004  0x4        br                                       UINT

address     size       variable name                            type
0x20000470  0x1000     buffer                                   array[4096] of char

address     size       variable name                            type
0x00000000  0x4        bw                                       UINT

address     size       variable name                            type
0x00000000  0x224      fdst                                     FIL
0x00000000  0x4        fdst.fs                                  pointer to FATFS
0x00000004  0x2        fdst.id                                  WORD
0x00000006  0x1        fdst.flag                                BYTE
0x00000007  0x1        fdst.pad1                                BYTE
0x00000008  0x4        fdst.fptr                                DWORD
0x0000000c  0x4        fdst.fsize                               DWORD
0x00000010  0x4        fdst.sclust                              DWORD
0x00000014  0x4        fdst.clust                               DWORD
0x00000018  0x4        fdst.dsect                               DWORD
0x0000001c  0x4        fdst.dir_sect                            DWORD
0x00000020  0x4        fdst.dir_ptr                             pointer to BYTE
0x00000024  0x200      fdst.buf                                 array[512] of BYTE

address     size       variable name                            type
0x2000001c  0x230      fs                                       FATFS
0x2000001c  0x1        fs.fs_type                               BYTE
0x2000001d  0x1        fs.drv                                   BYTE
0x2000001e  0x1        fs.csize                                 BYTE
0x2000001f  0x1        fs.n_fats                                BYTE
0x20000020  0x1        fs.wflag                                 BYTE
0x20000021  0x1        fs.fsi_flag                              BYTE
0x20000022  0x2        fs.id                                    WORD
0x20000024  0x2      * fs.n_rootdir                             WORD
0x20000028  0x4        fs.last_clust                            DWORD
0x2000002c  0x4        fs.free_clust                            DWORD
0x20000030  0x4        fs.fsi_sector                            DWORD
0x20000034  0x4        fs.n_fatent                              DWORD
0x20000038  0x4        fs.fsize                                 DWORD
0x2000003c  0x4        fs.fatbase                               DWORD
0x20000040  0x4        fs.dirbase                               DWORD
0x20000044  0x4        fs.database                              DWORD
0x20000048  0x4        fs.winsect                               DWORD
0x2000004c  0x200      fs.win                                   array[512] of BYTE

address     size       variable name                            type
0x2000024c  0x224      fsrc                                     FIL
0x2000024c  0x4        fsrc.fs                                  pointer to FATFS
0x20000250  0x2        fsrc.id                                  WORD
0x20000252  0x1        fsrc.flag                                BYTE
0x20000253  0x1        fsrc.pad1                                BYTE
0x20000254  0x4        fsrc.fptr                                DWORD
0x20000258  0x4        fsrc.fsize                               DWORD
0x2000025c  0x4        fsrc.sclust                              DWORD
0x20000260  0x4        fsrc.clust                               DWORD
0x20000264  0x4        fsrc.dsect                               DWORD
0x20000268  0x4        fsrc.dir_sect                            DWORD
0x2000026c  0x4        fsrc.dir_ptr                             pointer to BYTE
0x20000270  0x200      fsrc.buf                                 array[512] of BYTE

address     size       variable name                            type
0x00000000  0x200      path0                                    array[512] of char

address     size       variable name                            type
0x20000000  0x1        res                                      FRESULT

address     size       variable name                            type
0x00000000  0x37       textFileBuffer                           array[55] of uint8_t

