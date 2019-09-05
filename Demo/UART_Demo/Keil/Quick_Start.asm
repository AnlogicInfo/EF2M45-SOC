
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

    Program header offset: 177616 (0x0002b5d0)
    Section header offset: 177648 (0x0002b5f0)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 10680 bytes (0x29b8)
    Size in memory: 13616 bytes (0x3530)
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
    Size        : 10144 bytes (0x27a0)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0

    $t
    !!!main
    __main
        0x00000118:    f000f802    ....    BL       __scatterload ; 0x120
        0x0000011c:    f000f862    ..b.    BL       __rt_entry ; 0x1e4
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
        0x00000132:    f000f857    ..W.    BL       __rt_entry ; 0x1e4
        0x00000136:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x12f
        0x0000013a:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x0000013e:    f0130f01    ....    TST      r3,#1
        0x00000142:    bf18        ..      IT       NE
        0x00000144:    1afb        ..      SUBNE    r3,r7,r3
        0x00000146:    f0430301    C...    ORR      r3,r3,#1
        0x0000014a:    4718        .G      BX       r3
    $d
        0x0000014c:    0000274c    L'..    DCD    10060
        0x00000150:    0000276c    l'..    DCD    10092
    $t
    !!dczerorl2
    __decompress
    __decompress1
        0x00000154:    440a        .D      ADD      r2,r2,r1
        0x00000156:    f04f0c00    O...    MOV      r12,#0
        0x0000015a:    f8103b01    ...;    LDRB     r3,[r0],#1
        0x0000015e:    f0130407    ....    ANDS     r4,r3,#7
        0x00000162:    bf08        ..      IT       EQ
        0x00000164:    f8104b01    ...K    LDRBEQ   r4,[r0],#1
        0x00000168:    111d        ..      ASRS     r5,r3,#4
        0x0000016a:    bf08        ..      IT       EQ
        0x0000016c:    f8105b01    ...[    LDRBEQ   r5,[r0],#1
        0x00000170:    1e64        d.      SUBS     r4,r4,#1
        0x00000172:    d005        ..      BEQ      0x180 ; __decompress + 44
        0x00000174:    f8106b01    ...k    LDRB     r6,[r0],#1
        0x00000178:    1e64        d.      SUBS     r4,r4,#1
        0x0000017a:    f8016b01    ...k    STRB     r6,[r1],#1
        0x0000017e:    d1f9        ..      BNE      0x174 ; __decompress + 32
        0x00000180:    f0130f08    ....    TST      r3,#8
        0x00000184:    bf1e        ..      ITTT     NE
        0x00000186:    f8104b01    ...K    LDRBNE   r4,[r0],#1
        0x0000018a:    1cad        ..      ADDNE    r5,r5,#2
        0x0000018c:    1b0c        ..      SUBNE    r4,r1,r4
        0x0000018e:    d109        ..      BNE      0x1a4 ; __decompress + 80
        0x00000190:    1e6d        m.      SUBS     r5,r5,#1
        0x00000192:    bf58        X.      IT       PL
        0x00000194:    f801cb01    ....    STRBPL   r12,[r1],#1
        0x00000198:    d5fa        ..      BPL      0x190 ; __decompress + 60
        0x0000019a:    e005        ..      B        0x1a8 ; __decompress + 84
        0x0000019c:    f8146b01    ...k    LDRB     r6,[r4],#1
        0x000001a0:    f8016b01    ...k    STRB     r6,[r1],#1
        0x000001a4:    1e6d        m.      SUBS     r5,r5,#1
        0x000001a6:    d5f9        ..      BPL      0x19c ; __decompress + 72
        0x000001a8:    4291        .B      CMP      r1,r2
        0x000001aa:    d3d6        ..      BCC      0x15a ; __decompress + 6
        0x000001ac:    4770        pG      BX       lr
        0x000001ae:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x000001b0:    2300        .#      MOVS     r3,#0
        0x000001b2:    2400        .$      MOVS     r4,#0
        0x000001b4:    2500        .%      MOVS     r5,#0
        0x000001b6:    2600        .&      MOVS     r6,#0
        0x000001b8:    3a10        .:      SUBS     r2,r2,#0x10
        0x000001ba:    bf28        (.      IT       CS
        0x000001bc:    c178        x.      STMCS    r1!,{r3-r6}
        0x000001be:    d8fb        ..      BHI      0x1b8 ; __scatterload_zeroinit + 8
        0x000001c0:    0752        R.      LSLS     r2,r2,#29
        0x000001c2:    bf28        (.      IT       CS
        0x000001c4:    c130        0.      STMCS    r1!,{r4,r5}
        0x000001c6:    bf48        H.      IT       MI
        0x000001c8:    600b        .`      STRMI    r3,[r1,#0]
        0x000001ca:    4770        pG      BX       lr
    .ARM.Collect$$_printf_percent$$00000009
    .ARM.Collect$$_printf_percent$$00000000
    _printf_d
    _printf_percent
        0x000001cc:    2964        d)      CMP      r1,#0x64
        0x000001ce:    f00080a3    ....    BEQ.W    _printf_int_dec ; 0x318
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x000001d2:    2973        s)      CMP      r1,#0x73
        0x000001d4:    f00081e5    ....    BEQ.W    _printf_string ; 0x5a2
    .ARM.Collect$$_printf_percent$$00000017
    _printf_percent_end
        0x000001d8:    2000        .       MOVS     r0,#0
        0x000001da:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x000001dc:    b51f        ..      PUSH     {r0-r4,lr}
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
        0x000001de:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x000001e0:    b510        ..      PUSH     {r4,lr}
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
        0x000001e2:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x000001e4:    f000fa10    ....    BL       __user_setup_stackheap ; 0x608
        0x000001e8:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x000001ea:    f7fffff7    ....    BL       __rt_lib_init ; 0x1dc
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x000001ee:    f001fe13    ....    BL       main ; 0x1e18
        0x000001f2:    f000fa2e    ....    BL       exit ; 0x652
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x000001f6:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x000001f8:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x1e0
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x000001fc:    bc03        ..      POP      {r0,r1}
        0x000001fe:    f000fa33    ..3.    BL       _sys_exit ; 0x668
        0x00000202:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x00000204:    4809        .H      LDR      r0,[pc,#36] ; [0x22c] = 0x1479
        0x00000206:    4780        .G      BLX      r0
        0x00000208:    4809        .H      LDR      r0,[pc,#36] ; [0x230] = 0x119
        0x0000020a:    4700        .G      BX       r0
    NMI_Handler
        0x0000020c:    e7fe        ..      B        NMI_Handler ; 0x20c
    HardFault_Handler
        0x0000020e:    e7fe        ..      B        HardFault_Handler ; 0x20e
    MemManage_Handler
        0x00000210:    e7fe        ..      B        MemManage_Handler ; 0x210
    BusFault_Handler
        0x00000212:    e7fe        ..      B        BusFault_Handler ; 0x212
    UsageFault_Handler
        0x00000214:    e7fe        ..      B        UsageFault_Handler ; 0x214
    SVC_Handler
        0x00000216:    e7fe        ..      B        SVC_Handler ; 0x216
    DebugMon_Handler
        0x00000218:    e7fe        ..      B        DebugMon_Handler ; 0x218
    PendSV_Handler
        0x0000021a:    e7fe        ..      B        PendSV_Handler ; 0x21a
    SysTick_Handler
        0x0000021c:    e7fe        ..      B        SysTick_Handler ; 0x21c
        0x0000021e:    e7fe        ..      B        0x21e ; SysTick_Handler + 2
    __user_initial_stackheap
        0x00000220:    4804        .H      LDR      r0,[pc,#16] ; [0x234] = 0x20000778
        0x00000222:    4905        .I      LDR      r1,[pc,#20] ; [0x238] = 0x20000c78
        0x00000224:    4a05        .J      LDR      r2,[pc,#20] ; [0x23c] = 0x20000878
        0x00000226:    4b06        .K      LDR      r3,[pc,#24] ; [0x240] = 0x20000878
        0x00000228:    4770        pG      BX       lr
    $d
        0x0000022a:    0000        ..      DCW    0
        0x0000022c:    00001479    y...    DCD    5241
        0x00000230:    00000119    ....    DCD    281
        0x00000234:    20000778    x..     DCD    536872824
        0x00000238:    20000c78    x..     DCD    536874104
        0x0000023c:    20000878    x..     DCD    536873080
        0x00000240:    20000878    x..     DCD    536873080
    $t
    .text
    __2printf
        0x00000244:    b40f        ..      PUSH     {r0-r3}
        0x00000246:    4904        .I      LDR      r1,[pc,#16] ; [0x258] = 0x200001f0
        0x00000248:    b510        ..      PUSH     {r4,lr}
        0x0000024a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000024c:    9802        ..      LDR      r0,[sp,#8]
        0x0000024e:    f000f9ad    ....    BL       _printf_char_file ; 0x5ac
        0x00000252:    bc10        ..      POP      {r4}
        0x00000254:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000258:    200001f0    ...     DCD    536871408
    $t
    .text
    __printf
        0x0000025c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000260:    460e        .F      MOV      r6,r1
        0x00000262:    4604        .F      MOV      r4,r0
        0x00000264:    2000        .       MOVS     r0,#0
        0x00000266:    6220         b      STR      r0,[r4,#0x20]
        0x00000268:    4620         F      MOV      r0,r4
        0x0000026a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x0000026c:    4788        .G      BLX      r1
        0x0000026e:    b330        0.      CBZ      r0,0x2be ; __printf + 98
        0x00000270:    2825        %(      CMP      r0,#0x25
        0x00000272:    d005        ..      BEQ      0x280 ; __printf + 36
        0x00000274:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000278:    4790        .G      BLX      r2
        0x0000027a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000027c:    1c40        @.      ADDS     r0,r0,#1
        0x0000027e:    e7f2        ..      B        0x266 ; __printf + 10
        0x00000280:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000282:    4620         F      MOV      r0,r4
        0x00000284:    2700        .'      MOVS     r7,#0
        0x00000286:    4788        .G      BLX      r1
        0x00000288:    0005        ..      MOVS     r5,r0
        0x0000028a:    d018        ..      BEQ      0x2be ; __printf + 98
        0x0000028c:    f1a50041    ..A.    SUB      r0,r5,#0x41
        0x00000290:    2819        .(      CMP      r0,#0x19
        0x00000292:    d802        ..      BHI      0x29a ; __printf + 62
        0x00000294:    3520         5      ADDS     r5,r5,#0x20
        0x00000296:    f44f6700    O..g    MOV      r7,#0x800
        0x0000029a:    4632        2F      MOV      r2,r6
        0x0000029c:    4629        )F      MOV      r1,r5
        0x0000029e:    4620         F      MOV      r0,r4
        0x000002a0:    6027        '`      STR      r7,[r4,#0]
        0x000002a2:    f7ffff93    ....    BL       _printf_d ; 0x1cc
        0x000002a6:    b140        @.      CBZ      r0,0x2ba ; __printf + 94
        0x000002a8:    2801        .(      CMP      r0,#1
        0x000002aa:    d004        ..      BEQ      0x2b6 ; __printf + 90
        0x000002ac:    1df6        ..      ADDS     r6,r6,#7
        0x000002ae:    f0260607    &...    BIC      r6,r6,#7
        0x000002b2:    3608        .6      ADDS     r6,r6,#8
        0x000002b4:    e7d8        ..      B        0x268 ; __printf + 12
        0x000002b6:    1d36        6.      ADDS     r6,r6,#4
        0x000002b8:    e7d6        ..      B        0x268 ; __printf + 12
        0x000002ba:    4628        (F      MOV      r0,r5
        0x000002bc:    e7da        ..      B        0x274 ; __printf + 24
        0x000002be:    6a20         j      LDR      r0,[r4,#0x20]
        0x000002c0:    e8bd81f0    ....    POP      {r4-r8,pc}
    .text
    _printf_str
        0x000002c4:    b570        p.      PUSH     {r4-r6,lr}
        0x000002c6:    460c        .F      MOV      r4,r1
        0x000002c8:    4605        .F      MOV      r5,r0
        0x000002ca:    2a01        .*      CMP      r2,#1
        0x000002cc:    d005        ..      BEQ      0x2da ; _printf_str + 22
        0x000002ce:    7828        (x      LDRB     r0,[r5,#0]
        0x000002d0:    0680        ..      LSLS     r0,r0,#26
        0x000002d2:    d500        ..      BPL      0x2d6 ; _printf_str + 18
        0x000002d4:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x000002d6:    2300        .#      MOVS     r3,#0
        0x000002d8:    e002        ..      B        0x2e0 ; _printf_str + 28
        0x000002da:    2301        .#      MOVS     r3,#1
        0x000002dc:    e005        ..      B        0x2ea ; _printf_str + 38
        0x000002de:    1c5b        [.      ADDS     r3,r3,#1
        0x000002e0:    4293        .B      CMP      r3,r2
        0x000002e2:    d202        ..      BCS      0x2ea ; _printf_str + 38
        0x000002e4:    5ce0        .\      LDRB     r0,[r4,r3]
        0x000002e6:    2800        .(      CMP      r0,#0
        0x000002e8:    d1f9        ..      BNE      0x2de ; _printf_str + 26
        0x000002ea:    69a8        .i      LDR      r0,[r5,#0x18]
        0x000002ec:    18e6        ..      ADDS     r6,r4,r3
        0x000002ee:    1ac0        ..      SUBS     r0,r0,r3
        0x000002f0:    61a8        .a      STR      r0,[r5,#0x18]
        0x000002f2:    6a28        (j      LDR      r0,[r5,#0x20]
        0x000002f4:    4418        .D      ADD      r0,r0,r3
        0x000002f6:    6228        (b      STR      r0,[r5,#0x20]
        0x000002f8:    4628        (F      MOV      r0,r5
        0x000002fa:    f3af8000    ....    NOP.W    
        0x000002fe:    e004        ..      B        0x30a ; _printf_str + 70
        0x00000300:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x00000304:    f8140b01    ....    LDRB     r0,[r4],#1
        0x00000308:    4790        .G      BLX      r2
        0x0000030a:    42b4        .B      CMP      r4,r6
        0x0000030c:    d3f8        ..      BCC      0x300 ; _printf_str + 60
        0x0000030e:    4628        (F      MOV      r0,r5
        0x00000310:    f3af8000    ....    NOP.W    
        0x00000314:    bd70        p.      POP      {r4-r6,pc}
        0x00000316:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x00000318:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000031c:    4606        .F      MOV      r6,r0
        0x0000031e:    2400        .$      MOVS     r4,#0
        0x00000320:    6810        .h      LDR      r0,[r2,#0]
        0x00000322:    2975        u)      CMP      r1,#0x75
        0x00000324:    4631        1F      MOV      r1,r6
        0x00000326:    a516        ..      ADR      r5,{pc}+0x5a ; 0x380
        0x00000328:    d010        ..      BEQ      0x34c ; _printf_int_dec + 52
        0x0000032a:    f3af8000    ....    NOP.W    
        0x0000032e:    2800        .(      CMP      r0,#0
        0x00000330:    da02        ..      BGE      0x338 ; _printf_int_dec + 32
        0x00000332:    4240        @B      RSBS     r0,r0,#0
        0x00000334:    a513        ..      ADR      r5,{pc}+0x50 ; 0x384
        0x00000336:    e007        ..      B        0x348 ; _printf_int_dec + 48
        0x00000338:    6831        1h      LDR      r1,[r6,#0]
        0x0000033a:    078a        ..      LSLS     r2,r1,#30
        0x0000033c:    d501        ..      BPL      0x342 ; _printf_int_dec + 42
        0x0000033e:    a512        ..      ADR      r5,{pc}+0x4a ; 0x388
        0x00000340:    e002        ..      B        0x348 ; _printf_int_dec + 48
        0x00000342:    0749        I.      LSLS     r1,r1,#29
        0x00000344:    d504        ..      BPL      0x350 ; _printf_int_dec + 56
        0x00000346:    a511        ..      ADR      r5,{pc}+0x46 ; 0x38c
        0x00000348:    2401        .$      MOVS     r4,#1
        0x0000034a:    e001        ..      B        0x350 ; _printf_int_dec + 56
        0x0000034c:    f3af8000    ....    NOP.W    
        0x00000350:    2100        .!      MOVS     r1,#0
        0x00000352:    220a        ."      MOVS     r2,#0xa
        0x00000354:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x00000358:    e009        ..      B        0x36e ; _printf_int_dec + 86
        0x0000035a:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x0000035e:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x00000362:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x00000366:    3030        00      ADDS     r0,r0,#0x30
        0x00000368:    5478        xT      STRB     r0,[r7,r1]
        0x0000036a:    4618        .F      MOV      r0,r3
        0x0000036c:    1c49        I.      ADDS     r1,r1,#1
        0x0000036e:    2800        .(      CMP      r0,#0
        0x00000370:    d1f3        ..      BNE      0x35a ; _printf_int_dec + 66
        0x00000372:    4623        #F      MOV      r3,r4
        0x00000374:    462a        *F      MOV      r2,r5
        0x00000376:    4630        0F      MOV      r0,r6
        0x00000378:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x0000037c:    f000b8a6    ....    B.W      _printf_int_common ; 0x4cc
    $d
        0x00000380:    00000000    ....    DCD    0
        0x00000384:    0000002d    -...    DCD    45
        0x00000388:    0000002b    +...    DCD    43
        0x0000038c:    00000020     ...    DCD    32
    $t
    .text
    strcpy
        0x00000390:    ea400301    @...    ORR      r3,r0,r1
        0x00000394:    4602        .F      MOV      r2,r0
        0x00000396:    b530        0.      PUSH     {r4,r5,lr}
        0x00000398:    079b        ..      LSLS     r3,r3,#30
        0x0000039a:    d110        ..      BNE      0x3be ; strcpy + 46
        0x0000039c:    f04f3401    O..4    MOV      r4,#0x1010101
        0x000003a0:    e000        ..      B        0x3a4 ; strcpy + 20
        0x000003a2:    c208        ..      STM      r2!,{r3}
        0x000003a4:    c908        ..      LDM      r1!,{r3}
        0x000003a6:    1b1d        ..      SUBS     r5,r3,r4
        0x000003a8:    439d        .C      BICS     r5,r5,r3
        0x000003aa:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x000003ae:    d0f8        ..      BEQ      0x3a2 ; strcpy + 18
        0x000003b0:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x000003b4:    f8021b01    ....    STRB     r1,[r2],#1
        0x000003b8:    d00d        ..      BEQ      0x3d6 ; strcpy + 70
        0x000003ba:    0a1b        ..      LSRS     r3,r3,#8
        0x000003bc:    e7f8        ..      B        0x3b0 ; strcpy + 32
        0x000003be:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003c2:    2b00        .+      CMP      r3,#0
        0x000003c4:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003c8:    d005        ..      BEQ      0x3d6 ; strcpy + 70
        0x000003ca:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003ce:    2b00        .+      CMP      r3,#0
        0x000003d0:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003d4:    d1f3        ..      BNE      0x3be ; strcpy + 46
        0x000003d6:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x000003d8:    2a03        .*      CMP      r2,#3
        0x000003da:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x43e
        0x000003de:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003e2:    f0008015    ....    BEQ.W    0x410 ; __aeabi_memcpy + 56
        0x000003e6:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003ea:    f1bc0f02    ....    CMP      r12,#2
        0x000003ee:    4462        bD      ADD      r2,r2,r12
        0x000003f0:    bf98        ..      IT       LS
        0x000003f2:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x000003f6:    f8003b01    ...;    STRB     r3,[r0],#1
        0x000003fa:    bf38        8.      IT       CC
        0x000003fc:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x00000400:    f1a20204    ....    SUB      r2,r2,#4
        0x00000404:    bf98        ..      IT       LS
        0x00000406:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x0000040a:    bf38        8.      IT       CC
        0x0000040c:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x00000410:    f0110303    ....    ANDS     r3,r1,#3
        0x00000414:    f0008025    ..%.    BEQ.W    __aeabi_memcpy4 ; 0x462
        0x00000418:    3a08        .:      SUBS     r2,r2,#8
        0x0000041a:    f0c08008    ....    BCC.W    0x42e ; __aeabi_memcpy + 86
        0x0000041e:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x00000422:    3a08        .:      SUBS     r2,r2,#8
        0x00000424:    f851cb04    Q...    LDR      r12,[r1],#4
        0x00000428:    e8a01008    ....    STM      r0!,{r3,r12}
        0x0000042c:    e7f5        ..      B        0x41a ; __aeabi_memcpy + 66
        0x0000042e:    1d12        ..      ADDS     r2,r2,#4
        0x00000430:    bf5c        \.      ITT      PL
        0x00000432:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x00000436:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x0000043a:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x0000043e:    07d2        ..      LSLS     r2,r2,#31
        0x00000440:    bf24        $.      ITT      CS
        0x00000442:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x00000446:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000044a:    bf48        H.      IT       MI
        0x0000044c:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000450:    bf24        $.      ITT      CS
        0x00000452:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x00000456:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000045a:    bf48        H.      IT       MI
        0x0000045c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000460:    4770        pG      BX       lr
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x00000462:    b510        ..      PUSH     {r4,lr}
        0x00000464:    3a20         :      SUBS     r2,r2,#0x20
        0x00000466:    f0c0800b    ....    BCC.W    0x480 ; __aeabi_memcpy4 + 30
        0x0000046a:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000046e:    3a20         :      SUBS     r2,r2,#0x20
        0x00000470:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000474:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000478:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x0000047c:    f4bfaff5    ....    BCS.W    0x46a ; __aeabi_memcpy4 + 8
        0x00000480:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x00000484:    bf24        $.      ITT      CS
        0x00000486:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x0000048a:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x0000048e:    bf44        D.      ITT      MI
        0x00000490:    c918        ..      LDMMI    r1!,{r3,r4}
        0x00000492:    c018        ..      STMMI    r0!,{r3,r4}
        0x00000494:    e8bd4010    ...@    POP      {r4,lr}
        0x00000498:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x0000049c:    bf24        $.      ITT      CS
        0x0000049e:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x000004a2:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000004a6:    bf08        ..      IT       EQ
        0x000004a8:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000004aa:    07d2        ..      LSLS     r2,r2,#31
        0x000004ac:    bf28        (.      IT       CS
        0x000004ae:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000004b2:    bf48        H.      IT       MI
        0x000004b4:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000004b8:    bf28        (.      IT       CS
        0x000004ba:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000004be:    bf48        H.      IT       MI
        0x000004c0:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000004c4:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x000004c6:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x000004c8:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x000004ca:    4770        pG      BX       lr
    .text
    _printf_int_common
        0x000004cc:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x000004d0:    460d        .F      MOV      r5,r1
        0x000004d2:    4699        .F      MOV      r9,r3
        0x000004d4:    4692        .F      MOV      r10,r2
        0x000004d6:    4604        .F      MOV      r4,r0
        0x000004d8:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x000004dc:    6801        .h      LDR      r1,[r0,#0]
        0x000004de:    0688        ..      LSLS     r0,r1,#26
        0x000004e0:    d504        ..      BPL      0x4ec ; _printf_int_common + 32
        0x000004e2:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x000004e4:    f0210110    !...    BIC      r1,r1,#0x10
        0x000004e8:    6021        !`      STR      r1,[r4,#0]
        0x000004ea:    e000        ..      B        0x4ee ; _printf_int_common + 34
        0x000004ec:    2001        .       MOVS     r0,#1
        0x000004ee:    42a8        .B      CMP      r0,r5
        0x000004f0:    dd01        ..      BLE      0x4f6 ; _printf_int_common + 42
        0x000004f2:    1b47        G.      SUBS     r7,r0,r5
        0x000004f4:    e000        ..      B        0x4f8 ; _printf_int_common + 44
        0x000004f6:    2700        .'      MOVS     r7,#0
        0x000004f8:    69a1        .i      LDR      r1,[r4,#0x18]
        0x000004fa:    197a        z.      ADDS     r2,r7,r5
        0x000004fc:    eb020009    ....    ADD      r0,r2,r9
        0x00000500:    1a08        ..      SUBS     r0,r1,r0
        0x00000502:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000504:    7820         x      LDRB     r0,[r4,#0]
        0x00000506:    06c0        ..      LSLS     r0,r0,#27
        0x00000508:    d402        ..      BMI      0x510 ; _printf_int_common + 68
        0x0000050a:    4620         F      MOV      r0,r4
        0x0000050c:    f3af8000    ....    NOP.W    
        0x00000510:    2600        .&      MOVS     r6,#0
        0x00000512:    e008        ..      B        0x526 ; _printf_int_common + 90
        0x00000514:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000518:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x0000051c:    4790        .G      BLX      r2
        0x0000051e:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000520:    1c40        @.      ADDS     r0,r0,#1
        0x00000522:    1c76        v.      ADDS     r6,r6,#1
        0x00000524:    6220         b      STR      r0,[r4,#0x20]
        0x00000526:    454e        NE      CMP      r6,r9
        0x00000528:    dbf4        ..      BLT      0x514 ; _printf_int_common + 72
        0x0000052a:    7820         x      LDRB     r0,[r4,#0]
        0x0000052c:    06c0        ..      LSLS     r0,r0,#27
        0x0000052e:    d50a        ..      BPL      0x546 ; _printf_int_common + 122
        0x00000530:    4620         F      MOV      r0,r4
        0x00000532:    f3af8000    ....    NOP.W    
        0x00000536:    e006        ..      B        0x546 ; _printf_int_common + 122
        0x00000538:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x0000053c:    2030        0       MOVS     r0,#0x30
        0x0000053e:    4790        .G      BLX      r2
        0x00000540:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000542:    1c40        @.      ADDS     r0,r0,#1
        0x00000544:    6220         b      STR      r0,[r4,#0x20]
        0x00000546:    1e38        8.      SUBS     r0,r7,#0
        0x00000548:    f1a70701    ....    SUB      r7,r7,#1
        0x0000054c:    dcf4        ..      BGT      0x538 ; _printf_int_common + 108
        0x0000054e:    e007        ..      B        0x560 ; _printf_int_common + 148
        0x00000550:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000554:    f8180005    ....    LDRB     r0,[r8,r5]
        0x00000558:    4790        .G      BLX      r2
        0x0000055a:    6a20         j      LDR      r0,[r4,#0x20]
        0x0000055c:    1c40        @.      ADDS     r0,r0,#1
        0x0000055e:    6220         b      STR      r0,[r4,#0x20]
        0x00000560:    1e28        (.      SUBS     r0,r5,#0
        0x00000562:    f1a50501    ....    SUB      r5,r5,#1
        0x00000566:    dcf3        ..      BGT      0x550 ; _printf_int_common + 132
        0x00000568:    4620         F      MOV      r0,r4
        0x0000056a:    f3af8000    ....    NOP.W    
        0x0000056e:    7820         x      LDRB     r0,[r4,#0]
        0x00000570:    0600        ..      LSLS     r0,r0,#24
        0x00000572:    d502        ..      BPL      0x57a ; _printf_int_common + 174
        0x00000574:    2002        .       MOVS     r0,#2
        0x00000576:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0000057a:    2001        .       MOVS     r0,#1
        0x0000057c:    e7fb        ..      B        0x576 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x0000057e:    b510        ..      PUSH     {r4,lr}
        0x00000580:    6943        Ci      LDR      r3,[r0,#0x14]
        0x00000582:    b113        ..      CBZ      r3,0x58a ; _printf_cs_common + 12
        0x00000584:    f3af8000    ....    NOP.W    
        0x00000588:    e001        ..      B        0x58e ; _printf_cs_common + 16
        0x0000058a:    f7fffe9b    ....    BL       _printf_str ; 0x2c4
        0x0000058e:    2001        .       MOVS     r0,#1
        0x00000590:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x00000592:    7812        .x      LDRB     r2,[r2,#0]
        0x00000594:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000598:    700a        .p      STRB     r2,[r1,#0]
        0x0000059a:    2200        ."      MOVS     r2,#0
        0x0000059c:    704a        Jp      STRB     r2,[r1,#1]
        0x0000059e:    2201        ."      MOVS     r2,#1
        0x000005a0:    e7ed        ..      B        _printf_cs_common ; 0x57e
    _printf_string
        0x000005a2:    6811        .h      LDR      r1,[r2,#0]
        0x000005a4:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x000005a8:    e7e9        ..      B        _printf_cs_common ; 0x57e
        0x000005aa:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x000005ac:    4b07        .K      LDR      r3,[pc,#28] ; [0x5cc] = 0x17db
        0x000005ae:    b570        p.      PUSH     {r4-r6,lr}
        0x000005b0:    460d        .F      MOV      r5,r1
        0x000005b2:    447b        {D      ADD      r3,r3,pc
        0x000005b4:    f000f811    ....    BL       _printf_char_common ; 0x5da
        0x000005b8:    4604        .F      MOV      r4,r0
        0x000005ba:    4628        (F      MOV      r0,r5
        0x000005bc:    f000f820    .. .    BL       ferror ; 0x600
        0x000005c0:    b110        ..      CBZ      r0,0x5c8 ; _printf_char_file + 28
        0x000005c2:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000005c6:    bd70        p.      POP      {r4-r6,pc}
        0x000005c8:    4620         F      MOV      r0,r4
        0x000005ca:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000005cc:    000017db    ....    DCD    6107
    $t
    .text
    _printf_input_char
        0x000005d0:    6901        .i      LDR      r1,[r0,#0x10]
        0x000005d2:    1c4a        J.      ADDS     r2,r1,#1
        0x000005d4:    6102        .a      STR      r2,[r0,#0x10]
        0x000005d6:    7808        .x      LDRB     r0,[r1,#0]
        0x000005d8:    4770        pG      BX       lr
    _printf_char_common
        0x000005da:    b500        ..      PUSH     {lr}
        0x000005dc:    b08f        ..      SUB      sp,sp,#0x3c
        0x000005de:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000005e2:    2100        .!      MOVS     r1,#0
        0x000005e4:    9105        ..      STR      r1,[sp,#0x14]
        0x000005e6:    4905        .I      LDR      r1,[pc,#20] ; [0x5fc] = 0xffffffe5
        0x000005e8:    4479        yD      ADD      r1,r1,pc
        0x000005ea:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x000005ee:    4611        .F      MOV      r1,r2
        0x000005f0:    4668        hF      MOV      r0,sp
        0x000005f2:    f7fffe33    ..3.    BL       __printf ; 0x25c
        0x000005f6:    b00f        ..      ADD      sp,sp,#0x3c
        0x000005f8:    bd00        ..      POP      {pc}
    $d
        0x000005fa:    0000        ..      DCW    0
        0x000005fc:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x00000600:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x00000602:    f0000080    ....    AND      r0,r0,#0x80
        0x00000606:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x00000608:    4675        uF      MOV      r5,lr
        0x0000060a:    f000f829    ..).    BL       __user_libspace ; 0x660
        0x0000060e:    46ae        .F      MOV      lr,r5
        0x00000610:    0005        ..      MOVS     r5,r0
        0x00000612:    4669        iF      MOV      r1,sp
        0x00000614:    4653        SF      MOV      r3,r10
        0x00000616:    f0200007     ...    BIC      r0,r0,#7
        0x0000061a:    4685        .F      MOV      sp,r0
        0x0000061c:    b018        ..      ADD      sp,sp,#0x60
        0x0000061e:    b520         .      PUSH     {r5,lr}
        0x00000620:    f7fffdfe    ....    BL       __user_initial_stackheap ; 0x220
        0x00000624:    e8bd4020    .. @    POP      {r5,lr}
        0x00000628:    f04f0600    O...    MOV      r6,#0
        0x0000062c:    f04f0700    O...    MOV      r7,#0
        0x00000630:    f04f0800    O...    MOV      r8,#0
        0x00000634:    f04f0b00    O...    MOV      r11,#0
        0x00000638:    f0210107    !...    BIC      r1,r1,#7
        0x0000063c:    46ac        .F      MOV      r12,r5
        0x0000063e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000642:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000646:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000064a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000064e:    468d        .F      MOV      sp,r1
        0x00000650:    4770        pG      BX       lr
    .text
    exit
        0x00000652:    4604        .F      MOV      r4,r0
        0x00000654:    f3af8000    ....    NOP.W    
        0x00000658:    4620         F      MOV      r0,r4
        0x0000065a:    f7fffdcc    ....    BL       __rt_exit ; 0x1f6
        0x0000065e:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000660:    4800        .H      LDR      r0,[pc,#0] ; [0x664] = 0x20000718
        0x00000662:    4770        pG      BX       lr
    $d
        0x00000664:    20000718    ...     DCD    536872728
    $t
    .text
    _sys_exit
        0x00000668:    4901        .I      LDR      r1,[pc,#4] ; [0x670] = 0x20026
        0x0000066a:    2018        .       MOVS     r0,#0x18
        0x0000066c:    beab        ..      BKPT     #0xab
        0x0000066e:    e7fe        ..      B        0x66e ; _sys_exit + 6
    $d
        0x00000670:    00020026    &...    DCD    131110
    $t
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x00000674:    4770        pG      BX       lr
    .text
    __semihosting_library_function
        0x00000676:    0000        ..      MOVS     r0,r0
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x00000678:    b570        p.      PUSH     {r4-r6,lr}
        0x0000067a:    4d07        .M      LDR      r5,[pc,#28] ; [0x698] = 0x88
        0x0000067c:    f1050428    ..(.    ADD      r4,r5,#0x28
        0x00000680:    b104        ..      CBZ      r4,0x684 ; ADCC0_IRQHandler + 12
        0x00000682:    e004        ..      B        0x68e ; ADCC0_IRQHandler + 22
        0x00000684:    2264        d"      MOVS     r2,#0x64
        0x00000686:    a105        ..      ADR      r1,{pc}+0x16 ; 0x69c
        0x00000688:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x6bc
        0x0000068a:    f001fb55    ..U.    BL       __aeabi_assert ; 0x1d38
        0x0000068e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000692:    4788        .G      BLX      r1
        0x00000694:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000696:    0000        ..      DCW    0
        0x00000698:    00000088    ....    DCD    136
        0x0000069c:    2e5c2e2e    ..\.    DCD    777793070
        0x000006a0:    2e2e5c2e    .\..    DCD    774790190
        0x000006a4:    464c455c    \ELF    DCD    1179403612
        0x000006a8:    53425f32    2_BS    DCD    1396858674
        0x000006ac:    72445c50    P\Dr    DCD    1917082704
        0x000006b0:    72657669    iver    DCD    1919252073
        0x000006b4:    746e695c    \int    DCD    1953392988
        0x000006b8:    00632e63    c.c.    DCD    6499939
        0x000006bc:    636e7566    func    DCD    1668183398
        0x000006c0:    203d2120     !=     DCD    540877088
        0x000006c4:    00000030    0...    DCD    48
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x000006c8:    b570        p.      PUSH     {r4-r6,lr}
        0x000006ca:    4d07        .M      LDR      r5,[pc,#28] ; [0x6e8] = 0x88
        0x000006cc:    f1050430    ..0.    ADD      r4,r5,#0x30
        0x000006d0:    b104        ..      CBZ      r4,0x6d4 ; ADCC1_IRQHandler + 12
        0x000006d2:    e004        ..      B        0x6de ; ADCC1_IRQHandler + 22
        0x000006d4:    226f        o"      MOVS     r2,#0x6f
        0x000006d6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x6ec
        0x000006d8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x70c
        0x000006da:    f001fb2d    ..-.    BL       __aeabi_assert ; 0x1d38
        0x000006de:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000006e2:    4788        .G      BLX      r1
        0x000006e4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000006e6:    0000        ..      DCW    0
        0x000006e8:    00000088    ....    DCD    136
        0x000006ec:    2e5c2e2e    ..\.    DCD    777793070
        0x000006f0:    2e2e5c2e    .\..    DCD    774790190
        0x000006f4:    464c455c    \ELF    DCD    1179403612
        0x000006f8:    53425f32    2_BS    DCD    1396858674
        0x000006fc:    72445c50    P\Dr    DCD    1917082704
        0x00000700:    72657669    iver    DCD    1919252073
        0x00000704:    746e695c    \int    DCD    1953392988
        0x00000708:    00632e63    c.c.    DCD    6499939
        0x0000070c:    636e7566    func    DCD    1668183398
        0x00000710:    203d2120     !=     DCD    540877088
        0x00000714:    00000030    0...    DCD    48
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x00000718:    b570        p.      PUSH     {r4-r6,lr}
        0x0000071a:    4d07        .M      LDR      r5,[pc,#28] ; [0x738] = 0x88
        0x0000071c:    f1050438    ..8.    ADD      r4,r5,#0x38
        0x00000720:    b104        ..      CBZ      r4,0x724 ; ADCC2_IRQHandler + 12
        0x00000722:    e004        ..      B        0x72e ; ADCC2_IRQHandler + 22
        0x00000724:    227a        z"      MOVS     r2,#0x7a
        0x00000726:    a105        ..      ADR      r1,{pc}+0x16 ; 0x73c
        0x00000728:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x75c
        0x0000072a:    f001fb05    ....    BL       __aeabi_assert ; 0x1d38
        0x0000072e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000732:    4788        .G      BLX      r1
        0x00000734:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000736:    0000        ..      DCW    0
        0x00000738:    00000088    ....    DCD    136
        0x0000073c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000740:    2e2e5c2e    .\..    DCD    774790190
        0x00000744:    464c455c    \ELF    DCD    1179403612
        0x00000748:    53425f32    2_BS    DCD    1396858674
        0x0000074c:    72445c50    P\Dr    DCD    1917082704
        0x00000750:    72657669    iver    DCD    1919252073
        0x00000754:    746e695c    \int    DCD    1953392988
        0x00000758:    00632e63    c.c.    DCD    6499939
        0x0000075c:    636e7566    func    DCD    1668183398
        0x00000760:    203d2120     !=     DCD    540877088
        0x00000764:    00000030    0...    DCD    48
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000768:    b570        p.      PUSH     {r4-r6,lr}
        0x0000076a:    4d07        .M      LDR      r5,[pc,#28] ; [0x788] = 0x88
        0x0000076c:    f1050440    ..@.    ADD      r4,r5,#0x40
        0x00000770:    b104        ..      CBZ      r4,0x774 ; ADCC3_IRQHandler + 12
        0x00000772:    e004        ..      B        0x77e ; ADCC3_IRQHandler + 22
        0x00000774:    2285        ."      MOVS     r2,#0x85
        0x00000776:    a105        ..      ADR      r1,{pc}+0x16 ; 0x78c
        0x00000778:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x7ac
        0x0000077a:    f001fadd    ....    BL       __aeabi_assert ; 0x1d38
        0x0000077e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000782:    4788        .G      BLX      r1
        0x00000784:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000786:    0000        ..      DCW    0
        0x00000788:    00000088    ....    DCD    136
        0x0000078c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000790:    2e2e5c2e    .\..    DCD    774790190
        0x00000794:    464c455c    \ELF    DCD    1179403612
        0x00000798:    53425f32    2_BS    DCD    1396858674
        0x0000079c:    72445c50    P\Dr    DCD    1917082704
        0x000007a0:    72657669    iver    DCD    1919252073
        0x000007a4:    746e695c    \int    DCD    1953392988
        0x000007a8:    00632e63    c.c.    DCD    6499939
        0x000007ac:    636e7566    func    DCD    1668183398
        0x000007b0:    203d2120     !=     DCD    540877088
        0x000007b4:    00000030    0...    DCD    48
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x000007b8:    b570        p.      PUSH     {r4-r6,lr}
        0x000007ba:    4d07        .M      LDR      r5,[pc,#28] ; [0x7d8] = 0x88
        0x000007bc:    f1050448    ..H.    ADD      r4,r5,#0x48
        0x000007c0:    b104        ..      CBZ      r4,0x7c4 ; ADCC4_IRQHandler + 12
        0x000007c2:    e004        ..      B        0x7ce ; ADCC4_IRQHandler + 22
        0x000007c4:    2290        ."      MOVS     r2,#0x90
        0x000007c6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x7dc
        0x000007c8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x7fc
        0x000007ca:    f001fab5    ....    BL       __aeabi_assert ; 0x1d38
        0x000007ce:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000007d2:    4788        .G      BLX      r1
        0x000007d4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000007d6:    0000        ..      DCW    0
        0x000007d8:    00000088    ....    DCD    136
        0x000007dc:    2e5c2e2e    ..\.    DCD    777793070
        0x000007e0:    2e2e5c2e    .\..    DCD    774790190
        0x000007e4:    464c455c    \ELF    DCD    1179403612
        0x000007e8:    53425f32    2_BS    DCD    1396858674
        0x000007ec:    72445c50    P\Dr    DCD    1917082704
        0x000007f0:    72657669    iver    DCD    1919252073
        0x000007f4:    746e695c    \int    DCD    1953392988
        0x000007f8:    00632e63    c.c.    DCD    6499939
        0x000007fc:    636e7566    func    DCD    1668183398
        0x00000800:    203d2120     !=     DCD    540877088
        0x00000804:    00000030    0...    DCD    48
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x00000808:    b570        p.      PUSH     {r4-r6,lr}
        0x0000080a:    4d07        .M      LDR      r5,[pc,#28] ; [0x828] = 0x88
        0x0000080c:    f1050450    ..P.    ADD      r4,r5,#0x50
        0x00000810:    b104        ..      CBZ      r4,0x814 ; ADCC5_IRQHandler + 12
        0x00000812:    e004        ..      B        0x81e ; ADCC5_IRQHandler + 22
        0x00000814:    229a        ."      MOVS     r2,#0x9a
        0x00000816:    a105        ..      ADR      r1,{pc}+0x16 ; 0x82c
        0x00000818:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x84c
        0x0000081a:    f001fa8d    ....    BL       __aeabi_assert ; 0x1d38
        0x0000081e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000822:    4788        .G      BLX      r1
        0x00000824:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000826:    0000        ..      DCW    0
        0x00000828:    00000088    ....    DCD    136
        0x0000082c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000830:    2e2e5c2e    .\..    DCD    774790190
        0x00000834:    464c455c    \ELF    DCD    1179403612
        0x00000838:    53425f32    2_BS    DCD    1396858674
        0x0000083c:    72445c50    P\Dr    DCD    1917082704
        0x00000840:    72657669    iver    DCD    1919252073
        0x00000844:    746e695c    \int    DCD    1953392988
        0x00000848:    00632e63    c.c.    DCD    6499939
        0x0000084c:    636e7566    func    DCD    1668183398
        0x00000850:    203d2120     !=     DCD    540877088
        0x00000854:    00000030    0...    DCD    48
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000858:    b570        p.      PUSH     {r4-r6,lr}
        0x0000085a:    4d07        .M      LDR      r5,[pc,#28] ; [0x878] = 0x88
        0x0000085c:    f1050418    ....    ADD      r4,r5,#0x18
        0x00000860:    b104        ..      CBZ      r4,0x864 ; DMAC_IRQHandler + 12
        0x00000862:    e004        ..      B        0x86e ; DMAC_IRQHandler + 22
        0x00000864:    224e        N"      MOVS     r2,#0x4e
        0x00000866:    a105        ..      ADR      r1,{pc}+0x16 ; 0x87c
        0x00000868:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x89c
        0x0000086a:    f001fa65    ..e.    BL       __aeabi_assert ; 0x1d38
        0x0000086e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000872:    4788        .G      BLX      r1
        0x00000874:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000876:    0000        ..      DCW    0
        0x00000878:    00000088    ....    DCD    136
        0x0000087c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000880:    2e2e5c2e    .\..    DCD    774790190
        0x00000884:    464c455c    \ELF    DCD    1179403612
        0x00000888:    53425f32    2_BS    DCD    1396858674
        0x0000088c:    72445c50    P\Dr    DCD    1917082704
        0x00000890:    72657669    iver    DCD    1919252073
        0x00000894:    746e695c    \int    DCD    1953392988
        0x00000898:    00632e63    c.c.    DCD    6499939
        0x0000089c:    636e7566    func    DCD    1668183398
        0x000008a0:    203d2120     !=     DCD    540877088
        0x000008a4:    00000030    0...    DCD    48
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x000008a8:    b570        p.      PUSH     {r4-r6,lr}
        0x000008aa:    4d07        .M      LDR      r5,[pc,#28] ; [0x8c8] = 0x88
        0x000008ac:    f1050408    ....    ADD      r4,r5,#8
        0x000008b0:    b104        ..      CBZ      r4,0x8b4 ; EXT_IRQHandler + 12
        0x000008b2:    e004        ..      B        0x8be ; EXT_IRQHandler + 22
        0x000008b4:    2238        8"      MOVS     r2,#0x38
        0x000008b6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x8cc
        0x000008b8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x8ec
        0x000008ba:    f001fa3d    ..=.    BL       __aeabi_assert ; 0x1d38
        0x000008be:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000008c2:    4788        .G      BLX      r1
        0x000008c4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000008c6:    0000        ..      DCW    0
        0x000008c8:    00000088    ....    DCD    136
        0x000008cc:    2e5c2e2e    ..\.    DCD    777793070
        0x000008d0:    2e2e5c2e    .\..    DCD    774790190
        0x000008d4:    464c455c    \ELF    DCD    1179403612
        0x000008d8:    53425f32    2_BS    DCD    1396858674
        0x000008dc:    72445c50    P\Dr    DCD    1917082704
        0x000008e0:    72657669    iver    DCD    1919252073
        0x000008e4:    746e695c    \int    DCD    1953392988
        0x000008e8:    00632e63    c.c.    DCD    6499939
        0x000008ec:    636e7566    func    DCD    1668183398
        0x000008f0:    203d2120     !=     DCD    540877088
        0x000008f4:    00000030    0...    DCD    48
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000008f8:    b570        p.      PUSH     {r4-r6,lr}
        0x000008fa:    4d07        .M      LDR      r5,[pc,#28] ; [0x918] = 0x88
        0x000008fc:    f1050480    ....    ADD      r4,r5,#0x80
        0x00000900:    b104        ..      CBZ      r4,0x904 ; GPIO_IRQHandler + 12
        0x00000902:    e004        ..      B        0x90e ; GPIO_IRQHandler + 22
        0x00000904:    22d6        ."      MOVS     r2,#0xd6
        0x00000906:    a105        ..      ADR      r1,{pc}+0x16 ; 0x91c
        0x00000908:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x93c
        0x0000090a:    f001fa15    ....    BL       __aeabi_assert ; 0x1d38
        0x0000090e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000912:    4788        .G      BLX      r1
        0x00000914:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000916:    0000        ..      DCW    0
        0x00000918:    00000088    ....    DCD    136
        0x0000091c:    2e5c2e2e    ..\.    DCD    777793070
        0x00000920:    2e2e5c2e    .\..    DCD    774790190
        0x00000924:    464c455c    \ELF    DCD    1179403612
        0x00000928:    53425f32    2_BS    DCD    1396858674
        0x0000092c:    72445c50    P\Dr    DCD    1917082704
        0x00000930:    72657669    iver    DCD    1919252073
        0x00000934:    746e695c    \int    DCD    1953392988
        0x00000938:    00632e63    c.c.    DCD    6499939
        0x0000093c:    636e7566    func    DCD    1668183398
        0x00000940:    203d2120     !=     DCD    540877088
        0x00000944:    00000030    0...    DCD    48
    $t
    i.HAL_SYSCON_Function_IO_Set
    HAL_SYSCON_Function_IO_Set
        0x00000948:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000094c:    4604        .F      MOV      r4,r0
        0x0000094e:    460d        .F      MOV      r5,r1
        0x00000950:    4617        .F      MOV      r7,r2
        0x00000952:    bf00        ..      NOP      
        0x00000954:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000958:    6940        @i      LDR      r0,[r0,#0x14]
        0x0000095a:    4606        .F      MOV      r6,r0
        0x0000095c:    b93f        ?.      CBNZ     r7,0x96e ; HAL_SYSCON_Function_IO_Set + 38
        0x0000095e:    2001        .       MOVS     r0,#1
        0x00000960:    40a8        .@      LSLS     r0,r0,r5
        0x00000962:    4386        .C      BICS     r6,r6,r0
        0x00000964:    4630        0F      MOV      r0,r6
        0x00000966:    f001fa7b    ..{.    BL       sysc_cpu_func_en_set ; 0x1e60
        0x0000096a:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x0000096e:    2d20         -      CMP      r5,#0x20
        0x00000970:    d274        t.      BCS      0xa5c ; HAL_SYSCON_Function_IO_Set + 276
        0x00000972:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x00000976:    1b10        ..      DCW    6928
        0x00000978:    473c3126    &1<G    DCD    1195127078
        0x0000097c:    74685d52    R]ht    DCD    1952996690
        0x00000980:    a0958a7f    ....    DCD    2694154879
        0x00000984:    c2c1b6ab    ....    DCD    3267475115
        0x00000988:    c6c5c4c3    ....    DCD    3334849731
        0x0000098c:    cac9c8c7    ....    DCD    3402221767
        0x00000990:    cecdcccb    ....    DCD    3469593803
        0x00000994:    d0cf        ..      DCW    53455
    $t
        0x00000996:    bf00        ..      NOP      
        0x00000998:    f04f4080    O..@    MOV      r0,#0x40000000
        0x0000099c:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000099e:    f3640003    d...    BFI      r0,r4,#0,#4
        0x000009a2:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000009a6:    6188        .a      STR      r0,[r1,#0x18]
        0x000009a8:    bf00        ..      NOP      
        0x000009aa:    e0b6        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x000009ac:    bf00        ..      NOP      
        0x000009ae:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000009b2:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009b4:    f3641007    d...    BFI      r0,r4,#4,#4
        0x000009b8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000009bc:    6188        .a      STR      r0,[r1,#0x18]
        0x000009be:    bf00        ..      NOP      
        0x000009c0:    e0ab        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x000009c2:    bf00        ..      NOP      
        0x000009c4:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000009c8:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009ca:    f364200b    d..     BFI      r0,r4,#8,#4
        0x000009ce:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000009d2:    6188        .a      STR      r0,[r1,#0x18]
        0x000009d4:    bf00        ..      NOP      
        0x000009d6:    e0a0        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x000009d8:    bf00        ..      NOP      
        0x000009da:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000009de:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009e0:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x000009e4:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000009e8:    6188        .a      STR      r0,[r1,#0x18]
        0x000009ea:    bf00        ..      NOP      
        0x000009ec:    e095        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x000009ee:    bf00        ..      NOP      
        0x000009f0:    f04f4080    O..@    MOV      r0,#0x40000000
        0x000009f4:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009f6:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x000009fa:    f04f4180    O..A    MOV      r1,#0x40000000
        0x000009fe:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a00:    bf00        ..      NOP      
        0x00000a02:    e08a        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a04:    bf00        ..      NOP      
        0x00000a06:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a0a:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a0c:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000a10:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a14:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a16:    bf00        ..      NOP      
        0x00000a18:    e07f        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a1a:    bf00        ..      NOP      
        0x00000a1c:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a20:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a22:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000a26:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a2a:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a2c:    bf00        ..      NOP      
        0x00000a2e:    e074        t.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a30:    bf00        ..      NOP      
        0x00000a32:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a36:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000a38:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000a3c:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a40:    6188        .a      STR      r0,[r1,#0x18]
        0x00000a42:    bf00        ..      NOP      
        0x00000a44:    e069        i.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a46:    bf00        ..      NOP      
        0x00000a48:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a4c:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000a4e:    f3640003    d...    BFI      r0,r4,#0,#4
        0x00000a52:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a56:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000a58:    bf00        ..      NOP      
        0x00000a5a:    e05e        ^.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a5c:    e05c        \.      B        0xb18 ; HAL_SYSCON_Function_IO_Set + 464
        0x00000a5e:    bf00        ..      NOP      
        0x00000a60:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a64:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000a66:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00000a6a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a6e:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000a70:    bf00        ..      NOP      
        0x00000a72:    e052        R.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a74:    bf00        ..      NOP      
        0x00000a76:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a7a:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000a7c:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00000a80:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a84:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000a86:    bf00        ..      NOP      
        0x00000a88:    e047        G.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000a8a:    bf00        ..      NOP      
        0x00000a8c:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000a90:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000a92:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x00000a96:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000a9a:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000a9c:    bf00        ..      NOP      
        0x00000a9e:    e03c        <.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000aa0:    bf00        ..      NOP      
        0x00000aa2:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000aa6:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000aa8:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00000aac:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ab0:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000ab2:    bf00        ..      NOP      
        0x00000ab4:    e031        1.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000ab6:    bf00        ..      NOP      
        0x00000ab8:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000abc:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000abe:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000ac2:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ac6:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000ac8:    bf00        ..      NOP      
        0x00000aca:    e026        &.      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000acc:    bf00        ..      NOP      
        0x00000ace:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000ad2:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000ad4:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000ad8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000adc:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000ade:    bf00        ..      NOP      
        0x00000ae0:    e01b        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000ae2:    bf00        ..      NOP      
        0x00000ae4:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000ae8:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000aea:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000aee:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000af2:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000af4:    bf00        ..      NOP      
        0x00000af6:    e010        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000af8:    bf00        ..      NOP      
        0x00000afa:    bf00        ..      NOP      
        0x00000afc:    bf00        ..      NOP      
        0x00000afe:    bf00        ..      NOP      
        0x00000b00:    bf00        ..      NOP      
        0x00000b02:    bf00        ..      NOP      
        0x00000b04:    bf00        ..      NOP      
        0x00000b06:    bf00        ..      NOP      
        0x00000b08:    bf00        ..      NOP      
        0x00000b0a:    bf00        ..      NOP      
        0x00000b0c:    bf00        ..      NOP      
        0x00000b0e:    bf00        ..      NOP      
        0x00000b10:    bf00        ..      NOP      
        0x00000b12:    bf00        ..      NOP      
        0x00000b14:    bf00        ..      NOP      
        0x00000b16:    e000        ..      B        0xb1a ; HAL_SYSCON_Function_IO_Set + 466
        0x00000b18:    bf00        ..      NOP      
        0x00000b1a:    bf00        ..      NOP      
        0x00000b1c:    2001        .       MOVS     r0,#1
        0x00000b1e:    40a8        .@      LSLS     r0,r0,r5
        0x00000b20:    4306        .C      ORRS     r6,r6,r0
        0x00000b22:    4630        0F      MOV      r0,r6
        0x00000b24:    f001f99c    ....    BL       sysc_cpu_func_en_set ; 0x1e60
        0x00000b28:    bf00        ..      NOP      
        0x00000b2a:    e71e        ..      B        0x96a ; HAL_SYSCON_Function_IO_Set + 34
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000b2c:    bf00        ..      NOP      
        0x00000b2e:    4904        .I      LDR      r1,[pc,#16] ; [0xb40] = 0x40020000
        0x00000b30:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000b32:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000b36:    4a02        .J      LDR      r2,[pc,#8] ; [0xb40] = 0x40020000
        0x00000b38:    6111        .a      STR      r1,[r2,#0x10]
        0x00000b3a:    bf00        ..      NOP      
        0x00000b3c:    4770        pG      BX       lr
    $d
        0x00000b3e:    0000        ..      DCW    0
        0x00000b40:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000b44:    b510        ..      PUSH     {r4,lr}
        0x00000b46:    4604        .F      MOV      r4,r0
        0x00000b48:    1e60        `.      SUBS     r0,r4,#1
        0x00000b4a:    280f        .(      CMP      r0,#0xf
        0x00000b4c:    dc00        ..      BGT      0xb50 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000b4e:    e004        ..      B        0xb5a ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000b50:    2225        %"      MOVS     r2,#0x25
        0x00000b52:    a108        ..      ADR      r1,{pc}+0x22 ; 0xb74
        0x00000b54:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xb94
        0x00000b56:    f001f8ef    ....    BL       __aeabi_assert ; 0x1d38
        0x00000b5a:    1e61        a.      SUBS     r1,r4,#1
        0x00000b5c:    b2c8        ..      UXTB     r0,r1
        0x00000b5e:    4913        .I      LDR      r1,[pc,#76] ; [0xbac] = 0x40020000
        0x00000b60:    6849        Ih      LDR      r1,[r1,#4]
        0x00000b62:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000b66:    4a11        .J      LDR      r2,[pc,#68] ; [0xbac] = 0x40020000
        0x00000b68:    6051        Q`      STR      r1,[r2,#4]
        0x00000b6a:    bf00        ..      NOP      
        0x00000b6c:    2001        .       MOVS     r0,#1
        0x00000b6e:    f001f967    ..g.    BL       sysc_awo_div_update_set ; 0x1e40
        0x00000b72:    bd10        ..      POP      {r4,pc}
    $d
        0x00000b74:    735c2e2e    ..\s    DCD    1935420974
        0x00000b78:    735c6b64    dk\s    DCD    1935436644
        0x00000b7c:    735c6372    rc\s    DCD    1935434610
        0x00000b80:    645c636f    oc\d    DCD    1683776367
        0x00000b84:    65766972    rive    DCD    1702259058
        0x00000b88:    79735c72    r\sy    DCD    2037603442
        0x00000b8c:    6e6f6373    scon    DCD    1852793715
        0x00000b90:    0000632e    .c..    DCD    25390
        0x00000b94:    62686128    (ahb    DCD    1651007784
        0x00000b98:    7669645f    _div    DCD    1986618463
        0x00000b9c:    72656469    ider    DCD    1919247465
        0x00000ba0:    3c29312d    -1)<    DCD    1009332525
        0x00000ba4:    6678303d    =0xf    DCD    1719152701
        0x00000ba8:    00000000    ....    DCD    0
        0x00000bac:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000bb0:    b510        ..      PUSH     {r4,lr}
        0x00000bb2:    4604        .F      MOV      r4,r0
        0x00000bb4:    1e60        `.      SUBS     r0,r4,#1
        0x00000bb6:    280f        .(      CMP      r0,#0xf
        0x00000bb8:    dc00        ..      BGT      0xbbc ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000bba:    e004        ..      B        0xbc6 ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000bbc:    222c        ,"      MOVS     r2,#0x2c
        0x00000bbe:    a10a        ..      ADR      r1,{pc}+0x2a ; 0xbe8
        0x00000bc0:    a011        ..      ADR      r0,{pc}+0x48 ; 0xc08
        0x00000bc2:    f001f8b9    ....    BL       __aeabi_assert ; 0x1d38
        0x00000bc6:    1e61        a.      SUBS     r1,r4,#1
        0x00000bc8:    b2c8        ..      UXTB     r0,r1
        0x00000bca:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000bce:    6849        Ih      LDR      r1,[r1,#4]
        0x00000bd0:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000bd4:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000bd8:    6051        Q`      STR      r1,[r2,#4]
        0x00000bda:    bf00        ..      NOP      
        0x00000bdc:    2001        .       MOVS     r0,#1
        0x00000bde:    0781        ..      LSLS     r1,r0,#30
        0x00000be0:    6008        .`      STR      r0,[r1,#0]
        0x00000be2:    bf00        ..      NOP      
        0x00000be4:    bd10        ..      POP      {r4,pc}
    $d
        0x00000be6:    0000        ..      DCW    0
        0x00000be8:    735c2e2e    ..\s    DCD    1935420974
        0x00000bec:    735c6b64    dk\s    DCD    1935436644
        0x00000bf0:    735c6372    rc\s    DCD    1935434610
        0x00000bf4:    645c636f    oc\d    DCD    1683776367
        0x00000bf8:    65766972    rive    DCD    1702259058
        0x00000bfc:    79735c72    r\sy    DCD    2037603442
        0x00000c00:    6e6f6373    scon    DCD    1852793715
        0x00000c04:    0000632e    .c..    DCD    25390
        0x00000c08:    62706128    (apb    DCD    1651532072
        0x00000c0c:    69645f30    0_di    DCD    1768185648
        0x00000c10:    65646976    vide    DCD    1701079414
        0x00000c14:    29312d72    r-1)    DCD    691088754
        0x00000c18:    78303d3c    <=0x    DCD    2016427324
        0x00000c1c:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00000c20:    b510        ..      PUSH     {r4,lr}
        0x00000c22:    4604        .F      MOV      r4,r0
        0x00000c24:    1e60        `.      SUBS     r0,r4,#1
        0x00000c26:    280f        .(      CMP      r0,#0xf
        0x00000c28:    dc00        ..      BGT      0xc2c ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00000c2a:    e004        ..      B        0xc36 ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00000c2c:    2234        4"      MOVS     r2,#0x34
        0x00000c2e:    a108        ..      ADR      r1,{pc}+0x22 ; 0xc50
        0x00000c30:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xc70
        0x00000c32:    f001f881    ....    BL       __aeabi_assert ; 0x1d38
        0x00000c36:    1e61        a.      SUBS     r1,r4,#1
        0x00000c38:    b2c8        ..      UXTB     r0,r1
        0x00000c3a:    4913        .I      LDR      r1,[pc,#76] ; [0xc88] = 0x40020000
        0x00000c3c:    6849        Ih      LDR      r1,[r1,#4]
        0x00000c3e:    f3601107    `...    BFI      r1,r0,#4,#4
        0x00000c42:    4a11        .J      LDR      r2,[pc,#68] ; [0xc88] = 0x40020000
        0x00000c44:    6051        Q`      STR      r1,[r2,#4]
        0x00000c46:    bf00        ..      NOP      
        0x00000c48:    2002        .       MOVS     r0,#2
        0x00000c4a:    f001f8f9    ....    BL       sysc_awo_div_update_set ; 0x1e40
        0x00000c4e:    bd10        ..      POP      {r4,pc}
    $d
        0x00000c50:    735c2e2e    ..\s    DCD    1935420974
        0x00000c54:    735c6b64    dk\s    DCD    1935436644
        0x00000c58:    735c6372    rc\s    DCD    1935434610
        0x00000c5c:    645c636f    oc\d    DCD    1683776367
        0x00000c60:    65766972    rive    DCD    1702259058
        0x00000c64:    79735c72    r\sy    DCD    2037603442
        0x00000c68:    6e6f6373    scon    DCD    1852793715
        0x00000c6c:    0000632e    .c..    DCD    25390
        0x00000c70:    62706128    (apb    DCD    1651532072
        0x00000c74:    69645f31    1_di    DCD    1768185649
        0x00000c78:    65646976    vide    DCD    1701079414
        0x00000c7c:    29312d72    r-1)    DCD    691088754
        0x00000c80:    78303d3c    <=0x    DCD    2016427324
        0x00000c84:    00000066    f...    DCD    102
        0x00000c88:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x00000c8c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000c8e:    4605        .F      MOV      r5,r0
        0x00000c90:    460c        .F      MOV      r4,r1
        0x00000c92:    1e60        `.      SUBS     r0,r4,#1
        0x00000c94:    f5b05f00    ..._    CMP      r0,#0x2000
        0x00000c98:    da00        ..      BGE      0xc9c ; HAL_SYSCON_Set_RTC_Div + 16
        0x00000c9a:    e004        ..      B        0xca6 ; HAL_SYSCON_Set_RTC_Div + 26
        0x00000c9c:    223c        <"      MOVS     r2,#0x3c
        0x00000c9e:    a112        ..      ADR      r1,{pc}+0x4a ; 0xce8
        0x00000ca0:    a019        ..      ADR      r0,{pc}+0x68 ; 0xd08
        0x00000ca2:    f001f849    ..I.    BL       __aeabi_assert ; 0x1d38
        0x00000ca6:    2d01        .-      CMP      r5,#1
        0x00000ca8:    dc00        ..      BGT      0xcac ; HAL_SYSCON_Set_RTC_Div + 32
        0x00000caa:    e004        ..      B        0xcb6 ; HAL_SYSCON_Set_RTC_Div + 42
        0x00000cac:    223d        ="      MOVS     r2,#0x3d
        0x00000cae:    a10e        ..      ADR      r1,{pc}+0x3a ; 0xce8
        0x00000cb0:    a01b        ..      ADR      r0,{pc}+0x70 ; 0xd20
        0x00000cb2:    f001f841    ..A.    BL       __aeabi_assert ; 0x1d38
        0x00000cb6:    b935        5.      CBNZ     r5,0xcc6 ; HAL_SYSCON_Set_RTC_Div + 58
        0x00000cb8:    2000        .       MOVS     r0,#0
        0x00000cba:    f001f8c7    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1e4c
        0x00000cbe:    2004        .       MOVS     r0,#4
        0x00000cc0:    f001f8be    ....    BL       sysc_awo_div_update_set ; 0x1e40
        0x00000cc4:    e00e        ..      B        0xce4 ; HAL_SYSCON_Set_RTC_Div + 88
        0x00000cc6:    2c02        .,      CMP      r4,#2
        0x00000cc8:    db00        ..      BLT      0xccc ; HAL_SYSCON_Set_RTC_Div + 64
        0x00000cca:    e004        ..      B        0xcd6 ; HAL_SYSCON_Set_RTC_Div + 74
        0x00000ccc:    2247        G"      MOVS     r2,#0x47
        0x00000cce:    a106        ..      ADR      r1,{pc}+0x1a ; 0xce8
        0x00000cd0:    a01a        ..      ADR      r0,{pc}+0x6c ; 0xd3c
        0x00000cd2:    f001f831    ..1.    BL       __aeabi_assert ; 0x1d38
        0x00000cd6:    1e61        a.      SUBS     r1,r4,#1
        0x00000cd8:    b288        ..      UXTH     r0,r1
        0x00000cda:    f001f8b7    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1e4c
        0x00000cde:    2004        .       MOVS     r0,#4
        0x00000ce0:    f001f8ae    ....    BL       sysc_awo_div_update_set ; 0x1e40
        0x00000ce4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000ce6:    0000        ..      DCW    0
        0x00000ce8:    735c2e2e    ..\s    DCD    1935420974
        0x00000cec:    735c6b64    dk\s    DCD    1935436644
        0x00000cf0:    735c6372    rc\s    DCD    1935434610
        0x00000cf4:    645c636f    oc\d    DCD    1683776367
        0x00000cf8:    65766972    rive    DCD    1702259058
        0x00000cfc:    79735c72    r\sy    DCD    2037603442
        0x00000d00:    6e6f6373    scon    DCD    1852793715
        0x00000d04:    0000632e    .c..    DCD    25390
        0x00000d08:    63747228    (rtc    DCD    1668575784
        0x00000d0c:    7669645f    _div    DCD    1986618463
        0x00000d10:    72656469    ider    DCD    1919247465
        0x00000d14:    3c29312d    -1)<    DCD    1009332525
        0x00000d18:    3178303d    =0x1    DCD    829960253
        0x00000d1c:    00666666    fff.    DCD    6710886
        0x00000d20:    5f637472    rtc_    DCD    1600353394
        0x00000d24:    3c637273    src<    DCD    1013150323
        0x00000d28:    6374723d    =rtc    DCD    1668575805
        0x00000d2c:    5f6b6c63    clk_    DCD    1600875619
        0x00000d30:    6d6f7266    from    DCD    1836020326
        0x00000d34:    6268615f    _ahb    DCD    1651007839
        0x00000d38:    00000000    ....    DCD    0
        0x00000d3c:    5f637472    rtc_    DCD    1600353394
        0x00000d40:    69766964    divi    DCD    1769367908
        0x00000d44:    3e726564    der>    DCD    1047684452
        0x00000d48:    0000323d    =2..    DCD    12861
    $t
    i.HAL_UART_FIFO_Control
    HAL_UART_FIFO_Control
        0x00000d4c:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00000d4e:    2201        ."      MOVS     r2,#1
        0x00000d50:    2300        .#      MOVS     r3,#0
        0x00000d52:    461c        .F      MOV      r4,r3
        0x00000d54:    4615        .F      MOV      r5,r2
        0x00000d56:    018e        ..      LSLS     r6,r1,#6
        0x00000d58:    ea461600    F...    ORR      r6,r6,r0,LSL #4
        0x00000d5c:    ea4606c2    F...    ORR      r6,r6,r2,LSL #3
        0x00000d60:    ea460683    F...    ORR      r6,r6,r3,LSL #2
        0x00000d64:    ea460644    F.D.    ORR      r6,r6,r4,LSL #1
        0x00000d68:    432e        .C      ORRS     r6,r6,r5
        0x00000d6a:    4f02        .O      LDR      r7,[pc,#8] ; [0xd74] = 0x40003000
        0x00000d6c:    60be        .`      STR      r6,[r7,#8]
        0x00000d6e:    bf00        ..      NOP      
        0x00000d70:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x00000d72:    0000        ..      DCW    0
        0x00000d74:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Init
    HAL_UART_Init
        0x00000d78:    b537        7.      PUSH     {r0-r2,r4,r5,lr}
        0x00000d7a:    4604        .F      MOV      r4,r0
        0x00000d7c:    4620         F      MOV      r0,r4
        0x00000d7e:    9901        ..      LDR      r1,[sp,#4]
        0x00000d80:    f000f8ae    ....    BL       HAL_UART_Set_BaudRate ; 0xee0
        0x00000d84:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x00000d88:    b918        ..      CBNZ     r0,0xd92 ; HAL_UART_Init + 26
        0x00000d8a:    2000        .       MOVS     r0,#0
        0x00000d8c:    f001f9ba    ....    BL       uart_pen_setf ; 0x2104
        0x00000d90:    e00d        ..      B        0xdae ; HAL_UART_Init + 54
        0x00000d92:    2001        .       MOVS     r0,#1
        0x00000d94:    f001f9b6    ....    BL       uart_pen_setf ; 0x2104
        0x00000d98:    f89d000a    ....    LDRB     r0,[sp,#0xa]
        0x00000d9c:    2802        .(      CMP      r0,#2
        0x00000d9e:    d103        ..      BNE      0xda8 ; HAL_UART_Init + 48
        0x00000da0:    2001        .       MOVS     r0,#1
        0x00000da2:    f001f991    ....    BL       uart_eps_setf ; 0x20c8
        0x00000da6:    e002        ..      B        0xdae ; HAL_UART_Init + 54
        0x00000da8:    2000        .       MOVS     r0,#0
        0x00000daa:    f001f98d    ....    BL       uart_eps_setf ; 0x20c8
        0x00000dae:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x00000db2:    490d        .I      LDR      r1,[pc,#52] ; [0xde8] = 0x40003000
        0x00000db4:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000db6:    f3600182    `...    BFI      r1,r0,#2,#1
        0x00000dba:    4a0b        .J      LDR      r2,[pc,#44] ; [0xde8] = 0x40003000
        0x00000dbc:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000dbe:    bf00        ..      NOP      
        0x00000dc0:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00000dc4:    4611        .F      MOV      r1,r2
        0x00000dc6:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000dc8:    f3600101    `...    BFI      r1,r0,#0,#2
        0x00000dcc:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000dce:    bf00        ..      NOP      
        0x00000dd0:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x00000dd4:    2801        .(      CMP      r0,#1
        0x00000dd6:    d102        ..      BNE      0xdde ; HAL_UART_Init + 102
        0x00000dd8:    f001f962    ..b.    BL       uart_afce_setf ; 0x20a0
        0x00000ddc:    e002        ..      B        0xde4 ; HAL_UART_Init + 108
        0x00000dde:    2000        .       MOVS     r0,#0
        0x00000de0:    f001f95e    ..^.    BL       uart_afce_setf ; 0x20a0
        0x00000de4:    bd3e        >.      POP      {r1-r5,pc}
    $d
        0x00000de6:    0000        ..      DCW    0
        0x00000de8:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Isr
    HAL_UART_Isr
        0x00000dec:    b510        ..      PUSH     {r4,lr}
        0x00000dee:    e01f        ..      B        0xe30 ; HAL_UART_Isr + 68
        0x00000df0:    bf00        ..      NOP      
        0x00000df2:    4811        .H      LDR      r0,[pc,#68] ; [0xe38] = 0x40003000
        0x00000df4:    6880        .h      LDR      r0,[r0,#8]
        0x00000df6:    f000040f    ....    AND      r4,r0,#0xf
        0x00000dfa:    bf00        ..      NOP      
        0x00000dfc:    2c01        .,      CMP      r4,#1
        0x00000dfe:    d100        ..      BNE      0xe02 ; HAL_UART_Isr + 22
        0x00000e00:    e017        ..      B        0xe32 ; HAL_UART_Isr + 70
        0x00000e02:    2c02        .,      CMP      r4,#2
        0x00000e04:    d00c        ..      BEQ      0xe20 ; HAL_UART_Isr + 52
        0x00000e06:    2c04        .,      CMP      r4,#4
        0x00000e08:    d007        ..      BEQ      0xe1a ; HAL_UART_Isr + 46
        0x00000e0a:    2c06        .,      CMP      r4,#6
        0x00000e0c:    d002        ..      BEQ      0xe14 ; HAL_UART_Isr + 40
        0x00000e0e:    2c0c        .,      CMP      r4,#0xc
        0x00000e10:    d10c        ..      BNE      0xe2c ; HAL_UART_Isr + 64
        0x00000e12:    e008        ..      B        0xe26 ; HAL_UART_Isr + 58
        0x00000e14:    f001fa24    ..$.    BL       uart_rec_error_isr ; 0x2260
        0x00000e18:    e009        ..      B        0xe2e ; HAL_UART_Isr + 66
        0x00000e1a:    f001f983    ....    BL       uart_rec_data_avail_isr ; 0x2124
        0x00000e1e:    e006        ..      B        0xe2e ; HAL_UART_Isr + 66
        0x00000e20:    f001fa50    ..P.    BL       uart_thr_empty_isr ; 0x22c4
        0x00000e24:    e003        ..      B        0xe2e ; HAL_UART_Isr + 66
        0x00000e26:    f001f97d    ..}.    BL       uart_rec_data_avail_isr ; 0x2124
        0x00000e2a:    e000        ..      B        0xe2e ; HAL_UART_Isr + 66
        0x00000e2c:    bf00        ..      NOP      
        0x00000e2e:    bf00        ..      NOP      
        0x00000e30:    e7de        ..      B        0xdf0 ; HAL_UART_Isr + 4
        0x00000e32:    bf00        ..      NOP      
        0x00000e34:    bd10        ..      POP      {r4,pc}
    $d
        0x00000e36:    0000        ..      DCW    0
        0x00000e38:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_Read
    HAL_UART_Read
        0x00000e3c:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000e40:    4604        .F      MOV      r4,r0
        0x00000e42:    460d        .F      MOV      r5,r1
        0x00000e44:    4616        .F      MOV      r6,r2
        0x00000e46:    461f        .F      MOV      r7,r3
        0x00000e48:    b104        ..      CBZ      r4,0xe4c ; HAL_UART_Read + 16
        0x00000e4a:    e005        ..      B        0xe58 ; HAL_UART_Read + 28
        0x00000e4c:    f44f729e    O..r    MOV      r2,#0x13c
        0x00000e50:    a110        ..      ADR      r1,{pc}+0x44 ; 0xe94
        0x00000e52:    a018        ..      ADR      r0,{pc}+0x62 ; 0xeb4
        0x00000e54:    f000ff70    ..p.    BL       __aeabi_assert ; 0x1d38
        0x00000e58:    b105        ..      CBZ      r5,0xe5c ; HAL_UART_Read + 32
        0x00000e5a:    e005        ..      B        0xe68 ; HAL_UART_Read + 44
        0x00000e5c:    f240123d    @.=.    MOV      r2,#0x13d
        0x00000e60:    a10c        ..      ADR      r1,{pc}+0x34 ; 0xe94
        0x00000e62:    a017        ..      ADR      r0,{pc}+0x5e ; 0xec0
        0x00000e64:    f000ff68    ..h.    BL       __aeabi_assert ; 0x1d38
        0x00000e68:    b106        ..      CBZ      r6,0xe6c ; HAL_UART_Read + 48
        0x00000e6a:    e005        ..      B        0xe78 ; HAL_UART_Read + 60
        0x00000e6c:    f44f729f    O..r    MOV      r2,#0x13e
        0x00000e70:    a108        ..      ADR      r1,{pc}+0x24 ; 0xe94
        0x00000e72:    a016        ..      ADR      r0,{pc}+0x5a ; 0xecc
        0x00000e74:    f000ff60    ..`.    BL       __aeabi_assert ; 0x1d38
        0x00000e78:    4818        .H      LDR      r0,[pc,#96] ; [0xedc] = 0x200006ec
        0x00000e7a:    6145        Ea      STR      r5,[r0,#0x14]
        0x00000e7c:    6184        .a      STR      r4,[r0,#0x18]
        0x00000e7e:    6206        .b      STR      r6,[r0,#0x20]
        0x00000e80:    6247        Gb      STR      r7,[r0,#0x24]
        0x00000e82:    2000        .       MOVS     r0,#0
        0x00000e84:    4915        .I      LDR      r1,[pc,#84] ; [0xedc] = 0x200006ec
        0x00000e86:    f881002a    ..*.    STRB     r0,[r1,#0x2a]
        0x00000e8a:    2001        .       MOVS     r0,#1
        0x00000e8c:    f001f926    ..&.    BL       uart_erbfi_setf ; 0x20dc
        0x00000e90:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000e94:    735c2e2e    ..\s    DCD    1935420974
        0x00000e98:    735c6b64    dk\s    DCD    1935436644
        0x00000e9c:    735c6372    rc\s    DCD    1935434610
        0x00000ea0:    645c636f    oc\d    DCD    1683776367
        0x00000ea4:    65766972    rive    DCD    1702259058
        0x00000ea8:    61755c72    r\ua    DCD    1635081330
        0x00000eac:    632e7472    rt.c    DCD    1663988850
        0x00000eb0:    00000000    ....    DCD    0
        0x00000eb4:    70667562    bufp    DCD    1885762914
        0x00000eb8:    21207274    tr !    DCD    555774580
        0x00000ebc:    0030203d    = 0.    DCD    3153981
        0x00000ec0:    657a6973    size    DCD    1702521203
        0x00000ec4:    203d2120     !=     DCD    540877088
        0x00000ec8:    00000030    0...    DCD    48
        0x00000ecc:    6c6c6163    call    DCD    1819042147
        0x00000ed0:    6b636162    back    DCD    1801675106
        0x00000ed4:    203d2120     !=     DCD    540877088
        0x00000ed8:    00000030    0...    DCD    48
        0x00000edc:    200006ec    ...     DCD    536872684
    $t
    i.HAL_UART_Set_BaudRate
    HAL_UART_Set_BaudRate
        0x00000ee0:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x00000ee4:    4605        .F      MOV      r5,r0
        0x00000ee6:    460c        .F      MOV      r4,r1
        0x00000ee8:    0928        (.      LSRS     r0,r5,#4
        0x00000eea:    fbb0f0f4    ....    UDIV     r0,r0,r4
        0x00000eee:    b286        ..      UXTH     r6,r0
        0x00000ef0:    0928        (.      LSRS     r0,r5,#4
        0x00000ef2:    fbb0fbf4    ....    UDIV     r11,r0,r4
        0x00000ef6:    4658        XF      MOV      r0,r11
        0x00000ef8:    f001fb70    ..p.    BL       __aeabi_ui2f ; 0x25dc
        0x00000efc:    4681        .F      MOV      r9,r0
        0x00000efe:    4620         F      MOV      r0,r4
        0x00000f00:    f001fb6c    ..l.    BL       __aeabi_ui2f ; 0x25dc
        0x00000f04:    9001        ..      STR      r0,[sp,#4]
        0x00000f06:    4628        (F      MOV      r0,r5
        0x00000f08:    f001fb68    ..h.    BL       __aeabi_ui2f ; 0x25dc
        0x00000f0c:    f04f4183    O..A    MOV      r1,#0x41800000
        0x00000f10:    9000        ..      STR      r0,[sp,#0]
        0x00000f12:    f001fa85    ....    BL       _fdiv1 ; 0x2420
        0x00000f16:    4683        .F      MOV      r11,r0
        0x00000f18:    9901        ..      LDR      r1,[sp,#4]
        0x00000f1a:    f001fa81    ....    BL       _fdiv1 ; 0x2420
        0x00000f1e:    4682        .F      MOV      r10,r0
        0x00000f20:    4649        IF      MOV      r1,r9
        0x00000f22:    f001fc3b    ..;.    BL       __aeabi_fsub ; 0x279c
        0x00000f26:    f04f4184    O..A    MOV      r1,#0x42000000
        0x00000f2a:    9002        ..      STR      r0,[sp,#8]
        0x00000f2c:    f001fb6a    ..j.    BL       __aeabi_fmul ; 0x2604
        0x00000f30:    f04f517c    O.|Q    MOV      r1,#0x3f000000
        0x00000f34:    9003        ..      STR      r0,[sp,#0xc]
        0x00000f36:    f001fa11    ....    BL       __aeabi_fadd ; 0x235c
        0x00000f3a:    4680        .F      MOV      r8,r0
        0x00000f3c:    f001fb32    ..2.    BL       __aeabi_f2iz ; 0x25a4
        0x00000f40:    b2c7        ..      UXTB     r7,r0
        0x00000f42:    2001        .       MOVS     r0,#1
        0x00000f44:    f001f8b6    ....    BL       uart_dlab_setf ; 0x20b4
        0x00000f48:    b2f0        ..      UXTB     r0,r6
        0x00000f4a:    4908        .I      LDR      r1,[pc,#32] ; [0xf6c] = 0x40003000
        0x00000f4c:    6008        .`      STR      r0,[r1,#0]
        0x00000f4e:    bf00        ..      NOP      
        0x00000f50:    1230        0.      ASRS     r0,r6,#8
        0x00000f52:    6048        H`      STR      r0,[r1,#4]
        0x00000f54:    bf00        ..      NOP      
        0x00000f56:    4638        8F      MOV      r0,r7
        0x00000f58:    4904        .I      LDR      r1,[pc,#16] ; [0xf6c] = 0x40003000
        0x00000f5a:    31c0        .1      ADDS     r1,r1,#0xc0
        0x00000f5c:    6008        .`      STR      r0,[r1,#0]
        0x00000f5e:    bf00        ..      NOP      
        0x00000f60:    2000        .       MOVS     r0,#0
        0x00000f62:    f001f8a7    ....    BL       uart_dlab_setf ; 0x20b4
        0x00000f66:    e8bd9fff    ....    POP      {r0-r12,pc}
    $d
        0x00000f6a:    0000        ..      DCW    0
        0x00000f6c:    40003000    .0.@    DCD    1073754112
    $t
    i.HAL_UART_WriteChar_Polling
    HAL_UART_WriteChar_Polling
        0x00000f70:    b510        ..      PUSH     {r4,lr}
        0x00000f72:    4604        .F      MOV      r4,r0
        0x00000f74:    bf00        ..      NOP      
        0x00000f76:    f001f99d    ....    BL       uart_tfnf_getf ; 0x22b4
        0x00000f7a:    2800        .(      CMP      r0,#0
        0x00000f7c:    d0fb        ..      BEQ      0xf76 ; HAL_UART_WriteChar_Polling + 6
        0x00000f7e:    4620         F      MOV      r0,r4
        0x00000f80:    f001f9e6    ....    BL       uart_thr_set ; 0x2350
        0x00000f84:    bd10        ..      POP      {r4,pc}
    i.HAL_UART_Write_Polling
    HAL_UART_Write_Polling
        0x00000f86:    b570        p.      PUSH     {r4-r6,lr}
        0x00000f88:    4604        .F      MOV      r4,r0
        0x00000f8a:    460d        .F      MOV      r5,r1
        0x00000f8c:    2600        .&      MOVS     r6,#0
        0x00000f8e:    e004        ..      B        0xf9a ; HAL_UART_Write_Polling + 20
        0x00000f90:    7820         x      LDRB     r0,[r4,#0]
        0x00000f92:    f7ffffed    ....    BL       HAL_UART_WriteChar_Polling ; 0xf70
        0x00000f96:    1c64        d.      ADDS     r4,r4,#1
        0x00000f98:    1c76        v.      ADDS     r6,r6,#1
        0x00000f9a:    42ae        .B      CMP      r6,r5
        0x00000f9c:    d3f8        ..      BCC      0xf90 ; HAL_UART_Write_Polling + 10
        0x00000f9e:    bd70        p.      POP      {r4-r6,pc}
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00000fa0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000fa2:    4d07        .M      LDR      r5,[pc,#28] ; [0xfc0] = 0x88
        0x00000fa4:    f1050460    ..`.    ADD      r4,r5,#0x60
        0x00000fa8:    b104        ..      CBZ      r4,0xfac ; I2C0_IRQHandler + 12
        0x00000faa:    e004        ..      B        0xfb6 ; I2C0_IRQHandler + 22
        0x00000fac:    22ae        ."      MOVS     r2,#0xae
        0x00000fae:    a105        ..      ADR      r1,{pc}+0x16 ; 0xfc4
        0x00000fb0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0xfe4
        0x00000fb2:    f000fec1    ....    BL       __aeabi_assert ; 0x1d38
        0x00000fb6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00000fba:    4788        .G      BLX      r1
        0x00000fbc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000fbe:    0000        ..      DCW    0
        0x00000fc0:    00000088    ....    DCD    136
        0x00000fc4:    2e5c2e2e    ..\.    DCD    777793070
        0x00000fc8:    2e2e5c2e    .\..    DCD    774790190
        0x00000fcc:    464c455c    \ELF    DCD    1179403612
        0x00000fd0:    53425f32    2_BS    DCD    1396858674
        0x00000fd4:    72445c50    P\Dr    DCD    1917082704
        0x00000fd8:    72657669    iver    DCD    1919252073
        0x00000fdc:    746e695c    \int    DCD    1953392988
        0x00000fe0:    00632e63    c.c.    DCD    6499939
        0x00000fe4:    636e7566    func    DCD    1668183398
        0x00000fe8:    203d2120     !=     DCD    540877088
        0x00000fec:    00000030    0...    DCD    48
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00000ff0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000ff2:    4d07        .M      LDR      r5,[pc,#28] ; [0x1010] = 0x88
        0x00000ff4:    f1050468    ..h.    ADD      r4,r5,#0x68
        0x00000ff8:    b104        ..      CBZ      r4,0xffc ; I2C1_IRQHandler + 12
        0x00000ffa:    e004        ..      B        0x1006 ; I2C1_IRQHandler + 22
        0x00000ffc:    22b8        ."      MOVS     r2,#0xb8
        0x00000ffe:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1014
        0x00001000:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1034
        0x00001002:    f000fe99    ....    BL       __aeabi_assert ; 0x1d38
        0x00001006:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000100a:    4788        .G      BLX      r1
        0x0000100c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000100e:    0000        ..      DCW    0
        0x00001010:    00000088    ....    DCD    136
        0x00001014:    2e5c2e2e    ..\.    DCD    777793070
        0x00001018:    2e2e5c2e    .\..    DCD    774790190
        0x0000101c:    464c455c    \ELF    DCD    1179403612
        0x00001020:    53425f32    2_BS    DCD    1396858674
        0x00001024:    72445c50    P\Dr    DCD    1917082704
        0x00001028:    72657669    iver    DCD    1919252073
        0x0000102c:    746e695c    \int    DCD    1953392988
        0x00001030:    00632e63    c.c.    DCD    6499939
        0x00001034:    636e7566    func    DCD    1668183398
        0x00001038:    203d2120     !=     DCD    540877088
        0x0000103c:    00000030    0...    DCD    48
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x00001040:    b570        p.      PUSH     {r4-r6,lr}
        0x00001042:    4d07        .M      LDR      r5,[pc,#28] ; [0x1060] = 0x88
        0x00001044:    f1050488    ....    ADD      r4,r5,#0x88
        0x00001048:    b104        ..      CBZ      r4,0x104c ; I2S_IRQHandler + 12
        0x0000104a:    e004        ..      B        0x1056 ; I2S_IRQHandler + 22
        0x0000104c:    22e0        ."      MOVS     r2,#0xe0
        0x0000104e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1064
        0x00001050:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1084
        0x00001052:    f000fe71    ..q.    BL       __aeabi_assert ; 0x1d38
        0x00001056:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000105a:    4788        .G      BLX      r1
        0x0000105c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000105e:    0000        ..      DCW    0
        0x00001060:    00000088    ....    DCD    136
        0x00001064:    2e5c2e2e    ..\.    DCD    777793070
        0x00001068:    2e2e5c2e    .\..    DCD    774790190
        0x0000106c:    464c455c    \ELF    DCD    1179403612
        0x00001070:    53425f32    2_BS    DCD    1396858674
        0x00001074:    72445c50    P\Dr    DCD    1917082704
        0x00001078:    72657669    iver    DCD    1919252073
        0x0000107c:    746e695c    \int    DCD    1953392988
        0x00001080:    00632e63    c.c.    DCD    6499939
        0x00001084:    636e7566    func    DCD    1668183398
        0x00001088:    203d2120     !=     DCD    540877088
        0x0000108c:    00000030    0...    DCD    48
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00001090:    b570        p.      PUSH     {r4-r6,lr}
        0x00001092:    4d07        .M      LDR      r5,[pc,#28] ; [0x10b0] = 0x88
        0x00001094:    f1050420    .. .    ADD      r4,r5,#0x20
        0x00001098:    b104        ..      CBZ      r4,0x109c ; QSPI_IRQHandler + 12
        0x0000109a:    e004        ..      B        0x10a6 ; QSPI_IRQHandler + 22
        0x0000109c:    2259        Y"      MOVS     r2,#0x59
        0x0000109e:    a105        ..      ADR      r1,{pc}+0x16 ; 0x10b4
        0x000010a0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x10d4
        0x000010a2:    f000fe49    ..I.    BL       __aeabi_assert ; 0x1d38
        0x000010a6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000010aa:    4788        .G      BLX      r1
        0x000010ac:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000010ae:    0000        ..      DCW    0
        0x000010b0:    00000088    ....    DCD    136
        0x000010b4:    2e5c2e2e    ..\.    DCD    777793070
        0x000010b8:    2e2e5c2e    .\..    DCD    774790190
        0x000010bc:    464c455c    \ELF    DCD    1179403612
        0x000010c0:    53425f32    2_BS    DCD    1396858674
        0x000010c4:    72445c50    P\Dr    DCD    1917082704
        0x000010c8:    72657669    iver    DCD    1919252073
        0x000010cc:    746e695c    \int    DCD    1953392988
        0x000010d0:    00632e63    c.c.    DCD    6499939
        0x000010d4:    636e7566    func    DCD    1668183398
        0x000010d8:    203d2120     !=     DCD    540877088
        0x000010dc:    00000030    0...    DCD    48
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x000010e0:    b570        p.      PUSH     {r4-r6,lr}
        0x000010e2:    4d07        .M      LDR      r5,[pc,#28] ; [0x1100] = 0x88
        0x000010e4:    f1050410    ....    ADD      r4,r5,#0x10
        0x000010e8:    b104        ..      CBZ      r4,0x10ec ; RTC_IRQHandler + 12
        0x000010ea:    e004        ..      B        0x10f6 ; RTC_IRQHandler + 22
        0x000010ec:    2243        C"      MOVS     r2,#0x43
        0x000010ee:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1104
        0x000010f0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1124
        0x000010f2:    f000fe21    ..!.    BL       __aeabi_assert ; 0x1d38
        0x000010f6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000010fa:    4788        .G      BLX      r1
        0x000010fc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000010fe:    0000        ..      DCW    0
        0x00001100:    00000088    ....    DCD    136
        0x00001104:    2e5c2e2e    ..\.    DCD    777793070
        0x00001108:    2e2e5c2e    .\..    DCD    774790190
        0x0000110c:    464c455c    \ELF    DCD    1179403612
        0x00001110:    53425f32    2_BS    DCD    1396858674
        0x00001114:    72445c50    P\Dr    DCD    1917082704
        0x00001118:    72657669    iver    DCD    1919252073
        0x0000111c:    746e695c    \int    DCD    1953392988
        0x00001120:    00632e63    c.c.    DCD    6499939
        0x00001124:    636e7566    func    DCD    1668183398
        0x00001128:    203d2120     !=     DCD    540877088
        0x0000112c:    00000030    0...    DCD    48
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x00001130:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001134:    4604        .F      MOV      r4,r0
        0x00001136:    460d        .F      MOV      r5,r1
        0x00001138:    4616        .F      MOV      r6,r2
        0x0000113a:    bf00        ..      NOP      
        0x0000113c:    480d        .H      LDR      r0,[pc,#52] ; [0x1174] = 0x20000234
        0x0000113e:    7800        .x      LDRB     r0,[r0,#0]
        0x00001140:    b908        ..      CBNZ     r0,0x1146 ; SEGGER_RTT_Write + 22
        0x00001142:    f000fc45    ..E.    BL       _DoInit ; 0x19d0
        0x00001146:    bf00        ..      NOP      
        0x00001148:    f3ef8011    ....    MRS      r0,BASEPRI
        0x0000114c:    4607        .F      MOV      r7,r0
        0x0000114e:    2020                MOVS     r0,#0x20
        0x00001150:    f3808811    ....    MSR      BASEPRI,r0
        0x00001154:    bf00        ..      NOP      
        0x00001156:    bf00        ..      NOP      
        0x00001158:    4632        2F      MOV      r2,r6
        0x0000115a:    4629        )F      MOV      r1,r5
        0x0000115c:    4620         F      MOV      r0,r4
        0x0000115e:    f000f80b    ....    BL       SEGGER_RTT_WriteNoLock ; 0x1178
        0x00001162:    4680        .F      MOV      r8,r0
        0x00001164:    b2f8        ..      UXTB     r0,r7
        0x00001166:    f3808811    ....    MSR      BASEPRI,r0
        0x0000116a:    bf00        ..      NOP      
        0x0000116c:    bf00        ..      NOP      
        0x0000116e:    4640        @F      MOV      r0,r8
        0x00001170:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001174:    20000234    4..     DCD    536871476
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00001178:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000117c:    4607        .F      MOV      r7,r0
        0x0000117e:    4688        .F      MOV      r8,r1
        0x00001180:    4616        .F      MOV      r6,r2
        0x00001182:    46c2        .F      MOV      r10,r8
        0x00001184:    eb070147    ..G.    ADD      r1,r7,r7,LSL #1
        0x00001188:    481b        .H      LDR      r0,[pc,#108] ; [0x11f8] = 0x2000024c
        0x0000118a:    eb0009c1    ....    ADD      r9,r0,r1,LSL #3
        0x0000118e:    f8d90014    ....    LDR      r0,[r9,#0x14]
        0x00001192:    b120         .      CBZ      r0,0x119e ; SEGGER_RTT_WriteNoLock + 38
        0x00001194:    2801        .(      CMP      r0,#1
        0x00001196:    d011        ..      BEQ      0x11bc ; SEGGER_RTT_WriteNoLock + 68
        0x00001198:    2802        .(      CMP      r0,#2
        0x0000119a:    d126        &.      BNE      0x11ea ; SEGGER_RTT_WriteNoLock + 114
        0x0000119c:    e01e        ..      B        0x11dc ; SEGGER_RTT_WriteNoLock + 100
        0x0000119e:    4648        HF      MOV      r0,r9
        0x000011a0:    f000fc4e    ..N.    BL       _GetAvailWriteSpace ; 0x1a40
        0x000011a4:    4605        .F      MOV      r5,r0
        0x000011a6:    42b5        .B      CMP      r5,r6
        0x000011a8:    d201        ..      BCS      0x11ae ; SEGGER_RTT_WriteNoLock + 54
        0x000011aa:    2400        .$      MOVS     r4,#0
        0x000011ac:    e005        ..      B        0x11ba ; SEGGER_RTT_WriteNoLock + 66
        0x000011ae:    4634        4F      MOV      r4,r6
        0x000011b0:    4632        2F      MOV      r2,r6
        0x000011b2:    4651        QF      MOV      r1,r10
        0x000011b4:    4648        HF      MOV      r0,r9
        0x000011b6:    f000fd98    ....    BL       _WriteNoCheck ; 0x1cea
        0x000011ba:    e018        ..      B        0x11ee ; SEGGER_RTT_WriteNoLock + 118
        0x000011bc:    4648        HF      MOV      r0,r9
        0x000011be:    f000fc3f    ..?.    BL       _GetAvailWriteSpace ; 0x1a40
        0x000011c2:    4605        .F      MOV      r5,r0
        0x000011c4:    42b5        .B      CMP      r5,r6
        0x000011c6:    d201        ..      BCS      0x11cc ; SEGGER_RTT_WriteNoLock + 84
        0x000011c8:    4628        (F      MOV      r0,r5
        0x000011ca:    e000        ..      B        0x11ce ; SEGGER_RTT_WriteNoLock + 86
        0x000011cc:    4630        0F      MOV      r0,r6
        0x000011ce:    4604        .F      MOV      r4,r0
        0x000011d0:    4622        "F      MOV      r2,r4
        0x000011d2:    4651        QF      MOV      r1,r10
        0x000011d4:    4648        HF      MOV      r0,r9
        0x000011d6:    f000fd88    ....    BL       _WriteNoCheck ; 0x1cea
        0x000011da:    e008        ..      B        0x11ee ; SEGGER_RTT_WriteNoLock + 118
        0x000011dc:    4632        2F      MOV      r2,r6
        0x000011de:    4651        QF      MOV      r1,r10
        0x000011e0:    4648        HF      MOV      r0,r9
        0x000011e2:    f000fd49    ..I.    BL       _WriteBlocking ; 0x1c78
        0x000011e6:    4604        .F      MOV      r4,r0
        0x000011e8:    e001        ..      B        0x11ee ; SEGGER_RTT_WriteNoLock + 118
        0x000011ea:    2400        .$      MOVS     r4,#0
        0x000011ec:    bf00        ..      NOP      
        0x000011ee:    bf00        ..      NOP      
        0x000011f0:    4620         F      MOV      r0,r4
        0x000011f2:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x000011f6:    0000        ..      DCW    0
        0x000011f8:    2000024c    L..     DCD    536871500
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x000011fc:    b40f        ..      PUSH     {r0-r3}
        0x000011fe:    b538        8.      PUSH     {r3-r5,lr}
        0x00001200:    4604        .F      MOV      r4,r0
        0x00001202:    a806        ..      ADD      r0,sp,#0x18
        0x00001204:    9000        ..      STR      r0,[sp,#0]
        0x00001206:    466a        jF      MOV      r2,sp
        0x00001208:    4620         F      MOV      r0,r4
        0x0000120a:    9905        ..      LDR      r1,[sp,#0x14]
        0x0000120c:    f000f807    ....    BL       SEGGER_RTT_vprintf ; 0x121e
        0x00001210:    4605        .F      MOV      r5,r0
        0x00001212:    2000        .       MOVS     r0,#0
        0x00001214:    9000        ..      STR      r0,[sp,#0]
        0x00001216:    4628        (F      MOV      r0,r5
        0x00001218:    bc38        8.      POP      {r3-r5}
        0x0000121a:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x0000121e:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x00001222:    b099        ..      SUB      sp,sp,#0x64
        0x00001224:    4682        .F      MOV      r10,r0
        0x00001226:    460d        .F      MOV      r5,r1
        0x00001228:    4614        .F      MOV      r4,r2
        0x0000122a:    a803        ..      ADD      r0,sp,#0xc
        0x0000122c:    9014        ..      STR      r0,[sp,#0x50]
        0x0000122e:    2040        @       MOVS     r0,#0x40
        0x00001230:    9015        ..      STR      r0,[sp,#0x54]
        0x00001232:    2000        .       MOVS     r0,#0
        0x00001234:    9016        ..      STR      r0,[sp,#0x58]
        0x00001236:    f8cda060    ..`.    STR      r10,[sp,#0x60]
        0x0000123a:    9017        ..      STR      r0,[sp,#0x5c]
        0x0000123c:    bf00        ..      NOP      
        0x0000123e:    782e        .x      LDRB     r6,[r5,#0]
        0x00001240:    1c6d        m.      ADDS     r5,r5,#1
        0x00001242:    b906        ..      CBNZ     r6,0x1246 ; SEGGER_RTT_vprintf + 40
        0x00001244:    e0dd        ..      B        0x1402 ; SEGGER_RTT_vprintf + 484
        0x00001246:    2e25        %.      CMP      r6,#0x25
        0x00001248:    d179        y.      BNE      0x133e ; SEGGER_RTT_vprintf + 288
        0x0000124a:    2700        .'      MOVS     r7,#0
        0x0000124c:    f04f0901    O...    MOV      r9,#1
        0x00001250:    bf00        ..      NOP      
        0x00001252:    782e        .x      LDRB     r6,[r5,#0]
        0x00001254:    2e23        #.      CMP      r6,#0x23
        0x00001256:    d012        ..      BEQ      0x127e ; SEGGER_RTT_vprintf + 96
        0x00001258:    2e2b        +.      CMP      r6,#0x2b
        0x0000125a:    d00c        ..      BEQ      0x1276 ; SEGGER_RTT_vprintf + 88
        0x0000125c:    2e2d        -.      CMP      r6,#0x2d
        0x0000125e:    d002        ..      BEQ      0x1266 ; SEGGER_RTT_vprintf + 72
        0x00001260:    2e30        0.      CMP      r6,#0x30
        0x00001262:    d110        ..      BNE      0x1286 ; SEGGER_RTT_vprintf + 104
        0x00001264:    e003        ..      B        0x126e ; SEGGER_RTT_vprintf + 80
        0x00001266:    f0470701    G...    ORR      r7,r7,#1
        0x0000126a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000126c:    e00e        ..      B        0x128c ; SEGGER_RTT_vprintf + 110
        0x0000126e:    f0470702    G...    ORR      r7,r7,#2
        0x00001272:    1c6d        m.      ADDS     r5,r5,#1
        0x00001274:    e00a        ..      B        0x128c ; SEGGER_RTT_vprintf + 110
        0x00001276:    f0470704    G...    ORR      r7,r7,#4
        0x0000127a:    1c6d        m.      ADDS     r5,r5,#1
        0x0000127c:    e006        ..      B        0x128c ; SEGGER_RTT_vprintf + 110
        0x0000127e:    f0470708    G...    ORR      r7,r7,#8
        0x00001282:    1c6d        m.      ADDS     r5,r5,#1
        0x00001284:    e002        ..      B        0x128c ; SEGGER_RTT_vprintf + 110
        0x00001286:    f04f0900    O...    MOV      r9,#0
        0x0000128a:    bf00        ..      NOP      
        0x0000128c:    bf00        ..      NOP      
        0x0000128e:    f1b90f00    ....    CMP      r9,#0
        0x00001292:    d1de        ..      BNE      0x1252 ; SEGGER_RTT_vprintf + 52
        0x00001294:    f04f0800    O...    MOV      r8,#0
        0x00001298:    bf00        ..      NOP      
        0x0000129a:    782e        .x      LDRB     r6,[r5,#0]
        0x0000129c:    2e30        0.      CMP      r6,#0x30
        0x0000129e:    db01        ..      BLT      0x12a4 ; SEGGER_RTT_vprintf + 134
        0x000012a0:    2e39        9.      CMP      r6,#0x39
        0x000012a2:    dd00        ..      BLE      0x12a6 ; SEGGER_RTT_vprintf + 136
        0x000012a4:    e007        ..      B        0x12b6 ; SEGGER_RTT_vprintf + 152
        0x000012a6:    1c6d        m.      ADDS     r5,r5,#1
        0x000012a8:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x000012ac:    eb080188    ....    ADD      r1,r8,r8,LSL #2
        0x000012b0:    eb000841    ..A.    ADD      r8,r0,r1,LSL #1
        0x000012b4:    e7f1        ..      B        0x129a ; SEGGER_RTT_vprintf + 124
        0x000012b6:    bf00        ..      NOP      
        0x000012b8:    2000        .       MOVS     r0,#0
        0x000012ba:    9013        ..      STR      r0,[sp,#0x4c]
        0x000012bc:    782e        .x      LDRB     r6,[r5,#0]
        0x000012be:    2e2e        ..      CMP      r6,#0x2e
        0x000012c0:    d112        ..      BNE      0x12e8 ; SEGGER_RTT_vprintf + 202
        0x000012c2:    1c6d        m.      ADDS     r5,r5,#1
        0x000012c4:    bf00        ..      NOP      
        0x000012c6:    782e        .x      LDRB     r6,[r5,#0]
        0x000012c8:    2e30        0.      CMP      r6,#0x30
        0x000012ca:    db01        ..      BLT      0x12d0 ; SEGGER_RTT_vprintf + 178
        0x000012cc:    2e39        9.      CMP      r6,#0x39
        0x000012ce:    dd00        ..      BLE      0x12d2 ; SEGGER_RTT_vprintf + 180
        0x000012d0:    e009        ..      B        0x12e6 ; SEGGER_RTT_vprintf + 200
        0x000012d2:    1c6d        m.      ADDS     r5,r5,#1
        0x000012d4:    f1a60030    ..0.    SUB      r0,r6,#0x30
        0x000012d8:    9913        ..      LDR      r1,[sp,#0x4c]
        0x000012da:    eb010181    ....    ADD      r1,r1,r1,LSL #2
        0x000012de:    eb000041    ..A.    ADD      r0,r0,r1,LSL #1
        0x000012e2:    9013        ..      STR      r0,[sp,#0x4c]
        0x000012e4:    e7ef        ..      B        0x12c6 ; SEGGER_RTT_vprintf + 168
        0x000012e6:    bf00        ..      NOP      
        0x000012e8:    782e        .x      LDRB     r6,[r5,#0]
        0x000012ea:    bf00        ..      NOP      
        0x000012ec:    2e6c        l.      CMP      r6,#0x6c
        0x000012ee:    d001        ..      BEQ      0x12f4 ; SEGGER_RTT_vprintf + 214
        0x000012f0:    2e68        h.      CMP      r6,#0x68
        0x000012f2:    d102        ..      BNE      0x12fa ; SEGGER_RTT_vprintf + 220
        0x000012f4:    1c6d        m.      ADDS     r5,r5,#1
        0x000012f6:    782e        .x      LDRB     r6,[r5,#0]
        0x000012f8:    e000        ..      B        0x12fc ; SEGGER_RTT_vprintf + 222
        0x000012fa:    e000        ..      B        0x12fe ; SEGGER_RTT_vprintf + 224
        0x000012fc:    e7f6        ..      B        0x12ec ; SEGGER_RTT_vprintf + 206
        0x000012fe:    bf00        ..      NOP      
        0x00001300:    2e70        p.      CMP      r6,#0x70
        0x00001302:    d05d        ].      BEQ      0x13c0 ; SEGGER_RTT_vprintf + 418
        0x00001304:    dc08        ..      BGT      0x1318 ; SEGGER_RTT_vprintf + 250
        0x00001306:    2e25        %.      CMP      r6,#0x25
        0x00001308:    d06a        j.      BEQ      0x13e0 ; SEGGER_RTT_vprintf + 450
        0x0000130a:    2e58        X.      CMP      r6,#0x58
        0x0000130c:    d035        5.      BEQ      0x137a ; SEGGER_RTT_vprintf + 348
        0x0000130e:    2e63        c.      CMP      r6,#0x63
        0x00001310:    d009        ..      BEQ      0x1326 ; SEGGER_RTT_vprintf + 264
        0x00001312:    2e64        d.      CMP      r6,#0x64
        0x00001314:    d169        i.      BNE      0x13ea ; SEGGER_RTT_vprintf + 460
        0x00001316:    e013        ..      B        0x1340 ; SEGGER_RTT_vprintf + 290
        0x00001318:    2e73        s.      CMP      r6,#0x73
        0x0000131a:    d03c        <.      BEQ      0x1396 ; SEGGER_RTT_vprintf + 376
        0x0000131c:    2e75        u.      CMP      r6,#0x75
        0x0000131e:    d01d        ..      BEQ      0x135c ; SEGGER_RTT_vprintf + 318
        0x00001320:    2e78        x.      CMP      r6,#0x78
        0x00001322:    d162        b.      BNE      0x13ea ; SEGGER_RTT_vprintf + 460
        0x00001324:    e028        (.      B        0x1378 ; SEGGER_RTT_vprintf + 346
        0x00001326:    6821        !h      LDR      r1,[r4,#0]
        0x00001328:    1d08        ..      ADDS     r0,r1,#4
        0x0000132a:    6020         `      STR      r0,[r4,#0]
        0x0000132c:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001330:    f0090bff    ....    AND      r11,r9,#0xff
        0x00001334:    4659        YF      MOV      r1,r11
        0x00001336:    a814        ..      ADD      r0,sp,#0x50
        0x00001338:    f000fc7c    ..|.    BL       _StoreChar ; 0x1c34
        0x0000133c:    e056        V.      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x0000133e:    e058        X.      B        0x13f2 ; SEGGER_RTT_vprintf + 468
        0x00001340:    6821        !h      LDR      r1,[r4,#0]
        0x00001342:    1d08        ..      ADDS     r0,r1,#4
        0x00001344:    6020         `      STR      r0,[r4,#0]
        0x00001346:    f8d19000    ....    LDR      r9,[r1,#0]
        0x0000134a:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000134e:    220a        ."      MOVS     r2,#0xa
        0x00001350:    4649        IF      MOV      r1,r9
        0x00001352:    a814        ..      ADD      r0,sp,#0x50
        0x00001354:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001356:    f000fb81    ....    BL       _PrintInt ; 0x1a5c
        0x0000135a:    e047        G.      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x0000135c:    6821        !h      LDR      r1,[r4,#0]
        0x0000135e:    1d08        ..      ADDS     r0,r1,#4
        0x00001360:    6020         `      STR      r0,[r4,#0]
        0x00001362:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001366:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x0000136a:    220a        ."      MOVS     r2,#0xa
        0x0000136c:    4649        IF      MOV      r1,r9
        0x0000136e:    a814        ..      ADD      r0,sp,#0x50
        0x00001370:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001372:    f000fbe9    ....    BL       _PrintUnsigned ; 0x1b48
        0x00001376:    e039        9.      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x00001378:    bf00        ..      NOP      
        0x0000137a:    6821        !h      LDR      r1,[r4,#0]
        0x0000137c:    1d08        ..      ADDS     r0,r1,#4
        0x0000137e:    6020         `      STR      r0,[r4,#0]
        0x00001380:    f8d19000    ....    LDR      r9,[r1,#0]
        0x00001384:    e9cd8700    ....    STRD     r8,r7,[sp,#0]
        0x00001388:    2210        ."      MOVS     r2,#0x10
        0x0000138a:    4649        IF      MOV      r1,r9
        0x0000138c:    a814        ..      ADD      r0,sp,#0x50
        0x0000138e:    9b13        ..      LDR      r3,[sp,#0x4c]
        0x00001390:    f000fbda    ....    BL       _PrintUnsigned ; 0x1b48
        0x00001394:    e02a        *.      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x00001396:    6821        !h      LDR      r1,[r4,#0]
        0x00001398:    1d08        ..      ADDS     r0,r1,#4
        0x0000139a:    6020         `      STR      r0,[r4,#0]
        0x0000139c:    f8d1b000    ....    LDR      r11,[r1,#0]
        0x000013a0:    bf00        ..      NOP      
        0x000013a2:    f89b6000    ...`    LDRB     r6,[r11,#0]
        0x000013a6:    f10b0b01    ....    ADD      r11,r11,#1
        0x000013aa:    b906        ..      CBNZ     r6,0x13ae ; SEGGER_RTT_vprintf + 400
        0x000013ac:    e006        ..      B        0x13bc ; SEGGER_RTT_vprintf + 414
        0x000013ae:    4631        1F      MOV      r1,r6
        0x000013b0:    a814        ..      ADD      r0,sp,#0x50
        0x000013b2:    f000fc3f    ..?.    BL       _StoreChar ; 0x1c34
        0x000013b6:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000013b8:    2800        .(      CMP      r0,#0
        0x000013ba:    daf2        ..      BGE      0x13a2 ; SEGGER_RTT_vprintf + 388
        0x000013bc:    bf00        ..      NOP      
        0x000013be:    e015        ..      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x000013c0:    6821        !h      LDR      r1,[r4,#0]
        0x000013c2:    1d08        ..      ADDS     r0,r1,#4
        0x000013c4:    6020         `      STR      r0,[r4,#0]
        0x000013c6:    f8d19000    ....    LDR      r9,[r1,#0]
        0x000013ca:    2000        .       MOVS     r0,#0
        0x000013cc:    2108        .!      MOVS     r1,#8
        0x000013ce:    460b        .F      MOV      r3,r1
        0x000013d0:    2210        ."      MOVS     r2,#0x10
        0x000013d2:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x000013d6:    4649        IF      MOV      r1,r9
        0x000013d8:    a814        ..      ADD      r0,sp,#0x50
        0x000013da:    f000fbb5    ....    BL       _PrintUnsigned ; 0x1b48
        0x000013de:    e005        ..      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x000013e0:    2125        %!      MOVS     r1,#0x25
        0x000013e2:    a814        ..      ADD      r0,sp,#0x50
        0x000013e4:    f000fc26    ..&.    BL       _StoreChar ; 0x1c34
        0x000013e8:    e000        ..      B        0x13ec ; SEGGER_RTT_vprintf + 462
        0x000013ea:    bf00        ..      NOP      
        0x000013ec:    bf00        ..      NOP      
        0x000013ee:    1c6d        m.      ADDS     r5,r5,#1
        0x000013f0:    e003        ..      B        0x13fa ; SEGGER_RTT_vprintf + 476
        0x000013f2:    4631        1F      MOV      r1,r6
        0x000013f4:    a814        ..      ADD      r0,sp,#0x50
        0x000013f6:    f000fc1d    ....    BL       _StoreChar ; 0x1c34
        0x000013fa:    9817        ..      LDR      r0,[sp,#0x5c]
        0x000013fc:    2800        .(      CMP      r0,#0
        0x000013fe:    f6bfaf1e    ....    BGE      0x123e ; SEGGER_RTT_vprintf + 32
        0x00001402:    bf00        ..      NOP      
        0x00001404:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001406:    2800        .(      CMP      r0,#0
        0x00001408:    dd0a        ..      BLE      0x1420 ; SEGGER_RTT_vprintf + 514
        0x0000140a:    9816        ..      LDR      r0,[sp,#0x58]
        0x0000140c:    b120         .      CBZ      r0,0x1418 ; SEGGER_RTT_vprintf + 506
        0x0000140e:    a903        ..      ADD      r1,sp,#0xc
        0x00001410:    4650        PF      MOV      r0,r10
        0x00001412:    9a16        ..      LDR      r2,[sp,#0x58]
        0x00001414:    f7fffe8c    ....    BL       SEGGER_RTT_Write ; 0x1130
        0x00001418:    e9dd1016    ....    LDRD     r1,r0,[sp,#0x58]
        0x0000141c:    4408        .D      ADD      r0,r0,r1
        0x0000141e:    9017        ..      STR      r0,[sp,#0x5c]
        0x00001420:    9817        ..      LDR      r0,[sp,#0x5c]
        0x00001422:    b019        ..      ADD      sp,sp,#0x64
        0x00001424:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00001428:    b570        p.      PUSH     {r4-r6,lr}
        0x0000142a:    4d07        .M      LDR      r5,[pc,#28] ; [0x1448] = 0x88
        0x0000142c:    f1050470    ..p.    ADD      r4,r5,#0x70
        0x00001430:    b104        ..      CBZ      r4,0x1434 ; SPIM_IRQHandler + 12
        0x00001432:    e004        ..      B        0x143e ; SPIM_IRQHandler + 22
        0x00001434:    22c2        ."      MOVS     r2,#0xc2
        0x00001436:    a105        ..      ADR      r1,{pc}+0x16 ; 0x144c
        0x00001438:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x146c
        0x0000143a:    f000fc7d    ..}.    BL       __aeabi_assert ; 0x1d38
        0x0000143e:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x00001442:    4788        .G      BLX      r1
        0x00001444:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001446:    0000        ..      DCW    0
        0x00001448:    00000088    ....    DCD    136
        0x0000144c:    2e5c2e2e    ..\.    DCD    777793070
        0x00001450:    2e2e5c2e    .\..    DCD    774790190
        0x00001454:    464c455c    \ELF    DCD    1179403612
        0x00001458:    53425f32    2_BS    DCD    1396858674
        0x0000145c:    72445c50    P\Dr    DCD    1917082704
        0x00001460:    72657669    iver    DCD    1919252073
        0x00001464:    746e695c    \int    DCD    1953392988
        0x00001468:    00632e63    c.c.    DCD    6499939
        0x0000146c:    636e7566    func    DCD    1668183398
        0x00001470:    203d2120     !=     DCD    540877088
        0x00001474:    00000030    0...    DCD    48
    $t
    i.SystemInit
    SystemInit
        0x00001478:    b510        ..      PUSH     {r4,lr}
        0x0000147a:    bf00        ..      NOP      
        0x0000147c:    480f        .H      LDR      r0,[pc,#60] ; [0x14bc] = 0x4000b000
        0x0000147e:    6800        .h      LDR      r0,[r0,#0]
        0x00001480:    f0006080    ...`    AND      r0,r0,#0x4000000
        0x00001484:    f1b06f80    ...o    CMP      r0,#0x4000000
        0x00001488:    d1f8        ..      BNE      0x147c ; SystemInit + 4
        0x0000148a:    f64e2060    N.`     MOV      r0,#0xea60
        0x0000148e:    f000fc73    ..s.    BL       delay ; 0x1d78
        0x00001492:    480b        .H      LDR      r0,[pc,#44] ; [0x14c0] = 0x5f5e100
        0x00001494:    490b        .I      LDR      r1,[pc,#44] ; [0x14c4] = 0x200001ec
        0x00001496:    6008        .`      STR      r0,[r1,#0]
        0x00001498:    2008        .       MOVS     r0,#8
        0x0000149a:    f7fffb47    ..G.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xb2c
        0x0000149e:    2002        .       MOVS     r0,#2
        0x000014a0:    f7fffb50    ..P.    BL       HAL_SYSCON_Set_HClk_Div ; 0xb44
        0x000014a4:    2004        .       MOVS     r0,#4
        0x000014a6:    f7fffb83    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xbb0
        0x000014aa:    2002        .       MOVS     r0,#2
        0x000014ac:    f7fffbb8    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0xc20
        0x000014b0:    2164        d!      MOVS     r1,#0x64
        0x000014b2:    2001        .       MOVS     r0,#1
        0x000014b4:    f7fffbea    ....    BL       HAL_SYSCON_Set_RTC_Div ; 0xc8c
        0x000014b8:    bd10        ..      POP      {r4,pc}
    $d
        0x000014ba:    0000        ..      DCW    0
        0x000014bc:    4000b000    ...@    DCD    1073786880
        0x000014c0:    05f5e100    ....    DCD    100000000
        0x000014c4:    200001ec    ...     DCD    536871404
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x000014c8:    b570        p.      PUSH     {r4-r6,lr}
        0x000014ca:    4d07        .M      LDR      r5,[pc,#28] ; [0x14e8] = 0x88
        0x000014cc:    f1050458    ..X.    ADD      r4,r5,#0x58
        0x000014d0:    b104        ..      CBZ      r4,0x14d4 ; TIMER_IRQHandler + 12
        0x000014d2:    e004        ..      B        0x14de ; TIMER_IRQHandler + 22
        0x000014d4:    22a4        ."      MOVS     r2,#0xa4
        0x000014d6:    a105        ..      ADR      r1,{pc}+0x16 ; 0x14ec
        0x000014d8:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x150c
        0x000014da:    f000fc2d    ..-.    BL       __aeabi_assert ; 0x1d38
        0x000014de:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000014e2:    4788        .G      BLX      r1
        0x000014e4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000014e6:    0000        ..      DCW    0
        0x000014e8:    00000088    ....    DCD    136
        0x000014ec:    2e5c2e2e    ..\.    DCD    777793070
        0x000014f0:    2e2e5c2e    .\..    DCD    774790190
        0x000014f4:    464c455c    \ELF    DCD    1179403612
        0x000014f8:    53425f32    2_BS    DCD    1396858674
        0x000014fc:    72445c50    P\Dr    DCD    1917082704
        0x00001500:    72657669    iver    DCD    1919252073
        0x00001504:    746e695c    \int    DCD    1953392988
        0x00001508:    00632e63    c.c.    DCD    6499939
        0x0000150c:    636e7566    func    DCD    1668183398
        0x00001510:    203d2120     !=     DCD    540877088
        0x00001514:    00000030    0...    DCD    48
    $t
    i.Test_ADC
    Test_ADC
        0x00001518:    b500        ..      PUSH     {lr}
        0x0000151a:    b08d        ..      SUB      sp,sp,#0x34
        0x0000151c:    2218        ."      MOVS     r2,#0x18
        0x0000151e:    a109        ..      ADR      r1,{pc}+0x26 ; 0x1544
        0x00001520:    a807        ..      ADD      r0,sp,#0x1c
        0x00001522:    f7feff9e    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001526:    2218        ."      MOVS     r2,#0x18
        0x00001528:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x155c
        0x0000152a:    a801        ..      ADD      r0,sp,#4
        0x0000152c:    f7feff99    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001530:    2118        .!      MOVS     r1,#0x18
        0x00001532:    a807        ..      ADD      r0,sp,#0x1c
        0x00001534:    f7fffd27    ..'.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001538:    2116        .!      MOVS     r1,#0x16
        0x0000153a:    a801        ..      ADD      r0,sp,#4
        0x0000153c:    f7fffd23    ..#.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001540:    b00d        ..      ADD      sp,sp,#0x34
        0x00001542:    bd00        ..      POP      {pc}
    $d
        0x00001544:    74736554    Test    DCD    1953719636
        0x00001548:    65687420     the    DCD    1701344288
        0x0000154c:    43444120     ADC    DCD    1128546592
        0x00001550:    67656220     beg    DCD    1734697504
        0x00001554:    2e2e6e69    in..    DCD    774794857
        0x00001558:    000d0a2e    ....    DCD    854574
        0x0000155c:    74736554    Test    DCD    1953719636
        0x00001560:    65687420     the    DCD    1701344288
        0x00001564:    43444120     ADC    DCD    1128546592
        0x00001568:    646e6520     end    DCD    1684956448
        0x0000156c:    0a2e2e2e    ....    DCD    170798638
        0x00001570:    0000000d    ....    DCD    13
    $t
    i.Test_DMA
    Test_DMA
        0x00001574:    b500        ..      PUSH     {lr}
        0x00001576:    b08d        ..      SUB      sp,sp,#0x34
        0x00001578:    2218        ."      MOVS     r2,#0x18
        0x0000157a:    a109        ..      ADR      r1,{pc}+0x26 ; 0x15a0
        0x0000157c:    a807        ..      ADD      r0,sp,#0x1c
        0x0000157e:    f7feff70    ..p.    BL       __aeabi_memcpy4 ; 0x462
        0x00001582:    2218        ."      MOVS     r2,#0x18
        0x00001584:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x15b8
        0x00001586:    a801        ..      ADD      r0,sp,#4
        0x00001588:    f7feff6b    ..k.    BL       __aeabi_memcpy4 ; 0x462
        0x0000158c:    2118        .!      MOVS     r1,#0x18
        0x0000158e:    a807        ..      ADD      r0,sp,#0x1c
        0x00001590:    f7fffcf9    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001594:    2116        .!      MOVS     r1,#0x16
        0x00001596:    a801        ..      ADD      r0,sp,#4
        0x00001598:    f7fffcf5    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x0000159c:    b00d        ..      ADD      sp,sp,#0x34
        0x0000159e:    bd00        ..      POP      {pc}
    $d
        0x000015a0:    74736554    Test    DCD    1953719636
        0x000015a4:    65687420     the    DCD    1701344288
        0x000015a8:    414d4420     DMA    DCD    1095582752
        0x000015ac:    67656220     beg    DCD    1734697504
        0x000015b0:    2e2e6e69    in..    DCD    774794857
        0x000015b4:    000d0a2e    ....    DCD    854574
        0x000015b8:    74736554    Test    DCD    1953719636
        0x000015bc:    65687420     the    DCD    1701344288
        0x000015c0:    414d4420     DMA    DCD    1095582752
        0x000015c4:    646e6520     end    DCD    1684956448
        0x000015c8:    0a2e2e2e    ....    DCD    170798638
        0x000015cc:    0000000d    ....    DCD    13
    $t
    i.Test_EXTI
    Test_EXTI
        0x000015d0:    b500        ..      PUSH     {lr}
        0x000015d2:    b08d        ..      SUB      sp,sp,#0x34
        0x000015d4:    221c        ."      MOVS     r2,#0x1c
        0x000015d6:    a109        ..      ADR      r1,{pc}+0x26 ; 0x15fc
        0x000015d8:    a806        ..      ADD      r0,sp,#0x18
        0x000015da:    f7feff42    ..B.    BL       __aeabi_memcpy4 ; 0x462
        0x000015de:    2218        ."      MOVS     r2,#0x18
        0x000015e0:    a10d        ..      ADR      r1,{pc}+0x38 ; 0x1618
        0x000015e2:    4668        hF      MOV      r0,sp
        0x000015e4:    f7feff3d    ..=.    BL       __aeabi_memcpy4 ; 0x462
        0x000015e8:    2119        .!      MOVS     r1,#0x19
        0x000015ea:    a806        ..      ADD      r0,sp,#0x18
        0x000015ec:    f7fffccb    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x000015f0:    2117        .!      MOVS     r1,#0x17
        0x000015f2:    4668        hF      MOV      r0,sp
        0x000015f4:    f7fffcc7    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x000015f8:    b00d        ..      ADD      sp,sp,#0x34
        0x000015fa:    bd00        ..      POP      {pc}
    $d
        0x000015fc:    74736554    Test    DCD    1953719636
        0x00001600:    65687420     the    DCD    1701344288
        0x00001604:    54584520     EXT    DCD    1415071008
        0x00001608:    65622049    I be    DCD    1700929609
        0x0000160c:    2e6e6967    gin.    DCD    778987879
        0x00001610:    0d0a2e2e    ....    DCD    218770990
        0x00001614:    00000000    ....    DCD    0
        0x00001618:    74736554    Test    DCD    1953719636
        0x0000161c:    65687420     the    DCD    1701344288
        0x00001620:    54584520     EXT    DCD    1415071008
        0x00001624:    6e652049    I en    DCD    1852121161
        0x00001628:    2e2e2e64    d...    DCD    774778468
        0x0000162c:    00000d0a    ....    DCD    3338
    $t
    i.Test_Gpio
    Test_Gpio
        0x00001630:    b500        ..      PUSH     {lr}
        0x00001632:    b08d        ..      SUB      sp,sp,#0x34
        0x00001634:    221c        ."      MOVS     r2,#0x1c
        0x00001636:    a109        ..      ADR      r1,{pc}+0x26 ; 0x165c
        0x00001638:    a806        ..      ADD      r0,sp,#0x18
        0x0000163a:    f7feff12    ....    BL       __aeabi_memcpy4 ; 0x462
        0x0000163e:    2218        ."      MOVS     r2,#0x18
        0x00001640:    a10d        ..      ADR      r1,{pc}+0x38 ; 0x1678
        0x00001642:    4668        hF      MOV      r0,sp
        0x00001644:    f7feff0d    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001648:    2119        .!      MOVS     r1,#0x19
        0x0000164a:    a806        ..      ADD      r0,sp,#0x18
        0x0000164c:    f7fffc9b    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001650:    2117        .!      MOVS     r1,#0x17
        0x00001652:    4668        hF      MOV      r0,sp
        0x00001654:    f7fffc97    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001658:    b00d        ..      ADD      sp,sp,#0x34
        0x0000165a:    bd00        ..      POP      {pc}
    $d
        0x0000165c:    74736554    Test    DCD    1953719636
        0x00001660:    65687420     the    DCD    1701344288
        0x00001664:    49504720     GPI    DCD    1229997856
        0x00001668:    6562204f    O be    DCD    1700929615
        0x0000166c:    2e6e6967    gin.    DCD    778987879
        0x00001670:    0d0a2e2e    ....    DCD    218770990
        0x00001674:    00000000    ....    DCD    0
        0x00001678:    74736554    Test    DCD    1953719636
        0x0000167c:    65687420     the    DCD    1701344288
        0x00001680:    49504720     GPI    DCD    1229997856
        0x00001684:    6e65204f    O en    DCD    1852121167
        0x00001688:    2e2e2e64    d...    DCD    774778468
        0x0000168c:    00000d0a    ....    DCD    3338
    $t
    i.Test_I2C
    Test_I2C
        0x00001690:    b500        ..      PUSH     {lr}
        0x00001692:    b08d        ..      SUB      sp,sp,#0x34
        0x00001694:    2218        ."      MOVS     r2,#0x18
        0x00001696:    a109        ..      ADR      r1,{pc}+0x26 ; 0x16bc
        0x00001698:    a807        ..      ADD      r0,sp,#0x1c
        0x0000169a:    f7fefee2    ....    BL       __aeabi_memcpy4 ; 0x462
        0x0000169e:    2218        ."      MOVS     r2,#0x18
        0x000016a0:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x16d4
        0x000016a2:    a801        ..      ADD      r0,sp,#4
        0x000016a4:    f7fefedd    ....    BL       __aeabi_memcpy4 ; 0x462
        0x000016a8:    2118        .!      MOVS     r1,#0x18
        0x000016aa:    a807        ..      ADD      r0,sp,#0x1c
        0x000016ac:    f7fffc6b    ..k.    BL       HAL_UART_Write_Polling ; 0xf86
        0x000016b0:    2116        .!      MOVS     r1,#0x16
        0x000016b2:    a801        ..      ADD      r0,sp,#4
        0x000016b4:    f7fffc67    ..g.    BL       HAL_UART_Write_Polling ; 0xf86
        0x000016b8:    b00d        ..      ADD      sp,sp,#0x34
        0x000016ba:    bd00        ..      POP      {pc}
    $d
        0x000016bc:    74736554    Test    DCD    1953719636
        0x000016c0:    65687420     the    DCD    1701344288
        0x000016c4:    43324920     I2C    DCD    1127368992
        0x000016c8:    67656220     beg    DCD    1734697504
        0x000016cc:    2e2e6e69    in..    DCD    774794857
        0x000016d0:    000d0a2e    ....    DCD    854574
        0x000016d4:    74736554    Test    DCD    1953719636
        0x000016d8:    65687420     the    DCD    1701344288
        0x000016dc:    43324920     I2C    DCD    1127368992
        0x000016e0:    646e6520     end    DCD    1684956448
        0x000016e4:    0a2e2e2e    ....    DCD    170798638
        0x000016e8:    0000000d    ....    DCD    13
    $t
    i.Test_I2S
    Test_I2S
        0x000016ec:    b500        ..      PUSH     {lr}
        0x000016ee:    b08d        ..      SUB      sp,sp,#0x34
        0x000016f0:    2218        ."      MOVS     r2,#0x18
        0x000016f2:    a109        ..      ADR      r1,{pc}+0x26 ; 0x1718
        0x000016f4:    a807        ..      ADD      r0,sp,#0x1c
        0x000016f6:    f7fefeb4    ....    BL       __aeabi_memcpy4 ; 0x462
        0x000016fa:    2218        ."      MOVS     r2,#0x18
        0x000016fc:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x1730
        0x000016fe:    a801        ..      ADD      r0,sp,#4
        0x00001700:    f7fefeaf    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001704:    2118        .!      MOVS     r1,#0x18
        0x00001706:    a807        ..      ADD      r0,sp,#0x1c
        0x00001708:    f7fffc3d    ..=.    BL       HAL_UART_Write_Polling ; 0xf86
        0x0000170c:    2116        .!      MOVS     r1,#0x16
        0x0000170e:    a801        ..      ADD      r0,sp,#4
        0x00001710:    f7fffc39    ..9.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001714:    b00d        ..      ADD      sp,sp,#0x34
        0x00001716:    bd00        ..      POP      {pc}
    $d
        0x00001718:    74736554    Test    DCD    1953719636
        0x0000171c:    65687420     the    DCD    1701344288
        0x00001720:    53324920     I2S    DCD    1395804448
        0x00001724:    67656220     beg    DCD    1734697504
        0x00001728:    2e2e6e69    in..    DCD    774794857
        0x0000172c:    000d0a2e    ....    DCD    854574
        0x00001730:    74736554    Test    DCD    1953719636
        0x00001734:    65687420     the    DCD    1701344288
        0x00001738:    53324920     I2S    DCD    1395804448
        0x0000173c:    646e6520     end    DCD    1684956448
        0x00001740:    0a2e2e2e    ....    DCD    170798638
        0x00001744:    0000000d    ....    DCD    13
    $t
    i.Test_RTC
    Test_RTC
        0x00001748:    b500        ..      PUSH     {lr}
        0x0000174a:    b08d        ..      SUB      sp,sp,#0x34
        0x0000174c:    2218        ."      MOVS     r2,#0x18
        0x0000174e:    a109        ..      ADR      r1,{pc}+0x26 ; 0x1774
        0x00001750:    a807        ..      ADD      r0,sp,#0x1c
        0x00001752:    f7fefe86    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001756:    2218        ."      MOVS     r2,#0x18
        0x00001758:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x178c
        0x0000175a:    a801        ..      ADD      r0,sp,#4
        0x0000175c:    f7fefe81    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001760:    2118        .!      MOVS     r1,#0x18
        0x00001762:    a807        ..      ADD      r0,sp,#0x1c
        0x00001764:    f7fffc0f    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001768:    2116        .!      MOVS     r1,#0x16
        0x0000176a:    a801        ..      ADD      r0,sp,#4
        0x0000176c:    f7fffc0b    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001770:    b00d        ..      ADD      sp,sp,#0x34
        0x00001772:    bd00        ..      POP      {pc}
    $d
        0x00001774:    74736554    Test    DCD    1953719636
        0x00001778:    65687420     the    DCD    1701344288
        0x0000177c:    43545220     RTC    DCD    1129599520
        0x00001780:    67656220     beg    DCD    1734697504
        0x00001784:    2e2e6e69    in..    DCD    774794857
        0x00001788:    000d0a2e    ....    DCD    854574
        0x0000178c:    74736554    Test    DCD    1953719636
        0x00001790:    65687420     the    DCD    1701344288
        0x00001794:    43545220     RTC    DCD    1129599520
        0x00001798:    646e6520     end    DCD    1684956448
        0x0000179c:    0a2e2e2e    ....    DCD    170798638
        0x000017a0:    0000000d    ....    DCD    13
    $t
    i.Test_SPI
    Test_SPI
        0x000017a4:    b500        ..      PUSH     {lr}
        0x000017a6:    b08d        ..      SUB      sp,sp,#0x34
        0x000017a8:    2218        ."      MOVS     r2,#0x18
        0x000017aa:    a109        ..      ADR      r1,{pc}+0x26 ; 0x17d0
        0x000017ac:    a807        ..      ADD      r0,sp,#0x1c
        0x000017ae:    f7fefe58    ..X.    BL       __aeabi_memcpy4 ; 0x462
        0x000017b2:    2218        ."      MOVS     r2,#0x18
        0x000017b4:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x17e8
        0x000017b6:    a801        ..      ADD      r0,sp,#4
        0x000017b8:    f7fefe53    ..S.    BL       __aeabi_memcpy4 ; 0x462
        0x000017bc:    2118        .!      MOVS     r1,#0x18
        0x000017be:    a807        ..      ADD      r0,sp,#0x1c
        0x000017c0:    f7fffbe1    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x000017c4:    2116        .!      MOVS     r1,#0x16
        0x000017c6:    a801        ..      ADD      r0,sp,#4
        0x000017c8:    f7fffbdd    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x000017cc:    b00d        ..      ADD      sp,sp,#0x34
        0x000017ce:    bd00        ..      POP      {pc}
    $d
        0x000017d0:    74736554    Test    DCD    1953719636
        0x000017d4:    65687420     the    DCD    1701344288
        0x000017d8:    49505320     SPI    DCD    1230000928
        0x000017dc:    67656220     beg    DCD    1734697504
        0x000017e0:    2e2e6e69    in..    DCD    774794857
        0x000017e4:    000d0a2e    ....    DCD    854574
        0x000017e8:    74736554    Test    DCD    1953719636
        0x000017ec:    65687420     the    DCD    1701344288
        0x000017f0:    49505320     SPI    DCD    1230000928
        0x000017f4:    646e6520     end    DCD    1684956448
        0x000017f8:    0a2e2e2e    ....    DCD    170798638
        0x000017fc:    0000000d    ....    DCD    13
    $t
    i.Test_Timer
    Test_Timer
        0x00001800:    b500        ..      PUSH     {lr}
        0x00001802:    b08d        ..      SUB      sp,sp,#0x34
        0x00001804:    221c        ."      MOVS     r2,#0x1c
        0x00001806:    a109        ..      ADR      r1,{pc}+0x26 ; 0x182c
        0x00001808:    a806        ..      ADD      r0,sp,#0x18
        0x0000180a:    f7fefe2a    ..*.    BL       __aeabi_memcpy4 ; 0x462
        0x0000180e:    2218        ."      MOVS     r2,#0x18
        0x00001810:    a10d        ..      ADR      r1,{pc}+0x38 ; 0x1848
        0x00001812:    4668        hF      MOV      r0,sp
        0x00001814:    f7fefe25    ..%.    BL       __aeabi_memcpy4 ; 0x462
        0x00001818:    211a        .!      MOVS     r1,#0x1a
        0x0000181a:    a806        ..      ADD      r0,sp,#0x18
        0x0000181c:    f7fffbb3    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001820:    2118        .!      MOVS     r1,#0x18
        0x00001822:    4668        hF      MOV      r0,sp
        0x00001824:    f7fffbaf    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001828:    b00d        ..      ADD      sp,sp,#0x34
        0x0000182a:    bd00        ..      POP      {pc}
    $d
        0x0000182c:    74736554    Test    DCD    1953719636
        0x00001830:    65687420     the    DCD    1701344288
        0x00001834:    6d695420     Tim    DCD    1835619360
        0x00001838:    62207265    er b    DCD    1646293605
        0x0000183c:    6e696765    egin    DCD    1852401509
        0x00001840:    0a2e2e2e    ....    DCD    170798638
        0x00001844:    0000000d    ....    DCD    13
        0x00001848:    74736554    Test    DCD    1953719636
        0x0000184c:    65687420     the    DCD    1701344288
        0x00001850:    6d695420     Tim    DCD    1835619360
        0x00001854:    65207265    er e    DCD    1696625253
        0x00001858:    2e2e646e    nd..    DCD    774792302
        0x0000185c:    000d0a2e    ....    DCD    854574
    $t
    i.Test_WDT
    Test_WDT
        0x00001860:    b500        ..      PUSH     {lr}
        0x00001862:    b08d        ..      SUB      sp,sp,#0x34
        0x00001864:    2218        ."      MOVS     r2,#0x18
        0x00001866:    a109        ..      ADR      r1,{pc}+0x26 ; 0x188c
        0x00001868:    a807        ..      ADD      r0,sp,#0x1c
        0x0000186a:    f7fefdfa    ....    BL       __aeabi_memcpy4 ; 0x462
        0x0000186e:    2218        ."      MOVS     r2,#0x18
        0x00001870:    a10c        ..      ADR      r1,{pc}+0x34 ; 0x18a4
        0x00001872:    a801        ..      ADD      r0,sp,#4
        0x00001874:    f7fefdf5    ....    BL       __aeabi_memcpy4 ; 0x462
        0x00001878:    2118        .!      MOVS     r1,#0x18
        0x0000187a:    a807        ..      ADD      r0,sp,#0x1c
        0x0000187c:    f7fffb83    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001880:    2116        .!      MOVS     r1,#0x16
        0x00001882:    a801        ..      ADD      r0,sp,#4
        0x00001884:    f7fffb7f    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001888:    b00d        ..      ADD      sp,sp,#0x34
        0x0000188a:    bd00        ..      POP      {pc}
    $d
        0x0000188c:    74736554    Test    DCD    1953719636
        0x00001890:    65687420     the    DCD    1701344288
        0x00001894:    54445720     WDT    DCD    1413764896
        0x00001898:    67656220     beg    DCD    1734697504
        0x0000189c:    2e2e6e69    in..    DCD    774794857
        0x000018a0:    000d0a2e    ....    DCD    854574
        0x000018a4:    74736554    Test    DCD    1953719636
        0x000018a8:    65687420     the    DCD    1701344288
        0x000018ac:    54445720     WDT    DCD    1413764896
        0x000018b0:    646e6520     end    DCD    1684956448
        0x000018b4:    0a2e2e2e    ....    DCD    170798638
        0x000018b8:    0000000d    ....    DCD    13
    $t
    i.Tips_Input
    Tips_Input
        0x000018bc:    4770        pG      BX       lr
        0x000018be:    0000        ..      MOVS     r0,r0
    i.UART_IRQHandler
    UART_IRQHandler
        0x000018c0:    b570        p.      PUSH     {r4-r6,lr}
        0x000018c2:    4d07        .M      LDR      r5,[pc,#28] ; [0x18e0] = 0x88
        0x000018c4:    f1050478    ..x.    ADD      r4,r5,#0x78
        0x000018c8:    b104        ..      CBZ      r4,0x18cc ; UART_IRQHandler + 12
        0x000018ca:    e004        ..      B        0x18d6 ; UART_IRQHandler + 22
        0x000018cc:    22cc        ."      MOVS     r2,#0xcc
        0x000018ce:    a105        ..      ADR      r1,{pc}+0x16 ; 0x18e4
        0x000018d0:    a00c        ..      ADR      r0,{pc}+0x34 ; 0x1904
        0x000018d2:    f000fa31    ..1.    BL       __aeabi_assert ; 0x1d38
        0x000018d6:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x000018da:    4788        .G      BLX      r1
        0x000018dc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000018de:    0000        ..      DCW    0
        0x000018e0:    00000088    ....    DCD    136
        0x000018e4:    2e5c2e2e    ..\.    DCD    777793070
        0x000018e8:    2e2e5c2e    .\..    DCD    774790190
        0x000018ec:    464c455c    \ELF    DCD    1179403612
        0x000018f0:    53425f32    2_BS    DCD    1396858674
        0x000018f4:    72445c50    P\Dr    DCD    1917082704
        0x000018f8:    72657669    iver    DCD    1919252073
        0x000018fc:    746e695c    \int    DCD    1953392988
        0x00001900:    00632e63    c.c.    DCD    6499939
        0x00001904:    636e7566    func    DCD    1668183398
        0x00001908:    203d2120     !=     DCD    540877088
        0x0000190c:    00000030    0...    DCD    48
    $t
    i.UART_Int_Register
    UART_Int_Register
        0x00001910:    b570        p.      PUSH     {r4-r6,lr}
        0x00001912:    4605        .F      MOV      r5,r0
        0x00001914:    460c        .F      MOV      r4,r1
        0x00001916:    b105        ..      CBZ      r5,0x191a ; UART_Int_Register + 10
        0x00001918:    e004        ..      B        0x1924 ; UART_Int_Register + 20
        0x0000191a:    2285        ."      MOVS     r2,#0x85
        0x0000191c:    a108        ..      ADR      r1,{pc}+0x24 ; 0x1940
        0x0000191e:    a012        ..      ADR      r0,{pc}+0x4a ; 0x1968
        0x00001920:    f000fa0a    ....    BL       __aeabi_assert ; 0x1d38
        0x00001924:    b104        ..      CBZ      r4,0x1928 ; UART_Int_Register + 24
        0x00001926:    e004        ..      B        0x1932 ; UART_Int_Register + 34
        0x00001928:    2286        ."      MOVS     r2,#0x86
        0x0000192a:    a105        ..      ADR      r1,{pc}+0x16 ; 0x1940
        0x0000192c:    a012        ..      ADR      r0,{pc}+0x4c ; 0x1978
        0x0000192e:    f000fa03    ....    BL       __aeabi_assert ; 0x1d38
        0x00001932:    4622        "F      MOV      r2,r4
        0x00001934:    4629        )F      MOV      r1,r5
        0x00001936:    200f        .       MOVS     r0,#0xf
        0x00001938:    f000fa34    ..4.    BL       int_callback_register ; 0x1da4
        0x0000193c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000193e:    0000        ..      DCW    0
        0x00001940:    2e5c2e2e    ..\.    DCD    777793070
        0x00001944:    2e2e5c2e    .\..    DCD    774790190
        0x00001948:    464c455c    \ELF    DCD    1179403612
        0x0000194c:    53425f32    2_BS    DCD    1396858674
        0x00001950:    72445c50    P\Dr    DCD    1917082704
        0x00001954:    72657669    iver    DCD    1919252073
        0x00001958:    746e695c    \int    DCD    1953392988
        0x0000195c:    6765725f    _reg    DCD    1734701663
        0x00001960:    65747369    iste    DCD    1702130537
        0x00001964:    00632e72    r.c.    DCD    6499954
        0x00001968:    5f727369    isr_    DCD    1601336169
        0x0000196c:    636e7566    func    DCD    1668183398
        0x00001970:    203d2120     !=     DCD    540877088
        0x00001974:    00000030    0...    DCD    48
        0x00001978:    61726170    para    DCD    1634886000
        0x0000197c:    3d21206d    m !=    DCD    1025581165
        0x00001980:    00003020     0..    DCD    12320
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x00001984:    b570        p.      PUSH     {r4-r6,lr}
        0x00001986:    4d06        .M      LDR      r5,[pc,#24] ; [0x19a0] = 0x88
        0x00001988:    462c        ,F      MOV      r4,r5
        0x0000198a:    b104        ..      CBZ      r4,0x198e ; WDT_IRQHandler + 10
        0x0000198c:    e004        ..      B        0x1998 ; WDT_IRQHandler + 20
        0x0000198e:    222f        /"      MOVS     r2,#0x2f
        0x00001990:    a104        ..      ADR      r1,{pc}+0x14 ; 0x19a4
        0x00001992:    a00c        ..      ADR      r0,{pc}+0x32 ; 0x19c4
        0x00001994:    f000f9d0    ....    BL       __aeabi_assert ; 0x1d38
        0x00001998:    e9d41000    ....    LDRD     r1,r0,[r4,#0]
        0x0000199c:    4788        .G      BLX      r1
        0x0000199e:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000019a0:    00000088    ....    DCD    136
        0x000019a4:    2e5c2e2e    ..\.    DCD    777793070
        0x000019a8:    2e2e5c2e    .\..    DCD    774790190
        0x000019ac:    464c455c    \ELF    DCD    1179403612
        0x000019b0:    53425f32    2_BS    DCD    1396858674
        0x000019b4:    72445c50    P\Dr    DCD    1917082704
        0x000019b8:    72657669    iver    DCD    1919252073
        0x000019bc:    746e695c    \int    DCD    1953392988
        0x000019c0:    00632e63    c.c.    DCD    6499939
        0x000019c4:    636e7566    func    DCD    1668183398
        0x000019c8:    203d2120     !=     DCD    540877088
        0x000019cc:    00000030    0...    DCD    48
    $t
    i._DoInit
    _DoInit
        0x000019d0:    b510        ..      PUSH     {r4,lr}
        0x000019d2:    4c12        .L      LDR      r4,[pc,#72] ; [0x1a1c] = 0x20000234
        0x000019d4:    2003        .       MOVS     r0,#3
        0x000019d6:    6120         a      STR      r0,[r4,#0x10]
        0x000019d8:    6160        `a      STR      r0,[r4,#0x14]
        0x000019da:    a011        ..      ADR      r0,{pc}+0x46 ; 0x1a20
        0x000019dc:    61a0        .a      STR      r0,[r4,#0x18]
        0x000019de:    4913        .I      LDR      r1,[pc,#76] ; [0x1a2c] = 0x200002dc
        0x000019e0:    61e1        .a      STR      r1,[r4,#0x1c]
        0x000019e2:    f44f6180    O..a    MOV      r1,#0x400
        0x000019e6:    6221        !b      STR      r1,[r4,#0x20]
        0x000019e8:    2100        .!      MOVS     r1,#0
        0x000019ea:    62a1        .b      STR      r1,[r4,#0x28]
        0x000019ec:    6261        ab      STR      r1,[r4,#0x24]
        0x000019ee:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000019f0:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x1a20
        0x000019f2:    6620         f      STR      r0,[r4,#0x60]
        0x000019f4:    490e        .I      LDR      r1,[pc,#56] ; [0x1a30] = 0x200006dc
        0x000019f6:    6661        af      STR      r1,[r4,#0x64]
        0x000019f8:    2110        .!      MOVS     r1,#0x10
        0x000019fa:    66a1        .f      STR      r1,[r4,#0x68]
        0x000019fc:    2100        .!      MOVS     r1,#0
        0x000019fe:    6721        !g      STR      r1,[r4,#0x70]
        0x00001a00:    66e1        .f      STR      r1,[r4,#0x6c]
        0x00001a02:    6761        ag      STR      r1,[r4,#0x74]
        0x00001a04:    a10b        ..      ADR      r1,{pc}+0x30 ; 0x1a34
        0x00001a06:    1de0        ..      ADDS     r0,r4,#7
        0x00001a08:    f7fefcc2    ....    BL       strcpy ; 0x390
        0x00001a0c:    a10a        ..      ADR      r1,{pc}+0x2c ; 0x1a38
        0x00001a0e:    4620         F      MOV      r0,r4
        0x00001a10:    f7fefcbe    ....    BL       strcpy ; 0x390
        0x00001a14:    2020                MOVS     r0,#0x20
        0x00001a16:    71a0        .q      STRB     r0,[r4,#6]
        0x00001a18:    bd10        ..      POP      {r4,pc}
    $d
        0x00001a1a:    0000        ..      DCW    0
        0x00001a1c:    20000234    4..     DCD    536871476
        0x00001a20:    6d726554    Term    DCD    1836213588
        0x00001a24:    6c616e69    inal    DCD    1818324585
        0x00001a28:    00000000    ....    DCD    0
        0x00001a2c:    200002dc    ...     DCD    536871644
        0x00001a30:    200006dc    ...     DCD    536872668
        0x00001a34:    00545452    RTT.    DCD    5526610
        0x00001a38:    47474553    SEGG    DCD    1195853139
        0x00001a3c:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001a40:    b510        ..      PUSH     {r4,lr}
        0x00001a42:    4601        .F      MOV      r1,r0
        0x00001a44:    690a        .i      LDR      r2,[r1,#0x10]
        0x00001a46:    68cb        .h      LDR      r3,[r1,#0xc]
        0x00001a48:    429a        .B      CMP      r2,r3
        0x00001a4a:    d804        ..      BHI      0x1a56 ; _GetAvailWriteSpace + 22
        0x00001a4c:    688c        .h      LDR      r4,[r1,#8]
        0x00001a4e:    1e64        d.      SUBS     r4,r4,#1
        0x00001a50:    1ae4        ..      SUBS     r4,r4,r3
        0x00001a52:    18a0        ..      ADDS     r0,r4,r2
        0x00001a54:    e001        ..      B        0x1a5a ; _GetAvailWriteSpace + 26
        0x00001a56:    1ad4        ..      SUBS     r4,r2,r3
        0x00001a58:    1e60        `.      SUBS     r0,r4,#1
        0x00001a5a:    bd10        ..      POP      {r4,pc}
    i._PrintInt
    _PrintInt
        0x00001a5c:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001a60:    4606        .F      MOV      r6,r0
        0x00001a62:    460f        .F      MOV      r7,r1
        0x00001a64:    4692        .F      MOV      r10,r2
        0x00001a66:    4698        .F      MOV      r8,r3
        0x00001a68:    e9dd450c    ...E    LDRD     r4,r5,[sp,#0x30]
        0x00001a6c:    2f00        ./      CMP      r7,#0
        0x00001a6e:    da01        ..      BGE      0x1a74 ; _PrintInt + 24
        0x00001a70:    4278        xB      RSBS     r0,r7,#0
        0x00001a72:    e000        ..      B        0x1a76 ; _PrintInt + 26
        0x00001a74:    4638        8F      MOV      r0,r7
        0x00001a76:    4683        .F      MOV      r11,r0
        0x00001a78:    f04f0901    O...    MOV      r9,#1
        0x00001a7c:    e003        ..      B        0x1a86 ; _PrintInt + 42
        0x00001a7e:    fb9bfbfa    ....    SDIV     r11,r11,r10
        0x00001a82:    f1090901    ....    ADD      r9,r9,#1
        0x00001a86:    45d3        .E      CMP      r11,r10
        0x00001a88:    daf9        ..      BGE      0x1a7e ; _PrintInt + 34
        0x00001a8a:    45c8        .E      CMP      r8,r9
        0x00001a8c:    d900        ..      BLS      0x1a90 ; _PrintInt + 52
        0x00001a8e:    46c1        .F      MOV      r9,r8
        0x00001a90:    b134        4.      CBZ      r4,0x1aa0 ; _PrintInt + 68
        0x00001a92:    2f00        ./      CMP      r7,#0
        0x00001a94:    db03        ..      BLT      0x1a9e ; _PrintInt + 66
        0x00001a96:    f0050004    ....    AND      r0,r5,#4
        0x00001a9a:    2804        .(      CMP      r0,#4
        0x00001a9c:    d100        ..      BNE      0x1aa0 ; _PrintInt + 68
        0x00001a9e:    1e64        d.      SUBS     r4,r4,#1
        0x00001aa0:    f0050002    ....    AND      r0,r5,#2
        0x00001aa4:    b110        ..      CBZ      r0,0x1aac ; _PrintInt + 80
        0x00001aa6:    f1b80f00    ....    CMP      r8,#0
        0x00001aaa:    d011        ..      BEQ      0x1ad0 ; _PrintInt + 116
        0x00001aac:    f0050001    ....    AND      r0,r5,#1
        0x00001ab0:    b970        p.      CBNZ     r0,0x1ad0 ; _PrintInt + 116
        0x00001ab2:    b16c        l.      CBZ      r4,0x1ad0 ; _PrintInt + 116
        0x00001ab4:    e008        ..      B        0x1ac8 ; _PrintInt + 108
        0x00001ab6:    1e64        d.      SUBS     r4,r4,#1
        0x00001ab8:    2120         !      MOVS     r1,#0x20
        0x00001aba:    4630        0F      MOV      r0,r6
        0x00001abc:    f000f8ba    ....    BL       _StoreChar ; 0x1c34
        0x00001ac0:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001ac2:    2800        .(      CMP      r0,#0
        0x00001ac4:    da00        ..      BGE      0x1ac8 ; _PrintInt + 108
        0x00001ac6:    e002        ..      B        0x1ace ; _PrintInt + 114
        0x00001ac8:    b10c        ..      CBZ      r4,0x1ace ; _PrintInt + 114
        0x00001aca:    45a1        .E      CMP      r9,r4
        0x00001acc:    d3f3        ..      BCC      0x1ab6 ; _PrintInt + 90
        0x00001ace:    bf00        ..      NOP      
        0x00001ad0:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001ad2:    2800        .(      CMP      r0,#0
        0x00001ad4:    db36        6.      BLT      0x1b44 ; _PrintInt + 232
        0x00001ad6:    2f00        ./      CMP      r7,#0
        0x00001ad8:    da05        ..      BGE      0x1ae6 ; _PrintInt + 138
        0x00001ada:    427f        .B      RSBS     r7,r7,#0
        0x00001adc:    212d        -!      MOVS     r1,#0x2d
        0x00001ade:    4630        0F      MOV      r0,r6
        0x00001ae0:    f000f8a8    ....    BL       _StoreChar ; 0x1c34
        0x00001ae4:    e007        ..      B        0x1af6 ; _PrintInt + 154
        0x00001ae6:    f0050004    ....    AND      r0,r5,#4
        0x00001aea:    2804        .(      CMP      r0,#4
        0x00001aec:    d103        ..      BNE      0x1af6 ; _PrintInt + 154
        0x00001aee:    212b        +!      MOVS     r1,#0x2b
        0x00001af0:    4630        0F      MOV      r0,r6
        0x00001af2:    f000f89f    ....    BL       _StoreChar ; 0x1c34
        0x00001af6:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001af8:    2800        .(      CMP      r0,#0
        0x00001afa:    db23        #.      BLT      0x1b44 ; _PrintInt + 232
        0x00001afc:    f0050002    ....    AND      r0,r5,#2
        0x00001b00:    2802        .(      CMP      r0,#2
        0x00001b02:    d114        ..      BNE      0x1b2e ; _PrintInt + 210
        0x00001b04:    f0050001    ....    AND      r0,r5,#1
        0x00001b08:    b988        ..      CBNZ     r0,0x1b2e ; _PrintInt + 210
        0x00001b0a:    f1b80f00    ....    CMP      r8,#0
        0x00001b0e:    d10e        ..      BNE      0x1b2e ; _PrintInt + 210
        0x00001b10:    b16c        l.      CBZ      r4,0x1b2e ; _PrintInt + 210
        0x00001b12:    e008        ..      B        0x1b26 ; _PrintInt + 202
        0x00001b14:    1e64        d.      SUBS     r4,r4,#1
        0x00001b16:    2130        0!      MOVS     r1,#0x30
        0x00001b18:    4630        0F      MOV      r0,r6
        0x00001b1a:    f000f88b    ....    BL       _StoreChar ; 0x1c34
        0x00001b1e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001b20:    2800        .(      CMP      r0,#0
        0x00001b22:    da00        ..      BGE      0x1b26 ; _PrintInt + 202
        0x00001b24:    e002        ..      B        0x1b2c ; _PrintInt + 208
        0x00001b26:    b10c        ..      CBZ      r4,0x1b2c ; _PrintInt + 208
        0x00001b28:    45a1        .E      CMP      r9,r4
        0x00001b2a:    d3f3        ..      BCC      0x1b14 ; _PrintInt + 184
        0x00001b2c:    bf00        ..      NOP      
        0x00001b2e:    68f0        .h      LDR      r0,[r6,#0xc]
        0x00001b30:    2800        .(      CMP      r0,#0
        0x00001b32:    db07        ..      BLT      0x1b44 ; _PrintInt + 232
        0x00001b34:    4643        CF      MOV      r3,r8
        0x00001b36:    4652        RF      MOV      r2,r10
        0x00001b38:    4639        9F      MOV      r1,r7
        0x00001b3a:    4630        0F      MOV      r0,r6
        0x00001b3c:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x00001b40:    f000f802    ....    BL       _PrintUnsigned ; 0x1b48
        0x00001b44:    e8bd9ffc    ....    POP      {r2-r12,pc}
    i._PrintUnsigned
    _PrintUnsigned
        0x00001b48:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001b4c:    4680        .F      MOV      r8,r0
        0x00001b4e:    4689        .F      MOV      r9,r1
        0x00001b50:    4615        .F      MOV      r5,r2
        0x00001b52:    461e        .F      MOV      r6,r3
        0x00001b54:    9c0c        ..      LDR      r4,[sp,#0x30]
        0x00001b56:    f8cd9004    ....    STR      r9,[sp,#4]
        0x00001b5a:    2701        .'      MOVS     r7,#1
        0x00001b5c:    46bb        .F      MOV      r11,r7
        0x00001b5e:    e005        ..      B        0x1b6c ; _PrintUnsigned + 36
        0x00001b60:    9801        ..      LDR      r0,[sp,#4]
        0x00001b62:    fbb0f0f5    ....    UDIV     r0,r0,r5
        0x00001b66:    9001        ..      STR      r0,[sp,#4]
        0x00001b68:    f10b0b01    ....    ADD      r11,r11,#1
        0x00001b6c:    9801        ..      LDR      r0,[sp,#4]
        0x00001b6e:    42a8        .B      CMP      r0,r5
        0x00001b70:    d2f6        ..      BCS      0x1b60 ; _PrintUnsigned + 24
        0x00001b72:    455e        ^E      CMP      r6,r11
        0x00001b74:    d900        ..      BLS      0x1b78 ; _PrintUnsigned + 48
        0x00001b76:    46b3        .F      MOV      r11,r6
        0x00001b78:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001b7a:    f0000001    ....    AND      r0,r0,#1
        0x00001b7e:    b9d0        ..      CBNZ     r0,0x1bb6 ; _PrintUnsigned + 110
        0x00001b80:    b1cc        ..      CBZ      r4,0x1bb6 ; _PrintUnsigned + 110
        0x00001b82:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001b84:    f0000002    ....    AND      r0,r0,#2
        0x00001b88:    2802        .(      CMP      r0,#2
        0x00001b8a:    d103        ..      BNE      0x1b94 ; _PrintUnsigned + 76
        0x00001b8c:    b916        ..      CBNZ     r6,0x1b94 ; _PrintUnsigned + 76
        0x00001b8e:    2030        0       MOVS     r0,#0x30
        0x00001b90:    9000        ..      STR      r0,[sp,#0]
        0x00001b92:    e001        ..      B        0x1b98 ; _PrintUnsigned + 80
        0x00001b94:    2020                MOVS     r0,#0x20
        0x00001b96:    9000        ..      STR      r0,[sp,#0]
        0x00001b98:    e009        ..      B        0x1bae ; _PrintUnsigned + 102
        0x00001b9a:    1e64        d.      SUBS     r4,r4,#1
        0x00001b9c:    4640        @F      MOV      r0,r8
        0x00001b9e:    9900        ..      LDR      r1,[sp,#0]
        0x00001ba0:    f000f848    ..H.    BL       _StoreChar ; 0x1c34
        0x00001ba4:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001ba8:    2800        .(      CMP      r0,#0
        0x00001baa:    da00        ..      BGE      0x1bae ; _PrintUnsigned + 102
        0x00001bac:    e002        ..      B        0x1bb4 ; _PrintUnsigned + 108
        0x00001bae:    b10c        ..      CBZ      r4,0x1bb4 ; _PrintUnsigned + 108
        0x00001bb0:    45a3        .E      CMP      r11,r4
        0x00001bb2:    d3f2        ..      BCC      0x1b9a ; _PrintUnsigned + 82
        0x00001bb4:    bf00        ..      NOP      
        0x00001bb6:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001bba:    2800        .(      CMP      r0,#0
        0x00001bbc:    db35        5.      BLT      0x1c2a ; _PrintUnsigned + 226
        0x00001bbe:    e009        ..      B        0x1bd4 ; _PrintUnsigned + 140
        0x00001bc0:    2e01        ..      CMP      r6,#1
        0x00001bc2:    d901        ..      BLS      0x1bc8 ; _PrintUnsigned + 128
        0x00001bc4:    1e76        v.      SUBS     r6,r6,#1
        0x00001bc6:    e004        ..      B        0x1bd2 ; _PrintUnsigned + 138
        0x00001bc8:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00001bcc:    45aa        .E      CMP      r10,r5
        0x00001bce:    d200        ..      BCS      0x1bd2 ; _PrintUnsigned + 138
        0x00001bd0:    e001        ..      B        0x1bd6 ; _PrintUnsigned + 142
        0x00001bd2:    436f        oC      MULS     r7,r5,r7
        0x00001bd4:    e7f4        ..      B        0x1bc0 ; _PrintUnsigned + 120
        0x00001bd6:    bf00        ..      NOP      
        0x00001bd8:    bf00        ..      NOP      
        0x00001bda:    fbb9faf7    ....    UDIV     r10,r9,r7
        0x00001bde:    fb0a9917    ....    MLS      r9,r10,r7,r9
        0x00001be2:    4813        .H      LDR      r0,[pc,#76] ; [0x1c30] = 0x2886
        0x00001be4:    f810100a    ....    LDRB     r1,[r0,r10]
        0x00001be8:    4640        @F      MOV      r0,r8
        0x00001bea:    f000f823    ..#.    BL       _StoreChar ; 0x1c34
        0x00001bee:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001bf2:    2800        .(      CMP      r0,#0
        0x00001bf4:    da00        ..      BGE      0x1bf8 ; _PrintUnsigned + 176
        0x00001bf6:    e003        ..      B        0x1c00 ; _PrintUnsigned + 184
        0x00001bf8:    fbb7f7f5    ....    UDIV     r7,r7,r5
        0x00001bfc:    2f00        ./      CMP      r7,#0
        0x00001bfe:    d1ec        ..      BNE      0x1bda ; _PrintUnsigned + 146
        0x00001c00:    bf00        ..      NOP      
        0x00001c02:    980d        ..      LDR      r0,[sp,#0x34]
        0x00001c04:    f0000001    ....    AND      r0,r0,#1
        0x00001c08:    b178        x.      CBZ      r0,0x1c2a ; _PrintUnsigned + 226
        0x00001c0a:    b174        t.      CBZ      r4,0x1c2a ; _PrintUnsigned + 226
        0x00001c0c:    e009        ..      B        0x1c22 ; _PrintUnsigned + 218
        0x00001c0e:    1e64        d.      SUBS     r4,r4,#1
        0x00001c10:    2120         !      MOVS     r1,#0x20
        0x00001c12:    4640        @F      MOV      r0,r8
        0x00001c14:    f000f80e    ....    BL       _StoreChar ; 0x1c34
        0x00001c18:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001c1c:    2800        .(      CMP      r0,#0
        0x00001c1e:    da00        ..      BGE      0x1c22 ; _PrintUnsigned + 218
        0x00001c20:    e002        ..      B        0x1c28 ; _PrintUnsigned + 224
        0x00001c22:    b10c        ..      CBZ      r4,0x1c28 ; _PrintUnsigned + 224
        0x00001c24:    45a3        .E      CMP      r11,r4
        0x00001c26:    d3f2        ..      BCC      0x1c0e ; _PrintUnsigned + 198
        0x00001c28:    bf00        ..      NOP      
        0x00001c2a:    e8bd9ffc    ....    POP      {r2-r12,pc}
    $d
        0x00001c2e:    0000        ..      DCW    0
        0x00001c30:    00002886    .(..    DCD    10374
    $t
    i._StoreChar
    _StoreChar
        0x00001c34:    b570        p.      PUSH     {r4-r6,lr}
        0x00001c36:    4604        .F      MOV      r4,r0
        0x00001c38:    460e        .F      MOV      r6,r1
        0x00001c3a:    68a5        .h      LDR      r5,[r4,#8]
        0x00001c3c:    1c68        h.      ADDS     r0,r5,#1
        0x00001c3e:    6861        ah      LDR      r1,[r4,#4]
        0x00001c40:    4281        .B      CMP      r1,r0
        0x00001c42:    d306        ..      BCC      0x1c52 ; _StoreChar + 30
        0x00001c44:    6820         h      LDR      r0,[r4,#0]
        0x00001c46:    5546        FU      STRB     r6,[r0,r5]
        0x00001c48:    1c68        h.      ADDS     r0,r5,#1
        0x00001c4a:    60a0        .`      STR      r0,[r4,#8]
        0x00001c4c:    68e0        .h      LDR      r0,[r4,#0xc]
        0x00001c4e:    1c40        @.      ADDS     r0,r0,#1
        0x00001c50:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001c52:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x00001c56:    4288        .B      CMP      r0,r1
        0x00001c58:    d10d        ..      BNE      0x1c76 ; _StoreChar + 66
        0x00001c5a:    68a2        .h      LDR      r2,[r4,#8]
        0x00001c5c:    6821        !h      LDR      r1,[r4,#0]
        0x00001c5e:    6920         i      LDR      r0,[r4,#0x10]
        0x00001c60:    f7fffa66    ..f.    BL       SEGGER_RTT_Write ; 0x1130
        0x00001c64:    68a1        .h      LDR      r1,[r4,#8]
        0x00001c66:    4288        .B      CMP      r0,r1
        0x00001c68:    d003        ..      BEQ      0x1c72 ; _StoreChar + 62
        0x00001c6a:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001c6e:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001c70:    e001        ..      B        0x1c76 ; _StoreChar + 66
        0x00001c72:    2000        .       MOVS     r0,#0
        0x00001c74:    60a0        .`      STR      r0,[r4,#8]
        0x00001c76:    bd70        p.      POP      {r4-r6,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00001c78:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001c7c:    4604        .F      MOV      r4,r0
        0x00001c7e:    4689        .F      MOV      r9,r1
        0x00001c80:    4617        .F      MOV      r7,r2
        0x00001c82:    f04f0a00    O...    MOV      r10,#0
        0x00001c86:    68e5        .h      LDR      r5,[r4,#0xc]
        0x00001c88:    bf00        ..      NOP      
        0x00001c8a:    f8d48010    ....    LDR      r8,[r4,#0x10]
        0x00001c8e:    45a8        .E      CMP      r8,r5
        0x00001c90:    d903        ..      BLS      0x1c9a ; _WriteBlocking + 34
        0x00001c92:    eba80005    ....    SUB      r0,r8,r5
        0x00001c96:    1e46        F.      SUBS     r6,r0,#1
        0x00001c98:    e004        ..      B        0x1ca4 ; _WriteBlocking + 44
        0x00001c9a:    eba50008    ....    SUB      r0,r5,r8
        0x00001c9e:    1c40        @.      ADDS     r0,r0,#1
        0x00001ca0:    68a1        .h      LDR      r1,[r4,#8]
        0x00001ca2:    1a0e        ..      SUBS     r6,r1,r0
        0x00001ca4:    68a0        .h      LDR      r0,[r4,#8]
        0x00001ca6:    1b40        @.      SUBS     r0,r0,r5
        0x00001ca8:    42b0        .B      CMP      r0,r6
        0x00001caa:    d901        ..      BLS      0x1cb0 ; _WriteBlocking + 56
        0x00001cac:    4630        0F      MOV      r0,r6
        0x00001cae:    e001        ..      B        0x1cb4 ; _WriteBlocking + 60
        0x00001cb0:    68a0        .h      LDR      r0,[r4,#8]
        0x00001cb2:    1b40        @.      SUBS     r0,r0,r5
        0x00001cb4:    4606        .F      MOV      r6,r0
        0x00001cb6:    42be        .B      CMP      r6,r7
        0x00001cb8:    d201        ..      BCS      0x1cbe ; _WriteBlocking + 70
        0x00001cba:    4630        0F      MOV      r0,r6
        0x00001cbc:    e000        ..      B        0x1cc0 ; _WriteBlocking + 72
        0x00001cbe:    4638        8F      MOV      r0,r7
        0x00001cc0:    4606        .F      MOV      r6,r0
        0x00001cc2:    6861        ah      LDR      r1,[r4,#4]
        0x00001cc4:    1948        H.      ADDS     r0,r1,r5
        0x00001cc6:    4632        2F      MOV      r2,r6
        0x00001cc8:    4649        IF      MOV      r1,r9
        0x00001cca:    f7fefb85    ....    BL       __aeabi_memcpy ; 0x3d8
        0x00001cce:    44b2        .D      ADD      r10,r10,r6
        0x00001cd0:    44b1        .D      ADD      r9,r9,r6
        0x00001cd2:    1bbf        ..      SUBS     r7,r7,r6
        0x00001cd4:    4435        5D      ADD      r5,r5,r6
        0x00001cd6:    68a0        .h      LDR      r0,[r4,#8]
        0x00001cd8:    42a8        .B      CMP      r0,r5
        0x00001cda:    d100        ..      BNE      0x1cde ; _WriteBlocking + 102
        0x00001cdc:    2500        .%      MOVS     r5,#0
        0x00001cde:    60e5        .`      STR      r5,[r4,#0xc]
        0x00001ce0:    2f00        ./      CMP      r7,#0
        0x00001ce2:    d1d2        ..      BNE      0x1c8a ; _WriteBlocking + 18
        0x00001ce4:    4650        PF      MOV      r0,r10
        0x00001ce6:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001cea:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001cee:    4604        .F      MOV      r4,r0
        0x00001cf0:    4689        .F      MOV      r9,r1
        0x00001cf2:    4615        .F      MOV      r5,r2
        0x00001cf4:    68e6        .h      LDR      r6,[r4,#0xc]
        0x00001cf6:    68a0        .h      LDR      r0,[r4,#8]
        0x00001cf8:    1b87        ..      SUBS     r7,r0,r6
        0x00001cfa:    42af        .B      CMP      r7,r5
        0x00001cfc:    d908        ..      BLS      0x1d10 ; _WriteNoCheck + 38
        0x00001cfe:    6861        ah      LDR      r1,[r4,#4]
        0x00001d00:    1988        ..      ADDS     r0,r1,r6
        0x00001d02:    462a        *F      MOV      r2,r5
        0x00001d04:    4649        IF      MOV      r1,r9
        0x00001d06:    f7fefb67    ..g.    BL       __aeabi_memcpy ; 0x3d8
        0x00001d0a:    1970        p.      ADDS     r0,r6,r5
        0x00001d0c:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001d0e:    e010        ..      B        0x1d32 ; _WriteNoCheck + 72
        0x00001d10:    46b8        .F      MOV      r8,r7
        0x00001d12:    6861        ah      LDR      r1,[r4,#4]
        0x00001d14:    1988        ..      ADDS     r0,r1,r6
        0x00001d16:    4642        BF      MOV      r2,r8
        0x00001d18:    4649        IF      MOV      r1,r9
        0x00001d1a:    f7fefb5d    ..].    BL       __aeabi_memcpy ; 0x3d8
        0x00001d1e:    eba50807    ....    SUB      r8,r5,r7
        0x00001d22:    eb090107    ....    ADD      r1,r9,r7
        0x00001d26:    4642        BF      MOV      r2,r8
        0x00001d28:    6860        `h      LDR      r0,[r4,#4]
        0x00001d2a:    f7fefb55    ..U.    BL       __aeabi_memcpy ; 0x3d8
        0x00001d2e:    f8c4800c    ....    STR      r8,[r4,#0xc]
        0x00001d32:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00001d36:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x00001d38:    4604        .F      MOV      r4,r0
        0x00001d3a:    460d        .F      MOV      r5,r1
        0x00001d3c:    4616        .F      MOV      r6,r2
        0x00001d3e:    b672        r.      CPSID    i
        0x00001d40:    4623        #F      MOV      r3,r4
        0x00001d42:    4632        2F      MOV      r2,r6
        0x00001d44:    4629        )F      MOV      r1,r5
        0x00001d46:    a002        ..      ADR      r0,{pc}+0xa ; 0x1d50
        0x00001d48:    f7fefa7c    ..|.    BL       __2printf ; 0x244
        0x00001d4c:    bf00        ..      NOP      
        0x00001d4e:    e7fe        ..      B        0x1d4e ; __aeabi_assert + 22
    $d
        0x00001d50:    65737341    Asse    DCD    1702064961
        0x00001d54:    6f697472    rtio    DCD    1869182066
        0x00001d58:    6146206e    n Fa    DCD    1631985774
        0x00001d5c:    64656c69    iled    DCD    1684368489
        0x00001d60:    6966203a    : fi    DCD    1768300602
        0x00001d64:    2520656c    le %    DCD    622880108
        0x00001d68:    6c202c73    s, l    DCD    1814047859
        0x00001d6c:    20656e69    ine     DCD    543518313
        0x00001d70:    202c6425    %d,     DCD    539780133
        0x00001d74:    000a7325    %s..    DCD    684837
    $t
    i.delay
    delay
        0x00001d78:    2100        .!      MOVS     r1,#0
        0x00001d7a:    e006        ..      B        0x1d8a ; delay + 18
        0x00001d7c:    bf00        ..      NOP      
        0x00001d7e:    bf00        ..      NOP      
        0x00001d80:    bf00        ..      NOP      
        0x00001d82:    bf00        ..      NOP      
        0x00001d84:    bf00        ..      NOP      
        0x00001d86:    bf00        ..      NOP      
        0x00001d88:    1c49        I.      ADDS     r1,r1,#1
        0x00001d8a:    4281        .B      CMP      r1,r0
        0x00001d8c:    d3f6        ..      BCC      0x1d7c ; delay + 4
        0x00001d8e:    4770        pG      BX       lr
    i.fputc
    fputc
        0x00001d90:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00001d92:    460c        .F      MOV      r4,r1
        0x00001d94:    2201        ."      MOVS     r2,#1
        0x00001d96:    4669        iF      MOV      r1,sp
        0x00001d98:    2000        .       MOVS     r0,#0
        0x00001d9a:    f7fff9c9    ....    BL       SEGGER_RTT_Write ; 0x1130
        0x00001d9e:    9800        ..      LDR      r0,[sp,#0]
        0x00001da0:    bd1c        ..      POP      {r2-r4,pc}
        0x00001da2:    0000        ..      MOVS     r0,r0
    i.int_callback_register
    int_callback_register
        0x00001da4:    b570        p.      PUSH     {r4-r6,lr}
        0x00001da6:    4604        .F      MOV      r4,r0
        0x00001da8:    460e        .F      MOV      r6,r1
        0x00001daa:    4615        .F      MOV      r5,r2
        0x00001dac:    2c12        .,      CMP      r4,#0x12
        0x00001dae:    da00        ..      BGE      0x1db2 ; int_callback_register + 14
        0x00001db0:    e004        ..      B        0x1dbc ; int_callback_register + 24
        0x00001db2:    220b        ."      MOVS     r2,#0xb
        0x00001db4:    a106        ..      ADR      r1,{pc}+0x1c ; 0x1dd0
        0x00001db6:    a010        ..      ADR      r0,{pc}+0x42 ; 0x1df8
        0x00001db8:    f7ffffbe    ....    BL       __aeabi_assert ; 0x1d38
        0x00001dbc:    4815        .H      LDR      r0,[pc,#84] ; [0x1e14] = 0x88
        0x00001dbe:    f8406034    @.4`    STR      r6,[r0,r4,LSL #3]
        0x00001dc2:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x00001dc6:    6045        E`      STR      r5,[r0,#4]
        0x00001dc8:    4812        .H      LDR      r0,[pc,#72] ; [0x1e14] = 0x88
        0x00001dca:    eb0000c4    ....    ADD      r0,r0,r4,LSL #3
        0x00001dce:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001dd0:    2e5c2e2e    ..\.    DCD    777793070
        0x00001dd4:    2e2e5c2e    .\..    DCD    774790190
        0x00001dd8:    464c455c    \ELF    DCD    1179403612
        0x00001ddc:    53425f32    2_BS    DCD    1396858674
        0x00001de0:    72445c50    P\Dr    DCD    1917082704
        0x00001de4:    72657669    iver    DCD    1919252073
        0x00001de8:    746e695c    \int    DCD    1953392988
        0x00001dec:    6765725f    _reg    DCD    1734701663
        0x00001df0:    65747369    iste    DCD    1702130537
        0x00001df4:    00632e72    r.c.    DCD    6499954
        0x00001df8:    65646e69    inde    DCD    1701080681
        0x00001dfc:    203c2078    x <     DCD    540811384
        0x00001e00:    5f565244    DRV_    DCD    1599492676
        0x00001e04:    4c4c4143    CALL    DCD    1280065859
        0x00001e08:    4b434142    BACK    DCD    1262698818
        0x00001e0c:    58414d5f    _MAX    DCD    1480674655
        0x00001e10:    00000000    ....    DCD    0
        0x00001e14:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x00001e18:    a103        ..      ADR      r1,{pc}+0x10 ; 0x1e28
        0x00001e1a:    2000        .       MOVS     r0,#0
        0x00001e1c:    f7fff9ee    ....    BL       SEGGER_RTT_printf ; 0x11fc
        0x00001e20:    f000f822    ..".    BL       test_demo ; 0x1e68
        0x00001e24:    bf00        ..      NOP      
        0x00001e26:    e7fe        ..      B        0x1e26 ; main + 14
    $d
        0x00001e28:    6c6c6548    Hell    DCD    1819043144
        0x00001e2c:    6f57206f    o Wo    DCD    1867980911
        0x00001e30:    20646c72    rld     DCD    543452274
        0x00001e34:    38313032    2018    DCD    942747698
        0x00001e38:    34303530    0504    DCD    875574576
        0x00001e3c:    00000a7e    ~...    DCD    2686
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001e40:    4901        .I      LDR      r1,[pc,#4] ; [0x1e48] = 0x40020000
        0x00001e42:    6008        .`      STR      r0,[r1,#0]
        0x00001e44:    4770        pG      BX       lr
    $d
        0x00001e46:    0000        ..      DCW    0
        0x00001e48:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001e4c:    4903        .I      LDR      r1,[pc,#12] ; [0x1e5c] = 0x40020000
        0x00001e4e:    6849        Ih      LDR      r1,[r1,#4]
        0x00001e50:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001e54:    4a01        .J      LDR      r2,[pc,#4] ; [0x1e5c] = 0x40020000
        0x00001e56:    6051        Q`      STR      r1,[r2,#4]
        0x00001e58:    4770        pG      BX       lr
    $d
        0x00001e5a:    0000        ..      DCW    0
        0x00001e5c:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_cpu_func_en_set
    sysc_cpu_func_en_set
        0x00001e60:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00001e64:    6148        Ha      STR      r0,[r1,#0x14]
        0x00001e66:    4770        pG      BX       lr
    i.test_demo
    test_demo
        0x00001e68:    b50e        ..      PUSH     {r1-r3,lr}
        0x00001e6a:    2201        ."      MOVS     r2,#1
        0x00001e6c:    2106        .!      MOVS     r1,#6
        0x00001e6e:    2000        .       MOVS     r0,#0
        0x00001e70:    f7fefd6a    ..j.    BL       HAL_SYSCON_Function_IO_Set ; 0x948
        0x00001e74:    2201        ."      MOVS     r2,#1
        0x00001e76:    2107        .!      MOVS     r1,#7
        0x00001e78:    4610        .F      MOV      r0,r2
        0x00001e7a:    f7fefd65    ..e.    BL       HAL_SYSCON_Function_IO_Set ; 0x948
        0x00001e7e:    4923        #I      LDR      r1,[pc,#140] ; [0x1f0c] = 0x20000208
        0x00001e80:    4823        #H      LDR      r0,[pc,#140] ; [0x1f10] = 0xded
        0x00001e82:    f7fffd45    ..E.    BL       UART_Int_Register ; 0x1910
        0x00001e86:    f44f30e1    O..0    MOV      r0,#0x1c200
        0x00001e8a:    9000        ..      STR      r0,[sp,#0]
        0x00001e8c:    2003        .       MOVS     r0,#3
        0x00001e8e:    f88d0004    ....    STRB     r0,[sp,#4]
        0x00001e92:    2000        .       MOVS     r0,#0
        0x00001e94:    f88d0006    ....    STRB     r0,[sp,#6]
        0x00001e98:    f88d0005    ....    STRB     r0,[sp,#5]
        0x00001e9c:    481d        .H      LDR      r0,[pc,#116] ; [0x1f14] = 0x17d7840
        0x00001e9e:    e9dd1200    ....    LDRD     r1,r2,[sp,#0]
        0x00001ea2:    f7feff69    ..i.    BL       HAL_UART_Init ; 0xd78
        0x00001ea6:    2100        .!      MOVS     r1,#0
        0x00001ea8:    4608        .F      MOV      r0,r1
        0x00001eaa:    f7feff4f    ..O.    BL       HAL_UART_FIFO_Control ; 0xd4c
        0x00001eae:    200f        .       MOVS     r0,#0xf
        0x00001eb0:    2800        .(      CMP      r0,#0
        0x00001eb2:    db09        ..      BLT      0x1ec8 ; test_demo + 96
        0x00001eb4:    f000021f    ....    AND      r2,r0,#0x1f
        0x00001eb8:    2101        .!      MOVS     r1,#1
        0x00001eba:    4091        .@      LSLS     r1,r1,r2
        0x00001ebc:    0942        B.      LSRS     r2,r0,#5
        0x00001ebe:    0092        ..      LSLS     r2,r2,#2
        0x00001ec0:    f10222e0    ..."    ADD      r2,r2,#0xe000e000
        0x00001ec4:    f8c21100    ....    STR      r1,[r2,#0x100]
        0x00001ec8:    bf00        ..      NOP      
        0x00001eca:    2000        .       MOVS     r0,#0
        0x00001ecc:    9002        ..      STR      r0,[sp,#8]
        0x00001ece:    e00f        ..      B        0x1ef0 ; test_demo + 136
        0x00001ed0:    4911        .I      LDR      r1,[pc,#68] ; [0x1f18] = 0x20000000
        0x00001ed2:    f89d2008    ...     LDRB     r2,[sp,#8]
        0x00001ed6:    5c88        .\      LDRB     r0,[r1,r2]
        0x00001ed8:    f7fff84a    ..J.    BL       HAL_UART_WriteChar_Polling ; 0xf70
        0x00001edc:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00001ee0:    1c40        @.      ADDS     r0,r0,#1
        0x00001ee2:    b2c0        ..      UXTB     r0,r0
        0x00001ee4:    9002        ..      STR      r0,[sp,#8]
        0x00001ee6:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00001eea:    280e        .(      CMP      r0,#0xe
        0x00001eec:    d100        ..      BNE      0x1ef0 ; test_demo + 136
        0x00001eee:    e000        ..      B        0x1ef2 ; test_demo + 138
        0x00001ef0:    e7ee        ..      B        0x1ed0 ; test_demo + 104
        0x00001ef2:    bf00        ..      NOP      
        0x00001ef4:    210e        .!      MOVS     r1,#0xe
        0x00001ef6:    4808        .H      LDR      r0,[pc,#32] ; [0x1f18] = 0x20000000
        0x00001ef8:    f7fff845    ..E.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001efc:    e005        ..      B        0x1f0a ; test_demo + 162
        0x00001efe:    2300        .#      MOVS     r3,#0
        0x00001f00:    4a06        .J      LDR      r2,[pc,#24] ; [0x1f1c] = 0x1f25
        0x00001f02:    2101        .!      MOVS     r1,#1
        0x00001f04:    4806        .H      LDR      r0,[pc,#24] ; [0x1f20] = 0x200001f4
        0x00001f06:    f7feff99    ....    BL       HAL_UART_Read ; 0xe3c
        0x00001f0a:    e7f8        ..      B        0x1efe ; test_demo + 150
    $d
        0x00001f0c:    20000208    ...     DCD    536871432
        0x00001f10:    00000ded    ....    DCD    3565
        0x00001f14:    017d7840    @x}.    DCD    25000000
        0x00001f18:    20000000    ...     DCD    536870912
        0x00001f1c:    00001f25    %...    DCD    7973
        0x00001f20:    200001f4    ...     DCD    536871412
    $t
    i.test_uart_rx_finish
    test_uart_rx_finish
        0x00001f24:    b570        p.      PUSH     {r4-r6,lr}
        0x00001f26:    4605        .F      MOV      r5,r0
        0x00001f28:    460c        .F      MOV      r4,r1
        0x00001f2a:    2c00        .,      CMP      r4,#0
        0x00001f2c:    d17e        ~.      BNE      0x202c ; test_uart_rx_finish + 264
        0x00001f2e:    2101        .!      MOVS     r1,#1
        0x00001f30:    4844        DH      LDR      r0,[pc,#272] ; [0x2044] = 0x200001f4
        0x00001f32:    f7fff828    ..(.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001f36:    2102        .!      MOVS     r1,#2
        0x00001f38:    4843        CH      LDR      r0,[pc,#268] ; [0x2048] = 0x2000000e
        0x00001f3a:    f7fff824    ..$.    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001f3e:    4841        AH      LDR      r0,[pc,#260] ; [0x2044] = 0x200001f4
        0x00001f40:    7800        .x      LDRB     r0,[r0,#0]
        0x00001f42:    3831        18      SUBS     r0,r0,#0x31
        0x00001f44:    2811        .(      CMP      r0,#0x11
        0x00001f46:    d228        (.      BCS      0x1f9a ; test_uart_rx_finish + 118
        0x00001f48:    e8dff000    ....    TBB      [pc,r0]
    $d
        0x00001f4c:    120f0c09    ....    DCD    302976009
        0x00001f50:    1e1b1815    ....    DCD    505092117
        0x00001f54:    27272721    !'''    DCD    656877345
        0x00001f58:    27272727    ''''    DCD    656877351
        0x00001f5c:    0024        $.      DCW    36
    $t
        0x00001f5e:    f7fffb67    ..g.    BL       Test_Gpio ; 0x1630
        0x00001f62:    e01d        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f64:    f7fffc4c    ..L.    BL       Test_Timer ; 0x1800
        0x00001f68:    e01a        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f6a:    f7fffbed    ....    BL       Test_RTC ; 0x1748
        0x00001f6e:    e017        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f70:    f7fffb00    ....    BL       Test_DMA ; 0x1574
        0x00001f74:    e014        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f76:    f7fffb2b    ..+.    BL       Test_EXTI ; 0x15d0
        0x00001f7a:    e011        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f7c:    f7fffc12    ....    BL       Test_SPI ; 0x17a4
        0x00001f80:    e00e        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f82:    f7fffb85    ....    BL       Test_I2C ; 0x1690
        0x00001f86:    e00b        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f88:    f7fffbb0    ....    BL       Test_I2S ; 0x16ec
        0x00001f8c:    e008        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f8e:    f7fffc67    ..g.    BL       Test_WDT ; 0x1860
        0x00001f92:    e005        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f94:    f7fffac0    ....    BL       Test_ADC ; 0x1518
        0x00001f98:    e002        ..      B        0x1fa0 ; test_uart_rx_finish + 124
        0x00001f9a:    f7fffc8f    ....    BL       Tips_Input ; 0x18bc
        0x00001f9e:    bf00        ..      NOP      
        0x00001fa0:    bf00        ..      NOP      
        0x00001fa2:    2132        2!      MOVS     r1,#0x32
        0x00001fa4:    4829        )H      LDR      r0,[pc,#164] ; [0x204c] = 0x2000002f
        0x00001fa6:    f7feffee    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001faa:    2130        0!      MOVS     r1,#0x30
        0x00001fac:    4828        (H      LDR      r0,[pc,#160] ; [0x2050] = 0x20000061
        0x00001fae:    f7feffea    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fb2:    2130        0!      MOVS     r1,#0x30
        0x00001fb4:    4827        'H      LDR      r0,[pc,#156] ; [0x2054] = 0x20000091
        0x00001fb6:    f7feffe6    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fba:    2130        0!      MOVS     r1,#0x30
        0x00001fbc:    4826        &H      LDR      r0,[pc,#152] ; [0x2058] = 0x200000c1
        0x00001fbe:    f7feffe2    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fc2:    2130        0!      MOVS     r1,#0x30
        0x00001fc4:    4825        %H      LDR      r0,[pc,#148] ; [0x205c] = 0x200000f1
        0x00001fc6:    f7feffde    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fca:    2130        0!      MOVS     r1,#0x30
        0x00001fcc:    4824        $H      LDR      r0,[pc,#144] ; [0x2060] = 0x20000121
        0x00001fce:    f7feffda    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fd2:    210f        .!      MOVS     r1,#0xf
        0x00001fd4:    4823        #H      LDR      r0,[pc,#140] ; [0x2064] = 0x20000151
        0x00001fd6:    f7feffd6    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fda:    2110        .!      MOVS     r1,#0x10
        0x00001fdc:    4822        "H      LDR      r0,[pc,#136] ; [0x2068] = 0x20000160
        0x00001fde:    f7feffd2    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fe2:    210e        .!      MOVS     r1,#0xe
        0x00001fe4:    4821        !H      LDR      r0,[pc,#132] ; [0x206c] = 0x20000170
        0x00001fe6:    f7feffce    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001fea:    210e        .!      MOVS     r1,#0xe
        0x00001fec:    4820         H      LDR      r0,[pc,#128] ; [0x2070] = 0x2000017e
        0x00001fee:    f7feffca    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001ff2:    210f        .!      MOVS     r1,#0xf
        0x00001ff4:    481f        .H      LDR      r0,[pc,#124] ; [0x2074] = 0x2000018c
        0x00001ff6:    f7feffc6    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00001ffa:    210e        .!      MOVS     r1,#0xe
        0x00001ffc:    481e        .H      LDR      r0,[pc,#120] ; [0x2078] = 0x2000019b
        0x00001ffe:    f7feffc2    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00002002:    210e        .!      MOVS     r1,#0xe
        0x00002004:    481d        .H      LDR      r0,[pc,#116] ; [0x207c] = 0x200001a9
        0x00002006:    f7feffbe    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x0000200a:    210e        .!      MOVS     r1,#0xe
        0x0000200c:    481c        .H      LDR      r0,[pc,#112] ; [0x2080] = 0x200001b7
        0x0000200e:    f7feffba    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00002012:    210e        .!      MOVS     r1,#0xe
        0x00002014:    481b        .H      LDR      r0,[pc,#108] ; [0x2084] = 0x200001c5
        0x00002016:    f7feffb6    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x0000201a:    210e        .!      MOVS     r1,#0xe
        0x0000201c:    481a        .H      LDR      r0,[pc,#104] ; [0x2088] = 0x200001d3
        0x0000201e:    f7feffb2    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x00002022:    2132        2!      MOVS     r1,#0x32
        0x00002024:    4809        .H      LDR      r0,[pc,#36] ; [0x204c] = 0x2000002f
        0x00002026:    f7feffae    ....    BL       HAL_UART_Write_Polling ; 0xf86
        0x0000202a:    e000        ..      B        0x202e ; test_uart_rx_finish + 266
        0x0000202c:    e003        ..      B        0x2036 ; test_uart_rx_finish + 274
        0x0000202e:    4805        .H      LDR      r0,[pc,#20] ; [0x2044] = 0x200001f4
        0x00002030:    2100        .!      MOVS     r1,#0
        0x00002032:    7001        .p      STRB     r1,[r0,#0]
        0x00002034:    e004        ..      B        0x2040 ; test_uart_rx_finish + 284
        0x00002036:    22bc        ."      MOVS     r2,#0xbc
        0x00002038:    a114        ..      ADR      r1,{pc}+0x54 ; 0x208c
        0x0000203a:    a018        ..      ADR      r0,{pc}+0x62 ; 0x209c
        0x0000203c:    f7fffe7c    ..|.    BL       __aeabi_assert ; 0x1d38
        0x00002040:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00002042:    0000        ..      DCW    0
        0x00002044:    200001f4    ...     DCD    536871412
        0x00002048:    2000000e    ...     DCD    536870926
        0x0000204c:    2000002f    /..     DCD    536870959
        0x00002050:    20000061    a..     DCD    536871009
        0x00002054:    20000091    ...     DCD    536871057
        0x00002058:    200000c1    ...     DCD    536871105
        0x0000205c:    200000f1    ...     DCD    536871153
        0x00002060:    20000121    !..     DCD    536871201
        0x00002064:    20000151    Q..     DCD    536871249
        0x00002068:    20000160    `..     DCD    536871264
        0x0000206c:    20000170    p..     DCD    536871280
        0x00002070:    2000017e    ~..     DCD    536871294
        0x00002074:    2000018c    ...     DCD    536871308
        0x00002078:    2000019b    ...     DCD    536871323
        0x0000207c:    200001a9    ...     DCD    536871337
        0x00002080:    200001b7    ...     DCD    536871351
        0x00002084:    200001c5    ...     DCD    536871365
        0x00002088:    200001d3    ...     DCD    536871379
        0x0000208c:    5c637273    src\    DCD    1550021235
        0x00002090:    74736574    test    DCD    1953719668
        0x00002094:    6d65645f    _dem    DCD    1835361375
        0x00002098:    00632e6f    o.c.    DCD    6499951
        0x0000209c:    00000030    0...    DCD    48
    $t
    i.uart_afce_setf
    uart_afce_setf
        0x000020a0:    4903        .I      LDR      r1,[pc,#12] ; [0x20b0] = 0x40003000
        0x000020a2:    6909        .i      LDR      r1,[r1,#0x10]
        0x000020a4:    f3601145    `.E.    BFI      r1,r0,#5,#1
        0x000020a8:    4a01        .J      LDR      r2,[pc,#4] ; [0x20b0] = 0x40003000
        0x000020aa:    6111        .a      STR      r1,[r2,#0x10]
        0x000020ac:    4770        pG      BX       lr
    $d
        0x000020ae:    0000        ..      DCW    0
        0x000020b0:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_dlab_setf
    uart_dlab_setf
        0x000020b4:    4903        .I      LDR      r1,[pc,#12] ; [0x20c4] = 0x40003000
        0x000020b6:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000020b8:    f36011c7    `...    BFI      r1,r0,#7,#1
        0x000020bc:    4a01        .J      LDR      r2,[pc,#4] ; [0x20c4] = 0x40003000
        0x000020be:    60d1        .`      STR      r1,[r2,#0xc]
        0x000020c0:    4770        pG      BX       lr
    $d
        0x000020c2:    0000        ..      DCW    0
        0x000020c4:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_eps_setf
    uart_eps_setf
        0x000020c8:    4903        .I      LDR      r1,[pc,#12] ; [0x20d8] = 0x40003000
        0x000020ca:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000020cc:    f3601104    `...    BFI      r1,r0,#4,#1
        0x000020d0:    4a01        .J      LDR      r2,[pc,#4] ; [0x20d8] = 0x40003000
        0x000020d2:    60d1        .`      STR      r1,[r2,#0xc]
        0x000020d4:    4770        pG      BX       lr
    $d
        0x000020d6:    0000        ..      DCW    0
        0x000020d8:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_erbfi_setf
    uart_erbfi_setf
        0x000020dc:    4903        .I      LDR      r1,[pc,#12] ; [0x20ec] = 0x40003000
        0x000020de:    6849        Ih      LDR      r1,[r1,#4]
        0x000020e0:    f3600100    `...    BFI      r1,r0,#0,#1
        0x000020e4:    4a01        .J      LDR      r2,[pc,#4] ; [0x20ec] = 0x40003000
        0x000020e6:    6051        Q`      STR      r1,[r2,#4]
        0x000020e8:    4770        pG      BX       lr
    $d
        0x000020ea:    0000        ..      DCW    0
        0x000020ec:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_etbei_setf
    uart_etbei_setf
        0x000020f0:    4903        .I      LDR      r1,[pc,#12] ; [0x2100] = 0x40003000
        0x000020f2:    6849        Ih      LDR      r1,[r1,#4]
        0x000020f4:    f3600141    `.A.    BFI      r1,r0,#1,#1
        0x000020f8:    4a01        .J      LDR      r2,[pc,#4] ; [0x2100] = 0x40003000
        0x000020fa:    6051        Q`      STR      r1,[r2,#4]
        0x000020fc:    4770        pG      BX       lr
    $d
        0x000020fe:    0000        ..      DCW    0
        0x00002100:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_pen_setf
    uart_pen_setf
        0x00002104:    4903        .I      LDR      r1,[pc,#12] ; [0x2114] = 0x40003000
        0x00002106:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00002108:    f36001c3    `...    BFI      r1,r0,#3,#1
        0x0000210c:    4a01        .J      LDR      r2,[pc,#4] ; [0x2114] = 0x40003000
        0x0000210e:    60d1        .`      STR      r1,[r2,#0xc]
        0x00002110:    4770        pG      BX       lr
    $d
        0x00002112:    0000        ..      DCW    0
        0x00002114:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rbr_get
    uart_rbr_get
        0x00002118:    4801        .H      LDR      r0,[pc,#4] ; [0x2120] = 0x40003000
        0x0000211a:    6800        .h      LDR      r0,[r0,#0]
        0x0000211c:    4770        pG      BX       lr
    $d
        0x0000211e:    0000        ..      DCW    0
        0x00002120:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rec_data_avail_isr
    uart_rec_data_avail_isr
        0x00002124:    b570        p.      PUSH     {r4-r6,lr}
        0x00002126:    2400        .$      MOVS     r4,#0
        0x00002128:    2600        .&      MOVS     r6,#0
        0x0000212a:    e078        x.      B        0x221e ; uart_rec_data_avail_isr + 250
        0x0000212c:    4841        AH      LDR      r0,[pc,#260] ; [0x2234] = 0x200006ec
        0x0000212e:    f890002a    ..*.    LDRB     r0,[r0,#0x2a]
        0x00002132:    2800        .(      CMP      r0,#0
        0x00002134:    d133        3.      BNE      0x219e ; uart_rec_data_avail_isr + 122
        0x00002136:    f7ffffef    ....    BL       uart_rbr_get ; 0x2118
        0x0000213a:    b2c1        ..      UXTB     r1,r0
        0x0000213c:    483d        =H      LDR      r0,[pc,#244] ; [0x2234] = 0x200006ec
        0x0000213e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002140:    7001        .p      STRB     r1,[r0,#0]
        0x00002142:    483c        <H      LDR      r0,[pc,#240] ; [0x2234] = 0x200006ec
        0x00002144:    6940        @i      LDR      r0,[r0,#0x14]
        0x00002146:    1e40        @.      SUBS     r0,r0,#1
        0x00002148:    493a        :I      LDR      r1,[pc,#232] ; [0x2234] = 0x200006ec
        0x0000214a:    6148        Ha      STR      r0,[r1,#0x14]
        0x0000214c:    4608        .F      MOV      r0,r1
        0x0000214e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00002150:    1c40        @.      ADDS     r0,r0,#1
        0x00002152:    6188        .a      STR      r0,[r1,#0x18]
        0x00002154:    4608        .F      MOV      r0,r1
        0x00002156:    6940        @i      LDR      r0,[r0,#0x14]
        0x00002158:    2800        .(      CMP      r0,#0
        0x0000215a:    d160        `.      BNE      0x221e ; uart_rec_data_avail_isr + 250
        0x0000215c:    2100        .!      MOVS     r1,#0
        0x0000215e:    4835        5H      LDR      r0,[pc,#212] ; [0x2234] = 0x200006ec
        0x00002160:    6181        .a      STR      r1,[r0,#0x18]
        0x00002162:    2000        .       MOVS     r0,#0
        0x00002164:    f7ffffba    ....    BL       uart_erbfi_setf ; 0x20dc
        0x00002168:    4832        2H      LDR      r0,[pc,#200] ; [0x2234] = 0x200006ec
        0x0000216a:    6a04        .j      LDR      r4,[r0,#0x20]
        0x0000216c:    6a46        Fj      LDR      r6,[r0,#0x24]
        0x0000216e:    b184        ..      CBZ      r4,0x2192 ; uart_rec_data_avail_isr + 110
        0x00002170:    2100        .!      MOVS     r1,#0
        0x00002172:    6201        .b      STR      r1,[r0,#0x20]
        0x00002174:    6241        Ab      STR      r1,[r0,#0x24]
        0x00002176:    f8900028    ..(.    LDRB     r0,[r0,#0x28]
        0x0000217a:    b910        ..      CBNZ     r0,0x2182 ; uart_rec_data_avail_isr + 94
        0x0000217c:    4630        0F      MOV      r0,r6
        0x0000217e:    47a0        .G      BLX      r4
        0x00002180:    e00c        ..      B        0x219c ; uart_rec_data_avail_isr + 120
        0x00002182:    2000        .       MOVS     r0,#0
        0x00002184:    492b        +I      LDR      r1,[pc,#172] ; [0x2234] = 0x200006ec
        0x00002186:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x0000218a:    2101        .!      MOVS     r1,#1
        0x0000218c:    4630        0F      MOV      r0,r6
        0x0000218e:    47a0        .G      BLX      r4
        0x00002190:    e004        ..      B        0x219c ; uart_rec_data_avail_isr + 120
        0x00002192:    2238        8"      MOVS     r2,#0x38
        0x00002194:    a128        (.      ADR      r1,{pc}+0xa4 ; 0x2238
        0x00002196:    a030        0.      ADR      r0,{pc}+0xc2 ; 0x2258
        0x00002198:    f7fffdce    ....    BL       __aeabi_assert ; 0x1d38
        0x0000219c:    e047        G.      B        0x222e ; uart_rec_data_avail_isr + 266
        0x0000219e:    4825        %H      LDR      r0,[pc,#148] ; [0x2234] = 0x200006ec
        0x000021a0:    f890002a    ..*.    LDRB     r0,[r0,#0x2a]
        0x000021a4:    2801        .(      CMP      r0,#1
        0x000021a6:    d13a        :.      BNE      0x221e ; uart_rec_data_avail_isr + 250
        0x000021a8:    f7ffffb6    ....    BL       uart_rbr_get ; 0x2118
        0x000021ac:    b2c5        ..      UXTB     r5,r0
        0x000021ae:    4821        !H      LDR      r0,[pc,#132] ; [0x2234] = 0x200006ec
        0x000021b0:    f8900029    ..).    LDRB     r0,[r0,#0x29]
        0x000021b4:    2801        .(      CMP      r0,#1
        0x000021b6:    d107        ..      BNE      0x21c8 ; uart_rec_data_avail_isr + 164
        0x000021b8:    bf00        ..      NOP      
        0x000021ba:    f000f87b    ..{.    BL       uart_tfnf_getf ; 0x22b4
        0x000021be:    2800        .(      CMP      r0,#0
        0x000021c0:    d0fb        ..      BEQ      0x21ba ; uart_rec_data_avail_isr + 150
        0x000021c2:    4628        (F      MOV      r0,r5
        0x000021c4:    f000f8c4    ....    BL       uart_thr_set ; 0x2350
        0x000021c8:    481a        .H      LDR      r0,[pc,#104] ; [0x2234] = 0x200006ec
        0x000021ca:    6980        .i      LDR      r0,[r0,#0x18]
        0x000021cc:    7005        .p      STRB     r5,[r0,#0]
        0x000021ce:    4819        .H      LDR      r0,[pc,#100] ; [0x2234] = 0x200006ec
        0x000021d0:    6980        .i      LDR      r0,[r0,#0x18]
        0x000021d2:    1c40        @.      ADDS     r0,r0,#1
        0x000021d4:    4917        .I      LDR      r1,[pc,#92] ; [0x2234] = 0x200006ec
        0x000021d6:    6188        .a      STR      r0,[r1,#0x18]
        0x000021d8:    4608        .F      MOV      r0,r1
        0x000021da:    f890002b    ..+.    LDRB     r0,[r0,#0x2b]
        0x000021de:    42a8        .B      CMP      r0,r5
        0x000021e0:    d11d        ..      BNE      0x221e ; uart_rec_data_avail_isr + 250
        0x000021e2:    2000        .       MOVS     r0,#0
        0x000021e4:    f7ffff7a    ..z.    BL       uart_erbfi_setf ; 0x20dc
        0x000021e8:    4812        .H      LDR      r0,[pc,#72] ; [0x2234] = 0x200006ec
        0x000021ea:    6a04        .j      LDR      r4,[r0,#0x20]
        0x000021ec:    6a46        Fj      LDR      r6,[r0,#0x24]
        0x000021ee:    b184        ..      CBZ      r4,0x2212 ; uart_rec_data_avail_isr + 238
        0x000021f0:    2100        .!      MOVS     r1,#0
        0x000021f2:    6201        .b      STR      r1,[r0,#0x20]
        0x000021f4:    6241        Ab      STR      r1,[r0,#0x24]
        0x000021f6:    f8900028    ..(.    LDRB     r0,[r0,#0x28]
        0x000021fa:    b910        ..      CBNZ     r0,0x2202 ; uart_rec_data_avail_isr + 222
        0x000021fc:    4630        0F      MOV      r0,r6
        0x000021fe:    47a0        .G      BLX      r4
        0x00002200:    e00c        ..      B        0x221c ; uart_rec_data_avail_isr + 248
        0x00002202:    2000        .       MOVS     r0,#0
        0x00002204:    490b        .I      LDR      r1,[pc,#44] ; [0x2234] = 0x200006ec
        0x00002206:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x0000220a:    2101        .!      MOVS     r1,#1
        0x0000220c:    4630        0F      MOV      r0,r6
        0x0000220e:    47a0        .G      BLX      r4
        0x00002210:    e004        ..      B        0x221c ; uart_rec_data_avail_isr + 248
        0x00002212:    2263        c"      MOVS     r2,#0x63
        0x00002214:    a108        ..      ADR      r1,{pc}+0x24 ; 0x2238
        0x00002216:    a010        ..      ADR      r0,{pc}+0x42 ; 0x2258
        0x00002218:    f7fffd8e    ....    BL       __aeabi_assert ; 0x1d38
        0x0000221c:    e007        ..      B        0x222e ; uart_rec_data_avail_isr + 266
        0x0000221e:    bf00        ..      NOP      
        0x00002220:    480e        .H      LDR      r0,[pc,#56] ; [0x225c] = 0x40003000
        0x00002222:    6940        @i      LDR      r0,[r0,#0x14]
        0x00002224:    f0000001    ....    AND      r0,r0,#1
        0x00002228:    2800        .(      CMP      r0,#0
        0x0000222a:    f47faf7f    ....    BNE      0x212c ; uart_rec_data_avail_isr + 8
        0x0000222e:    bf00        ..      NOP      
        0x00002230:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00002232:    0000        ..      DCW    0
        0x00002234:    200006ec    ...     DCD    536872684
        0x00002238:    735c2e2e    ..\s    DCD    1935420974
        0x0000223c:    735c6b64    dk\s    DCD    1935436644
        0x00002240:    735c6372    rc\s    DCD    1935434610
        0x00002244:    645c636f    oc\d    DCD    1683776367
        0x00002248:    65766972    rive    DCD    1702259058
        0x0000224c:    61755c72    r\ua    DCD    1635081330
        0x00002250:    632e7472    rt.c    DCD    1663988850
        0x00002254:    00000000    ....    DCD    0
        0x00002258:    00000030    0...    DCD    48
        0x0000225c:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_rec_error_isr
    uart_rec_error_isr
        0x00002260:    b570        p.      PUSH     {r4-r6,lr}
        0x00002262:    2400        .$      MOVS     r4,#0
        0x00002264:    2600        .&      MOVS     r6,#0
        0x00002266:    bf00        ..      NOP      
        0x00002268:    4810        .H      LDR      r0,[pc,#64] ; [0x22ac] = 0x40003000
        0x0000226a:    6940        @i      LDR      r0,[r0,#0x14]
        0x0000226c:    b2c5        ..      UXTB     r5,r0
        0x0000226e:    f0050002    ....    AND      r0,r5,#2
        0x00002272:    b198        ..      CBZ      r0,0x229c ; uart_rec_error_isr + 60
        0x00002274:    e003        ..      B        0x227e ; uart_rec_error_isr + 30
        0x00002276:    bf00        ..      NOP      
        0x00002278:    480c        .H      LDR      r0,[pc,#48] ; [0x22ac] = 0x40003000
        0x0000227a:    6800        .h      LDR      r0,[r0,#0]
        0x0000227c:    bf00        ..      NOP      
        0x0000227e:    bf00        ..      NOP      
        0x00002280:    480a        .H      LDR      r0,[pc,#40] ; [0x22ac] = 0x40003000
        0x00002282:    6940        @i      LDR      r0,[r0,#0x14]
        0x00002284:    f0000001    ....    AND      r0,r0,#1
        0x00002288:    2800        .(      CMP      r0,#0
        0x0000228a:    d1f4        ..      BNE      0x2276 ; uart_rec_error_isr + 22
        0x0000228c:    b134        4.      CBZ      r4,0x229c ; uart_rec_error_isr + 60
        0x0000228e:    2100        .!      MOVS     r1,#0
        0x00002290:    4807        .H      LDR      r0,[pc,#28] ; [0x22b0] = 0x200006ec
        0x00002292:    6201        .b      STR      r1,[r0,#0x20]
        0x00002294:    6241        Ab      STR      r1,[r0,#0x24]
        0x00002296:    2101        .!      MOVS     r1,#1
        0x00002298:    4630        0F      MOV      r0,r6
        0x0000229a:    47a0        .G      BLX      r4
        0x0000229c:    f0050008    ....    AND      r0,r5,#8
        0x000022a0:    b118        ..      CBZ      r0,0x22aa ; uart_rec_error_isr + 74
        0x000022a2:    2001        .       MOVS     r0,#1
        0x000022a4:    4902        .I      LDR      r1,[pc,#8] ; [0x22b0] = 0x200006ec
        0x000022a6:    f8810028    ..(.    STRB     r0,[r1,#0x28]
        0x000022aa:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000022ac:    40003000    .0.@    DCD    1073754112
        0x000022b0:    200006ec    ...     DCD    536872684
    $t
    i.uart_tfnf_getf
    uart_tfnf_getf
        0x000022b4:    4802        .H      LDR      r0,[pc,#8] ; [0x22c0] = 0x40003000
        0x000022b6:    6fc0        .o      LDR      r0,[r0,#0x7c]
        0x000022b8:    f3c00040    ..@.    UBFX     r0,r0,#1,#1
        0x000022bc:    4770        pG      BX       lr
    $d
        0x000022be:    0000        ..      DCW    0
        0x000022c0:    40003000    .0.@    DCD    1073754112
    $t
    i.uart_thr_empty_isr
    uart_thr_empty_isr
        0x000022c4:    b570        p.      PUSH     {r4-r6,lr}
        0x000022c6:    2400        .$      MOVS     r4,#0
        0x000022c8:    2500        .%      MOVS     r5,#0
        0x000022ca:    e026        &.      B        0x231a ; uart_thr_empty_isr + 86
        0x000022cc:    4916        .I      LDR      r1,[pc,#88] ; [0x2328] = 0x200006ec
        0x000022ce:    6849        Ih      LDR      r1,[r1,#4]
        0x000022d0:    7808        .x      LDRB     r0,[r1,#0]
        0x000022d2:    f000f83d    ..=.    BL       uart_thr_set ; 0x2350
        0x000022d6:    4814        .H      LDR      r0,[pc,#80] ; [0x2328] = 0x200006ec
        0x000022d8:    6800        .h      LDR      r0,[r0,#0]
        0x000022da:    1e40        @.      SUBS     r0,r0,#1
        0x000022dc:    4912        .I      LDR      r1,[pc,#72] ; [0x2328] = 0x200006ec
        0x000022de:    6008        .`      STR      r0,[r1,#0]
        0x000022e0:    4608        .F      MOV      r0,r1
        0x000022e2:    6840        @h      LDR      r0,[r0,#4]
        0x000022e4:    1c40        @.      ADDS     r0,r0,#1
        0x000022e6:    6048        H`      STR      r0,[r1,#4]
        0x000022e8:    4608        .F      MOV      r0,r1
        0x000022ea:    6800        .h      LDR      r0,[r0,#0]
        0x000022ec:    b9a8        ..      CBNZ     r0,0x231a ; uart_thr_empty_isr + 86
        0x000022ee:    2000        .       MOVS     r0,#0
        0x000022f0:    6048        H`      STR      r0,[r1,#4]
        0x000022f2:    f7fffefd    ....    BL       uart_etbei_setf ; 0x20f0
        0x000022f6:    480c        .H      LDR      r0,[pc,#48] ; [0x2328] = 0x200006ec
        0x000022f8:    68c4        .h      LDR      r4,[r0,#0xc]
        0x000022fa:    6905        .i      LDR      r5,[r0,#0x10]
        0x000022fc:    b13c        <.      CBZ      r4,0x230e ; uart_thr_empty_isr + 74
        0x000022fe:    2000        .       MOVS     r0,#0
        0x00002300:    4909        .I      LDR      r1,[pc,#36] ; [0x2328] = 0x200006ec
        0x00002302:    60c8        .`      STR      r0,[r1,#0xc]
        0x00002304:    6108        .a      STR      r0,[r1,#0x10]
        0x00002306:    2100        .!      MOVS     r1,#0
        0x00002308:    4628        (F      MOV      r0,r5
        0x0000230a:    47a0        .G      BLX      r4
        0x0000230c:    e004        ..      B        0x2318 ; uart_thr_empty_isr + 84
        0x0000230e:    22c4        ."      MOVS     r2,#0xc4
        0x00002310:    a106        ..      ADR      r1,{pc}+0x1c ; 0x232c
        0x00002312:    a00e        ..      ADR      r0,{pc}+0x3a ; 0x234c
        0x00002314:    f7fffd10    ....    BL       __aeabi_assert ; 0x1d38
        0x00002318:    e003        ..      B        0x2322 ; uart_thr_empty_isr + 94
        0x0000231a:    f7ffffcb    ....    BL       uart_tfnf_getf ; 0x22b4
        0x0000231e:    2801        .(      CMP      r0,#1
        0x00002320:    d0d4        ..      BEQ      0x22cc ; uart_thr_empty_isr + 8
        0x00002322:    bf00        ..      NOP      
        0x00002324:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00002326:    0000        ..      DCW    0
        0x00002328:    200006ec    ...     DCD    536872684
        0x0000232c:    735c2e2e    ..\s    DCD    1935420974
        0x00002330:    735c6b64    dk\s    DCD    1935436644
        0x00002334:    735c6372    rc\s    DCD    1935434610
        0x00002338:    645c636f    oc\d    DCD    1683776367
        0x0000233c:    65766972    rive    DCD    1702259058
        0x00002340:    61755c72    r\ua    DCD    1635081330
        0x00002344:    632e7472    rt.c    DCD    1663988850
        0x00002348:    00000000    ....    DCD    0
        0x0000234c:    00000030    0...    DCD    48
    $t
    i.uart_thr_set
    uart_thr_set
        0x00002350:    4901        .I      LDR      r1,[pc,#4] ; [0x2358] = 0x40003000
        0x00002352:    6008        .`      STR      r0,[r1,#0]
        0x00002354:    4770        pG      BX       lr
    $d
        0x00002356:    0000        ..      DCW    0
        0x00002358:    40003000    .0.@    DCD    1073754112
    $t
    x$fpl$fadd
    __aeabi_fadd
    _fadd
        0x0000235c:    ea900f01    ....    TEQ      r0,r1
        0x00002360:    bf48        H.      IT       MI
        0x00002362:    f0814100    ...A    EORMI    r1,r1,#0x80000000
        0x00002366:    f1008220    .. .    BMI.W    _fsub1 ; 0x27aa
    _fadd1
        0x0000236a:    1a42        B.      SUBS     r2,r0,r1
        0x0000236c:    bf3c        <.      ITT      CC
        0x0000236e:    1a80        ..      SUBCC    r0,r0,r2
        0x00002370:    1889        ..      ADDCC    r1,r1,r2
        0x00002372:    ea4f52d0    O..R    LSR      r2,r0,#23
        0x00002376:    f04f4c7f    O..L    MOV      r12,#0xff000000
        0x0000237a:    ea1c0f41    ..A.    TST      r12,r1,LSL #1
        0x0000237e:    eba253d1    ...S    SUB      r3,r2,r1,LSR #23
        0x00002382:    bf18        ..      IT       NE
        0x00002384:    ea9c6f02    ...o    TEQNE    r12,r2,LSL #24
        0x00002388:    f000803b    ..;.    BEQ.W    0x2402 ; _fadd1 + 152
        0x0000238c:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x00002390:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x00002394:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x00002398:    fa21fc03    !...    LSR      r12,r1,r3
        0x0000239c:    eb100c0c    ....    ADDS     r12,r0,r12
        0x000023a0:    d21e        ..      BCS      0x23e0 ; _fadd1 + 118
        0x000023a2:    f10232ff    ...2    ADD      r2,r2,#0xffffffff
        0x000023a6:    ea5f201c    _..     LSRS     r0,r12,#8
        0x000023aa:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x000023ae:    bf38        8.      IT       CC
        0x000023b0:    4770        pG      BXCC     lr
        0x000023b2:    f01c0f7f    ....    TST      r12,#0x7f
        0x000023b6:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x000023ba:    bf18        ..      IT       NE
        0x000023bc:    f1bc4f7f    ...O    CMPNE    r12,#0xff000000
        0x000023c0:    bf38        8.      IT       CC
        0x000023c2:    4770        pG      BXCC     lr
        0x000023c4:    f1c30320    .. .    RSB      r3,r3,#0x20
        0x000023c8:    4099        .@      LSLS     r1,r1,r3
        0x000023ca:    bf08        ..      IT       EQ
        0x000023cc:    f0200001     ...    BICEQ    r0,r0,#1
        0x000023d0:    f1bc4f7f    ...O    CMP      r12,#0xff000000
        0x000023d4:    bf38        8.      IT       CC
        0x000023d6:    4770        pG      BXCC     lr
        0x000023d8:    f1a040c0    ...@    SUB      r0,r0,#0x60000000
        0x000023dc:    f000b9d9    ....    B.W      __fpl_fretinf ; 0x2792
        0x000023e0:    ea4f003c    O.<.    RRX      r0,r12
        0x000023e4:    0a00        ..      LSRS     r0,r0,#8
        0x000023e6:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x000023ea:    bf28        (.      IT       CS
        0x000023ec:    f01c0fff    ....    TSTCS    r12,#0xff
        0x000023f0:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x000023f4:    d0e6        ..      BEQ      0x23c4 ; _fadd1 + 90
        0x000023f6:    bf18        ..      IT       NE
        0x000023f8:    f1bc4f7f    ...O    CMPNE    r12,#0xff000000
        0x000023fc:    bf38        8.      IT       CC
        0x000023fe:    4770        pG      BXCC     lr
        0x00002400:    e7ea        ..      B        0x23d8 ; _fadd1 + 110
        0x00002402:    ea9c6f02    ...o    TEQ      r12,r2,LSL #24
        0x00002406:    d005        ..      BEQ      0x2414 ; _fadd1 + 170
        0x00002408:    ea100f5c    ..\.    TST      r0,r12,LSR #1
        0x0000240c:    bf08        ..      IT       EQ
        0x0000240e:    f0004000    ...@    ANDEQ    r0,r0,#0x80000000
        0x00002412:    4770        pG      BX       lr
        0x00002414:    b510        ..      PUSH     {r4,lr}
        0x00002416:    f000f976    ..v.    BL       __fpl_fnaninf ; 0x2706
        0x0000241a:    bf00        ..      NOP      
    $d
        0x0000241c:    3ebefb64    d..>    DCD    1052703588
    $t
    x$fpl$fdiv
    _fdiv1
    __aeabi_fdiv
    _fdiv
        0x00002420:    f44f0c7f    O...    MOV      r12,#0xff0000
        0x00002424:    ea1c12d0    ....    ANDS     r2,r12,r0,LSR #7
        0x00002428:    bf1e        ..      ITTT     NE
        0x0000242a:    ea1c13d1    ....    ANDSNE   r3,r12,r1,LSR #7
        0x0000242e:    ea920f0c    ....    TEQNE    r2,r12
        0x00002432:    ea930f0c    ....    TEQNE    r3,r12
        0x00002436:    f0008085    ....    BEQ.W    0x2544 ; _fdiv1 + 292
        0x0000243a:    ea900f01    ....    TEQ      r0,r1
        0x0000243e:    bf48        H.      IT       MI
        0x00002440:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x00002444:    f4400c00    @...    ORR      r12,r0,#0x800000
        0x00002448:    f4410000    A...    ORR      r0,r1,#0x800000
        0x0000244c:    f02c417f    ,..A    BIC      r1,r12,#0xff000000
        0x00002450:    f020407f     ..@    BIC      r0,r0,#0xff000000
        0x00002454:    b500        ..      PUSH     {lr}
        0x00002456:    4281        .B      CMP      r1,r0
        0x00002458:    eba20203    ....    SUB      r2,r2,r3
        0x0000245c:    f20f1c08    ....    ADR.W    r12,{pc}+0x10c ; 0x2568
        0x00002460:    ebac4e50    ..PN    SUB      lr,r12,r0,LSR #17
        0x00002464:    f1c00000    ....    RSB      r0,r0,#0
        0x00002468:    f89ee000    ....    LDRB     lr,[lr,#0]
        0x0000246c:    ea4f0e4e    O.N.    LSL      lr,lr,#1
        0x00002470:    fb00fc0e    ....    MUL      r12,r0,lr
        0x00002474:    bf38        8.      IT       CC
        0x00002476:    0049        I.      LSLCC    r1,r1,#1
        0x00002478:    ea4f1c2c    O.,.    ASR      r12,r12,#4
        0x0000247c:    f50202fa    ....    ADD      r2,r2,#0x7d0000
        0x00002480:    fb0cf30e    ....    MUL      r3,r12,lr
        0x00002484:    ea4f1ece    O...    LSL      lr,lr,#7
        0x00002488:    ea4f2c11    O..,    LSR      r12,r1,#8
        0x0000248c:    ea4f21c1    O..!    LSL      r1,r1,#11
        0x00002490:    eb0e5e63    ..c^    ADD      lr,lr,r3,ASR #21
        0x00002494:    eb424222    B."B    ADC      r2,r2,r2,ASR #16
        0x00002498:    fb0efc0c    ....    MUL      r12,lr,r12
        0x0000249c:    ea4f531c    O..S    LSR      r3,r12,#20
        0x000024a0:    fb001103    ....    MLA      r1,r0,r3,r1
        0x000024a4:    ea4f2c11    O..,    LSR      r12,r1,#8
        0x000024a8:    ea4f3101    O..1    LSL      r1,r1,#12
        0x000024ac:    fb0efc0c    ....    MUL      r12,lr,r12
        0x000024b0:    ea4f4cdc    O..L    LSR      r12,r12,#19
        0x000024b4:    fb00110c    ....    MLA      r1,r0,r12,r1
        0x000024b8:    42c1        .B      CMN      r1,r0
        0x000024ba:    bf28        (.      IT       CS
        0x000024bc:    1809        ..      ADDCS    r1,r1,r0
        0x000024be:    eb4c3303    L..3    ADC      r3,r12,r3,LSL #12
        0x000024c2:    f85deb04    ]...    POP      {lr}
        0x000024c6:    eb100141    ..A.    ADDS     r1,r0,r1,LSL #1
        0x000024ca:    eb4350c2    C..P    ADC      r0,r3,r2,LSL #23
        0x000024ce:    f5b20f7c    ..|.    CMP      r2,#0xfc0000
        0x000024d2:    bf38        8.      IT       CC
        0x000024d4:    4770        pG      BXCC     lr
        0x000024d6:    d529        ).      BPL      0x252c ; _fdiv1 + 268
        0x000024d8:    f0120ff0    ....    TST      r2,#0xf0
        0x000024dc:    bf1c        ..      ITT      NE
        0x000024de:    f10040c0    ...@    ADDNE    r0,r0,#0x60000000
        0x000024e2:    f0004000    ...@    ANDNE    r0,r0,#0x80000000
        0x000024e6:    4770        pG      BX       lr
    $d
        0x000024e8:    83828100    ....    DCD    2206368000
        0x000024ec:    87868584    ....    DCD    2273740164
        0x000024f0:    8c8b8988    ....    DCD    2357954952
        0x000024f4:    918f8e8d    ....    DCD    2442104461
        0x000024f8:    96959392    ....    DCD    2526385042
        0x000024fc:    9c9a9997    ....    DCD    2627377559
        0x00002500:    a2a09f9d    ....    DCD    2728435613
        0x00002504:    a8a7a5a3    ....    DCD    2829559203
        0x00002508:    b0aeacaa    ....    DCD    2964237482
        0x0000250c:    b7b5b3b2    ....    DCD    3082138546
        0x00002510:    c0bebcb9    ....    DCD    3233725625
        0x00002514:    c9c7c5c2    ....    DCD    3385312706
        0x00002518:    d4d1cecc    ....    DCD    3570519756
        0x0000251c:    dfdcd9d7    ....    DCD    3755792855
        0x00002520:    ece9e6e2    ....    DCD    3974751970
        0x00002524:    faf7f3f0    ....    DCD    4210553840
        0x00002528:    000000fe    ....    DCD    254
    $t
        0x0000252c:    ea4f0c40    O.@.    LSL      r12,r0,#1
        0x00002530:    f10c7c80    ...|    ADD      r12,r12,#0x1000000
        0x00002534:    f1bc4f7e    ..~O    CMP      r12,#0xfe000000
        0x00002538:    bf28        (.      IT       CS
        0x0000253a:    4770        pG      BXCS     lr
        0x0000253c:    f1b040c0    ...@    SUBS     r0,r0,#0x60000000
        0x00002540:    f000b927    ..'.    B.W      __fpl_fretinf ; 0x2792
        0x00002544:    ea900f01    ....    TEQ      r0,r1
        0x00002548:    ea0c13d1    ....    AND      r3,r12,r1,LSR #7
        0x0000254c:    bf48        H.      IT       MI
        0x0000254e:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x00002552:    4562        bE      CMP      r2,r12
        0x00002554:    bf38        8.      IT       CC
        0x00002556:    4563        cE      CMPCC    r3,r12
        0x00002558:    d207        ..      BCS      0x256a ; _fdiv1 + 330
        0x0000255a:    f4130f7f    ....    TST      r3,#0xff0000
        0x0000255e:    d016        ..      BEQ      0x258e ; _fdiv1 + 366
        0x00002560:    ea800001    ....    EOR      r0,r0,r1
        0x00002564:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x00002568:    4770        pG      BX       lr
        0x0000256a:    b510        ..      PUSH     {r4,lr}
        0x0000256c:    f000f8cb    ....    BL       __fpl_fnaninf ; 0x2706
    $d
        0x00002570:    3efc7e09    .~.>    DCD    1056734729
    $t
        0x00002574:    f000b805    ....    B.W      0x2582 ; _fdiv1 + 354
        0x00002578:    ea800001    ....    EOR      r0,r0,r1
        0x0000257c:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x00002580:    4770        pG      BX       lr
        0x00002582:    ea800001    ....    EOR      r0,r0,r1
        0x00002586:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x0000258a:    f000b902    ....    B.W      __fpl_fretinf ; 0x2792
        0x0000258e:    f4120f7f    ....    TST      r2,#0xff0000
        0x00002592:    bf04        ..      ITT      EQ
        0x00002594:    4802        .H      LDREQ    r0,[pc,#8] ; [0x25a0] = 0x7fc00000
        0x00002596:    4770        pG      BXEQ     lr
        0x00002598:    ea800001    ....    EOR      r0,r0,r1
        0x0000259c:    f000b8f9    ....    B.W      __fpl_fretinf ; 0x2792
    $d
        0x000025a0:    7fc00000    ....    DCD    2143289344
    $t
    x$fpl$ffix
    __aeabi_f2iz
    _ffix
        0x000025a4:    0041        A.      LSLS     r1,r0,#1
        0x000025a6:    0e0b        ..      LSRS     r3,r1,#24
        0x000025a8:    f1d3029e    ....    RSBS     r2,r3,#0x9e
        0x000025ac:    d908        ..      BLS      0x25c0 ; __aeabi_f2iz + 28
        0x000025ae:    f4500300    P...    ORRS     r3,r0,#0x800000
        0x000025b2:    ea4f2303    O..#    LSL      r3,r3,#8
        0x000025b6:    fa23f002    #...    LSR      r0,r3,r2
        0x000025ba:    bf48        H.      IT       MI
        0x000025bc:    4240        @B      RSBMI    r0,r0,#0
        0x000025be:    4770        pG      BX       lr
        0x000025c0:    b510        ..      PUSH     {r4,lr}
        0x000025c2:    f000f8a0    ....    BL       __fpl_fnaninf ; 0x2706
        0x000025c6:    bf00        ..      NOP      
    $d
        0x000025c8:    80249249    I.$.    DCD    2149880393
    $t
        0x000025cc:    2000        .       MOVS     r0,#0
        0x000025ce:    4770        pG      BX       lr
        0x000025d0:    f06f4200    o..B    MVN      r2,#0x80000000
        0x000025d4:    ea820020    .. .    EOR      r0,r2,r0,ASR #32
        0x000025d8:    4770        pG      BX       lr
        0x000025da:    0000        ..      MOVS     r0,r0
    x$fpl$ffltu
    __aeabi_ui2f
    _ffltu
        0x000025dc:    fab0f380    ....    CLZ      r3,r0
        0x000025e0:    fa10f203    ....    LSLS     r2,r0,r3
        0x000025e4:    f1c3039d    ....    RSB      r3,r3,#0x9d
        0x000025e8:    d00a        ..      BEQ      0x2600 ; __aeabi_ui2f + 36
        0x000025ea:    05d9        ..      LSLS     r1,r3,#23
        0x000025ec:    eb012012    ...     ADD      r0,r1,r2,LSR #8
        0x000025f0:    0653        S.      LSLS     r3,r2,#25
        0x000025f2:    bf38        8.      IT       CC
        0x000025f4:    4770        pG      BXCC     lr
        0x000025f6:    f1000001    ....    ADD      r0,r0,#1
        0x000025fa:    bf08        ..      IT       EQ
        0x000025fc:    f0200001     ...    BICEQ    r0,r0,#1
        0x00002600:    4770        pG      BX       lr
        0x00002602:    0000        ..      MOVS     r0,r0
    x$fpl$fmul
    __aeabi_fmul
    _fmul
        0x00002604:    f44f0c7f    O...    MOV      r12,#0xff0000
        0x00002608:    ea1c12d0    ....    ANDS     r2,r12,r0,LSR #7
        0x0000260c:    bf1e        ..      ITTT     NE
        0x0000260e:    ea1c13d1    ....    ANDSNE   r3,r12,r1,LSR #7
        0x00002612:    ea920f0c    ....    TEQNE    r2,r12
        0x00002616:    ea930f0c    ....    TEQNE    r3,r12
        0x0000261a:    f0008047    ..G.    BEQ.W    0x26ac ; __aeabi_fmul + 168
        0x0000261e:    ea900f01    ....    TEQ      r0,r1
        0x00002622:    bf48        H.      IT       MI
        0x00002624:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x00002628:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x0000262c:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x00002630:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x00002634:    eb020203    ....    ADD.W    r2,r2,r3
        0x00002638:    fba01301    ....    UMULL    r1,r3,r0,r1
        0x0000263c:    f5a20200    ....    SUB      r2,r2,#0x800000
        0x00002640:    2900        .)      CMP      r1,#0
        0x00002642:    bf18        ..      IT       NE
        0x00002644:    f0430301    C...    ORRNE    r3,r3,#1
        0x00002648:    005b        [.      LSLS     r3,r3,#1
        0x0000264a:    bf28        (.      IT       CS
        0x0000264c:    ea4f0333    O.3.    RRXCS    r3,r3
        0x00002650:    eb424222    B."B    ADC      r2,r2,r2,ASR #16
        0x00002654:    ea5f2c13    _..,    LSRS     r12,r3,#8
        0x00002658:    eb4c50c2    L..P    ADC      r0,r12,r2,LSL #23
        0x0000265c:    bf2e        ..      ITEE     CS
        0x0000265e:    ebbc6f43    ..Co    CMPCS    r12,r3,LSL #25
        0x00002662:    f5b20f7c    ..|.    CMPCC    r2,#0xfc0000
        0x00002666:    4770        pG      BXCC     lr
        0x00002668:    ea4f6c03    O..l    LSL      r12,r3,#24
        0x0000266c:    f1bc4f00    ...O    CMP      r12,#0x80000000
        0x00002670:    bf08        ..      IT       EQ
        0x00002672:    f0200001     ...    BICEQ    r0,r0,#1
        0x00002676:    f5b20f7c    ..|.    CMP      r2,#0xfc0000
        0x0000267a:    bf38        8.      IT       CC
        0x0000267c:    4770        pG      BXCC     lr
        0x0000267e:    d50b        ..      BPL      0x2698 ; __aeabi_fmul + 148
        0x00002680:    f08202ff    ....    EOR      r2,r2,#0xff
        0x00002684:    f5123f80    ...?    CMN      r2,#0x10000
        0x00002688:    bfc8        ..      IT       GT
        0x0000268a:    4770        pG      BXGT     lr
        0x0000268c:    f10040c0    ...@    ADD      r0,r0,#0x60000000
        0x00002690:    bfd8        ..      IT       LE
        0x00002692:    f0004000    ...@    ANDLE    r0,r0,#0x80000000
        0x00002696:    4770        pG      BX       lr
        0x00002698:    f5000c00    ....    ADD      r12,r0,#0x800000
        0x0000269c:    ea5f0c4c    _.L.    LSLS     r12,r12,#1
        0x000026a0:    bf48        H.      IT       MI
        0x000026a2:    4770        pG      BXMI     lr
        0x000026a4:    f1b040c0    ...@    SUBS     r0,r0,#0x60000000
        0x000026a8:    f000b873    ..s.    B.W      __fpl_fretinf ; 0x2792
        0x000026ac:    ea900f01    ....    TEQ      r0,r1
        0x000026b0:    ea0c13d1    ....    AND      r3,r12,r1,LSR #7
        0x000026b4:    bf48        H.      IT       MI
        0x000026b6:    f4427280    B..r    ORRMI    r2,r2,#0x100
        0x000026ba:    4562        bE      CMP      r2,r12
        0x000026bc:    bf38        8.      IT       CC
        0x000026be:    4563        cE      CMPCC    r3,r12
        0x000026c0:    d204        ..      BCS      0x26cc ; __aeabi_fmul + 200
        0x000026c2:    ea800001    ....    EOR      r0,r0,r1
        0x000026c6:    f0004000    ...@    AND      r0,r0,#0x80000000
        0x000026ca:    4770        pG      BX       lr
        0x000026cc:    b510        ..      PUSH     {r4,lr}
        0x000026ce:    f000f81a    ....    BL       __fpl_fnaninf ; 0x2706
        0x000026d2:    bf00        ..      NOP      
    $d
        0x000026d4:    3e010089    ...>    DCD    1040253065
    $t
        0x000026d8:    f000b807    ....    B.W      0x26ea ; __aeabi_fmul + 230
        0x000026dc:    f000b809    ....    B.W      0x26f2 ; __aeabi_fmul + 238
        0x000026e0:    ea5f0c41    _.A.    LSLS     r12,r1,#1
        0x000026e4:    ea5f6c1c    _..l    LSRS     r12,r12,#24
        0x000026e8:    d008        ..      BEQ      0x26fc ; __aeabi_fmul + 248
        0x000026ea:    ea800001    ....    EOR      r0,r0,r1
        0x000026ee:    f000b850    ..P.    B.W      __fpl_fretinf ; 0x2792
        0x000026f2:    ea5f0c40    _.@.    LSLS     r12,r0,#1
        0x000026f6:    ea5f6c1c    _..l    LSRS     r12,r12,#24
        0x000026fa:    d1f6        ..      BNE      0x26ea ; __aeabi_fmul + 230
        0x000026fc:    f04f4000    O..@    MOV      r0,#0x80000000
        0x00002700:    f5a00080    ....    SUB      r0,r0,#0x400000
        0x00002704:    4770        pG      BX       lr
    x$fpl$fnaninf
    __fpl_fnaninf
        0x00002706:    f10e0e02    ....    ADD      lr,lr,#2
        0x0000270a:    f02e0e03    ....    BIC      lr,lr,#3
        0x0000270e:    f85e4b04    ^..K    LDR      r4,[lr],#4
        0x00002712:    4224        $B      TST      r4,r4
        0x00002714:    d404        ..      BMI      0x2720 ; __fpl_fnaninf + 26
        0x00002716:    ea4f0241    O.A.    LSL      r2,r1,#1
        0x0000271a:    f1b24f7f    ...O    CMP      r2,#0xff000000
        0x0000271e:    d811        ..      BHI      0x2744 ; __fpl_fnaninf + 62
        0x00002720:    ea4f0340    O.@.    LSL      r3,r0,#1
        0x00002724:    f1b34f7f    ...O    CMP      r3,#0xff000000
        0x00002728:    d80c        ..      BHI      0x2744 ; __fpl_fnaninf + 62
        0x0000272a:    d10e        ..      BNE      0x274a ; __fpl_fnaninf + 68
        0x0000272c:    ea4f7cd0    O..|    LSR      r12,r0,#31
        0x00002730:    f1b24f7f    ...O    CMP      r2,#0xff000000
        0x00002734:    eb0c0c4c    ..L.    ADD      r12,r12,r12,LSL #1
        0x00002738:    f10c0c02    ....    ADD      r12,r12,#2
        0x0000273c:    bf08        ..      IT       EQ
        0x0000273e:    eb4c7cd1    L..|    ADCEQ    r12,r12,r1,LSR #31
        0x00002742:    e004        ..      B        0x274e ; __fpl_fnaninf + 72
        0x00002744:    f04f0c08    O...    MOV      r12,#8
        0x00002748:    e001        ..      B        0x274e ; __fpl_fnaninf + 72
        0x0000274a:    ea4f7cd1    O..|    LSR      r12,r1,#31
        0x0000274e:    eb0c034c    ..L.    ADD      r3,r12,r12,LSL #1
        0x00002752:    fa24f403    $...    LSR      r4,r4,r3
        0x00002756:    f0040407    ....    AND      r4,r4,#7
        0x0000275a:    f1b40c04    ....    SUBS     r12,r4,#4
        0x0000275e:    d206        ..      BCS      0x276e ; __fpl_fnaninf + 104
        0x00002760:    eb0e0c84    ....    ADD      r12,lr,r4,LSL #2
        0x00002764:    e8bd4010    ...@    POP      {r4,lr}
        0x00002768:    f04c0c01    L...    ORR      r12,r12,#1
        0x0000276c:    4760        `G      BX       r12
        0x0000276e:    e8dff00c    ....    TBB      [pc,r12]
    $d
        0x00002772:    0807        ..      DCW    2055
        0x00002774:    0202        ..      DCW    514
    $t
        0x00002776:    f04f4000    O..@    MOV      r0,#0x80000000
        0x0000277a:    f5a00080    ....    SUB      r0,r0,#0x400000
        0x0000277e:    bd10        ..      POP      {r4,pc}
        0x00002780:    4608        .F      MOV      r0,r1
        0x00002782:    0042        B.      LSLS     r2,r0,#1
        0x00002784:    bf18        ..      IT       NE
        0x00002786:    f1d27280    ...r    RSBSNE   r2,r2,#0x1000000
        0x0000278a:    bf88        ..      IT       HI
        0x0000278c:    f0004000    ...@    ANDHI    r0,r0,#0x80000000
        0x00002790:    bd10        ..      POP      {r4,pc}
    x$fpl$fretinf
    __fpl_fretinf
        0x00002792:    21ff        .!      MOVS     r1,#0xff
        0x00002794:    ea4150d0    A..P    ORR      r0,r1,r0,LSR #23
        0x00002798:    05c0        ..      LSLS     r0,r0,#23
        0x0000279a:    4770        pG      BX       lr
    x$fpl$fsub
    __aeabi_fsub
    _fsub
        0x0000279c:    ea900f01    ....    TEQ      r0,r1
        0x000027a0:    bf48        H.      IT       MI
        0x000027a2:    f0814100    ...A    EORMI    r1,r1,#0x80000000
        0x000027a6:    f53fade0    ?...    BMI      _fadd1 ; 0x236a
    _fsub1
        0x000027aa:    1a42        B.      SUBS     r2,r0,r1
        0x000027ac:    d804        ..      BHI      0x27b8 ; _fsub1 + 14
        0x000027ae:    f0824200    ...B    EOR      r2,r2,#0x80000000
        0x000027b2:    eba00002    ....    SUB      r0,r0,r2
        0x000027b6:    4411        .D      ADD      r1,r1,r2
        0x000027b8:    ea4f52d0    O..R    LSR      r2,r0,#23
        0x000027bc:    f04f4c7f    O..L    MOV      r12,#0xff000000
        0x000027c0:    ea1c0f41    ..A.    TST      r12,r1,LSL #1
        0x000027c4:    eba253d1    ...S    SUB      r3,r2,r1,LSR #23
        0x000027c8:    bf18        ..      IT       NE
        0x000027ca:    ea9c6f02    ...o    TEQNE    r12,r2,LSL #24
        0x000027ce:    d04a        J.      BEQ      0x2866 ; _fsub1 + 188
        0x000027d0:    f04f4c00    O..L    MOV      r12,#0x80000000
        0x000027d4:    ea4c2000    L..     ORR      r0,r12,r0,LSL #8
        0x000027d8:    ea4c2101    L..!    ORR      r1,r12,r1,LSL #8
        0x000027dc:    fa21fc03    !...    LSR      r12,r1,r3
        0x000027e0:    ebb00c0c    ....    SUBS     r12,r0,r12
        0x000027e4:    d40f        ..      BMI      0x2806 ; _fsub1 + 92
        0x000027e6:    f0120ffe    ....    TST      r2,#0xfe
        0x000027ea:    d036        6.      BEQ      0x285a ; _fsub1 + 176
        0x000027ec:    ea5f004c    _.L.    LSLS     r0,r12,#1
        0x000027f0:    d51d        ..      BPL      0x282e ; _fsub1 + 132
        0x000027f2:    1200        ..      ASRS     r0,r0,#8
        0x000027f4:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x000027f8:    bf38        8.      IT       CC
        0x000027fa:    4770        pG      BXCC     lr
        0x000027fc:    f01c0f3f    ..?.    TST      r12,#0x3f
        0x00002800:    bf18        ..      IT       NE
        0x00002802:    4770        pG      BXNE     lr
        0x00002804:    e00b        ..      B        0x281e ; _fsub1 + 116
        0x00002806:    f1a20201    ....    SUB      r2,r2,#1
        0x0000280a:    ea5f201c    _..     LSRS     r0,r12,#8
        0x0000280e:    eb4050c2    @..P    ADC      r0,r0,r2,LSL #23
        0x00002812:    bf38        8.      IT       CC
        0x00002814:    4770        pG      BXCC     lr
        0x00002816:    f01c0f7f    ....    TST      r12,#0x7f
        0x0000281a:    bf18        ..      IT       NE
        0x0000281c:    4770        pG      BXNE     lr
        0x0000281e:    f1c30320    .. .    RSB      r3,r3,#0x20
        0x00002822:    4099        .@      LSLS     r1,r1,r3
        0x00002824:    bf14        ..      ITE      NE
        0x00002826:    1e40        @.      SUBNE    r0,r0,#1
        0x00002828:    f0200001     ...    BICEQ    r0,r0,#1
        0x0000282c:    4770        pG      BX       lr
        0x0000282e:    0880        ..      LSRS     r0,r0,#2
        0x00002830:    ea4f2312    O..#    LSR      r3,r2,#8
        0x00002834:    bf08        ..      IT       EQ
        0x00002836:    4770        pG      BXEQ     lr
        0x00002838:    fab0fc80    ....    CLZ      r12,r0
        0x0000283c:    eba2020c    ....    SUB      r2,r2,r12
        0x00002840:    f1cc0c28    ..(.    RSB      r12,r12,#0x28
        0x00002844:    fa60f00c    `...    ROR      r0,r0,r12
        0x00002848:    ea932f12    .../    TEQ      r3,r2,LSR #8
        0x0000284c:    bf04        ..      ITT      EQ
        0x0000284e:    eb0050c2    ...P    ADDEQ    r0,r0,r2,LSL #23
        0x00002852:    4770        pG      BXEQ     lr
        0x00002854:    ea4f70c3    O..p    LSL      r0,r3,#31
        0x00002858:    4770        pG      BX       lr
        0x0000285a:    0a13        ..      LSRS     r3,r2,#8
        0x0000285c:    ea5f10dc    _...    LSRS     r0,r12,#7
        0x00002860:    bf08        ..      IT       EQ
        0x00002862:    4770        pG      BXEQ     lr
        0x00002864:    e7f6        ..      B        0x2854 ; _fsub1 + 170
        0x00002866:    ea9c6f02    ...o    TEQ      r12,r2,LSL #24
        0x0000286a:    d004        ..      BEQ      0x2876 ; _fsub1 + 204
        0x0000286c:    ea100f5c    ..\.    TST      r0,r12,LSR #1
        0x00002870:    bf08        ..      IT       EQ
        0x00002872:    2000        .       MOVEQ    r0,#0
        0x00002874:    4770        pG      BX       lr
        0x00002876:    b510        ..      PUSH     {r4,lr}
        0x00002878:    f7ffff45    ..E.    BL       __fpl_fnaninf ; 0x2706
    $d
        0x0000287c:    3ef6df40    @..>    DCD    1056366400
    $t
        0x00002880:    f0814000    ...@    EOR      r0,r1,#0x80000000
        0x00002884:    4770        pG      BX       lr
    $d.realdata
    .constdata
    _aV2C
    x$fpl$usenofp
    __I$use$fp
        0x00002886:    3130        01      DCW    12592
        0x00002888:    35343332    2345    DCD    892613426
        0x0000288c:    39383736    6789    DCD    959985462
        0x00002890:    44434241    ABCD    DCD    1145258561
        0x00002894:    00004645    EF..    DCD    17989
    Region$$Table$$Base
        0x00002898:    000028b8    .(..    DCD    10424
        0x0000289c:    20000000    ...     DCD    536870912
        0x000028a0:    000001f4    ....    DCD    500
        0x000028a4:    00000154    T...    DCD    340
        0x000028a8:    000029b8    .)..    DCD    10680
        0x000028ac:    200001f4    ...     DCD    536871412
        0x000028b0:    00000a84    ....    DCD    2692
        0x000028b4:    000001b0    ....    DCD    432
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 10476 (0x28ec)
    Size        : 256 bytes (0x100)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x200001f4
    File Offset : 10732 (0x29ec)
    Size        : 2692 bytes (0xa84)
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
    File Offset : 10732 (0x29ec)
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
    File Offset : 12208 (0x2fb0)
    Size        : 3460 bytes (0xd84)
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
    File Offset : 15668 (0x3d34)
    Size        : 77936 bytes (0x13070)
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
    File Offset : 93604 (0x16da4)
    Size        : 14676 bytes (0x3954)
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
    File Offset : 108280 (0x1a6f8)
    Size        : 5264 bytes (0x1490)
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
    File Offset : 113544 (0x1bb88)
    Size        : 31012 bytes (0x7924)
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
    File Offset : 144556 (0x234ac)
    Size        : 2550 bytes (0x9f6)
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
    File Offset : 147108 (0x23ea4)
    Size        : 10688 bytes (0x29c0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 471
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 157796 (0x26864)
    Size        : 8112 bytes (0x1fb0)
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
    File Offset : 165908 (0x28814)
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
    File Offset : 165944 (0x28838)
    Size        : 11492 bytes (0x2ce4)
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
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_demo.o --vfemode=force

    Input Comments:
    
    p6048-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p6048-2
    
    
    
    test_demo.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_demo.o --depend=.\objects\test_demo.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_demo.crf src\test_demo.c
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p20ac-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p20ac-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Ke
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p64e0-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p64e0-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IF:\SVN_ELF2_SOC\trunk\Basic_Demo\UART_Demo\Keil\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    uart.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\uart.o --vfemode=force

    Input Comments:
    
    p24bc-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    uart.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\uart.o --depend=.\objects\uart.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\uart.crf ..\sdk\src\soc\driver\uart.c
    
    
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
    File Offset : 177436 (0x2b51c)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x200006ec  0x2c       uart_env                                 UART_Env_Tag
0x200006ec  0x14       uart_env.tx                              uart_txrxchannel
0x200006ec  0x4        uart_env.tx.size                         uint32_t
0x200006f0  0x4        uart_env.tx.bufptr                       pointer to uint8_t
0x200006f4  0x4        uart_env.tx.bufbase                      pointer to uint8_t
0x200006f8  0x4        uart_env.tx.callback                     pointer to function 
0x200006fc  0x4        uart_env.tx.dummy                        pointer to unknown Type 
0x20000700  0x14       uart_env.rx                              uart_txrxchannel
0x20000700  0x4        uart_env.rx.size                         uint32_t
0x20000704  0x4        uart_env.rx.bufptr                       pointer to uint8_t
0x20000708  0x4        uart_env.rx.bufbase                      pointer to uint8_t
0x2000070c  0x4        uart_env.rx.callback                     pointer to function 
0x20000710  0x4        uart_env.rx.dummy                        pointer to unknown Type 
0x20000714  0x1        uart_env.errordetect                     _Bool
0x20000715  0x1        uart_env.echo_enable                     uint8_t
0x20000716  0x1        uart_env.read_mode                       UART_RecMode
0x20000717  0x1        uart_env.till_char                       uint8_t

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x20000234  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x20000234  0x10       _SEGGER_RTT.acID                         array[16] of char
0x20000244  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x20000248  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x2000024c  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x20000294  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x200006dc  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x200002dc  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x200001f0  0x4        __stdout                                 FILE
0x200001f0  0x4        __stdout.handle                          int

address     size       variable name                            type
0x200001ec  0x4        SystemCoreClock                          uint32_t

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000010  0x1f       anlogic0                                 array[31] of uint8_t

address     size       variable name                            type
0x2000002f  0x32       anlogic01                                array[50] of uint8_t

address     size       variable name                            type
0x20000061  0x30       anlogic02                                array[48] of uint8_t

address     size       variable name                            type
0x20000091  0x30       anlogic03                                array[48] of uint8_t

address     size       variable name                            type
0x200000c1  0x30       anlogic04                                array[48] of uint8_t

address     size       variable name                            type
0x200000f1  0x30       anlogic05                                array[48] of uint8_t

address     size       variable name                            type
0x20000121  0x30       anlogic06                                array[48] of uint8_t

address     size       variable name                            type
0x20000151  0xf        anlogic1                                 array[15] of uint8_t

address     size       variable name                            type
0x20000160  0x10       anlogic2                                 array[16] of uint8_t

address     size       variable name                            type
0x20000170  0xe        anlogic3                                 array[14] of uint8_t

address     size       variable name                            type
0x2000017e  0xe        anlogic4                                 array[14] of uint8_t

address     size       variable name                            type
0x2000018c  0xf        anlogic5                                 array[15] of uint8_t

address     size       variable name                            type
0x2000019b  0xe        anlogic6                                 array[14] of uint8_t

address     size       variable name                            type
0x200001a9  0xe        anlogic7                                 array[14] of uint8_t

address     size       variable name                            type
0x200001b7  0xe        anlogic8                                 array[14] of uint8_t

address     size       variable name                            type
0x200001c5  0xe        anlogic9                                 array[14] of uint8_t

address     size       variable name                            type
0x200001d3  0xe        anlogicA                                 array[14] of uint8_t

address     size       variable name                            type
0x20000208  0x2c       env0                                     UART_Env_Tag
0x20000208  0x14       env0.tx                                  uart_txrxchannel
0x20000208  0x4        env0.tx.size                             uint32_t
0x2000020c  0x4        env0.tx.bufptr                           pointer to uint8_t
0x20000210  0x4        env0.tx.bufbase                          pointer to uint8_t
0x20000214  0x4        env0.tx.callback                         pointer to function 
0x20000218  0x4        env0.tx.dummy                            pointer to unknown Type 
0x2000021c  0x14       env0.rx                                  uart_txrxchannel
0x2000021c  0x4        env0.rx.size                             uint32_t
0x20000220  0x4        env0.rx.bufptr                           pointer to uint8_t
0x20000224  0x4        env0.rx.bufbase                          pointer to uint8_t
0x20000228  0x4        env0.rx.callback                         pointer to function 
0x2000022c  0x4        env0.rx.dummy                            pointer to unknown Type 
0x20000230  0x1        env0.errordetect                         _Bool
0x20000231  0x1        env0.echo_enable                         uint8_t
0x20000232  0x1        env0.read_mode                           UART_RecMode
0x20000233  0x1        env0.till_char                           uint8_t

address     size       variable name                            type
0x200001e4  0x8        param                                    param_t
0x200001e4  0x1      * param.p1                                 uint8_t
0x200001e8  0x4        param.p2                                 pointer to unknown Type 

address     size       variable name                            type
0x200001f4  0x14       read_buf                                 array[20] of uint8_t

address     size       variable name                            type
0x2000000e  0x2        send_end                                 array[2] of uint8_t

address     size       variable name                            type
0x20000000  0xe        str                                      array[14] of uint8_t

