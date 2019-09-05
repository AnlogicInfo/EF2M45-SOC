
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

    Program header offset: 177248 (0x0002b460)
    Section header offset: 177280 (0x0002b480)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 7724 bytes (0x1e2c)
    Size in memory: 10936 bytes (0x2ab8)
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
    Size        : 7040 bytes (0x1b80)
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
        0x0000014c:    00001b2c    ,...    DCD    6956
        0x00000150:    00001b4c    L...    DCD    6988
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
        0x000001d4:    f00081c1    ....    BEQ.W    _printf_string ; 0x55a
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
        0x000001e4:    f000fa44    ..D.    BL       __user_setup_stackheap ; 0x670
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
        0x000001ee:    f001fc01    ....    BL       main ; 0x19f4
        0x000001f2:    f000fa62    ..b.    BL       exit ; 0x6ba
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
        0x000001fe:    f000f93b    ..;.    BL       _sys_exit ; 0x478
        0x00000202:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x00000204:    4809        .H      LDR      r0,[pc,#36] ; [0x22c] = 0x14e5
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
        0x00000220:    4804        .H      LDR      r0,[pc,#16] ; [0x234] = 0x20000920
        0x00000222:    4905        .I      LDR      r1,[pc,#20] ; [0x238] = 0x20000e20
        0x00000224:    4a05        .J      LDR      r2,[pc,#20] ; [0x23c] = 0x20000a20
        0x00000226:    4b06        .K      LDR      r3,[pc,#24] ; [0x240] = 0x20000a20
        0x00000228:    4770        pG      BX       lr
    $d
        0x0000022a:    0000        ..      DCW    0
        0x0000022c:    000014e5    ....    DCD    5349
        0x00000230:    00000119    ....    DCD    281
        0x00000234:    20000920     ..     DCD    536873248
        0x00000238:    20000e20     ..     DCD    536874528
        0x0000023c:    20000a20     ..     DCD    536873504
        0x00000240:    20000a20     ..     DCD    536873504
    $t
    .text
    __2printf
        0x00000244:    b40f        ..      PUSH     {r0-r3}
        0x00000246:    4904        .I      LDR      r1,[pc,#16] ; [0x258] = 0x20000004
        0x00000248:    b510        ..      PUSH     {r4,lr}
        0x0000024a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000024c:    9802        ..      LDR      r0,[sp,#8]
        0x0000024e:    f000f989    ....    BL       _printf_char_file ; 0x564
        0x00000252:    bc10        ..      POP      {r4}
        0x00000254:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000258:    20000004    ...     DCD    536870916
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
        0x0000037c:    f000b882    ....    B.W      _printf_int_common ; 0x484
    $d
        0x00000380:    00000000    ....    DCD    0
        0x00000384:    0000002d    -...    DCD    45
        0x00000388:    0000002b    +...    DCD    43
        0x0000038c:    00000020     ...    DCD    32
    $t
    .text
    abort
        0x00000390:    2000        .       MOVS     r0,#0
        0x00000392:    f000f8f9    ....    BL       __rt_SIGABRT ; 0x588
        0x00000396:    f7ffff23    ..#.    BL       __rt_lib_shutdown ; 0x1e0
        0x0000039a:    2001        .       MOVS     r0,#1
        0x0000039c:    f000f86c    ..l.    BL       _sys_exit ; 0x478
    .text
    strcpy
        0x000003a0:    ea400301    @...    ORR      r3,r0,r1
        0x000003a4:    4602        .F      MOV      r2,r0
        0x000003a6:    b530        0.      PUSH     {r4,r5,lr}
        0x000003a8:    079b        ..      LSLS     r3,r3,#30
        0x000003aa:    d110        ..      BNE      0x3ce ; strcpy + 46
        0x000003ac:    f04f3401    O..4    MOV      r4,#0x1010101
        0x000003b0:    e000        ..      B        0x3b4 ; strcpy + 20
        0x000003b2:    c208        ..      STM      r2!,{r3}
        0x000003b4:    c908        ..      LDM      r1!,{r3}
        0x000003b6:    1b1d        ..      SUBS     r5,r3,r4
        0x000003b8:    439d        .C      BICS     r5,r5,r3
        0x000003ba:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x000003be:    d0f8        ..      BEQ      0x3b2 ; strcpy + 18
        0x000003c0:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x000003c4:    f8021b01    ....    STRB     r1,[r2],#1
        0x000003c8:    d00d        ..      BEQ      0x3e6 ; strcpy + 70
        0x000003ca:    0a1b        ..      LSRS     r3,r3,#8
        0x000003cc:    e7f8        ..      B        0x3c0 ; strcpy + 32
        0x000003ce:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003d2:    2b00        .+      CMP      r3,#0
        0x000003d4:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003d8:    d005        ..      BEQ      0x3e6 ; strcpy + 70
        0x000003da:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003de:    2b00        .+      CMP      r3,#0
        0x000003e0:    f8023b01    ...;    STRB     r3,[r2],#1
        0x000003e4:    d1f3        ..      BNE      0x3ce ; strcpy + 46
        0x000003e6:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x000003e8:    2a03        .*      CMP      r2,#3
        0x000003ea:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x44e
        0x000003ee:    f0100c03    ....    ANDS     r12,r0,#3
        0x000003f2:    f0008015    ....    BEQ.W    0x420 ; __aeabi_memcpy + 56
        0x000003f6:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x000003fa:    f1bc0f02    ....    CMP      r12,#2
        0x000003fe:    4462        bD      ADD      r2,r2,r12
        0x00000400:    bf98        ..      IT       LS
        0x00000402:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x00000406:    f8003b01    ...;    STRB     r3,[r0],#1
        0x0000040a:    bf38        8.      IT       CC
        0x0000040c:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x00000410:    f1a20204    ....    SUB      r2,r2,#4
        0x00000414:    bf98        ..      IT       LS
        0x00000416:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x0000041a:    bf38        8.      IT       CC
        0x0000041c:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x00000420:    f0110303    ....    ANDS     r3,r1,#3
        0x00000424:    f00080b7    ....    BEQ.W    __aeabi_memcpy4 ; 0x596
        0x00000428:    3a08        .:      SUBS     r2,r2,#8
        0x0000042a:    f0c08008    ....    BCC.W    0x43e ; __aeabi_memcpy + 86
        0x0000042e:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x00000432:    3a08        .:      SUBS     r2,r2,#8
        0x00000434:    f851cb04    Q...    LDR      r12,[r1],#4
        0x00000438:    e8a01008    ....    STM      r0!,{r3,r12}
        0x0000043c:    e7f5        ..      B        0x42a ; __aeabi_memcpy + 66
        0x0000043e:    1d12        ..      ADDS     r2,r2,#4
        0x00000440:    bf5c        \.      ITT      PL
        0x00000442:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x00000446:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x0000044a:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x0000044e:    07d2        ..      LSLS     r2,r2,#31
        0x00000450:    bf24        $.      ITT      CS
        0x00000452:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x00000456:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x0000045a:    bf48        H.      IT       MI
        0x0000045c:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000460:    bf24        $.      ITT      CS
        0x00000462:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x00000466:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x0000046a:    bf48        H.      IT       MI
        0x0000046c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000470:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000472:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x00000474:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x00000476:    4770        pG      BX       lr
    .text
    _sys_exit
        0x00000478:    4901        .I      LDR      r1,[pc,#4] ; [0x480] = 0x20026
        0x0000047a:    2018        .       MOVS     r0,#0x18
        0x0000047c:    beab        ..      BKPT     #0xab
        0x0000047e:    e7fe        ..      B        0x47e ; _sys_exit + 6
    $d
        0x00000480:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x00000484:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000488:    460d        .F      MOV      r5,r1
        0x0000048a:    4699        .F      MOV      r9,r3
        0x0000048c:    4692        .F      MOV      r10,r2
        0x0000048e:    4604        .F      MOV      r4,r0
        0x00000490:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x00000494:    6801        .h      LDR      r1,[r0,#0]
        0x00000496:    0688        ..      LSLS     r0,r1,#26
        0x00000498:    d504        ..      BPL      0x4a4 ; _printf_int_common + 32
        0x0000049a:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x0000049c:    f0210110    !...    BIC      r1,r1,#0x10
        0x000004a0:    6021        !`      STR      r1,[r4,#0]
        0x000004a2:    e000        ..      B        0x4a6 ; _printf_int_common + 34
        0x000004a4:    2001        .       MOVS     r0,#1
        0x000004a6:    42a8        .B      CMP      r0,r5
        0x000004a8:    dd01        ..      BLE      0x4ae ; _printf_int_common + 42
        0x000004aa:    1b47        G.      SUBS     r7,r0,r5
        0x000004ac:    e000        ..      B        0x4b0 ; _printf_int_common + 44
        0x000004ae:    2700        .'      MOVS     r7,#0
        0x000004b0:    69a1        .i      LDR      r1,[r4,#0x18]
        0x000004b2:    197a        z.      ADDS     r2,r7,r5
        0x000004b4:    eb020009    ....    ADD      r0,r2,r9
        0x000004b8:    1a08        ..      SUBS     r0,r1,r0
        0x000004ba:    61a0        .a      STR      r0,[r4,#0x18]
        0x000004bc:    7820         x      LDRB     r0,[r4,#0]
        0x000004be:    06c0        ..      LSLS     r0,r0,#27
        0x000004c0:    d402        ..      BMI      0x4c8 ; _printf_int_common + 68
        0x000004c2:    4620         F      MOV      r0,r4
        0x000004c4:    f3af8000    ....    NOP.W    
        0x000004c8:    2600        .&      MOVS     r6,#0
        0x000004ca:    e008        ..      B        0x4de ; _printf_int_common + 90
        0x000004cc:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004d0:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x000004d4:    4790        .G      BLX      r2
        0x000004d6:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004d8:    1c40        @.      ADDS     r0,r0,#1
        0x000004da:    1c76        v.      ADDS     r6,r6,#1
        0x000004dc:    6220         b      STR      r0,[r4,#0x20]
        0x000004de:    454e        NE      CMP      r6,r9
        0x000004e0:    dbf4        ..      BLT      0x4cc ; _printf_int_common + 72
        0x000004e2:    7820         x      LDRB     r0,[r4,#0]
        0x000004e4:    06c0        ..      LSLS     r0,r0,#27
        0x000004e6:    d50a        ..      BPL      0x4fe ; _printf_int_common + 122
        0x000004e8:    4620         F      MOV      r0,r4
        0x000004ea:    f3af8000    ....    NOP.W    
        0x000004ee:    e006        ..      B        0x4fe ; _printf_int_common + 122
        0x000004f0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000004f4:    2030        0       MOVS     r0,#0x30
        0x000004f6:    4790        .G      BLX      r2
        0x000004f8:    6a20         j      LDR      r0,[r4,#0x20]
        0x000004fa:    1c40        @.      ADDS     r0,r0,#1
        0x000004fc:    6220         b      STR      r0,[r4,#0x20]
        0x000004fe:    1e38        8.      SUBS     r0,r7,#0
        0x00000500:    f1a70701    ....    SUB      r7,r7,#1
        0x00000504:    dcf4        ..      BGT      0x4f0 ; _printf_int_common + 108
        0x00000506:    e007        ..      B        0x518 ; _printf_int_common + 148
        0x00000508:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x0000050c:    f8180005    ....    LDRB     r0,[r8,r5]
        0x00000510:    4790        .G      BLX      r2
        0x00000512:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000514:    1c40        @.      ADDS     r0,r0,#1
        0x00000516:    6220         b      STR      r0,[r4,#0x20]
        0x00000518:    1e28        (.      SUBS     r0,r5,#0
        0x0000051a:    f1a50501    ....    SUB      r5,r5,#1
        0x0000051e:    dcf3        ..      BGT      0x508 ; _printf_int_common + 132
        0x00000520:    4620         F      MOV      r0,r4
        0x00000522:    f3af8000    ....    NOP.W    
        0x00000526:    7820         x      LDRB     r0,[r4,#0]
        0x00000528:    0600        ..      LSLS     r0,r0,#24
        0x0000052a:    d502        ..      BPL      0x532 ; _printf_int_common + 174
        0x0000052c:    2002        .       MOVS     r0,#2
        0x0000052e:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x00000532:    2001        .       MOVS     r0,#1
        0x00000534:    e7fb        ..      B        0x52e ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x00000536:    b510        ..      PUSH     {r4,lr}
        0x00000538:    6943        Ci      LDR      r3,[r0,#0x14]
        0x0000053a:    b113        ..      CBZ      r3,0x542 ; _printf_cs_common + 12
        0x0000053c:    f3af8000    ....    NOP.W    
        0x00000540:    e001        ..      B        0x546 ; _printf_cs_common + 16
        0x00000542:    f7fffebf    ....    BL       _printf_str ; 0x2c4
        0x00000546:    2001        .       MOVS     r0,#1
        0x00000548:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x0000054a:    7812        .x      LDRB     r2,[r2,#0]
        0x0000054c:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x00000550:    700a        .p      STRB     r2,[r1,#0]
        0x00000552:    2200        ."      MOVS     r2,#0
        0x00000554:    704a        Jp      STRB     r2,[r1,#1]
        0x00000556:    2201        ."      MOVS     r2,#1
        0x00000558:    e7ed        ..      B        _printf_cs_common ; 0x536
    _printf_string
        0x0000055a:    6811        .h      LDR      r1,[r2,#0]
        0x0000055c:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x00000560:    e7e9        ..      B        _printf_cs_common ; 0x536
        0x00000562:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x00000564:    4b07        .K      LDR      r3,[pc,#28] ; [0x584] = 0x136b
        0x00000566:    b570        p.      PUSH     {r4-r6,lr}
        0x00000568:    460d        .F      MOV      r5,r1
        0x0000056a:    447b        {D      ADD      r3,r3,pc
        0x0000056c:    f000f84b    ..K.    BL       _printf_char_common ; 0x606
        0x00000570:    4604        .F      MOV      r4,r0
        0x00000572:    4628        (F      MOV      r0,r5
        0x00000574:    f000f85a    ..Z.    BL       ferror ; 0x62c
        0x00000578:    b110        ..      CBZ      r0,0x580 ; _printf_char_file + 28
        0x0000057a:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0000057e:    bd70        p.      POP      {r4-r6,pc}
        0x00000580:    4620         F      MOV      r0,r4
        0x00000582:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000584:    0000136b    k...    DCD    4971
    $t
    .text
    __rt_SIGABRT
        0x00000588:    b510        ..      PUSH     {r4,lr}
        0x0000058a:    f000f859    ..Y.    BL       __rt_SIGABRT_inner ; 0x640
        0x0000058e:    e8bd4010    ...@    POP      {r4,lr}
        0x00000592:    f000b84f    ..O.    B.W      __sig_exit ; 0x634
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x00000596:    b510        ..      PUSH     {r4,lr}
        0x00000598:    3a20         :      SUBS     r2,r2,#0x20
        0x0000059a:    f0c0800b    ....    BCC.W    0x5b4 ; __aeabi_memcpy4 + 30
        0x0000059e:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x000005a2:    3a20         :      SUBS     r2,r2,#0x20
        0x000005a4:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x000005a8:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x000005ac:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x000005b0:    f4bfaff5    ....    BCS.W    0x59e ; __aeabi_memcpy4 + 8
        0x000005b4:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x000005b8:    bf24        $.      ITT      CS
        0x000005ba:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x000005be:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x000005c2:    bf44        D.      ITT      MI
        0x000005c4:    c918        ..      LDMMI    r1!,{r3,r4}
        0x000005c6:    c018        ..      STMMI    r0!,{r3,r4}
        0x000005c8:    e8bd4010    ...@    POP      {r4,lr}
        0x000005cc:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x000005d0:    bf24        $.      ITT      CS
        0x000005d2:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x000005d6:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x000005da:    bf08        ..      IT       EQ
        0x000005dc:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x000005de:    07d2        ..      LSLS     r2,r2,#31
        0x000005e0:    bf28        (.      IT       CS
        0x000005e2:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x000005e6:    bf48        H.      IT       MI
        0x000005e8:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000005ec:    bf28        (.      IT       CS
        0x000005ee:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x000005f2:    bf48        H.      IT       MI
        0x000005f4:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x000005f8:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x000005fa:    4770        pG      BX       lr
    .text
    .text
    _printf_input_char
    __semihosting_library_function
        0x000005fc:    6901        .i      LDR      r1,[r0,#0x10]
        0x000005fe:    1c4a        J.      ADDS     r2,r1,#1
        0x00000600:    6102        .a      STR      r2,[r0,#0x10]
        0x00000602:    7808        .x      LDRB     r0,[r1,#0]
        0x00000604:    4770        pG      BX       lr
    _printf_char_common
        0x00000606:    b500        ..      PUSH     {lr}
        0x00000608:    b08f        ..      SUB      sp,sp,#0x3c
        0x0000060a:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x0000060e:    2100        .!      MOVS     r1,#0
        0x00000610:    9105        ..      STR      r1,[sp,#0x14]
        0x00000612:    4905        .I      LDR      r1,[pc,#20] ; [0x628] = 0xffffffe5
        0x00000614:    4479        yD      ADD      r1,r1,pc
        0x00000616:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x0000061a:    4611        .F      MOV      r1,r2
        0x0000061c:    4668        hF      MOV      r0,sp
        0x0000061e:    f7fffe1d    ....    BL       __printf ; 0x25c
        0x00000622:    b00f        ..      ADD      sp,sp,#0x3c
        0x00000624:    bd00        ..      POP      {pc}
    $d
        0x00000626:    0000        ..      DCW    0
        0x00000628:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x0000062c:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x0000062e:    f0000080    ....    AND      r0,r0,#0x80
        0x00000632:    4770        pG      BX       lr
    .text
    __sig_exit
        0x00000634:    2800        .(      CMP      r0,#0
        0x00000636:    d001        ..      BEQ      0x63c ; __sig_exit + 8
        0x00000638:    f7ffbf1e    ....    B.W      _sys_exit ; 0x478
        0x0000063c:    4770        pG      BX       lr
        0x0000063e:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x00000640:    b510        ..      PUSH     {r4,lr}
        0x00000642:    2100        .!      MOVS     r1,#0
        0x00000644:    a002        ..      ADR      r0,{pc}+0xc ; 0x650
        0x00000646:    f000f83e    ..>.    BL       __default_signal_display ; 0x6c6
        0x0000064a:    2001        .       MOVS     r0,#1
        0x0000064c:    bd10        ..      POP      {r4,pc}
    $d
        0x0000064e:    0000        ..      DCW    0
        0x00000650:    41474953    SIGA    DCD    1095190867
        0x00000654:    3a545242    BRT:    DCD    978604610
        0x00000658:    6e624120     Abn    DCD    1851932960
        0x0000065c:    616d726f    orma    DCD    1634562671
        0x00000660:    6574206c    l te    DCD    1702109292
        0x00000664:    6e696d72    rmin    DCD    1852403058
        0x00000668:    6f697461    atio    DCD    1869182049
        0x0000066c:    0000006e    n...    DCD    110
    $t
    .text
    __user_setup_stackheap
        0x00000670:    4675        uF      MOV      r5,lr
        0x00000672:    f000f849    ..I.    BL       __user_libspace ; 0x708
        0x00000676:    46ae        .F      MOV      lr,r5
        0x00000678:    0005        ..      MOVS     r5,r0
        0x0000067a:    4669        iF      MOV      r1,sp
        0x0000067c:    4653        SF      MOV      r3,r10
        0x0000067e:    f0200007     ...    BIC      r0,r0,#7
        0x00000682:    4685        .F      MOV      sp,r0
        0x00000684:    b018        ..      ADD      sp,sp,#0x60
        0x00000686:    b520         .      PUSH     {r5,lr}
        0x00000688:    f7fffdca    ....    BL       __user_initial_stackheap ; 0x220
        0x0000068c:    e8bd4020    .. @    POP      {r5,lr}
        0x00000690:    f04f0600    O...    MOV      r6,#0
        0x00000694:    f04f0700    O...    MOV      r7,#0
        0x00000698:    f04f0800    O...    MOV      r8,#0
        0x0000069c:    f04f0b00    O...    MOV      r11,#0
        0x000006a0:    f0210107    !...    BIC      r1,r1,#7
        0x000006a4:    46ac        .F      MOV      r12,r5
        0x000006a6:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x000006aa:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x000006ae:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x000006b2:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x000006b6:    468d        .F      MOV      sp,r1
        0x000006b8:    4770        pG      BX       lr
    .text
    exit
        0x000006ba:    4604        .F      MOV      r4,r0
        0x000006bc:    f3af8000    ....    NOP.W    
        0x000006c0:    4620         F      MOV      r0,r4
        0x000006c2:    f7fffd98    ....    BL       __rt_exit ; 0x1f6
    .text
    __default_signal_display
        0x000006c6:    b570        p.      PUSH     {r4-r6,lr}
        0x000006c8:    4605        .F      MOV      r5,r0
        0x000006ca:    460c        .F      MOV      r4,r1
        0x000006cc:    200a        .       MOVS     r0,#0xa
        0x000006ce:    e000        ..      B        0x6d2 ; __default_signal_display + 12
        0x000006d0:    1c6d        m.      ADDS     r5,r5,#1
        0x000006d2:    f000f811    ....    BL       _ttywrch ; 0x6f8
        0x000006d6:    b135        5.      CBZ      r5,0x6e6 ; __default_signal_display + 32
        0x000006d8:    7828        (x      LDRB     r0,[r5,#0]
        0x000006da:    2800        .(      CMP      r0,#0
        0x000006dc:    d1f8        ..      BNE      0x6d0 ; __default_signal_display + 10
        0x000006de:    e002        ..      B        0x6e6 ; __default_signal_display + 32
        0x000006e0:    1c64        d.      ADDS     r4,r4,#1
        0x000006e2:    f000f809    ....    BL       _ttywrch ; 0x6f8
        0x000006e6:    b114        ..      CBZ      r4,0x6ee ; __default_signal_display + 40
        0x000006e8:    7820         x      LDRB     r0,[r4,#0]
        0x000006ea:    2800        .(      CMP      r0,#0
        0x000006ec:    d1f8        ..      BNE      0x6e0 ; __default_signal_display + 26
        0x000006ee:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x000006f2:    200a        .       MOVS     r0,#0xa
        0x000006f4:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x000006f8:    b508        ..      PUSH     {r3,lr}
        0x000006fa:    4669        iF      MOV      r1,sp
        0x000006fc:    f88d0000    ....    STRB     r0,[sp,#0]
        0x00000700:    2003        .       MOVS     r0,#3
        0x00000702:    beab        ..      BKPT     #0xab
        0x00000704:    bd08        ..      POP      {r3,pc}
        0x00000706:    0000        ..      MOVS     r0,r0
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000708:    4800        .H      LDR      r0,[pc,#0] ; [0x70c] = 0x200008c0
        0x0000070a:    4770        pG      BX       lr
    $d
        0x0000070c:    200008c0    ...     DCD    536873152
    $t
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x00000710:    4905        .I      LDR      r1,[pc,#20] ; [0x728] = 0x88
        0x00000712:    b510        ..      PUSH     {r4,lr}
        0x00000714:    3128        (1      ADDS     r1,r1,#0x28
        0x00000716:    d004        ..      BEQ      0x722 ; ADCC0_IRQHandler + 18
        0x00000718:    6848        Hh      LDR      r0,[r1,#4]
        0x0000071a:    6809        .h      LDR      r1,[r1,#0]
        0x0000071c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000720:    4708        .G      BX       r1
        0x00000722:    f7fffe35    ..5.    BL       abort ; 0x390
    $d
        0x00000726:    0000        ..      DCW    0
        0x00000728:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x0000072c:    4905        .I      LDR      r1,[pc,#20] ; [0x744] = 0x88
        0x0000072e:    b510        ..      PUSH     {r4,lr}
        0x00000730:    3130        01      ADDS     r1,r1,#0x30
        0x00000732:    d004        ..      BEQ      0x73e ; ADCC1_IRQHandler + 18
        0x00000734:    6848        Hh      LDR      r0,[r1,#4]
        0x00000736:    6809        .h      LDR      r1,[r1,#0]
        0x00000738:    e8bd4010    ...@    POP      {r4,lr}
        0x0000073c:    4708        .G      BX       r1
        0x0000073e:    f7fffe27    ..'.    BL       abort ; 0x390
    $d
        0x00000742:    0000        ..      DCW    0
        0x00000744:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x00000748:    4905        .I      LDR      r1,[pc,#20] ; [0x760] = 0x88
        0x0000074a:    b510        ..      PUSH     {r4,lr}
        0x0000074c:    3138        81      ADDS     r1,r1,#0x38
        0x0000074e:    d004        ..      BEQ      0x75a ; ADCC2_IRQHandler + 18
        0x00000750:    6848        Hh      LDR      r0,[r1,#4]
        0x00000752:    6809        .h      LDR      r1,[r1,#0]
        0x00000754:    e8bd4010    ...@    POP      {r4,lr}
        0x00000758:    4708        .G      BX       r1
        0x0000075a:    f7fffe19    ....    BL       abort ; 0x390
    $d
        0x0000075e:    0000        ..      DCW    0
        0x00000760:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000764:    4905        .I      LDR      r1,[pc,#20] ; [0x77c] = 0x88
        0x00000766:    b510        ..      PUSH     {r4,lr}
        0x00000768:    3140        @1      ADDS     r1,r1,#0x40
        0x0000076a:    d004        ..      BEQ      0x776 ; ADCC3_IRQHandler + 18
        0x0000076c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000076e:    6809        .h      LDR      r1,[r1,#0]
        0x00000770:    e8bd4010    ...@    POP      {r4,lr}
        0x00000774:    4708        .G      BX       r1
        0x00000776:    f7fffe0b    ....    BL       abort ; 0x390
    $d
        0x0000077a:    0000        ..      DCW    0
        0x0000077c:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x00000780:    4905        .I      LDR      r1,[pc,#20] ; [0x798] = 0x88
        0x00000782:    b510        ..      PUSH     {r4,lr}
        0x00000784:    3148        H1      ADDS     r1,r1,#0x48
        0x00000786:    d004        ..      BEQ      0x792 ; ADCC4_IRQHandler + 18
        0x00000788:    6848        Hh      LDR      r0,[r1,#4]
        0x0000078a:    6809        .h      LDR      r1,[r1,#0]
        0x0000078c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000790:    4708        .G      BX       r1
        0x00000792:    f7fffdfd    ....    BL       abort ; 0x390
    $d
        0x00000796:    0000        ..      DCW    0
        0x00000798:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x0000079c:    4905        .I      LDR      r1,[pc,#20] ; [0x7b4] = 0x88
        0x0000079e:    b510        ..      PUSH     {r4,lr}
        0x000007a0:    3150        P1      ADDS     r1,r1,#0x50
        0x000007a2:    d004        ..      BEQ      0x7ae ; ADCC5_IRQHandler + 18
        0x000007a4:    6848        Hh      LDR      r0,[r1,#4]
        0x000007a6:    6809        .h      LDR      r1,[r1,#0]
        0x000007a8:    e8bd4010    ...@    POP      {r4,lr}
        0x000007ac:    4708        .G      BX       r1
        0x000007ae:    f7fffdef    ....    BL       abort ; 0x390
    $d
        0x000007b2:    0000        ..      DCW    0
        0x000007b4:    00000088    ....    DCD    136
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x000007b8:    4905        .I      LDR      r1,[pc,#20] ; [0x7d0] = 0x88
        0x000007ba:    b510        ..      PUSH     {r4,lr}
        0x000007bc:    3118        .1      ADDS     r1,r1,#0x18
        0x000007be:    d004        ..      BEQ      0x7ca ; DMAC_IRQHandler + 18
        0x000007c0:    6848        Hh      LDR      r0,[r1,#4]
        0x000007c2:    6809        .h      LDR      r1,[r1,#0]
        0x000007c4:    e8bd4010    ...@    POP      {r4,lr}
        0x000007c8:    4708        .G      BX       r1
        0x000007ca:    f7fffde1    ....    BL       abort ; 0x390
    $d
        0x000007ce:    0000        ..      DCW    0
        0x000007d0:    00000088    ....    DCD    136
    $t
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x000007d4:    4905        .I      LDR      r1,[pc,#20] ; [0x7ec] = 0x88
        0x000007d6:    b510        ..      PUSH     {r4,lr}
        0x000007d8:    3108        .1      ADDS     r1,r1,#8
        0x000007da:    d004        ..      BEQ      0x7e6 ; EXT_IRQHandler + 18
        0x000007dc:    6848        Hh      LDR      r0,[r1,#4]
        0x000007de:    6809        .h      LDR      r1,[r1,#0]
        0x000007e0:    e8bd4010    ...@    POP      {r4,lr}
        0x000007e4:    4708        .G      BX       r1
        0x000007e6:    f7fffdd3    ....    BL       abort ; 0x390
    $d
        0x000007ea:    0000        ..      DCW    0
        0x000007ec:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000007f0:    4905        .I      LDR      r1,[pc,#20] ; [0x808] = 0x88
        0x000007f2:    b510        ..      PUSH     {r4,lr}
        0x000007f4:    3180        .1      ADDS     r1,r1,#0x80
        0x000007f6:    d004        ..      BEQ      0x802 ; GPIO_IRQHandler + 18
        0x000007f8:    6848        Hh      LDR      r0,[r1,#4]
        0x000007fa:    6809        .h      LDR      r1,[r1,#0]
        0x000007fc:    e8bd4010    ...@    POP      {r4,lr}
        0x00000800:    4708        .G      BX       r1
        0x00000802:    f7fffdc5    ....    BL       abort ; 0x390
    $d
        0x00000806:    0000        ..      DCW    0
        0x00000808:    00000088    ....    DCD    136
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x0000080c:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x0000080e:    4604        .F      MOV      r4,r0
        0x00000810:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x00000814:    4620         F      MOV      r0,r4
        0x00000816:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0x87c
        0x0000081a:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x0000081e:    2801        .(      CMP      r0,#1
        0x00000820:    d105        ..      BNE      0x82e ; HAL_GPIO_Init + 34
        0x00000822:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x00000826:    4620         F      MOV      r0,r4
        0x00000828:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0x98c
        0x0000082c:    e009        ..      B        0x842 ; HAL_GPIO_Init + 54
        0x0000082e:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x00000832:    4620         F      MOV      r0,r4
        0x00000834:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0x844
        0x00000838:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x0000083c:    4620         F      MOV      r0,r4
        0x0000083e:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0x928
        0x00000842:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x00000844:    b530        0.      PUSH     {r4,r5,lr}
        0x00000846:    460a        .F      MOV      r2,r1
        0x00000848:    bf00        ..      NOP      
        0x0000084a:    4b0b        .K      LDR      r3,[pc,#44] ; [0x878] = 0x40007000
        0x0000084c:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x0000084e:    b29b        ..      UXTH     r3,r3
        0x00000850:    4619        .F      MOV      r1,r3
        0x00000852:    2a01        .*      CMP      r2,#1
        0x00000854:    d103        ..      BNE      0x85e ; HAL_GPIO_SetDebounce + 26
        0x00000856:    2301        .#      MOVS     r3,#1
        0x00000858:    4083        .@      LSLS     r3,r3,r0
        0x0000085a:    4319        .C      ORRS     r1,r1,r3
        0x0000085c:    e002        ..      B        0x864 ; HAL_GPIO_SetDebounce + 32
        0x0000085e:    2301        .#      MOVS     r3,#1
        0x00000860:    4083        .@      LSLS     r3,r3,r0
        0x00000862:    4399        .C      BICS     r1,r1,r3
        0x00000864:    b28b        ..      UXTH     r3,r1
        0x00000866:    4c04        .L      LDR      r4,[pc,#16] ; [0x878] = 0x40007000
        0x00000868:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x0000086a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000086e:    4d02        .M      LDR      r5,[pc,#8] ; [0x878] = 0x40007000
        0x00000870:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000872:    bf00        ..      NOP      
        0x00000874:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000876:    0000        ..      DCW    0
        0x00000878:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x0000087c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000087e:    4602        .F      MOV      r2,r0
        0x00000880:    2a10        .*      CMP      r2,#0x10
        0x00000882:    da16        ..      BGE      0x8b2 ; HAL_GPIO_SetDir + 54
        0x00000884:    bf00        ..      NOP      
        0x00000886:    4b19        .K      LDR      r3,[pc,#100] ; [0x8ec] = 0x40007000
        0x00000888:    685b        [h      LDR      r3,[r3,#4]
        0x0000088a:    b298        ..      UXTH     r0,r3
        0x0000088c:    bf00        ..      NOP      
        0x0000088e:    2901        .)      CMP      r1,#1
        0x00000890:    d103        ..      BNE      0x89a ; HAL_GPIO_SetDir + 30
        0x00000892:    2301        .#      MOVS     r3,#1
        0x00000894:    4093        .@      LSLS     r3,r3,r2
        0x00000896:    4318        .C      ORRS     r0,r0,r3
        0x00000898:    e002        ..      B        0x8a0 ; HAL_GPIO_SetDir + 36
        0x0000089a:    2301        .#      MOVS     r3,#1
        0x0000089c:    4093        .@      LSLS     r3,r3,r2
        0x0000089e:    4398        .C      BICS     r0,r0,r3
        0x000008a0:    b283        ..      UXTH     r3,r0
        0x000008a2:    4c12        .L      LDR      r4,[pc,#72] ; [0x8ec] = 0x40007000
        0x000008a4:    6864        dh      LDR      r4,[r4,#4]
        0x000008a6:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000008aa:    4d10        .M      LDR      r5,[pc,#64] ; [0x8ec] = 0x40007000
        0x000008ac:    606c        l`      STR      r4,[r5,#4]
        0x000008ae:    bf00        ..      NOP      
        0x000008b0:    e01b        ..      B        0x8ea ; HAL_GPIO_SetDir + 110
        0x000008b2:    bf00        ..      NOP      
        0x000008b4:    4b0d        .K      LDR      r3,[pc,#52] ; [0x8ec] = 0x40007000
        0x000008b6:    691b        .i      LDR      r3,[r3,#0x10]
        0x000008b8:    b298        ..      UXTH     r0,r3
        0x000008ba:    bf00        ..      NOP      
        0x000008bc:    2901        .)      CMP      r1,#1
        0x000008be:    d106        ..      BNE      0x8ce ; HAL_GPIO_SetDir + 82
        0x000008c0:    f1a20310    ....    SUB      r3,r2,#0x10
        0x000008c4:    2401        .$      MOVS     r4,#1
        0x000008c6:    fa04f303    ....    LSL      r3,r4,r3
        0x000008ca:    4318        .C      ORRS     r0,r0,r3
        0x000008cc:    e004        ..      B        0x8d8 ; HAL_GPIO_SetDir + 92
        0x000008ce:    f1a20310    ....    SUB      r3,r2,#0x10
        0x000008d2:    2401        .$      MOVS     r4,#1
        0x000008d4:    409c        .@      LSLS     r4,r4,r3
        0x000008d6:    43a0        .C      BICS     r0,r0,r4
        0x000008d8:    b283        ..      UXTH     r3,r0
        0x000008da:    4c04        .L      LDR      r4,[pc,#16] ; [0x8ec] = 0x40007000
        0x000008dc:    6924        $i      LDR      r4,[r4,#0x10]
        0x000008de:    f363040f    c...    BFI      r4,r3,#0,#16
        0x000008e2:    4d02        .M      LDR      r5,[pc,#8] ; [0x8ec] = 0x40007000
        0x000008e4:    612c        ,a      STR      r4,[r5,#0x10]
        0x000008e6:    bf00        ..      NOP      
        0x000008e8:    bf00        ..      NOP      
        0x000008ea:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x000008ec:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x000008f0:    b530        0.      PUSH     {r4,r5,lr}
        0x000008f2:    460a        .F      MOV      r2,r1
        0x000008f4:    bf00        ..      NOP      
        0x000008f6:    4b0b        .K      LDR      r3,[pc,#44] ; [0x924] = 0x40007000
        0x000008f8:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x000008fa:    b29b        ..      UXTH     r3,r3
        0x000008fc:    4619        .F      MOV      r1,r3
        0x000008fe:    2a01        .*      CMP      r2,#1
        0x00000900:    d103        ..      BNE      0x90a ; HAL_GPIO_SetPly + 26
        0x00000902:    2301        .#      MOVS     r3,#1
        0x00000904:    4083        .@      LSLS     r3,r3,r0
        0x00000906:    4319        .C      ORRS     r1,r1,r3
        0x00000908:    e002        ..      B        0x910 ; HAL_GPIO_SetPly + 32
        0x0000090a:    2301        .#      MOVS     r3,#1
        0x0000090c:    4083        .@      LSLS     r3,r3,r0
        0x0000090e:    4399        .C      BICS     r1,r1,r3
        0x00000910:    b28b        ..      UXTH     r3,r1
        0x00000912:    4c04        .L      LDR      r4,[pc,#16] ; [0x924] = 0x40007000
        0x00000914:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000916:    f363040f    c...    BFI      r4,r3,#0,#16
        0x0000091a:    4d02        .M      LDR      r5,[pc,#8] ; [0x924] = 0x40007000
        0x0000091c:    63ec        .c      STR      r4,[r5,#0x3c]
        0x0000091e:    bf00        ..      NOP      
        0x00000920:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000922:    0000        ..      DCW    0
        0x00000924:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000928:    b570        p.      PUSH     {r4-r6,lr}
        0x0000092a:    4605        .F      MOV      r5,r0
        0x0000092c:    460c        .F      MOV      r4,r1
        0x0000092e:    b134        4.      CBZ      r4,0x93e ; HAL_GPIO_TrigType + 22
        0x00000930:    2c01        .,      CMP      r4,#1
        0x00000932:    d00d        ..      BEQ      0x950 ; HAL_GPIO_TrigType + 40
        0x00000934:    2c02        .,      CMP      r4,#2
        0x00000936:    d014        ..      BEQ      0x962 ; HAL_GPIO_TrigType + 58
        0x00000938:    2c03        .,      CMP      r4,#3
        0x0000093a:    d124        $.      BNE      0x986 ; HAL_GPIO_TrigType + 94
        0x0000093c:    e01a        ..      B        0x974 ; HAL_GPIO_TrigType + 76
        0x0000093e:    2100        .!      MOVS     r1,#0
        0x00000940:    4628        (F      MOV      r0,r5
        0x00000942:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0x9e8
        0x00000946:    2100        .!      MOVS     r1,#0
        0x00000948:    4628        (F      MOV      r0,r5
        0x0000094a:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0x8f0
        0x0000094e:    e01a        ..      B        0x986 ; HAL_GPIO_TrigType + 94
        0x00000950:    2100        .!      MOVS     r1,#0
        0x00000952:    4628        (F      MOV      r0,r5
        0x00000954:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0x9e8
        0x00000958:    2101        .!      MOVS     r1,#1
        0x0000095a:    4628        (F      MOV      r0,r5
        0x0000095c:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0x8f0
        0x00000960:    e011        ..      B        0x986 ; HAL_GPIO_TrigType + 94
        0x00000962:    2101        .!      MOVS     r1,#1
        0x00000964:    4628        (F      MOV      r0,r5
        0x00000966:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0x9e8
        0x0000096a:    2100        .!      MOVS     r1,#0
        0x0000096c:    4628        (F      MOV      r0,r5
        0x0000096e:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0x8f0
        0x00000972:    e008        ..      B        0x986 ; HAL_GPIO_TrigType + 94
        0x00000974:    2101        .!      MOVS     r1,#1
        0x00000976:    4628        (F      MOV      r0,r5
        0x00000978:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0x9e8
        0x0000097c:    2101        .!      MOVS     r1,#1
        0x0000097e:    4628        (F      MOV      r0,r5
        0x00000980:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0x8f0
        0x00000984:    bf00        ..      NOP      
        0x00000986:    bf00        ..      NOP      
        0x00000988:    bd70        p.      POP      {r4-r6,pc}
        0x0000098a:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x0000098c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000098e:    4605        .F      MOV      r5,r0
        0x00000990:    460e        .F      MOV      r6,r1
        0x00000992:    2d10        .-      CMP      r5,#0x10
        0x00000994:    da10        ..      BGE      0x9b8 ; HAL_GPIO_WritePin + 44
        0x00000996:    bf00        ..      NOP      
        0x00000998:    4812        .H      LDR      r0,[pc,#72] ; [0x9e4] = 0x40007000
        0x0000099a:    6800        .h      LDR      r0,[r0,#0]
        0x0000099c:    b284        ..      UXTH     r4,r0
        0x0000099e:    bf00        ..      NOP      
        0x000009a0:    b91e        ..      CBNZ     r6,0x9aa ; HAL_GPIO_WritePin + 30
        0x000009a2:    2001        .       MOVS     r0,#1
        0x000009a4:    40a8        .@      LSLS     r0,r0,r5
        0x000009a6:    4384        .C      BICS     r4,r4,r0
        0x000009a8:    e002        ..      B        0x9b0 ; HAL_GPIO_WritePin + 36
        0x000009aa:    2001        .       MOVS     r0,#1
        0x000009ac:    40a8        .@      LSLS     r0,r0,r5
        0x000009ae:    4304        .C      ORRS     r4,r4,r0
        0x000009b0:    b2a0        ..      UXTH     r0,r4
        0x000009b2:    f000ff99    ....    BL       gpio_portadataregister_setf ; 0x18e8
        0x000009b6:    e014        ..      B        0x9e2 ; HAL_GPIO_WritePin + 86
        0x000009b8:    bf00        ..      NOP      
        0x000009ba:    480a        .H      LDR      r0,[pc,#40] ; [0x9e4] = 0x40007000
        0x000009bc:    68c0        .h      LDR      r0,[r0,#0xc]
        0x000009be:    b284        ..      UXTH     r4,r0
        0x000009c0:    bf00        ..      NOP      
        0x000009c2:    b92e        ..      CBNZ     r6,0x9d0 ; HAL_GPIO_WritePin + 68
        0x000009c4:    f1a50010    ....    SUB      r0,r5,#0x10
        0x000009c8:    2101        .!      MOVS     r1,#1
        0x000009ca:    4081        .@      LSLS     r1,r1,r0
        0x000009cc:    438c        .C      BICS     r4,r4,r1
        0x000009ce:    e005        ..      B        0x9dc ; HAL_GPIO_WritePin + 80
        0x000009d0:    f1a50010    ....    SUB      r0,r5,#0x10
        0x000009d4:    2101        .!      MOVS     r1,#1
        0x000009d6:    fa01f000    ....    LSL      r0,r1,r0
        0x000009da:    4304        .C      ORRS     r4,r4,r0
        0x000009dc:    b2a0        ..      UXTH     r0,r4
        0x000009de:    f000ff8d    ....    BL       gpio_portbdataregister_setf ; 0x18fc
        0x000009e2:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000009e4:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x000009e8:    b530        0.      PUSH     {r4,r5,lr}
        0x000009ea:    460a        .F      MOV      r2,r1
        0x000009ec:    bf00        ..      NOP      
        0x000009ee:    4b0b        .K      LDR      r3,[pc,#44] ; [0xa1c] = 0x40007000
        0x000009f0:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x000009f2:    b29b        ..      UXTH     r3,r3
        0x000009f4:    4619        .F      MOV      r1,r3
        0x000009f6:    2a01        .*      CMP      r2,#1
        0x000009f8:    d103        ..      BNE      0xa02 ; HAL_GPIO_setIrqLevel + 26
        0x000009fa:    2301        .#      MOVS     r3,#1
        0x000009fc:    4083        .@      LSLS     r3,r3,r0
        0x000009fe:    4319        .C      ORRS     r1,r1,r3
        0x00000a00:    e002        ..      B        0xa08 ; HAL_GPIO_setIrqLevel + 32
        0x00000a02:    2301        .#      MOVS     r3,#1
        0x00000a04:    4083        .@      LSLS     r3,r3,r0
        0x00000a06:    4399        .C      BICS     r1,r1,r3
        0x00000a08:    b28b        ..      UXTH     r3,r1
        0x00000a0a:    4c04        .L      LDR      r4,[pc,#16] ; [0xa1c] = 0x40007000
        0x00000a0c:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000a0e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000a12:    4d02        .M      LDR      r5,[pc,#8] ; [0xa1c] = 0x40007000
        0x00000a14:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000a16:    bf00        ..      NOP      
        0x00000a18:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000a1a:    0000        ..      DCW    0
        0x00000a1c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_I2C0_Enable
    HAL_I2C0_Enable
        0x00000a20:    bf00        ..      NOP      
        0x00000a22:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000a26:    6ec9        .n      LDR      r1,[r1,#0x6c]
        0x00000a28:    f3600100    `...    BFI      r1,r0,#0,#1
        0x00000a2c:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000a30:    66d1        .f      STR      r1,[r2,#0x6c]
        0x00000a32:    bf00        ..      NOP      
        0x00000a34:    4770        pG      BX       lr
    i.HAL_I2C0_Init
    HAL_I2C0_Init
        0x00000a36:    b57f        ..      PUSH     {r0-r6,lr}
        0x00000a38:    4604        .F      MOV      r4,r0
        0x00000a3a:    461d        .F      MOV      r5,r3
        0x00000a3c:    2000        .       MOVS     r0,#0
        0x00000a3e:    f7ffffef    ....    BL       HAL_I2C0_Enable ; 0xa20
        0x00000a42:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000a46:    f000f864    ..d.    BL       HAL_I2C0_SetMode ; 0xb12
        0x00000a4a:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00000a4e:    f000f84a    ..J.    BL       HAL_I2C0_Set7_10Addressing_Master ; 0xae6
        0x00000a52:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00000a56:    f000f851    ..Q.    BL       HAL_I2C0_Set7_10Addressing_Slave ; 0xafc
        0x00000a5a:    f8bd1006    ....    LDRH     r1,[sp,#6]
        0x00000a5e:    1048        H.      ASRS     r0,r1,#1
        0x00000a60:    f000f992    ....    BL       HAL_I2C0_SetTarAddr ; 0xd88
        0x00000a64:    f89d200a    ...     LDRB     r2,[sp,#0xa]
        0x00000a68:    f89d1009    ....    LDRB     r1,[sp,#9]
        0x00000a6c:    462b        +F      MOV      r3,r5
        0x00000a6e:    4620         F      MOV      r0,r4
        0x00000a70:    f000f860    ..`.    BL       HAL_I2C0_SetSpeed ; 0xb34
        0x00000a74:    f89d000b    ....    LDRB     r0,[sp,#0xb]
        0x00000a78:    f000f816    ....    BL       HAL_I2C0_RestartModeEnable ; 0xaa8
        0x00000a7c:    2001        .       MOVS     r0,#1
        0x00000a7e:    f7ffffcf    ....    BL       HAL_I2C0_Enable ; 0xa20
        0x00000a82:    bd7f        ..      POP      {r0-r6,pc}
    i.HAL_I2C0_Int_Threshold_Set
    HAL_I2C0_Int_Threshold_Set
        0x00000a84:    bf00        ..      NOP      
        0x00000a86:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000a8a:    6bd2        .k      LDR      r2,[r2,#0x3c]
        0x00000a8c:    f3600207    `...    BFI      r2,r0,#0,#8
        0x00000a90:    f04f2340    O.@#    MOV      r3,#0x40004000
        0x00000a94:    63da        .c      STR      r2,[r3,#0x3c]
        0x00000a96:    bf00        ..      NOP      
        0x00000a98:    bf00        ..      NOP      
        0x00000a9a:    461a        .F      MOV      r2,r3
        0x00000a9c:    6b92        .k      LDR      r2,[r2,#0x38]
        0x00000a9e:    f3610207    a...    BFI      r2,r1,#0,#8
        0x00000aa2:    639a        .c      STR      r2,[r3,#0x38]
        0x00000aa4:    bf00        ..      NOP      
        0x00000aa6:    4770        pG      BX       lr
    i.HAL_I2C0_RestartModeEnable
    HAL_I2C0_RestartModeEnable
        0x00000aa8:    bf00        ..      NOP      
        0x00000aaa:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000aae:    6809        .h      LDR      r1,[r1,#0]
        0x00000ab0:    f3601145    `.E.    BFI      r1,r0,#5,#1
        0x00000ab4:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000ab8:    6011        .`      STR      r1,[r2,#0]
        0x00000aba:    bf00        ..      NOP      
        0x00000abc:    4770        pG      BX       lr
    i.HAL_I2C0_SendAddrCmd
    HAL_I2C0_SendAddrCmd
        0x00000abe:    b570        p.      PUSH     {r4-r6,lr}
        0x00000ac0:    4605        .F      MOV      r5,r0
        0x00000ac2:    460e        .F      MOV      r6,r1
        0x00000ac4:    2400        .$      MOVS     r4,#0
        0x00000ac6:    e00b        ..      B        0xae0 ; HAL_I2C0_SendAddrCmd + 34
        0x00000ac8:    bf00        ..      NOP      
        0x00000aca:    f000ff8c    ....    BL       i2c0_txflr_getf ; 0x19e6
        0x00000ace:    2810        .(      CMP      r0,#0x10
        0x00000ad0:    dafb        ..      BGE      0xaca ; HAL_I2C0_SendAddrCmd + 12
        0x00000ad2:    5d2b        +]      LDRB     r3,[r5,r4]
        0x00000ad4:    2200        ."      MOVS     r2,#0
        0x00000ad6:    4611        .F      MOV      r1,r2
        0x00000ad8:    4610        .F      MOV      r0,r2
        0x00000ada:    f000ff43    ..C.    BL       i2c0_ic_data_cmd_pack ; 0x1964
        0x00000ade:    1c64        d.      ADDS     r4,r4,#1
        0x00000ae0:    42b4        .B      CMP      r4,r6
        0x00000ae2:    d3f1        ..      BCC      0xac8 ; HAL_I2C0_SendAddrCmd + 10
        0x00000ae4:    bd70        p.      POP      {r4-r6,pc}
    i.HAL_I2C0_Set7_10Addressing_Master
    HAL_I2C0_Set7_10Addressing_Master
        0x00000ae6:    bf00        ..      NOP      
        0x00000ae8:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000aec:    6809        .h      LDR      r1,[r1,#0]
        0x00000aee:    f3601104    `...    BFI      r1,r0,#4,#1
        0x00000af2:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000af6:    6011        .`      STR      r1,[r2,#0]
        0x00000af8:    bf00        ..      NOP      
        0x00000afa:    4770        pG      BX       lr
    i.HAL_I2C0_Set7_10Addressing_Slave
    HAL_I2C0_Set7_10Addressing_Slave
        0x00000afc:    bf00        ..      NOP      
        0x00000afe:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000b02:    6809        .h      LDR      r1,[r1,#0]
        0x00000b04:    f36001c3    `...    BFI      r1,r0,#3,#1
        0x00000b08:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000b0c:    6011        .`      STR      r1,[r2,#0]
        0x00000b0e:    bf00        ..      NOP      
        0x00000b10:    4770        pG      BX       lr
    i.HAL_I2C0_SetMode
    HAL_I2C0_SetMode
        0x00000b12:    b510        ..      PUSH     {r4,lr}
        0x00000b14:    4604        .F      MOV      r4,r0
        0x00000b16:    b934        4.      CBNZ     r4,0xb26 ; HAL_I2C0_SetMode + 20
        0x00000b18:    2000        .       MOVS     r0,#0
        0x00000b1a:    f000ff40    ..@.    BL       i2c0_ic_slave_disable_setf ; 0x199e
        0x00000b1e:    2000        .       MOVS     r0,#0
        0x00000b20:    f000ff46    ..F.    BL       i2c0_master_mode_setf ; 0x19b0
        0x00000b24:    e005        ..      B        0xb32 ; HAL_I2C0_SetMode + 32
        0x00000b26:    2001        .       MOVS     r0,#1
        0x00000b28:    f000ff39    ..9.    BL       i2c0_ic_slave_disable_setf ; 0x199e
        0x00000b2c:    2001        .       MOVS     r0,#1
        0x00000b2e:    f000ff3f    ..?.    BL       i2c0_master_mode_setf ; 0x19b0
        0x00000b32:    bd10        ..      POP      {r4,pc}
    i.HAL_I2C0_SetSpeed
    HAL_I2C0_SetSpeed
        0x00000b34:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000b38:    4605        .F      MOV      r5,r0
        0x00000b3a:    460e        .F      MOV      r6,r1
        0x00000b3c:    4617        .F      MOV      r7,r2
        0x00000b3e:    461c        .F      MOV      r4,r3
        0x00000b40:    bf00        ..      NOP      
        0x00000b42:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000b46:    6800        .h      LDR      r0,[r0,#0]
        0x00000b48:    f3660042    f.B.    BFI      r0,r6,#1,#2
        0x00000b4c:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000b50:    6008        .`      STR      r0,[r1,#0]
        0x00000b52:    bf00        ..      NOP      
        0x00000b54:    2e01        ..      CMP      r6,#1
        0x00000b56:    d14d        M.      BNE      0xbf4 ; HAL_I2C0_SetSpeed + 192
        0x00000b58:    bbf7        ..      CBNZ     r7,0xbd8 ; HAL_I2C0_SetSpeed + 164
        0x00000b5a:    0868        h.      LSRS     r0,r5,#1
        0x00000b5c:    4986        .I      LDR      r1,[pc,#536] ; [0xd78] = 0x186a0
        0x00000b5e:    fbb0f9f1    ....    UDIV     r9,r0,r1
        0x00000b62:    f000fee7    ....    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000b66:    eba90000    ....    SUB      r0,r9,r0
        0x00000b6a:    1fc0        ..      SUBS     r0,r0,#7
        0x00000b6c:    fa1ff880    ....    UXTH     r8,r0
        0x00000b70:    4640        @F      MOV      r0,r8
        0x00000b72:    f000ff26    ..&.    BL       i2c0_ss_scl_hcnt_setf ; 0x19c2
        0x00000b76:    0868        h.      LSRS     r0,r5,#1
        0x00000b78:    497f        .I      LDR      r1,[pc,#508] ; [0xd78] = 0x186a0
        0x00000b7a:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x00000b7e:    1e40        @.      SUBS     r0,r0,#1
        0x00000b80:    fa1ff880    ....    UXTH     r8,r0
        0x00000b84:    4640        @F      MOV      r0,r8
        0x00000b86:    f000ff25    ..%.    BL       i2c0_ss_scl_lcnt_setf ; 0x19d4
        0x00000b8a:    bf00        ..      NOP      
        0x00000b8c:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000b90:    6940        @i      LDR      r0,[r0,#0x14]
        0x00000b92:    fa1ffa80    ....    UXTH     r10,r0
        0x00000b96:    f000fecd    ....    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000b9a:    ebaa0000    ....    SUB      r0,r10,r0
        0x00000b9e:    f1a00803    ....    SUB      r8,r0,#3
        0x00000ba2:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000ba6:    f3c00947    ..G.    UBFX     r9,r0,#1,#8
        0x00000baa:    4648        HF      MOV      r0,r9
        0x00000bac:    f000fee5    ....    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000bb0:    bf00        ..      NOP      
        0x00000bb2:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000bb6:    6940        @i      LDR      r0,[r0,#0x14]
        0x00000bb8:    fa1ffa80    ....    UXTH     r10,r0
        0x00000bbc:    f000feba    ....    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000bc0:    ebaa0000    ....    SUB      r0,r10,r0
        0x00000bc4:    f1a00803    ....    SUB      r8,r0,#3
        0x00000bc8:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000bcc:    f3c0094f    ..O.    UBFX     r9,r0,#1,#16
        0x00000bd0:    4648        HF      MOV      r0,r9
        0x00000bd2:    f000fedb    ....    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000bd6:    e0cc        ..      B        0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000bd8:    e7ff        ..      B        0xbda ; HAL_I2C0_SetSpeed + 166
        0x00000bda:    8820         .      LDRH     r0,[r4,#0]
        0x00000bdc:    f000fef1    ....    BL       i2c0_ss_scl_hcnt_setf ; 0x19c2
        0x00000be0:    8860        `.      LDRH     r0,[r4,#2]
        0x00000be2:    f000fef7    ....    BL       i2c0_ss_scl_lcnt_setf ; 0x19d4
        0x00000be6:    7b20         {      LDRB     r0,[r4,#0xc]
        0x00000be8:    f000fec7    ....    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000bec:    89e0        ..      LDRH     r0,[r4,#0xe]
        0x00000bee:    f000fecd    ....    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000bf2:    e0be        ..      B        0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000bf4:    2e02        ..      CMP      r6,#2
        0x00000bf6:    d14d        M.      BNE      0xc94 ; HAL_I2C0_SetSpeed + 352
        0x00000bf8:    bbf7        ..      CBNZ     r7,0xc78 ; HAL_I2C0_SetSpeed + 324
        0x00000bfa:    0868        h.      LSRS     r0,r5,#1
        0x00000bfc:    495f        _I      LDR      r1,[pc,#380] ; [0xd7c] = 0x61a80
        0x00000bfe:    fbb0f9f1    ....    UDIV     r9,r0,r1
        0x00000c02:    f000fe97    ....    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000c06:    eba90000    ....    SUB      r0,r9,r0
        0x00000c0a:    1fc0        ..      SUBS     r0,r0,#7
        0x00000c0c:    fa1ff880    ....    UXTH     r8,r0
        0x00000c10:    4640        @F      MOV      r0,r8
        0x00000c12:    f000fe7d    ..}.    BL       i2c0_fs_scl_hcnt_setf ; 0x1910
        0x00000c16:    0868        h.      LSRS     r0,r5,#1
        0x00000c18:    4958        XI      LDR      r1,[pc,#352] ; [0xd7c] = 0x61a80
        0x00000c1a:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x00000c1e:    1e40        @.      SUBS     r0,r0,#1
        0x00000c20:    fa1ff880    ....    UXTH     r8,r0
        0x00000c24:    4640        @F      MOV      r0,r8
        0x00000c26:    f000fe7c    ..|.    BL       i2c0_fs_scl_lcnt_setf ; 0x1922
        0x00000c2a:    bf00        ..      NOP      
        0x00000c2c:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000c30:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000c32:    fa1ffa80    ....    UXTH     r10,r0
        0x00000c36:    f000fe7d    ..}.    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000c3a:    ebaa0000    ....    SUB      r0,r10,r0
        0x00000c3e:    f1a00803    ....    SUB      r8,r0,#3
        0x00000c42:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000c46:    f3c00947    ..G.    UBFX     r9,r0,#1,#8
        0x00000c4a:    4648        HF      MOV      r0,r9
        0x00000c4c:    f000fe95    ....    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000c50:    bf00        ..      NOP      
        0x00000c52:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000c56:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000c58:    fa1ffa80    ....    UXTH     r10,r0
        0x00000c5c:    f000fe6a    ..j.    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000c60:    ebaa0000    ....    SUB      r0,r10,r0
        0x00000c64:    f1a00803    ....    SUB      r8,r0,#3
        0x00000c68:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000c6c:    f3c0094f    ..O.    UBFX     r9,r0,#1,#16
        0x00000c70:    4648        HF      MOV      r0,r9
        0x00000c72:    f000fe8b    ....    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000c76:    e07c        |.      B        0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000c78:    e7ff        ..      B        0xc7a ; HAL_I2C0_SetSpeed + 326
        0x00000c7a:    88a0        ..      LDRH     r0,[r4,#4]
        0x00000c7c:    f000fe48    ..H.    BL       i2c0_fs_scl_hcnt_setf ; 0x1910
        0x00000c80:    88e0        ..      LDRH     r0,[r4,#6]
        0x00000c82:    f000fe4e    ..N.    BL       i2c0_fs_scl_lcnt_setf ; 0x1922
        0x00000c86:    7b20         {      LDRB     r0,[r4,#0xc]
        0x00000c88:    f000fe77    ..w.    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000c8c:    89e0        ..      LDRH     r0,[r4,#0xe]
        0x00000c8e:    f000fe7d    ..}.    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000c92:    e06e        n.      B        0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000c94:    2e03        ..      CMP      r6,#3
        0x00000c96:    d16c        l.      BNE      0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000c98:    2f00        ./      CMP      r7,#0
        0x00000c9a:    d158        X.      BNE      0xd4e ; HAL_I2C0_SetSpeed + 538
        0x00000c9c:    0868        h.      LSRS     r0,r5,#1
        0x00000c9e:    4937        7I      LDR      r1,[pc,#220] ; [0xd7c] = 0x61a80
        0x00000ca0:    fbb0f9f1    ....    UDIV     r9,r0,r1
        0x00000ca4:    f000fe46    ..F.    BL       i2c0_fs_spklen_getf ; 0x1934
        0x00000ca8:    eba90000    ....    SUB      r0,r9,r0
        0x00000cac:    1fc0        ..      SUBS     r0,r0,#7
        0x00000cae:    fa1ff880    ....    UXTH     r8,r0
        0x00000cb2:    4640        @F      MOV      r0,r8
        0x00000cb4:    f000fe2c    ..,.    BL       i2c0_fs_scl_hcnt_setf ; 0x1910
        0x00000cb8:    0868        h.      LSRS     r0,r5,#1
        0x00000cba:    4930        0I      LDR      r1,[pc,#192] ; [0xd7c] = 0x61a80
        0x00000cbc:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x00000cc0:    1e40        @.      SUBS     r0,r0,#1
        0x00000cc2:    fa1ff880    ....    UXTH     r8,r0
        0x00000cc6:    4640        @F      MOV      r0,r8
        0x00000cc8:    f000fe2b    ..+.    BL       i2c0_fs_scl_lcnt_setf ; 0x1922
        0x00000ccc:    0868        h.      LSRS     r0,r5,#1
        0x00000cce:    492c        ,I      LDR      r1,[pc,#176] ; [0xd80] = 0x33e140
        0x00000cd0:    fbb0f1f1    ....    UDIV     r1,r0,r1
        0x00000cd4:    482b        +H      LDR      r0,[pc,#172] ; [0xd84] = 0x400040a4
        0x00000cd6:    6800        .h      LDR      r0,[r0,#0]
        0x00000cd8:    b2c0        ..      UXTB     r0,r0
        0x00000cda:    1a08        ..      SUBS     r0,r1,r0
        0x00000cdc:    1fc0        ..      SUBS     r0,r0,#7
        0x00000cde:    fa1ff880    ....    UXTH     r8,r0
        0x00000ce2:    4640        @F      MOV      r0,r8
        0x00000ce4:    f000fe2c    ..,.    BL       i2c0_hs_scl_hcnt_setf ; 0x1940
        0x00000ce8:    0868        h.      LSRS     r0,r5,#1
        0x00000cea:    4925        %I      LDR      r1,[pc,#148] ; [0xd80] = 0x33e140
        0x00000cec:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x00000cf0:    1e40        @.      SUBS     r0,r0,#1
        0x00000cf2:    fa1ff880    ....    UXTH     r8,r0
        0x00000cf6:    4640        @F      MOV      r0,r8
        0x00000cf8:    f000fe2b    ..+.    BL       i2c0_hs_scl_lcnt_setf ; 0x1952
        0x00000cfc:    bf00        ..      NOP      
        0x00000cfe:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000d02:    6a40        @j      LDR      r0,[r0,#0x24]
        0x00000d04:    b280        ..      UXTH     r0,r0
        0x00000d06:    bf00        ..      NOP      
        0x00000d08:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000d0c:    f8d110a4    ....    LDR      r1,[r1,#0xa4]
        0x00000d10:    b2c9        ..      UXTB     r1,r1
        0x00000d12:    1a40        @.      SUBS     r0,r0,r1
        0x00000d14:    f1a00803    ....    SUB      r8,r0,#3
        0x00000d18:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000d1c:    f3c00947    ..G.    UBFX     r9,r0,#1,#8
        0x00000d20:    4648        HF      MOV      r0,r9
        0x00000d22:    f000fe2a    ..*.    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000d26:    bf00        ..      NOP      
        0x00000d28:    f04f2040    O.@     MOV      r0,#0x40004000
        0x00000d2c:    6a40        @j      LDR      r0,[r0,#0x24]
        0x00000d2e:    b280        ..      UXTH     r0,r0
        0x00000d30:    bf00        ..      NOP      
        0x00000d32:    4914        .I      LDR      r1,[pc,#80] ; [0xd84] = 0x400040a4
        0x00000d34:    6809        .h      LDR      r1,[r1,#0]
        0x00000d36:    b2c9        ..      UXTB     r1,r1
        0x00000d38:    1a40        @.      SUBS     r0,r0,r1
        0x00000d3a:    f1a00803    ....    SUB      r8,r0,#3
        0x00000d3e:    eb0870d8    ...p    ADD      r0,r8,r8,LSR #31
        0x00000d42:    f3c0094f    ..O.    UBFX     r9,r0,#1,#16
        0x00000d46:    4648        HF      MOV      r0,r9
        0x00000d48:    f000fe20    .. .    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000d4c:    e011        ..      B        0xd72 ; HAL_I2C0_SetSpeed + 574
        0x00000d4e:    88a0        ..      LDRH     r0,[r4,#4]
        0x00000d50:    f000fdde    ....    BL       i2c0_fs_scl_hcnt_setf ; 0x1910
        0x00000d54:    88e0        ..      LDRH     r0,[r4,#6]
        0x00000d56:    f000fde4    ....    BL       i2c0_fs_scl_lcnt_setf ; 0x1922
        0x00000d5a:    8920         .      LDRH     r0,[r4,#8]
        0x00000d5c:    f000fdf0    ....    BL       i2c0_hs_scl_hcnt_setf ; 0x1940
        0x00000d60:    8960        `.      LDRH     r0,[r4,#0xa]
        0x00000d62:    f000fdf6    ....    BL       i2c0_hs_scl_lcnt_setf ; 0x1952
        0x00000d66:    7b20         {      LDRB     r0,[r4,#0xc]
        0x00000d68:    f000fe07    ....    BL       i2c0_ic_sda_rx_hold_setf ; 0x197a
        0x00000d6c:    89e0        ..      LDRH     r0,[r4,#0xe]
        0x00000d6e:    f000fe0d    ....    BL       i2c0_ic_sda_tx_hold_setf ; 0x198c
        0x00000d72:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x00000d76:    0000        ..      DCW    0
        0x00000d78:    000186a0    ....    DCD    100000
        0x00000d7c:    00061a80    ....    DCD    400000
        0x00000d80:    0033e140    @.3.    DCD    3400000
        0x00000d84:    400040a4    .@.@    DCD    1073758372
    $t
    i.HAL_I2C0_SetTarAddr
    HAL_I2C0_SetTarAddr
        0x00000d88:    bf00        ..      NOP      
        0x00000d8a:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00000d8e:    6849        Ih      LDR      r1,[r1,#4]
        0x00000d90:    f3600109    `...    BFI      r1,r0,#0,#10
        0x00000d94:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00000d98:    6051        Q`      STR      r1,[r2,#4]
        0x00000d9a:    bf00        ..      NOP      
        0x00000d9c:    4770        pG      BX       lr
    i.HAL_I2C0_WriteData
    HAL_I2C0_WriteData
        0x00000d9e:    b570        p.      PUSH     {r4-r6,lr}
        0x00000da0:    4605        .F      MOV      r5,r0
        0x00000da2:    460e        .F      MOV      r6,r1
        0x00000da4:    2400        .$      MOVS     r4,#0
        0x00000da6:    e015        ..      B        0xdd4 ; HAL_I2C0_WriteData + 54
        0x00000da8:    bf00        ..      NOP      
        0x00000daa:    f000fe1c    ....    BL       i2c0_txflr_getf ; 0x19e6
        0x00000dae:    2810        .(      CMP      r0,#0x10
        0x00000db0:    dafb        ..      BGE      0xdaa ; HAL_I2C0_WriteData + 12
        0x00000db2:    1e70        p.      SUBS     r0,r6,#1
        0x00000db4:    42a0        .B      CMP      r0,r4
        0x00000db6:    d106        ..      BNE      0xdc6 ; HAL_I2C0_WriteData + 40
        0x00000db8:    5d2b        +]      LDRB     r3,[r5,r4]
        0x00000dba:    2200        ."      MOVS     r2,#0
        0x00000dbc:    2101        .!      MOVS     r1,#1
        0x00000dbe:    4610        .F      MOV      r0,r2
        0x00000dc0:    f000fdd0    ....    BL       i2c0_ic_data_cmd_pack ; 0x1964
        0x00000dc4:    e005        ..      B        0xdd2 ; HAL_I2C0_WriteData + 52
        0x00000dc6:    5d2b        +]      LDRB     r3,[r5,r4]
        0x00000dc8:    2200        ."      MOVS     r2,#0
        0x00000dca:    4611        .F      MOV      r1,r2
        0x00000dcc:    4610        .F      MOV      r0,r2
        0x00000dce:    f000fdc9    ....    BL       i2c0_ic_data_cmd_pack ; 0x1964
        0x00000dd2:    1c64        d.      ADDS     r4,r4,#1
        0x00000dd4:    42b4        .B      CMP      r4,r6
        0x00000dd6:    d3e7        ..      BCC      0xda8 ; HAL_I2C0_WriteData + 10
        0x00000dd8:    bd70        p.      POP      {r4-r6,pc}
    i.HAL_SYSCON_Function_IO_Set
    HAL_SYSCON_Function_IO_Set
        0x00000dda:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000dde:    4604        .F      MOV      r4,r0
        0x00000de0:    460d        .F      MOV      r5,r1
        0x00000de2:    4617        .F      MOV      r7,r2
        0x00000de4:    bf00        ..      NOP      
        0x00000de6:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000dea:    6940        @i      LDR      r0,[r0,#0x14]
        0x00000dec:    4606        .F      MOV      r6,r0
        0x00000dee:    b93f        ?.      CBNZ     r7,0xe00 ; HAL_SYSCON_Function_IO_Set + 38
        0x00000df0:    2001        .       MOVS     r0,#1
        0x00000df2:    40a8        .@      LSLS     r0,r0,r5
        0x00000df4:    4386        .C      BICS     r6,r6,r0
        0x00000df6:    4630        0F      MOV      r0,r6
        0x00000df8:    f000fea8    ....    BL       sysc_cpu_func_en_set ; 0x1b4c
        0x00000dfc:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00000e00:    2d10        .-      CMP      r5,#0x10
        0x00000e02:    d277        w.      BCS      0xef4 ; HAL_SYSCON_Function_IO_Set + 282
        0x00000e04:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x00000e08:    291e1308    ...)    DCD    689836808
        0x00000e0c:    554a3f34    4?JU    DCD    1430929204
        0x00000e10:    82776b60    `kw.    DCD    2188864352
        0x00000e14:    aea3988d    ....    DCD    2929957005
    $t
        0x00000e18:    bf00        ..      NOP      
        0x00000e1a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e1e:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e20:    f3640003    d...    BFI      r0,r4,#0,#4
        0x00000e24:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e28:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e2a:    bf00        ..      NOP      
        0x00000e2c:    e0a6        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e2e:    bf00        ..      NOP      
        0x00000e30:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e34:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e36:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00000e3a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e3e:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e40:    bf00        ..      NOP      
        0x00000e42:    e09b        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e44:    bf00        ..      NOP      
        0x00000e46:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e4a:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e4c:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00000e50:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e54:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e56:    bf00        ..      NOP      
        0x00000e58:    e090        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e5a:    bf00        ..      NOP      
        0x00000e5c:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e60:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e62:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x00000e66:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e6a:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e6c:    bf00        ..      NOP      
        0x00000e6e:    e085        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e70:    bf00        ..      NOP      
        0x00000e72:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e76:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e78:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00000e7c:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e80:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e82:    bf00        ..      NOP      
        0x00000e84:    e07a        z.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e86:    bf00        ..      NOP      
        0x00000e88:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000e8c:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000e8e:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000e92:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000e96:    6188        .a      STR      r0,[r1,#0x18]
        0x00000e98:    bf00        ..      NOP      
        0x00000e9a:    e06f        o.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000e9c:    bf00        ..      NOP      
        0x00000e9e:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000ea2:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000ea4:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000ea8:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000eac:    6188        .a      STR      r0,[r1,#0x18]
        0x00000eae:    bf00        ..      NOP      
        0x00000eb0:    e064        d.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000eb2:    bf00        ..      NOP      
        0x00000eb4:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000eb8:    6980        .i      LDR      r0,[r0,#0x18]
        0x00000eba:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000ebe:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ec2:    6188        .a      STR      r0,[r1,#0x18]
        0x00000ec4:    bf00        ..      NOP      
        0x00000ec6:    e059        Y.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000ec8:    bf00        ..      NOP      
        0x00000eca:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000ece:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000ed0:    f3640003    d...    BFI      r0,r4,#0,#4
        0x00000ed4:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000ed8:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000eda:    bf00        ..      NOP      
        0x00000edc:    e04e        N.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000ede:    bf00        ..      NOP      
        0x00000ee0:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000ee4:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000ee6:    f3641007    d...    BFI      r0,r4,#4,#4
        0x00000eea:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000eee:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000ef0:    bf00        ..      NOP      
        0x00000ef2:    e043        C.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000ef4:    e041        A.      B        0xf7a ; HAL_SYSCON_Function_IO_Set + 416
        0x00000ef6:    bf00        ..      NOP      
        0x00000ef8:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000efc:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000efe:    f364200b    d..     BFI      r0,r4,#8,#4
        0x00000f02:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f06:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f08:    bf00        ..      NOP      
        0x00000f0a:    e037        7.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f0c:    bf00        ..      NOP      
        0x00000f0e:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000f12:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000f14:    f364300f    d..0    BFI      r0,r4,#12,#4
        0x00000f18:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f1c:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f1e:    bf00        ..      NOP      
        0x00000f20:    e02c        ,.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f22:    bf00        ..      NOP      
        0x00000f24:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000f28:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000f2a:    f3644013    d..@    BFI      r0,r4,#16,#4
        0x00000f2e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f32:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f34:    bf00        ..      NOP      
        0x00000f36:    e021        !.      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f38:    bf00        ..      NOP      
        0x00000f3a:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000f3e:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000f40:    f3645017    d..P    BFI      r0,r4,#20,#4
        0x00000f44:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f48:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f4a:    bf00        ..      NOP      
        0x00000f4c:    e016        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f4e:    bf00        ..      NOP      
        0x00000f50:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000f54:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000f56:    f364601b    d..`    BFI      r0,r4,#24,#4
        0x00000f5a:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f5e:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f60:    bf00        ..      NOP      
        0x00000f62:    e00b        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f64:    bf00        ..      NOP      
        0x00000f66:    f04f4080    O..@    MOV      r0,#0x40000000
        0x00000f6a:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x00000f6c:    f364701f    d..p    BFI      r0,r4,#28,#4
        0x00000f70:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000f74:    61c8        .a      STR      r0,[r1,#0x1c]
        0x00000f76:    bf00        ..      NOP      
        0x00000f78:    e000        ..      B        0xf7c ; HAL_SYSCON_Function_IO_Set + 418
        0x00000f7a:    bf00        ..      NOP      
        0x00000f7c:    bf00        ..      NOP      
        0x00000f7e:    2001        .       MOVS     r0,#1
        0x00000f80:    40a8        .@      LSLS     r0,r0,r5
        0x00000f82:    4306        .C      ORRS     r6,r6,r0
        0x00000f84:    4630        0F      MOV      r0,r6
        0x00000f86:    f000fde1    ....    BL       sysc_cpu_func_en_set ; 0x1b4c
        0x00000f8a:    bf00        ..      NOP      
        0x00000f8c:    e736        6.      B        0xdfc ; HAL_SYSCON_Function_IO_Set + 34
        0x00000f8e:    0000        ..      MOVS     r0,r0
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000f90:    bf00        ..      NOP      
        0x00000f92:    4904        .I      LDR      r1,[pc,#16] ; [0xfa4] = 0x40020000
        0x00000f94:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000f96:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000f9a:    4a02        .J      LDR      r2,[pc,#8] ; [0xfa4] = 0x40020000
        0x00000f9c:    6111        .a      STR      r1,[r2,#0x10]
        0x00000f9e:    bf00        ..      NOP      
        0x00000fa0:    4770        pG      BX       lr
    $d
        0x00000fa2:    0000        ..      DCW    0
        0x00000fa4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000fa8:    b510        ..      PUSH     {r4,lr}
        0x00000faa:    4604        .F      MOV      r4,r0
        0x00000fac:    1e60        `.      SUBS     r0,r4,#1
        0x00000fae:    280f        .(      CMP      r0,#0xf
        0x00000fb0:    dc00        ..      BGT      0xfb4 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000fb2:    e004        ..      B        0xfbe ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000fb4:    2225        %"      MOVS     r2,#0x25
        0x00000fb6:    a108        ..      ADR      r1,{pc}+0x22 ; 0xfd8
        0x00000fb8:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xff8
        0x00000fba:    f000fc73    ..s.    BL       __aeabi_assert ; 0x18a4
        0x00000fbe:    1e61        a.      SUBS     r1,r4,#1
        0x00000fc0:    b2c8        ..      UXTB     r0,r1
        0x00000fc2:    4913        .I      LDR      r1,[pc,#76] ; [0x1010] = 0x40020000
        0x00000fc4:    6849        Ih      LDR      r1,[r1,#4]
        0x00000fc6:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000fca:    4a11        .J      LDR      r2,[pc,#68] ; [0x1010] = 0x40020000
        0x00000fcc:    6051        Q`      STR      r1,[r2,#4]
        0x00000fce:    bf00        ..      NOP      
        0x00000fd0:    2001        .       MOVS     r0,#1
        0x00000fd2:    f000fdab    ....    BL       sysc_awo_div_update_set ; 0x1b2c
        0x00000fd6:    bd10        ..      POP      {r4,pc}
    $d
        0x00000fd8:    735c2e2e    ..\s    DCD    1935420974
        0x00000fdc:    735c6b64    dk\s    DCD    1935436644
        0x00000fe0:    735c6372    rc\s    DCD    1935434610
        0x00000fe4:    645c636f    oc\d    DCD    1683776367
        0x00000fe8:    65766972    rive    DCD    1702259058
        0x00000fec:    79735c72    r\sy    DCD    2037603442
        0x00000ff0:    6e6f6373    scon    DCD    1852793715
        0x00000ff4:    0000632e    .c..    DCD    25390
        0x00000ff8:    62686128    (ahb    DCD    1651007784
        0x00000ffc:    7669645f    _div    DCD    1986618463
        0x00001000:    72656469    ider    DCD    1919247465
        0x00001004:    3c29312d    -1)<    DCD    1009332525
        0x00001008:    6678303d    =0xf    DCD    1719152701
        0x0000100c:    00000000    ....    DCD    0
        0x00001010:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00001014:    b510        ..      PUSH     {r4,lr}
        0x00001016:    4604        .F      MOV      r4,r0
        0x00001018:    1e60        `.      SUBS     r0,r4,#1
        0x0000101a:    280f        .(      CMP      r0,#0xf
        0x0000101c:    dc00        ..      BGT      0x1020 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x0000101e:    e004        ..      B        0x102a ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00001020:    222c        ,"      MOVS     r2,#0x2c
        0x00001022:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x104c
        0x00001024:    a011        ..      ADR      r0,{pc}+0x48 ; 0x106c
        0x00001026:    f000fc3d    ..=.    BL       __aeabi_assert ; 0x18a4
        0x0000102a:    1e61        a.      SUBS     r1,r4,#1
        0x0000102c:    b2c8        ..      UXTB     r0,r1
        0x0000102e:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00001032:    6849        Ih      LDR      r1,[r1,#4]
        0x00001034:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00001038:    f04f4280    O..B    MOV      r2,#0x40000000
        0x0000103c:    6051        Q`      STR      r1,[r2,#4]
        0x0000103e:    bf00        ..      NOP      
        0x00001040:    2001        .       MOVS     r0,#1
        0x00001042:    0781        ..      LSLS     r1,r0,#30
        0x00001044:    6008        .`      STR      r0,[r1,#0]
        0x00001046:    bf00        ..      NOP      
        0x00001048:    bd10        ..      POP      {r4,pc}
    $d
        0x0000104a:    0000        ..      DCW    0
        0x0000104c:    735c2e2e    ..\s    DCD    1935420974
        0x00001050:    735c6b64    dk\s    DCD    1935436644
        0x00001054:    735c6372    rc\s    DCD    1935434610
        0x00001058:    645c636f    oc\d    DCD    1683776367
        0x0000105c:    65766972    rive    DCD    1702259058
        0x00001060:    79735c72    r\sy    DCD    2037603442
        0x00001064:    6e6f6373    scon    DCD    1852793715
        0x00001068:    0000632e    .c..    DCD    25390
        0x0000106c:    62706128    (apb    DCD    1651532072
        0x00001070:    69645f30    0_di    DCD    1768185648
        0x00001074:    65646976    vide    DCD    1701079414
        0x00001078:    29312d72    r-1)    DCD    691088754
        0x0000107c:    78303d3c    <=0x    DCD    2016427324
        0x00001080:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00001084:    b510        ..      PUSH     {r4,lr}
        0x00001086:    4604        .F      MOV      r4,r0
        0x00001088:    1e60        `.      SUBS     r0,r4,#1
        0x0000108a:    280f        .(      CMP      r0,#0xf
        0x0000108c:    dc00        ..      BGT      0x1090 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x0000108e:    e004        ..      B        0x109a ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00001090:    2234        4"      MOVS     r2,#0x34
        0x00001092:    a108        ..      ADR      r1,{pc}+0x22 ; 0x10b4
        0x00001094:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x10d4
        0x00001096:    f000fc05    ....    BL       __aeabi_assert ; 0x18a4
        0x0000109a:    1e61        a.      SUBS     r1,r4,#1
        0x0000109c:    b2c8        ..      UXTB     r0,r1
        0x0000109e:    4913        .I      LDR      r1,[pc,#76] ; [0x10ec] = 0x40020000
        0x000010a0:    6849        Ih      LDR      r1,[r1,#4]
        0x000010a2:    f3601107    `...    BFI      r1,r0,#4,#4
        0x000010a6:    4a11        .J      LDR      r2,[pc,#68] ; [0x10ec] = 0x40020000
        0x000010a8:    6051        Q`      STR      r1,[r2,#4]
        0x000010aa:    bf00        ..      NOP      
        0x000010ac:    2002        .       MOVS     r0,#2
        0x000010ae:    f000fd3d    ..=.    BL       sysc_awo_div_update_set ; 0x1b2c
        0x000010b2:    bd10        ..      POP      {r4,pc}
    $d
        0x000010b4:    735c2e2e    ..\s    DCD    1935420974
        0x000010b8:    735c6b64    dk\s    DCD    1935436644
        0x000010bc:    735c6372    rc\s    DCD    1935434610
        0x000010c0:    645c636f    oc\d    DCD    1683776367
        0x000010c4:    65766972    rive    DCD    1702259058
        0x000010c8:    79735c72    r\sy    DCD    2037603442
        0x000010cc:    6e6f6373    scon    DCD    1852793715
        0x000010d0:    0000632e    .c..    DCD    25390
        0x000010d4:    62706128    (apb    DCD    1651532072
        0x000010d8:    69645f31    1_di    DCD    1768185649
        0x000010dc:    65646976    vide    DCD    1701079414
        0x000010e0:    29312d72    r-1)    DCD    691088754
        0x000010e4:    78303d3c    <=0x    DCD    2016427324
        0x000010e8:    00000066    f...    DCD    102
        0x000010ec:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x000010f0:    b570        p.      PUSH     {r4-r6,lr}
        0x000010f2:    4605        .F      MOV      r5,r0
        0x000010f4:    460c        .F      MOV      r4,r1
        0x000010f6:    1e60        `.      SUBS     r0,r4,#1
        0x000010f8:    f5b05f00    ..._    CMP      r0,#0x2000
        0x000010fc:    da00        ..      BGE      0x1100 ; HAL_SYSCON_Set_RTC_Div + 16
        0x000010fe:    e004        ..      B        0x110a ; HAL_SYSCON_Set_RTC_Div + 26
        0x00001100:    223c        <"      MOVS     r2,#0x3c
        0x00001102:    a112        ..      ADR      r1,{pc}+0x4a ; 0x114c
        0x00001104:    a019        ..      ADR      r0,{pc}+0x68 ; 0x116c
        0x00001106:    f000fbcd    ....    BL       __aeabi_assert ; 0x18a4
        0x0000110a:    2d01        .-      CMP      r5,#1
        0x0000110c:    dc00        ..      BGT      0x1110 ; HAL_SYSCON_Set_RTC_Div + 32
        0x0000110e:    e004        ..      B        0x111a ; HAL_SYSCON_Set_RTC_Div + 42
        0x00001110:    223d        ="      MOVS     r2,#0x3d
        0x00001112:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x114c
        0x00001114:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x1184
        0x00001116:    f000fbc5    ....    BL       __aeabi_assert ; 0x18a4
        0x0000111a:    b935        5.      CBNZ     r5,0x112a ; HAL_SYSCON_Set_RTC_Div + 58
        0x0000111c:    2000        .       MOVS     r0,#0
        0x0000111e:    f000fd0b    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1b38
        0x00001122:    2004        .       MOVS     r0,#4
        0x00001124:    f000fd02    ....    BL       sysc_awo_div_update_set ; 0x1b2c
        0x00001128:    e00e        ..      B        0x1148 ; HAL_SYSCON_Set_RTC_Div + 88
        0x0000112a:    2c02        .,      CMP      r4,#2
        0x0000112c:    db00        ..      BLT      0x1130 ; HAL_SYSCON_Set_RTC_Div + 64
        0x0000112e:    e004        ..      B        0x113a ; HAL_SYSCON_Set_RTC_Div + 74
        0x00001130:    2247        G"      MOVS     r2,#0x47
        0x00001132:    a106        ..      ADR      r1,{pc}+0x1a ; 0x114c
        0x00001134:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x11a0
        0x00001136:    f000fbb5    ....    BL       __aeabi_assert ; 0x18a4
        0x0000113a:    1e61        a.      SUBS     r1,r4,#1
        0x0000113c:    b288        ..      UXTH     r0,r1
        0x0000113e:    f000fcfb    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1b38
        0x00001142:    2004        .       MOVS     r0,#4
        0x00001144:    f000fcf2    ....    BL       sysc_awo_div_update_set ; 0x1b2c
        0x00001148:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000114a:    0000        ..      DCW    0
        0x0000114c:    735c2e2e    ..\s    DCD    1935420974
        0x00001150:    735c6b64    dk\s    DCD    1935436644
        0x00001154:    735c6372    rc\s    DCD    1935434610
        0x00001158:    645c636f    oc\d    DCD    1683776367
        0x0000115c:    65766972    rive    DCD    1702259058
        0x00001160:    79735c72    r\sy    DCD    2037603442
        0x00001164:    6e6f6373    scon    DCD    1852793715
        0x00001168:    0000632e    .c..    DCD    25390
        0x0000116c:    63747228    (rtc    DCD    1668575784
        0x00001170:    7669645f    _div    DCD    1986618463
        0x00001174:    72656469    ider    DCD    1919247465
        0x00001178:    3c29312d    -1)<    DCD    1009332525
        0x0000117c:    3178303d    =0x1    DCD    829960253
        0x00001180:    00666666    fff.    DCD    6710886
        0x00001184:    5f637472    rtc_    DCD    1600353394
        0x00001188:    3c637273    src<    DCD    1013150323
        0x0000118c:    6374723d    =rtc    DCD    1668575805
        0x00001190:    5f6b6c63    clk_    DCD    1600875619
        0x00001194:    6d6f7266    from    DCD    1836020326
        0x00001198:    6268615f    _ahb    DCD    1651007839
        0x0000119c:    00000000    ....    DCD    0
        0x000011a0:    5f637472    rtc_    DCD    1600353394
        0x000011a4:    69766964    divi    DCD    1769367908
        0x000011a8:    3e726564    der>    DCD    1047684452
        0x000011ac:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x000011b0:    4905        .I      LDR      r1,[pc,#20] ; [0x11c8] = 0x88
        0x000011b2:    b510        ..      PUSH     {r4,lr}
        0x000011b4:    3160        `1      ADDS     r1,r1,#0x60
        0x000011b6:    d004        ..      BEQ      0x11c2 ; I2C0_IRQHandler + 18
        0x000011b8:    6848        Hh      LDR      r0,[r1,#4]
        0x000011ba:    6809        .h      LDR      r1,[r1,#0]
        0x000011bc:    e8bd4010    ...@    POP      {r4,lr}
        0x000011c0:    4708        .G      BX       r1
        0x000011c2:    f7fff8e5    ....    BL       abort ; 0x390
    $d
        0x000011c6:    0000        ..      DCW    0
        0x000011c8:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x000011cc:    4905        .I      LDR      r1,[pc,#20] ; [0x11e4] = 0x88
        0x000011ce:    b510        ..      PUSH     {r4,lr}
        0x000011d0:    3168        h1      ADDS     r1,r1,#0x68
        0x000011d2:    d004        ..      BEQ      0x11de ; I2C1_IRQHandler + 18
        0x000011d4:    6848        Hh      LDR      r0,[r1,#4]
        0x000011d6:    6809        .h      LDR      r1,[r1,#0]
        0x000011d8:    e8bd4010    ...@    POP      {r4,lr}
        0x000011dc:    4708        .G      BX       r1
        0x000011de:    f7fff8d7    ....    BL       abort ; 0x390
    $d
        0x000011e2:    0000        ..      DCW    0
        0x000011e4:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x000011e8:    4905        .I      LDR      r1,[pc,#20] ; [0x1200] = 0x88
        0x000011ea:    b510        ..      PUSH     {r4,lr}
        0x000011ec:    3188        .1      ADDS     r1,r1,#0x88
        0x000011ee:    d004        ..      BEQ      0x11fa ; I2S_IRQHandler + 18
        0x000011f0:    6848        Hh      LDR      r0,[r1,#4]
        0x000011f2:    6809        .h      LDR      r1,[r1,#0]
        0x000011f4:    e8bd4010    ...@    POP      {r4,lr}
        0x000011f8:    4708        .G      BX       r1
        0x000011fa:    f7fff8c9    ....    BL       abort ; 0x390
    $d
        0x000011fe:    0000        ..      DCW    0
        0x00001200:    00000088    ....    DCD    136
    $t
    i.OLED_DrawBMP
    OLED_DrawBMP
        0x00001204:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001208:    461f        .F      MOV      r7,r3
        0x0000120a:    4690        .F      MOV      r8,r2
        0x0000120c:    460e        .F      MOV      r6,r1
        0x0000120e:    4682        .F      MOV      r10,r0
        0x00001210:    2500        .%      MOVS     r5,#0
        0x00001212:    f8dd9020    .. .    LDR      r9,[sp,#0x20]
        0x00001216:    e010        ..      B        0x123a ; OLED_DrawBMP + 54
        0x00001218:    4631        1F      MOV      r1,r6
        0x0000121a:    4650        PF      MOV      r0,r10
        0x0000121c:    f000f811    ....    BL       OLED_SetPos ; 0x1242
        0x00001220:    4654        TF      MOV      r4,r10
        0x00001222:    e006        ..      B        0x1232 ; OLED_DrawBMP + 46
        0x00001224:    f8190005    ....    LDRB     r0,[r9,r5]
        0x00001228:    1c6d        m.      ADDS     r5,r5,#1
        0x0000122a:    f000f9b7    ....    BL       Write_IIC_Data ; 0x159c
        0x0000122e:    1c64        d.      ADDS     r4,r4,#1
        0x00001230:    b2e4        ..      UXTB     r4,r4
        0x00001232:    4544        DE      CMP      r4,r8
        0x00001234:    d3f6        ..      BCC      0x1224 ; OLED_DrawBMP + 32
        0x00001236:    1c76        v.      ADDS     r6,r6,#1
        0x00001238:    b2f6        ..      UXTB     r6,r6
        0x0000123a:    42be        .B      CMP      r6,r7
        0x0000123c:    d3ec        ..      BCC      0x1218 ; OLED_DrawBMP + 20
        0x0000123e:    e8bd87f0    ....    POP      {r4-r10,pc}
    i.OLED_SetPos
    OLED_SetPos
        0x00001242:    b510        ..      PUSH     {r4,lr}
        0x00001244:    4604        .F      MOV      r4,r0
        0x00001246:    31b0        .1      ADDS     r1,r1,#0xb0
        0x00001248:    b2c8        ..      UXTB     r0,r1
        0x0000124a:    f000f999    ....    BL       Write_IIC_Command ; 0x1580
        0x0000124e:    2010        .       MOVS     r0,#0x10
        0x00001250:    ea401014    @...    ORR      r0,r0,r4,LSR #4
        0x00001254:    f000f994    ....    BL       Write_IIC_Command ; 0x1580
        0x00001258:    f004000f    ....    AND      r0,r4,#0xf
        0x0000125c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001260:    f0400001    @...    ORR      r0,r0,#1
        0x00001264:    f000b98c    ....    B.W      Write_IIC_Command ; 0x1580
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x00001268:    4905        .I      LDR      r1,[pc,#20] ; [0x1280] = 0x88
        0x0000126a:    b510        ..      PUSH     {r4,lr}
        0x0000126c:    3120         1      ADDS     r1,r1,#0x20
        0x0000126e:    d004        ..      BEQ      0x127a ; QSPI_IRQHandler + 18
        0x00001270:    6848        Hh      LDR      r0,[r1,#4]
        0x00001272:    6809        .h      LDR      r1,[r1,#0]
        0x00001274:    e8bd4010    ...@    POP      {r4,lr}
        0x00001278:    4708        .G      BX       r1
        0x0000127a:    f7fff889    ....    BL       abort ; 0x390
    $d
        0x0000127e:    0000        ..      DCW    0
        0x00001280:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x00001284:    4905        .I      LDR      r1,[pc,#20] ; [0x129c] = 0x88
        0x00001286:    b510        ..      PUSH     {r4,lr}
        0x00001288:    3110        .1      ADDS     r1,r1,#0x10
        0x0000128a:    d004        ..      BEQ      0x1296 ; RTC_IRQHandler + 18
        0x0000128c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000128e:    6809        .h      LDR      r1,[r1,#0]
        0x00001290:    e8bd4010    ...@    POP      {r4,lr}
        0x00001294:    4708        .G      BX       r1
        0x00001296:    f7fff87b    ..{.    BL       abort ; 0x390
    $d
        0x0000129a:    0000        ..      DCW    0
        0x0000129c:    00000088    ....    DCD    136
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000012a0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000012a4:    4607        .F      MOV      r7,r0
        0x000012a6:    480b        .H      LDR      r0,[pc,#44] ; [0x12d4] = 0x20000408
        0x000012a8:    4615        .F      MOV      r5,r2
        0x000012aa:    460e        .F      MOV      r6,r1
        0x000012ac:    7800        .x      LDRB     r0,[r0,#0]
        0x000012ae:    b908        ..      CBNZ     r0,0x12b4 ; SEGGER_RTT_Write + 20
        0x000012b0:    f000f982    ....    BL       _DoInit ; 0x15b8
        0x000012b4:    f3ef8411    ....    MRS      r4,BASEPRI
        0x000012b8:    2020                MOVS     r0,#0x20
        0x000012ba:    f3808811    ....    MSR      BASEPRI,r0
        0x000012be:    462a        *F      MOV      r2,r5
        0x000012c0:    4631        1F      MOV      r1,r6
        0x000012c2:    4638        8F      MOV      r0,r7
        0x000012c4:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0x12d8
        0x000012c8:    b2e1        ..      UXTB     r1,r4
        0x000012ca:    f3818811    ....    MSR      BASEPRI,r1
        0x000012ce:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x000012d2:    0000        ..      DCW    0
        0x000012d4:    20000408    ...     DCD    536871944
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x000012d8:    b570        p.      PUSH     {r4-r6,lr}
        0x000012da:    460e        .F      MOV      r6,r1
        0x000012dc:    4914        .I      LDR      r1,[pc,#80] ; [0x1330] = 0x20000408
        0x000012de:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x000012e2:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x000012e6:    4614        .F      MOV      r4,r2
        0x000012e8:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x000012ea:    3518        .5      ADDS     r5,r5,#0x18
        0x000012ec:    b120         .      CBZ      r0,0x12f8 ; SEGGER_RTT_WriteNoLock + 32
        0x000012ee:    2801        .(      CMP      r0,#1
        0x000012f0:    d00f        ..      BEQ      0x1312 ; SEGGER_RTT_WriteNoLock + 58
        0x000012f2:    2802        .(      CMP      r0,#2
        0x000012f4:    d105        ..      BNE      0x1302 ; SEGGER_RTT_WriteNoLock + 42
        0x000012f6:    e013        ..      B        0x1320 ; SEGGER_RTT_WriteNoLock + 72
        0x000012f8:    4628        (F      MOV      r0,r5
        0x000012fa:    f000f991    ....    BL       _GetAvailWriteSpace ; 0x1620
        0x000012fe:    42a0        .B      CMP      r0,r4
        0x00001300:    d201        ..      BCS      0x1306 ; SEGGER_RTT_WriteNoLock + 46
        0x00001302:    2400        .$      MOVS     r4,#0
        0x00001304:    e011        ..      B        0x132a ; SEGGER_RTT_WriteNoLock + 82
        0x00001306:    4622        "F      MOV      r2,r4
        0x00001308:    4631        1F      MOV      r1,r6
        0x0000130a:    4628        (F      MOV      r0,r5
        0x0000130c:    f000faa8    ....    BL       _WriteNoCheck ; 0x1860
        0x00001310:    e00b        ..      B        0x132a ; SEGGER_RTT_WriteNoLock + 82
        0x00001312:    4628        (F      MOV      r0,r5
        0x00001314:    f000f984    ....    BL       _GetAvailWriteSpace ; 0x1620
        0x00001318:    42a0        .B      CMP      r0,r4
        0x0000131a:    d2f4        ..      BCS      0x1306 ; SEGGER_RTT_WriteNoLock + 46
        0x0000131c:    4604        .F      MOV      r4,r0
        0x0000131e:    e7f2        ..      B        0x1306 ; SEGGER_RTT_WriteNoLock + 46
        0x00001320:    4631        1F      MOV      r1,r6
        0x00001322:    4628        (F      MOV      r0,r5
        0x00001324:    f000fa6f    ..o.    BL       _WriteBlocking ; 0x1806
        0x00001328:    4604        .F      MOV      r4,r0
        0x0000132a:    4620         F      MOV      r0,r4
        0x0000132c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000132e:    0000        ..      DCW    0
        0x00001330:    20000408    ...     DCD    536871944
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00001334:    b40f        ..      PUSH     {r0-r3}
        0x00001336:    b508        ..      PUSH     {r3,lr}
        0x00001338:    a904        ..      ADD      r1,sp,#0x10
        0x0000133a:    9100        ..      STR      r1,[sp,#0]
        0x0000133c:    466a        jF      MOV      r2,sp
        0x0000133e:    9903        ..      LDR      r1,[sp,#0xc]
        0x00001340:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0x134a
        0x00001344:    b001        ..      ADD      sp,sp,#4
        0x00001346:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x0000134a:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000134e:    b098        ..      SUB      sp,sp,#0x60
        0x00001350:    4680        .F      MOV      r8,r0
        0x00001352:    a807        ..      ADD      r0,sp,#0x1c
        0x00001354:    9002        ..      STR      r0,[sp,#8]
        0x00001356:    2040        @       MOVS     r0,#0x40
        0x00001358:    2600        .&      MOVS     r6,#0
        0x0000135a:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x0000135e:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x00001362:    4615        .F      MOV      r5,r2
        0x00001364:    460c        .F      MOV      r4,r1
        0x00001366:    f8141b01    ....    LDRB     r1,[r4],#1
        0x0000136a:    2900        .)      CMP      r1,#0
        0x0000136c:    d06f        o.      BEQ      0x144e ; SEGGER_RTT_vprintf + 260
        0x0000136e:    2925        %)      CMP      r1,#0x25
        0x00001370:    d008        ..      BEQ      0x1384 ; SEGGER_RTT_vprintf + 58
        0x00001372:    a802        ..      ADD      r0,sp,#8
        0x00001374:    f000fa28    ..(.    BL       _StoreChar ; 0x17c8
        0x00001378:    9805        ..      LDR      r0,[sp,#0x14]
        0x0000137a:    2800        .(      CMP      r0,#0
        0x0000137c:    daf3        ..      BGE      0x1366 ; SEGGER_RTT_vprintf + 28
        0x0000137e:    b018        ..      ADD      sp,sp,#0x60
        0x00001380:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00001384:    2000        .       MOVS     r0,#0
        0x00001386:    2201        ."      MOVS     r2,#1
        0x00001388:    7821        !x      LDRB     r1,[r4,#0]
        0x0000138a:    2923        #)      CMP      r1,#0x23
        0x0000138c:    d01e        ..      BEQ      0x13cc ; SEGGER_RTT_vprintf + 130
        0x0000138e:    292b        +)      CMP      r1,#0x2b
        0x00001390:    d019        ..      BEQ      0x13c6 ; SEGGER_RTT_vprintf + 124
        0x00001392:    292d        -)      CMP      r1,#0x2d
        0x00001394:    d002        ..      BEQ      0x139c ; SEGGER_RTT_vprintf + 82
        0x00001396:    2930        0)      CMP      r1,#0x30
        0x00001398:    d108        ..      BNE      0x13ac ; SEGGER_RTT_vprintf + 98
        0x0000139a:    e002        ..      B        0x13a2 ; SEGGER_RTT_vprintf + 88
        0x0000139c:    f0400001    @...    ORR      r0,r0,#1
        0x000013a0:    e001        ..      B        0x13a6 ; SEGGER_RTT_vprintf + 92
        0x000013a2:    f0400002    @...    ORR      r0,r0,#2
        0x000013a6:    1c64        d.      ADDS     r4,r4,#1
        0x000013a8:    2a00        .*      CMP      r2,#0
        0x000013aa:    d1ed        ..      BNE      0x1388 ; SEGGER_RTT_vprintf + 62
        0x000013ac:    2200        ."      MOVS     r2,#0
        0x000013ae:    7821        !x      LDRB     r1,[r4,#0]
        0x000013b0:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x000013b4:    2b0a        .+      CMP      r3,#0xa
        0x000013b6:    d20c        ..      BCS      0x13d2 ; SEGGER_RTT_vprintf + 136
        0x000013b8:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x000013bc:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x000013c0:    3a30        0:      SUBS     r2,r2,#0x30
        0x000013c2:    1c64        d.      ADDS     r4,r4,#1
        0x000013c4:    e7f3        ..      B        0x13ae ; SEGGER_RTT_vprintf + 100
        0x000013c6:    f0400004    @...    ORR      r0,r0,#4
        0x000013ca:    e7ec        ..      B        0x13a6 ; SEGGER_RTT_vprintf + 92
        0x000013cc:    f0400008    @...    ORR      r0,r0,#8
        0x000013d0:    e7e9        ..      B        0x13a6 ; SEGGER_RTT_vprintf + 92
        0x000013d2:    2300        .#      MOVS     r3,#0
        0x000013d4:    b2cf        ..      UXTB     r7,r1
        0x000013d6:    2f2e        ./      CMP      r7,#0x2e
        0x000013d8:    d10b        ..      BNE      0x13f2 ; SEGGER_RTT_vprintf + 168
        0x000013da:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x000013de:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x000013e2:    2f0a        ./      CMP      r7,#0xa
        0x000013e4:    d205        ..      BCS      0x13f2 ; SEGGER_RTT_vprintf + 168
        0x000013e6:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x000013ea:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x000013ee:    3b30        0;      SUBS     r3,r3,#0x30
        0x000013f0:    e7f3        ..      B        0x13da ; SEGGER_RTT_vprintf + 144
        0x000013f2:    296c        l)      CMP      r1,#0x6c
        0x000013f4:    d00d        ..      BEQ      0x1412 ; SEGGER_RTT_vprintf + 200
        0x000013f6:    2968        h)      CMP      r1,#0x68
        0x000013f8:    d00b        ..      BEQ      0x1412 ; SEGGER_RTT_vprintf + 200
        0x000013fa:    2970        p)      CMP      r1,#0x70
        0x000013fc:    d04a        J.      BEQ      0x1494 ; SEGGER_RTT_vprintf + 330
        0x000013fe:    dc0b        ..      BGT      0x1418 ; SEGGER_RTT_vprintf + 206
        0x00001400:    2925        %)      CMP      r1,#0x25
        0x00001402:    d014        ..      BEQ      0x142e ; SEGGER_RTT_vprintf + 228
        0x00001404:    2958        X)      CMP      r1,#0x58
        0x00001406:    d02b        +.      BEQ      0x1460 ; SEGGER_RTT_vprintf + 278
        0x00001408:    2963        c)      CMP      r1,#0x63
        0x0000140a:    d00c        ..      BEQ      0x1426 ; SEGGER_RTT_vprintf + 220
        0x0000140c:    2964        d)      CMP      r1,#0x64
        0x0000140e:    d111        ..      BNE      0x1434 ; SEGGER_RTT_vprintf + 234
        0x00001410:    e012        ..      B        0x1438 ; SEGGER_RTT_vprintf + 238
        0x00001412:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00001416:    e7ec        ..      B        0x13f2 ; SEGGER_RTT_vprintf + 168
        0x00001418:    2973        s)      CMP      r1,#0x73
        0x0000141a:    d02c        ,.      BEQ      0x1476 ; SEGGER_RTT_vprintf + 300
        0x0000141c:    2975        u)      CMP      r1,#0x75
        0x0000141e:    d017        ..      BEQ      0x1450 ; SEGGER_RTT_vprintf + 262
        0x00001420:    2978        x)      CMP      r1,#0x78
        0x00001422:    d107        ..      BNE      0x1434 ; SEGGER_RTT_vprintf + 234
        0x00001424:    e01c        ..      B        0x1460 ; SEGGER_RTT_vprintf + 278
        0x00001426:    6828        (h      LDR      r0,[r5,#0]
        0x00001428:    1d01        ..      ADDS     r1,r0,#4
        0x0000142a:    6029        )`      STR      r1,[r5,#0]
        0x0000142c:    7801        .x      LDRB     r1,[r0,#0]
        0x0000142e:    a802        ..      ADD      r0,sp,#8
        0x00001430:    f000f9ca    ....    BL       _StoreChar ; 0x17c8
        0x00001434:    1c64        d.      ADDS     r4,r4,#1
        0x00001436:    e79f        ..      B        0x1378 ; SEGGER_RTT_vprintf + 46
        0x00001438:    6829        )h      LDR      r1,[r5,#0]
        0x0000143a:    1d0f        ..      ADDS     r7,r1,#4
        0x0000143c:    602f        /`      STR      r7,[r5,#0]
        0x0000143e:    6809        .h      LDR      r1,[r1,#0]
        0x00001440:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00001444:    220a        ."      MOVS     r2,#0xa
        0x00001446:    a802        ..      ADD      r0,sp,#8
        0x00001448:    f000f8f5    ....    BL       _PrintInt ; 0x1636
        0x0000144c:    e7f2        ..      B        0x1434 ; SEGGER_RTT_vprintf + 234
        0x0000144e:    e02b        +.      B        0x14a8 ; SEGGER_RTT_vprintf + 350
        0x00001450:    6829        )h      LDR      r1,[r5,#0]
        0x00001452:    1d0f        ..      ADDS     r7,r1,#4
        0x00001454:    602f        /`      STR      r7,[r5,#0]
        0x00001456:    6809        .h      LDR      r1,[r1,#0]
        0x00001458:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x0000145c:    220a        ."      MOVS     r2,#0xa
        0x0000145e:    e006        ..      B        0x146e ; SEGGER_RTT_vprintf + 292
        0x00001460:    6829        )h      LDR      r1,[r5,#0]
        0x00001462:    1d0f        ..      ADDS     r7,r1,#4
        0x00001464:    602f        /`      STR      r7,[r5,#0]
        0x00001466:    6809        .h      LDR      r1,[r1,#0]
        0x00001468:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x0000146c:    2210        ."      MOVS     r2,#0x10
        0x0000146e:    a802        ..      ADD      r0,sp,#8
        0x00001470:    f000f944    ..D.    BL       _PrintUnsigned ; 0x16fc
        0x00001474:    e7de        ..      B        0x1434 ; SEGGER_RTT_vprintf + 234
        0x00001476:    6828        (h      LDR      r0,[r5,#0]
        0x00001478:    1d01        ..      ADDS     r1,r0,#4
        0x0000147a:    6029        )`      STR      r1,[r5,#0]
        0x0000147c:    6807        .h      LDR      r7,[r0,#0]
        0x0000147e:    f8171b01    ....    LDRB     r1,[r7],#1
        0x00001482:    2900        .)      CMP      r1,#0
        0x00001484:    d0d6        ..      BEQ      0x1434 ; SEGGER_RTT_vprintf + 234
        0x00001486:    a802        ..      ADD      r0,sp,#8
        0x00001488:    f000f99e    ....    BL       _StoreChar ; 0x17c8
        0x0000148c:    9805        ..      LDR      r0,[sp,#0x14]
        0x0000148e:    2800        .(      CMP      r0,#0
        0x00001490:    daf5        ..      BGE      0x147e ; SEGGER_RTT_vprintf + 308
        0x00001492:    e7cf        ..      B        0x1434 ; SEGGER_RTT_vprintf + 234
        0x00001494:    6828        (h      LDR      r0,[r5,#0]
        0x00001496:    1d01        ..      ADDS     r1,r0,#4
        0x00001498:    6029        )`      STR      r1,[r5,#0]
        0x0000149a:    6801        .h      LDR      r1,[r0,#0]
        0x0000149c:    2008        .       MOVS     r0,#8
        0x0000149e:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x000014a2:    4603        .F      MOV      r3,r0
        0x000014a4:    2210        ."      MOVS     r2,#0x10
        0x000014a6:    e7e2        ..      B        0x146e ; SEGGER_RTT_vprintf + 292
        0x000014a8:    9805        ..      LDR      r0,[sp,#0x14]
        0x000014aa:    2800        .(      CMP      r0,#0
        0x000014ac:    f77faf67    ..g.    BLE      0x137e ; SEGGER_RTT_vprintf + 52
        0x000014b0:    9804        ..      LDR      r0,[sp,#0x10]
        0x000014b2:    b120         .      CBZ      r0,0x14be ; SEGGER_RTT_vprintf + 372
        0x000014b4:    4602        .F      MOV      r2,r0
        0x000014b6:    a907        ..      ADD      r1,sp,#0x1c
        0x000014b8:    4640        @F      MOV      r0,r8
        0x000014ba:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0x12a0
        0x000014be:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x000014c2:    4408        .D      ADD      r0,r0,r1
        0x000014c4:    9005        ..      STR      r0,[sp,#0x14]
        0x000014c6:    e75a        Z.      B        0x137e ; SEGGER_RTT_vprintf + 52
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x000014c8:    4905        .I      LDR      r1,[pc,#20] ; [0x14e0] = 0x88
        0x000014ca:    b510        ..      PUSH     {r4,lr}
        0x000014cc:    3170        p1      ADDS     r1,r1,#0x70
        0x000014ce:    d004        ..      BEQ      0x14da ; SPIM_IRQHandler + 18
        0x000014d0:    6848        Hh      LDR      r0,[r1,#4]
        0x000014d2:    6809        .h      LDR      r1,[r1,#0]
        0x000014d4:    e8bd4010    ...@    POP      {r4,lr}
        0x000014d8:    4708        .G      BX       r1
        0x000014da:    f7feff59    ..Y.    BL       abort ; 0x390
    $d
        0x000014de:    0000        ..      DCW    0
        0x000014e0:    00000088    ....    DCD    136
    $t
    i.SystemInit
    SystemInit
        0x000014e4:    b510        ..      PUSH     {r4,lr}
        0x000014e6:    4812        .H      LDR      r0,[pc,#72] ; [0x1530] = 0x4000b000
        0x000014e8:    6801        .h      LDR      r1,[r0,#0]
        0x000014ea:    0149        I.      LSLS     r1,r1,#5
        0x000014ec:    d5fc        ..      BPL      0x14e8 ; SystemInit + 4
        0x000014ee:    f64e2160    N.`!    MOV      r1,#0xea60
        0x000014f2:    2000        .       MOVS     r0,#0
        0x000014f4:    bf00        ..      NOP      
        0x000014f6:    bf00        ..      NOP      
        0x000014f8:    bf00        ..      NOP      
        0x000014fa:    bf00        ..      NOP      
        0x000014fc:    bf00        ..      NOP      
        0x000014fe:    bf00        ..      NOP      
        0x00001500:    1c40        @.      ADDS     r0,r0,#1
        0x00001502:    4288        .B      CMP      r0,r1
        0x00001504:    d3f6        ..      BCC      0x14f4 ; SystemInit + 16
        0x00001506:    490c        .I      LDR      r1,[pc,#48] ; [0x1538] = 0x20000000
        0x00001508:    480a        .H      LDR      r0,[pc,#40] ; [0x1534] = 0x5f5e100
        0x0000150a:    6008        .`      STR      r0,[r1,#0]
        0x0000150c:    2008        .       MOVS     r0,#8
        0x0000150e:    f7fffd3f    ..?.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xf90
        0x00001512:    2002        .       MOVS     r0,#2
        0x00001514:    f7fffd48    ..H.    BL       HAL_SYSCON_Set_HClk_Div ; 0xfa8
        0x00001518:    2004        .       MOVS     r0,#4
        0x0000151a:    f7fffd7b    ..{.    BL       HAL_SYSCON_Set_PClk0_Div ; 0x1014
        0x0000151e:    2002        .       MOVS     r0,#2
        0x00001520:    f7fffdb0    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0x1084
        0x00001524:    2164        d!      MOVS     r1,#0x64
        0x00001526:    e8bd4010    ...@    POP      {r4,lr}
        0x0000152a:    2001        .       MOVS     r0,#1
        0x0000152c:    f7ffbde0    ....    B.W      HAL_SYSCON_Set_RTC_Div ; 0x10f0
    $d
        0x00001530:    4000b000    ...@    DCD    1073786880
        0x00001534:    05f5e100    ....    DCD    100000000
        0x00001538:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x0000153c:    4905        .I      LDR      r1,[pc,#20] ; [0x1554] = 0x88
        0x0000153e:    b510        ..      PUSH     {r4,lr}
        0x00001540:    3158        X1      ADDS     r1,r1,#0x58
        0x00001542:    d004        ..      BEQ      0x154e ; TIMER_IRQHandler + 18
        0x00001544:    6848        Hh      LDR      r0,[r1,#4]
        0x00001546:    6809        .h      LDR      r1,[r1,#0]
        0x00001548:    e8bd4010    ...@    POP      {r4,lr}
        0x0000154c:    4708        .G      BX       r1
        0x0000154e:    f7feff1f    ....    BL       abort ; 0x390
    $d
        0x00001552:    0000        ..      DCW    0
        0x00001554:    00000088    ....    DCD    136
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x00001558:    4905        .I      LDR      r1,[pc,#20] ; [0x1570] = 0x88
        0x0000155a:    b510        ..      PUSH     {r4,lr}
        0x0000155c:    3178        x1      ADDS     r1,r1,#0x78
        0x0000155e:    d004        ..      BEQ      0x156a ; UART_IRQHandler + 18
        0x00001560:    6848        Hh      LDR      r0,[r1,#4]
        0x00001562:    6809        .h      LDR      r1,[r1,#0]
        0x00001564:    e8bd4010    ...@    POP      {r4,lr}
        0x00001568:    4708        .G      BX       r1
        0x0000156a:    f7feff11    ....    BL       abort ; 0x390
    $d
        0x0000156e:    0000        ..      DCW    0
        0x00001570:    00000088    ....    DCD    136
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x00001574:    4901        .I      LDR      r1,[pc,#4] ; [0x157c] = 0x88
        0x00001576:    6848        Hh      LDR      r0,[r1,#4]
        0x00001578:    6809        .h      LDR      r1,[r1,#0]
        0x0000157a:    4708        .G      BX       r1
    $d
        0x0000157c:    00000088    ....    DCD    136
    $t
    i.Write_IIC_Command
    Write_IIC_Command
        0x00001580:    b501        ..      PUSH     {r0,lr}
        0x00001582:    b082        ..      SUB      sp,sp,#8
        0x00001584:    2000        .       MOVS     r0,#0
        0x00001586:    f88d0000    ....    STRB     r0,[sp,#0]
        0x0000158a:    2101        .!      MOVS     r1,#1
        0x0000158c:    4668        hF      MOV      r0,sp
        0x0000158e:    f7fffa96    ....    BL       HAL_I2C0_SendAddrCmd ; 0xabe
        0x00001592:    2101        .!      MOVS     r1,#1
        0x00001594:    a802        ..      ADD      r0,sp,#8
        0x00001596:    f7fffc02    ....    BL       HAL_I2C0_WriteData ; 0xd9e
        0x0000159a:    bd0e        ..      POP      {r1-r3,pc}
    i.Write_IIC_Data
    Write_IIC_Data
        0x0000159c:    b501        ..      PUSH     {r0,lr}
        0x0000159e:    b082        ..      SUB      sp,sp,#8
        0x000015a0:    2040        @       MOVS     r0,#0x40
        0x000015a2:    f88d0000    ....    STRB     r0,[sp,#0]
        0x000015a6:    2101        .!      MOVS     r1,#1
        0x000015a8:    4668        hF      MOV      r0,sp
        0x000015aa:    f7fffa88    ....    BL       HAL_I2C0_SendAddrCmd ; 0xabe
        0x000015ae:    2101        .!      MOVS     r1,#1
        0x000015b0:    a802        ..      ADD      r0,sp,#8
        0x000015b2:    f7fffbf4    ....    BL       HAL_I2C0_WriteData ; 0xd9e
        0x000015b6:    bd0e        ..      POP      {r1-r3,pc}
    i._DoInit
    _DoInit
        0x000015b8:    b510        ..      PUSH     {r4,lr}
        0x000015ba:    4c12        .L      LDR      r4,[pc,#72] ; [0x1604] = 0x20000408
        0x000015bc:    2003        .       MOVS     r0,#3
        0x000015be:    2100        .!      MOVS     r1,#0
        0x000015c0:    6120         a      STR      r0,[r4,#0x10]
        0x000015c2:    6160        `a      STR      r0,[r4,#0x14]
        0x000015c4:    a010        ..      ADR      r0,{pc}+0x44 ; 0x1608
        0x000015c6:    61a0        .a      STR      r0,[r4,#0x18]
        0x000015c8:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x000015cc:    61e0        .a      STR      r0,[r4,#0x1c]
        0x000015ce:    f44f6080    O..`    MOV      r0,#0x400
        0x000015d2:    62a1        .b      STR      r1,[r4,#0x28]
        0x000015d4:    6220         b      STR      r0,[r4,#0x20]
        0x000015d6:    6261        ab      STR      r1,[r4,#0x24]
        0x000015d8:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x1608
        0x000015da:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000015dc:    6620         f      STR      r0,[r4,#0x60]
        0x000015de:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x000015e2:    6660        `f      STR      r0,[r4,#0x64]
        0x000015e4:    2010        .       MOVS     r0,#0x10
        0x000015e6:    6721        !g      STR      r1,[r4,#0x70]
        0x000015e8:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x000015ec:    6761        ag      STR      r1,[r4,#0x74]
        0x000015ee:    a109        ..      ADR      r1,{pc}+0x26 ; 0x1614
        0x000015f0:    1de0        ..      ADDS     r0,r4,#7
        0x000015f2:    f7fefed5    ....    BL       strcpy ; 0x3a0
        0x000015f6:    a108        ..      ADR      r1,{pc}+0x22 ; 0x1618
        0x000015f8:    4620         F      MOV      r0,r4
        0x000015fa:    f7fefed1    ....    BL       strcpy ; 0x3a0
        0x000015fe:    2020                MOVS     r0,#0x20
        0x00001600:    71a0        .q      STRB     r0,[r4,#6]
        0x00001602:    bd10        ..      POP      {r4,pc}
    $d
        0x00001604:    20000408    ...     DCD    536871944
        0x00001608:    6d726554    Term    DCD    1836213588
        0x0000160c:    6c616e69    inal    DCD    1818324585
        0x00001610:    00000000    ....    DCD    0
        0x00001614:    00545452    RTT.    DCD    5526610
        0x00001618:    47474553    SEGG    DCD    1195853139
        0x0000161c:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001620:    6902        .i      LDR      r2,[r0,#0x10]
        0x00001622:    68c1        .h      LDR      r1,[r0,#0xc]
        0x00001624:    428a        .B      CMP      r2,r1
        0x00001626:    d803        ..      BHI      0x1630 ; _GetAvailWriteSpace + 16
        0x00001628:    6880        .h      LDR      r0,[r0,#8]
        0x0000162a:    1a40        @.      SUBS     r0,r0,r1
        0x0000162c:    4410        .D      ADD      r0,r0,r2
        0x0000162e:    e000        ..      B        0x1632 ; _GetAvailWriteSpace + 18
        0x00001630:    1a50        P.      SUBS     r0,r2,r1
        0x00001632:    1e40        @.      SUBS     r0,r0,#1
        0x00001634:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x00001636:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x0000163a:    000e        ..      MOVS     r6,r1
        0x0000163c:    4680        .F      MOV      r8,r0
        0x0000163e:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x00001642:    f1c60000    ....    RSB      r0,r6,#0
        0x00001646:    4699        .F      MOV      r9,r3
        0x00001648:    4692        .F      MOV      r10,r2
        0x0000164a:    4683        .F      MOV      r11,r0
        0x0000164c:    d400        ..      BMI      0x1650 ; _PrintInt + 26
        0x0000164e:    4608        .F      MOV      r0,r1
        0x00001650:    2501        .%      MOVS     r5,#1
        0x00001652:    e002        ..      B        0x165a ; _PrintInt + 36
        0x00001654:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x00001658:    1c6d        m.      ADDS     r5,r5,#1
        0x0000165a:    4550        PE      CMP      r0,r10
        0x0000165c:    dafa        ..      BGE      0x1654 ; _PrintInt + 30
        0x0000165e:    45a9        .E      CMP      r9,r5
        0x00001660:    d900        ..      BLS      0x1664 ; _PrintInt + 46
        0x00001662:    464d        MF      MOV      r5,r9
        0x00001664:    b124        $.      CBZ      r4,0x1670 ; _PrintInt + 58
        0x00001666:    2e00        ..      CMP      r6,#0
        0x00001668:    db01        ..      BLT      0x166e ; _PrintInt + 56
        0x0000166a:    0778        x.      LSLS     r0,r7,#29
        0x0000166c:    d500        ..      BPL      0x1670 ; _PrintInt + 58
        0x0000166e:    1e64        d.      SUBS     r4,r4,#1
        0x00001670:    07b8        ..      LSLS     r0,r7,#30
        0x00001672:    d502        ..      BPL      0x167a ; _PrintInt + 68
        0x00001674:    f1b90f00    ....    CMP      r9,#0
        0x00001678:    d00f        ..      BEQ      0x169a ; _PrintInt + 100
        0x0000167a:    07f8        ..      LSLS     r0,r7,#31
        0x0000167c:    d10d        ..      BNE      0x169a ; _PrintInt + 100
        0x0000167e:    b164        d.      CBZ      r4,0x169a ; _PrintInt + 100
        0x00001680:    42a5        .B      CMP      r5,r4
        0x00001682:    d20a        ..      BCS      0x169a ; _PrintInt + 100
        0x00001684:    2120         !      MOVS     r1,#0x20
        0x00001686:    4640        @F      MOV      r0,r8
        0x00001688:    1e64        d.      SUBS     r4,r4,#1
        0x0000168a:    f000f89d    ....    BL       _StoreChar ; 0x17c8
        0x0000168e:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x00001692:    2800        .(      CMP      r0,#0
        0x00001694:    daf3        ..      BGE      0x167e ; _PrintInt + 72
        0x00001696:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x0000169a:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x0000169e:    2800        .(      CMP      r0,#0
        0x000016a0:    dbf9        ..      BLT      0x1696 ; _PrintInt + 96
        0x000016a2:    2e00        ..      CMP      r6,#0
        0x000016a4:    da02        ..      BGE      0x16ac ; _PrintInt + 118
        0x000016a6:    465e        ^F      MOV      r6,r11
        0x000016a8:    212d        -!      MOVS     r1,#0x2d
        0x000016aa:    e002        ..      B        0x16b2 ; _PrintInt + 124
        0x000016ac:    0778        x.      LSLS     r0,r7,#29
        0x000016ae:    d507        ..      BPL      0x16c0 ; _PrintInt + 138
        0x000016b0:    212b        +!      MOVS     r1,#0x2b
        0x000016b2:    4640        @F      MOV      r0,r8
        0x000016b4:    f000f888    ....    BL       _StoreChar ; 0x17c8
        0x000016b8:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000016bc:    2800        .(      CMP      r0,#0
        0x000016be:    dbea        ..      BLT      0x1696 ; _PrintInt + 96
        0x000016c0:    f0070003    ....    AND      r0,r7,#3
        0x000016c4:    2802        .(      CMP      r0,#2
        0x000016c6:    d10f        ..      BNE      0x16e8 ; _PrintInt + 178
        0x000016c8:    f1b90f00    ....    CMP      r9,#0
        0x000016cc:    d10c        ..      BNE      0x16e8 ; _PrintInt + 178
        0x000016ce:    b15c        \.      CBZ      r4,0x16e8 ; _PrintInt + 178
        0x000016d0:    42a5        .B      CMP      r5,r4
        0x000016d2:    d209        ..      BCS      0x16e8 ; _PrintInt + 178
        0x000016d4:    2130        0!      MOVS     r1,#0x30
        0x000016d6:    4640        @F      MOV      r0,r8
        0x000016d8:    1e64        d.      SUBS     r4,r4,#1
        0x000016da:    f000f875    ..u.    BL       _StoreChar ; 0x17c8
        0x000016de:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000016e2:    2800        .(      CMP      r0,#0
        0x000016e4:    daf3        ..      BGE      0x16ce ; _PrintInt + 152
        0x000016e6:    e7d6        ..      B        0x1696 ; _PrintInt + 96
        0x000016e8:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x000016ec:    464b        KF      MOV      r3,r9
        0x000016ee:    4652        RF      MOV      r2,r10
        0x000016f0:    4631        1F      MOV      r1,r6
        0x000016f2:    4640        @F      MOV      r0,r8
        0x000016f4:    f000f802    ....    BL       _PrintUnsigned ; 0x16fc
        0x000016f8:    e7cd        ..      B        0x1696 ; _PrintInt + 96
        0x000016fa:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x000016fc:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x00001700:    4682        .F      MOV      r10,r0
        0x00001702:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x00001706:    2501        .%      MOVS     r5,#1
        0x00001708:    4699        .F      MOV      r9,r3
        0x0000170a:    4617        .F      MOV      r7,r2
        0x0000170c:    4688        .F      MOV      r8,r1
        0x0000170e:    4608        .F      MOV      r0,r1
        0x00001710:    462e        .F      MOV      r6,r5
        0x00001712:    e002        ..      B        0x171a ; _PrintUnsigned + 30
        0x00001714:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x00001718:    1c76        v.      ADDS     r6,r6,#1
        0x0000171a:    42b8        .B      CMP      r0,r7
        0x0000171c:    d2fa        ..      BCS      0x1714 ; _PrintUnsigned + 24
        0x0000171e:    45b1        .E      CMP      r9,r6
        0x00001720:    d900        ..      BLS      0x1724 ; _PrintUnsigned + 40
        0x00001722:    464e        NF      MOV      r6,r9
        0x00001724:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00001728:    d117        ..      BNE      0x175a ; _PrintUnsigned + 94
        0x0000172a:    b1b4        ..      CBZ      r4,0x175a ; _PrintUnsigned + 94
        0x0000172c:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x00001730:    d502        ..      BPL      0x1738 ; _PrintUnsigned + 60
        0x00001732:    f1b90f00    ....    CMP      r9,#0
        0x00001736:    d002        ..      BEQ      0x173e ; _PrintUnsigned + 66
        0x00001738:    2020                MOVS     r0,#0x20
        0x0000173a:    9000        ..      STR      r0,[sp,#0]
        0x0000173c:    e00b        ..      B        0x1756 ; _PrintUnsigned + 90
        0x0000173e:    2030        0       MOVS     r0,#0x30
        0x00001740:    e7fb        ..      B        0x173a ; _PrintUnsigned + 62
        0x00001742:    4650        PF      MOV      r0,r10
        0x00001744:    1e64        d.      SUBS     r4,r4,#1
        0x00001746:    9900        ..      LDR      r1,[sp,#0]
        0x00001748:    f000f83e    ..>.    BL       _StoreChar ; 0x17c8
        0x0000174c:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001750:    2800        .(      CMP      r0,#0
        0x00001752:    db35        5.      BLT      0x17c0 ; _PrintUnsigned + 196
        0x00001754:    b10c        ..      CBZ      r4,0x175a ; _PrintUnsigned + 94
        0x00001756:    42a6        .B      CMP      r6,r4
        0x00001758:    d3f3        ..      BCC      0x1742 ; _PrintUnsigned + 70
        0x0000175a:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x0000175e:    2800        .(      CMP      r0,#0
        0x00001760:    db2e        ..      BLT      0x17c0 ; _PrintUnsigned + 196
        0x00001762:    f1b90f01    ....    CMP      r9,#1
        0x00001766:    d902        ..      BLS      0x176e ; _PrintUnsigned + 114
        0x00001768:    f1a90901    ....    SUB      r9,r9,#1
        0x0000176c:    e003        ..      B        0x1776 ; _PrintUnsigned + 122
        0x0000176e:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001772:    42b8        .B      CMP      r0,r7
        0x00001774:    d301        ..      BCC      0x177a ; _PrintUnsigned + 126
        0x00001776:    437d        }C      MULS     r5,r7,r5
        0x00001778:    e7f3        ..      B        0x1762 ; _PrintUnsigned + 102
        0x0000177a:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0x17c4] = 0x1c68
        0x0000177e:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x00001782:    fb008815    ....    MLS      r8,r0,r5,r8
        0x00001786:    f8191000    ....    LDRB     r1,[r9,r0]
        0x0000178a:    4650        PF      MOV      r0,r10
        0x0000178c:    f000f81c    ....    BL       _StoreChar ; 0x17c8
        0x00001790:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001794:    2800        .(      CMP      r0,#0
        0x00001796:    db03        ..      BLT      0x17a0 ; _PrintUnsigned + 164
        0x00001798:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x0000179c:    2d00        .-      CMP      r5,#0
        0x0000179e:    d1ee        ..      BNE      0x177e ; _PrintUnsigned + 130
        0x000017a0:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x000017a4:    d00c        ..      BEQ      0x17c0 ; _PrintUnsigned + 196
        0x000017a6:    2c00        .,      CMP      r4,#0
        0x000017a8:    d00a        ..      BEQ      0x17c0 ; _PrintUnsigned + 196
        0x000017aa:    42a6        .B      CMP      r6,r4
        0x000017ac:    d208        ..      BCS      0x17c0 ; _PrintUnsigned + 196
        0x000017ae:    2120         !      MOVS     r1,#0x20
        0x000017b0:    4650        PF      MOV      r0,r10
        0x000017b2:    1e64        d.      SUBS     r4,r4,#1
        0x000017b4:    f000f808    ....    BL       _StoreChar ; 0x17c8
        0x000017b8:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x000017bc:    2800        .(      CMP      r0,#0
        0x000017be:    daf2        ..      BGE      0x17a6 ; _PrintUnsigned + 170
        0x000017c0:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x000017c4:    00001c68    h...    DCD    7272
    $t
    i._StoreChar
    _StoreChar
        0x000017c8:    b510        ..      PUSH     {r4,lr}
        0x000017ca:    4604        .F      MOV      r4,r0
        0x000017cc:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x000017d0:    1c42        B.      ADDS     r2,r0,#1
        0x000017d2:    4293        .B      CMP      r3,r2
        0x000017d4:    d305        ..      BCC      0x17e2 ; _StoreChar + 26
        0x000017d6:    6823        #h      LDR      r3,[r4,#0]
        0x000017d8:    5419        .T      STRB     r1,[r3,r0]
        0x000017da:    60a2        .`      STR      r2,[r4,#8]
        0x000017dc:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000017de:    1c40        @.      ADDS     r0,r0,#1
        0x000017e0:    60e0        .`      STR      r0,[r4,#0xc]
        0x000017e2:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x000017e6:    4282        .B      CMP      r2,r0
        0x000017e8:    d109        ..      BNE      0x17fe ; _StoreChar + 54
        0x000017ea:    6821        !h      LDR      r1,[r4,#0]
        0x000017ec:    6920         i      LDR      r0,[r4,#0x10]
        0x000017ee:    f7fffd57    ..W.    BL       SEGGER_RTT_Write ; 0x12a0
        0x000017f2:    68a1        .h      LDR      r1,[r4,#8]
        0x000017f4:    4288        .B      CMP      r0,r1
        0x000017f6:    d003        ..      BEQ      0x1800 ; _StoreChar + 56
        0x000017f8:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x000017fc:    60e0        .`      STR      r0,[r4,#0xc]
        0x000017fe:    bd10        ..      POP      {r4,pc}
        0x00001800:    2000        .       MOVS     r0,#0
        0x00001802:    60a0        .`      STR      r0,[r4,#8]
        0x00001804:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x00001806:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0000180a:    68c4        .h      LDR      r4,[r0,#0xc]
        0x0000180c:    4617        .F      MOV      r7,r2
        0x0000180e:    4689        .F      MOV      r9,r1
        0x00001810:    4605        .F      MOV      r5,r0
        0x00001812:    f04f0800    O...    MOV      r8,#0
        0x00001816:    6928        (i      LDR      r0,[r5,#0x10]
        0x00001818:    42a0        .B      CMP      r0,r4
        0x0000181a:    d901        ..      BLS      0x1820 ; _WriteBlocking + 26
        0x0000181c:    1b06        ..      SUBS     r6,r0,r4
        0x0000181e:    e002        ..      B        0x1826 ; _WriteBlocking + 32
        0x00001820:    68a9        .h      LDR      r1,[r5,#8]
        0x00001822:    1a20         .      SUBS     r0,r4,r0
        0x00001824:    1a0e        ..      SUBS     r6,r1,r0
        0x00001826:    68a8        .h      LDR      r0,[r5,#8]
        0x00001828:    1e76        v.      SUBS     r6,r6,#1
        0x0000182a:    1b00        ..      SUBS     r0,r0,r4
        0x0000182c:    42b0        .B      CMP      r0,r6
        0x0000182e:    d800        ..      BHI      0x1832 ; _WriteBlocking + 44
        0x00001830:    4606        .F      MOV      r6,r0
        0x00001832:    42be        .B      CMP      r6,r7
        0x00001834:    d300        ..      BCC      0x1838 ; _WriteBlocking + 50
        0x00001836:    463e        >F      MOV      r6,r7
        0x00001838:    6868        hh      LDR      r0,[r5,#4]
        0x0000183a:    4632        2F      MOV      r2,r6
        0x0000183c:    4420         D      ADD      r0,r0,r4
        0x0000183e:    4649        IF      MOV      r1,r9
        0x00001840:    f7fefdd2    ....    BL       __aeabi_memcpy ; 0x3e8
        0x00001844:    68a8        .h      LDR      r0,[r5,#8]
        0x00001846:    1bbf        ..      SUBS     r7,r7,r6
        0x00001848:    4434        4D      ADD      r4,r4,r6
        0x0000184a:    44b0        .D      ADD      r8,r8,r6
        0x0000184c:    44b1        .D      ADD      r9,r9,r6
        0x0000184e:    42a0        .B      CMP      r0,r4
        0x00001850:    d100        ..      BNE      0x1854 ; _WriteBlocking + 78
        0x00001852:    2400        .$      MOVS     r4,#0
        0x00001854:    60ec        .`      STR      r4,[r5,#0xc]
        0x00001856:    2f00        ./      CMP      r7,#0
        0x00001858:    d1dd        ..      BNE      0x1816 ; _WriteBlocking + 16
        0x0000185a:    4640        @F      MOV      r0,r8
        0x0000185c:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001860:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00001864:    4604        .F      MOV      r4,r0
        0x00001866:    4688        .F      MOV      r8,r1
        0x00001868:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x0000186c:    1bc5        ..      SUBS     r5,r0,r7
        0x0000186e:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00001870:    6860        `h      LDR      r0,[r4,#4]
        0x00001872:    4616        .F      MOV      r6,r2
        0x00001874:    4408        .D      ADD      r0,r0,r1
        0x00001876:    42b5        .B      CMP      r5,r6
        0x00001878:    d906        ..      BLS      0x1888 ; _WriteNoCheck + 40
        0x0000187a:    4641        AF      MOV      r1,r8
        0x0000187c:    f7fefdb4    ....    BL       __aeabi_memcpy ; 0x3e8
        0x00001880:    19b8        ..      ADDS     r0,r7,r6
        0x00001882:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001884:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x00001888:    462a        *F      MOV      r2,r5
        0x0000188a:    4641        AF      MOV      r1,r8
        0x0000188c:    f7fefdac    ....    BL       __aeabi_memcpy ; 0x3e8
        0x00001890:    1b76        v.      SUBS     r6,r6,r5
        0x00001892:    eb080105    ....    ADD      r1,r8,r5
        0x00001896:    4632        2F      MOV      r2,r6
        0x00001898:    6860        `h      LDR      r0,[r4,#4]
        0x0000189a:    f7fefda5    ....    BL       __aeabi_memcpy ; 0x3e8
        0x0000189e:    60e6        .`      STR      r6,[r4,#0xc]
        0x000018a0:    e7f0        ..      B        0x1884 ; _WriteNoCheck + 36
        0x000018a2:    0000        ..      MOVS     r0,r0
    i.__aeabi_assert
    __aeabi_assert
        0x000018a4:    b672        r.      CPSID    i
        0x000018a6:    4603        .F      MOV      r3,r0
        0x000018a8:    a001        ..      ADR      r0,{pc}+8 ; 0x18b0
        0x000018aa:    f7fefccb    ....    BL       __2printf ; 0x244
        0x000018ae:    e7fe        ..      B        0x18ae ; __aeabi_assert + 10
    $d
        0x000018b0:    65737341    Asse    DCD    1702064961
        0x000018b4:    6f697472    rtio    DCD    1869182066
        0x000018b8:    6146206e    n Fa    DCD    1631985774
        0x000018bc:    64656c69    iled    DCD    1684368489
        0x000018c0:    6966203a    : fi    DCD    1768300602
        0x000018c4:    2520656c    le %    DCD    622880108
        0x000018c8:    6c202c73    s, l    DCD    1814047859
        0x000018cc:    20656e69    ine     DCD    543518313
        0x000018d0:    202c6425    %d,     DCD    539780133
        0x000018d4:    000a7325    %s..    DCD    684837
    $t
    i.fputc
    fputc
        0x000018d8:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x000018da:    2201        ."      MOVS     r2,#1
        0x000018dc:    4669        iF      MOV      r1,sp
        0x000018de:    2000        .       MOVS     r0,#0
        0x000018e0:    f7fffcde    ....    BL       SEGGER_RTT_Write ; 0x12a0
        0x000018e4:    9800        ..      LDR      r0,[sp,#0]
        0x000018e6:    bd1c        ..      POP      {r2-r4,pc}
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x000018e8:    4903        .I      LDR      r1,[pc,#12] ; [0x18f8] = 0x40007000
        0x000018ea:    6809        .h      LDR      r1,[r1,#0]
        0x000018ec:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000018f0:    4a01        .J      LDR      r2,[pc,#4] ; [0x18f8] = 0x40007000
        0x000018f2:    6011        .`      STR      r1,[r2,#0]
        0x000018f4:    4770        pG      BX       lr
    $d
        0x000018f6:    0000        ..      DCW    0
        0x000018f8:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x000018fc:    4903        .I      LDR      r1,[pc,#12] ; [0x190c] = 0x40007000
        0x000018fe:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001900:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001904:    4a01        .J      LDR      r2,[pc,#4] ; [0x190c] = 0x40007000
        0x00001906:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001908:    4770        pG      BX       lr
    $d
        0x0000190a:    0000        ..      DCW    0
        0x0000190c:    40007000    .p.@    DCD    1073770496
    $t
    i.i2c0_fs_scl_hcnt_setf
    i2c0_fs_scl_hcnt_setf
        0x00001910:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00001914:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x00001916:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000191a:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x0000191e:    61d1        .a      STR      r1,[r2,#0x1c]
        0x00001920:    4770        pG      BX       lr
    i.i2c0_fs_scl_lcnt_setf
    i2c0_fs_scl_lcnt_setf
        0x00001922:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00001926:    6a09        .j      LDR      r1,[r1,#0x20]
        0x00001928:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000192c:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00001930:    6211        .b      STR      r1,[r2,#0x20]
        0x00001932:    4770        pG      BX       lr
    i.i2c0_fs_spklen_getf
    i2c0_fs_spklen_getf
        0x00001934:    4801        .H      LDR      r0,[pc,#4] ; [0x193c] = 0x400040a0
        0x00001936:    6800        .h      LDR      r0,[r0,#0]
        0x00001938:    b2c0        ..      UXTB     r0,r0
        0x0000193a:    4770        pG      BX       lr
    $d
        0x0000193c:    400040a0    .@.@    DCD    1073758368
    $t
    i.i2c0_hs_scl_hcnt_setf
    i2c0_hs_scl_hcnt_setf
        0x00001940:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00001944:    6a49        Ij      LDR      r1,[r1,#0x24]
        0x00001946:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000194a:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x0000194e:    6251        Qb      STR      r1,[r2,#0x24]
        0x00001950:    4770        pG      BX       lr
    i.i2c0_hs_scl_lcnt_setf
    i2c0_hs_scl_lcnt_setf
        0x00001952:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00001956:    6a89        .j      LDR      r1,[r1,#0x28]
        0x00001958:    f360010f    `...    BFI      r1,r0,#0,#16
        0x0000195c:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00001960:    6291        .b      STR      r1,[r2,#0x28]
        0x00001962:    4770        pG      BX       lr
    i.i2c0_ic_data_cmd_pack
    i2c0_ic_data_cmd_pack
        0x00001964:    b530        0.      PUSH     {r4,r5,lr}
        0x00001966:    0284        ..      LSLS     r4,r0,#10
        0x00001968:    ea442441    D.A$    ORR      r4,r4,r1,LSL #9
        0x0000196c:    ea442402    D..$    ORR      r4,r4,r2,LSL #8
        0x00001970:    431c        .C      ORRS     r4,r4,r3
        0x00001972:    f04f2540    O.@%    MOV      r5,#0x40004000
        0x00001976:    612c        ,a      STR      r4,[r5,#0x10]
        0x00001978:    bd30        0.      POP      {r4,r5,pc}
    i.i2c0_ic_sda_rx_hold_setf
    i2c0_ic_sda_rx_hold_setf
        0x0000197a:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x0000197e:    6fc9        .o      LDR      r1,[r1,#0x7c]
        0x00001980:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x00001984:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x00001988:    67d1        .g      STR      r1,[r2,#0x7c]
        0x0000198a:    4770        pG      BX       lr
    i.i2c0_ic_sda_tx_hold_setf
    i2c0_ic_sda_tx_hold_setf
        0x0000198c:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x00001990:    6fc9        .o      LDR      r1,[r1,#0x7c]
        0x00001992:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001996:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x0000199a:    67d1        .g      STR      r1,[r2,#0x7c]
        0x0000199c:    4770        pG      BX       lr
    i.i2c0_ic_slave_disable_setf
    i2c0_ic_slave_disable_setf
        0x0000199e:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x000019a2:    6809        .h      LDR      r1,[r1,#0]
        0x000019a4:    f3601186    `...    BFI      r1,r0,#6,#1
        0x000019a8:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x000019ac:    6011        .`      STR      r1,[r2,#0]
        0x000019ae:    4770        pG      BX       lr
    i.i2c0_master_mode_setf
    i2c0_master_mode_setf
        0x000019b0:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x000019b4:    6809        .h      LDR      r1,[r1,#0]
        0x000019b6:    f3600100    `...    BFI      r1,r0,#0,#1
        0x000019ba:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x000019be:    6011        .`      STR      r1,[r2,#0]
        0x000019c0:    4770        pG      BX       lr
    i.i2c0_ss_scl_hcnt_setf
    i2c0_ss_scl_hcnt_setf
        0x000019c2:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x000019c6:    6949        Ii      LDR      r1,[r1,#0x14]
        0x000019c8:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000019cc:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x000019d0:    6151        Qa      STR      r1,[r2,#0x14]
        0x000019d2:    4770        pG      BX       lr
    i.i2c0_ss_scl_lcnt_setf
    i2c0_ss_scl_lcnt_setf
        0x000019d4:    f04f2140    O.@!    MOV      r1,#0x40004000
        0x000019d8:    6989        .i      LDR      r1,[r1,#0x18]
        0x000019da:    f360010f    `...    BFI      r1,r0,#0,#16
        0x000019de:    f04f2240    O.@"    MOV      r2,#0x40004000
        0x000019e2:    6191        .a      STR      r1,[r2,#0x18]
        0x000019e4:    4770        pG      BX       lr
    i.i2c0_txflr_getf
    i2c0_txflr_getf
        0x000019e6:    f04f2040    O.@     MOV      r0,#0x40004000
        0x000019ea:    6f40        @o      LDR      r0,[r0,#0x74]
        0x000019ec:    f000001f    ....    AND      r0,r0,#0x1f
        0x000019f0:    4770        pG      BX       lr
        0x000019f2:    0000        ..      MOVS     r0,r0
    i.main
    main
        0x000019f4:    a104        ..      ADR      r1,{pc}+0x14 ; 0x1a08
        0x000019f6:    2000        .       MOVS     r0,#0
        0x000019f8:    f7fffc9c    ....    BL       SEGGER_RTT_printf ; 0x1334
        0x000019fc:    f000f8fc    ....    BL       test_i2c0_oled ; 0x1bf8
        0x00001a00:    f000f8a8    ....    BL       test_gpio ; 0x1b54
        0x00001a04:    e7fe        ..      B        0x1a04 ; main + 16
    $d
        0x00001a06:    0000        ..      DCW    0
        0x00001a08:    20555043    CPU     DCD    542462019
        0x00001a0c:    72617473    star    DCD    1918989427
        0x00001a10:    2e2e2e74    t...    DCD    774778484
        0x00001a14:    00000a2e    ....    DCD    2606
    $t
    i.oled_fill
    oled_fill
        0x00001a18:    b570        p.      PUSH     {r4-r6,lr}
        0x00001a1a:    4606        .F      MOV      r6,r0
        0x00001a1c:    2500        .%      MOVS     r5,#0
        0x00001a1e:    f10500b0    ....    ADD      r0,r5,#0xb0
        0x00001a22:    b2c0        ..      UXTB     r0,r0
        0x00001a24:    f7fffdac    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a28:    2000        .       MOVS     r0,#0
        0x00001a2a:    f7fffda9    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a2e:    2010        .       MOVS     r0,#0x10
        0x00001a30:    f7fffda6    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a34:    2400        .$      MOVS     r4,#0
        0x00001a36:    4630        0F      MOV      r0,r6
        0x00001a38:    f7fffdb0    ....    BL       Write_IIC_Data ; 0x159c
        0x00001a3c:    1c64        d.      ADDS     r4,r4,#1
        0x00001a3e:    b2e4        ..      UXTB     r4,r4
        0x00001a40:    2c84        .,      CMP      r4,#0x84
        0x00001a42:    d3f8        ..      BCC      0x1a36 ; oled_fill + 30
        0x00001a44:    1c6d        m.      ADDS     r5,r5,#1
        0x00001a46:    b2ed        ..      UXTB     r5,r5
        0x00001a48:    2d08        .-      CMP      r5,#8
        0x00001a4a:    d3e8        ..      BCC      0x1a1e ; oled_fill + 6
        0x00001a4c:    bd70        p.      POP      {r4-r6,pc}
    i.oled_off
    oled_off
        0x00001a4e:    b510        ..      PUSH     {r4,lr}
        0x00001a50:    208d        .       MOVS     r0,#0x8d
        0x00001a52:    f7fffd95    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a56:    2010        .       MOVS     r0,#0x10
        0x00001a58:    f7fffd92    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a5c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001a60:    20ae        .       MOVS     r0,#0xae
        0x00001a62:    f7ffbd8d    ....    B.W      Write_IIC_Command ; 0x1580
    i.oled_on
    oled_on
        0x00001a66:    b510        ..      PUSH     {r4,lr}
        0x00001a68:    208d        .       MOVS     r0,#0x8d
        0x00001a6a:    f7fffd89    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a6e:    2014        .       MOVS     r0,#0x14
        0x00001a70:    f7fffd86    ....    BL       Write_IIC_Command ; 0x1580
        0x00001a74:    e8bd4010    ...@    POP      {r4,lr}
        0x00001a78:    20af        .       MOVS     r0,#0xaf
        0x00001a7a:    f7ffbd81    ....    B.W      Write_IIC_Command ; 0x1580
    i.oled_start_display
    oled_start_display
        0x00001a7e:    b510        ..      PUSH     {r4,lr}
        0x00001a80:    20ae        .       MOVS     r0,#0xae
        0x00001a82:    f7fffd7d    ..}.    BL       Write_IIC_Command ; 0x1580
        0x00001a86:    2020                MOVS     r0,#0x20
        0x00001a88:    f7fffd7a    ..z.    BL       Write_IIC_Command ; 0x1580
        0x00001a8c:    2010        .       MOVS     r0,#0x10
        0x00001a8e:    f7fffd77    ..w.    BL       Write_IIC_Command ; 0x1580
        0x00001a92:    20b0        .       MOVS     r0,#0xb0
        0x00001a94:    f7fffd74    ..t.    BL       Write_IIC_Command ; 0x1580
        0x00001a98:    20c8        .       MOVS     r0,#0xc8
        0x00001a9a:    f7fffd71    ..q.    BL       Write_IIC_Command ; 0x1580
        0x00001a9e:    2000        .       MOVS     r0,#0
        0x00001aa0:    f7fffd6e    ..n.    BL       Write_IIC_Command ; 0x1580
        0x00001aa4:    2010        .       MOVS     r0,#0x10
        0x00001aa6:    f7fffd6b    ..k.    BL       Write_IIC_Command ; 0x1580
        0x00001aaa:    2040        @       MOVS     r0,#0x40
        0x00001aac:    f7fffd68    ..h.    BL       Write_IIC_Command ; 0x1580
        0x00001ab0:    2081        .       MOVS     r0,#0x81
        0x00001ab2:    f7fffd65    ..e.    BL       Write_IIC_Command ; 0x1580
        0x00001ab6:    20df        .       MOVS     r0,#0xdf
        0x00001ab8:    f7fffd62    ..b.    BL       Write_IIC_Command ; 0x1580
        0x00001abc:    20a1        .       MOVS     r0,#0xa1
        0x00001abe:    f7fffd5f    .._.    BL       Write_IIC_Command ; 0x1580
        0x00001ac2:    20a6        .       MOVS     r0,#0xa6
        0x00001ac4:    f7fffd5c    ..\.    BL       Write_IIC_Command ; 0x1580
        0x00001ac8:    20a8        .       MOVS     r0,#0xa8
        0x00001aca:    f7fffd59    ..Y.    BL       Write_IIC_Command ; 0x1580
        0x00001ace:    203f        ?       MOVS     r0,#0x3f
        0x00001ad0:    f7fffd56    ..V.    BL       Write_IIC_Command ; 0x1580
        0x00001ad4:    20a4        .       MOVS     r0,#0xa4
        0x00001ad6:    f7fffd53    ..S.    BL       Write_IIC_Command ; 0x1580
        0x00001ada:    20d3        .       MOVS     r0,#0xd3
        0x00001adc:    f7fffd50    ..P.    BL       Write_IIC_Command ; 0x1580
        0x00001ae0:    2000        .       MOVS     r0,#0
        0x00001ae2:    f7fffd4d    ..M.    BL       Write_IIC_Command ; 0x1580
        0x00001ae6:    20d5        .       MOVS     r0,#0xd5
        0x00001ae8:    f7fffd4a    ..J.    BL       Write_IIC_Command ; 0x1580
        0x00001aec:    20f0        .       MOVS     r0,#0xf0
        0x00001aee:    f7fffd47    ..G.    BL       Write_IIC_Command ; 0x1580
        0x00001af2:    20d9        .       MOVS     r0,#0xd9
        0x00001af4:    f7fffd44    ..D.    BL       Write_IIC_Command ; 0x1580
        0x00001af8:    2022        "       MOVS     r0,#0x22
        0x00001afa:    f7fffd41    ..A.    BL       Write_IIC_Command ; 0x1580
        0x00001afe:    20da        .       MOVS     r0,#0xda
        0x00001b00:    f7fffd3e    ..>.    BL       Write_IIC_Command ; 0x1580
        0x00001b04:    2012        .       MOVS     r0,#0x12
        0x00001b06:    f7fffd3b    ..;.    BL       Write_IIC_Command ; 0x1580
        0x00001b0a:    20db        .       MOVS     r0,#0xdb
        0x00001b0c:    f7fffd38    ..8.    BL       Write_IIC_Command ; 0x1580
        0x00001b10:    2020                MOVS     r0,#0x20
        0x00001b12:    f7fffd35    ..5.    BL       Write_IIC_Command ; 0x1580
        0x00001b16:    208d        .       MOVS     r0,#0x8d
        0x00001b18:    f7fffd32    ..2.    BL       Write_IIC_Command ; 0x1580
        0x00001b1c:    2014        .       MOVS     r0,#0x14
        0x00001b1e:    f7fffd2f    ../.    BL       Write_IIC_Command ; 0x1580
        0x00001b22:    e8bd4010    ...@    POP      {r4,lr}
        0x00001b26:    20af        .       MOVS     r0,#0xaf
        0x00001b28:    f7ffbd2a    ..*.    B.W      Write_IIC_Command ; 0x1580
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001b2c:    4901        .I      LDR      r1,[pc,#4] ; [0x1b34] = 0x40020000
        0x00001b2e:    6008        .`      STR      r0,[r1,#0]
        0x00001b30:    4770        pG      BX       lr
    $d
        0x00001b32:    0000        ..      DCW    0
        0x00001b34:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001b38:    4903        .I      LDR      r1,[pc,#12] ; [0x1b48] = 0x40020000
        0x00001b3a:    6849        Ih      LDR      r1,[r1,#4]
        0x00001b3c:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001b40:    4a01        .J      LDR      r2,[pc,#4] ; [0x1b48] = 0x40020000
        0x00001b42:    6051        Q`      STR      r1,[r2,#4]
        0x00001b44:    4770        pG      BX       lr
    $d
        0x00001b46:    0000        ..      DCW    0
        0x00001b48:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_cpu_func_en_set
    sysc_cpu_func_en_set
        0x00001b4c:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00001b50:    6148        Ha      STR      r0,[r1,#0x14]
        0x00001b52:    4770        pG      BX       lr
    i.test_gpio
    test_gpio
        0x00001b54:    2001        .       MOVS     r0,#1
        0x00001b56:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001b5a:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00001b5e:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x00001b62:    460c        .F      MOV      r4,r1
        0x00001b64:    2010        .       MOVS     r0,#0x10
        0x00001b66:    f7fefe51    ..Q.    BL       HAL_GPIO_Init ; 0x80c
        0x00001b6a:    4621        !F      MOV      r1,r4
        0x00001b6c:    2011        .       MOVS     r0,#0x11
        0x00001b6e:    f7fefe4d    ..M.    BL       HAL_GPIO_Init ; 0x80c
        0x00001b72:    f44f777a    O.zw    MOV      r7,#0x3e8
        0x00001b76:    f2413688    A..6    MOV      r6,#0x1388
        0x00001b7a:    2101        .!      MOVS     r1,#1
        0x00001b7c:    2010        .       MOVS     r0,#0x10
        0x00001b7e:    f7feff05    ....    BL       HAL_GPIO_WritePin ; 0x98c
        0x00001b82:    2101        .!      MOVS     r1,#1
        0x00001b84:    2011        .       MOVS     r0,#0x11
        0x00001b86:    f7feff01    ....    BL       HAL_GPIO_WritePin ; 0x98c
        0x00001b8a:    4638        8F      MOV      r0,r7
        0x00001b8c:    4635        5F      MOV      r5,r6
        0x00001b8e:    1e6d        m.      SUBS     r5,r5,#1
        0x00001b90:    d1fd        ..      BNE      0x1b8e ; test_gpio + 58
        0x00001b92:    1e40        @.      SUBS     r0,r0,#1
        0x00001b94:    d1fa        ..      BNE      0x1b8c ; test_gpio + 56
        0x00001b96:    2100        .!      MOVS     r1,#0
        0x00001b98:    2010        .       MOVS     r0,#0x10
        0x00001b9a:    f7fefef7    ....    BL       HAL_GPIO_WritePin ; 0x98c
        0x00001b9e:    2100        .!      MOVS     r1,#0
        0x00001ba0:    2011        .       MOVS     r0,#0x11
        0x00001ba2:    f7fefef3    ....    BL       HAL_GPIO_WritePin ; 0x98c
        0x00001ba6:    4638        8F      MOV      r0,r7
        0x00001ba8:    4634        4F      MOV      r4,r6
        0x00001baa:    1e64        d.      SUBS     r4,r4,#1
        0x00001bac:    d1fd        ..      BNE      0x1baa ; test_gpio + 86
        0x00001bae:    1e40        @.      SUBS     r0,r0,#1
        0x00001bb0:    d1fa        ..      BNE      0x1ba8 ; test_gpio + 84
        0x00001bb2:    a002        ..      ADR      r0,{pc}+0xa ; 0x1bbc
        0x00001bb4:    f7fefb46    ..F.    BL       __2printf ; 0x244
        0x00001bb8:    e7df        ..      B        0x1b7a ; test_gpio + 38
    $d
        0x00001bba:    0000        ..      DCW    0
        0x00001bbc:    32666c45    Elf2    DCD    845573189
        0x00001bc0:    55434d20     MCU    DCD    1430474016
        0x00001bc4:    69755120     Qui    DCD    1769296160
        0x00001bc8:    74736b63    ckst    DCD    1953721187
        0x00001bcc:    20747261    art     DCD    544502369
        0x00001bd0:    6a6f7250    Proj    DCD    1785688656
        0x00001bd4:    7e746365    ect~    DCD    2121556837
        0x00001bd8:    0000000a    ....    DCD    10
    $t
    i.test_i2c0_iomux
    test_i2c0_iomux
        0x00001bdc:    b510        ..      PUSH     {r4,lr}
        0x00001bde:    2201        ."      MOVS     r2,#1
        0x00001be0:    2107        .!      MOVS     r1,#7
        0x00001be2:    2008        .       MOVS     r0,#8
        0x00001be4:    f7fff8f9    ....    BL       HAL_SYSCON_Function_IO_Set ; 0xdda
        0x00001be8:    2201        ."      MOVS     r2,#1
        0x00001bea:    2106        .!      MOVS     r1,#6
        0x00001bec:    e8bd4010    ...@    POP      {r4,lr}
        0x00001bf0:    2009        .       MOVS     r0,#9
        0x00001bf2:    f7ffb8f2    ....    B        HAL_SYSCON_Function_IO_Set ; 0xdda
        0x00001bf6:    0000        ..      MOVS     r0,r0
    i.test_i2c0_oled
    test_i2c0_oled
        0x00001bf8:    b538        8.      PUSH     {r3-r5,lr}
        0x00001bfa:    f7ffffef    ....    BL       test_i2c0_iomux ; 0x1bdc
        0x00001bfe:    2000        .       MOVS     r0,#0
        0x00001c00:    2301        .#      MOVS     r3,#1
        0x00001c02:    4601        .F      MOV      r1,r0
        0x00001c04:    f3630107    c...    BFI      r1,r3,#0,#8
        0x00001c08:    2278        x"      MOVS     r2,#0x78
        0x00001c0a:    f362411f    b..A    BFI      r1,r2,#16,#16
        0x00001c0e:    4602        .F      MOV      r2,r0
        0x00001c10:    f3600207    `...    BFI      r2,r0,#0,#8
        0x00001c14:    2402        .$      MOVS     r4,#2
        0x00001c16:    f364220f    d.."    BFI      r2,r4,#8,#8
        0x00001c1a:    f363621f    c..b    BFI      r2,r3,#24,#8
        0x00001c1e:    f3604217    `..B    BFI      r2,r0,#16,#8
        0x00001c22:    4603        .F      MOV      r3,r0
        0x00001c24:    480e        .H      LDR      r0,[pc,#56] ; [0x1c60] = 0x17d7840
        0x00001c26:    f7feff06    ....    BL       HAL_I2C0_Init ; 0xa36
        0x00001c2a:    2100        .!      MOVS     r1,#0
        0x00001c2c:    4608        .F      MOV      r0,r1
        0x00001c2e:    f7feff29    ..).    BL       HAL_I2C0_Int_Threshold_Set ; 0xa84
        0x00001c32:    f7ffff24    ..$.    BL       oled_start_display ; 0x1a7e
        0x00001c36:    2000        .       MOVS     r0,#0
        0x00001c38:    f7fffeee    ....    BL       oled_fill ; 0x1a18
        0x00001c3c:    20ff        .       MOVS     r0,#0xff
        0x00001c3e:    f7fffeeb    ....    BL       oled_fill ; 0x1a18
        0x00001c42:    4808        .H      LDR      r0,[pc,#32] ; [0x1c64] = 0x20000008
        0x00001c44:    2100        .!      MOVS     r1,#0
        0x00001c46:    9000        ..      STR      r0,[sp,#0]
        0x00001c48:    2308        .#      MOVS     r3,#8
        0x00001c4a:    2280        ."      MOVS     r2,#0x80
        0x00001c4c:    4608        .F      MOV      r0,r1
        0x00001c4e:    f7fffad9    ....    BL       OLED_DrawBMP ; 0x1204
        0x00001c52:    f7fffefc    ....    BL       oled_off ; 0x1a4e
        0x00001c56:    e8bd4038    ..8@    POP      {r3-r5,lr}
        0x00001c5a:    f7ffbf04    ....    B.W      oled_on ; 0x1a66
    $d
        0x00001c5e:    0000        ..      DCW    0
        0x00001c60:    017d7840    @x}.    DCD    25000000
        0x00001c64:    20000008    ...     DCD    536870920
    $d.realdata
    .constdata
    _aV2C
        0x00001c68:    33323130    0123    DCD    858927408
        0x00001c6c:    37363534    4567    DCD    926299444
        0x00001c70:    42413938    89AB    DCD    1111570744
        0x00001c74:    46454443    CDEF    DCD    1178944579
    Region$$Table$$Base
        0x00001c78:    00001c98    ....    DCD    7320
        0x00001c7c:    20000000    ...     DCD    536870912
        0x00001c80:    00000408    ....    DCD    1032
        0x00001c84:    00000154    T...    DCD    340
        0x00001c88:    00001e2c    ,...    DCD    7724
        0x00001c8c:    20000408    ...     DCD    536871944
        0x00001c90:    00000a18    ....    DCD    2584
        0x00001c94:    000001b0    ....    DCD    432
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 7372 (0x1ccc)
    Size        : 404 bytes (0x194)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 4
    Entry Size  : 0


====================================

** Section #5

    Name        : RW_IRAM0
    Type        : SHT_NOBITS (0x00000008)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000408
    File Offset : 7776 (0x1e60)
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
    File Offset : 7776 (0x1e60)
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
    File Offset : 9252 (0x2424)
    Size        : 3476 bytes (0xd94)
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
    File Offset : 12728 (0x31b8)
    Size        : 101116 bytes (0x18afc)
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
    File Offset : 113844 (0x1bcb4)
    Size        : 16000 bytes (0x3e80)
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
    File Offset : 129844 (0x1fb34)
    Size        : 6724 bytes (0x1a44)
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
    File Offset : 136568 (0x21578)
    Size        : 6080 bytes (0x17c0)
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
    File Offset : 142648 (0x22d38)
    Size        : 2554 bytes (0x9fa)
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
    File Offset : 145204 (0x23734)
    Size        : 9424 bytes (0x24d0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 418
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 154628 (0x25c04)
    Size        : 8392 bytes (0x20c8)
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
    File Offset : 163020 (0x27ccc)
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
    File Offset : 163056 (0x27cf0)
    Size        : 14012 bytes (0x36bc)
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
    ArmCC --c99 --split_sections --debug -c -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\main.crf src\main.c
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\system_elf2.o --vfemode=force

    Input Comments:
    
    p63f4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p63f4-2
    
    
    
    system_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\system_elf2.o --depend=.\objects\system_elf2.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\system_elf2.crf ..\..\..\ELF2_BSP\Device\ELF2\Source\system_elf2.c
    
    
    
    startup_elf2.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    ArmAsm --debug --xref --diag_suppress=9931 --cpu=Cortex-M3 --apcs=interwork --depend=.\objects\startup_elf2.d  -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil
    
    
    int_register.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\int_register.o --depend=.\objects\int_register.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\int_register.crf ..\..\..\ELF2_BSP\Driver\int_register.c
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\intc.o --vfemode=force

    Input Comments:
    
    p63a8-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p63a8-2
    
    
    
    intc.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\intc.o --depend=.\objects\intc.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\intc.crf ..\..\..\ELF2_BSP\Driver\intc.c
    
    
    
    
    
    debug.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\debug.o --depend=.\objects\debug.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\debug.crf ..\..\..\ELF2_BSP\Debug\debug.c
    
    log.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\log.o --depend=.\objects\log.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\log.crf ..\..\..\ELF2_BSP\Debug\log.c
    
    segger_rtt.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt.o --depend=.\objects\segger_rtt.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT.c
    
    segger_rtt_printf.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\segger_rtt_printf.o --depend=.\objects\segger_rtt_printf.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\segger_rtt_printf.crf ..\..\..\ELF2_BSP\Debug\RTT\SEGGER_RTT_printf.c
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_gpio.o --vfemode=force

    Input Comments:
    
    p4c34-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4c34-2
    
    
    
    test_gpio.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    
    
    test_i2c.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_i2c.o --vfemode=force

    Input Comments:
    
    p4df4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4df4-2
    
    
    
    test_i2c.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_i2c.o --depend=.\objects\test_i2c.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -IG:\ELF2_SOC_Shanghai\trunk\Demo\I2C_Demo\KEIL\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\test_i2c.crf src\test_i2c.c
    
    
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
    
    
    
    
    
    i2c0.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armlink [4d0f33]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\i2c0.o --vfemode=force

    Input Comments:
    
    p4ca4-3
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: armasm [4d0f2f]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide  C:\Users\ADMINI~1\AppData\Local\Temp\p4ca4-2
    
    
    
    i2c0.o
    
    Component: ARM Compiler 5.05 update 2 (build 169) Tool: ArmCC [4d0f38]
    ArmCC --c99 --split_sections --debug -c -o.\objects\i2c0.o --depend=.\objects\i2c0.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -IF:\SVN_ELF2_SOC\Build_Lib\release0309\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.3.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=515 -DARMCM3 --omf_browse=.\objects\i2c0.crf ..\sdk\src\soc\driver\i2c0.c
    
    
    
    
    
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
    File Offset : 177068 (0x2b3ac)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x20000008  0x400      BMP1                                     array[1024] of unsigned char

address     size       variable name                            type
0x00000000  0xb        env                                      i2s_env_t
0x00000000  0xa        env.buf                                  array[10] of uint8_t
0x0000000a  0x1        env.offset                               uint8_t

address     size       variable name                            type
0x00000000  0x1        _ActiveTerminal                          char

address     size       variable name                            type
0x20000408  0xa8       _SEGGER_RTT                              SEGGER_RTT_CB
0x20000408  0x10       _SEGGER_RTT.acID                         array[16] of char
0x20000418  0x4        _SEGGER_RTT.MaxNumUpBuffers              int
0x2000041c  0x4        _SEGGER_RTT.MaxNumDownBuffers            int
0x20000420  0x48       _SEGGER_RTT.aUp                          array[3] of SEGGER_RTT_BUFFER_UP
0x20000468  0x48       _SEGGER_RTT.aDown                        array[3] of SEGGER_RTT_BUFFER_DOWN

address     size       variable name                            type
0x00000000  0x10       _aTerminalId                             array[16] of unsigned char

address     size       variable name                            type
0x200008b0  0x10       _acDownBuffer                            array[16] of char

address     size       variable name                            type
0x200004b0  0x400      _acUpBuffer                              array[1024] of char

address     size       variable name                            type
0x20000004  0x4        __stdout                                 FILE
0x20000004  0x4        __stdout.handle                          int

address     size       variable name                            type
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

