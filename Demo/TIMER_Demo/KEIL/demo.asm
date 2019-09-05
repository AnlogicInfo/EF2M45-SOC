
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

    Program header offset: 173316 (0x0002a504)
    Section header offset: 173348 (0x0002a524)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 5540 bytes (0x15a4)
    Size in memory: 8128 bytes (0x1fc0)
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
    Size        : 5248 bytes (0x1480)
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
        0x0000014c:    0000142c    ,...    DCD    5164
        0x00000150:    0000144c    L...    DCD    5196
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
        0x00000194:    f00081c1    ....    BEQ.W    _printf_string ; 0x51a
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
        0x000001a4:    f000fa44    ..D.    BL       __user_setup_stackheap ; 0x630
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
        0x000001ae:    f001f93f    ..?.    BL       main ; 0x1430
        0x000001b2:    f000fa62    ..b.    BL       exit ; 0x67a
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
        0x000001be:    f000f93b    ..;.    BL       _sys_exit ; 0x438
        0x000001c2:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x1009
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
        0x000001e0:    4804        .H      LDR      r0,[pc,#16] ; [0x1f4] = 0x20000528
        0x000001e2:    4905        .I      LDR      r1,[pc,#20] ; [0x1f8] = 0x20000a28
        0x000001e4:    4a05        .J      LDR      r2,[pc,#20] ; [0x1fc] = 0x20000628
        0x000001e6:    4b06        .K      LDR      r3,[pc,#24] ; [0x200] = 0x20000628
        0x000001e8:    4770        pG      BX       lr
    $d
        0x000001ea:    0000        ..      DCW    0
        0x000001ec:    00001009    ....    DCD    4105
        0x000001f0:    00000119    ....    DCD    281
        0x000001f4:    20000528    (..     DCD    536872232
        0x000001f8:    20000a28    (..     DCD    536873512
        0x000001fc:    20000628    (..     DCD    536872488
        0x00000200:    20000628    (..     DCD    536872488
    $t
    .text
    __2printf
        0x00000204:    b40f        ..      PUSH     {r0-r3}
        0x00000206:    4904        .I      LDR      r1,[pc,#16] ; [0x218] = 0x20000004
        0x00000208:    b510        ..      PUSH     {r4,lr}
        0x0000020a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000020c:    9802        ..      LDR      r0,[sp,#8]
        0x0000020e:    f000f989    ....    BL       _printf_char_file ; 0x524
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
        0x0000033c:    f000b882    ....    B.W      _printf_int_common ; 0x444
    $d
        0x00000340:    00000000    ....    DCD    0
        0x00000344:    0000002d    -...    DCD    45
        0x00000348:    0000002b    +...    DCD    43
        0x0000034c:    00000020     ...    DCD    32
    $t
    .text
    abort
        0x00000350:    2000        .       MOVS     r0,#0
        0x00000352:    f000f8f9    ....    BL       __rt_SIGABRT ; 0x548
        0x00000356:    f7ffff23    ..#.    BL       __rt_lib_shutdown ; 0x1a0
        0x0000035a:    2001        .       MOVS     r0,#1
        0x0000035c:    f000f86c    ..l.    BL       _sys_exit ; 0x438
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
        0x000003e4:    f00080b7    ....    BEQ.W    __aeabi_memcpy4 ; 0x556
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
    __use_two_region_memory
        0x00000432:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000434:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x00000436:    4770        pG      BX       lr
    .text
    _sys_exit
        0x00000438:    4901        .I      LDR      r1,[pc,#4] ; [0x440] = 0x20026
        0x0000043a:    2018        .       MOVS     r0,#0x18
        0x0000043c:    beab        ..      BKPT     #0xab
        0x0000043e:    e7fe        ..      B        0x43e ; _sys_exit + 6
    $d
        0x00000440:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x00000444:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000448:    460d        .F      MOV      r5,r1
        0x0000044a:    4699        .F      MOV      r9,r3
        0x0000044c:    4692        .F      MOV      r10,r2
        0x0000044e:    4604        .F      MOV      r4,r0
        0x00000450:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x00000454:    6801        .h      LDR      r1,[r0,#0]
        0x00000456:    0688        ..      LSLS     r0,r1,#26
        0x00000458:    d504        ..      BPL      0x464 ; _printf_int_common + 32
        0x0000045a:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x0000045c:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000460:    6021        !`      STR      r1,[r4,#0]
        0x00000462:    e000        ..      B        0x466 ; _printf_int_common + 34
        0x00000464:    2001        .       MOVS     r0,#1
        0x00000466:    42a8        .B      CMP      r0,r5
        0x00000468:    dd01        ..      BLE      0x46e ; _printf_int_common + 42
        0x0000046a:    1b47        G.      SUBS     r7,r0,r5
        0x0000046c:    e000        ..      B        0x470 ; _printf_int_common + 44
        0x0000046e:    2700        .'      MOVS     r7,#0
        0x00000470:    69a1        .i      LDR      r1,[r4,#0x18]
        0x00000472:    197a        z.      ADDS     r2,r7,r5
        0x00000474:    eb020009    ....    ADD      r0,r2,r9
        0x00000478:    1a08        ..      SUBS     r0,r1,r0
        0x0000047a:    61a0        .a      STR      r0,[r4,#0x18]
        0x0000047c:    7820         x      LDRB     r0,[r4,#0]
        0x0000047e:    06c0        ..      LSLS     r0,r0,#27
        0x00000480:    d402        ..      BMI      0x488 ; _printf_int_common + 68
        0x00000482:    4620         F      MOV      r0,r4
        0x00000484:    f3af8000    ....    NOP.W    
        0x00000488:    2600        .&      MOVS     r6,#0
        0x0000048a:    e008        ..      B        0x49e ; _printf_int_common + 90
        0x0000048c:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000490:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x00000494:    4790        .G      BLX      r2
        0x00000496:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000498:    1c40        @.      ADDS     r0,r0,#1
        0x0000049a:    1c76        v.      ADDS     r6,r6,#1
        0x0000049c:    6220         b      STR      r0,[r4,#0x20]
        0x0000049e:    454e        NE      CMP      r6,r9
        0x000004a0:    dbf4        ..      BLT      0x48c ; _printf_int_common + 72
        0x000004a2:    7820         x      LDRB     r0,[r4,#0]
        0x000004a4:    06c0        ..      LSLS     r0,r0,#27
        0x000004a6:    d50a        ..      BPL      0x4be ; _printf_int_common + 122
        0x000004a8:    4620         F      MOV      r0,r4
        0x000004aa:    f3af8000    ....    NOP.W    
        0x000004ae:    e006        ..      B        0x4be ; _printf_int_common + 122
        0x000004b0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004b4:    2030        0       MOVS     r0,#0x30
        0x000004b6:    4790        .G      BLX      r2
        0x000004b8:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004ba:    1c40        @.      ADDS     r0,r0,#1
        0x000004bc:    6220         b      STR      r0,[r4,#0x20]
        0x000004be:    1e38        8.      SUBS     r0,r7,#0
        0x000004c0:    f1a70701    ....    SUB      r7,r7,#1
        0x000004c4:    dcf4        ..      BGT      0x4b0 ; _printf_int_common + 108
        0x000004c6:    e007        ..      B        0x4d8 ; _printf_int_common + 148
        0x000004c8:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004cc:    f8180005    ....    LDRB     r0,[r8,r5]
        0x000004d0:    4790        .G      BLX      r2
        0x000004d2:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004d4:    1c40        @.      ADDS     r0,r0,#1
        0x000004d6:    6220         b      STR      r0,[r4,#0x20]
        0x000004d8:    1e28        (.      SUBS     r0,r5,#0
        0x000004da:    f1a50501    ....    SUB      r5,r5,#1
        0x000004de:    dcf3        ..      BGT      0x4c8 ; _printf_int_common + 132
        0x000004e0:    4620         F      MOV      r0,r4
        0x000004e2:    f3af8000    ....    NOP.W    
        0x000004e6:    7820         x      LDRB     r0,[r4,#0]
        0x000004e8:    0600        ..      LSLS     r0,r0,#24
        0x000004ea:    d502        ..      BPL      0x4f2 ; _printf_int_common + 174
        0x000004ec:    2002        .       MOVS     r0,#2
        0x000004ee:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000004f2:    2001        .       MOVS     r0,#1
        0x000004f4:    e7fb        ..      B        0x4ee ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x000004f6:    b510        ..      PUSH     {r4,lr}
        0x000004f8:    6943        Ci      LDR      r3,[r0,#0x14]
        0x000004fa:    b113        ..      CBZ      r3,0x502 ; _printf_cs_common + 12
        0x000004fc:    f3af8000    ....    NOP.W    
        0x00000500:    e001        ..      B        0x506 ; _printf_cs_common + 16
        0x00000502:    f7fffebf    ....    BL       _printf_str ; 0x284
        0x00000506:    2001        .       MOVS     r0,#1
        0x00000508:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x0000050a:    7812        .x      LDRB     r2,[r2,#0]
        0x0000050c:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000510:    700a        .p      STRB     r2,[r1,#0]
        0x00000512:    2200        ."      MOVS     r2,#0
        0x00000514:    704a        Jp      STRB     r2,[r1,#1]
        0x00000516:    2201        ."      MOVS     r2,#1
        0x00000518:    e7ed        ..      B        _printf_cs_common ; 0x4f6
    _printf_string
        0x0000051a:    6811        .h      LDR      r1,[r2,#0]
        0x0000051c:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000520:    e7e9        ..      B        _printf_cs_common ; 0x4f6
        0x00000522:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x00000524:    4b07        .K      LDR      r3,[pc,#28] ; [0x544] = 0xeaf
        0x00000526:    b570        p.      PUSH     {r4-r6,lr}
        0x00000528:    460d        .F      MOV      r5,r1
        0x0000052a:    447b        {D      ADD      r3,r3,pc
        0x0000052c:    f000f84b    ..K.    BL       _printf_char_common ; 0x5c6
        0x00000530:    4604        .F      MOV      r4,r0
        0x00000532:    4628        (F      MOV      r0,r5
        0x00000534:    f000f85a    ..Z.    BL       ferror ; 0x5ec
        0x00000538:    b110        ..      CBZ      r0,0x540 ; _printf_char_file + 28
        0x0000053a:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0000053e:    bd70        p.      POP      {r4-r6,pc}
        0x00000540:    4620         F      MOV      r0,r4
        0x00000542:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000544:    00000eaf    ....    DCD    3759
    $t
    .text
    __rt_SIGABRT
        0x00000548:    b510        ..      PUSH     {r4,lr}
        0x0000054a:    f000f859    ..Y.    BL       __rt_SIGABRT_inner ; 0x600
        0x0000054e:    e8bd4010    ...@    POP      {r4,lr}
        0x00000552:    f000b84f    ..O.    B.W      __sig_exit ; 0x5f4
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x00000556:    b510        ..      PUSH     {r4,lr}
        0x00000558:    3a20         :      SUBS     r2,r2,#0x20
        0x0000055a:    f0c0800b    ....    BCC.W    0x574 ; __aeabi_memcpy4 + 30
        0x0000055e:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000562:    3a20         :      SUBS     r2,r2,#0x20
        0x00000564:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000568:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000056c:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000570:    f4bfaff5    ....    BCS.W    0x55e ; __aeabi_memcpy4 + 8
        0x00000574:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x00000578:    bf24        $.      ITT      CS
        0x0000057a:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x0000057e:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x00000582:    bf44        D.      ITT      MI
        0x00000584:    c918        ..      LDMMI    r1!,{r3,r4}
        0x00000586:    c018        ..      STMMI    r0!,{r3,r4}
        0x00000588:    e8bd4010    ...@    POP      {r4,lr}
        0x0000058c:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x00000590:    bf24        $.      ITT      CS
        0x00000592:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x00000596:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x0000059a:    bf08        ..      IT       EQ
        0x0000059c:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x0000059e:    07d2        ..      LSLS     r2,r2,#31
        0x000005a0:    bf28        (.      IT       CS
        0x000005a2:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000005a6:    bf48        H.      IT       MI
        0x000005a8:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000005ac:    bf28        (.      IT       CS
        0x000005ae:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000005b2:    bf48        H.      IT       MI
        0x000005b4:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000005b8:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x000005ba:    4770        pG      BX       lr
    .text
    .text
    _printf_input_char
    __semihosting_library_function
        0x000005bc:    6901        .i      LDR      r1,[r0,#0x10]
        0x000005be:    1c4a        J.      ADDS     r2,r1,#1
        0x000005c0:    6102        .a      STR      r2,[r0,#0x10]
        0x000005c2:    7808        .x      LDRB     r0,[r1,#0]
        0x000005c4:    4770        pG      BX       lr
    _printf_char_common
        0x000005c6:    b500        ..      PUSH     {lr}
        0x000005c8:    b08f        ..      SUB      sp,sp,#0x3c
        0x000005ca:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000005ce:    2100        .!      MOVS     r1,#0
        0x000005d0:    9105        ..      STR      r1,[sp,#0x14]
        0x000005d2:    4905        .I      LDR      r1,[pc,#20] ; [0x5e8] = 0xffffffe5
        0x000005d4:    4479        yD      ADD      r1,r1,pc
        0x000005d6:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x000005da:    4611        .F      MOV      r1,r2
        0x000005dc:    4668        hF      MOV      r0,sp
        0x000005de:    f7fffe1d    ....    BL       __printf ; 0x21c
        0x000005e2:    b00f        ..      ADD      sp,sp,#0x3c
        0x000005e4:    bd00        ..      POP      {pc}
    $d
        0x000005e6:    0000        ..      DCW    0
        0x000005e8:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x000005ec:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x000005ee:    f0000080    ....    AND      r0,r0,#0x80
        0x000005f2:    4770        pG      BX       lr
    .text
    __sig_exit
        0x000005f4:    2800        .(      CMP      r0,#0
        0x000005f6:    d001        ..      BEQ      0x5fc ; __sig_exit + 8
        0x000005f8:    f7ffbf1e    ....    B.W      _sys_exit ; 0x438
        0x000005fc:    4770        pG      BX       lr
        0x000005fe:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x00000600:    b510        ..      PUSH     {r4,lr}
        0x00000602:    2100        .!      MOVS     r1,#0
        0x00000604:    a002        ..      ADR      r0,{pc}+0xc ; 0x610
        0x00000606:    f000f83e    ..>.    BL       __default_signal_display ; 0x686
        0x0000060a:    2001        .       MOVS     r0,#1
        0x0000060c:    bd10        ..      POP      {r4,pc}
    $d
        0x0000060e:    0000        ..      DCW    0
        0x00000610:    41474953    SIGA    DCD    1095190867
        0x00000614:    3a545242    BRT:    DCD    978604610
        0x00000618:    6e624120     Abn    DCD    1851932960
        0x0000061c:    616d726f    orma    DCD    1634562671
        0x00000620:    6574206c    l te    DCD    1702109292
        0x00000624:    6e696d72    rmin    DCD    1852403058
        0x00000628:    6f697461    atio    DCD    1869182049
        0x0000062c:    0000006e    n...    DCD    110
    $t
    .text
    __user_setup_stackheap
        0x00000630:    4675        uF      MOV      r5,lr
        0x00000632:    f000f849    ..I.    BL       __user_libspace ; 0x6c8
        0x00000636:    46ae        .F      MOV      lr,r5
        0x00000638:    0005        ..      MOVS     r5,r0
        0x0000063a:    4669        iF      MOV      r1,sp
        0x0000063c:    4653        SF      MOV      r3,r10
        0x0000063e:    f0200007     ...    BIC      r0,r0,#7
        0x00000642:    4685        .F      MOV      sp,r0
        0x00000644:    b018        ..      ADD      sp,sp,#0x60
        0x00000646:    b520         .      PUSH     {r5,lr}
        0x00000648:    f7fffdca    ....    BL       __user_initial_stackheap ; 0x1e0
        0x0000064c:    e8bd4020    .. @    POP      {r5,lr}
        0x00000650:    f04f0600    O...    MOV      r6,#0
        0x00000654:    f04f0700    O...    MOV      r7,#0
        0x00000658:    f04f0800    O...    MOV      r8,#0
        0x0000065c:    f04f0b00    O...    MOV      r11,#0
        0x00000660:    f0210107    !...    BIC      r1,r1,#7
        0x00000664:    46ac        .F      MOV      r12,r5
        0x00000666:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000066a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000066e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000672:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000676:    468d        .F      MOV      sp,r1
        0x00000678:    4770        pG      BX       lr
    .text
    exit
        0x0000067a:    4604        .F      MOV      r4,r0
        0x0000067c:    f3af8000    ....    NOP.W    
        0x00000680:    4620         F      MOV      r0,r4
        0x00000682:    f7fffd98    ....    BL       __rt_exit ; 0x1b6
    .text
    __default_signal_display
        0x00000686:    b570        p.      PUSH     {r4-r6,lr}
        0x00000688:    4605        .F      MOV      r5,r0
        0x0000068a:    460c        .F      MOV      r4,r1
        0x0000068c:    200a        .       MOVS     r0,#0xa
        0x0000068e:    e000        ..      B        0x692 ; __default_signal_display + 12
        0x00000690:    1c6d        m.      ADDS     r5,r5,#1
        0x00000692:    f000f811    ....    BL       _ttywrch ; 0x6b8
        0x00000696:    b135        5.      CBZ      r5,0x6a6 ; __default_signal_display + 32
        0x00000698:    7828        (x      LDRB     r0,[r5,#0]
        0x0000069a:    2800        .(      CMP      r0,#0
        0x0000069c:    d1f8        ..      BNE      0x690 ; __default_signal_display + 10
        0x0000069e:    e002        ..      B        0x6a6 ; __default_signal_display + 32
        0x000006a0:    1c64        d.      ADDS     r4,r4,#1
        0x000006a2:    f000f809    ....    BL       _ttywrch ; 0x6b8
        0x000006a6:    b114        ..      CBZ      r4,0x6ae ; __default_signal_display + 40
        0x000006a8:    7820         x      LDRB     r0,[r4,#0]
        0x000006aa:    2800        .(      CMP      r0,#0
        0x000006ac:    d1f8        ..      BNE      0x6a0 ; __default_signal_display + 26
        0x000006ae:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x000006b2:    200a        .       MOVS     r0,#0xa
        0x000006b4:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x000006b8:    b508        ..      PUSH     {r3,lr}
        0x000006ba:    4669        iF      MOV      r1,sp
        0x000006bc:    f88d0000    ....    STRB     r0,[sp,#0]
        0x000006c0:    2003        .       MOVS     r0,#3
        0x000006c2:    beab        ..      BKPT     #0xab
        0x000006c4:    bd08        ..      POP      {r3,pc}
        0x000006c6:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x000006c8:    4800        .H      LDR      r0,[pc,#0] ; [0x6cc] = 0x200004c4
        0x000006ca:    4770        pG      BX       lr
    $d
        0x000006cc:    200004c4    ...     DCD    536872132
    $t
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x000006d0:    4905        .I      LDR      r1,[pc,#20] ; [0x6e8] = 0x88
        0x000006d2:    b510        ..      PUSH     {r4,lr}
        0x000006d4:    3128        (1      ADDS     r1,r1,#0x28
        0x000006d6:    d004        ..      BEQ      0x6e2 ; ADCC0_IRQHandler + 18
        0x000006d8:    6848        Hh      LDR      r0,[r1,#4]
        0x000006da:    6809        .h      LDR      r1,[r1,#0]
        0x000006dc:    e8bd4010    ...@    POP      {r4,lr}
        0x000006e0:    4708        .G      BX       r1
        0x000006e2:    f7fffe35    ..5.    BL       abort ; 0x350
    $d
        0x000006e6:    0000        ..      DCW    0
        0x000006e8:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x000006ec:    4905        .I      LDR      r1,[pc,#20] ; [0x704] = 0x88
        0x000006ee:    b510        ..      PUSH     {r4,lr}
        0x000006f0:    3130        01      ADDS     r1,r1,#0x30
        0x000006f2:    d004        ..      BEQ      0x6fe ; ADCC1_IRQHandler + 18
        0x000006f4:    6848        Hh      LDR      r0,[r1,#4]
        0x000006f6:    6809        .h      LDR      r1,[r1,#0]
        0x000006f8:    e8bd4010    ...@    POP      {r4,lr}
        0x000006fc:    4708        .G      BX       r1
        0x000006fe:    f7fffe27    ..'.    BL       abort ; 0x350
    $d
        0x00000702:    0000        ..      DCW    0
        0x00000704:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x00000708:    4905        .I      LDR      r1,[pc,#20] ; [0x720] = 0x88
        0x0000070a:    b510        ..      PUSH     {r4,lr}
        0x0000070c:    3138        81      ADDS     r1,r1,#0x38
        0x0000070e:    d004        ..      BEQ      0x71a ; ADCC2_IRQHandler + 18
        0x00000710:    6848        Hh      LDR      r0,[r1,#4]
        0x00000712:    6809        .h      LDR      r1,[r1,#0]
        0x00000714:    e8bd4010    ...@    POP      {r4,lr}
        0x00000718:    4708        .G      BX       r1
        0x0000071a:    f7fffe19    ....    BL       abort ; 0x350
    $d
        0x0000071e:    0000        ..      DCW    0
        0x00000720:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000724:    4905        .I      LDR      r1,[pc,#20] ; [0x73c] = 0x88
        0x00000726:    b510        ..      PUSH     {r4,lr}
        0x00000728:    3140        @1      ADDS     r1,r1,#0x40
        0x0000072a:    d004        ..      BEQ      0x736 ; ADCC3_IRQHandler + 18
        0x0000072c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000072e:    6809        .h      LDR      r1,[r1,#0]
        0x00000730:    e8bd4010    ...@    POP      {r4,lr}
        0x00000734:    4708        .G      BX       r1
        0x00000736:    f7fffe0b    ....    BL       abort ; 0x350
    $d
        0x0000073a:    0000        ..      DCW    0
        0x0000073c:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x00000740:    4905        .I      LDR      r1,[pc,#20] ; [0x758] = 0x88
        0x00000742:    b510        ..      PUSH     {r4,lr}
        0x00000744:    3148        H1      ADDS     r1,r1,#0x48
        0x00000746:    d004        ..      BEQ      0x752 ; ADCC4_IRQHandler + 18
        0x00000748:    6848        Hh      LDR      r0,[r1,#4]
        0x0000074a:    6809        .h      LDR      r1,[r1,#0]
        0x0000074c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000750:    4708        .G      BX       r1
        0x00000752:    f7fffdfd    ....    BL       abort ; 0x350
    $d
        0x00000756:    0000        ..      DCW    0
        0x00000758:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x0000075c:    4905        .I      LDR      r1,[pc,#20] ; [0x774] = 0x88
        0x0000075e:    b510        ..      PUSH     {r4,lr}
        0x00000760:    3150        P1      ADDS     r1,r1,#0x50
        0x00000762:    d004        ..      BEQ      0x76e ; ADCC5_IRQHandler + 18
        0x00000764:    6848        Hh      LDR      r0,[r1,#4]
        0x00000766:    6809        .h      LDR      r1,[r1,#0]
        0x00000768:    e8bd4010    ...@    POP      {r4,lr}
        0x0000076c:    4708        .G      BX       r1
        0x0000076e:    f7fffdef    ....    BL       abort ; 0x350
    $d
        0x00000772:    0000        ..      DCW    0
        0x00000774:    00000088    ....    DCD    136
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000778:    4905        .I      LDR      r1,[pc,#20] ; [0x790] = 0x88
        0x0000077a:    b510        ..      PUSH     {r4,lr}
        0x0000077c:    3118        .1      ADDS     r1,r1,#0x18
        0x0000077e:    d004        ..      BEQ      0x78a ; DMAC_IRQHandler + 18
        0x00000780:    6848        Hh      LDR      r0,[r1,#4]
        0x00000782:    6809        .h      LDR      r1,[r1,#0]
        0x00000784:    e8bd4010    ...@    POP      {r4,lr}
        0x00000788:    4708        .G      BX       r1
        0x0000078a:    f7fffde1    ....    BL       abort ; 0x350
    $d
        0x0000078e:    0000        ..      DCW    0
        0x00000790:    00000088    ....    DCD    136
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x00000794:    4905        .I      LDR      r1,[pc,#20] ; [0x7ac] = 0x88
        0x00000796:    b510        ..      PUSH     {r4,lr}
        0x00000798:    3108        .1      ADDS     r1,r1,#8
        0x0000079a:    d004        ..      BEQ      0x7a6 ; EXT_IRQHandler + 18
        0x0000079c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000079e:    6809        .h      LDR      r1,[r1,#0]
        0x000007a0:    e8bd4010    ...@    POP      {r4,lr}
        0x000007a4:    4708        .G      BX       r1
        0x000007a6:    f7fffdd3    ....    BL       abort ; 0x350
    $d
        0x000007aa:    0000        ..      DCW    0
        0x000007ac:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000007b0:    4905        .I      LDR      r1,[pc,#20] ; [0x7c8] = 0x88
        0x000007b2:    b510        ..      PUSH     {r4,lr}
        0x000007b4:    3180        .1      ADDS     r1,r1,#0x80
        0x000007b6:    d004        ..      BEQ      0x7c2 ; GPIO_IRQHandler + 18
        0x000007b8:    6848        Hh      LDR      r0,[r1,#4]
        0x000007ba:    6809        .h      LDR      r1,[r1,#0]
        0x000007bc:    e8bd4010    ...@    POP      {r4,lr}
        0x000007c0:    4708        .G      BX       r1
        0x000007c2:    f7fffdc5    ....    BL       abort ; 0x350
    $d
        0x000007c6:    0000        ..      DCW    0
        0x000007c8:    00000088    ....    DCD    136
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x000007cc:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000007ce:    4604        .F      MOV      r4,r0
        0x000007d0:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x000007d4:    4620         F      MOV      r0,r4
        0x000007d6:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0x83c
        0x000007da:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x000007de:    2801        .(      CMP      r0,#1
        0x000007e0:    d105        ..      BNE      0x7ee ; HAL_GPIO_Init + 34
        0x000007e2:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x000007e6:    4620         F      MOV      r0,r4
        0x000007e8:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0x94c
        0x000007ec:    e009        ..      B        0x802 ; HAL_GPIO_Init + 54
        0x000007ee:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x000007f2:    4620         F      MOV      r0,r4
        0x000007f4:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0x804
        0x000007f8:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x000007fc:    4620         F      MOV      r0,r4
        0x000007fe:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0x8e8
        0x00000802:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x00000804:    b530        0.      PUSH     {r4,r5,lr}
        0x00000806:    460a        .F      MOV      r2,r1
        0x00000808:    bf00        ..      NOP      
        0x0000080a:    4b0b        .K      LDR      r3,[pc,#44] ; [0x838] = 0x40007000
        0x0000080c:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x0000080e:    b29b        ..      UXTH     r3,r3
        0x00000810:    4619        .F      MOV      r1,r3
        0x00000812:    2a01        .*      CMP      r2,#1
        0x00000814:    d103        ..      BNE      0x81e ; HAL_GPIO_SetDebounce + 26
        0x00000816:    2301        .#      MOVS     r3,#1
        0x00000818:    4083        .@      LSLS     r3,r3,r0
        0x0000081a:    4319        .C      ORRS     r1,r1,r3
        0x0000081c:    e002        ..      B        0x824 ; HAL_GPIO_SetDebounce + 32
        0x0000081e:    2301        .#      MOVS     r3,#1
        0x00000820:    4083        .@      LSLS     r3,r3,r0
        0x00000822:    4399        .C      BICS     r1,r1,r3
        0x00000824:    b28b        ..      UXTH     r3,r1
        0x00000826:    4c04        .L      LDR      r4,[pc,#16] ; [0x838] = 0x40007000
        0x00000828:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x0000082a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000082e:    4d02        .M      LDR      r5,[pc,#8] ; [0x838] = 0x40007000
        0x00000830:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000832:    bf00        ..      NOP      
        0x00000834:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000836:    0000        ..      DCW    0
        0x00000838:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x0000083c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000083e:    4602        .F      MOV      r2,r0
        0x00000840:    2a10        .*      CMP      r2,#0x10
        0x00000842:    da16        ..      BGE      0x872 ; HAL_GPIO_SetDir + 54
        0x00000844:    bf00        ..      NOP      
        0x00000846:    4b19        .K      LDR      r3,[pc,#100] ; [0x8ac] = 0x40007000
        0x00000848:    685b        [h      LDR      r3,[r3,#4]
        0x0000084a:    b298        ..      UXTH     r0,r3
        0x0000084c:    bf00        ..      NOP      
        0x0000084e:    2901        .)      CMP      r1,#1
        0x00000850:    d103        ..      BNE      0x85a ; HAL_GPIO_SetDir + 30
        0x00000852:    2301        .#      MOVS     r3,#1
        0x00000854:    4093        .@      LSLS     r3,r3,r2
        0x00000856:    4318        .C      ORRS     r0,r0,r3
        0x00000858:    e002        ..      B        0x860 ; HAL_GPIO_SetDir + 36
        0x0000085a:    2301        .#      MOVS     r3,#1
        0x0000085c:    4093        .@      LSLS     r3,r3,r2
        0x0000085e:    4398        .C      BICS     r0,r0,r3
        0x00000860:    b283        ..      UXTH     r3,r0
        0x00000862:    4c12        .L      LDR      r4,[pc,#72] ; [0x8ac] = 0x40007000
        0x00000864:    6864        dh      LDR      r4,[r4,#4]
        0x00000866:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000086a:    4d10        .M      LDR      r5,[pc,#64] ; [0x8ac] = 0x40007000
        0x0000086c:    606c        l`      STR      r4,[r5,#4]
        0x0000086e:    bf00        ..      NOP      
        0x00000870:    e01b        ..      B        0x8aa ; HAL_GPIO_SetDir + 110
        0x00000872:    bf00        ..      NOP      
        0x00000874:    4b0d        .K      LDR      r3,[pc,#52] ; [0x8ac] = 0x40007000
        0x00000876:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000878:    b298        ..      UXTH     r0,r3
        0x0000087a:    bf00        ..      NOP      
        0x0000087c:    2901        .)      CMP      r1,#1
        0x0000087e:    d106        ..      BNE      0x88e ; HAL_GPIO_SetDir + 82
        0x00000880:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000884:    2401        .$      MOVS     r4,#1
        0x00000886:    fa04f303    ....    LSL      r3,r4,r3
        0x0000088a:    4318        .C      ORRS     r0,r0,r3
        0x0000088c:    e004        ..      B        0x898 ; HAL_GPIO_SetDir + 92
        0x0000088e:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000892:    2401        .$      MOVS     r4,#1
        0x00000894:    409c        .@      LSLS     r4,r4,r3
        0x00000896:    43a0        .C      BICS     r0,r0,r4
        0x00000898:    b283        ..      UXTH     r3,r0
        0x0000089a:    4c04        .L      LDR      r4,[pc,#16] ; [0x8ac] = 0x40007000
        0x0000089c:    6924        $i      LDR      r4,[r4,#0x10]
        0x0000089e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000008a2:    4d02        .M      LDR      r5,[pc,#8] ; [0x8ac] = 0x40007000
        0x000008a4:    612c        ,a      STR      r4,[r5,#0x10]
        0x000008a6:    bf00        ..      NOP      
        0x000008a8:    bf00        ..      NOP      
        0x000008aa:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000008ac:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x000008b0:    b530        0.      PUSH     {r4,r5,lr}
        0x000008b2:    460a        .F      MOV      r2,r1
        0x000008b4:    bf00        ..      NOP      
        0x000008b6:    4b0b        .K      LDR      r3,[pc,#44] ; [0x8e4] = 0x40007000
        0x000008b8:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x000008ba:    b29b        ..      UXTH     r3,r3
        0x000008bc:    4619        .F      MOV      r1,r3
        0x000008be:    2a01        .*      CMP      r2,#1
        0x000008c0:    d103        ..      BNE      0x8ca ; HAL_GPIO_SetPly + 26
        0x000008c2:    2301        .#      MOVS     r3,#1
        0x000008c4:    4083        .@      LSLS     r3,r3,r0
        0x000008c6:    4319        .C      ORRS     r1,r1,r3
        0x000008c8:    e002        ..      B        0x8d0 ; HAL_GPIO_SetPly + 32
        0x000008ca:    2301        .#      MOVS     r3,#1
        0x000008cc:    4083        .@      LSLS     r3,r3,r0
        0x000008ce:    4399        .C      BICS     r1,r1,r3
        0x000008d0:    b28b        ..      UXTH     r3,r1
        0x000008d2:    4c04        .L      LDR      r4,[pc,#16] ; [0x8e4] = 0x40007000
        0x000008d4:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x000008d6:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000008da:    4d02        .M      LDR      r5,[pc,#8] ; [0x8e4] = 0x40007000
        0x000008dc:    63ec        .c      STR      r4,[r5,#0x3c]
        0x000008de:    bf00        ..      NOP      
        0x000008e0:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000008e2:    0000        ..      DCW    0
        0x000008e4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x000008e8:    b570        p.      PUSH     {r4-r6,lr}
        0x000008ea:    4605        .F      MOV      r5,r0
        0x000008ec:    460c        .F      MOV      r4,r1
        0x000008ee:    b134        4.      CBZ      r4,0x8fe ; HAL_GPIO_TrigType + 22
        0x000008f0:    2c01        .,      CMP      r4,#1
        0x000008f2:    d00d        ..      BEQ      0x910 ; HAL_GPIO_TrigType + 40
        0x000008f4:    2c02        .,      CMP      r4,#2
        0x000008f6:    d014        ..      BEQ      0x922 ; HAL_GPIO_TrigType + 58
        0x000008f8:    2c03        .,      CMP      r4,#3
        0x000008fa:    d124        $.      BNE      0x946 ; HAL_GPIO_TrigType + 94
        0x000008fc:    e01a        ..      B        0x934 ; HAL_GPIO_TrigType + 76
        0x000008fe:    2100        .!      MOVS     r1,#0
        0x00000900:    4628        (F      MOV      r0,r5
        0x00000902:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0x9a8
        0x00000906:    2100        .!      MOVS     r1,#0
        0x00000908:    4628        (F      MOV      r0,r5
        0x0000090a:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0x8b0
        0x0000090e:    e01a        ..      B        0x946 ; HAL_GPIO_TrigType + 94
        0x00000910:    2100        .!      MOVS     r1,#0
        0x00000912:    4628        (F      MOV      r0,r5
        0x00000914:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0x9a8
        0x00000918:    2101        .!      MOVS     r1,#1
        0x0000091a:    4628        (F      MOV      r0,r5
        0x0000091c:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0x8b0
        0x00000920:    e011        ..      B        0x946 ; HAL_GPIO_TrigType + 94
        0x00000922:    2101        .!      MOVS     r1,#1
        0x00000924:    4628        (F      MOV      r0,r5
        0x00000926:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0x9a8
        0x0000092a:    2100        .!      MOVS     r1,#0
        0x0000092c:    4628        (F      MOV      r0,r5
        0x0000092e:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0x8b0
        0x00000932:    e008        ..      B        0x946 ; HAL_GPIO_TrigType + 94
        0x00000934:    2101        .!      MOVS     r1,#1
        0x00000936:    4628        (F      MOV      r0,r5
        0x00000938:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0x9a8
        0x0000093c:    2101        .!      MOVS     r1,#1
        0x0000093e:    4628        (F      MOV      r0,r5
        0x00000940:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0x8b0
        0x00000944:    bf00        ..      NOP      
        0x00000946:    bf00        ..      NOP      
        0x00000948:    bd70        p.      POP      {r4-r6,pc}
        0x0000094a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x0000094c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000094e:    4605        .F      MOV      r5,r0
        0x00000950:    460e        .F      MOV      r6,r1
        0x00000952:    2d10        .-      CMP      r5,#0x10
        0x00000954:    da10        ..      BGE      0x978 ; HAL_GPIO_WritePin + 44
        0x00000956:    bf00        ..      NOP      
        0x00000958:    4812        .H      LDR      r0,[pc,#72] ; [0x9a4] = 0x40007000
        0x0000095a:    6800        .h      LDR      r0,[r0,#0]
        0x0000095c:    b284        ..      UXTH     r4,r0
        0x0000095e:    bf00        ..      NOP      
        0x00000960:    b91e        ..      CBNZ     r6,0x96a ; HAL_GPIO_WritePin + 30
        0x00000962:    2001        .       MOVS     r0,#1
        0x00000964:    40a8        .@      LSLS     r0,r0,r5
        0x00000966:    4384        .C      BICS     r4,r4,r0
        0x00000968:    e002        ..      B        0x970 ; HAL_GPIO_WritePin + 36
        0x0000096a:    2001        .       MOVS     r0,#1
        0x0000096c:    40a8        .@      LSLS     r0,r0,r5
        0x0000096e:    4304        .C      ORRS     r4,r4,r0
        0x00000970:    b2a0        ..      UXTH     r0,r4
        0x00000972:    f000fd3b    ..;.    BL       gpio_portadataregister_setf ; 0x13ec
        0x00000976:    e014        ..      B        0x9a2 ; HAL_GPIO_WritePin + 86
        0x00000978:    bf00        ..      NOP      
        0x0000097a:    480a        .H      LDR      r0,[pc,#40] ; [0x9a4] = 0x40007000
        0x0000097c:    68c0        .h      LDR      r0,[r0,#0xc]
        0x0000097e:    b284        ..      UXTH     r4,r0
        0x00000980:    bf00        ..      NOP      
        0x00000982:    b92e        ..      CBNZ     r6,0x990 ; HAL_GPIO_WritePin + 68
        0x00000984:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000988:    2101        .!      MOVS     r1,#1
        0x0000098a:    4081        .@      LSLS     r1,r1,r0
        0x0000098c:    438c        .C      BICS     r4,r4,r1
        0x0000098e:    e005        ..      B        0x99c ; HAL_GPIO_WritePin + 80
        0x00000990:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000994:    2101        .!      MOVS     r1,#1
        0x00000996:    fa01f000    ....    LSL      r0,r1,r0
        0x0000099a:    4304        .C      ORRS     r4,r4,r0
        0x0000099c:    b2a0        ..      UXTH     r0,r4
        0x0000099e:    f000fd2f    ../.    BL       gpio_portbdataregister_setf ; 0x1400
        0x000009a2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000009a4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x000009a8:    b530        0.      PUSH     {r4,r5,lr}
        0x000009aa:    460a        .F      MOV      r2,r1
        0x000009ac:    bf00        ..      NOP      
        0x000009ae:    4b0b        .K      LDR      r3,[pc,#44] ; [0x9dc] = 0x40007000
        0x000009b0:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x000009b2:    b29b        ..      UXTH     r3,r3
        0x000009b4:    4619        .F      MOV      r1,r3
        0x000009b6:    2a01        .*      CMP      r2,#1
        0x000009b8:    d103        ..      BNE      0x9c2 ; HAL_GPIO_setIrqLevel + 26
        0x000009ba:    2301        .#      MOVS     r3,#1
        0x000009bc:    4083        .@      LSLS     r3,r3,r0
        0x000009be:    4319        .C      ORRS     r1,r1,r3
        0x000009c0:    e002        ..      B        0x9c8 ; HAL_GPIO_setIrqLevel + 32
        0x000009c2:    2301        .#      MOVS     r3,#1
        0x000009c4:    4083        .@      LSLS     r3,r3,r0
        0x000009c6:    4399        .C      BICS     r1,r1,r3
        0x000009c8:    b28b        ..      UXTH     r3,r1
        0x000009ca:    4c04        .L      LDR      r4,[pc,#16] ; [0x9dc] = 0x40007000
        0x000009cc:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x000009ce:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000009d2:    4d02        .M      LDR      r5,[pc,#8] ; [0x9dc] = 0x40007000
        0x000009d4:    63ac        .c      STR      r4,[r5,#0x38]
        0x000009d6:    bf00        ..      NOP      
        0x000009d8:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000009da:    0000        ..      DCW    0
        0x000009dc:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x000009e0:    bf00        ..      NOP      
        0x000009e2:    4904        .I      LDR      r1,[pc,#16] ; [0x9f4] = 0x40020000
        0x000009e4:    6909        .i      LDR      r1,[r1,#0x10]
        0x000009e6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x000009ea:    4a02        .J      LDR      r2,[pc,#8] ; [0x9f4] = 0x40020000
        0x000009ec:    6111        .a      STR      r1,[r2,#0x10]
        0x000009ee:    bf00        ..      NOP      
        0x000009f0:    4770        pG      BX       lr
    $d
        0x000009f2:    0000        ..      DCW    0
        0x000009f4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x000009f8:    b510        ..      PUSH     {r4,lr}
        0x000009fa:    4604        .F      MOV      r4,r0
        0x000009fc:    1e60        `.      SUBS     r0,r4,#1
        0x000009fe:    280f        .(      CMP      r0,#0xf
        0x00000a00:    dc00        ..      BGT      0xa04 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000a02:    e004        ..      B        0xa0e ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000a04:    2225        %"      MOVS     r2,#0x25
        0x00000a06:    a108        ..      ADR      r1,{pc}+0x22 ; 0xa28
        0x00000a08:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xa48
        0x00000a0a:    f000fccd    ....    BL       __aeabi_assert ; 0x13a8
        0x00000a0e:    1e61        a.      SUBS     r1,r4,#1
        0x00000a10:    b2c8        ..      UXTB     r0,r1
        0x00000a12:    4913        .I      LDR      r1,[pc,#76] ; [0xa60] = 0x40020000
        0x00000a14:    6849        Ih      LDR      r1,[r1,#4]
        0x00000a16:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000a1a:    4a11        .J      LDR      r2,[pc,#68] ; [0xa60] = 0x40020000
        0x00000a1c:    6051        Q`      STR      r1,[r2,#4]
        0x00000a1e:    bf00        ..      NOP      
        0x00000a20:    2001        .       MOVS     r0,#1
        0x00000a22:    f000fd19    ....    BL       sysc_awo_div_update_set ; 0x1458
        0x00000a26:    bd10        ..      POP      {r4,pc}
    $d
        0x00000a28:    735c2e2e    ..\s    DCD    1935420974
        0x00000a2c:    735c6b64    dk\s    DCD    1935436644
        0x00000a30:    735c6372    rc\s    DCD    1935434610
        0x00000a34:    645c636f    oc\d    DCD    1683776367
        0x00000a38:    65766972    rive    DCD    1702259058
        0x00000a3c:    79735c72    r\sy    DCD    2037603442
        0x00000a40:    6e6f6373    scon    DCD    1852793715
        0x00000a44:    0000632e    .c..    DCD    25390
        0x00000a48:    62686128    (ahb    DCD    1651007784
        0x00000a4c:    7669645f    _div    DCD    1986618463
        0x00000a50:    72656469    ider    DCD    1919247465
        0x00000a54:    3c29312d    -1)<    DCD    1009332525
        0x00000a58:    6678303d    =0xf    DCD    1719152701
        0x00000a5c:    00000000    ....    DCD    0
        0x00000a60:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000a64:    b510        ..      PUSH     {r4,lr}
        0x00000a66:    4604        .F      MOV      r4,r0
        0x00000a68:    1e60        `.      SUBS     r0,r4,#1
        0x00000a6a:    280f        .(      CMP      r0,#0xf
        0x00000a6c:    dc00        ..      BGT      0xa70 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000a6e:    e004        ..      B        0xa7a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000a70:    222c        ,"      MOVS     r2,#0x2c
        0x00000a72:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xa9c
        0x00000a74:    a011        ..      ADR      r0,{pc}+0x48 ; 0xabc
        0x00000a76:    f000fc97    ....    BL       __aeabi_assert ; 0x13a8
        0x00000a7a:    1e61        a.      SUBS     r1,r4,#1
        0x00000a7c:    b2c8        ..      UXTB     r0,r1
        0x00000a7e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a82:    6849        Ih      LDR      r1,[r1,#4]
        0x00000a84:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000a88:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000a8c:    6051        Q`      STR      r1,[r2,#4]
        0x00000a8e:    bf00        ..      NOP      
        0x00000a90:    2001        .       MOVS     r0,#1
        0x00000a92:    0781        ..      LSLS     r1,r0,#30
        0x00000a94:    6008        .`      STR      r0,[r1,#0]
        0x00000a96:    bf00        ..      NOP      
        0x00000a98:    bd10        ..      POP      {r4,pc}
    $d
        0x00000a9a:    0000        ..      DCW    0
        0x00000a9c:    735c2e2e    ..\s    DCD    1935420974
        0x00000aa0:    735c6b64    dk\s    DCD    1935436644
        0x00000aa4:    735c6372    rc\s    DCD    1935434610
        0x00000aa8:    645c636f    oc\d    DCD    1683776367
        0x00000aac:    65766972    rive    DCD    1702259058
        0x00000ab0:    79735c72    r\sy    DCD    2037603442
        0x00000ab4:    6e6f6373    scon    DCD    1852793715
        0x00000ab8:    0000632e    .c..    DCD    25390
        0x00000abc:    62706128    (apb    DCD    1651532072
        0x00000ac0:    69645f30    0_di    DCD    1768185648
        0x00000ac4:    65646976    vide    DCD    1701079414
        0x00000ac8:    29312d72    r-1)    DCD    691088754
        0x00000acc:    78303d3c    <=0x    DCD    2016427324
        0x00000ad0:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000ad4:    b510        ..      PUSH     {r4,lr}
        0x00000ad6:    4604        .F      MOV      r4,r0
        0x00000ad8:    1e60        `.      SUBS     r0,r4,#1
        0x00000ada:    280f        .(      CMP      r0,#0xf
        0x00000adc:    dc00        ..      BGT      0xae0 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000ade:    e004        ..      B        0xaea ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000ae0:    2234        4"      MOVS     r2,#0x34
        0x00000ae2:    a108        ..      ADR      r1,{pc}+0x22 ; 0xb04
        0x00000ae4:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xb24
        0x00000ae6:    f000fc5f    .._.    BL       __aeabi_assert ; 0x13a8
        0x00000aea:    1e61        a.      SUBS     r1,r4,#1
        0x00000aec:    b2c8        ..      UXTB     r0,r1
        0x00000aee:    4913        .I      LDR      r1,[pc,#76] ; [0xb3c] = 0x40020000
        0x00000af0:    6849        Ih      LDR      r1,[r1,#4]
        0x00000af2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000af6:    4a11        .J      LDR      r2,[pc,#68] ; [0xb3c] = 0x40020000
        0x00000af8:    6051        Q`      STR      r1,[r2,#4]
        0x00000afa:    bf00        ..      NOP      
        0x00000afc:    2002        .       MOVS     r0,#2
        0x00000afe:    f000fcab    ....    BL       sysc_awo_div_update_set ; 0x1458
        0x00000b02:    bd10        ..      POP      {r4,pc}
    $d
        0x00000b04:    735c2e2e    ..\s    DCD    1935420974
        0x00000b08:    735c6b64    dk\s    DCD    1935436644
        0x00000b0c:    735c6372    rc\s    DCD    1935434610
        0x00000b10:    645c636f    oc\d    DCD    1683776367
        0x00000b14:    65766972    rive    DCD    1702259058
        0x00000b18:    79735c72    r\sy    DCD    2037603442
        0x00000b1c:    6e6f6373    scon    DCD    1852793715
        0x00000b20:    0000632e    .c..    DCD    25390
        0x00000b24:    62706128    (apb    DCD    1651532072
        0x00000b28:    69645f31    1_di    DCD    1768185649
        0x00000b2c:    65646976    vide    DCD    1701079414
        0x00000b30:    29312d72    r-1)    DCD    691088754
        0x00000b34:    78303d3c    <=0x    DCD    2016427324
        0x00000b38:    00000066    f...    DCD    102
        0x00000b3c:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000b40:    b570        p.      PUSH     {r4-r6,lr}
        0x00000b42:    4605        .F      MOV      r5,r0
        0x00000b44:    460c        .F      MOV      r4,r1
        0x00000b46:    1e60        `.      SUBS     r0,r4,#1
        0x00000b48:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000b4c:    da00        ..      BGE      0xb50 ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000b4e:    e004        ..      B        0xb5a ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000b50:    223c        <"      MOVS     r2,#0x3c
        0x00000b52:    a112        ..      ADR      r1,{pc}+0x4a ; 0xb9c
        0x00000b54:    a019        ..      ADR      r0,{pc}+0x68 ; 0xbbc
        0x00000b56:    f000fc27    ..'.    BL       __aeabi_assert ; 0x13a8
        0x00000b5a:    2d01        .-      CMP      r5,#1
        0x00000b5c:    dc00        ..      BGT      0xb60 ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000b5e:    e004        ..      B        0xb6a ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000b60:    223d        ="      MOVS     r2,#0x3d
        0x00000b62:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xb9c
        0x00000b64:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xbd4
        0x00000b66:    f000fc1f    ....    BL       __aeabi_assert ; 0x13a8
        0x00000b6a:    b935        5.      CBNZ     r5,0xb7a ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000b6c:    2000        .       MOVS     r0,#0
        0x00000b6e:    f000fc79    ..y.    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1464
        0x00000b72:    2004        .       MOVS     r0,#4
        0x00000b74:    f000fc70    ..p.    BL       sysc_awo_div_update_set ; 0x1458
        0x00000b78:    e00e        ..      B        0xb98 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000b7a:    2c02        .,      CMP      r4,#2
        0x00000b7c:    db00        ..      BLT      0xb80 ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000b7e:    e004        ..      B        0xb8a ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000b80:    2247        G"      MOVS     r2,#0x47
        0x00000b82:    a106        ..      ADR      r1,{pc}+0x1a ; 0xb9c
        0x00000b84:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xbf0
        0x00000b86:    f000fc0f    ....    BL       __aeabi_assert ; 0x13a8
        0x00000b8a:    1e61        a.      SUBS     r1,r4,#1
        0x00000b8c:    b288        ..      UXTH     r0,r1
        0x00000b8e:    f000fc69    ..i.    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1464
        0x00000b92:    2004        .       MOVS     r0,#4
        0x00000b94:    f000fc60    ..`.    BL       sysc_awo_div_update_set ; 0x1458
        0x00000b98:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000b9a:    0000        ..      DCW    0
        0x00000b9c:    735c2e2e    ..\s    DCD    1935420974
        0x00000ba0:    735c6b64    dk\s    DCD    1935436644
        0x00000ba4:    735c6372    rc\s    DCD    1935434610
        0x00000ba8:    645c636f    oc\d    DCD    1683776367
        0x00000bac:    65766972    rive    DCD    1702259058
        0x00000bb0:    79735c72    r\sy    DCD    2037603442
        0x00000bb4:    6e6f6373    scon    DCD    1852793715
        0x00000bb8:    0000632e    .c..    DCD    25390
        0x00000bbc:    63747228    (rtc    DCD    1668575784
        0x00000bc0:    7669645f    _div    DCD    1986618463
        0x00000bc4:    72656469    ider    DCD    1919247465
        0x00000bc8:    3c29312d    -1)<    DCD    1009332525
        0x00000bcc:    3178303d    =0x1    DCD    829960253
        0x00000bd0:    00666666    fff.    DCD    6710886
        0x00000bd4:    5f637472    rtc_    DCD    1600353394
        0x00000bd8:    3c637273    src<    DCD    1013150323
        0x00000bdc:    6374723d    =rtc    DCD    1668575805
        0x00000be0:    5f6b6c63    clk_    DCD    1600875619
        0x00000be4:    6d6f7266    from    DCD    1836020326
        0x00000be8:    6268615f    _ahb    DCD    1651007839
        0x00000bec:    00000000    ....    DCD    0
        0x00000bf0:    5f637472    rtc_    DCD    1600353394
        0x00000bf4:    69766964    divi    DCD    1769367908
        0x00000bf8:    3e726564    der>    DCD    1047684452
        0x00000bfc:    0000323d    =2..    DCD    12861
    $t
    i.HAL_TIMER_Enable
    HAL_TIMER_Enable
        0x00000c00:    b110        ..      CBZ      r0,0xc08 ; HAL_TIMER_Enable + 8
        0x00000c02:    2801        .(      CMP      r0,#1
        0x00000c04:    d112        ..      BNE      0xc2c ; HAL_TIMER_Enable + 44
        0x00000c06:    e008        ..      B        0xc1a ; HAL_TIMER_Enable + 26
        0x00000c08:    bf00        ..      NOP      
        0x00000c0a:    4a09        .J      LDR      r2,[pc,#36] ; [0xc30] = 0x40001000
        0x00000c0c:    6892        .h      LDR      r2,[r2,#8]
        0x00000c0e:    f3610200    a...    BFI      r2,r1,#0,#1
        0x00000c12:    4b07        .K      LDR      r3,[pc,#28] ; [0xc30] = 0x40001000
        0x00000c14:    609a        .`      STR      r2,[r3,#8]
        0x00000c16:    bf00        ..      NOP      
        0x00000c18:    e008        ..      B        0xc2c ; HAL_TIMER_Enable + 44
        0x00000c1a:    bf00        ..      NOP      
        0x00000c1c:    4a04        .J      LDR      r2,[pc,#16] ; [0xc30] = 0x40001000
        0x00000c1e:    69d2        .i      LDR      r2,[r2,#0x1c]
        0x00000c20:    f3610200    a...    BFI      r2,r1,#0,#1
        0x00000c24:    4b02        .K      LDR      r3,[pc,#8] ; [0xc30] = 0x40001000
        0x00000c26:    61da        .a      STR      r2,[r3,#0x1c]
        0x00000c28:    bf00        ..      NOP      
        0x00000c2a:    bf00        ..      NOP      
        0x00000c2c:    bf00        ..      NOP      
        0x00000c2e:    4770        pG      BX       lr
    $d
        0x00000c30:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Init
    HAL_TIMER_Init
        0x00000c34:    b537        7.      PUSH     {r0-r2,r4,r5,lr}
        0x00000c36:    4604        .F      MOV      r4,r0
        0x00000c38:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000c3c:    2100        .!      MOVS     r1,#0
        0x00000c3e:    f7ffffdf    ....    BL       HAL_TIMER_Enable ; 0xc00
        0x00000c42:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000c46:    b110        ..      CBZ      r0,0xc4e ; HAL_TIMER_Init + 26
        0x00000c48:    2801        .(      CMP      r0,#1
        0x00000c4a:    d146        F.      BNE      0xcda ; HAL_TIMER_Init + 166
        0x00000c4c:    e022        ".      B        0xc94 ; HAL_TIMER_Init + 96
        0x00000c4e:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x00000c52:    4923        #I      LDR      r1,[pc,#140] ; [0xce0] = 0x40001000
        0x00000c54:    6889        .h      LDR      r1,[r1,#8]
        0x00000c56:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x00000c5a:    4a21        !J      LDR      r2,[pc,#132] ; [0xce0] = 0x40001000
        0x00000c5c:    6091        .`      STR      r1,[r2,#8]
        0x00000c5e:    bf00        ..      NOP      
        0x00000c60:    f89d0005    ....    LDRB     r0,[sp,#5]
        0x00000c64:    4611        .F      MOV      r1,r2
        0x00000c66:    6889        .h      LDR      r1,[r1,#8]
        0x00000c68:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00000c6c:    6091        .`      STR      r1,[r2,#8]
        0x00000c6e:    bf00        ..      NOP      
        0x00000c70:    9902        ..      LDR      r1,[sp,#8]
        0x00000c72:    fbb4f1f1    ....    UDIV     r1,r4,r1
        0x00000c76:    1e49        I.      SUBS     r1,r1,#1
        0x00000c78:    b2c8        ..      UXTB     r0,r1
        0x00000c7a:    0491        ..      LSLS     r1,r2,#18
        0x00000c7c:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c7e:    f360210b    `..!    BFI      r1,r0,#8,#4
        0x00000c82:    0492        ..      LSLS     r2,r2,#18
        0x00000c84:    6051        Q`      STR      r1,[r2,#4]
        0x00000c86:    bf00        ..      NOP      
        0x00000c88:    2200        ."      MOVS     r2,#0
        0x00000c8a:    2101        .!      MOVS     r1,#1
        0x00000c8c:    4610        .F      MOV      r0,r2
        0x00000c8e:    f000fbf3    ....    BL       sysc_cpu_div_update_pack ; 0x1478
        0x00000c92:    e023        #.      B        0xcdc ; HAL_TIMER_Init + 168
        0x00000c94:    f89d0006    ....    LDRB     r0,[sp,#6]
        0x00000c98:    4911        .I      LDR      r1,[pc,#68] ; [0xce0] = 0x40001000
        0x00000c9a:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00000c9c:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x00000ca0:    4a0f        .J      LDR      r2,[pc,#60] ; [0xce0] = 0x40001000
        0x00000ca2:    61d1        .a      STR      r1,[r2,#0x1c]
        0x00000ca4:    bf00        ..      NOP      
        0x00000ca6:    f89d0005    ....    LDRB     r0,[sp,#5]
        0x00000caa:    4611        .F      MOV      r1,r2
        0x00000cac:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00000cae:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00000cb2:    61d1        .a      STR      r1,[r2,#0x1c]
        0x00000cb4:    bf00        ..      NOP      
        0x00000cb6:    9902        ..      LDR      r1,[sp,#8]
        0x00000cb8:    fbb4f1f1    ....    UDIV     r1,r4,r1
        0x00000cbc:    1e49        I.      SUBS     r1,r1,#1
        0x00000cbe:    b2c8        ..      UXTB     r0,r1
        0x00000cc0:    0491        ..      LSLS     r1,r2,#18
        0x00000cc2:    6849        Ih      LDR      r1,[r1,#4]
        0x00000cc4:    f360310f    `..1    BFI      r1,r0,#12,#4
        0x00000cc8:    0492        ..      LSLS     r2,r2,#18
        0x00000cca:    6051        Q`      STR      r1,[r2,#4]
        0x00000ccc:    bf00        ..      NOP      
        0x00000cce:    2200        ."      MOVS     r2,#0
        0x00000cd0:    4611        .F      MOV      r1,r2
        0x00000cd2:    2001        .       MOVS     r0,#1
        0x00000cd4:    f000fbd0    ....    BL       sysc_cpu_div_update_pack ; 0x1478
        0x00000cd8:    e000        ..      B        0xcdc ; HAL_TIMER_Init + 168
        0x00000cda:    bf00        ..      NOP      
        0x00000cdc:    bf00        ..      NOP      
        0x00000cde:    bd3e        >.      POP      {r1-r5,pc}
    $d
        0x00000ce0:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Int_Clr
    HAL_TIMER_Int_Clr
        0x00000ce4:    b110        ..      CBZ      r0,0xcec ; HAL_TIMER_Int_Clr + 8
        0x00000ce6:    2801        .(      CMP      r0,#1
        0x00000ce8:    d108        ..      BNE      0xcfc ; HAL_TIMER_Int_Clr + 24
        0x00000cea:    e003        ..      B        0xcf4 ; HAL_TIMER_Int_Clr + 16
        0x00000cec:    bf00        ..      NOP      
        0x00000cee:    4904        .I      LDR      r1,[pc,#16] ; [0xd00] = 0x40001000
        0x00000cf0:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000cf2:    e003        ..      B        0xcfc ; HAL_TIMER_Int_Clr + 24
        0x00000cf4:    bf00        ..      NOP      
        0x00000cf6:    4902        .I      LDR      r1,[pc,#8] ; [0xd00] = 0x40001000
        0x00000cf8:    6a09        .j      LDR      r1,[r1,#0x20]
        0x00000cfa:    bf00        ..      NOP      
        0x00000cfc:    bf00        ..      NOP      
        0x00000cfe:    4770        pG      BX       lr
    $d
        0x00000d00:    40001000    ...@    DCD    1073745920
    $t
    i.HAL_TIMER_Set_LoadCount
    HAL_TIMER_Set_LoadCount
        0x00000d04:    b110        ..      CBZ      r0,0xd0c ; HAL_TIMER_Set_LoadCount + 8
        0x00000d06:    2801        .(      CMP      r0,#1
        0x00000d08:    d112        ..      BNE      0xd30 ; HAL_TIMER_Set_LoadCount + 44
        0x00000d0a:    e008        ..      B        0xd1e ; HAL_TIMER_Set_LoadCount + 26
        0x00000d0c:    bf00        ..      NOP      
        0x00000d0e:    4a09        .J      LDR      r2,[pc,#36] ; [0xd34] = 0x40001000
        0x00000d10:    6812        .h      LDR      r2,[r2,#0]
        0x00000d12:    f3610217    a...    BFI      r2,r1,#0,#24
        0x00000d16:    4b07        .K      LDR      r3,[pc,#28] ; [0xd34] = 0x40001000
        0x00000d18:    601a        .`      STR      r2,[r3,#0]
        0x00000d1a:    bf00        ..      NOP      
        0x00000d1c:    e008        ..      B        0xd30 ; HAL_TIMER_Set_LoadCount + 44
        0x00000d1e:    bf00        ..      NOP      
        0x00000d20:    4a04        .J      LDR      r2,[pc,#16] ; [0xd34] = 0x40001000
        0x00000d22:    6952        Ri      LDR      r2,[r2,#0x14]
        0x00000d24:    f3610217    a...    BFI      r2,r1,#0,#24
        0x00000d28:    4b02        .K      LDR      r3,[pc,#8] ; [0xd34] = 0x40001000
        0x00000d2a:    615a        Za      STR      r2,[r3,#0x14]
        0x00000d2c:    bf00        ..      NOP      
        0x00000d2e:    bf00        ..      NOP      
        0x00000d30:    bf00        ..      NOP      
        0x00000d32:    4770        pG      BX       lr
    $d
        0x00000d34:    40001000    ...@    DCD    1073745920
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000d38:    4905        .I      LDR      r1,[pc,#20] ; [0xd50] = 0x88
        0x00000d3a:    b510        ..      PUSH     {r4,lr}
        0x00000d3c:    3160        `1      ADDS     r1,r1,#0x60
        0x00000d3e:    d004        ..      BEQ      0xd4a ; I2C0_IRQHandler + 18
        0x00000d40:    6848        Hh      LDR      r0,[r1,#4]
        0x00000d42:    6809        .h      LDR      r1,[r1,#0]
        0x00000d44:    e8bd4010    ...@    POP      {r4,lr}
        0x00000d48:    4708        .G      BX       r1
        0x00000d4a:    f7fffb01    ....    BL       abort ; 0x350
    $d
        0x00000d4e:    0000        ..      DCW    0
        0x00000d50:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000d54:    4905        .I      LDR      r1,[pc,#20] ; [0xd6c] = 0x88
        0x00000d56:    b510        ..      PUSH     {r4,lr}
        0x00000d58:    3168        h1      ADDS     r1,r1,#0x68
        0x00000d5a:    d004        ..      BEQ      0xd66 ; I2C1_IRQHandler + 18
        0x00000d5c:    6848        Hh      LDR      r0,[r1,#4]
        0x00000d5e:    6809        .h      LDR      r1,[r1,#0]
        0x00000d60:    e8bd4010    ...@    POP      {r4,lr}
        0x00000d64:    4708        .G      BX       r1
        0x00000d66:    f7fffaf3    ....    BL       abort ; 0x350
    $d
        0x00000d6a:    0000        ..      DCW    0
        0x00000d6c:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00000d70:    4905        .I      LDR      r1,[pc,#20] ; [0xd88] = 0x88
        0x00000d72:    b510        ..      PUSH     {r4,lr}
        0x00000d74:    3188        .1      ADDS     r1,r1,#0x88
        0x00000d76:    d004        ..      BEQ      0xd82 ; I2S_IRQHandler + 18
        0x00000d78:    6848        Hh      LDR      r0,[r1,#4]
        0x00000d7a:    6809        .h      LDR      r1,[r1,#0]
        0x00000d7c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000d80:    4708        .G      BX       r1
        0x00000d82:    f7fffae5    ....    BL       abort ; 0x350
    $d
        0x00000d86:    0000        ..      DCW    0
        0x00000d88:    00000088    ....    DCD    136
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00000d8c:    4905        .I      LDR      r1,[pc,#20] ; [0xda4] = 0x88
        0x00000d8e:    b510        ..      PUSH     {r4,lr}
        0x00000d90:    3120         1      ADDS     r1,r1,#0x20
        0x00000d92:    d004        ..      BEQ      0xd9e ; QSPI_IRQHandler + 18
        0x00000d94:    6848        Hh      LDR      r0,[r1,#4]
        0x00000d96:    6809        .h      LDR      r1,[r1,#0]
        0x00000d98:    e8bd4010    ...@    POP      {r4,lr}
        0x00000d9c:    4708        .G      BX       r1
        0x00000d9e:    f7fffad7    ....    BL       abort ; 0x350
    $d
        0x00000da2:    0000        ..      DCW    0
        0x00000da4:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00000da8:    4905        .I      LDR      r1,[pc,#20] ; [0xdc0] = 0x88
        0x00000daa:    b510        ..      PUSH     {r4,lr}
        0x00000dac:    3110        .1      ADDS     r1,r1,#0x10
        0x00000dae:    d004        ..      BEQ      0xdba ; RTC_IRQHandler + 18
        0x00000db0:    6848        Hh      LDR      r0,[r1,#4]
        0x00000db2:    6809        .h      LDR      r1,[r1,#0]
        0x00000db4:    e8bd4010    ...@    POP      {r4,lr}
        0x00000db8:    4708        .G      BX       r1
        0x00000dba:    f7fffac9    ....    BL       abort ; 0x350
    $d
        0x00000dbe:    0000        ..      DCW    0
        0x00000dc0:    00000088    ....    DCD    136
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00000dc4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000dc8:    4607        .F      MOV      r7,r0
        0x00000dca:    480b        .H      LDR      r0,[pc,#44] ; [0xdf8] = 0x2000000c
        0x00000dcc:    4615        .F      MOV      r5,r2
        0x00000dce:    460e        .F      MOV      r6,r1
        0x00000dd0:    7800        .x      LDRB     r0,[r0,#0]
        0x00000dd2:    b908        ..      CBNZ     r0,0xdd8 ; SEGGER_RTT_Write + 20
        0x00000dd4:    f000f972    ..r.    BL       _DoInit ; 0x10bc
        0x00000dd8:    f3ef8411    ....    MRS      r4,BASEPRI
        0x00000ddc:    2020                MOVS     r0,#0x20
        0x00000dde:    f3808811    ....    MSR      BASEPRI,r0
        0x00000de2:    462a        *F      MOV      r2,r5
        0x00000de4:    4631        1F      MOV      r1,r6
        0x00000de6:    4638        8F      MOV      r0,r7
        0x00000de8:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0xdfc
        0x00000dec:    b2e1        ..      UXTB     r1,r4
        0x00000dee:    f3818811    ....    MSR      BASEPRI,r1
        0x00000df2:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000df6:    0000        ..      DCW    0
        0x00000df8:    2000000c    ...     DCD    536870924
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00000dfc:    b570        p.      PUSH     {r4-r6,lr}
        0x00000dfe:    460e        .F      MOV      r6,r1
        0x00000e00:    4914        .I      LDR      r1,[pc,#80] ; [0xe54] = 0x2000000c
        0x00000e02:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x00000e06:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x00000e0a:    4614        .F      MOV      r4,r2
        0x00000e0c:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x00000e0e:    3518        .5      ADDS     r5,r5,#0x18
        0x00000e10:    b120         .      CBZ      r0,0xe1c ; SEGGER_RTT_WriteNoLock + 32
        0x00000e12:    2801        .(      CMP      r0,#1
        0x00000e14:    d00f        ..      BEQ      0xe36 ; SEGGER_RTT_WriteNoLock + 58
        0x00000e16:    2802        .(      CMP      r0,#2
        0x00000e18:    d105        ..      BNE      0xe26 ; SEGGER_RTT_WriteNoLock + 42
        0x00000e1a:    e013        ..      B        0xe44 ; SEGGER_RTT_WriteNoLock + 72
        0x00000e1c:    4628        (F      MOV      r0,r5
        0x00000e1e:    f000f981    ....    BL       _GetAvailWriteSpace ; 0x1124
        0x00000e22:    42a0        .B      CMP      r0,r4
        0x00000e24:    d201        ..      BCS      0xe2a ; SEGGER_RTT_WriteNoLock + 46
        0x00000e26:    2400        .$      MOVS     r4,#0
        0x00000e28:    e011        ..      B        0xe4e ; SEGGER_RTT_WriteNoLock + 82
        0x00000e2a:    4622        "F      MOV      r2,r4
        0x00000e2c:    4631        1F      MOV      r1,r6
        0x00000e2e:    4628        (F      MOV      r0,r5
        0x00000e30:    f000fa98    ....    BL       _WriteNoCheck ; 0x1364
        0x00000e34:    e00b        ..      B        0xe4e ; SEGGER_RTT_WriteNoLock + 82
        0x00000e36:    4628        (F      MOV      r0,r5
        0x00000e38:    f000f974    ..t.    BL       _GetAvailWriteSpace ; 0x1124
        0x00000e3c:    42a0        .B      CMP      r0,r4
        0x00000e3e:    d2f4        ..      BCS      0xe2a ; SEGGER_RTT_WriteNoLock + 46
        0x00000e40:    4604        .F      MOV      r4,r0
        0x00000e42:    e7f2        ..      B        0xe2a ; SEGGER_RTT_WriteNoLock + 46
        0x00000e44:    4631        1F      MOV      r1,r6
        0x00000e46:    4628        (F      MOV      r0,r5
        0x00000e48:    f000fa5f    .._.    BL       _WriteBlocking ; 0x130a
        0x00000e4c:    4604        .F      MOV      r4,r0
        0x00000e4e:    4620         F      MOV      r0,r4
        0x00000e50:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000e52:    0000        ..      DCW    0
        0x00000e54:    2000000c    ...     DCD    536870924
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00000e58:    b40f        ..      PUSH     {r0-r3}
        0x00000e5a:    b508        ..      PUSH     {r3,lr}
        0x00000e5c:    a904        ..      ADD      r1,sp,#0x10
        0x00000e5e:    9100        ..      STR      r1,[sp,#0]
        0x00000e60:    466a        jF      MOV      r2,sp
        0x00000e62:    9903        ..      LDR      r1,[sp,#0xc]
        0x00000e64:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0xe6e
        0x00000e68:    b001        ..      ADD      sp,sp,#4
        0x00000e6a:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x00000e6e:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000e72:    b098        ..      SUB      sp,sp,#0x60
        0x00000e74:    4680        .F      MOV      r8,r0
        0x00000e76:    a807        ..      ADD      r0,sp,#0x1c
        0x00000e78:    9002        ..      STR      r0,[sp,#8]
        0x00000e7a:    2040        @       MOVS     r0,#0x40
        0x00000e7c:    2600        .&      MOVS     r6,#0
        0x00000e7e:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x00000e82:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x00000e86:    4615        .F      MOV      r5,r2
        0x00000e88:    460c        .F      MOV      r4,r1
        0x00000e8a:    f8141b01    ....    LDRB     r1,[r4],#1
        0x00000e8e:    2900        .)      CMP      r1,#0
        0x00000e90:    d06f        o.      BEQ      0xf72 ; SEGGER_RTT_vprintf + 260
        0x00000e92:    2925        %)      CMP      r1,#0x25
        0x00000e94:    d008        ..      BEQ      0xea8 ; SEGGER_RTT_vprintf + 58
        0x00000e96:    a802        ..      ADD      r0,sp,#8
        0x00000e98:    f000fa18    ....    BL       _StoreChar ; 0x12cc
        0x00000e9c:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000e9e:    2800        .(      CMP      r0,#0
        0x00000ea0:    daf3        ..      BGE      0xe8a ; SEGGER_RTT_vprintf + 28
        0x00000ea2:    b018        ..      ADD      sp,sp,#0x60
        0x00000ea4:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00000ea8:    2000        .       MOVS     r0,#0
        0x00000eaa:    2201        ."      MOVS     r2,#1
        0x00000eac:    7821        !x      LDRB     r1,[r4,#0]
        0x00000eae:    2923        #)      CMP      r1,#0x23
        0x00000eb0:    d01e        ..      BEQ      0xef0 ; SEGGER_RTT_vprintf + 130
        0x00000eb2:    292b        +)      CMP      r1,#0x2b
        0x00000eb4:    d019        ..      BEQ      0xeea ; SEGGER_RTT_vprintf + 124
        0x00000eb6:    292d        -)      CMP      r1,#0x2d
        0x00000eb8:    d002        ..      BEQ      0xec0 ; SEGGER_RTT_vprintf + 82
        0x00000eba:    2930        0)      CMP      r1,#0x30
        0x00000ebc:    d108        ..      BNE      0xed0 ; SEGGER_RTT_vprintf + 98
        0x00000ebe:    e002        ..      B        0xec6 ; SEGGER_RTT_vprintf + 88
        0x00000ec0:    f0400001    @...    ORR      r0,r0,#1
        0x00000ec4:    e001        ..      B        0xeca ; SEGGER_RTT_vprintf + 92
        0x00000ec6:    f0400002    @...    ORR      r0,r0,#2
        0x00000eca:    1c64        d.      ADDS     r4,r4,#1
        0x00000ecc:    2a00        .*      CMP      r2,#0
        0x00000ece:    d1ed        ..      BNE      0xeac ; SEGGER_RTT_vprintf + 62
        0x00000ed0:    2200        ."      MOVS     r2,#0
        0x00000ed2:    7821        !x      LDRB     r1,[r4,#0]
        0x00000ed4:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x00000ed8:    2b0a        .+      CMP      r3,#0xa
        0x00000eda:    d20c        ..      BCS      0xef6 ; SEGGER_RTT_vprintf + 136
        0x00000edc:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x00000ee0:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x00000ee4:    3a30        0:      SUBS     r2,r2,#0x30
        0x00000ee6:    1c64        d.      ADDS     r4,r4,#1
        0x00000ee8:    e7f3        ..      B        0xed2 ; SEGGER_RTT_vprintf + 100
        0x00000eea:    f0400004    @...    ORR      r0,r0,#4
        0x00000eee:    e7ec        ..      B        0xeca ; SEGGER_RTT_vprintf + 92
        0x00000ef0:    f0400008    @...    ORR      r0,r0,#8
        0x00000ef4:    e7e9        ..      B        0xeca ; SEGGER_RTT_vprintf + 92
        0x00000ef6:    2300        .#      MOVS     r3,#0
        0x00000ef8:    b2cf        ..      UXTB     r7,r1
        0x00000efa:    2f2e        ./      CMP      r7,#0x2e
        0x00000efc:    d10b        ..      BNE      0xf16 ; SEGGER_RTT_vprintf + 168
        0x00000efe:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00000f02:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x00000f06:    2f0a        ./      CMP      r7,#0xa
        0x00000f08:    d205        ..      BCS      0xf16 ; SEGGER_RTT_vprintf + 168
        0x00000f0a:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x00000f0e:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x00000f12:    3b30        0;      SUBS     r3,r3,#0x30
        0x00000f14:    e7f3        ..      B        0xefe ; SEGGER_RTT_vprintf + 144
        0x00000f16:    296c        l)      CMP      r1,#0x6c
        0x00000f18:    d00d        ..      BEQ      0xf36 ; SEGGER_RTT_vprintf + 200
        0x00000f1a:    2968        h)      CMP      r1,#0x68
        0x00000f1c:    d00b        ..      BEQ      0xf36 ; SEGGER_RTT_vprintf + 200
        0x00000f1e:    2970        p)      CMP      r1,#0x70
        0x00000f20:    d04a        J.      BEQ      0xfb8 ; SEGGER_RTT_vprintf + 330
        0x00000f22:    dc0b        ..      BGT      0xf3c ; SEGGER_RTT_vprintf + 206
        0x00000f24:    2925        %)      CMP      r1,#0x25
        0x00000f26:    d014        ..      BEQ      0xf52 ; SEGGER_RTT_vprintf + 228
        0x00000f28:    2958        X)      CMP      r1,#0x58
        0x00000f2a:    d02b        +.      BEQ      0xf84 ; SEGGER_RTT_vprintf + 278
        0x00000f2c:    2963        c)      CMP      r1,#0x63
        0x00000f2e:    d00c        ..      BEQ      0xf4a ; SEGGER_RTT_vprintf + 220
        0x00000f30:    2964        d)      CMP      r1,#0x64
        0x00000f32:    d111        ..      BNE      0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000f34:    e012        ..      B        0xf5c ; SEGGER_RTT_vprintf + 238
        0x00000f36:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00000f3a:    e7ec        ..      B        0xf16 ; SEGGER_RTT_vprintf + 168
        0x00000f3c:    2973        s)      CMP      r1,#0x73
        0x00000f3e:    d02c        ,.      BEQ      0xf9a ; SEGGER_RTT_vprintf + 300
        0x00000f40:    2975        u)      CMP      r1,#0x75
        0x00000f42:    d017        ..      BEQ      0xf74 ; SEGGER_RTT_vprintf + 262
        0x00000f44:    2978        x)      CMP      r1,#0x78
        0x00000f46:    d107        ..      BNE      0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000f48:    e01c        ..      B        0xf84 ; SEGGER_RTT_vprintf + 278
        0x00000f4a:    6828        (h      LDR      r0,[r5,#0]
        0x00000f4c:    1d01        ..      ADDS     r1,r0,#4
        0x00000f4e:    6029        )`      STR      r1,[r5,#0]
        0x00000f50:    7801        .x      LDRB     r1,[r0,#0]
        0x00000f52:    a802        ..      ADD      r0,sp,#8
        0x00000f54:    f000f9ba    ....    BL       _StoreChar ; 0x12cc
        0x00000f58:    1c64        d.      ADDS     r4,r4,#1
        0x00000f5a:    e79f        ..      B        0xe9c ; SEGGER_RTT_vprintf + 46
        0x00000f5c:    6829        )h      LDR      r1,[r5,#0]
        0x00000f5e:    1d0f        ..      ADDS     r7,r1,#4
        0x00000f60:    602f        /`      STR      r7,[r5,#0]
        0x00000f62:    6809        .h      LDR      r1,[r1,#0]
        0x00000f64:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000f68:    220a        ."      MOVS     r2,#0xa
        0x00000f6a:    a802        ..      ADD      r0,sp,#8
        0x00000f6c:    f000f8e5    ....    BL       _PrintInt ; 0x113a
        0x00000f70:    e7f2        ..      B        0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000f72:    e02b        +.      B        0xfcc ; SEGGER_RTT_vprintf + 350
        0x00000f74:    6829        )h      LDR      r1,[r5,#0]
        0x00000f76:    1d0f        ..      ADDS     r7,r1,#4
        0x00000f78:    602f        /`      STR      r7,[r5,#0]
        0x00000f7a:    6809        .h      LDR      r1,[r1,#0]
        0x00000f7c:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000f80:    220a        ."      MOVS     r2,#0xa
        0x00000f82:    e006        ..      B        0xf92 ; SEGGER_RTT_vprintf + 292
        0x00000f84:    6829        )h      LDR      r1,[r5,#0]
        0x00000f86:    1d0f        ..      ADDS     r7,r1,#4
        0x00000f88:    602f        /`      STR      r7,[r5,#0]
        0x00000f8a:    6809        .h      LDR      r1,[r1,#0]
        0x00000f8c:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00000f90:    2210        ."      MOVS     r2,#0x10
        0x00000f92:    a802        ..      ADD      r0,sp,#8
        0x00000f94:    f000f934    ..4.    BL       _PrintUnsigned ; 0x1200
        0x00000f98:    e7de        ..      B        0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000f9a:    6828        (h      LDR      r0,[r5,#0]
        0x00000f9c:    1d01        ..      ADDS     r1,r0,#4
        0x00000f9e:    6029        )`      STR      r1,[r5,#0]
        0x00000fa0:    6807        .h      LDR      r7,[r0,#0]
        0x00000fa2:    f8171b01    ....    LDRB     r1,[r7],#1
        0x00000fa6:    2900        .)      CMP      r1,#0
        0x00000fa8:    d0d6        ..      BEQ      0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000faa:    a802        ..      ADD      r0,sp,#8
        0x00000fac:    f000f98e    ....    BL       _StoreChar ; 0x12cc
        0x00000fb0:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000fb2:    2800        .(      CMP      r0,#0
        0x00000fb4:    daf5        ..      BGE      0xfa2 ; SEGGER_RTT_vprintf + 308
        0x00000fb6:    e7cf        ..      B        0xf58 ; SEGGER_RTT_vprintf + 234
        0x00000fb8:    6828        (h      LDR      r0,[r5,#0]
        0x00000fba:    1d01        ..      ADDS     r1,r0,#4
        0x00000fbc:    6029        )`      STR      r1,[r5,#0]
        0x00000fbe:    6801        .h      LDR      r1,[r0,#0]
        0x00000fc0:    2008        .       MOVS     r0,#8
        0x00000fc2:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x00000fc6:    4603        .F      MOV      r3,r0
        0x00000fc8:    2210        ."      MOVS     r2,#0x10
        0x00000fca:    e7e2        ..      B        0xf92 ; SEGGER_RTT_vprintf + 292
        0x00000fcc:    9805        ..      LDR      r0,[sp,#0x14]
        0x00000fce:    2800        .(      CMP      r0,#0
        0x00000fd0:    f77faf67    ..g.    BLE      0xea2 ; SEGGER_RTT_vprintf + 52
        0x00000fd4:    9804        ..      LDR      r0,[sp,#0x10]
        0x00000fd6:    b120         .      CBZ      r0,0xfe2 ; SEGGER_RTT_vprintf + 372
        0x00000fd8:    4602        .F      MOV      r2,r0
        0x00000fda:    a907        ..      ADD      r1,sp,#0x1c
        0x00000fdc:    4640        @F      MOV      r0,r8
        0x00000fde:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0xdc4
        0x00000fe2:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x00000fe6:    4408        .D      ADD      r0,r0,r1
        0x00000fe8:    9005        ..      STR      r0,[sp,#0x14]
        0x00000fea:    e75a        Z.      B        0xea2 ; SEGGER_RTT_vprintf + 52
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00000fec:    4905        .I      LDR      r1,[pc,#20] ; [0x1004] = 0x88
        0x00000fee:    b510        ..      PUSH     {r4,lr}
        0x00000ff0:    3170        p1      ADDS     r1,r1,#0x70
        0x00000ff2:    d004        ..      BEQ      0xffe ; SPIM_IRQHandler + 18
        0x00000ff4:    6848        Hh      LDR      r0,[r1,#4]
        0x00000ff6:    6809        .h      LDR      r1,[r1,#0]
        0x00000ff8:    e8bd4010    ...@    POP      {r4,lr}
        0x00000ffc:    4708        .G      BX       r1
        0x00000ffe:    f7fff9a7    ....    BL       abort ; 0x350
    $d
        0x00001002:    0000        ..      DCW    0
        0x00001004:    00000088    ....    DCD    136
    $t
    i.SystemInit
    SystemInit
        0x00001008:    b510        ..      PUSH     {r4,lr}
        0x0000100a:    4812        .H      LDR      r0,[pc,#72] ; [0x1054] = 0x4000b000
        0x0000100c:    6801        .h      LDR      r1,[r0,#0]
        0x0000100e:    0149        I.      LSLS     r1,r1,#5
        0x00001010:    d5fc        ..      BPL      0x100c ; SystemInit + 4
        0x00001012:    f64e2160    N.`!    MOV      r1,#0xea60
        0x00001016:    2000        .       MOVS     r0,#0
        0x00001018:    bf00        ..      NOP      
        0x0000101a:    bf00        ..      NOP      
        0x0000101c:    bf00        ..      NOP      
        0x0000101e:    bf00        ..      NOP      
        0x00001020:    bf00        ..      NOP      
        0x00001022:    bf00        ..      NOP      
        0x00001024:    1c40        @.      ADDS     r0,r0,#1
        0x00001026:    4288        .B      CMP      r0,r1
        0x00001028:    d3f6        ..      BCC      0x1018 ; SystemInit + 16
        0x0000102a:    490c        .I      LDR      r1,[pc,#48] ; [0x105c] = 0x20000000
        0x0000102c:    480a        .H      LDR      r0,[pc,#40] ; [0x1058] = 0x5f5e100
        0x0000102e:    6008        .`      STR      r0,[r1,#0]
        0x00001030:    2008        .       MOVS     r0,#8
        0x00001032:    f7fffcd5    ....    BL       HAL_SYSCON_HCLK_Src_Sel ; 0x9e0
        0x00001036:    2002        .       MOVS     r0,#2
        0x00001038:    f7fffcde    ....    BL       HAL_SYSCON_Set_HClk_Div ; 0x9f8
        0x0000103c:    2004        .       MOVS     r0,#4
        0x0000103e:    f7fffd11    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xa64
        0x00001042:    2002        .       MOVS     r0,#2
        0x00001044:    f7fffd46    ..F.    BL       HAL_SYSCON_Set_PClk1_Div ; 0xad4
        0x00001048:    2164        d!      MOVS     r1,#0x64
        0x0000104a:    e8bd4010    ...@    POP      {r4,lr}
        0x0000104e:    2001        .       MOVS     r0,#1
        0x00001050:    f7ffbd76    ..v.    B.W      HAL_SYSCON_Set_RTC_Div ; 0xb40
    $d
        0x00001054:    4000b000    ...@    DCD    1073786880
        0x00001058:    05f5e100    ....    DCD    100000000
        0x0000105c:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x00001060:    4905        .I      LDR      r1,[pc,#20] ; [0x1078] = 0x88
        0x00001062:    b510        ..      PUSH     {r4,lr}
        0x00001064:    3158        X1      ADDS     r1,r1,#0x58
        0x00001066:    d004        ..      BEQ      0x1072 ; TIMER_IRQHandler + 18
        0x00001068:    6848        Hh      LDR      r0,[r1,#4]
        0x0000106a:    6809        .h      LDR      r1,[r1,#0]
        0x0000106c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001070:    4708        .G      BX       r1
        0x00001072:    f7fff96d    ..m.    BL       abort ; 0x350
    $d
        0x00001076:    0000        ..      DCW    0
        0x00001078:    00000088    ....    DCD    136
    $t
    i.TIMER_Int_Register
    TIMER_Int_Register
        0x0000107c:    b510        ..      PUSH     {r4,lr}
        0x0000107e:    b130        0.      CBZ      r0,0x108e ; TIMER_Int_Register + 18
        0x00001080:    460a        .F      MOV      r2,r1
        0x00001082:    4601        .F      MOV      r1,r0
        0x00001084:    e8bd4010    ...@    POP      {r4,lr}
        0x00001088:    200b        .       MOVS     r0,#0xb
        0x0000108a:    f000b9c3    ....    B.W      int_callback_register ; 0x1414
        0x0000108e:    f7fff95f    .._.    BL       abort ; 0x350
        0x00001092:    0000        ..      MOVS     r0,r0
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001094:    4905        .I      LDR      r1,[pc,#20] ; [0x10ac] = 0x88
        0x00001096:    b510        ..      PUSH     {r4,lr}
        0x00001098:    3178        x1      ADDS     r1,r1,#0x78
        0x0000109a:    d004        ..      BEQ      0x10a6 ; UART_IRQHandler + 18
        0x0000109c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000109e:    6809        .h      LDR      r1,[r1,#0]
        0x000010a0:    e8bd4010    ...@    POP      {r4,lr}
        0x000010a4:    4708        .G      BX       r1
        0x000010a6:    f7fff953    ..S.    BL       abort ; 0x350
    $d
        0x000010aa:    0000        ..      DCW    0
        0x000010ac:    00000088    ....    DCD    136
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x000010b0:    4901        .I      LDR      r1,[pc,#4] ; [0x10b8] = 0x88
        0x000010b2:    6848        Hh      LDR      r0,[r1,#4]
        0x000010b4:    6809        .h      LDR      r1,[r1,#0]
        0x000010b6:    4708        .G      BX       r1
    $d
        0x000010b8:    00000088    ....    DCD    136
    $t
    i._DoInit
    _DoInit
        0x000010bc:    b510        ..      PUSH     {r4,lr}
        0x000010be:    4c12        .L      LDR      r4,[pc,#72] ; [0x1108] = 0x2000000c
        0x000010c0:    2003        .       MOVS     r0,#3
        0x000010c2:    2100        .!      MOVS     r1,#0
        0x000010c4:    6120         a      STR      r0,[r4,#0x10]
        0x000010c6:    6160        `a      STR      r0,[r4,#0x14]
        0x000010c8:    a010        ..      ADR      r0,{pc}+0x44 ; 0x110c
        0x000010ca:    61a0        .a      STR      r0,[r4,#0x18]
        0x000010cc:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x000010d0:    61e0        .a      STR      r0,[r4,#0x1c]
        0x000010d2:    f44f6080    O..`    MOV      r0,#0x400
        0x000010d6:    62a1        .b      STR      r1,[r4,#0x28]
        0x000010d8:    6220         b      STR      r0,[r4,#0x20]
        0x000010da:    6261        ab      STR      r1,[r4,#0x24]
        0x000010dc:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x110c
        0x000010de:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000010e0:    6620         f      STR      r0,[r4,#0x60]
        0x000010e2:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x000010e6:    6660        `f      STR      r0,[r4,#0x64]
        0x000010e8:    2010        .       MOVS     r0,#0x10
        0x000010ea:    6721        !g      STR      r1,[r4,#0x70]
        0x000010ec:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x000010f0:    6761        ag      STR      r1,[r4,#0x74]
        0x000010f2:    a109        ..      ADR      r1,{pc}+0x26 ; 0x1118
        0x000010f4:    1de0        ..      ADDS     r0,r4,#7
        0x000010f6:    f7fff933    ..3.    BL       strcpy ; 0x360
        0x000010fa:    a108        ..      ADR      r1,{pc}+0x22 ; 0x111c
        0x000010fc:    4620         F      MOV      r0,r4
        0x000010fe:    f7fff92f    ../.    BL       strcpy ; 0x360
        0x00001102:    2020                MOVS     r0,#0x20
        0x00001104:    71a0        .q      STRB     r0,[r4,#6]
        0x00001106:    bd10        ..      POP      {r4,pc}
    $d
        0x00001108:    2000000c    ...     DCD    536870924
        0x0000110c:    6d726554    Term    DCD    1836213588
        0x00001110:    6c616e69    inal    DCD    1818324585
        0x00001114:    00000000    ....    DCD    0
        0x00001118:    00545452    RTT.    DCD    5526610
        0x0000111c:    47474553    SEGG    DCD    1195853139
        0x00001120:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001124:    6902        .i      LDR      r2,[r0,#0x10]
        0x00001126:    68c1        .h      LDR      r1,[r0,#0xc]
        0x00001128:    428a        .B      CMP      r2,r1
        0x0000112a:    d803        ..      BHI      0x1134 ; _GetAvailWriteSpace + 16
        0x0000112c:    6880        .h      LDR      r0,[r0,#8]
        0x0000112e:    1a40        @.      SUBS     r0,r0,r1
        0x00001130:    4410        .D      ADD      r0,r0,r2
        0x00001132:    e000        ..      B        0x1136 ; _GetAvailWriteSpace + 18
        0x00001134:    1a50        P.      SUBS     r0,r2,r1
        0x00001136:    1e40        @.      SUBS     r0,r0,#1
        0x00001138:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x0000113a:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x0000113e:    000e        ..      MOVS     r6,r1
        0x00001140:    4680        .F      MOV      r8,r0
        0x00001142:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x00001146:    f1c60000    ....    RSB      r0,r6,#0
        0x0000114a:    4699        .F      MOV      r9,r3
        0x0000114c:    4692        .F      MOV      r10,r2
        0x0000114e:    4683        .F      MOV      r11,r0
        0x00001150:    d400        ..      BMI      0x1154 ; _PrintInt + 26
        0x00001152:    4608        .F      MOV      r0,r1
        0x00001154:    2501        .%      MOVS     r5,#1
        0x00001156:    e002        ..      B        0x115e ; _PrintInt + 36
        0x00001158:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x0000115c:    1c6d        m.      ADDS     r5,r5,#1
        0x0000115e:    4550        PE      CMP      r0,r10
        0x00001160:    dafa        ..      BGE      0x1158 ; _PrintInt + 30
        0x00001162:    45a9        .E      CMP      r9,r5
        0x00001164:    d900        ..      BLS      0x1168 ; _PrintInt + 46
        0x00001166:    464d        MF      MOV      r5,r9
        0x00001168:    b124        $.      CBZ      r4,0x1174 ; _PrintInt + 58
        0x0000116a:    2e00        ..      CMP      r6,#0
        0x0000116c:    db01        ..      BLT      0x1172 ; _PrintInt + 56
        0x0000116e:    0778        x.      LSLS     r0,r7,#29
        0x00001170:    d500        ..      BPL      0x1174 ; _PrintInt + 58
        0x00001172:    1e64        d.      SUBS     r4,r4,#1
        0x00001174:    07b8        ..      LSLS     r0,r7,#30
        0x00001176:    d502        ..      BPL      0x117e ; _PrintInt + 68
        0x00001178:    f1b90f00    ....    CMP      r9,#0
        0x0000117c:    d00f        ..      BEQ      0x119e ; _PrintInt + 100
        0x0000117e:    07f8        ..      LSLS     r0,r7,#31
        0x00001180:    d10d        ..      BNE      0x119e ; _PrintInt + 100
        0x00001182:    b164        d.      CBZ      r4,0x119e ; _PrintInt + 100
        0x00001184:    42a5        .B      CMP      r5,r4
        0x00001186:    d20a        ..      BCS      0x119e ; _PrintInt + 100
        0x00001188:    2120         !      MOVS     r1,#0x20
        0x0000118a:    4640        @F      MOV      r0,r8
        0x0000118c:    1e64        d.      SUBS     r4,r4,#1
        0x0000118e:    f000f89d    ....    BL       _StoreChar ; 0x12cc
        0x00001192:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001196:    2800        .(      CMP      r0,#0
        0x00001198:    daf3        ..      BGE      0x1182 ; _PrintInt + 72
        0x0000119a:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x0000119e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000011a2:    2800        .(      CMP      r0,#0
        0x000011a4:    dbf9        ..      BLT      0x119a ; _PrintInt + 96
        0x000011a6:    2e00        ..      CMP      r6,#0
        0x000011a8:    da02        ..      BGE      0x11b0 ; _PrintInt + 118
        0x000011aa:    465e        ^F      MOV      r6,r11
        0x000011ac:    212d        -!      MOVS     r1,#0x2d
        0x000011ae:    e002        ..      B        0x11b6 ; _PrintInt + 124
        0x000011b0:    0778        x.      LSLS     r0,r7,#29
        0x000011b2:    d507        ..      BPL      0x11c4 ; _PrintInt + 138
        0x000011b4:    212b        +!      MOVS     r1,#0x2b
        0x000011b6:    4640        @F      MOV      r0,r8
        0x000011b8:    f000f888    ....    BL       _StoreChar ; 0x12cc
        0x000011bc:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000011c0:    2800        .(      CMP      r0,#0
        0x000011c2:    dbea        ..      BLT      0x119a ; _PrintInt + 96
        0x000011c4:    f0070003    ....    AND      r0,r7,#3
        0x000011c8:    2802        .(      CMP      r0,#2
        0x000011ca:    d10f        ..      BNE      0x11ec ; _PrintInt + 178
        0x000011cc:    f1b90f00    ....    CMP      r9,#0
        0x000011d0:    d10c        ..      BNE      0x11ec ; _PrintInt + 178
        0x000011d2:    b15c        \.      CBZ      r4,0x11ec ; _PrintInt + 178
        0x000011d4:    42a5        .B      CMP      r5,r4
        0x000011d6:    d209        ..      BCS      0x11ec ; _PrintInt + 178
        0x000011d8:    2130        0!      MOVS     r1,#0x30
        0x000011da:    4640        @F      MOV      r0,r8
        0x000011dc:    1e64        d.      SUBS     r4,r4,#1
        0x000011de:    f000f875    ..u.    BL       _StoreChar ; 0x12cc
        0x000011e2:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000011e6:    2800        .(      CMP      r0,#0
        0x000011e8:    daf3        ..      BGE      0x11d2 ; _PrintInt + 152
        0x000011ea:    e7d6        ..      B        0x119a ; _PrintInt + 96
        0x000011ec:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x000011f0:    464b        KF      MOV      r3,r9
        0x000011f2:    4652        RF      MOV      r2,r10
        0x000011f4:    4631        1F      MOV      r1,r6
        0x000011f6:    4640        @F      MOV      r0,r8
        0x000011f8:    f000f802    ....    BL       _PrintUnsigned ; 0x1200
        0x000011fc:    e7cd        ..      B        0x119a ; _PrintInt + 96
        0x000011fe:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x00001200:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x00001204:    4682        .F      MOV      r10,r0
        0x00001206:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x0000120a:    2501        .%      MOVS     r5,#1
        0x0000120c:    4699        .F      MOV      r9,r3
        0x0000120e:    4617        .F      MOV      r7,r2
        0x00001210:    4688        .F      MOV      r8,r1
        0x00001212:    4608        .F      MOV      r0,r1
        0x00001214:    462e        .F      MOV      r6,r5
        0x00001216:    e002        ..      B        0x121e ; _PrintUnsigned + 30
        0x00001218:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x0000121c:    1c76        v.      ADDS     r6,r6,#1
        0x0000121e:    42b8        .B      CMP      r0,r7
        0x00001220:    d2fa        ..      BCS      0x1218 ; _PrintUnsigned + 24
        0x00001222:    45b1        .E      CMP      r9,r6
        0x00001224:    d900        ..      BLS      0x1228 ; _PrintUnsigned + 40
        0x00001226:    464e        NF      MOV      r6,r9
        0x00001228:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x0000122c:    d117        ..      BNE      0x125e ; _PrintUnsigned + 94
        0x0000122e:    b1b4        ..      CBZ      r4,0x125e ; _PrintUnsigned + 94
        0x00001230:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x00001234:    d502        ..      BPL      0x123c ; _PrintUnsigned + 60
        0x00001236:    f1b90f00    ....    CMP      r9,#0
        0x0000123a:    d002        ..      BEQ      0x1242 ; _PrintUnsigned + 66
        0x0000123c:    2020                MOVS     r0,#0x20
        0x0000123e:    9000        ..      STR      r0,[sp,#0]
        0x00001240:    e00b        ..      B        0x125a ; _PrintUnsigned + 90
        0x00001242:    2030        0       MOVS     r0,#0x30
        0x00001244:    e7fb        ..      B        0x123e ; _PrintUnsigned + 62
        0x00001246:    4650        PF      MOV      r0,r10
        0x00001248:    1e64        d.      SUBS     r4,r4,#1
        0x0000124a:    9900        ..      LDR      r1,[sp,#0]
        0x0000124c:    f000f83e    ..>.    BL       _StoreChar ; 0x12cc
        0x00001250:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001254:    2800        .(      CMP      r0,#0
        0x00001256:    db35        5.      BLT      0x12c4 ; _PrintUnsigned + 196
        0x00001258:    b10c        ..      CBZ      r4,0x125e ; _PrintUnsigned + 94
        0x0000125a:    42a6        .B      CMP      r6,r4
        0x0000125c:    d3f3        ..      BCC      0x1246 ; _PrintUnsigned + 70
        0x0000125e:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001262:    2800        .(      CMP      r0,#0
        0x00001264:    db2e        ..      BLT      0x12c4 ; _PrintUnsigned + 196
        0x00001266:    f1b90f01    ....    CMP      r9,#1
        0x0000126a:    d902        ..      BLS      0x1272 ; _PrintUnsigned + 114
        0x0000126c:    f1a90901    ....    SUB      r9,r9,#1
        0x00001270:    e003        ..      B        0x127a ; _PrintUnsigned + 122
        0x00001272:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001276:    42b8        .B      CMP      r0,r7
        0x00001278:    d301        ..      BCC      0x127e ; _PrintUnsigned + 126
        0x0000127a:    437d        }C      MULS     r5,r7,r5
        0x0000127c:    e7f3        ..      B        0x1266 ; _PrintUnsigned + 102
        0x0000127e:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0x12c8] = 0x1568
        0x00001282:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001286:    fb008815    ....    MLS      r8,r0,r5,r8
        0x0000128a:    f8191000    ....    LDRB     r1,[r9,r0]
        0x0000128e:    4650        PF      MOV      r0,r10
        0x00001290:    f000f81c    ....    BL       _StoreChar ; 0x12cc
        0x00001294:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001298:    2800        .(      CMP      r0,#0
        0x0000129a:    db03        ..      BLT      0x12a4 ; _PrintUnsigned + 164
        0x0000129c:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x000012a0:    2d00        .-      CMP      r5,#0
        0x000012a2:    d1ee        ..      BNE      0x1282 ; _PrintUnsigned + 130
        0x000012a4:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x000012a8:    d00c        ..      BEQ      0x12c4 ; _PrintUnsigned + 196
        0x000012aa:    2c00        .,      CMP      r4,#0
        0x000012ac:    d00a        ..      BEQ      0x12c4 ; _PrintUnsigned + 196
        0x000012ae:    42a6        .B      CMP      r6,r4
        0x000012b0:    d208        ..      BCS      0x12c4 ; _PrintUnsigned + 196
        0x000012b2:    2120         !      MOVS     r1,#0x20
        0x000012b4:    4650        PF      MOV      r0,r10
        0x000012b6:    1e64        d.      SUBS     r4,r4,#1
        0x000012b8:    f000f808    ....    BL       _StoreChar ; 0x12cc
        0x000012bc:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x000012c0:    2800        .(      CMP      r0,#0
        0x000012c2:    daf2        ..      BGE      0x12aa ; _PrintUnsigned + 170
        0x000012c4:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x000012c8:    00001568    h...    DCD    5480
    $t
    i._StoreChar
    _StoreChar
        0x000012cc:    b510        ..      PUSH     {r4,lr}
        0x000012ce:    4604        .F      MOV      r4,r0
        0x000012d0:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x000012d4:    1c42        B.      ADDS     r2,r0,#1
        0x000012d6:    4293        .B      CMP      r3,r2
        0x000012d8:    d305        ..      BCC      0x12e6 ; _StoreChar + 26
        0x000012da:    6823        #h      LDR      r3,[r4,#0]
        0x000012dc:    5419        .T      STRB     r1,[r3,r0]
        0x000012de:    60a2        .`      STR      r2,[r4,#8]
        0x000012e0:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000012e2:    1c40        @.      ADDS     r0,r0,#1
        0x000012e4:    60e0        .`      STR      r0,[r4,#0xc]
        0x000012e6:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x000012ea:    4282        .B      CMP      r2,r0
        0x000012ec:    d109        ..      BNE      0x1302 ; _StoreChar + 54
        0x000012ee:    6821        !h      LDR      r1,[r4,#0]
        0x000012f0:    6920         i      LDR      r0,[r4,#0x10]
        0x000012f2:    f7fffd67    ..g.    BL       SEGGER_RTT_Write ; 0xdc4
        0x000012f6:    68a1        .h      LDR      r1,[r4,#8]
        0x000012f8:    4288        .B      CMP      r0,r1
        0x000012fa:    d003        ..      BEQ      0x1304 ; _StoreChar + 56
        0x000012fc:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001300:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001302:    bd10        ..      POP      {r4,pc}
        0x00001304:    2000        .       MOVS     r0,#0
        0x00001306:    60a0        .`      STR      r0,[r4,#8]
        0x00001308:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x0000130a:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000130e:    68c4        .h      LDR      r4,[r0,#0xc]
        0x00001310:    4617        .F      MOV      r7,r2
        0x00001312:    4689        .F      MOV      r9,r1
        0x00001314:    4605        .F      MOV      r5,r0
        0x00001316:    f04f0800    O...    MOV      r8,#0
        0x0000131a:    6928        (i      LDR      r0,[r5,#0x10]
        0x0000131c:    42a0        .B      CMP      r0,r4
        0x0000131e:    d901        ..      BLS      0x1324 ; _WriteBlocking + 26
        0x00001320:    1b06        ..      SUBS     r6,r0,r4
        0x00001322:    e002        ..      B        0x132a ; _WriteBlocking + 32
        0x00001324:    68a9        .h      LDR      r1,[r5,#8]
        0x00001326:    1a20         .      SUBS     r0,r4,r0
        0x00001328:    1a0e        ..      SUBS     r6,r1,r0
        0x0000132a:    68a8        .h      LDR      r0,[r5,#8]
        0x0000132c:    1e76        v.      SUBS     r6,r6,#1
        0x0000132e:    1b00        ..      SUBS     r0,r0,r4
        0x00001330:    42b0        .B      CMP      r0,r6
        0x00001332:    d800        ..      BHI      0x1336 ; _WriteBlocking + 44
        0x00001334:    4606        .F      MOV      r6,r0
        0x00001336:    42be        .B      CMP      r6,r7
        0x00001338:    d300        ..      BCC      0x133c ; _WriteBlocking + 50
        0x0000133a:    463e        >F      MOV      r6,r7
        0x0000133c:    6868        hh      LDR      r0,[r5,#4]
        0x0000133e:    4632        2F      MOV      r2,r6
        0x00001340:    4420         D      ADD      r0,r0,r4
        0x00001342:    4649        IF      MOV      r1,r9
        0x00001344:    f7fff830    ..0.    BL       __aeabi_memcpy ; 0x3a8
        0x00001348:    68a8        .h      LDR      r0,[r5,#8]
        0x0000134a:    1bbf        ..      SUBS     r7,r7,r6
        0x0000134c:    4434        4D      ADD      r4,r4,r6
        0x0000134e:    44b0        .D      ADD      r8,r8,r6
        0x00001350:    44b1        .D      ADD      r9,r9,r6
        0x00001352:    42a0        .B      CMP      r0,r4
        0x00001354:    d100        ..      BNE      0x1358 ; _WriteBlocking + 78
        0x00001356:    2400        .$      MOVS     r4,#0
        0x00001358:    60ec        .`      STR      r4,[r5,#0xc]
        0x0000135a:    2f00        ./      CMP      r7,#0
        0x0000135c:    d1dd        ..      BNE      0x131a ; _WriteBlocking + 16
        0x0000135e:    4640        @F      MOV      r0,r8
        0x00001360:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001364:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001368:    4604        .F      MOV      r4,r0
        0x0000136a:    4688        .F      MOV      r8,r1
        0x0000136c:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x00001370:    1bc5        ..      SUBS     r5,r0,r7
        0x00001372:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00001374:    6860        `h      LDR      r0,[r4,#4]
        0x00001376:    4616        .F      MOV      r6,r2
        0x00001378:    4408        .D      ADD      r0,r0,r1
        0x0000137a:    42b5        .B      CMP      r5,r6
        0x0000137c:    d906        ..      BLS      0x138c ; _WriteNoCheck + 40
        0x0000137e:    4641        AF      MOV      r1,r8
        0x00001380:    f7fff812    ....    BL       __aeabi_memcpy ; 0x3a8
        0x00001384:    19b8        ..      ADDS     r0,r7,r6
        0x00001386:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001388:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x0000138c:    462a        *F      MOV      r2,r5
        0x0000138e:    4641        AF      MOV      r1,r8
        0x00001390:    f7fff80a    ....    BL       __aeabi_memcpy ; 0x3a8
        0x00001394:    1b76        v.      SUBS     r6,r6,r5
        0x00001396:    eb080105    ....    ADD      r1,r8,r5
        0x0000139a:    4632        2F      MOV      r2,r6
        0x0000139c:    6860        `h      LDR      r0,[r4,#4]
        0x0000139e:    f7fff803    ....    BL       __aeabi_memcpy ; 0x3a8
        0x000013a2:    60e6        .`      STR      r6,[r4,#0xc]
        0x000013a4:    e7f0        ..      B        0x1388 ; _WriteNoCheck + 36
        0x000013a6:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x000013a8:    b672        r.      CPSID    i
        0x000013aa:    4603        .F      MOV      r3,r0
        0x000013ac:    a001        ..      ADR      r0,{pc}+8 ; 0x13b4
        0x000013ae:    f7feff29    ..).    BL       __2printf ; 0x204
        0x000013b2:    e7fe        ..      B        0x13b2 ; __aeabi_assert + 10
    $d
        0x000013b4:    65737341    Asse    DCD    1702064961
        0x000013b8:    6f697472    rtio    DCD    1869182066
        0x000013bc:    6146206e    n Fa    DCD    1631985774
        0x000013c0:    64656c69    iled    DCD    1684368489
        0x000013c4:    6966203a    : fi    DCD    1768300602
        0x000013c8:    2520656c    le %    DCD    622880108
        0x000013cc:    6c202c73    s, l    DCD    1814047859
        0x000013d0:    20656e69    ine     DCD    543518313
        0x000013d4:    202c6425    %d,     DCD    539780133
        0x000013d8:    000a7325    %s..    DCD    684837
    $t
    i.fputc
    fputc
        0x000013dc:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000013de:    2201        ."      MOVS     r2,#1
        0x000013e0:    4669        iF      MOV      r1,sp
        0x000013e2:    2000        .       MOVS     r0,#0
        0x000013e4:    f7fffcee    ....    BL       SEGGER_RTT_Write ; 0xdc4
        0x000013e8:    9800        ..      LDR      r0,[sp,#0]
        0x000013ea:    bd1c        ..      POP      {r2-r4,pc}
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x000013ec:    4903        .I      LDR      r1,[pc,#12] ; [0x13fc] = 0x40007000
        0x000013ee:    6809        .h      LDR      r1,[r1,#0]
        0x000013f0:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000013f4:    4a01        .J      LDR      r2,[pc,#4] ; [0x13fc] = 0x40007000
        0x000013f6:    6011        .`      STR      r1,[r2,#0]
        0x000013f8:    4770        pG      BX       lr
    $d
        0x000013fa:    0000        ..      DCW    0
        0x000013fc:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00001400:    4903        .I      LDR      r1,[pc,#12] ; [0x1410] = 0x40007000
        0x00001402:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001404:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001408:    4a01        .J      LDR      r2,[pc,#4] ; [0x1410] = 0x40007000
        0x0000140a:    60d1        .`      STR      r1,[r2,#0xc]
        0x0000140c:    4770        pG      BX       lr
    $d
        0x0000140e:    0000        ..      DCW    0
        0x00001410:    40007000    .p.@    DCD    1073770496
    $t
    i.int_callback_register
    int_callback_register
        0x00001414:    b510        ..      PUSH     {r4,lr}
        0x00001416:    2812        .(      CMP      r0,#0x12
        0x00001418:    d301        ..      BCC      0x141e ; int_callback_register + 10
        0x0000141a:    f7feff99    ....    BL       abort ; 0x350
        0x0000141e:    4b03        .K      LDR      r3,[pc,#12] ; [0x142c] = 0x88
        0x00001420:    f8431030    C.0.    STR      r1,[r3,r0,LSL #3]
        0x00001424:    eb0300c0    ....    ADD      r0,r3,r0,LSL #3
        0x00001428:    6042        B`      STR      r2,[r0,#4]
        0x0000142a:    bd10        ..      POP      {r4,pc}
    $d
        0x0000142c:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x00001430:    a103        ..      ADR      r1,{pc}+0x10 ; 0x1440
        0x00001432:    2000        .       MOVS     r0,#0
        0x00001434:    f7fffd10    ....    BL       SEGGER_RTT_printf ; 0xe58
        0x00001438:    f000f828    ..(.    BL       test_timer ; 0x148c
        0x0000143c:    e7fe        ..      B        0x143c ; main + 12
    $d
        0x0000143e:    0000        ..      DCW    0
        0x00001440:    6c6c6548    Hell    DCD    1819043144
        0x00001444:    6f57206f    o Wo    DCD    1867980911
        0x00001448:    20646c72    rld     DCD    543452274
        0x0000144c:    38313032    2018    DCD    942747698
        0x00001450:    34303530    0504    DCD    875574576
        0x00001454:    00000a7e    ~...    DCD    2686
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001458:    4901        .I      LDR      r1,[pc,#4] ; [0x1460] = 0x40020000
        0x0000145a:    6008        .`      STR      r0,[r1,#0]
        0x0000145c:    4770        pG      BX       lr
    $d
        0x0000145e:    0000        ..      DCW    0
        0x00001460:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001464:    4903        .I      LDR      r1,[pc,#12] ; [0x1474] = 0x40020000
        0x00001466:    6849        Ih      LDR      r1,[r1,#4]
        0x00001468:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x0000146c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1474] = 0x40020000
        0x0000146e:    6051        Q`      STR      r1,[r2,#4]
        0x00001470:    4770        pG      BX       lr
    $d
        0x00001472:    0000        ..      DCW    0
        0x00001474:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_cpu_div_update_pack
    sysc_cpu_div_update_pack
        0x00001478:    b510        ..      PUSH     {r4,lr}
        0x0000147a:    00c3        ..      LSLS     r3,r0,#3
        0x0000147c:    ea430381    C...    ORR      r3,r3,r1,LSL #2
        0x00001480:    4313        .C      ORRS     r3,r3,r2
        0x00001482:    f04f4480    O..D    MOV      r4,#0x40000000
        0x00001486:    6023        #`      STR      r3,[r4,#0]
        0x00001488:    bd10        ..      POP      {r4,pc}
        0x0000148a:    0000        ..      MOVS     r0,r0
    i.test_timer
    test_timer
        0x0000148c:    2000        .       MOVS     r0,#0
        0x0000148e:    f3600407    `...    BFI      r4,r0,#0,#8
        0x00001492:    f360240f    `..$    BFI      r4,r0,#8,#8
        0x00001496:    2001        .       MOVS     r0,#1
        0x00001498:    f3600107    `...    BFI      r1,r0,#0,#8
        0x0000149c:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x000014a0:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x000014a4:    f3604417    `..D    BFI      r4,r0,#16,#8
        0x000014a8:    4d18        .M      LDR      r5,[pc,#96] ; [0x150c] = 0x2faf08
        0x000014aa:    460e        .F      MOV      r6,r1
        0x000014ac:    2010        .       MOVS     r0,#0x10
        0x000014ae:    f7fff98d    ....    BL       HAL_GPIO_Init ; 0x7cc
        0x000014b2:    4631        1F      MOV      r1,r6
        0x000014b4:    2011        .       MOVS     r0,#0x11
        0x000014b6:    f7fff989    ....    BL       HAL_GPIO_Init ; 0x7cc
        0x000014ba:    4631        1F      MOV      r1,r6
        0x000014bc:    2012        .       MOVS     r0,#0x12
        0x000014be:    f7fff985    ....    BL       HAL_GPIO_Init ; 0x7cc
        0x000014c2:    4631        1F      MOV      r1,r6
        0x000014c4:    2013        .       MOVS     r0,#0x13
        0x000014c6:    f7fff981    ....    BL       HAL_GPIO_Init ; 0x7cc
        0x000014ca:    4911        .I      LDR      r1,[pc,#68] ; [0x1510] = 0x20000008
        0x000014cc:    4811        .H      LDR      r0,[pc,#68] ; [0x1514] = 0x1519
        0x000014ce:    f7fffdd5    ....    BL       TIMER_Int_Register ; 0x107c
        0x000014d2:    462a        *F      MOV      r2,r5
        0x000014d4:    4621        !F      MOV      r1,r4
        0x000014d6:    00e8        ..      LSLS     r0,r5,#3
        0x000014d8:    f7fffbac    ....    BL       HAL_TIMER_Init ; 0xc34
        0x000014dc:    1069        i.      ASRS     r1,r5,#1
        0x000014de:    2000        .       MOVS     r0,#0
        0x000014e0:    f7fffc10    ....    BL       HAL_TIMER_Set_LoadCount ; 0xd04
        0x000014e4:    2101        .!      MOVS     r1,#1
        0x000014e6:    2000        .       MOVS     r0,#0
        0x000014e8:    f7fffb8a    ....    BL       HAL_TIMER_Enable ; 0xc00
        0x000014ec:    f04f21e0    O..!    MOV      r1,#0xe000e000
        0x000014f0:    f44f6000    O..`    MOV      r0,#0x800
        0x000014f4:    f8c10100    ....    STR      r0,[r1,#0x100]
        0x000014f8:    2101        .!      MOVS     r1,#1
        0x000014fa:    2010        .       MOVS     r0,#0x10
        0x000014fc:    f7fffa26    ..&.    BL       HAL_GPIO_WritePin ; 0x94c
        0x00001500:    2101        .!      MOVS     r1,#1
        0x00001502:    2011        .       MOVS     r0,#0x11
        0x00001504:    f7fffa22    ..".    BL       HAL_GPIO_WritePin ; 0x94c
        0x00001508:    e7f6        ..      B        0x14f8 ; test_timer + 108
    $d
        0x0000150a:    0000        ..      DCW    0
        0x0000150c:    002faf08    ../.    DCD    3125000
        0x00001510:    20000008    ...     DCD    536870920
        0x00001514:    00001519    ....    DCD    5401
    $t
    i.timer_isr
    timer_isr
        0x00001518:    b510        ..      PUSH     {r4,lr}
        0x0000151a:    2100        .!      MOVS     r1,#0
        0x0000151c:    2010        .       MOVS     r0,#0x10
        0x0000151e:    f7fffa15    ....    BL       HAL_GPIO_WritePin ; 0x94c
        0x00001522:    2100        .!      MOVS     r1,#0
        0x00001524:    2011        .       MOVS     r0,#0x11
        0x00001526:    f7fffa11    ....    BL       HAL_GPIO_WritePin ; 0x94c
        0x0000152a:    f44f717a    O.zq    MOV      r1,#0x3e8
        0x0000152e:    f2413288    A..2    MOV      r2,#0x1388
        0x00001532:    4610        .F      MOV      r0,r2
        0x00001534:    1e40        @.      SUBS     r0,r0,#1
        0x00001536:    d1fd        ..      BNE      0x1534 ; timer_isr + 28
        0x00001538:    1e49        I.      SUBS     r1,r1,#1
        0x0000153a:    d1fa        ..      BNE      0x1532 ; timer_isr + 26
        0x0000153c:    a003        ..      ADR      r0,{pc}+0x10 ; 0x154c
        0x0000153e:    f7fefe61    ..a.    BL       __2printf ; 0x204
        0x00001542:    e8bd4010    ...@    POP      {r4,lr}
        0x00001546:    2000        .       MOVS     r0,#0
        0x00001548:    f7ffbbcc    ....    B        HAL_TIMER_Int_Clr ; 0xce4
    $d
        0x0000154c:    32666c45    Elf2    DCD    845573189
        0x00001550:    55434d20     MCU    DCD    1430474016
        0x00001554:    4d495420     TIM    DCD    1296651296
        0x00001558:    50205245    ER P    DCD    1344295493
        0x0000155c:    656a6f72    roje    DCD    1701474162
        0x00001560:    0a7e7463    ct~.    DCD    176059491
        0x00001564:    00000000    ....    DCD    0
    $d.realdata
    .constdata
    _aV2C
        0x00001568:    33323130    0123    DCD    858927408
        0x0000156c:    37363534    4567    DCD    926299444
        0x00001570:    42413938    89AB    DCD    1111570744
        0x00001574:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001578:    00001598    ....    DCD    5528
        0x0000157c:    20000000    ...     DCD    536870912
        0x00001580:    0000000c    ....    DCD    12
        0x00001584:    00000154    T...    DCD    340
        0x00001588:    000015a4    ....    DCD    5540
        0x0000158c:    2000000c    ...     DCD    536870924
        0x00001590:    00000a1c    ....    DCD    2588
        0x00001594:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 5580 (0x15cc)
    Size        : 12 bytes (0xc)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x2000000c
    File Offset : 5592 (0x15d8)
    Size        : 2588 bytes (0xa1c)
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
    File Offset : 5592 (0x15d8)
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
    File Offset : 7068 (0x1b9c)
    Size        : 2916 bytes (0xb64)
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
    File Offset : 9984 (0x2700)
    Size        : 86644 bytes (0x15274)
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
    File Offset : 96628 (0x17974)
    Size        : 12528 bytes (0x30f0)
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
    File Offset : 109156 (0x1aa64)
    Size        : 5016 bytes (0x1398)
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
    File Offset : 114172 (0x1bdfc)
    Size        : 28424 bytes (0x6f08)
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
    File Offset : 142596 (0x22d04)
    Size        : 2022 bytes (0x7e6)
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
    File Offset : 144620 (0x234ec)
    Size        : 8544 bytes (0x2160)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 378
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 153164 (0x2564c)
    Size        : 7148 bytes (0x1bec)
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
    File Offset : 160312 (0x27238)
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
    File Offset : 160348 (0x2725c)
    Size        : 12788 bytes (0x31f4)
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
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p561c-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p561c-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p58b4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p58b4-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Ke
    
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    test_timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_timer.o --vfemode=force

    Input Comments:
    
    p5c94-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p5c94-2
    
    
    
    test_timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_timer.o --depend=.\objects\test_timer.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\TIMER_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_timer.crf src\test_timer.c
    
    
    
    
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
    
    
    
    
    
    timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\timer.o --vfemode=force

    Input Comments:
    
    p67e8-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p67e8-2
    
    
    
    timer.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\timer.o --depend=.\objects\timer.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\timer.crf ..\sdk\src\soc\driver\timer.c
    
    
    
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
    File Offset : 173136 (0x2a450)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x20000008  0x1        parameter                                uint8_t

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x2000000c  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x2000000c  0x10       _SEGGER_RTT.acID                         array[16] of char
0x2000001c  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x20000020  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x20000024  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x2000006c  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x200004b4  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x200000b4  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x20000004  0x4        __stdout                                 FILE
0x20000004  0x4        __stdout.handle                          int

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

