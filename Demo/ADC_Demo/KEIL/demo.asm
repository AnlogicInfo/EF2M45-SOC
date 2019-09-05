
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

    Program header offset: 234644 (0x00039494)
    Section header offset: 234676 (0x000394b4)

    Section header string table index: 17

========================================================================

** Program header #0

    Type          : PT_LOAD (1)
    File Offset   : 52 (0x34)
    Virtual Addr  : 0x00000000
    Physical Addr : 0x00000000
    Size in file  : 7240 bytes (0x1c48)
    Size in memory: 9892 bytes (0x26a4)
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
    Size        : 6948 bytes (0x1b24)
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
        0x0000014c:    00001ad0    ....    DCD    6864
        0x00000150:    00001af0    ....    DCD    6896
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
        0x0000018e:    f000806f    ..o.    BEQ.W    _printf_int_dec ; 0x270
    .ARM.Collect$$_printf_percent$$00000014
    _printf_s
        0x00000192:    2973        s)      CMP      r1,#0x73
        0x00000194:    f000822d    ..-.    BEQ.W    _printf_string ; 0x5f2
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
        0x000001a4:    f000fab4    ....    BL       __user_setup_stackheap ; 0x710
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
        0x000001ae:    f001fc69    ..i.    BL       main ; 0x1a84
        0x000001b2:    f000fad2    ....    BL       exit ; 0x75a
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
        0x000001be:    f000f9a7    ....    BL       _sys_exit ; 0x510
        0x000001c2:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x000001c4:    4809        .H      LDR      r0,[pc,#36] ; [0x1ec] = 0x1435
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
        0x000001e0:    4804        .H      LDR      r0,[pc,#16] ; [0x1f4] = 0x20000568
        0x000001e2:    4905        .I      LDR      r1,[pc,#20] ; [0x1f8] = 0x20000a68
        0x000001e4:    4a05        .J      LDR      r2,[pc,#20] ; [0x1fc] = 0x20000668
        0x000001e6:    4b06        .K      LDR      r3,[pc,#24] ; [0x200] = 0x20000668
        0x000001e8:    4770        pG      BX       lr
    $d
        0x000001ea:    0000        ..      DCW    0
        0x000001ec:    00001435    5...    DCD    5173
        0x000001f0:    00000119    ....    DCD    281
        0x000001f4:    20000568    h..     DCD    536872296
        0x000001f8:    20000a68    h..     DCD    536873576
        0x000001fc:    20000668    h..     DCD    536872552
        0x00000200:    20000668    h..     DCD    536872552
    $t
    .text
    __2printf
        0x00000204:    b40f        ..      PUSH     {r0-r3}
        0x00000206:    4904        .I      LDR      r1,[pc,#16] ; [0x218] = 0x20000004
        0x00000208:    b510        ..      PUSH     {r4,lr}
        0x0000020a:    aa03        ..      ADD      r2,sp,#0xc
        0x0000020c:    9802        ..      LDR      r0,[sp,#8]
        0x0000020e:    f000f9f5    ....    BL       _printf_char_file ; 0x5fc
        0x00000212:    bc10        ..      POP      {r4}
        0x00000214:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    $d
        0x00000218:    20000004    ...     DCD    536870916
    $t
    .text
    _printf_str
        0x0000021c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000021e:    460c        .F      MOV      r4,r1
        0x00000220:    4605        .F      MOV      r5,r0
        0x00000222:    2a01        .*      CMP      r2,#1
        0x00000224:    d005        ..      BEQ      0x232 ; _printf_str + 22
        0x00000226:    7828        (x      LDRB     r0,[r5,#0]
        0x00000228:    0680        ..      LSLS     r0,r0,#26
        0x0000022a:    d500        ..      BPL      0x22e ; _printf_str + 18
        0x0000022c:    69ea        .i      LDR      r2,[r5,#0x1c]
        0x0000022e:    2300        .#      MOVS     r3,#0
        0x00000230:    e002        ..      B        0x238 ; _printf_str + 28
        0x00000232:    2301        .#      MOVS     r3,#1
        0x00000234:    e005        ..      B        0x242 ; _printf_str + 38
        0x00000236:    1c5b        [.      ADDS     r3,r3,#1
        0x00000238:    4293        .B      CMP      r3,r2
        0x0000023a:    d202        ..      BCS      0x242 ; _printf_str + 38
        0x0000023c:    5ce0        .\      LDRB     r0,[r4,r3]
        0x0000023e:    2800        .(      CMP      r0,#0
        0x00000240:    d1f9        ..      BNE      0x236 ; _printf_str + 26
        0x00000242:    69a8        .i      LDR      r0,[r5,#0x18]
        0x00000244:    18e6        ..      ADDS     r6,r4,r3
        0x00000246:    1ac0        ..      SUBS     r0,r0,r3
        0x00000248:    61a8        .a      STR      r0,[r5,#0x18]
        0x0000024a:    6a28        (j      LDR      r0,[r5,#0x20]
        0x0000024c:    4418        .D      ADD      r0,r0,r3
        0x0000024e:    6228        (b      STR      r0,[r5,#0x20]
        0x00000250:    4628        (F      MOV      r0,r5
        0x00000252:    f3af8000    ....    NOP.W    
        0x00000256:    e004        ..      B        0x262 ; _printf_str + 70
        0x00000258:    e9d52101    ...!    LDRD     r2,r1,[r5,#4]
        0x0000025c:    f8140b01    ....    LDRB     r0,[r4],#1
        0x00000260:    4790        .G      BLX      r2
        0x00000262:    42b4        .B      CMP      r4,r6
        0x00000264:    d3f8        ..      BCC      0x258 ; _printf_str + 60
        0x00000266:    4628        (F      MOV      r0,r5
        0x00000268:    f3af8000    ....    NOP.W    
        0x0000026c:    bd70        p.      POP      {r4-r6,pc}
        0x0000026e:    0000        ..      MOVS     r0,r0
    .text
    _printf_int_dec
        0x00000270:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000274:    4606        .F      MOV      r6,r0
        0x00000276:    2400        .$      MOVS     r4,#0
        0x00000278:    6810        .h      LDR      r0,[r2,#0]
        0x0000027a:    2975        u)      CMP      r1,#0x75
        0x0000027c:    4631        1F      MOV      r1,r6
        0x0000027e:    a516        ..      ADR      r5,{pc}+0x5a ; 0x2d8
        0x00000280:    d010        ..      BEQ      0x2a4 ; _printf_int_dec + 52
        0x00000282:    f3af8000    ....    NOP.W    
        0x00000286:    2800        .(      CMP      r0,#0
        0x00000288:    da02        ..      BGE      0x290 ; _printf_int_dec + 32
        0x0000028a:    4240        @B      RSBS     r0,r0,#0
        0x0000028c:    a513        ..      ADR      r5,{pc}+0x50 ; 0x2dc
        0x0000028e:    e007        ..      B        0x2a0 ; _printf_int_dec + 48
        0x00000290:    6831        1h      LDR      r1,[r6,#0]
        0x00000292:    078a        ..      LSLS     r2,r1,#30
        0x00000294:    d501        ..      BPL      0x29a ; _printf_int_dec + 42
        0x00000296:    a512        ..      ADR      r5,{pc}+0x4a ; 0x2e0
        0x00000298:    e002        ..      B        0x2a0 ; _printf_int_dec + 48
        0x0000029a:    0749        I.      LSLS     r1,r1,#29
        0x0000029c:    d504        ..      BPL      0x2a8 ; _printf_int_dec + 56
        0x0000029e:    a511        ..      ADR      r5,{pc}+0x46 ; 0x2e4
        0x000002a0:    2401        .$      MOVS     r4,#1
        0x000002a2:    e001        ..      B        0x2a8 ; _printf_int_dec + 56
        0x000002a4:    f3af8000    ....    NOP.W    
        0x000002a8:    2100        .!      MOVS     r1,#0
        0x000002aa:    220a        ."      MOVS     r2,#0xa
        0x000002ac:    f1060724    ..$.    ADD      r7,r6,#0x24
        0x000002b0:    e009        ..      B        0x2c6 ; _printf_int_dec + 86
        0x000002b2:    fbb0fcf2    ....    UDIV     r12,r0,r2
        0x000002b6:    fbb0f3f2    ....    UDIV     r3,r0,r2
        0x000002ba:    fb02001c    ....    MLS      r0,r2,r12,r0
        0x000002be:    3030        00      ADDS     r0,r0,#0x30
        0x000002c0:    5478        xT      STRB     r0,[r7,r1]
        0x000002c2:    4618        .F      MOV      r0,r3
        0x000002c4:    1c49        I.      ADDS     r1,r1,#1
        0x000002c6:    2800        .(      CMP      r0,#0
        0x000002c8:    d1f3        ..      BNE      0x2b2 ; _printf_int_dec + 66
        0x000002ca:    4623        #F      MOV      r3,r4
        0x000002cc:    462a        *F      MOV      r2,r5
        0x000002ce:    4630        0F      MOV      r0,r6
        0x000002d0:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x000002d4:    f000b922    ..".    B.W      _printf_int_common ; 0x51c
    $d
        0x000002d8:    00000000    ....    DCD    0
        0x000002dc:    0000002d    -...    DCD    45
        0x000002e0:    0000002b    +...    DCD    43
        0x000002e4:    00000020     ...    DCD    32
    $t
    .text
    __printf
        0x000002e8:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x000002ec:    4689        .F      MOV      r9,r1
        0x000002ee:    4604        .F      MOV      r4,r0
        0x000002f0:    f04f0a00    O...    MOV      r10,#0
        0x000002f4:    f8dfb124    ..$.    LDR      r11,[pc,#292] ; [0x41c] = 0x190c
        0x000002f8:    44fb        .D      ADD      r11,r11,pc
        0x000002fa:    f8c0a020    .. .    STR      r10,[r0,#0x20]
        0x000002fe:    4620         F      MOV      r0,r4
        0x00000300:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000302:    4788        .G      BLX      r1
        0x00000304:    2800        .(      CMP      r0,#0
        0x00000306:    d07d        }.      BEQ      0x404 ; __printf + 284
        0x00000308:    2825        %(      CMP      r0,#0x25
        0x0000030a:    d006        ..      BEQ      0x31a ; __printf + 50
        0x0000030c:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000310:    4790        .G      BLX      r2
        0x00000312:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000314:    1c40        @.      ADDS     r0,r0,#1
        0x00000316:    6220         b      STR      r0,[r4,#0x20]
        0x00000318:    e7f1        ..      B        0x2fe ; __printf + 22
        0x0000031a:    2500        .%      MOVS     r5,#0
        0x0000031c:    465f        _F      MOV      r7,r11
        0x0000031e:    4620         F      MOV      r0,r4
        0x00000320:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000322:    4788        .G      BLX      r1
        0x00000324:    2820         (      CMP      r0,#0x20
        0x00000326:    4606        .F      MOV      r6,r0
        0x00000328:    db07        ..      BLT      0x33a ; __printf + 82
        0x0000032a:    2e31        1.      CMP      r6,#0x31
        0x0000032c:    d205        ..      BCS      0x33a ; __printf + 82
        0x0000032e:    19b8        ..      ADDS     r0,r7,r6
        0x00000330:    f8100c20    .. .    LDRB     r0,[r0,#-0x20]
        0x00000334:    b108        ..      CBZ      r0,0x33a ; __printf + 82
        0x00000336:    4305        .C      ORRS     r5,r5,r0
        0x00000338:    e7f1        ..      B        0x31e ; __printf + 54
        0x0000033a:    07a8        ..      LSLS     r0,r5,#30
        0x0000033c:    d501        ..      BPL      0x342 ; __printf + 90
        0x0000033e:    f0250504    %...    BIC      r5,r5,#4
        0x00000342:    f8c4a01c    ....    STR      r10,[r4,#0x1c]
        0x00000346:    2700        .'      MOVS     r7,#0
        0x00000348:    f8c4a018    ....    STR      r10,[r4,#0x18]
        0x0000034c:    2e2a        *.      CMP      r6,#0x2a
        0x0000034e:    d009        ..      BEQ      0x364 ; __printf + 124
        0x00000350:    4630        0F      MOV      r0,r6
        0x00000352:    f001fa59    ..Y.    BL       _is_digit ; 0x1808
        0x00000356:    b338        8.      CBZ      r0,0x3a8 ; __printf + 192
        0x00000358:    eb040887    ....    ADD      r8,r4,r7,LSL #2
        0x0000035c:    3e30        0>      SUBS     r6,r6,#0x30
        0x0000035e:    f8c86018    ...`    STR      r6,[r8,#0x18]
        0x00000362:    e019        ..      B        0x398 ; __printf + 176
        0x00000364:    f8591b04    Y...    LDR      r1,[r9],#4
        0x00000368:    4620         F      MOV      r0,r4
        0x0000036a:    eb040287    ....    ADD      r2,r4,r7,LSL #2
        0x0000036e:    6191        .a      STR      r1,[r2,#0x18]
        0x00000370:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00000372:    4788        .G      BLX      r1
        0x00000374:    2f01        ./      CMP      r7,#1
        0x00000376:    4606        .F      MOV      r6,r0
        0x00000378:    d118        ..      BNE      0x3ac ; __printf + 196
        0x0000037a:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x0000037c:    2800        .(      CMP      r0,#0
        0x0000037e:    da20         .      BGE      0x3c2 ; __printf + 218
        0x00000380:    f0250520    %. .    BIC      r5,r5,#0x20
        0x00000384:    e01d        ..      B        0x3c2 ; __printf + 218
        0x00000386:    f8d80018    ....    LDR      r0,[r8,#0x18]
        0x0000038a:    eb000080    ....    ADD      r0,r0,r0,LSL #2
        0x0000038e:    eb060040    ..@.    ADD      r0,r6,r0,LSL #1
        0x00000392:    3830        08      SUBS     r0,r0,#0x30
        0x00000394:    f8c80018    ....    STR      r0,[r8,#0x18]
        0x00000398:    4620         F      MOV      r0,r4
        0x0000039a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x0000039c:    4788        .G      BLX      r1
        0x0000039e:    4606        .F      MOV      r6,r0
        0x000003a0:    f001fa32    ..2.    BL       _is_digit ; 0x1808
        0x000003a4:    2800        .(      CMP      r0,#0
        0x000003a6:    d1ee        ..      BNE      0x386 ; __printf + 158
        0x000003a8:    2f01        ./      CMP      r7,#1
        0x000003aa:    d00a        ..      BEQ      0x3c2 ; __printf + 218
        0x000003ac:    2e2e        ..      CMP      r6,#0x2e
        0x000003ae:    d108        ..      BNE      0x3c2 ; __printf + 218
        0x000003b0:    4620         F      MOV      r0,r4
        0x000003b2:    68e1        .h      LDR      r1,[r4,#0xc]
        0x000003b4:    4788        .G      BLX      r1
        0x000003b6:    1c7f        ..      ADDS     r7,r7,#1
        0x000003b8:    4606        .F      MOV      r6,r0
        0x000003ba:    2f02        ./      CMP      r7,#2
        0x000003bc:    f0450520    E. .    ORR      r5,r5,#0x20
        0x000003c0:    dbc4        ..      BLT      0x34c ; __printf + 100
        0x000003c2:    69a0        .i      LDR      r0,[r4,#0x18]
        0x000003c4:    2800        .(      CMP      r0,#0
        0x000003c6:    da03        ..      BGE      0x3d0 ; __printf + 232
        0x000003c8:    4240        @B      RSBS     r0,r0,#0
        0x000003ca:    f0450501    E...    ORR      r5,r5,#1
        0x000003ce:    61a0        .a      STR      r0,[r4,#0x18]
        0x000003d0:    07e8        ..      LSLS     r0,r5,#31
        0x000003d2:    d001        ..      BEQ      0x3d8 ; __printf + 240
        0x000003d4:    f0250510    %...    BIC      r5,r5,#0x10
        0x000003d8:    b1a6        ..      CBZ      r6,0x404 ; __printf + 284
        0x000003da:    f1a60041    ..A.    SUB      r0,r6,#0x41
        0x000003de:    2819        .(      CMP      r0,#0x19
        0x000003e0:    d802        ..      BHI      0x3e8 ; __printf + 256
        0x000003e2:    3620         6      ADDS     r6,r6,#0x20
        0x000003e4:    f4456500    E..e    ORR      r5,r5,#0x800
        0x000003e8:    464a        JF      MOV      r2,r9
        0x000003ea:    4631        1F      MOV      r1,r6
        0x000003ec:    4620         F      MOV      r0,r4
        0x000003ee:    6025        %`      STR      r5,[r4,#0]
        0x000003f0:    464d        MF      MOV      r5,r9
        0x000003f2:    f7fffecb    ....    BL       _printf_d ; 0x18c
        0x000003f6:    b160        `.      CBZ      r0,0x412 ; __printf + 298
        0x000003f8:    2801        .(      CMP      r0,#1
        0x000003fa:    d007        ..      BEQ      0x40c ; __printf + 292
        0x000003fc:    1ded        ..      ADDS     r5,r5,#7
        0x000003fe:    f0250007    %...    BIC      r0,r5,#7
        0x00000402:    e000        ..      B        0x406 ; __printf + 286
        0x00000404:    e007        ..      B        0x416 ; __printf + 302
        0x00000406:    f1000908    ....    ADD      r9,r0,#8
        0x0000040a:    e778        x.      B        0x2fe ; __printf + 22
        0x0000040c:    f1050904    ....    ADD      r9,r5,#4
        0x00000410:    e775        u.      B        0x2fe ; __printf + 22
        0x00000412:    4630        0F      MOV      r0,r6
        0x00000414:    e77a        z.      B        0x30c ; __printf + 36
        0x00000416:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000418:    e8bd9ff0    ....    POP      {r4-r12,pc}
    $d
        0x0000041c:    0000190c    ....    DCD    6412
    $t
    .text
    abort
        0x00000420:    b510        ..      PUSH     {r4,lr}
        0x00000422:    2000        .       MOVS     r0,#0
        0x00000424:    f000f8fc    ....    BL       __rt_SIGABRT ; 0x620
        0x00000428:    f7fffeba    ....    BL       __rt_lib_shutdown ; 0x1a0
        0x0000042c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000430:    2001        .       MOVS     r0,#1
        0x00000432:    f000b86d    ..m.    B.W      _sys_exit ; 0x510
    .text
    strcpy
        0x00000436:    ea400301    @...    ORR      r3,r0,r1
        0x0000043a:    4602        .F      MOV      r2,r0
        0x0000043c:    b530        0.      PUSH     {r4,r5,lr}
        0x0000043e:    079b        ..      LSLS     r3,r3,#30
        0x00000440:    d110        ..      BNE      0x464 ; strcpy + 46
        0x00000442:    f04f3401    O..4    MOV      r4,#0x1010101
        0x00000446:    e000        ..      B        0x44a ; strcpy + 20
        0x00000448:    c208        ..      STM      r2!,{r3}
        0x0000044a:    c908        ..      LDM      r1!,{r3}
        0x0000044c:    1b1d        ..      SUBS     r5,r3,r4
        0x0000044e:    439d        .C      BICS     r5,r5,r3
        0x00000450:    ea151fc4    ....    TST      r5,r4,LSL #7
        0x00000454:    d0f8        ..      BEQ      0x448 ; strcpy + 18
        0x00000456:    f01301ff    ....    ANDS     r1,r3,#0xff
        0x0000045a:    f8021b01    ....    STRB     r1,[r2],#1
        0x0000045e:    d00d        ..      BEQ      0x47c ; strcpy + 70
        0x00000460:    0a1b        ..      LSRS     r3,r3,#8
        0x00000462:    e7f8        ..      B        0x456 ; strcpy + 32
        0x00000464:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000468:    2b00        .+      CMP      r3,#0
        0x0000046a:    f8023b01    ...;    STRB     r3,[r2],#1
        0x0000046e:    d005        ..      BEQ      0x47c ; strcpy + 70
        0x00000470:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000474:    2b00        .+      CMP      r3,#0
        0x00000476:    f8023b01    ...;    STRB     r3,[r2],#1
        0x0000047a:    d1f3        ..      BNE      0x464 ; strcpy + 46
        0x0000047c:    bd30        0.      POP      {r4,r5,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x0000047e:    2a03        .*      CMP      r2,#3
        0x00000480:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x4e4
        0x00000484:    f0100c03    ....    ANDS     r12,r0,#3
        0x00000488:    f0008015    ....    BEQ.W    0x4b6 ; __aeabi_memcpy + 56
        0x0000048c:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x00000490:    f1bc0f02    ....    CMP      r12,#2
        0x00000494:    4462        bD      ADD      r2,r2,r12
        0x00000496:    bf98        ..      IT       LS
        0x00000498:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x0000049c:    f8003b01    ...;    STRB     r3,[r0],#1
        0x000004a0:    bf38        8.      IT       CC
        0x000004a2:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x000004a6:    f1a20204    ....    SUB      r2,r2,#4
        0x000004aa:    bf98        ..      IT       LS
        0x000004ac:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x000004b0:    bf38        8.      IT       CC
        0x000004b2:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x000004b6:    f0110303    ....    ANDS     r3,r1,#3
        0x000004ba:    f00080b8    ....    BEQ.W    __aeabi_memcpy4 ; 0x62e
        0x000004be:    3a08        .:      SUBS     r2,r2,#8
        0x000004c0:    f0c08008    ....    BCC.W    0x4d4 ; __aeabi_memcpy + 86
        0x000004c4:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x000004c8:    3a08        .:      SUBS     r2,r2,#8
        0x000004ca:    f851cb04    Q...    LDR      r12,[r1],#4
        0x000004ce:    e8a01008    ....    STM      r0!,{r3,r12}
        0x000004d2:    e7f5        ..      B        0x4c0 ; __aeabi_memcpy + 66
        0x000004d4:    1d12        ..      ADDS     r2,r2,#4
        0x000004d6:    bf5c        \.      ITT      PL
        0x000004d8:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x000004dc:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x000004e0:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x000004e4:    07d2        ..      LSLS     r2,r2,#31
        0x000004e6:    bf24        $.      ITT      CS
        0x000004e8:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x000004ec:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x000004f0:    bf48        H.      IT       MI
        0x000004f2:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x000004f6:    bf24        $.      ITT      CS
        0x000004f8:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x000004fc:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x00000500:    bf48        H.      IT       MI
        0x00000502:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000506:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x00000508:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x0000050a:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x0000050c:    4770        pG      BX       lr
        0x0000050e:    0000        ..      MOVS     r0,r0
    .text
    _sys_exit
        0x00000510:    4901        .I      LDR      r1,[pc,#4] ; [0x518] = 0x20026
        0x00000512:    2018        .       MOVS     r0,#0x18
        0x00000514:    beab        ..      BKPT     #0xab
        0x00000516:    e7fe        ..      B        0x516 ; _sys_exit + 6
    $d
        0x00000518:    00020026    &...    DCD    131110
    $t
    .text
    _printf_int_common
        0x0000051c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00000520:    460d        .F      MOV      r5,r1
        0x00000522:    4699        .F      MOV      r9,r3
        0x00000524:    4692        .F      MOV      r10,r2
        0x00000526:    4604        .F      MOV      r4,r0
        0x00000528:    f1000824    ..$.    ADD      r8,r0,#0x24
        0x0000052c:    6801        .h      LDR      r1,[r0,#0]
        0x0000052e:    0688        ..      LSLS     r0,r1,#26
        0x00000530:    d504        ..      BPL      0x53c ; _printf_int_common + 32
        0x00000532:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x00000534:    f0210110    !...    BIC      r1,r1,#0x10
        0x00000538:    6021        !`      STR      r1,[r4,#0]
        0x0000053a:    e000        ..      B        0x53e ; _printf_int_common + 34
        0x0000053c:    2001        .       MOVS     r0,#1
        0x0000053e:    42a8        .B      CMP      r0,r5
        0x00000540:    dd01        ..      BLE      0x546 ; _printf_int_common + 42
        0x00000542:    1b47        G.      SUBS     r7,r0,r5
        0x00000544:    e000        ..      B        0x548 ; _printf_int_common + 44
        0x00000546:    2700        .'      MOVS     r7,#0
        0x00000548:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0000054a:    197a        z.      ADDS     r2,r7,r5
        0x0000054c:    eb020009    ....    ADD      r0,r2,r9
        0x00000550:    1a08        ..      SUBS     r0,r1,r0
        0x00000552:    61a0        .a      STR      r0,[r4,#0x18]
        0x00000554:    7820         x      LDRB     r0,[r4,#0]
        0x00000556:    06c0        ..      LSLS     r0,r0,#27
        0x00000558:    d402        ..      BMI      0x560 ; _printf_int_common + 68
        0x0000055a:    4620         F      MOV      r0,r4
        0x0000055c:    f3af8000    ....    NOP.W    
        0x00000560:    2600        .&      MOVS     r6,#0
        0x00000562:    e008        ..      B        0x576 ; _printf_int_common + 90
        0x00000564:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x00000568:    f81a0006    ....    LDRB     r0,[r10,r6]
        0x0000056c:    4790        .G      BLX      r2
        0x0000056e:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000570:    1c40        @.      ADDS     r0,r0,#1
        0x00000572:    1c76        v.      ADDS     r6,r6,#1
        0x00000574:    6220         b      STR      r0,[r4,#0x20]
        0x00000576:    454e        NE      CMP      r6,r9
        0x00000578:    dbf4        ..      BLT      0x564 ; _printf_int_common + 72
        0x0000057a:    7820         x      LDRB     r0,[r4,#0]
        0x0000057c:    06c0        ..      LSLS     r0,r0,#27
        0x0000057e:    d50a        ..      BPL      0x596 ; _printf_int_common + 122
        0x00000580:    4620         F      MOV      r0,r4
        0x00000582:    f3af8000    ....    NOP.W    
        0x00000586:    e006        ..      B        0x596 ; _printf_int_common + 122
        0x00000588:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x0000058c:    2030        0       MOVS     r0,#0x30
        0x0000058e:    4790        .G      BLX      r2
        0x00000590:    6a20         j      LDR      r0,[r4,#0x20]
        0x00000592:    1c40        @.      ADDS     r0,r0,#1
        0x00000594:    6220         b      STR      r0,[r4,#0x20]
        0x00000596:    1e38        8.      SUBS     r0,r7,#0
        0x00000598:    f1a70701    ....    SUB      r7,r7,#1
        0x0000059c:    dcf4        ..      BGT      0x588 ; _printf_int_common + 108
        0x0000059e:    e007        ..      B        0x5b0 ; _printf_int_common + 148
        0x000005a0:    e9d42101    ...!    LDRD     r2,r1,[r4,#4]
        0x000005a4:    f8180005    ....    LDRB     r0,[r8,r5]
        0x000005a8:    4790        .G      BLX      r2
        0x000005aa:    6a20         j      LDR      r0,[r4,#0x20]
        0x000005ac:    1c40        @.      ADDS     r0,r0,#1
        0x000005ae:    6220         b      STR      r0,[r4,#0x20]
        0x000005b0:    1e28        (.      SUBS     r0,r5,#0
        0x000005b2:    f1a50501    ....    SUB      r5,r5,#1
        0x000005b6:    dcf3        ..      BGT      0x5a0 ; _printf_int_common + 132
        0x000005b8:    4620         F      MOV      r0,r4
        0x000005ba:    f3af8000    ....    NOP.W    
        0x000005be:    7820         x      LDRB     r0,[r4,#0]
        0x000005c0:    0600        ..      LSLS     r0,r0,#24
        0x000005c2:    d502        ..      BPL      0x5ca ; _printf_int_common + 174
        0x000005c4:    2002        .       MOVS     r0,#2
        0x000005c6:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x000005ca:    2001        .       MOVS     r0,#1
        0x000005cc:    e7fb        ..      B        0x5c6 ; _printf_int_common + 170
    .text
    _printf_cs_common
        0x000005ce:    b510        ..      PUSH     {r4,lr}
        0x000005d0:    6943        Ci      LDR      r3,[r0,#0x14]
        0x000005d2:    b113        ..      CBZ      r3,0x5da ; _printf_cs_common + 12
        0x000005d4:    f3af8000    ....    NOP.W    
        0x000005d8:    e001        ..      B        0x5de ; _printf_cs_common + 16
        0x000005da:    f7fffe1f    ....    BL       _printf_str ; 0x21c
        0x000005de:    2001        .       MOVS     r0,#1
        0x000005e0:    bd10        ..      POP      {r4,pc}
    _printf_char
        0x000005e2:    7812        .x      LDRB     r2,[r2,#0]
        0x000005e4:    f1000124    ..$.    ADD      r1,r0,#0x24
        0x000005e8:    700a        .p      STRB     r2,[r1,#0]
        0x000005ea:    2200        ."      MOVS     r2,#0
        0x000005ec:    704a        Jp      STRB     r2,[r1,#1]
        0x000005ee:    2201        ."      MOVS     r2,#1
        0x000005f0:    e7ed        ..      B        _printf_cs_common ; 0x5ce
    _printf_string
        0x000005f2:    6811        .h      LDR      r1,[r2,#0]
        0x000005f4:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x000005f8:    e7e9        ..      B        _printf_cs_common ; 0x5ce
        0x000005fa:    0000        ..      MOVS     r0,r0
    .text
    _printf_char_file
        0x000005fc:    4b07        .K      LDR      r3,[pc,#28] ; [0x61c] = 0x142b
        0x000005fe:    b570        p.      PUSH     {r4-r6,lr}
        0x00000600:    460d        .F      MOV      r5,r1
        0x00000602:    447b        {D      ADD      r3,r3,pc
        0x00000604:    f000f84b    ..K.    BL       _printf_char_common ; 0x69e
        0x00000608:    4604        .F      MOV      r4,r0
        0x0000060a:    4628        (F      MOV      r0,r5
        0x0000060c:    f000f85a    ..Z.    BL       ferror ; 0x6c4
        0x00000610:    b110        ..      CBZ      r0,0x618 ; _printf_char_file + 28
        0x00000612:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00000616:    bd70        p.      POP      {r4-r6,pc}
        0x00000618:    4620         F      MOV      r0,r4
        0x0000061a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000061c:    0000142b    +...    DCD    5163
    $t
    .text
    __rt_SIGABRT
        0x00000620:    b510        ..      PUSH     {r4,lr}
        0x00000622:    f000f859    ..Y.    BL       __rt_SIGABRT_inner ; 0x6d8
        0x00000626:    e8bd4010    ...@    POP      {r4,lr}
        0x0000062a:    f000b84f    ..O.    B.W      __sig_exit ; 0x6cc
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x0000062e:    b510        ..      PUSH     {r4,lr}
        0x00000630:    3a20         :      SUBS     r2,r2,#0x20
        0x00000632:    f0c0800b    ....    BCC.W    0x64c ; __aeabi_memcpy4 + 30
        0x00000636:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0000063a:    3a20         :      SUBS     r2,r2,#0x20
        0x0000063c:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000640:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x00000644:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x00000648:    f4bfaff5    ....    BCS.W    0x636 ; __aeabi_memcpy4 + 8
        0x0000064c:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x00000650:    bf24        $.      ITT      CS
        0x00000652:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x00000656:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x0000065a:    bf44        D.      ITT      MI
        0x0000065c:    c918        ..      LDMMI    r1!,{r3,r4}
        0x0000065e:    c018        ..      STMMI    r0!,{r3,r4}
        0x00000660:    e8bd4010    ...@    POP      {r4,lr}
        0x00000664:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x00000668:    bf24        $.      ITT      CS
        0x0000066a:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x0000066e:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x00000672:    bf08        ..      IT       EQ
        0x00000674:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x00000676:    07d2        ..      LSLS     r2,r2,#31
        0x00000678:    bf28        (.      IT       CS
        0x0000067a:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x0000067e:    bf48        H.      IT       MI
        0x00000680:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x00000684:    bf28        (.      IT       CS
        0x00000686:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x0000068a:    bf48        H.      IT       MI
        0x0000068c:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x00000690:    4770        pG      BX       lr
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x00000692:    4770        pG      BX       lr
    .text
    .text
    _printf_input_char
    __semihosting_library_function
        0x00000694:    6901        .i      LDR      r1,[r0,#0x10]
        0x00000696:    1c4a        J.      ADDS     r2,r1,#1
        0x00000698:    6102        .a      STR      r2,[r0,#0x10]
        0x0000069a:    7808        .x      LDRB     r0,[r1,#0]
        0x0000069c:    4770        pG      BX       lr
    _printf_char_common
        0x0000069e:    b500        ..      PUSH     {lr}
        0x000006a0:    b08f        ..      SUB      sp,sp,#0x3c
        0x000006a2:    e9cd3101    ...1    STRD     r3,r1,[sp,#4]
        0x000006a6:    2100        .!      MOVS     r1,#0
        0x000006a8:    9105        ..      STR      r1,[sp,#0x14]
        0x000006aa:    4905        .I      LDR      r1,[pc,#20] ; [0x6c0] = 0xffffffe5
        0x000006ac:    4479        yD      ADD      r1,r1,pc
        0x000006ae:    e9cd1003    ....    STRD     r1,r0,[sp,#0xc]
        0x000006b2:    4611        .F      MOV      r1,r2
        0x000006b4:    4668        hF      MOV      r0,sp
        0x000006b6:    f7fffe17    ....    BL       __printf ; 0x2e8
        0x000006ba:    b00f        ..      ADD      sp,sp,#0x3c
        0x000006bc:    bd00        ..      POP      {pc}
    $d
        0x000006be:    0000        ..      DCW    0
        0x000006c0:    ffffffe5    ....    DCD    4294967269
    $t
    .text
    ferror
        0x000006c4:    7b00        .{      LDRB     r0,[r0,#0xc]
        0x000006c6:    f0000080    ....    AND      r0,r0,#0x80
        0x000006ca:    4770        pG      BX       lr
    .text
    __sig_exit
        0x000006cc:    2800        .(      CMP      r0,#0
        0x000006ce:    d001        ..      BEQ      0x6d4 ; __sig_exit + 8
        0x000006d0:    f7ffbf1e    ....    B.W      _sys_exit ; 0x510
        0x000006d4:    4770        pG      BX       lr
        0x000006d6:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGABRT_inner
        0x000006d8:    b510        ..      PUSH     {r4,lr}
        0x000006da:    2100        .!      MOVS     r1,#0
        0x000006dc:    a002        ..      ADR      r0,{pc}+0xc ; 0x6e8
        0x000006de:    f000f845    ..E.    BL       __default_signal_display ; 0x76c
        0x000006e2:    2001        .       MOVS     r0,#1
        0x000006e4:    bd10        ..      POP      {r4,pc}
    $d
        0x000006e6:    0000        ..      DCW    0
        0x000006e8:    41474953    SIGA    DCD    1095190867
        0x000006ec:    3a545242    BRT:    DCD    978604610
        0x000006f0:    6e624120     Abn    DCD    1851932960
        0x000006f4:    616d726f    orma    DCD    1634562671
        0x000006f8:    6574206c    l te    DCD    1702109292
        0x000006fc:    6e696d72    rmin    DCD    1852403058
        0x00000700:    6f697461    atio    DCD    1869182049
        0x00000704:    0000006e    n...    DCD    110
    $t
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x00000708:    4800        .H      LDR      r0,[pc,#0] ; [0x70c] = 0x20000504
        0x0000070a:    4770        pG      BX       lr
    $d
        0x0000070c:    20000504    ...     DCD    536872196
    $t
    .text
    __user_setup_stackheap
        0x00000710:    4675        uF      MOV      r5,lr
        0x00000712:    f7fffff9    ....    BL       __user_libspace ; 0x708
        0x00000716:    46ae        .F      MOV      lr,r5
        0x00000718:    0005        ..      MOVS     r5,r0
        0x0000071a:    4669        iF      MOV      r1,sp
        0x0000071c:    4653        SF      MOV      r3,r10
        0x0000071e:    f0200007     ...    BIC      r0,r0,#7
        0x00000722:    4685        .F      MOV      sp,r0
        0x00000724:    b018        ..      ADD      sp,sp,#0x60
        0x00000726:    b520         .      PUSH     {r5,lr}
        0x00000728:    f7fffd5a    ..Z.    BL       __user_initial_stackheap ; 0x1e0
        0x0000072c:    e8bd4020    .. @    POP      {r5,lr}
        0x00000730:    f04f0600    O...    MOV      r6,#0
        0x00000734:    f04f0700    O...    MOV      r7,#0
        0x00000738:    f04f0800    O...    MOV      r8,#0
        0x0000073c:    f04f0b00    O...    MOV      r11,#0
        0x00000740:    f0210107    !...    BIC      r1,r1,#7
        0x00000744:    46ac        .F      MOV      r12,r5
        0x00000746:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000074a:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x0000074e:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000752:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x00000756:    468d        .F      MOV      sp,r1
        0x00000758:    4770        pG      BX       lr
    .text
    exit
        0x0000075a:    b510        ..      PUSH     {r4,lr}
        0x0000075c:    4604        .F      MOV      r4,r0
        0x0000075e:    f3af8000    ....    NOP.W    
        0x00000762:    4620         F      MOV      r0,r4
        0x00000764:    e8bd4010    ...@    POP      {r4,lr}
        0x00000768:    f7ffbd25    ..%.    B.W      __rt_exit ; 0x1b6
    .text
    __default_signal_display
        0x0000076c:    b570        p.      PUSH     {r4-r6,lr}
        0x0000076e:    4605        .F      MOV      r5,r0
        0x00000770:    460c        .F      MOV      r4,r1
        0x00000772:    200a        .       MOVS     r0,#0xa
        0x00000774:    e000        ..      B        0x778 ; __default_signal_display + 12
        0x00000776:    1c6d        m.      ADDS     r5,r5,#1
        0x00000778:    f000f811    ....    BL       _ttywrch ; 0x79e
        0x0000077c:    b135        5.      CBZ      r5,0x78c ; __default_signal_display + 32
        0x0000077e:    7828        (x      LDRB     r0,[r5,#0]
        0x00000780:    2800        .(      CMP      r0,#0
        0x00000782:    d1f8        ..      BNE      0x776 ; __default_signal_display + 10
        0x00000784:    e002        ..      B        0x78c ; __default_signal_display + 32
        0x00000786:    1c64        d.      ADDS     r4,r4,#1
        0x00000788:    f000f809    ....    BL       _ttywrch ; 0x79e
        0x0000078c:    b114        ..      CBZ      r4,0x794 ; __default_signal_display + 40
        0x0000078e:    7820         x      LDRB     r0,[r4,#0]
        0x00000790:    2800        .(      CMP      r0,#0
        0x00000792:    d1f8        ..      BNE      0x786 ; __default_signal_display + 26
        0x00000794:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x00000798:    200a        .       MOVS     r0,#0xa
        0x0000079a:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x0000079e:    b508        ..      PUSH     {r3,lr}
        0x000007a0:    4669        iF      MOV      r1,sp
        0x000007a2:    f88d0000    ....    STRB     r0,[sp,#0]
        0x000007a6:    2003        .       MOVS     r0,#3
        0x000007a8:    beab        ..      BKPT     #0xab
        0x000007aa:    bd08        ..      POP      {r3,pc}
    i.ADCC0_IRQHandler
    ADCC0_IRQHandler
        0x000007ac:    4905        .I      LDR      r1,[pc,#20] ; [0x7c4] = 0x88
        0x000007ae:    b510        ..      PUSH     {r4,lr}
        0x000007b0:    3128        (1      ADDS     r1,r1,#0x28
        0x000007b2:    d004        ..      BEQ      0x7be ; ADCC0_IRQHandler + 18
        0x000007b4:    6848        Hh      LDR      r0,[r1,#4]
        0x000007b6:    6809        .h      LDR      r1,[r1,#0]
        0x000007b8:    e8bd4010    ...@    POP      {r4,lr}
        0x000007bc:    4708        .G      BX       r1
        0x000007be:    f7fffe2f    ../.    BL       abort ; 0x420
    $d
        0x000007c2:    0000        ..      DCW    0
        0x000007c4:    00000088    ....    DCD    136
    $t
    i.ADCC1_IRQHandler
    ADCC1_IRQHandler
        0x000007c8:    4905        .I      LDR      r1,[pc,#20] ; [0x7e0] = 0x88
        0x000007ca:    b510        ..      PUSH     {r4,lr}
        0x000007cc:    3130        01      ADDS     r1,r1,#0x30
        0x000007ce:    d004        ..      BEQ      0x7da ; ADCC1_IRQHandler + 18
        0x000007d0:    6848        Hh      LDR      r0,[r1,#4]
        0x000007d2:    6809        .h      LDR      r1,[r1,#0]
        0x000007d4:    e8bd4010    ...@    POP      {r4,lr}
        0x000007d8:    4708        .G      BX       r1
        0x000007da:    f7fffe21    ..!.    BL       abort ; 0x420
    $d
        0x000007de:    0000        ..      DCW    0
        0x000007e0:    00000088    ....    DCD    136
    $t
    i.ADCC2_IRQHandler
    ADCC2_IRQHandler
        0x000007e4:    4905        .I      LDR      r1,[pc,#20] ; [0x7fc] = 0x88
        0x000007e6:    b510        ..      PUSH     {r4,lr}
        0x000007e8:    3138        81      ADDS     r1,r1,#0x38
        0x000007ea:    d004        ..      BEQ      0x7f6 ; ADCC2_IRQHandler + 18
        0x000007ec:    6848        Hh      LDR      r0,[r1,#4]
        0x000007ee:    6809        .h      LDR      r1,[r1,#0]
        0x000007f0:    e8bd4010    ...@    POP      {r4,lr}
        0x000007f4:    4708        .G      BX       r1
        0x000007f6:    f7fffe13    ....    BL       abort ; 0x420
    $d
        0x000007fa:    0000        ..      DCW    0
        0x000007fc:    00000088    ....    DCD    136
    $t
    i.ADCC3_IRQHandler
    ADCC3_IRQHandler
        0x00000800:    4905        .I      LDR      r1,[pc,#20] ; [0x818] = 0x88
        0x00000802:    b510        ..      PUSH     {r4,lr}
        0x00000804:    3140        @1      ADDS     r1,r1,#0x40
        0x00000806:    d004        ..      BEQ      0x812 ; ADCC3_IRQHandler + 18
        0x00000808:    6848        Hh      LDR      r0,[r1,#4]
        0x0000080a:    6809        .h      LDR      r1,[r1,#0]
        0x0000080c:    e8bd4010    ...@    POP      {r4,lr}
        0x00000810:    4708        .G      BX       r1
        0x00000812:    f7fffe05    ....    BL       abort ; 0x420
    $d
        0x00000816:    0000        ..      DCW    0
        0x00000818:    00000088    ....    DCD    136
    $t
    i.ADCC4_IRQHandler
    ADCC4_IRQHandler
        0x0000081c:    4905        .I      LDR      r1,[pc,#20] ; [0x834] = 0x88
        0x0000081e:    b510        ..      PUSH     {r4,lr}
        0x00000820:    3148        H1      ADDS     r1,r1,#0x48
        0x00000822:    d004        ..      BEQ      0x82e ; ADCC4_IRQHandler + 18
        0x00000824:    6848        Hh      LDR      r0,[r1,#4]
        0x00000826:    6809        .h      LDR      r1,[r1,#0]
        0x00000828:    e8bd4010    ...@    POP      {r4,lr}
        0x0000082c:    4708        .G      BX       r1
        0x0000082e:    f7fffdf7    ....    BL       abort ; 0x420
    $d
        0x00000832:    0000        ..      DCW    0
        0x00000834:    00000088    ....    DCD    136
    $t
    i.ADCC5_IRQHandler
    ADCC5_IRQHandler
        0x00000838:    4905        .I      LDR      r1,[pc,#20] ; [0x850] = 0x88
        0x0000083a:    b510        ..      PUSH     {r4,lr}
        0x0000083c:    3150        P1      ADDS     r1,r1,#0x50
        0x0000083e:    d004        ..      BEQ      0x84a ; ADCC5_IRQHandler + 18
        0x00000840:    6848        Hh      LDR      r0,[r1,#4]
        0x00000842:    6809        .h      LDR      r1,[r1,#0]
        0x00000844:    e8bd4010    ...@    POP      {r4,lr}
        0x00000848:    4708        .G      BX       r1
        0x0000084a:    f7fffde9    ....    BL       abort ; 0x420
    $d
        0x0000084e:    0000        ..      DCW    0
        0x00000850:    00000088    ....    DCD    136
    $t
    i.DMAC_IRQHandler
    DMAC_IRQHandler
        0x00000854:    4905        .I      LDR      r1,[pc,#20] ; [0x86c] = 0x88
        0x00000856:    b510        ..      PUSH     {r4,lr}
        0x00000858:    3118        .1      ADDS     r1,r1,#0x18
        0x0000085a:    d004        ..      BEQ      0x866 ; DMAC_IRQHandler + 18
        0x0000085c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000085e:    6809        .h      LDR      r1,[r1,#0]
        0x00000860:    e8bd4010    ...@    POP      {r4,lr}
        0x00000864:    4708        .G      BX       r1
        0x00000866:    f7fffddb    ....    BL       abort ; 0x420
    $d
        0x0000086a:    0000        ..      DCW    0
        0x0000086c:    00000088    ....    DCD    136
    $t
    i.DMAC_Int_Register
    DMAC_Int_Register
        0x00000870:    b510        ..      PUSH     {r4,lr}
        0x00000872:    b130        0.      CBZ      r0,0x882 ; DMAC_Int_Register + 18
        0x00000874:    460a        .F      MOV      r2,r1
        0x00000876:    4601        .F      MOV      r1,r0
        0x00000878:    e8bd4010    ...@    POP      {r4,lr}
        0x0000087c:    2003        .       MOVS     r0,#3
        0x0000087e:    f001b8f3    ....    B.W      int_callback_register ; 0x1a68
        0x00000882:    f7fffdcd    ....    BL       abort ; 0x420
        0x00000886:    0000        ..      MOVS     r0,r0
    i.EXT_IRQHandler
    EXT_IRQHandler
        0x00000888:    4905        .I      LDR      r1,[pc,#20] ; [0x8a0] = 0x88
        0x0000088a:    b510        ..      PUSH     {r4,lr}
        0x0000088c:    3108        .1      ADDS     r1,r1,#8
        0x0000088e:    d004        ..      BEQ      0x89a ; EXT_IRQHandler + 18
        0x00000890:    6848        Hh      LDR      r0,[r1,#4]
        0x00000892:    6809        .h      LDR      r1,[r1,#0]
        0x00000894:    e8bd4010    ...@    POP      {r4,lr}
        0x00000898:    4708        .G      BX       r1
        0x0000089a:    f7fffdc1    ....    BL       abort ; 0x420
    $d
        0x0000089e:    0000        ..      DCW    0
        0x000008a0:    00000088    ....    DCD    136
    $t
    i.GPIO_IRQHandler
    GPIO_IRQHandler
        0x000008a4:    4905        .I      LDR      r1,[pc,#20] ; [0x8bc] = 0x88
        0x000008a6:    b510        ..      PUSH     {r4,lr}
        0x000008a8:    3180        .1      ADDS     r1,r1,#0x80
        0x000008aa:    d004        ..      BEQ      0x8b6 ; GPIO_IRQHandler + 18
        0x000008ac:    6848        Hh      LDR      r0,[r1,#4]
        0x000008ae:    6809        .h      LDR      r1,[r1,#0]
        0x000008b0:    e8bd4010    ...@    POP      {r4,lr}
        0x000008b4:    4708        .G      BX       r1
        0x000008b6:    f7fffdb3    ....    BL       abort ; 0x420
    $d
        0x000008ba:    0000        ..      DCW    0
        0x000008bc:    00000088    ....    DCD    136
    $t
    i.HAL_ADCCM_ADC_Start
    HAL_ADCCM_ADC_Start
        0x000008c0:    b510        ..      PUSH     {r4,lr}
        0x000008c2:    2001        .       MOVS     r0,#1
        0x000008c4:    f000ffb4    ....    BL       adcc_m_adc_start_setf ; 0x1830
        0x000008c8:    bd10        ..      POP      {r4,pc}
    i.HAL_ADCCM_ADC_Stop
    HAL_ADCCM_ADC_Stop
        0x000008ca:    b510        ..      PUSH     {r4,lr}
        0x000008cc:    2000        .       MOVS     r0,#0
        0x000008ce:    f000ffaf    ....    BL       adcc_m_adc_start_setf ; 0x1830
        0x000008d2:    bd10        ..      POP      {r4,pc}
    i.HAL_ADCCM_DMA_En
    HAL_ADCCM_DMA_En
        0x000008d4:    bf00        ..      NOP      
        0x000008d6:    4904        .I      LDR      r1,[pc,#16] ; [0x8e8] = 0x40009000
        0x000008d8:    68c9        .h      LDR      r1,[r1,#0xc]
        0x000008da:    f3600100    `...    BFI      r1,r0,#0,#1
        0x000008de:    4a02        .J      LDR      r2,[pc,#8] ; [0x8e8] = 0x40009000
        0x000008e0:    60d1        .`      STR      r1,[r2,#0xc]
        0x000008e2:    bf00        ..      NOP      
        0x000008e4:    4770        pG      BX       lr
    $d
        0x000008e6:    0000        ..      DCW    0
        0x000008e8:    40009000    ...@    DCD    1073778688
    $t
    i.HAL_ADCCM_Init
    HAL_ADCCM_Init
        0x000008ec:    b537        7.      PUSH     {r0-r2,r4,r5,lr}
        0x000008ee:    4604        .F      MOV      r4,r0
        0x000008f0:    9801        ..      LDR      r0,[sp,#4]
        0x000008f2:    fbb4f0f0    ....    UDIV     r0,r4,r0
        0x000008f6:    2107        .!      MOVS     r1,#7
        0x000008f8:    ebb10f50    ..P.    CMP      r1,r0,LSR #1
        0x000008fc:    d300        ..      BCC      0x900 ; HAL_ADCCM_Init + 20
        0x000008fe:    e004        ..      B        0x90a ; HAL_ADCCM_Init + 30
        0x00000900:    224a        J"      MOVS     r2,#0x4a
        0x00000902:    a10c        ..      ADR      r1,{pc}+0x32 ; 0x934
        0x00000904:    a013        ..      ADR      r0,{pc}+0x50 ; 0x954
        0x00000906:    f000ff65    ..e.    BL       __aeabi_assert ; 0x17d4
        0x0000090a:    2001        .       MOVS     r0,#1
        0x0000090c:    f000ffc2    ....    BL       adcen_setf ; 0x1894
        0x00000910:    9801        ..      LDR      r0,[sp,#4]
        0x00000912:    fbb4f0f0    ....    UDIV     r0,r4,r0
        0x00000916:    f3c00547    ..G.    UBFX     r5,r0,#1,#8
        0x0000091a:    4628        (F      MOV      r0,r5
        0x0000091c:    f000ffd6    ....    BL       adcpre_setf ; 0x18cc
        0x00000920:    f89d0008    ....    LDRB     r0,[sp,#8]
        0x00000924:    4913        .I      LDR      r1,[pc,#76] ; [0x974] = 0x40009000
        0x00000926:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00000928:    f360218a    `..!    BFI      r1,r0,#10,#1
        0x0000092c:    4a11        .J      LDR      r2,[pc,#68] ; [0x974] = 0x40009000
        0x0000092e:    60d1        .`      STR      r1,[r2,#0xc]
        0x00000930:    bf00        ..      NOP      
        0x00000932:    bd3e        >.      POP      {r1-r5,pc}
    $d
        0x00000934:    735c2e2e    ..\s    DCD    1935420974
        0x00000938:    735c6b64    dk\s    DCD    1935436644
        0x0000093c:    735c6372    rc\s    DCD    1935434610
        0x00000940:    645c636f    oc\d    DCD    1683776367
        0x00000944:    65766972    rive    DCD    1702259058
        0x00000948:    64615c72    r\ad    DCD    1684102258
        0x0000094c:    6d5f6363    cc_m    DCD    1834967907
        0x00000950:    0000632e    .c..    DCD    25390
        0x00000954:    63727328    (src    DCD    1668444968
        0x00000958:    6b6c635f    _clk    DCD    1802265439
        0x0000095c:    6e6f632f    /con    DCD    1852793647
        0x00000960:    2e676966    fig.    DCD    778529126
        0x00000964:    5f636461    adc_    DCD    1600349281
        0x00000968:    296b6c63    clk)    DCD    694905955
        0x0000096c:    3c20322f    /2 <    DCD    1008742959
        0x00000970:    0037203d    = 7.    DCD    3612733
        0x00000974:    40009000    ...@    DCD    1073778688
    $t
    i.HAL_ADCCM_Set_ADC_Squence
    HAL_ADCCM_Set_ADC_Squence
        0x00000978:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x0000097c:    4606        .F      MOV      r6,r0
        0x0000097e:    4614        .F      MOV      r4,r2
        0x00000980:    461d        .F      MOV      r5,r3
        0x00000982:    af0e        ..      ADD      r7,sp,#0x38
        0x00000984:    e8970f80    ....    LDM      r7,{r7-r11}
        0x00000988:    1e71        q.      SUBS     r1,r6,#1
        0x0000098a:    b2c8        ..      UXTB     r0,r1
        0x0000098c:    f000ff6e    ..n.    BL       adcc_m_losq_setf ; 0x186c
        0x00000990:    9801        ..      LDR      r0,[sp,#4]
        0x00000992:    f000ff75    ..u.    BL       adcc_m_sq0_setf ; 0x1880
        0x00000996:    bf00        ..      NOP      
        0x00000998:    481d        .H      LDR      r0,[pc,#116] ; [0xa10] = 0x40009000
        0x0000099a:    6980        .i      LDR      r0,[r0,#0x18]
        0x0000099c:    f36400c5    d...    BFI      r0,r4,#3,#3
        0x000009a0:    491b        .I      LDR      r1,[pc,#108] ; [0xa10] = 0x40009000
        0x000009a2:    6188        .a      STR      r0,[r1,#0x18]
        0x000009a4:    bf00        ..      NOP      
        0x000009a6:    bf00        ..      NOP      
        0x000009a8:    4608        .F      MOV      r0,r1
        0x000009aa:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009ac:    f3651088    e...    BFI      r0,r5,#6,#3
        0x000009b0:    6188        .a      STR      r0,[r1,#0x18]
        0x000009b2:    bf00        ..      NOP      
        0x000009b4:    bf00        ..      NOP      
        0x000009b6:    4608        .F      MOV      r0,r1
        0x000009b8:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009ba:    f367204b    g.K     BFI      r0,r7,#9,#3
        0x000009be:    6188        .a      STR      r0,[r1,#0x18]
        0x000009c0:    bf00        ..      NOP      
        0x000009c2:    bf00        ..      NOP      
        0x000009c4:    4608        .F      MOV      r0,r1
        0x000009c6:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009c8:    f368300e    h..0    BFI      r0,r8,#12,#3
        0x000009cc:    6188        .a      STR      r0,[r1,#0x18]
        0x000009ce:    bf00        ..      NOP      
        0x000009d0:    bf00        ..      NOP      
        0x000009d2:    4608        .F      MOV      r0,r1
        0x000009d4:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009d6:    f36930d1    i..0    BFI      r0,r9,#15,#3
        0x000009da:    6188        .a      STR      r0,[r1,#0x18]
        0x000009dc:    bf00        ..      NOP      
        0x000009de:    bf00        ..      NOP      
        0x000009e0:    4608        .F      MOV      r0,r1
        0x000009e2:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009e4:    f36a4094    j..@    BFI      r0,r10,#18,#3
        0x000009e8:    6188        .a      STR      r0,[r1,#0x18]
        0x000009ea:    bf00        ..      NOP      
        0x000009ec:    bf00        ..      NOP      
        0x000009ee:    4608        .F      MOV      r0,r1
        0x000009f0:    6980        .i      LDR      r0,[r0,#0x18]
        0x000009f2:    f36b5057    k.WP    BFI      r0,r11,#21,#3
        0x000009f6:    6188        .a      STR      r0,[r1,#0x18]
        0x000009f8:    bf00        ..      NOP      
        0x000009fa:    2e01        ..      CMP      r6,#1
        0x000009fc:    dd03        ..      BLE      0xa06 ; HAL_ADCCM_Set_ADC_Squence + 142
        0x000009fe:    2001        .       MOVS     r0,#1
        0x00000a00:    f000ff2a    ..*.    BL       adcc_m_adsm_setf ; 0x1858
        0x00000a04:    e002        ..      B        0xa0c ; HAL_ADCCM_Set_ADC_Squence + 148
        0x00000a06:    2000        .       MOVS     r0,#0
        0x00000a08:    f000ff26    ..&.    BL       adcc_m_adsm_setf ; 0x1858
        0x00000a0c:    e8bd9fff    ....    POP      {r0-r12,pc}
    $d
        0x00000a10:    40009000    ...@    DCD    1073778688
    $t
    i.HAL_ADCCM_WorkMode
    HAL_ADCCM_WorkMode
        0x00000a14:    b510        ..      PUSH     {r4,lr}
        0x00000a16:    4604        .F      MOV      r4,r0
        0x00000a18:    4620         F      MOV      r0,r4
        0x00000a1a:    f000ff13    ....    BL       adcc_m_adcnt_setf ; 0x1844
        0x00000a1e:    bd10        ..      POP      {r4,pc}
    i.HAL_DMAC_Clr_Block
    HAL_DMAC_Clr_Block
        0x00000a20:    bf00        ..      NOP      
        0x00000a22:    4902        .I      LDR      r1,[pc,#8] ; [0xa2c] = 0x40010340
        0x00000a24:    6008        .`      STR      r0,[r1,#0]
        0x00000a26:    bf00        ..      NOP      
        0x00000a28:    4770        pG      BX       lr
    $d
        0x00000a2a:    0000        ..      DCW    0
        0x00000a2c:    40010340    @..@    DCD    1073808192
    $t
    i.HAL_DMAC_Init
    HAL_DMAC_Init
        0x00000a30:    e92d43f7    -..C    PUSH     {r0-r2,r4-r9,lr}
        0x00000a34:    b084        ..      SUB      sp,sp,#0x10
        0x00000a36:    4604        .F      MOV      r4,r0
        0x00000a38:    2001        .       MOVS     r0,#1
        0x00000a3a:    f000fff3    ....    BL       dmac_dmacfgreg_l_set ; 0x1a24
        0x00000a3e:    2c01        .,      CMP      r4,#1
        0x00000a40:    d14e        N.      BNE      0xae0 ; HAL_DMAC_Init + 176
        0x00000a42:    2001        .       MOVS     r0,#1
        0x00000a44:    2100        .!      MOVS     r1,#0
        0x00000a46:    9100        ..      STR      r1,[sp,#0]
        0x00000a48:    460b        .F      MOV      r3,r1
        0x00000a4a:    460a        .F      MOV      r2,r1
        0x00000a4c:    e9cd1001    ....    STRD     r1,r0,[sp,#4]
        0x00000a50:    4608        .F      MOV      r0,r1
        0x00000a52:    f000ff87    ....    BL       dmac_ch0_cfg_l_pack ; 0x1964
        0x00000a56:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000a5a:    b938        8.      CBNZ     r0,0xa6c ; HAL_DMAC_Init + 60
        0x00000a5c:    2000        .       MOVS     r0,#0
        0x00000a5e:    4603        .F      MOV      r3,r0
        0x00000a60:    2201        ."      MOVS     r2,#1
        0x00000a62:    4601        .F      MOV      r1,r0
        0x00000a64:    9000        ..      STR      r0,[sp,#0]
        0x00000a66:    f000ff6d    ..m.    BL       dmac_ch0_cfg_h_pack ; 0x1944
        0x00000a6a:    e025        %.      B        0xab8 ; HAL_DMAC_Init + 136
        0x00000a6c:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000a70:    2801        .(      CMP      r0,#1
        0x00000a72:    d109        ..      BNE      0xa88 ; HAL_DMAC_Init + 88
        0x00000a74:    2000        .       MOVS     r0,#0
        0x00000a76:    9000        ..      STR      r0,[sp,#0]
        0x00000a78:    f89d0014    ....    LDRB     r0,[sp,#0x14]
        0x00000a7c:    2300        .#      MOVS     r3,#0
        0x00000a7e:    2201        ."      MOVS     r2,#1
        0x00000a80:    4619        .F      MOV      r1,r3
        0x00000a82:    f000ff5f    .._.    BL       dmac_ch0_cfg_h_pack ; 0x1944
        0x00000a86:    e017        ..      B        0xab8 ; HAL_DMAC_Init + 136
        0x00000a88:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000a8c:    2802        .(      CMP      r0,#2
        0x00000a8e:    d108        ..      BNE      0xaa2 ; HAL_DMAC_Init + 114
        0x00000a90:    2000        .       MOVS     r0,#0
        0x00000a92:    9000        ..      STR      r0,[sp,#0]
        0x00000a94:    f89d1014    ....    LDRB     r1,[sp,#0x14]
        0x00000a98:    4603        .F      MOV      r3,r0
        0x00000a9a:    2201        ."      MOVS     r2,#1
        0x00000a9c:    f000ff52    ..R.    BL       dmac_ch0_cfg_h_pack ; 0x1944
        0x00000aa0:    e00a        ..      B        0xab8 ; HAL_DMAC_Init + 136
        0x00000aa2:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000aa6:    2802        .(      CMP      r0,#2
        0x00000aa8:    dc00        ..      BGT      0xaac ; HAL_DMAC_Init + 124
        0x00000aaa:    e004        ..      B        0xab6 ; HAL_DMAC_Init + 134
        0x00000aac:    2257        W"      MOVS     r2,#0x57
        0x00000aae:    a14b        K.      ADR      r1,{pc}+0x12e ; 0xbdc
        0x00000ab0:    a051        Q.      ADR      r0,{pc}+0x148 ; 0xbf8
        0x00000ab2:    f000fe8f    ....    BL       __aeabi_assert ; 0x17d4
        0x00000ab6:    bf00        ..      NOP      
        0x00000ab8:    f89d001a    ....    LDRB     r0,[sp,#0x1a]
        0x00000abc:    f89d1017    ....    LDRB     r1,[sp,#0x17]
        0x00000ac0:    f89d3019    ...0    LDRB     r3,[sp,#0x19]
        0x00000ac4:    e9cd3100    ...1    STRD     r3,r1,[sp,#0]
        0x00000ac8:    e9cd1002    ....    STRD     r1,r0,[sp,#8]
        0x00000acc:    f89d3018    ...0    LDRB     r3,[sp,#0x18]
        0x00000ad0:    f89d2016    ...     LDRB     r2,[sp,#0x16]
        0x00000ad4:    4611        .F      MOV      r1,r2
        0x00000ad6:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000ada:    f000ff63    ..c.    BL       dmac_ch0_ctrl_l_pack ; 0x19a4
        0x00000ade:    e07a        z.      B        0xbd6 ; HAL_DMAC_Init + 422
        0x00000ae0:    2c02        .,      CMP      r4,#2
        0x00000ae2:    d16f        o.      BNE      0xbc4 ; HAL_DMAC_Init + 404
        0x00000ae4:    2000        .       MOVS     r0,#0
        0x00000ae6:    4601        .F      MOV      r1,r0
        0x00000ae8:    4602        .F      MOV      r2,r0
        0x00000aea:    4603        .F      MOV      r3,r0
        0x00000aec:    4605        .F      MOV      r5,r0
        0x00000aee:    4606        .F      MOV      r6,r0
        0x00000af0:    4607        .F      MOV      r7,r0
        0x00000af2:    ea4f5c00    O..\    LSL      r12,r0,#20
        0x00000af6:    ea4c4cc1    L..L    ORR      r12,r12,r1,LSL #19
        0x00000afa:    ea4c4c82    L..L    ORR      r12,r12,r2,LSL #18
        0x00000afe:    ea4c2cc3    L..,    ORR      r12,r12,r3,LSL #11
        0x00000b02:    ea4c2c85    L..,    ORR      r12,r12,r5,LSL #10
        0x00000b06:    ea4c2c06    L..,    ORR      r12,r12,r6,LSL #8
        0x00000b0a:    ea4c1c47    L.G.    ORR      r12,r12,r7,LSL #5
        0x00000b0e:    f8df8120    .. .    LDR      r8,[pc,#288] ; [0xc30] = 0x40010000
        0x00000b12:    f8c8c098    ....    STR      r12,[r8,#0x98]
        0x00000b16:    bf00        ..      NOP      
        0x00000b18:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000b1c:    b938        8.      CBNZ     r0,0xb2e ; HAL_DMAC_Init + 254
        0x00000b1e:    2000        .       MOVS     r0,#0
        0x00000b20:    4603        .F      MOV      r3,r0
        0x00000b22:    2201        ."      MOVS     r2,#1
        0x00000b24:    4601        .F      MOV      r1,r0
        0x00000b26:    9000        ..      STR      r0,[sp,#0]
        0x00000b28:    f000ff64    ..d.    BL       dmac_ch1_cfg_h_pack ; 0x19f4
        0x00000b2c:    e025        %.      B        0xb7a ; HAL_DMAC_Init + 330
        0x00000b2e:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000b32:    2801        .(      CMP      r0,#1
        0x00000b34:    d109        ..      BNE      0xb4a ; HAL_DMAC_Init + 282
        0x00000b36:    2000        .       MOVS     r0,#0
        0x00000b38:    9000        ..      STR      r0,[sp,#0]
        0x00000b3a:    f89d0014    ....    LDRB     r0,[sp,#0x14]
        0x00000b3e:    2300        .#      MOVS     r3,#0
        0x00000b40:    2201        ."      MOVS     r2,#1
        0x00000b42:    4619        .F      MOV      r1,r3
        0x00000b44:    f000ff56    ..V.    BL       dmac_ch1_cfg_h_pack ; 0x19f4
        0x00000b48:    e017        ..      B        0xb7a ; HAL_DMAC_Init + 330
        0x00000b4a:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000b4e:    2802        .(      CMP      r0,#2
        0x00000b50:    d108        ..      BNE      0xb64 ; HAL_DMAC_Init + 308
        0x00000b52:    2000        .       MOVS     r0,#0
        0x00000b54:    9000        ..      STR      r0,[sp,#0]
        0x00000b56:    f89d1014    ....    LDRB     r1,[sp,#0x14]
        0x00000b5a:    4603        .F      MOV      r3,r0
        0x00000b5c:    2201        ."      MOVS     r2,#1
        0x00000b5e:    f000ff49    ..I.    BL       dmac_ch1_cfg_h_pack ; 0x19f4
        0x00000b62:    e00a        ..      B        0xb7a ; HAL_DMAC_Init + 330
        0x00000b64:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000b68:    2802        .(      CMP      r0,#2
        0x00000b6a:    dc00        ..      BGT      0xb6e ; HAL_DMAC_Init + 318
        0x00000b6c:    e004        ..      B        0xb78 ; HAL_DMAC_Init + 328
        0x00000b6e:    226c        l"      MOVS     r2,#0x6c
        0x00000b70:    a11a        ..      ADR      r1,{pc}+0x6c ; 0xbdc
        0x00000b72:    a021        !.      ADR      r0,{pc}+0x86 ; 0xbf8
        0x00000b74:    f000fe2e    ....    BL       __aeabi_assert ; 0x17d4
        0x00000b78:    bf00        ..      NOP      
        0x00000b7a:    f89d0015    ....    LDRB     r0,[sp,#0x15]
        0x00000b7e:    f89d1016    ....    LDRB     r1,[sp,#0x16]
        0x00000b82:    460a        .F      MOV      r2,r1
        0x00000b84:    f89d3018    ...0    LDRB     r3,[sp,#0x18]
        0x00000b88:    f89d5019    ...P    LDRB     r5,[sp,#0x19]
        0x00000b8c:    f89d6017    ...`    LDRB     r6,[sp,#0x17]
        0x00000b90:    4637        7F      MOV      r7,r6
        0x00000b92:    f89dc01a    ....    LDRB     r12,[sp,#0x1a]
        0x00000b96:    ea4f5800    O..X    LSL      r8,r0,#20
        0x00000b9a:    ea483881    H..8    ORR      r8,r8,r1,LSL #14
        0x00000b9e:    ea4828c2    H..(    ORR      r8,r8,r2,LSL #11
        0x00000ba2:    ea482843    H.C(    ORR      r8,r8,r3,LSL #9
        0x00000ba6:    ea4818c5    H...    ORR      r8,r8,r5,LSL #7
        0x00000baa:    ea481806    H...    ORR      r8,r8,r6,LSL #4
        0x00000bae:    ea480847    H.G.    ORR      r8,r8,r7,LSL #1
        0x00000bb2:    ea48080c    H...    ORR      r8,r8,r12
        0x00000bb6:    f8df9078    ..x.    LDR      r9,[pc,#120] ; [0xc30] = 0x40010000
        0x00000bba:    f8c98070    ..p.    STR      r8,[r9,#0x70]
        0x00000bbe:    bf00        ..      NOP      
        0x00000bc0:    e009        ..      B        0xbd6 ; HAL_DMAC_Init + 422
        0x00000bc2:    e7ff        ..      B        0xbc4 ; HAL_DMAC_Init + 404
        0x00000bc4:    2c02        .,      CMP      r4,#2
        0x00000bc6:    dc00        ..      BGT      0xbca ; HAL_DMAC_Init + 410
        0x00000bc8:    e004        ..      B        0xbd4 ; HAL_DMAC_Init + 420
        0x00000bca:    2271        q"      MOVS     r2,#0x71
        0x00000bcc:    a103        ..      ADR      r1,{pc}+0x10 ; 0xbdc
        0x00000bce:    a019        ..      ADR      r0,{pc}+0x66 ; 0xc34
        0x00000bd0:    f000fe00    ....    BL       __aeabi_assert ; 0x17d4
        0x00000bd4:    bf00        ..      NOP      
        0x00000bd6:    b007        ..      ADD      sp,sp,#0x1c
        0x00000bd8:    e8bd83f0    ....    POP      {r4-r9,pc}
    $d
        0x00000bdc:    735c2e2e    ..\s    DCD    1935420974
        0x00000be0:    735c6b64    dk\s    DCD    1935436644
        0x00000be4:    735c6372    rc\s    DCD    1935434610
        0x00000be8:    645c636f    oc\d    DCD    1683776367
        0x00000bec:    65766972    rive    DCD    1702259058
        0x00000bf0:    6d645c72    r\dm    DCD    1835293810
        0x00000bf4:    00632e61    a.c.    DCD    6499937
        0x00000bf8:    666e6f63    conf    DCD    1718513507
        0x00000bfc:    742e6769    ig.t    DCD    1949198185
        0x00000c00:    3c657079    ype<    DCD    1013280889
        0x00000c04:    7265503d    =Per    DCD    1919242301
        0x00000c08:    65687069    iphe    DCD    1701343337
        0x00000c0c:    5f6c6172    ral_    DCD    1600938354
        0x00000c10:    4d5f6f74    to_M    DCD    1298100084
        0x00000c14:    726f6d65    emor    DCD    1919905125
        0x00000c18:    4d445f79    y_DM    DCD    1296326521
        0x00000c1c:    465f4341    AC_F    DCD    1180648257
        0x00000c20:    5f776f6c    low_    DCD    1601662828
        0x00000c24:    746e6f43    Cont    DCD    1953394499
        0x00000c28:    6c6c6f72    roll    DCD    1819045746
        0x00000c2c:    00007265    er..    DCD    29285
        0x00000c30:    40010000    ...@    DCD    1073807360
        0x00000c34:    695f6863    ch_i    DCD    1767860323
        0x00000c38:    3c207864    dx <    DCD    1008760932
        0x00000c3c:    4d44203d    = DM    DCD    1296310333
        0x00000c40:    435f4341    AC_C    DCD    1130316609
        0x00000c44:    4e4e4148    HANN    DCD    1313751368
        0x00000c48:    315f4c45    EL_1    DCD    828329029
        0x00000c4c:    00000000    ....    DCD    0
    $t
    i.HAL_DMAC_Int_Status
    HAL_DMAC_Int_Status
        0x00000c50:    bf00        ..      NOP      
        0x00000c52:    4802        .H      LDR      r0,[pc,#8] ; [0xc5c] = 0x40010360
        0x00000c54:    6800        .h      LDR      r0,[r0,#0]
        0x00000c56:    b2c0        ..      UXTB     r0,r0
        0x00000c58:    4770        pG      BX       lr
    $d
        0x00000c5a:    0000        ..      DCW    0
        0x00000c5c:    40010360    `..@    DCD    1073808224
    $t
    i.HAL_DMAC_Start_Transfer
    HAL_DMAC_Start_Transfer
        0x00000c60:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x00000c64:    4606        .F      MOV      r6,r0
        0x00000c66:    460c        .F      MOV      r4,r1
        0x00000c68:    4615        .F      MOV      r5,r2
        0x00000c6a:    461f        .F      MOV      r7,r3
        0x00000c6c:    2e01        ..      CMP      r6,#1
        0x00000c6e:    d10e        ..      BNE      0xc8e ; HAL_DMAC_Start_Transfer + 46
        0x00000c70:    4620         F      MOV      r0,r4
        0x00000c72:    f000feb9    ....    BL       dmac_ch0_sar_l_set ; 0x19e8
        0x00000c76:    4628        (F      MOV      r0,r5
        0x00000c78:    f000feb0    ....    BL       dmac_ch0_dar_l_set ; 0x19dc
        0x00000c7c:    b2b9        ..      UXTH     r1,r7
        0x00000c7e:    2000        .       MOVS     r0,#0
        0x00000c80:    f000fe88    ....    BL       dmac_ch0_ctrl_h_pack ; 0x1994
        0x00000c84:    2101        .!      MOVS     r1,#1
        0x00000c86:    4608        .F      MOV      r0,r1
        0x00000c88:    f000fec4    ....    BL       dmac_chenreg_l_pack ; 0x1a14
        0x00000c8c:    e01d        ..      B        0xcca ; HAL_DMAC_Start_Transfer + 106
        0x00000c8e:    2e02        ..      CMP      r6,#2
        0x00000c90:    d112        ..      BNE      0xcb8 ; HAL_DMAC_Start_Transfer + 88
        0x00000c92:    bf00        ..      NOP      
        0x00000c94:    480e        .H      LDR      r0,[pc,#56] ; [0xcd0] = 0x40010000
        0x00000c96:    6584        .e      STR      r4,[r0,#0x58]
        0x00000c98:    bf00        ..      NOP      
        0x00000c9a:    bf00        ..      NOP      
        0x00000c9c:    6605        .f      STR      r5,[r0,#0x60]
        0x00000c9e:    bf00        ..      NOP      
        0x00000ca0:    2000        .       MOVS     r0,#0
        0x00000ca2:    b2b9        ..      UXTH     r1,r7
        0x00000ca4:    ea413200    A..2    ORR      r2,r1,r0,LSL #12
        0x00000ca8:    4b09        .K      LDR      r3,[pc,#36] ; [0xcd0] = 0x40010000
        0x00000caa:    675a        Zg      STR      r2,[r3,#0x74]
        0x00000cac:    bf00        ..      NOP      
        0x00000cae:    2102        .!      MOVS     r1,#2
        0x00000cb0:    4608        .F      MOV      r0,r1
        0x00000cb2:    f000feaf    ....    BL       dmac_chenreg_l_pack ; 0x1a14
        0x00000cb6:    e008        ..      B        0xcca ; HAL_DMAC_Start_Transfer + 106
        0x00000cb8:    2e02        ..      CMP      r6,#2
        0x00000cba:    dc00        ..      BGT      0xcbe ; HAL_DMAC_Start_Transfer + 94
        0x00000cbc:    e004        ..      B        0xcc8 ; HAL_DMAC_Start_Transfer + 104
        0x00000cbe:    2287        ."      MOVS     r2,#0x87
        0x00000cc0:    a104        ..      ADR      r1,{pc}+0x14 ; 0xcd4
        0x00000cc2:    a00b        ..      ADR      r0,{pc}+0x2e ; 0xcf0
        0x00000cc4:    f000fd86    ....    BL       __aeabi_assert ; 0x17d4
        0x00000cc8:    bf00        ..      NOP      
        0x00000cca:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00000cce:    0000        ..      DCW    0
        0x00000cd0:    40010000    ...@    DCD    1073807360
        0x00000cd4:    735c2e2e    ..\s    DCD    1935420974
        0x00000cd8:    735c6b64    dk\s    DCD    1935436644
        0x00000cdc:    735c6372    rc\s    DCD    1935434610
        0x00000ce0:    645c636f    oc\d    DCD    1683776367
        0x00000ce4:    65766972    rive    DCD    1702259058
        0x00000ce8:    6d645c72    r\dm    DCD    1835293810
        0x00000cec:    00632e61    a.c.    DCD    6499937
        0x00000cf0:    695f6863    ch_i    DCD    1767860323
        0x00000cf4:    3c207864    dx <    DCD    1008760932
        0x00000cf8:    4d44203d    = DM    DCD    1296310333
        0x00000cfc:    435f4341    AC_C    DCD    1130316609
        0x00000d00:    4e4e4148    HANN    DCD    1313751368
        0x00000d04:    315f4c45    EL_1    DCD    828329029
        0x00000d08:    00000000    ....    DCD    0
    $t
    i.HAL_DMAC_Status_Block
    HAL_DMAC_Status_Block
        0x00000d0c:    bf00        ..      NOP      
        0x00000d0e:    4802        .H      LDR      r0,[pc,#8] ; [0xd18] = 0x400102f0
        0x00000d10:    6800        .h      LDR      r0,[r0,#0]
        0x00000d12:    b2c0        ..      UXTB     r0,r0
        0x00000d14:    4770        pG      BX       lr
    $d
        0x00000d16:    0000        ..      DCW    0
        0x00000d18:    400102f0    ...@    DCD    1073808112
    $t
    i.HAL_DMAC_UnMask_Block
    HAL_DMAC_UnMask_Block
        0x00000d1c:    bf00        ..      NOP      
        0x00000d1e:    ea412200    A.."    ORR      r2,r1,r0,LSL #8
        0x00000d22:    4b02        .K      LDR      r3,[pc,#8] ; [0xd2c] = 0x40010318
        0x00000d24:    601a        .`      STR      r2,[r3,#0]
        0x00000d26:    bf00        ..      NOP      
        0x00000d28:    4770        pG      BX       lr
    $d
        0x00000d2a:    0000        ..      DCW    0
        0x00000d2c:    40010318    ...@    DCD    1073808152
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x00000d30:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00000d32:    4604        .F      MOV      r4,r0
        0x00000d34:    f89d1004    ....    LDRB     r1,[sp,#4]
        0x00000d38:    4620         F      MOV      r0,r4
        0x00000d3a:    f000f831    ..1.    BL       HAL_GPIO_SetDir ; 0xda0
        0x00000d3e:    f89d0004    ....    LDRB     r0,[sp,#4]
        0x00000d42:    2801        .(      CMP      r0,#1
        0x00000d44:    d105        ..      BNE      0xd52 ; HAL_GPIO_Init + 34
        0x00000d46:    f89d1006    ....    LDRB     r1,[sp,#6]
        0x00000d4a:    4620         F      MOV      r0,r4
        0x00000d4c:    f000f8b0    ....    BL       HAL_GPIO_WritePin ; 0xeb0
        0x00000d50:    e009        ..      B        0xd66 ; HAL_GPIO_Init + 54
        0x00000d52:    f89d1005    ....    LDRB     r1,[sp,#5]
        0x00000d56:    4620         F      MOV      r0,r4
        0x00000d58:    f000f806    ....    BL       HAL_GPIO_SetDebounce ; 0xd68
        0x00000d5c:    f89d1007    ....    LDRB     r1,[sp,#7]
        0x00000d60:    4620         F      MOV      r0,r4
        0x00000d62:    f000f873    ..s.    BL       HAL_GPIO_TrigType ; 0xe4c
        0x00000d66:    bd1c        ..      POP      {r2-r4,pc}
    i.HAL_GPIO_SetDebounce
    HAL_GPIO_SetDebounce
        0x00000d68:    b530        0.      PUSH     {r4,r5,lr}
        0x00000d6a:    460a        .F      MOV      r2,r1
        0x00000d6c:    bf00        ..      NOP      
        0x00000d6e:    4b0b        .K      LDR      r3,[pc,#44] ; [0xd9c] = 0x40007000
        0x00000d70:    6c9b        .l      LDR      r3,[r3,#0x48]
        0x00000d72:    b29b        ..      UXTH     r3,r3
        0x00000d74:    4619        .F      MOV      r1,r3
        0x00000d76:    2a01        .*      CMP      r2,#1
        0x00000d78:    d103        ..      BNE      0xd82 ; HAL_GPIO_SetDebounce + 26
        0x00000d7a:    2301        .#      MOVS     r3,#1
        0x00000d7c:    4083        .@      LSLS     r3,r3,r0
        0x00000d7e:    4319        .C      ORRS     r1,r1,r3
        0x00000d80:    e002        ..      B        0xd88 ; HAL_GPIO_SetDebounce + 32
        0x00000d82:    2301        .#      MOVS     r3,#1
        0x00000d84:    4083        .@      LSLS     r3,r3,r0
        0x00000d86:    4399        .C      BICS     r1,r1,r3
        0x00000d88:    b28b        ..      UXTH     r3,r1
        0x00000d8a:    4c04        .L      LDR      r4,[pc,#16] ; [0xd9c] = 0x40007000
        0x00000d8c:    6ca4        .l      LDR      r4,[r4,#0x48]
        0x00000d8e:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000d92:    4d02        .M      LDR      r5,[pc,#8] ; [0xd9c] = 0x40007000
        0x00000d94:    64ac        .d      STR      r4,[r5,#0x48]
        0x00000d96:    bf00        ..      NOP      
        0x00000d98:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000d9a:    0000        ..      DCW    0
        0x00000d9c:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetDir
    HAL_GPIO_SetDir
        0x00000da0:    b530        0.      PUSH     {r4,r5,lr}
        0x00000da2:    4602        .F      MOV      r2,r0
        0x00000da4:    2a10        .*      CMP      r2,#0x10
        0x00000da6:    da16        ..      BGE      0xdd6 ; HAL_GPIO_SetDir + 54
        0x00000da8:    bf00        ..      NOP      
        0x00000daa:    4b19        .K      LDR      r3,[pc,#100] ; [0xe10] = 0x40007000
        0x00000dac:    685b        [h      LDR      r3,[r3,#4]
        0x00000dae:    b298        ..      UXTH     r0,r3
        0x00000db0:    bf00        ..      NOP      
        0x00000db2:    2901        .)      CMP      r1,#1
        0x00000db4:    d103        ..      BNE      0xdbe ; HAL_GPIO_SetDir + 30
        0x00000db6:    2301        .#      MOVS     r3,#1
        0x00000db8:    4093        .@      LSLS     r3,r3,r2
        0x00000dba:    4318        .C      ORRS     r0,r0,r3
        0x00000dbc:    e002        ..      B        0xdc4 ; HAL_GPIO_SetDir + 36
        0x00000dbe:    2301        .#      MOVS     r3,#1
        0x00000dc0:    4093        .@      LSLS     r3,r3,r2
        0x00000dc2:    4398        .C      BICS     r0,r0,r3
        0x00000dc4:    b283        ..      UXTH     r3,r0
        0x00000dc6:    4c12        .L      LDR      r4,[pc,#72] ; [0xe10] = 0x40007000
        0x00000dc8:    6864        dh      LDR      r4,[r4,#4]
        0x00000dca:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000dce:    4d10        .M      LDR      r5,[pc,#64] ; [0xe10] = 0x40007000
        0x00000dd0:    606c        l`      STR      r4,[r5,#4]
        0x00000dd2:    bf00        ..      NOP      
        0x00000dd4:    e01b        ..      B        0xe0e ; HAL_GPIO_SetDir + 110
        0x00000dd6:    bf00        ..      NOP      
        0x00000dd8:    4b0d        .K      LDR      r3,[pc,#52] ; [0xe10] = 0x40007000
        0x00000dda:    691b        .i      LDR      r3,[r3,#0x10]
        0x00000ddc:    b298        ..      UXTH     r0,r3
        0x00000dde:    bf00        ..      NOP      
        0x00000de0:    2901        .)      CMP      r1,#1
        0x00000de2:    d106        ..      BNE      0xdf2 ; HAL_GPIO_SetDir + 82
        0x00000de4:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000de8:    2401        .$      MOVS     r4,#1
        0x00000dea:    fa04f303    ....    LSL      r3,r4,r3
        0x00000dee:    4318        .C      ORRS     r0,r0,r3
        0x00000df0:    e004        ..      B        0xdfc ; HAL_GPIO_SetDir + 92
        0x00000df2:    f1a20310    ....    SUB      r3,r2,#0x10
        0x00000df6:    2401        .$      MOVS     r4,#1
        0x00000df8:    409c        .@      LSLS     r4,r4,r3
        0x00000dfa:    43a0        .C      BICS     r0,r0,r4
        0x00000dfc:    b283        ..      UXTH     r3,r0
        0x00000dfe:    4c04        .L      LDR      r4,[pc,#16] ; [0xe10] = 0x40007000
        0x00000e00:    6924        $i      LDR      r4,[r4,#0x10]
        0x00000e02:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000e06:    4d02        .M      LDR      r5,[pc,#8] ; [0xe10] = 0x40007000
        0x00000e08:    612c        ,a      STR      r4,[r5,#0x10]
        0x00000e0a:    bf00        ..      NOP      
        0x00000e0c:    bf00        ..      NOP      
        0x00000e0e:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000e10:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_SetPly
    HAL_GPIO_SetPly
        0x00000e14:    b530        0.      PUSH     {r4,r5,lr}
        0x00000e16:    460a        .F      MOV      r2,r1
        0x00000e18:    bf00        ..      NOP      
        0x00000e1a:    4b0b        .K      LDR      r3,[pc,#44] ; [0xe48] = 0x40007000
        0x00000e1c:    6bdb        .k      LDR      r3,[r3,#0x3c]
        0x00000e1e:    b29b        ..      UXTH     r3,r3
        0x00000e20:    4619        .F      MOV      r1,r3
        0x00000e22:    2a01        .*      CMP      r2,#1
        0x00000e24:    d103        ..      BNE      0xe2e ; HAL_GPIO_SetPly + 26
        0x00000e26:    2301        .#      MOVS     r3,#1
        0x00000e28:    4083        .@      LSLS     r3,r3,r0
        0x00000e2a:    4319        .C      ORRS     r1,r1,r3
        0x00000e2c:    e002        ..      B        0xe34 ; HAL_GPIO_SetPly + 32
        0x00000e2e:    2301        .#      MOVS     r3,#1
        0x00000e30:    4083        .@      LSLS     r3,r3,r0
        0x00000e32:    4399        .C      BICS     r1,r1,r3
        0x00000e34:    b28b        ..      UXTH     r3,r1
        0x00000e36:    4c04        .L      LDR      r4,[pc,#16] ; [0xe48] = 0x40007000
        0x00000e38:    6be4        .k      LDR      r4,[r4,#0x3c]
        0x00000e3a:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000e3e:    4d02        .M      LDR      r5,[pc,#8] ; [0xe48] = 0x40007000
        0x00000e40:    63ec        .c      STR      r4,[r5,#0x3c]
        0x00000e42:    bf00        ..      NOP      
        0x00000e44:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000e46:    0000        ..      DCW    0
        0x00000e48:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_TrigType
    HAL_GPIO_TrigType
        0x00000e4c:    b570        p.      PUSH     {r4-r6,lr}
        0x00000e4e:    4605        .F      MOV      r5,r0
        0x00000e50:    460c        .F      MOV      r4,r1
        0x00000e52:    b134        4.      CBZ      r4,0xe62 ; HAL_GPIO_TrigType + 22
        0x00000e54:    2c01        .,      CMP      r4,#1
        0x00000e56:    d00d        ..      BEQ      0xe74 ; HAL_GPIO_TrigType + 40
        0x00000e58:    2c02        .,      CMP      r4,#2
        0x00000e5a:    d014        ..      BEQ      0xe86 ; HAL_GPIO_TrigType + 58
        0x00000e5c:    2c03        .,      CMP      r4,#3
        0x00000e5e:    d124        $.      BNE      0xeaa ; HAL_GPIO_TrigType + 94
        0x00000e60:    e01a        ..      B        0xe98 ; HAL_GPIO_TrigType + 76
        0x00000e62:    2100        .!      MOVS     r1,#0
        0x00000e64:    4628        (F      MOV      r0,r5
        0x00000e66:    f000f851    ..Q.    BL       HAL_GPIO_setIrqLevel ; 0xf0c
        0x00000e6a:    2100        .!      MOVS     r1,#0
        0x00000e6c:    4628        (F      MOV      r0,r5
        0x00000e6e:    f7ffffd1    ....    BL       HAL_GPIO_SetPly ; 0xe14
        0x00000e72:    e01a        ..      B        0xeaa ; HAL_GPIO_TrigType + 94
        0x00000e74:    2100        .!      MOVS     r1,#0
        0x00000e76:    4628        (F      MOV      r0,r5
        0x00000e78:    f000f848    ..H.    BL       HAL_GPIO_setIrqLevel ; 0xf0c
        0x00000e7c:    2101        .!      MOVS     r1,#1
        0x00000e7e:    4628        (F      MOV      r0,r5
        0x00000e80:    f7ffffc8    ....    BL       HAL_GPIO_SetPly ; 0xe14
        0x00000e84:    e011        ..      B        0xeaa ; HAL_GPIO_TrigType + 94
        0x00000e86:    2101        .!      MOVS     r1,#1
        0x00000e88:    4628        (F      MOV      r0,r5
        0x00000e8a:    f000f83f    ..?.    BL       HAL_GPIO_setIrqLevel ; 0xf0c
        0x00000e8e:    2100        .!      MOVS     r1,#0
        0x00000e90:    4628        (F      MOV      r0,r5
        0x00000e92:    f7ffffbf    ....    BL       HAL_GPIO_SetPly ; 0xe14
        0x00000e96:    e008        ..      B        0xeaa ; HAL_GPIO_TrigType + 94
        0x00000e98:    2101        .!      MOVS     r1,#1
        0x00000e9a:    4628        (F      MOV      r0,r5
        0x00000e9c:    f000f836    ..6.    BL       HAL_GPIO_setIrqLevel ; 0xf0c
        0x00000ea0:    2101        .!      MOVS     r1,#1
        0x00000ea2:    4628        (F      MOV      r0,r5
        0x00000ea4:    f7ffffb6    ....    BL       HAL_GPIO_SetPly ; 0xe14
        0x00000ea8:    bf00        ..      NOP      
        0x00000eaa:    bf00        ..      NOP      
        0x00000eac:    bd70        p.      POP      {r4-r6,pc}
        0x00000eae:    0000        ..      MOVS     r0,r0
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x00000eb0:    b570        p.      PUSH     {r4-r6,lr}
        0x00000eb2:    4605        .F      MOV      r5,r0
        0x00000eb4:    460e        .F      MOV      r6,r1
        0x00000eb6:    2d10        .-      CMP      r5,#0x10
        0x00000eb8:    da10        ..      BGE      0xedc ; HAL_GPIO_WritePin + 44
        0x00000eba:    bf00        ..      NOP      
        0x00000ebc:    4812        .H      LDR      r0,[pc,#72] ; [0xf08] = 0x40007000
        0x00000ebe:    6800        .h      LDR      r0,[r0,#0]
        0x00000ec0:    b284        ..      UXTH     r4,r0
        0x00000ec2:    bf00        ..      NOP      
        0x00000ec4:    b91e        ..      CBNZ     r6,0xece ; HAL_GPIO_WritePin + 30
        0x00000ec6:    2001        .       MOVS     r0,#1
        0x00000ec8:    40a8        .@      LSLS     r0,r0,r5
        0x00000eca:    4384        .C      BICS     r4,r4,r0
        0x00000ecc:    e002        ..      B        0xed4 ; HAL_GPIO_WritePin + 36
        0x00000ece:    2001        .       MOVS     r0,#1
        0x00000ed0:    40a8        .@      LSLS     r0,r0,r5
        0x00000ed2:    4304        .C      ORRS     r4,r4,r0
        0x00000ed4:    b2a0        ..      UXTH     r0,r4
        0x00000ed6:    f000fdb3    ....    BL       gpio_portadataregister_setf ; 0x1a40
        0x00000eda:    e014        ..      B        0xf06 ; HAL_GPIO_WritePin + 86
        0x00000edc:    bf00        ..      NOP      
        0x00000ede:    480a        .H      LDR      r0,[pc,#40] ; [0xf08] = 0x40007000
        0x00000ee0:    68c0        .h      LDR      r0,[r0,#0xc]
        0x00000ee2:    b284        ..      UXTH     r4,r0
        0x00000ee4:    bf00        ..      NOP      
        0x00000ee6:    b92e        ..      CBNZ     r6,0xef4 ; HAL_GPIO_WritePin + 68
        0x00000ee8:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000eec:    2101        .!      MOVS     r1,#1
        0x00000eee:    4081        .@      LSLS     r1,r1,r0
        0x00000ef0:    438c        .C      BICS     r4,r4,r1
        0x00000ef2:    e005        ..      B        0xf00 ; HAL_GPIO_WritePin + 80
        0x00000ef4:    f1a50010    ....    SUB      r0,r5,#0x10
        0x00000ef8:    2101        .!      MOVS     r1,#1
        0x00000efa:    fa01f000    ....    LSL      r0,r1,r0
        0x00000efe:    4304        .C      ORRS     r4,r4,r0
        0x00000f00:    b2a0        ..      UXTH     r0,r4
        0x00000f02:    f000fda7    ....    BL       gpio_portbdataregister_setf ; 0x1a54
        0x00000f06:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00000f08:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_GPIO_setIrqLevel
    HAL_GPIO_setIrqLevel
        0x00000f0c:    b530        0.      PUSH     {r4,r5,lr}
        0x00000f0e:    460a        .F      MOV      r2,r1
        0x00000f10:    bf00        ..      NOP      
        0x00000f12:    4b0b        .K      LDR      r3,[pc,#44] ; [0xf40] = 0x40007000
        0x00000f14:    6b9b        .k      LDR      r3,[r3,#0x38]
        0x00000f16:    b29b        ..      UXTH     r3,r3
        0x00000f18:    4619        .F      MOV      r1,r3
        0x00000f1a:    2a01        .*      CMP      r2,#1
        0x00000f1c:    d103        ..      BNE      0xf26 ; HAL_GPIO_setIrqLevel + 26
        0x00000f1e:    2301        .#      MOVS     r3,#1
        0x00000f20:    4083        .@      LSLS     r3,r3,r0
        0x00000f22:    4319        .C      ORRS     r1,r1,r3
        0x00000f24:    e002        ..      B        0xf2c ; HAL_GPIO_setIrqLevel + 32
        0x00000f26:    2301        .#      MOVS     r3,#1
        0x00000f28:    4083        .@      LSLS     r3,r3,r0
        0x00000f2a:    4399        .C      BICS     r1,r1,r3
        0x00000f2c:    b28b        ..      UXTH     r3,r1
        0x00000f2e:    4c04        .L      LDR      r4,[pc,#16] ; [0xf40] = 0x40007000
        0x00000f30:    6ba4        .k      LDR      r4,[r4,#0x38]
        0x00000f32:    f363040f    c...    BFI      r4,r3,#0,#16
        0x00000f36:    4d02        .M      LDR      r5,[pc,#8] ; [0xf40] = 0x40007000
        0x00000f38:    63ac        .c      STR      r4,[r5,#0x38]
        0x00000f3a:    bf00        ..      NOP      
        0x00000f3c:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x00000f3e:    0000        ..      DCW    0
        0x00000f40:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSCON_HCLK_Src_Sel
    HAL_SYSCON_HCLK_Src_Sel
        0x00000f44:    bf00        ..      NOP      
        0x00000f46:    4904        .I      LDR      r1,[pc,#16] ; [0xf58] = 0x40020000
        0x00000f48:    6909        .i      LDR      r1,[r1,#0x10]
        0x00000f4a:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000f4e:    4a02        .J      LDR      r2,[pc,#8] ; [0xf58] = 0x40020000
        0x00000f50:    6111        .a      STR      r1,[r2,#0x10]
        0x00000f52:    bf00        ..      NOP      
        0x00000f54:    4770        pG      BX       lr
    $d
        0x00000f56:    0000        ..      DCW    0
        0x00000f58:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_HClk_Div
    HAL_SYSCON_Set_HClk_Div
        0x00000f5c:    b510        ..      PUSH     {r4,lr}
        0x00000f5e:    4604        .F      MOV      r4,r0
        0x00000f60:    1e60        `.      SUBS     r0,r4,#1
        0x00000f62:    280f        .(      CMP      r0,#0xf
        0x00000f64:    dc00        ..      BGT      0xf68 ; HAL_SYSCON_Set_HClk_Div + 12
        0x00000f66:    e004        ..      B        0xf72 ; HAL_SYSCON_Set_HClk_Div + 22
        0x00000f68:    2225        %"      MOVS     r2,#0x25
        0x00000f6a:    a108        ..      ADR      r1,{pc}+0x22 ; 0xf8c
        0x00000f6c:    a00f        ..      ADR      r0,{pc}+0x40 ; 0xfac
        0x00000f6e:    f000fc31    ..1.    BL       __aeabi_assert ; 0x17d4
        0x00000f72:    1e61        a.      SUBS     r1,r4,#1
        0x00000f74:    b2c8        ..      UXTB     r0,r1
        0x00000f76:    4913        .I      LDR      r1,[pc,#76] ; [0xfc4] = 0x40020000
        0x00000f78:    6849        Ih      LDR      r1,[r1,#4]
        0x00000f7a:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000f7e:    4a11        .J      LDR      r2,[pc,#68] ; [0xfc4] = 0x40020000
        0x00000f80:    6051        Q`      STR      r1,[r2,#4]
        0x00000f82:    bf00        ..      NOP      
        0x00000f84:    2001        .       MOVS     r0,#1
        0x00000f86:    f000fd8f    ....    BL       sysc_awo_div_update_set ; 0x1aa8
        0x00000f8a:    bd10        ..      POP      {r4,pc}
    $d
        0x00000f8c:    735c2e2e    ..\s    DCD    1935420974
        0x00000f90:    735c6b64    dk\s    DCD    1935436644
        0x00000f94:    735c6372    rc\s    DCD    1935434610
        0x00000f98:    645c636f    oc\d    DCD    1683776367
        0x00000f9c:    65766972    rive    DCD    1702259058
        0x00000fa0:    79735c72    r\sy    DCD    2037603442
        0x00000fa4:    6e6f6373    scon    DCD    1852793715
        0x00000fa8:    0000632e    .c..    DCD    25390
        0x00000fac:    62686128    (ahb    DCD    1651007784
        0x00000fb0:    7669645f    _div    DCD    1986618463
        0x00000fb4:    72656469    ider    DCD    1919247465
        0x00000fb8:    3c29312d    -1)<    DCD    1009332525
        0x00000fbc:    6678303d    =0xf    DCD    1719152701
        0x00000fc0:    00000000    ....    DCD    0
        0x00000fc4:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_PClk0_Div
    HAL_SYSCON_Set_PClk0_Div
        0x00000fc8:    b510        ..      PUSH     {r4,lr}
        0x00000fca:    4604        .F      MOV      r4,r0
        0x00000fcc:    1e60        `.      SUBS     r0,r4,#1
        0x00000fce:    280f        .(      CMP      r0,#0xf
        0x00000fd0:    dc00        ..      BGT      0xfd4 ; HAL_SYSCON_Set_PClk0_Div + 12
        0x00000fd2:    e004        ..      B        0xfde ; HAL_SYSCON_Set_PClk0_Div + 22
        0x00000fd4:    222c        ,"      MOVS     r2,#0x2c
        0x00000fd6:    a10a        ..      ADR      r1,{pc}+0x2a ; 0x1000
        0x00000fd8:    a011        ..      ADR      r0,{pc}+0x48 ; 0x1020
        0x00000fda:    f000fbfb    ....    BL       __aeabi_assert ; 0x17d4
        0x00000fde:    1e61        a.      SUBS     r1,r4,#1
        0x00000fe0:    b2c8        ..      UXTB     r0,r1
        0x00000fe2:    f04f4180    O..A    MOV      r1,#0x40000000
        0x00000fe6:    6849        Ih      LDR      r1,[r1,#4]
        0x00000fe8:    f3600103    `...    BFI      r1,r0,#0,#4
        0x00000fec:    f04f4280    O..B    MOV      r2,#0x40000000
        0x00000ff0:    6051        Q`      STR      r1,[r2,#4]
        0x00000ff2:    bf00        ..      NOP      
        0x00000ff4:    2001        .       MOVS     r0,#1
        0x00000ff6:    0781        ..      LSLS     r1,r0,#30
        0x00000ff8:    6008        .`      STR      r0,[r1,#0]
        0x00000ffa:    bf00        ..      NOP      
        0x00000ffc:    bd10        ..      POP      {r4,pc}
    $d
        0x00000ffe:    0000        ..      DCW    0
        0x00001000:    735c2e2e    ..\s    DCD    1935420974
        0x00001004:    735c6b64    dk\s    DCD    1935436644
        0x00001008:    735c6372    rc\s    DCD    1935434610
        0x0000100c:    645c636f    oc\d    DCD    1683776367
        0x00001010:    65766972    rive    DCD    1702259058
        0x00001014:    79735c72    r\sy    DCD    2037603442
        0x00001018:    6e6f6373    scon    DCD    1852793715
        0x0000101c:    0000632e    .c..    DCD    25390
        0x00001020:    62706128    (apb    DCD    1651532072
        0x00001024:    69645f30    0_di    DCD    1768185648
        0x00001028:    65646976    vide    DCD    1701079414
        0x0000102c:    29312d72    r-1)    DCD    691088754
        0x00001030:    78303d3c    <=0x    DCD    2016427324
        0x00001034:    00000066    f...    DCD    102
    $t
    i.HAL_SYSCON_Set_PClk1_Div
    HAL_SYSCON_Set_PClk1_Div
        0x00001038:    b510        ..      PUSH     {r4,lr}
        0x0000103a:    4604        .F      MOV      r4,r0
        0x0000103c:    1e60        `.      SUBS     r0,r4,#1
        0x0000103e:    280f        .(      CMP      r0,#0xf
        0x00001040:    dc00        ..      BGT      0x1044 ; HAL_SYSCON_Set_PClk1_Div + 12
        0x00001042:    e004        ..      B        0x104e ; HAL_SYSCON_Set_PClk1_Div + 22
        0x00001044:    2234        4"      MOVS     r2,#0x34
        0x00001046:    a108        ..      ADR      r1,{pc}+0x22 ; 0x1068
        0x00001048:    a00f        ..      ADR      r0,{pc}+0x40 ; 0x1088
        0x0000104a:    f000fbc3    ....    BL       __aeabi_assert ; 0x17d4
        0x0000104e:    1e61        a.      SUBS     r1,r4,#1
        0x00001050:    b2c8        ..      UXTB     r0,r1
        0x00001052:    4913        .I      LDR      r1,[pc,#76] ; [0x10a0] = 0x40020000
        0x00001054:    6849        Ih      LDR      r1,[r1,#4]
        0x00001056:    f3601107    `...    BFI      r1,r0,#4,#4
        0x0000105a:    4a11        .J      LDR      r2,[pc,#68] ; [0x10a0] = 0x40020000
        0x0000105c:    6051        Q`      STR      r1,[r2,#4]
        0x0000105e:    bf00        ..      NOP      
        0x00001060:    2002        .       MOVS     r0,#2
        0x00001062:    f000fd21    ..!.    BL       sysc_awo_div_update_set ; 0x1aa8
        0x00001066:    bd10        ..      POP      {r4,pc}
    $d
        0x00001068:    735c2e2e    ..\s    DCD    1935420974
        0x0000106c:    735c6b64    dk\s    DCD    1935436644
        0x00001070:    735c6372    rc\s    DCD    1935434610
        0x00001074:    645c636f    oc\d    DCD    1683776367
        0x00001078:    65766972    rive    DCD    1702259058
        0x0000107c:    79735c72    r\sy    DCD    2037603442
        0x00001080:    6e6f6373    scon    DCD    1852793715
        0x00001084:    0000632e    .c..    DCD    25390
        0x00001088:    62706128    (apb    DCD    1651532072
        0x0000108c:    69645f31    1_di    DCD    1768185649
        0x00001090:    65646976    vide    DCD    1701079414
        0x00001094:    29312d72    r-1)    DCD    691088754
        0x00001098:    78303d3c    <=0x    DCD    2016427324
        0x0000109c:    00000066    f...    DCD    102
        0x000010a0:    40020000    ...@    DCD    1073872896
    $t
    i.HAL_SYSCON_Set_RTC_Div
    HAL_SYSCON_Set_RTC_Div
        0x000010a4:    b570        p.      PUSH     {r4-r6,lr}
        0x000010a6:    4605        .F      MOV      r5,r0
        0x000010a8:    460c        .F      MOV      r4,r1
        0x000010aa:    1e60        `.      SUBS     r0,r4,#1
        0x000010ac:    f5b05f00    ..._    CMP      r0,#0x2000
        0x000010b0:    da00        ..      BGE      0x10b4 ; HAL_SYSCON_Set_RTC_Div + 16
        0x000010b2:    e004        ..      B        0x10be ; HAL_SYSCON_Set_RTC_Div + 26
        0x000010b4:    223c        <"      MOVS     r2,#0x3c
        0x000010b6:    a112        ..      ADR      r1,{pc}+0x4a ; 0x1100
        0x000010b8:    a019        ..      ADR      r0,{pc}+0x68 ; 0x1120
        0x000010ba:    f000fb8b    ....    BL       __aeabi_assert ; 0x17d4
        0x000010be:    2d01        .-      CMP      r5,#1
        0x000010c0:    dc00        ..      BGT      0x10c4 ; HAL_SYSCON_Set_RTC_Div + 32
        0x000010c2:    e004        ..      B        0x10ce ; HAL_SYSCON_Set_RTC_Div + 42
        0x000010c4:    223d        ="      MOVS     r2,#0x3d
        0x000010c6:    a10e        ..      ADR      r1,{pc}+0x3a ; 0x1100
        0x000010c8:    a01b        ..      ADR      r0,{pc}+0x70 ; 0x1138
        0x000010ca:    f000fb83    ....    BL       __aeabi_assert ; 0x17d4
        0x000010ce:    b935        5.      CBNZ     r5,0x10de ; HAL_SYSCON_Set_RTC_Div + 58
        0x000010d0:    2000        .       MOVS     r0,#0
        0x000010d2:    f000fcef    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1ab4
        0x000010d6:    2004        .       MOVS     r0,#4
        0x000010d8:    f000fce6    ....    BL       sysc_awo_div_update_set ; 0x1aa8
        0x000010dc:    e00e        ..      B        0x10fc ; HAL_SYSCON_Set_RTC_Div + 88
        0x000010de:    2c02        .,      CMP      r4,#2
        0x000010e0:    db00        ..      BLT      0x10e4 ; HAL_SYSCON_Set_RTC_Div + 64
        0x000010e2:    e004        ..      B        0x10ee ; HAL_SYSCON_Set_RTC_Div + 74
        0x000010e4:    2247        G"      MOVS     r2,#0x47
        0x000010e6:    a106        ..      ADR      r1,{pc}+0x1a ; 0x1100
        0x000010e8:    a01a        ..      ADR      r0,{pc}+0x6c ; 0x1154
        0x000010ea:    f000fb73    ..s.    BL       __aeabi_assert ; 0x17d4
        0x000010ee:    1e61        a.      SUBS     r1,r4,#1
        0x000010f0:    b288        ..      UXTH     r0,r1
        0x000010f2:    f000fcdf    ....    BL       sysc_awo_rtc_div_para_m1_setf ; 0x1ab4
        0x000010f6:    2004        .       MOVS     r0,#4
        0x000010f8:    f000fcd6    ....    BL       sysc_awo_div_update_set ; 0x1aa8
        0x000010fc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000010fe:    0000        ..      DCW    0
        0x00001100:    735c2e2e    ..\s    DCD    1935420974
        0x00001104:    735c6b64    dk\s    DCD    1935436644
        0x00001108:    735c6372    rc\s    DCD    1935434610
        0x0000110c:    645c636f    oc\d    DCD    1683776367
        0x00001110:    65766972    rive    DCD    1702259058
        0x00001114:    79735c72    r\sy    DCD    2037603442
        0x00001118:    6e6f6373    scon    DCD    1852793715
        0x0000111c:    0000632e    .c..    DCD    25390
        0x00001120:    63747228    (rtc    DCD    1668575784
        0x00001124:    7669645f    _div    DCD    1986618463
        0x00001128:    72656469    ider    DCD    1919247465
        0x0000112c:    3c29312d    -1)<    DCD    1009332525
        0x00001130:    3178303d    =0x1    DCD    829960253
        0x00001134:    00666666    fff.    DCD    6710886
        0x00001138:    5f637472    rtc_    DCD    1600353394
        0x0000113c:    3c637273    src<    DCD    1013150323
        0x00001140:    6374723d    =rtc    DCD    1668575805
        0x00001144:    5f6b6c63    clk_    DCD    1600875619
        0x00001148:    6d6f7266    from    DCD    1836020326
        0x0000114c:    6268615f    _ahb    DCD    1651007839
        0x00001150:    00000000    ....    DCD    0
        0x00001154:    5f637472    rtc_    DCD    1600353394
        0x00001158:    69766964    divi    DCD    1769367908
        0x0000115c:    3e726564    der>    DCD    1047684452
        0x00001160:    0000323d    =2..    DCD    12861
    $t
    i.I2C0_IRQHandler
    I2C0_IRQHandler
        0x00001164:    4905        .I      LDR      r1,[pc,#20] ; [0x117c] = 0x88
        0x00001166:    b510        ..      PUSH     {r4,lr}
        0x00001168:    3160        `1      ADDS     r1,r1,#0x60
        0x0000116a:    d004        ..      BEQ      0x1176 ; I2C0_IRQHandler + 18
        0x0000116c:    6848        Hh      LDR      r0,[r1,#4]
        0x0000116e:    6809        .h      LDR      r1,[r1,#0]
        0x00001170:    e8bd4010    ...@    POP      {r4,lr}
        0x00001174:    4708        .G      BX       r1
        0x00001176:    f7fff953    ..S.    BL       abort ; 0x420
    $d
        0x0000117a:    0000        ..      DCW    0
        0x0000117c:    00000088    ....    DCD    136
    $t
    i.I2C1_IRQHandler
    I2C1_IRQHandler
        0x00001180:    4905        .I      LDR      r1,[pc,#20] ; [0x1198] = 0x88
        0x00001182:    b510        ..      PUSH     {r4,lr}
        0x00001184:    3168        h1      ADDS     r1,r1,#0x68
        0x00001186:    d004        ..      BEQ      0x1192 ; I2C1_IRQHandler + 18
        0x00001188:    6848        Hh      LDR      r0,[r1,#4]
        0x0000118a:    6809        .h      LDR      r1,[r1,#0]
        0x0000118c:    e8bd4010    ...@    POP      {r4,lr}
        0x00001190:    4708        .G      BX       r1
        0x00001192:    f7fff945    ..E.    BL       abort ; 0x420
    $d
        0x00001196:    0000        ..      DCW    0
        0x00001198:    00000088    ....    DCD    136
    $t
    i.I2S_IRQHandler
    I2S_IRQHandler
        0x0000119c:    4905        .I      LDR      r1,[pc,#20] ; [0x11b4] = 0x88
        0x0000119e:    b510        ..      PUSH     {r4,lr}
        0x000011a0:    3188        .1      ADDS     r1,r1,#0x88
        0x000011a2:    d004        ..      BEQ      0x11ae ; I2S_IRQHandler + 18
        0x000011a4:    6848        Hh      LDR      r0,[r1,#4]
        0x000011a6:    6809        .h      LDR      r1,[r1,#0]
        0x000011a8:    e8bd4010    ...@    POP      {r4,lr}
        0x000011ac:    4708        .G      BX       r1
        0x000011ae:    f7fff937    ..7.    BL       abort ; 0x420
    $d
        0x000011b2:    0000        ..      DCW    0
        0x000011b4:    00000088    ....    DCD    136
    $t
    i.QSPI_IRQHandler
    QSPI_IRQHandler
        0x000011b8:    4905        .I      LDR      r1,[pc,#20] ; [0x11d0] = 0x88
        0x000011ba:    b510        ..      PUSH     {r4,lr}
        0x000011bc:    3120         1      ADDS     r1,r1,#0x20
        0x000011be:    d004        ..      BEQ      0x11ca ; QSPI_IRQHandler + 18
        0x000011c0:    6848        Hh      LDR      r0,[r1,#4]
        0x000011c2:    6809        .h      LDR      r1,[r1,#0]
        0x000011c4:    e8bd4010    ...@    POP      {r4,lr}
        0x000011c8:    4708        .G      BX       r1
        0x000011ca:    f7fff929    ..).    BL       abort ; 0x420
    $d
        0x000011ce:    0000        ..      DCW    0
        0x000011d0:    00000088    ....    DCD    136
    $t
    i.RTC_IRQHandler
    RTC_IRQHandler
        0x000011d4:    4905        .I      LDR      r1,[pc,#20] ; [0x11ec] = 0x88
        0x000011d6:    b510        ..      PUSH     {r4,lr}
        0x000011d8:    3110        .1      ADDS     r1,r1,#0x10
        0x000011da:    d004        ..      BEQ      0x11e6 ; RTC_IRQHandler + 18
        0x000011dc:    6848        Hh      LDR      r0,[r1,#4]
        0x000011de:    6809        .h      LDR      r1,[r1,#0]
        0x000011e0:    e8bd4010    ...@    POP      {r4,lr}
        0x000011e4:    4708        .G      BX       r1
        0x000011e6:    f7fff91b    ....    BL       abort ; 0x420
    $d
        0x000011ea:    0000        ..      DCW    0
        0x000011ec:    00000088    ....    DCD    136
    $t
    i.SEGGER_RTT_Write
    SEGGER_RTT_Write
        0x000011f0:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000011f4:    4607        .F      MOV      r7,r0
        0x000011f6:    480b        .H      LDR      r0,[pc,#44] ; [0x1224] = 0x2000000c
        0x000011f8:    4615        .F      MOV      r5,r2
        0x000011fa:    460e        .F      MOV      r6,r1
        0x000011fc:    7800        .x      LDRB     r0,[r0,#0]
        0x000011fe:    b908        ..      CBNZ     r0,0x1204 ; SEGGER_RTT_Write + 20
        0x00001200:    f000f966    ..f.    BL       _DoInit ; 0x14d0
        0x00001204:    f3ef8411    ....    MRS      r4,BASEPRI
        0x00001208:    2020                MOVS     r0,#0x20
        0x0000120a:    f3808811    ....    MSR      BASEPRI,r0
        0x0000120e:    462a        *F      MOV      r2,r5
        0x00001210:    4631        1F      MOV      r1,r6
        0x00001212:    4638        8F      MOV      r0,r7
        0x00001214:    f000f808    ....    BL       SEGGER_RTT_WriteNoLock ; 0x1228
        0x00001218:    b2e1        ..      UXTB     r1,r4
        0x0000121a:    f3818811    ....    MSR      BASEPRI,r1
        0x0000121e:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x00001222:    0000        ..      DCW    0
        0x00001224:    2000000c    ...     DCD    536870924
    $t
    i.SEGGER_RTT_WriteNoLock
    SEGGER_RTT_WriteNoLock
        0x00001228:    b570        p.      PUSH     {r4-r6,lr}
        0x0000122a:    460e        .F      MOV      r6,r1
        0x0000122c:    4914        .I      LDR      r1,[pc,#80] ; [0x1280] = 0x2000000c
        0x0000122e:    eb000040    ..@.    ADD      r0,r0,r0,LSL #1
        0x00001232:    eb0105c0    ....    ADD      r5,r1,r0,LSL #3
        0x00001236:    4614        .F      MOV      r4,r2
        0x00001238:    6ae8        .j      LDR      r0,[r5,#0x2c]
        0x0000123a:    3518        .5      ADDS     r5,r5,#0x18
        0x0000123c:    b120         .      CBZ      r0,0x1248 ; SEGGER_RTT_WriteNoLock + 32
        0x0000123e:    2801        .(      CMP      r0,#1
        0x00001240:    d00f        ..      BEQ      0x1262 ; SEGGER_RTT_WriteNoLock + 58
        0x00001242:    2802        .(      CMP      r0,#2
        0x00001244:    d105        ..      BNE      0x1252 ; SEGGER_RTT_WriteNoLock + 42
        0x00001246:    e013        ..      B        0x1270 ; SEGGER_RTT_WriteNoLock + 72
        0x00001248:    4628        (F      MOV      r0,r5
        0x0000124a:    f000f975    ..u.    BL       _GetAvailWriteSpace ; 0x1538
        0x0000124e:    42a0        .B      CMP      r0,r4
        0x00001250:    d201        ..      BCS      0x1256 ; SEGGER_RTT_WriteNoLock + 46
        0x00001252:    2400        .$      MOVS     r4,#0
        0x00001254:    e011        ..      B        0x127a ; SEGGER_RTT_WriteNoLock + 82
        0x00001256:    4622        "F      MOV      r2,r4
        0x00001258:    4631        1F      MOV      r1,r6
        0x0000125a:    4628        (F      MOV      r0,r5
        0x0000125c:    f000fa8c    ....    BL       _WriteNoCheck ; 0x1778
        0x00001260:    e00b        ..      B        0x127a ; SEGGER_RTT_WriteNoLock + 82
        0x00001262:    4628        (F      MOV      r0,r5
        0x00001264:    f000f968    ..h.    BL       _GetAvailWriteSpace ; 0x1538
        0x00001268:    42a0        .B      CMP      r0,r4
        0x0000126a:    d2f4        ..      BCS      0x1256 ; SEGGER_RTT_WriteNoLock + 46
        0x0000126c:    4604        .F      MOV      r4,r0
        0x0000126e:    e7f2        ..      B        0x1256 ; SEGGER_RTT_WriteNoLock + 46
        0x00001270:    4631        1F      MOV      r1,r6
        0x00001272:    4628        (F      MOV      r0,r5
        0x00001274:    f000fa53    ..S.    BL       _WriteBlocking ; 0x171e
        0x00001278:    4604        .F      MOV      r4,r0
        0x0000127a:    4620         F      MOV      r0,r4
        0x0000127c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000127e:    0000        ..      DCW    0
        0x00001280:    2000000c    ...     DCD    536870924
    $t
    i.SEGGER_RTT_printf
    SEGGER_RTT_printf
        0x00001284:    b40f        ..      PUSH     {r0-r3}
        0x00001286:    b508        ..      PUSH     {r3,lr}
        0x00001288:    a904        ..      ADD      r1,sp,#0x10
        0x0000128a:    9100        ..      STR      r1,[sp,#0]
        0x0000128c:    466a        jF      MOV      r2,sp
        0x0000128e:    9903        ..      LDR      r1,[sp,#0xc]
        0x00001290:    f000f803    ....    BL       SEGGER_RTT_vprintf ; 0x129a
        0x00001294:    b001        ..      ADD      sp,sp,#4
        0x00001296:    f85dfb14    ]...    LDR      pc,[sp],#0x14
    i.SEGGER_RTT_vprintf
    SEGGER_RTT_vprintf
        0x0000129a:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000129e:    b098        ..      SUB      sp,sp,#0x60
        0x000012a0:    4680        .F      MOV      r8,r0
        0x000012a2:    a807        ..      ADD      r0,sp,#0x1c
        0x000012a4:    9002        ..      STR      r0,[sp,#8]
        0x000012a6:    2040        @       MOVS     r0,#0x40
        0x000012a8:    2600        .&      MOVS     r6,#0
        0x000012aa:    e9cd0603    ....    STRD     r0,r6,[sp,#0xc]
        0x000012ae:    e9cd6805    ...h    STRD     r6,r8,[sp,#0x14]
        0x000012b2:    4615        .F      MOV      r5,r2
        0x000012b4:    460c        .F      MOV      r4,r1
        0x000012b6:    f8141b01    ....    LDRB     r1,[r4],#1
        0x000012ba:    2900        .)      CMP      r1,#0
        0x000012bc:    d06f        o.      BEQ      0x139e ; SEGGER_RTT_vprintf + 260
        0x000012be:    2925        %)      CMP      r1,#0x25
        0x000012c0:    d008        ..      BEQ      0x12d4 ; SEGGER_RTT_vprintf + 58
        0x000012c2:    a802        ..      ADD      r0,sp,#8
        0x000012c4:    f000fa0c    ....    BL       _StoreChar ; 0x16e0
        0x000012c8:    9805        ..      LDR      r0,[sp,#0x14]
        0x000012ca:    2800        .(      CMP      r0,#0
        0x000012cc:    daf3        ..      BGE      0x12b6 ; SEGGER_RTT_vprintf + 28
        0x000012ce:    b018        ..      ADD      sp,sp,#0x60
        0x000012d0:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000012d4:    2000        .       MOVS     r0,#0
        0x000012d6:    2201        ."      MOVS     r2,#1
        0x000012d8:    7821        !x      LDRB     r1,[r4,#0]
        0x000012da:    2923        #)      CMP      r1,#0x23
        0x000012dc:    d01e        ..      BEQ      0x131c ; SEGGER_RTT_vprintf + 130
        0x000012de:    292b        +)      CMP      r1,#0x2b
        0x000012e0:    d019        ..      BEQ      0x1316 ; SEGGER_RTT_vprintf + 124
        0x000012e2:    292d        -)      CMP      r1,#0x2d
        0x000012e4:    d002        ..      BEQ      0x12ec ; SEGGER_RTT_vprintf + 82
        0x000012e6:    2930        0)      CMP      r1,#0x30
        0x000012e8:    d108        ..      BNE      0x12fc ; SEGGER_RTT_vprintf + 98
        0x000012ea:    e002        ..      B        0x12f2 ; SEGGER_RTT_vprintf + 88
        0x000012ec:    f0400001    @...    ORR      r0,r0,#1
        0x000012f0:    e001        ..      B        0x12f6 ; SEGGER_RTT_vprintf + 92
        0x000012f2:    f0400002    @...    ORR      r0,r0,#2
        0x000012f6:    1c64        d.      ADDS     r4,r4,#1
        0x000012f8:    2a00        .*      CMP      r2,#0
        0x000012fa:    d1ed        ..      BNE      0x12d8 ; SEGGER_RTT_vprintf + 62
        0x000012fc:    2200        ."      MOVS     r2,#0
        0x000012fe:    7821        !x      LDRB     r1,[r4,#0]
        0x00001300:    f1a10330    ..0.    SUB      r3,r1,#0x30
        0x00001304:    2b0a        .+      CMP      r3,#0xa
        0x00001306:    d20c        ..      BCS      0x1322 ; SEGGER_RTT_vprintf + 136
        0x00001308:    eb020282    ....    ADD      r2,r2,r2,LSL #2
        0x0000130c:    eb010242    ..B.    ADD      r2,r1,r2,LSL #1
        0x00001310:    3a30        0:      SUBS     r2,r2,#0x30
        0x00001312:    1c64        d.      ADDS     r4,r4,#1
        0x00001314:    e7f3        ..      B        0x12fe ; SEGGER_RTT_vprintf + 100
        0x00001316:    f0400004    @...    ORR      r0,r0,#4
        0x0000131a:    e7ec        ..      B        0x12f6 ; SEGGER_RTT_vprintf + 92
        0x0000131c:    f0400008    @...    ORR      r0,r0,#8
        0x00001320:    e7e9        ..      B        0x12f6 ; SEGGER_RTT_vprintf + 92
        0x00001322:    2300        .#      MOVS     r3,#0
        0x00001324:    b2cf        ..      UXTB     r7,r1
        0x00001326:    2f2e        ./      CMP      r7,#0x2e
        0x00001328:    d10b        ..      BNE      0x1342 ; SEGGER_RTT_vprintf + 168
        0x0000132a:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x0000132e:    f1a10730    ..0.    SUB      r7,r1,#0x30
        0x00001332:    2f0a        ./      CMP      r7,#0xa
        0x00001334:    d205        ..      BCS      0x1342 ; SEGGER_RTT_vprintf + 168
        0x00001336:    eb030383    ....    ADD      r3,r3,r3,LSL #2
        0x0000133a:    eb010343    ..C.    ADD      r3,r1,r3,LSL #1
        0x0000133e:    3b30        0;      SUBS     r3,r3,#0x30
        0x00001340:    e7f3        ..      B        0x132a ; SEGGER_RTT_vprintf + 144
        0x00001342:    296c        l)      CMP      r1,#0x6c
        0x00001344:    d00d        ..      BEQ      0x1362 ; SEGGER_RTT_vprintf + 200
        0x00001346:    2968        h)      CMP      r1,#0x68
        0x00001348:    d00b        ..      BEQ      0x1362 ; SEGGER_RTT_vprintf + 200
        0x0000134a:    2970        p)      CMP      r1,#0x70
        0x0000134c:    d04a        J.      BEQ      0x13e4 ; SEGGER_RTT_vprintf + 330
        0x0000134e:    dc0b        ..      BGT      0x1368 ; SEGGER_RTT_vprintf + 206
        0x00001350:    2925        %)      CMP      r1,#0x25
        0x00001352:    d014        ..      BEQ      0x137e ; SEGGER_RTT_vprintf + 228
        0x00001354:    2958        X)      CMP      r1,#0x58
        0x00001356:    d02b        +.      BEQ      0x13b0 ; SEGGER_RTT_vprintf + 278
        0x00001358:    2963        c)      CMP      r1,#0x63
        0x0000135a:    d00c        ..      BEQ      0x1376 ; SEGGER_RTT_vprintf + 220
        0x0000135c:    2964        d)      CMP      r1,#0x64
        0x0000135e:    d111        ..      BNE      0x1384 ; SEGGER_RTT_vprintf + 234
        0x00001360:    e012        ..      B        0x1388 ; SEGGER_RTT_vprintf + 238
        0x00001362:    f8141f01    ....    LDRB     r1,[r4,#1]!
        0x00001366:    e7ec        ..      B        0x1342 ; SEGGER_RTT_vprintf + 168
        0x00001368:    2973        s)      CMP      r1,#0x73
        0x0000136a:    d02c        ,.      BEQ      0x13c6 ; SEGGER_RTT_vprintf + 300
        0x0000136c:    2975        u)      CMP      r1,#0x75
        0x0000136e:    d017        ..      BEQ      0x13a0 ; SEGGER_RTT_vprintf + 262
        0x00001370:    2978        x)      CMP      r1,#0x78
        0x00001372:    d107        ..      BNE      0x1384 ; SEGGER_RTT_vprintf + 234
        0x00001374:    e01c        ..      B        0x13b0 ; SEGGER_RTT_vprintf + 278
        0x00001376:    6828        (h      LDR      r0,[r5,#0]
        0x00001378:    1d01        ..      ADDS     r1,r0,#4
        0x0000137a:    6029        )`      STR      r1,[r5,#0]
        0x0000137c:    7801        .x      LDRB     r1,[r0,#0]
        0x0000137e:    a802        ..      ADD      r0,sp,#8
        0x00001380:    f000f9ae    ....    BL       _StoreChar ; 0x16e0
        0x00001384:    1c64        d.      ADDS     r4,r4,#1
        0x00001386:    e79f        ..      B        0x12c8 ; SEGGER_RTT_vprintf + 46
        0x00001388:    6829        )h      LDR      r1,[r5,#0]
        0x0000138a:    1d0f        ..      ADDS     r7,r1,#4
        0x0000138c:    602f        /`      STR      r7,[r5,#0]
        0x0000138e:    6809        .h      LDR      r1,[r1,#0]
        0x00001390:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x00001394:    220a        ."      MOVS     r2,#0xa
        0x00001396:    a802        ..      ADD      r0,sp,#8
        0x00001398:    f000f8d9    ....    BL       _PrintInt ; 0x154e
        0x0000139c:    e7f2        ..      B        0x1384 ; SEGGER_RTT_vprintf + 234
        0x0000139e:    e02b        +.      B        0x13f8 ; SEGGER_RTT_vprintf + 350
        0x000013a0:    6829        )h      LDR      r1,[r5,#0]
        0x000013a2:    1d0f        ..      ADDS     r7,r1,#4
        0x000013a4:    602f        /`      STR      r7,[r5,#0]
        0x000013a6:    6809        .h      LDR      r1,[r1,#0]
        0x000013a8:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x000013ac:    220a        ."      MOVS     r2,#0xa
        0x000013ae:    e006        ..      B        0x13be ; SEGGER_RTT_vprintf + 292
        0x000013b0:    6829        )h      LDR      r1,[r5,#0]
        0x000013b2:    1d0f        ..      ADDS     r7,r1,#4
        0x000013b4:    602f        /`      STR      r7,[r5,#0]
        0x000013b6:    6809        .h      LDR      r1,[r1,#0]
        0x000013b8:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x000013bc:    2210        ."      MOVS     r2,#0x10
        0x000013be:    a802        ..      ADD      r0,sp,#8
        0x000013c0:    f000f928    ..(.    BL       _PrintUnsigned ; 0x1614
        0x000013c4:    e7de        ..      B        0x1384 ; SEGGER_RTT_vprintf + 234
        0x000013c6:    6828        (h      LDR      r0,[r5,#0]
        0x000013c8:    1d01        ..      ADDS     r1,r0,#4
        0x000013ca:    6029        )`      STR      r1,[r5,#0]
        0x000013cc:    6807        .h      LDR      r7,[r0,#0]
        0x000013ce:    f8171b01    ....    LDRB     r1,[r7],#1
        0x000013d2:    2900        .)      CMP      r1,#0
        0x000013d4:    d0d6        ..      BEQ      0x1384 ; SEGGER_RTT_vprintf + 234
        0x000013d6:    a802        ..      ADD      r0,sp,#8
        0x000013d8:    f000f982    ....    BL       _StoreChar ; 0x16e0
        0x000013dc:    9805        ..      LDR      r0,[sp,#0x14]
        0x000013de:    2800        .(      CMP      r0,#0
        0x000013e0:    daf5        ..      BGE      0x13ce ; SEGGER_RTT_vprintf + 308
        0x000013e2:    e7cf        ..      B        0x1384 ; SEGGER_RTT_vprintf + 234
        0x000013e4:    6828        (h      LDR      r0,[r5,#0]
        0x000013e6:    1d01        ..      ADDS     r1,r0,#4
        0x000013e8:    6029        )`      STR      r1,[r5,#0]
        0x000013ea:    6801        .h      LDR      r1,[r0,#0]
        0x000013ec:    2008        .       MOVS     r0,#8
        0x000013ee:    e9cd0600    ....    STRD     r0,r6,[sp,#0]
        0x000013f2:    4603        .F      MOV      r3,r0
        0x000013f4:    2210        ."      MOVS     r2,#0x10
        0x000013f6:    e7e2        ..      B        0x13be ; SEGGER_RTT_vprintf + 292
        0x000013f8:    9805        ..      LDR      r0,[sp,#0x14]
        0x000013fa:    2800        .(      CMP      r0,#0
        0x000013fc:    f77faf67    ..g.    BLE      0x12ce ; SEGGER_RTT_vprintf + 52
        0x00001400:    9804        ..      LDR      r0,[sp,#0x10]
        0x00001402:    b120         .      CBZ      r0,0x140e ; SEGGER_RTT_vprintf + 372
        0x00001404:    4602        .F      MOV      r2,r0
        0x00001406:    a907        ..      ADD      r1,sp,#0x1c
        0x00001408:    4640        @F      MOV      r0,r8
        0x0000140a:    f7fffef1    ....    BL       SEGGER_RTT_Write ; 0x11f0
        0x0000140e:    e9dd1004    ....    LDRD     r1,r0,[sp,#0x10]
        0x00001412:    4408        .D      ADD      r0,r0,r1
        0x00001414:    9005        ..      STR      r0,[sp,#0x14]
        0x00001416:    e75a        Z.      B        0x12ce ; SEGGER_RTT_vprintf + 52
    i.SPIM_IRQHandler
    SPIM_IRQHandler
        0x00001418:    4905        .I      LDR      r1,[pc,#20] ; [0x1430] = 0x88
        0x0000141a:    b510        ..      PUSH     {r4,lr}
        0x0000141c:    3170        p1      ADDS     r1,r1,#0x70
        0x0000141e:    d004        ..      BEQ      0x142a ; SPIM_IRQHandler + 18
        0x00001420:    6848        Hh      LDR      r0,[r1,#4]
        0x00001422:    6809        .h      LDR      r1,[r1,#0]
        0x00001424:    e8bd4010    ...@    POP      {r4,lr}
        0x00001428:    4708        .G      BX       r1
        0x0000142a:    f7fefff9    ....    BL       abort ; 0x420
    $d
        0x0000142e:    0000        ..      DCW    0
        0x00001430:    00000088    ....    DCD    136
    $t
    i.SystemInit
    SystemInit
        0x00001434:    b510        ..      PUSH     {r4,lr}
        0x00001436:    4812        .H      LDR      r0,[pc,#72] ; [0x1480] = 0x4000b000
        0x00001438:    6801        .h      LDR      r1,[r0,#0]
        0x0000143a:    0149        I.      LSLS     r1,r1,#5
        0x0000143c:    d5fc        ..      BPL      0x1438 ; SystemInit + 4
        0x0000143e:    f64e2160    N.`!    MOV      r1,#0xea60
        0x00001442:    2000        .       MOVS     r0,#0
        0x00001444:    bf00        ..      NOP      
        0x00001446:    bf00        ..      NOP      
        0x00001448:    bf00        ..      NOP      
        0x0000144a:    bf00        ..      NOP      
        0x0000144c:    bf00        ..      NOP      
        0x0000144e:    bf00        ..      NOP      
        0x00001450:    1c40        @.      ADDS     r0,r0,#1
        0x00001452:    4288        .B      CMP      r0,r1
        0x00001454:    d3f6        ..      BCC      0x1444 ; SystemInit + 16
        0x00001456:    490c        .I      LDR      r1,[pc,#48] ; [0x1488] = 0x20000000
        0x00001458:    480a        .H      LDR      r0,[pc,#40] ; [0x1484] = 0x5f5e100
        0x0000145a:    6008        .`      STR      r0,[r1,#0]
        0x0000145c:    2008        .       MOVS     r0,#8
        0x0000145e:    f7fffd71    ..q.    BL       HAL_SYSCON_HCLK_Src_Sel ; 0xf44
        0x00001462:    2002        .       MOVS     r0,#2
        0x00001464:    f7fffd7a    ..z.    BL       HAL_SYSCON_Set_HClk_Div ; 0xf5c
        0x00001468:    2004        .       MOVS     r0,#4
        0x0000146a:    f7fffdad    ....    BL       HAL_SYSCON_Set_PClk0_Div ; 0xfc8
        0x0000146e:    2002        .       MOVS     r0,#2
        0x00001470:    f7fffde2    ....    BL       HAL_SYSCON_Set_PClk1_Div ; 0x1038
        0x00001474:    2164        d!      MOVS     r1,#0x64
        0x00001476:    e8bd4010    ...@    POP      {r4,lr}
        0x0000147a:    2001        .       MOVS     r0,#1
        0x0000147c:    f7ffbe12    ....    B.W      HAL_SYSCON_Set_RTC_Div ; 0x10a4
    $d
        0x00001480:    4000b000    ...@    DCD    1073786880
        0x00001484:    05f5e100    ....    DCD    100000000
        0x00001488:    20000000    ...     DCD    536870912
    $t
    i.TIMER_IRQHandler
    TIMER_IRQHandler
        0x0000148c:    4905        .I      LDR      r1,[pc,#20] ; [0x14a4] = 0x88
        0x0000148e:    b510        ..      PUSH     {r4,lr}
        0x00001490:    3158        X1      ADDS     r1,r1,#0x58
        0x00001492:    d004        ..      BEQ      0x149e ; TIMER_IRQHandler + 18
        0x00001494:    6848        Hh      LDR      r0,[r1,#4]
        0x00001496:    6809        .h      LDR      r1,[r1,#0]
        0x00001498:    e8bd4010    ...@    POP      {r4,lr}
        0x0000149c:    4708        .G      BX       r1
        0x0000149e:    f7feffbf    ....    BL       abort ; 0x420
    $d
        0x000014a2:    0000        ..      DCW    0
        0x000014a4:    00000088    ....    DCD    136
    $t
    i.UART_IRQHandler
    UART_IRQHandler
        0x000014a8:    4905        .I      LDR      r1,[pc,#20] ; [0x14c0] = 0x88
        0x000014aa:    b510        ..      PUSH     {r4,lr}
        0x000014ac:    3178        x1      ADDS     r1,r1,#0x78
        0x000014ae:    d004        ..      BEQ      0x14ba ; UART_IRQHandler + 18
        0x000014b0:    6848        Hh      LDR      r0,[r1,#4]
        0x000014b2:    6809        .h      LDR      r1,[r1,#0]
        0x000014b4:    e8bd4010    ...@    POP      {r4,lr}
        0x000014b8:    4708        .G      BX       r1
        0x000014ba:    f7feffb1    ....    BL       abort ; 0x420
    $d
        0x000014be:    0000        ..      DCW    0
        0x000014c0:    00000088    ....    DCD    136
    $t
    i.WDT_IRQHandler
    WDT_IRQHandler
        0x000014c4:    4901        .I      LDR      r1,[pc,#4] ; [0x14cc] = 0x88
        0x000014c6:    6848        Hh      LDR      r0,[r1,#4]
        0x000014c8:    6809        .h      LDR      r1,[r1,#0]
        0x000014ca:    4708        .G      BX       r1
    $d
        0x000014cc:    00000088    ....    DCD    136
    $t
    i._DoInit
    _DoInit
        0x000014d0:    b510        ..      PUSH     {r4,lr}
        0x000014d2:    4c12        .L      LDR      r4,[pc,#72] ; [0x151c] = 0x2000000c
        0x000014d4:    2003        .       MOVS     r0,#3
        0x000014d6:    2100        .!      MOVS     r1,#0
        0x000014d8:    6120         a      STR      r0,[r4,#0x10]
        0x000014da:    6160        `a      STR      r0,[r4,#0x14]
        0x000014dc:    a010        ..      ADR      r0,{pc}+0x44 ; 0x1520
        0x000014de:    61a0        .a      STR      r0,[r4,#0x18]
        0x000014e0:    f10400a8    ....    ADD      r0,r4,#0xa8
        0x000014e4:    61e0        .a      STR      r0,[r4,#0x1c]
        0x000014e6:    f44f6080    O..`    MOV      r0,#0x400
        0x000014ea:    62a1        .b      STR      r1,[r4,#0x28]
        0x000014ec:    6220         b      STR      r0,[r4,#0x20]
        0x000014ee:    6261        ab      STR      r1,[r4,#0x24]
        0x000014f0:    a00b        ..      ADR      r0,{pc}+0x30 ; 0x1520
        0x000014f2:    62e1        .b      STR      r1,[r4,#0x2c]
        0x000014f4:    6620         f      STR      r0,[r4,#0x60]
        0x000014f6:    f5046095    ...`    ADD      r0,r4,#0x4a8
        0x000014fa:    6660        `f      STR      r0,[r4,#0x64]
        0x000014fc:    2010        .       MOVS     r0,#0x10
        0x000014fe:    6721        !g      STR      r1,[r4,#0x70]
        0x00001500:    e9c4011a    ....    STRD     r0,r1,[r4,#0x68]
        0x00001504:    6761        ag      STR      r1,[r4,#0x74]
        0x00001506:    a109        ..      ADR      r1,{pc}+0x26 ; 0x152c
        0x00001508:    1de0        ..      ADDS     r0,r4,#7
        0x0000150a:    f7feff94    ....    BL       strcpy ; 0x436
        0x0000150e:    a108        ..      ADR      r1,{pc}+0x22 ; 0x1530
        0x00001510:    4620         F      MOV      r0,r4
        0x00001512:    f7feff90    ....    BL       strcpy ; 0x436
        0x00001516:    2020                MOVS     r0,#0x20
        0x00001518:    71a0        .q      STRB     r0,[r4,#6]
        0x0000151a:    bd10        ..      POP      {r4,pc}
    $d
        0x0000151c:    2000000c    ...     DCD    536870924
        0x00001520:    6d726554    Term    DCD    1836213588
        0x00001524:    6c616e69    inal    DCD    1818324585
        0x00001528:    00000000    ....    DCD    0
        0x0000152c:    00545452    RTT.    DCD    5526610
        0x00001530:    47474553    SEGG    DCD    1195853139
        0x00001534:    00005245    ER..    DCD    21061
    $t
    i._GetAvailWriteSpace
    _GetAvailWriteSpace
        0x00001538:    6902        .i      LDR      r2,[r0,#0x10]
        0x0000153a:    68c1        .h      LDR      r1,[r0,#0xc]
        0x0000153c:    428a        .B      CMP      r2,r1
        0x0000153e:    d803        ..      BHI      0x1548 ; _GetAvailWriteSpace + 16
        0x00001540:    6880        .h      LDR      r0,[r0,#8]
        0x00001542:    1a40        @.      SUBS     r0,r0,r1
        0x00001544:    4410        .D      ADD      r0,r0,r2
        0x00001546:    e000        ..      B        0x154a ; _GetAvailWriteSpace + 18
        0x00001548:    1a50        P.      SUBS     r0,r2,r1
        0x0000154a:    1e40        @.      SUBS     r0,r0,#1
        0x0000154c:    4770        pG      BX       lr
    i._PrintInt
    _PrintInt
        0x0000154e:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x00001552:    000e        ..      MOVS     r6,r1
        0x00001554:    4680        .F      MOV      r8,r0
        0x00001556:    e9dd470c    ...G    LDRD     r4,r7,[sp,#0x30]
        0x0000155a:    f1c60000    ....    RSB      r0,r6,#0
        0x0000155e:    4699        .F      MOV      r9,r3
        0x00001560:    4692        .F      MOV      r10,r2
        0x00001562:    4683        .F      MOV      r11,r0
        0x00001564:    d400        ..      BMI      0x1568 ; _PrintInt + 26
        0x00001566:    4608        .F      MOV      r0,r1
        0x00001568:    2501        .%      MOVS     r5,#1
        0x0000156a:    e002        ..      B        0x1572 ; _PrintInt + 36
        0x0000156c:    fb90f0fa    ....    SDIV     r0,r0,r10
        0x00001570:    1c6d        m.      ADDS     r5,r5,#1
        0x00001572:    4550        PE      CMP      r0,r10
        0x00001574:    dafa        ..      BGE      0x156c ; _PrintInt + 30
        0x00001576:    45a9        .E      CMP      r9,r5
        0x00001578:    d900        ..      BLS      0x157c ; _PrintInt + 46
        0x0000157a:    464d        MF      MOV      r5,r9
        0x0000157c:    b124        $.      CBZ      r4,0x1588 ; _PrintInt + 58
        0x0000157e:    2e00        ..      CMP      r6,#0
        0x00001580:    db01        ..      BLT      0x1586 ; _PrintInt + 56
        0x00001582:    0778        x.      LSLS     r0,r7,#29
        0x00001584:    d500        ..      BPL      0x1588 ; _PrintInt + 58
        0x00001586:    1e64        d.      SUBS     r4,r4,#1
        0x00001588:    07b8        ..      LSLS     r0,r7,#30
        0x0000158a:    d502        ..      BPL      0x1592 ; _PrintInt + 68
        0x0000158c:    f1b90f00    ....    CMP      r9,#0
        0x00001590:    d00f        ..      BEQ      0x15b2 ; _PrintInt + 100
        0x00001592:    07f8        ..      LSLS     r0,r7,#31
        0x00001594:    d10d        ..      BNE      0x15b2 ; _PrintInt + 100
        0x00001596:    b164        d.      CBZ      r4,0x15b2 ; _PrintInt + 100
        0x00001598:    42a5        .B      CMP      r5,r4
        0x0000159a:    d20a        ..      BCS      0x15b2 ; _PrintInt + 100
        0x0000159c:    2120         !      MOVS     r1,#0x20
        0x0000159e:    4640        @F      MOV      r0,r8
        0x000015a0:    1e64        d.      SUBS     r4,r4,#1
        0x000015a2:    f000f89d    ....    BL       _StoreChar ; 0x16e0
        0x000015a6:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015aa:    2800        .(      CMP      r0,#0
        0x000015ac:    daf3        ..      BGE      0x1596 ; _PrintInt + 72
        0x000015ae:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x000015b2:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015b6:    2800        .(      CMP      r0,#0
        0x000015b8:    dbf9        ..      BLT      0x15ae ; _PrintInt + 96
        0x000015ba:    2e00        ..      CMP      r6,#0
        0x000015bc:    da02        ..      BGE      0x15c4 ; _PrintInt + 118
        0x000015be:    465e        ^F      MOV      r6,r11
        0x000015c0:    212d        -!      MOVS     r1,#0x2d
        0x000015c2:    e002        ..      B        0x15ca ; _PrintInt + 124
        0x000015c4:    0778        x.      LSLS     r0,r7,#29
        0x000015c6:    d507        ..      BPL      0x15d8 ; _PrintInt + 138
        0x000015c8:    212b        +!      MOVS     r1,#0x2b
        0x000015ca:    4640        @F      MOV      r0,r8
        0x000015cc:    f000f888    ....    BL       _StoreChar ; 0x16e0
        0x000015d0:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015d4:    2800        .(      CMP      r0,#0
        0x000015d6:    dbea        ..      BLT      0x15ae ; _PrintInt + 96
        0x000015d8:    f0070003    ....    AND      r0,r7,#3
        0x000015dc:    2802        .(      CMP      r0,#2
        0x000015de:    d10f        ..      BNE      0x1600 ; _PrintInt + 178
        0x000015e0:    f1b90f00    ....    CMP      r9,#0
        0x000015e4:    d10c        ..      BNE      0x1600 ; _PrintInt + 178
        0x000015e6:    b15c        \.      CBZ      r4,0x1600 ; _PrintInt + 178
        0x000015e8:    42a5        .B      CMP      r5,r4
        0x000015ea:    d209        ..      BCS      0x1600 ; _PrintInt + 178
        0x000015ec:    2130        0!      MOVS     r1,#0x30
        0x000015ee:    4640        @F      MOV      r0,r8
        0x000015f0:    1e64        d.      SUBS     r4,r4,#1
        0x000015f2:    f000f875    ..u.    BL       _StoreChar ; 0x16e0
        0x000015f6:    f8d8000c    ....    LDR      r0,[r8,#0xc]
        0x000015fa:    2800        .(      CMP      r0,#0
        0x000015fc:    daf3        ..      BGE      0x15e6 ; _PrintInt + 152
        0x000015fe:    e7d6        ..      B        0x15ae ; _PrintInt + 96
        0x00001600:    e9cd4700    ...G    STRD     r4,r7,[sp,#0]
        0x00001604:    464b        KF      MOV      r3,r9
        0x00001606:    4652        RF      MOV      r2,r10
        0x00001608:    4631        1F      MOV      r1,r6
        0x0000160a:    4640        @F      MOV      r0,r8
        0x0000160c:    f000f802    ....    BL       _PrintUnsigned ; 0x1614
        0x00001610:    e7cd        ..      B        0x15ae ; _PrintInt + 96
        0x00001612:    0000        ..      MOVS     r0,r0
    i._PrintUnsigned
    _PrintUnsigned
        0x00001614:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x00001618:    4682        .F      MOV      r10,r0
        0x0000161a:    e9dd4b0a    ...K    LDRD     r4,r11,[sp,#0x28]
        0x0000161e:    2501        .%      MOVS     r5,#1
        0x00001620:    4699        .F      MOV      r9,r3
        0x00001622:    4617        .F      MOV      r7,r2
        0x00001624:    4688        .F      MOV      r8,r1
        0x00001626:    4608        .F      MOV      r0,r1
        0x00001628:    462e        .F      MOV      r6,r5
        0x0000162a:    e002        ..      B        0x1632 ; _PrintUnsigned + 30
        0x0000162c:    fbb0f0f7    ....    UDIV     r0,r0,r7
        0x00001630:    1c76        v.      ADDS     r6,r6,#1
        0x00001632:    42b8        .B      CMP      r0,r7
        0x00001634:    d2fa        ..      BCS      0x162c ; _PrintUnsigned + 24
        0x00001636:    45b1        .E      CMP      r9,r6
        0x00001638:    d900        ..      BLS      0x163c ; _PrintUnsigned + 40
        0x0000163a:    464e        NF      MOV      r6,r9
        0x0000163c:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x00001640:    d117        ..      BNE      0x1672 ; _PrintUnsigned + 94
        0x00001642:    b1b4        ..      CBZ      r4,0x1672 ; _PrintUnsigned + 94
        0x00001644:    ea5f708b    _..p    LSLS     r0,r11,#30
        0x00001648:    d502        ..      BPL      0x1650 ; _PrintUnsigned + 60
        0x0000164a:    f1b90f00    ....    CMP      r9,#0
        0x0000164e:    d002        ..      BEQ      0x1656 ; _PrintUnsigned + 66
        0x00001650:    2020                MOVS     r0,#0x20
        0x00001652:    9000        ..      STR      r0,[sp,#0]
        0x00001654:    e00b        ..      B        0x166e ; _PrintUnsigned + 90
        0x00001656:    2030        0       MOVS     r0,#0x30
        0x00001658:    e7fb        ..      B        0x1652 ; _PrintUnsigned + 62
        0x0000165a:    4650        PF      MOV      r0,r10
        0x0000165c:    1e64        d.      SUBS     r4,r4,#1
        0x0000165e:    9900        ..      LDR      r1,[sp,#0]
        0x00001660:    f000f83e    ..>.    BL       _StoreChar ; 0x16e0
        0x00001664:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001668:    2800        .(      CMP      r0,#0
        0x0000166a:    db35        5.      BLT      0x16d8 ; _PrintUnsigned + 196
        0x0000166c:    b10c        ..      CBZ      r4,0x1672 ; _PrintUnsigned + 94
        0x0000166e:    42a6        .B      CMP      r6,r4
        0x00001670:    d3f3        ..      BCC      0x165a ; _PrintUnsigned + 70
        0x00001672:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x00001676:    2800        .(      CMP      r0,#0
        0x00001678:    db2e        ..      BLT      0x16d8 ; _PrintUnsigned + 196
        0x0000167a:    f1b90f01    ....    CMP      r9,#1
        0x0000167e:    d902        ..      BLS      0x1686 ; _PrintUnsigned + 114
        0x00001680:    f1a90901    ....    SUB      r9,r9,#1
        0x00001684:    e003        ..      B        0x168e ; _PrintUnsigned + 122
        0x00001686:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x0000168a:    42b8        .B      CMP      r0,r7
        0x0000168c:    d301        ..      BCC      0x1692 ; _PrintUnsigned + 126
        0x0000168e:    437d        }C      MULS     r5,r7,r5
        0x00001690:    e7f3        ..      B        0x167a ; _PrintUnsigned + 102
        0x00001692:    f8df9048    ..H.    LDR      r9,[pc,#72] ; [0x16dc] = 0x1bf8
        0x00001696:    fbb8f0f5    ....    UDIV     r0,r8,r5
        0x0000169a:    fb008815    ....    MLS      r8,r0,r5,r8
        0x0000169e:    f8191000    ....    LDRB     r1,[r9,r0]
        0x000016a2:    4650        PF      MOV      r0,r10
        0x000016a4:    f000f81c    ....    BL       _StoreChar ; 0x16e0
        0x000016a8:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x000016ac:    2800        .(      CMP      r0,#0
        0x000016ae:    db03        ..      BLT      0x16b8 ; _PrintUnsigned + 164
        0x000016b0:    fbb5f5f7    ....    UDIV     r5,r5,r7
        0x000016b4:    2d00        .-      CMP      r5,#0
        0x000016b6:    d1ee        ..      BNE      0x1696 ; _PrintUnsigned + 130
        0x000016b8:    ea5f70cb    _..p    LSLS     r0,r11,#31
        0x000016bc:    d00c        ..      BEQ      0x16d8 ; _PrintUnsigned + 196
        0x000016be:    2c00        .,      CMP      r4,#0
        0x000016c0:    d00a        ..      BEQ      0x16d8 ; _PrintUnsigned + 196
        0x000016c2:    42a6        .B      CMP      r6,r4
        0x000016c4:    d208        ..      BCS      0x16d8 ; _PrintUnsigned + 196
        0x000016c6:    2120         !      MOVS     r1,#0x20
        0x000016c8:    4650        PF      MOV      r0,r10
        0x000016ca:    1e64        d.      SUBS     r4,r4,#1
        0x000016cc:    f000f808    ....    BL       _StoreChar ; 0x16e0
        0x000016d0:    f8da000c    ....    LDR      r0,[r10,#0xc]
        0x000016d4:    2800        .(      CMP      r0,#0
        0x000016d6:    daf2        ..      BGE      0x16be ; _PrintUnsigned + 170
        0x000016d8:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x000016dc:    00001bf8    ....    DCD    7160
    $t
    i._StoreChar
    _StoreChar
        0x000016e0:    b510        ..      PUSH     {r4,lr}
        0x000016e2:    4604        .F      MOV      r4,r0
        0x000016e4:    e9d43001    ...0    LDRD     r3,r0,[r4,#4]
        0x000016e8:    1c42        B.      ADDS     r2,r0,#1
        0x000016ea:    4293        .B      CMP      r3,r2
        0x000016ec:    d305        ..      BCC      0x16fa ; _StoreChar + 26
        0x000016ee:    6823        #h      LDR      r3,[r4,#0]
        0x000016f0:    5419        .T      STRB     r1,[r3,r0]
        0x000016f2:    60a2        .`      STR      r2,[r4,#8]
        0x000016f4:    68e0        .h      LDR      r0,[r4,#0xc]
        0x000016f6:    1c40        @.      ADDS     r0,r0,#1
        0x000016f8:    60e0        .`      STR      r0,[r4,#0xc]
        0x000016fa:    e9d40201    ....    LDRD     r0,r2,[r4,#4]
        0x000016fe:    4282        .B      CMP      r2,r0
        0x00001700:    d109        ..      BNE      0x1716 ; _StoreChar + 54
        0x00001702:    6821        !h      LDR      r1,[r4,#0]
        0x00001704:    6920         i      LDR      r0,[r4,#0x10]
        0x00001706:    f7fffd73    ..s.    BL       SEGGER_RTT_Write ; 0x11f0
        0x0000170a:    68a1        .h      LDR      r1,[r4,#8]
        0x0000170c:    4288        .B      CMP      r0,r1
        0x0000170e:    d003        ..      BEQ      0x1718 ; _StoreChar + 56
        0x00001710:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x00001714:    60e0        .`      STR      r0,[r4,#0xc]
        0x00001716:    bd10        ..      POP      {r4,pc}
        0x00001718:    2000        .       MOVS     r0,#0
        0x0000171a:    60a0        .`      STR      r0,[r4,#8]
        0x0000171c:    bd10        ..      POP      {r4,pc}
    i._WriteBlocking
    _WriteBlocking
        0x0000171e:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x00001722:    68c4        .h      LDR      r4,[r0,#0xc]
        0x00001724:    4617        .F      MOV      r7,r2
        0x00001726:    4689        .F      MOV      r9,r1
        0x00001728:    4605        .F      MOV      r5,r0
        0x0000172a:    f04f0800    O...    MOV      r8,#0
        0x0000172e:    6928        (i      LDR      r0,[r5,#0x10]
        0x00001730:    42a0        .B      CMP      r0,r4
        0x00001732:    d901        ..      BLS      0x1738 ; _WriteBlocking + 26
        0x00001734:    1b06        ..      SUBS     r6,r0,r4
        0x00001736:    e002        ..      B        0x173e ; _WriteBlocking + 32
        0x00001738:    68a9        .h      LDR      r1,[r5,#8]
        0x0000173a:    1a20         .      SUBS     r0,r4,r0
        0x0000173c:    1a0e        ..      SUBS     r6,r1,r0
        0x0000173e:    68a8        .h      LDR      r0,[r5,#8]
        0x00001740:    1e76        v.      SUBS     r6,r6,#1
        0x00001742:    1b00        ..      SUBS     r0,r0,r4
        0x00001744:    42b0        .B      CMP      r0,r6
        0x00001746:    d800        ..      BHI      0x174a ; _WriteBlocking + 44
        0x00001748:    4606        .F      MOV      r6,r0
        0x0000174a:    42be        .B      CMP      r6,r7
        0x0000174c:    d300        ..      BCC      0x1750 ; _WriteBlocking + 50
        0x0000174e:    463e        >F      MOV      r6,r7
        0x00001750:    6868        hh      LDR      r0,[r5,#4]
        0x00001752:    4632        2F      MOV      r2,r6
        0x00001754:    4420         D      ADD      r0,r0,r4
        0x00001756:    4649        IF      MOV      r1,r9
        0x00001758:    f7fefe91    ....    BL       __aeabi_memcpy ; 0x47e
        0x0000175c:    68a8        .h      LDR      r0,[r5,#8]
        0x0000175e:    1bbf        ..      SUBS     r7,r7,r6
        0x00001760:    4434        4D      ADD      r4,r4,r6
        0x00001762:    44b0        .D      ADD      r8,r8,r6
        0x00001764:    44b1        .D      ADD      r9,r9,r6
        0x00001766:    42a0        .B      CMP      r0,r4
        0x00001768:    d100        ..      BNE      0x176c ; _WriteBlocking + 78
        0x0000176a:    2400        .$      MOVS     r4,#0
        0x0000176c:    60ec        .`      STR      r4,[r5,#0xc]
        0x0000176e:    2f00        ./      CMP      r7,#0
        0x00001770:    d1dd        ..      BNE      0x172e ; _WriteBlocking + 16
        0x00001772:    4640        @F      MOV      r0,r8
        0x00001774:    e8bd87f0    ....    POP      {r4-r10,pc}
    i._WriteNoCheck
    _WriteNoCheck
        0x00001778:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0000177c:    4604        .F      MOV      r4,r0
        0x0000177e:    4688        .F      MOV      r8,r1
        0x00001780:    e9d40702    ....    LDRD     r0,r7,[r4,#8]
        0x00001784:    1bc5        ..      SUBS     r5,r0,r7
        0x00001786:    68e1        .h      LDR      r1,[r4,#0xc]
        0x00001788:    6860        `h      LDR      r0,[r4,#4]
        0x0000178a:    4616        .F      MOV      r6,r2
        0x0000178c:    4408        .D      ADD      r0,r0,r1
        0x0000178e:    42b5        .B      CMP      r5,r6
        0x00001790:    d906        ..      BLS      0x17a0 ; _WriteNoCheck + 40
        0x00001792:    4641        AF      MOV      r1,r8
        0x00001794:    f7fefe73    ..s.    BL       __aeabi_memcpy ; 0x47e
        0x00001798:    19b8        ..      ADDS     r0,r7,r6
        0x0000179a:    60e0        .`      STR      r0,[r4,#0xc]
        0x0000179c:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x000017a0:    462a        *F      MOV      r2,r5
        0x000017a2:    4641        AF      MOV      r1,r8
        0x000017a4:    f7fefe6b    ..k.    BL       __aeabi_memcpy ; 0x47e
        0x000017a8:    1b76        v.      SUBS     r6,r6,r5
        0x000017aa:    eb080105    ....    ADD      r1,r8,r5
        0x000017ae:    4632        2F      MOV      r2,r6
        0x000017b0:    6860        `h      LDR      r0,[r4,#4]
        0x000017b2:    f7fefe64    ..d.    BL       __aeabi_memcpy ; 0x47e
        0x000017b6:    60e6        .`      STR      r6,[r4,#0xc]
        0x000017b8:    e7f0        ..      B        0x179c ; _WriteNoCheck + 36
    i.__NVIC_EnableIRQ
    __NVIC_EnableIRQ
        0x000017ba:    2800        .(      CMP      r0,#0
        0x000017bc:    db09        ..      BLT      0x17d2 ; __NVIC_EnableIRQ + 24
        0x000017be:    f000021f    ....    AND      r2,r0,#0x1f
        0x000017c2:    2101        .!      MOVS     r1,#1
        0x000017c4:    4091        .@      LSLS     r1,r1,r2
        0x000017c6:    0940        @.      LSRS     r0,r0,#5
        0x000017c8:    0080        ..      LSLS     r0,r0,#2
        0x000017ca:    f10020e0    ...     ADD      r0,r0,#0xe000e000
        0x000017ce:    f8c01100    ....    STR      r1,[r0,#0x100]
        0x000017d2:    4770        pG      BX       lr
    i.__aeabi_assert
    __aeabi_assert
        0x000017d4:    b672        r.      CPSID    i
        0x000017d6:    4603        .F      MOV      r3,r0
        0x000017d8:    a001        ..      ADR      r0,{pc}+8 ; 0x17e0
        0x000017da:    f7fefd13    ....    BL       __2printf ; 0x204
        0x000017de:    e7fe        ..      B        0x17de ; __aeabi_assert + 10
    $d
        0x000017e0:    65737341    Asse    DCD    1702064961
        0x000017e4:    6f697472    rtio    DCD    1869182066
        0x000017e8:    6146206e    n Fa    DCD    1631985774
        0x000017ec:    64656c69    iled    DCD    1684368489
        0x000017f0:    6966203a    : fi    DCD    1768300602
        0x000017f4:    2520656c    le %    DCD    622880108
        0x000017f8:    6c202c73    s, l    DCD    1814047859
        0x000017fc:    20656e69    ine     DCD    543518313
        0x00001800:    202c6425    %d,     DCD    539780133
        0x00001804:    000a7325    %s..    DCD    684837
    $t
    i._is_digit
    _is_digit
        0x00001808:    3830        08      SUBS     r0,r0,#0x30
        0x0000180a:    280a        .(      CMP      r0,#0xa
        0x0000180c:    d201        ..      BCS      0x1812 ; _is_digit + 10
        0x0000180e:    2001        .       MOVS     r0,#1
        0x00001810:    4770        pG      BX       lr
        0x00001812:    2000        .       MOVS     r0,#0
        0x00001814:    4770        pG      BX       lr
        0x00001816:    0000        ..      MOVS     r0,r0
    i.adcc_m_adc_cfg_address_get
    adcc_m_adc_cfg_address_get
        0x00001818:    4801        .H      LDR      r0,[pc,#4] ; [0x1820] = 0x40009000
        0x0000181a:    6800        .h      LDR      r0,[r0,#0]
        0x0000181c:    4770        pG      BX       lr
    $d
        0x0000181e:    0000        ..      DCW    0
        0x00001820:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_adc_cfg_address_set
    adcc_m_adc_cfg_address_set
        0x00001824:    4901        .I      LDR      r1,[pc,#4] ; [0x182c] = 0x40009000
        0x00001826:    6008        .`      STR      r0,[r1,#0]
        0x00001828:    4770        pG      BX       lr
    $d
        0x0000182a:    0000        ..      DCW    0
        0x0000182c:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_adc_start_setf
    adcc_m_adc_start_setf
        0x00001830:    4903        .I      LDR      r1,[pc,#12] ; [0x1840] = 0x40009000
        0x00001832:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001834:    f3602108    `..!    BFI      r1,r0,#8,#1
        0x00001838:    4a01        .J      LDR      r2,[pc,#4] ; [0x1840] = 0x40009000
        0x0000183a:    60d1        .`      STR      r1,[r2,#0xc]
        0x0000183c:    4770        pG      BX       lr
    $d
        0x0000183e:    0000        ..      DCW    0
        0x00001840:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_adcnt_setf
    adcc_m_adcnt_setf
        0x00001844:    4903        .I      LDR      r1,[pc,#12] ; [0x1854] = 0x40009000
        0x00001846:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001848:    f3602149    `.I!    BFI      r1,r0,#9,#1
        0x0000184c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1854] = 0x40009000
        0x0000184e:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001850:    4770        pG      BX       lr
    $d
        0x00001852:    0000        ..      DCW    0
        0x00001854:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_adsm_setf
    adcc_m_adsm_setf
        0x00001858:    4903        .I      LDR      r1,[pc,#12] ; [0x1868] = 0x40009000
        0x0000185a:    6889        .h      LDR      r1,[r1,#8]
        0x0000185c:    f36021cb    `..!    BFI      r1,r0,#11,#1
        0x00001860:    4a01        .J      LDR      r2,[pc,#4] ; [0x1868] = 0x40009000
        0x00001862:    6091        .`      STR      r1,[r2,#8]
        0x00001864:    4770        pG      BX       lr
    $d
        0x00001866:    0000        ..      DCW    0
        0x00001868:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_losq_setf
    adcc_m_losq_setf
        0x0000186c:    4903        .I      LDR      r1,[pc,#12] ; [0x187c] = 0x40009000
        0x0000186e:    6989        .i      LDR      r1,[r1,#0x18]
        0x00001870:    f360611a    `..a    BFI      r1,r0,#24,#3
        0x00001874:    4a01        .J      LDR      r2,[pc,#4] ; [0x187c] = 0x40009000
        0x00001876:    6191        .a      STR      r1,[r2,#0x18]
        0x00001878:    4770        pG      BX       lr
    $d
        0x0000187a:    0000        ..      DCW    0
        0x0000187c:    40009000    ...@    DCD    1073778688
    $t
    i.adcc_m_sq0_setf
    adcc_m_sq0_setf
        0x00001880:    4903        .I      LDR      r1,[pc,#12] ; [0x1890] = 0x40009000
        0x00001882:    6989        .i      LDR      r1,[r1,#0x18]
        0x00001884:    f3600102    `...    BFI      r1,r0,#0,#3
        0x00001888:    4a01        .J      LDR      r2,[pc,#4] ; [0x1890] = 0x40009000
        0x0000188a:    6191        .a      STR      r1,[r2,#0x18]
        0x0000188c:    4770        pG      BX       lr
    $d
        0x0000188e:    0000        ..      DCW    0
        0x00001890:    40009000    ...@    DCD    1073778688
    $t
    i.adcen_setf
    adcen_setf
        0x00001894:    b570        p.      PUSH     {r4-r6,lr}
        0x00001896:    4604        .F      MOV      r4,r0
        0x00001898:    f7ffffbe    ....    BL       adcc_m_adc_cfg_address_get ; 0x1818
        0x0000189c:    4605        .F      MOV      r5,r0
        0x0000189e:    f0250501    %...    BIC      r5,r5,#1
        0x000018a2:    f0040001    ....    AND      r0,r4,#1
        0x000018a6:    4305        .C      ORRS     r5,r5,r0
        0x000018a8:    b11c        ..      CBZ      r4,0x18b2 ; adcen_setf + 30
        0x000018aa:    2004        .       MOVS     r0,#4
        0x000018ac:    4906        .I      LDR      r1,[pc,#24] ; [0x18c8] = 0x20000008
        0x000018ae:    7008        .p      STRB     r0,[r1,#0]
        0x000018b0:    e002        ..      B        0x18b8 ; adcen_setf + 36
        0x000018b2:    2000        .       MOVS     r0,#0
        0x000018b4:    4904        .I      LDR      r1,[pc,#16] ; [0x18c8] = 0x20000008
        0x000018b6:    7008        .p      STRB     r0,[r1,#0]
        0x000018b8:    4903        .I      LDR      r1,[pc,#12] ; [0x18c8] = 0x20000008
        0x000018ba:    7809        .x      LDRB     r1,[r1,#0]
        0x000018bc:    ea450001    E...    ORR      r0,r5,r1
        0x000018c0:    f7ffffb0    ....    BL       adcc_m_adc_cfg_address_set ; 0x1824
        0x000018c4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000018c6:    0000        ..      DCW    0
        0x000018c8:    20000008    ...     DCD    536870920
    $t
    i.adcpre_setf
    adcpre_setf
        0x000018cc:    b570        p.      PUSH     {r4-r6,lr}
        0x000018ce:    4605        .F      MOV      r5,r0
        0x000018d0:    f7ffffa2    ....    BL       adcc_m_adc_cfg_address_get ; 0x1818
        0x000018d4:    4604        .F      MOV      r4,r0
        0x000018d6:    f0240470    $.p.    BIC      r4,r4,#0x70
        0x000018da:    f0050007    ....    AND      r0,r5,#7
        0x000018de:    ea441400    D...    ORR      r4,r4,r0,LSL #4
        0x000018e2:    4903        .I      LDR      r1,[pc,#12] ; [0x18f0] = 0x20000008
        0x000018e4:    7809        .x      LDRB     r1,[r1,#0]
        0x000018e6:    ea440001    D...    ORR      r0,r4,r1
        0x000018ea:    f7ffff9b    ....    BL       adcc_m_adc_cfg_address_set ; 0x1824
        0x000018ee:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x000018f0:    20000008    ...     DCD    536870920
    $t
    i.dma_isr
    dma_isr
        0x000018f4:    b510        ..      PUSH     {r4,lr}
        0x000018f6:    f7fff9ab    ....    BL       HAL_DMAC_Int_Status ; 0xc50
        0x000018fa:    0780        ..      LSLS     r0,r0,#30
        0x000018fc:    d514        ..      BPL      0x1928 ; dma_isr + 52
        0x000018fe:    f7fffa05    ....    BL       HAL_DMAC_Status_Block ; 0xd0c
        0x00001902:    07c0        ..      LSLS     r0,r0,#31
        0x00001904:    d002        ..      BEQ      0x190c ; dma_isr + 24
        0x00001906:    2001        .       MOVS     r0,#1
        0x00001908:    f7fff88a    ....    BL       HAL_DMAC_Clr_Block ; 0xa20
        0x0000190c:    f7fff9fe    ....    BL       HAL_DMAC_Status_Block ; 0xd0c
        0x00001910:    0780        ..      LSLS     r0,r0,#30
        0x00001912:    d509        ..      BPL      0x1928 ; dma_isr + 52
        0x00001914:    2002        .       MOVS     r0,#2
        0x00001916:    f7fff883    ....    BL       HAL_DMAC_Clr_Block ; 0xa20
        0x0000191a:    a004        ..      ADR      r0,{pc}+0x12 ; 0x192c
        0x0000191c:    f7fefc72    ..r.    BL       __2printf ; 0x204
        0x00001920:    e8bd4010    ...@    POP      {r4,lr}
        0x00001924:    f7febfd1    ....    B        HAL_ADCCM_ADC_Stop ; 0x8ca
        0x00001928:    bd10        ..      POP      {r4,pc}
    $d
        0x0000192a:    0000        ..      DCW    0
        0x0000192c:    20616d64    dma     DCD    543255908
        0x00001930:    6e616863    chan    DCD    1851877475
        0x00001934:    206c656e    nel     DCD    543974766
        0x00001938:    69662031    1 fi    DCD    1768300593
        0x0000193c:    6873696e    nish    DCD    1752394094
        0x00001940:    0000000a    ....    DCD    10
    $t
    i.dmac_ch0_cfg_h_pack
    dmac_ch0_cfg_h_pack
        0x00001944:    b570        p.      PUSH     {r4-r6,lr}
        0x00001946:    9c04        ..      LDR      r4,[sp,#0x10]
        0x00001948:    02c5        ..      LSLS     r5,r0,#11
        0x0000194a:    ea4515c1    E...    ORR      r5,r5,r1,LSL #7
        0x0000194e:    ea450582    E...    ORR      r5,r5,r2,LSL #2
        0x00001952:    ea450543    E.C.    ORR      r5,r5,r3,LSL #1
        0x00001956:    4325        %C      ORRS     r5,r5,r4
        0x00001958:    4e01        .N      LDR      r6,[pc,#4] ; [0x1960] = 0x40010000
        0x0000195a:    6475        ud      STR      r5,[r6,#0x44]
        0x0000195c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x0000195e:    0000        ..      DCW    0
        0x00001960:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_cfg_l_pack
    dmac_ch0_cfg_l_pack
        0x00001964:    b5f0        ..      PUSH     {r4-r7,lr}
        0x00001966:    ac05        ..      ADD      r4,sp,#0x14
        0x00001968:    cc70        p.      LDM      r4,{r4-r6}
        0x0000196a:    0507        ..      LSLS     r7,r0,#20
        0x0000196c:    ea4747c1    G..G    ORR      r7,r7,r1,LSL #19
        0x00001970:    ea474782    G..G    ORR      r7,r7,r2,LSL #18
        0x00001974:    ea4727c3    G..'    ORR      r7,r7,r3,LSL #11
        0x00001978:    ea472784    G..'    ORR      r7,r7,r4,LSL #10
        0x0000197c:    ea472705    G..'    ORR      r7,r7,r5,LSL #8
        0x00001980:    ea471746    G.F.    ORR      r7,r7,r6,LSL #5
        0x00001984:    f8dfc008    ....    LDR      r12,[pc,#8] ; [0x1990] = 0x40010000
        0x00001988:    f8cc7040    ..@p    STR      r7,[r12,#0x40]
        0x0000198c:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x0000198e:    0000        ..      DCW    0
        0x00001990:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_h_pack
    dmac_ch0_ctrl_h_pack
        0x00001994:    ea413200    A..2    ORR      r2,r1,r0,LSL #12
        0x00001998:    4b01        .K      LDR      r3,[pc,#4] ; [0x19a0] = 0x40010000
        0x0000199a:    61da        .a      STR      r2,[r3,#0x1c]
        0x0000199c:    4770        pG      BX       lr
    $d
        0x0000199e:    0000        ..      DCW    0
        0x000019a0:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_ctrl_l_pack
    dmac_ch0_ctrl_l_pack
        0x000019a4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x000019a8:    ac06        ..      ADD      r4,sp,#0x18
        0x000019aa:    ccf0        ..      LDM      r4,{r4-r7}
        0x000019ac:    ea4f5c00    O..\    LSL      r12,r0,#20
        0x000019b0:    ea4c3c81    L..<    ORR      r12,r12,r1,LSL #14
        0x000019b4:    ea4c2cc2    L..,    ORR      r12,r12,r2,LSL #11
        0x000019b8:    ea4c2c43    L.C,    ORR      r12,r12,r3,LSL #9
        0x000019bc:    ea4c1cc4    L...    ORR      r12,r12,r4,LSL #7
        0x000019c0:    ea4c1c05    L...    ORR      r12,r12,r5,LSL #4
        0x000019c4:    ea4c0c46    L.F.    ORR      r12,r12,r6,LSL #1
        0x000019c8:    ea4c0c07    L...    ORR      r12,r12,r7
        0x000019cc:    f8df8008    ....    LDR      r8,[pc,#8] ; [0x19d8] = 0x40010000
        0x000019d0:    f8c8c018    ....    STR      r12,[r8,#0x18]
        0x000019d4:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x000019d8:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_dar_l_set
    dmac_ch0_dar_l_set
        0x000019dc:    4901        .I      LDR      r1,[pc,#4] ; [0x19e4] = 0x40010000
        0x000019de:    6088        .`      STR      r0,[r1,#8]
        0x000019e0:    4770        pG      BX       lr
    $d
        0x000019e2:    0000        ..      DCW    0
        0x000019e4:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch0_sar_l_set
    dmac_ch0_sar_l_set
        0x000019e8:    4901        .I      LDR      r1,[pc,#4] ; [0x19f0] = 0x40010000
        0x000019ea:    6008        .`      STR      r0,[r1,#0]
        0x000019ec:    4770        pG      BX       lr
    $d
        0x000019ee:    0000        ..      DCW    0
        0x000019f0:    40010000    ...@    DCD    1073807360
    $t
    i.dmac_ch1_cfg_h_pack
    dmac_ch1_cfg_h_pack
        0x000019f4:    b570        p.      PUSH     {r4-r6,lr}
        0x000019f6:    9c04        ..      LDR      r4,[sp,#0x10]
        0x000019f8:    02c5        ..      LSLS     r5,r0,#11
        0x000019fa:    ea4515c1    E...    ORR      r5,r5,r1,LSL #7
        0x000019fe:    ea450582    E...    ORR      r5,r5,r2,LSL #2
        0x00001a02:    ea450543    E.C.    ORR      r5,r5,r3,LSL #1
        0x00001a06:    4325        %C      ORRS     r5,r5,r4
        0x00001a08:    4e01        .N      LDR      r6,[pc,#4] ; [0x1a10] = 0x4001009c
        0x00001a0a:    6035        5`      STR      r5,[r6,#0]
        0x00001a0c:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x00001a0e:    0000        ..      DCW    0
        0x00001a10:    4001009c    ...@    DCD    1073807516
    $t
    i.dmac_chenreg_l_pack
    dmac_chenreg_l_pack
        0x00001a14:    ea412200    A.."    ORR      r2,r1,r0,LSL #8
        0x00001a18:    4b01        .K      LDR      r3,[pc,#4] ; [0x1a20] = 0x400103a0
        0x00001a1a:    601a        .`      STR      r2,[r3,#0]
        0x00001a1c:    4770        pG      BX       lr
    $d
        0x00001a1e:    0000        ..      DCW    0
        0x00001a20:    400103a0    ...@    DCD    1073808288
    $t
    i.dmac_dmacfgreg_l_set
    dmac_dmacfgreg_l_set
        0x00001a24:    4901        .I      LDR      r1,[pc,#4] ; [0x1a2c] = 0x40010398
        0x00001a26:    6008        .`      STR      r0,[r1,#0]
        0x00001a28:    4770        pG      BX       lr
    $d
        0x00001a2a:    0000        ..      DCW    0
        0x00001a2c:    40010398    ...@    DCD    1073808280
    $t
    i.fputc
    fputc
        0x00001a30:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x00001a32:    2201        ."      MOVS     r2,#1
        0x00001a34:    4669        iF      MOV      r1,sp
        0x00001a36:    2000        .       MOVS     r0,#0
        0x00001a38:    f7fffbda    ....    BL       SEGGER_RTT_Write ; 0x11f0
        0x00001a3c:    9800        ..      LDR      r0,[sp,#0]
        0x00001a3e:    bd1c        ..      POP      {r2-r4,pc}
    i.gpio_portadataregister_setf
    gpio_portadataregister_setf
        0x00001a40:    4903        .I      LDR      r1,[pc,#12] ; [0x1a50] = 0x40007000
        0x00001a42:    6809        .h      LDR      r1,[r1,#0]
        0x00001a44:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001a48:    4a01        .J      LDR      r2,[pc,#4] ; [0x1a50] = 0x40007000
        0x00001a4a:    6011        .`      STR      r1,[r2,#0]
        0x00001a4c:    4770        pG      BX       lr
    $d
        0x00001a4e:    0000        ..      DCW    0
        0x00001a50:    40007000    .p.@    DCD    1073770496
    $t
    i.gpio_portbdataregister_setf
    gpio_portbdataregister_setf
        0x00001a54:    4903        .I      LDR      r1,[pc,#12] ; [0x1a64] = 0x40007000
        0x00001a56:    68c9        .h      LDR      r1,[r1,#0xc]
        0x00001a58:    f360010f    `...    BFI      r1,r0,#0,#16
        0x00001a5c:    4a01        .J      LDR      r2,[pc,#4] ; [0x1a64] = 0x40007000
        0x00001a5e:    60d1        .`      STR      r1,[r2,#0xc]
        0x00001a60:    4770        pG      BX       lr
    $d
        0x00001a62:    0000        ..      DCW    0
        0x00001a64:    40007000    .p.@    DCD    1073770496
    $t
    i.int_callback_register
    int_callback_register
        0x00001a68:    b510        ..      PUSH     {r4,lr}
        0x00001a6a:    2812        .(      CMP      r0,#0x12
        0x00001a6c:    d301        ..      BCC      0x1a72 ; int_callback_register + 10
        0x00001a6e:    f7fefcd7    ....    BL       abort ; 0x420
        0x00001a72:    4b03        .K      LDR      r3,[pc,#12] ; [0x1a80] = 0x88
        0x00001a74:    f8431030    C.0.    STR      r1,[r3,r0,LSL #3]
        0x00001a78:    eb0300c0    ....    ADD      r0,r3,r0,LSL #3
        0x00001a7c:    6042        B`      STR      r2,[r0,#4]
        0x00001a7e:    bd10        ..      POP      {r4,pc}
    $d
        0x00001a80:    00000088    ....    DCD    136
    $t
    i.main
    main
        0x00001a84:    a104        ..      ADR      r1,{pc}+0x14 ; 0x1a98
        0x00001a86:    2000        .       MOVS     r0,#0
        0x00001a88:    f7fffbfc    ....    BL       SEGGER_RTT_printf ; 0x1284
        0x00001a8c:    f000f81c    ....    BL       test_adc_contiune_scan ; 0x1ac8
        0x00001a90:    f000f86e    ..n.    BL       test_gpio ; 0x1b70
        0x00001a94:    e7fe        ..      B        0x1a94 ; main + 16
    $d
        0x00001a96:    0000        ..      DCW    0
        0x00001a98:    20555043    CPU     DCD    542462019
        0x00001a9c:    72617473    star    DCD    1918989427
        0x00001aa0:    2e2e2e74    t...    DCD    774778484
        0x00001aa4:    00000a2e    ....    DCD    2606
    $t
    i.sysc_awo_div_update_set
    sysc_awo_div_update_set
        0x00001aa8:    4901        .I      LDR      r1,[pc,#4] ; [0x1ab0] = 0x40020000
        0x00001aaa:    6008        .`      STR      r0,[r1,#0]
        0x00001aac:    4770        pG      BX       lr
    $d
        0x00001aae:    0000        ..      DCW    0
        0x00001ab0:    40020000    ...@    DCD    1073872896
    $t
    i.sysc_awo_rtc_div_para_m1_setf
    sysc_awo_rtc_div_para_m1_setf
        0x00001ab4:    4903        .I      LDR      r1,[pc,#12] ; [0x1ac4] = 0x40020000
        0x00001ab6:    6849        Ih      LDR      r1,[r1,#4]
        0x00001ab8:    f3602114    `..!    BFI      r1,r0,#8,#13
        0x00001abc:    4a01        .J      LDR      r2,[pc,#4] ; [0x1ac4] = 0x40020000
        0x00001abe:    6051        Q`      STR      r1,[r2,#4]
        0x00001ac0:    4770        pG      BX       lr
    $d
        0x00001ac2:    0000        ..      DCW    0
        0x00001ac4:    40020000    ...@    DCD    1073872896
    $t
    i.test_adc_contiune_scan
    test_adc_contiune_scan
        0x00001ac8:    b510        ..      PUSH     {r4,lr}
        0x00001aca:    4925        %I      LDR      r1,[pc,#148] ; [0x1b60] = 0x2faf08
        0x00001acc:    2400        .$      MOVS     r4,#0
        0x00001ace:    b086        ..      SUB      sp,sp,#0x18
        0x00001ad0:    f3640207    d...    BFI      r2,r4,#0,#8
        0x00001ad4:    00c8        ..      LSLS     r0,r1,#3
        0x00001ad6:    f7feff09    ....    BL       HAL_ADCCM_Init ; 0x8ec
        0x00001ada:    f10d0c04    ....    ADD      r12,sp,#4
        0x00001ade:    2307        .#      MOVS     r3,#7
        0x00001ae0:    2206        ."      MOVS     r2,#6
        0x00001ae2:    2105        .!      MOVS     r1,#5
        0x00001ae4:    2004        .       MOVS     r0,#4
        0x00001ae6:    e88c000f    ....    STM      r12,{r0-r3}
        0x00001aea:    2003        .       MOVS     r0,#3
        0x00001aec:    9000        ..      STR      r0,[sp,#0]
        0x00001aee:    2302        .#      MOVS     r3,#2
        0x00001af0:    2201        ."      MOVS     r2,#1
        0x00001af2:    2100        .!      MOVS     r1,#0
        0x00001af4:    2008        .       MOVS     r0,#8
        0x00001af6:    f7feff3f    ..?.    BL       HAL_ADCCM_Set_ADC_Squence ; 0x978
        0x00001afa:    2001        .       MOVS     r0,#1
        0x00001afc:    f7feff8a    ....    BL       HAL_ADCCM_WorkMode ; 0xa14
        0x00001b00:    2001        .       MOVS     r0,#1
        0x00001b02:    f7fefee7    ....    BL       HAL_ADCCM_DMA_En ; 0x8d4
        0x00001b06:    200b        .       MOVS     r0,#0xb
        0x00001b08:    4631        1F      MOV      r1,r6
        0x00001b0a:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001b0e:    2002        .       MOVS     r0,#2
        0x00001b10:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00001b14:    462a        *F      MOV      r2,r5
        0x00001b16:    f3644117    d..A    BFI      r1,r4,#16,#8
        0x00001b1a:    f3600207    `...    BFI      r2,r0,#0,#8
        0x00001b1e:    f360611f    `..a    BFI      r1,r0,#24,#8
        0x00001b22:    f364220f    d.."    BFI      r2,r4,#8,#8
        0x00001b26:    2001        .       MOVS     r0,#1
        0x00001b28:    f3604217    `..B    BFI      r2,r0,#16,#8
        0x00001b2c:    2002        .       MOVS     r0,#2
        0x00001b2e:    f7feff7f    ....    BL       HAL_DMAC_Init ; 0xa30
        0x00001b32:    2102        .!      MOVS     r1,#2
        0x00001b34:    4608        .F      MOV      r0,r1
        0x00001b36:    f7fff8f1    ....    BL       HAL_DMAC_UnMask_Block ; 0xd1c
        0x00001b3a:    2100        .!      MOVS     r1,#0
        0x00001b3c:    4809        .H      LDR      r0,[pc,#36] ; [0x1b64] = 0x18f5
        0x00001b3e:    f7fefe97    ....    BL       DMAC_Int_Register ; 0x870
        0x00001b42:    2003        .       MOVS     r0,#3
        0x00001b44:    f7fffe39    ..9.    BL       __NVIC_EnableIRQ ; 0x17ba
        0x00001b48:    2310        .#      MOVS     r3,#0x10
        0x00001b4a:    4a07        .J      LDR      r2,[pc,#28] ; [0x1b68] = 0x200004c4
        0x00001b4c:    4907        .I      LDR      r1,[pc,#28] ; [0x1b6c] = 0x40009040
        0x00001b4e:    2002        .       MOVS     r0,#2
        0x00001b50:    f7fff886    ....    BL       HAL_DMAC_Start_Transfer ; 0xc60
        0x00001b54:    b006        ..      ADD      sp,sp,#0x18
        0x00001b56:    e8bd4010    ...@    POP      {r4,lr}
        0x00001b5a:    f7febeb1    ....    B        HAL_ADCCM_ADC_Start ; 0x8c0
    $d
        0x00001b5e:    0000        ..      DCW    0
        0x00001b60:    002faf08    ../.    DCD    3125000
        0x00001b64:    000018f5    ....    DCD    6389
        0x00001b68:    200004c4    ...     DCD    536872132
        0x00001b6c:    40009040    @..@    DCD    1073778752
    $t
    i.test_gpio
    test_gpio
        0x00001b70:    2001        .       MOVS     r0,#1
        0x00001b72:    f3600107    `...    BFI      r1,r0,#0,#8
        0x00001b76:    f360210f    `..!    BFI      r1,r0,#8,#8
        0x00001b7a:    f3604117    `..A    BFI      r1,r0,#16,#8
        0x00001b7e:    460c        .F      MOV      r4,r1
        0x00001b80:    2010        .       MOVS     r0,#0x10
        0x00001b82:    f7fff8d5    ....    BL       HAL_GPIO_Init ; 0xd30
        0x00001b86:    4621        !F      MOV      r1,r4
        0x00001b88:    2011        .       MOVS     r0,#0x11
        0x00001b8a:    f7fff8d1    ....    BL       HAL_GPIO_Init ; 0xd30
        0x00001b8e:    f44f777a    O.zw    MOV      r7,#0x3e8
        0x00001b92:    f2413688    A..6    MOV      r6,#0x1388
        0x00001b96:    2101        .!      MOVS     r1,#1
        0x00001b98:    2010        .       MOVS     r0,#0x10
        0x00001b9a:    f7fff989    ....    BL       HAL_GPIO_WritePin ; 0xeb0
        0x00001b9e:    2101        .!      MOVS     r1,#1
        0x00001ba0:    2011        .       MOVS     r0,#0x11
        0x00001ba2:    f7fff985    ....    BL       HAL_GPIO_WritePin ; 0xeb0
        0x00001ba6:    4638        8F      MOV      r0,r7
        0x00001ba8:    4635        5F      MOV      r5,r6
        0x00001baa:    1e6d        m.      SUBS     r5,r5,#1
        0x00001bac:    d1fd        ..      BNE      0x1baa ; test_gpio + 58
        0x00001bae:    1e40        @.      SUBS     r0,r0,#1
        0x00001bb0:    d1fa        ..      BNE      0x1ba8 ; test_gpio + 56
        0x00001bb2:    2100        .!      MOVS     r1,#0
        0x00001bb4:    2010        .       MOVS     r0,#0x10
        0x00001bb6:    f7fff97b    ..{.    BL       HAL_GPIO_WritePin ; 0xeb0
        0x00001bba:    2100        .!      MOVS     r1,#0
        0x00001bbc:    2011        .       MOVS     r0,#0x11
        0x00001bbe:    f7fff977    ..w.    BL       HAL_GPIO_WritePin ; 0xeb0
        0x00001bc2:    4638        8F      MOV      r0,r7
        0x00001bc4:    4634        4F      MOV      r4,r6
        0x00001bc6:    1e64        d.      SUBS     r4,r4,#1
        0x00001bc8:    d1fd        ..      BNE      0x1bc6 ; test_gpio + 86
        0x00001bca:    1e40        @.      SUBS     r0,r0,#1
        0x00001bcc:    d1fa        ..      BNE      0x1bc4 ; test_gpio + 84
        0x00001bce:    a002        ..      ADR      r0,{pc}+0xa ; 0x1bd8
        0x00001bd0:    f7fefb18    ....    BL       __2printf ; 0x204
        0x00001bd4:    e7df        ..      B        0x1b96 ; test_gpio + 38
    $d
        0x00001bd6:    0000        ..      DCW    0
        0x00001bd8:    32666c45    Elf2    DCD    845573189
        0x00001bdc:    55434d20     MCU    DCD    1430474016
        0x00001be0:    69755120     Qui    DCD    1769296160
        0x00001be4:    74736b63    ckst    DCD    1953721187
        0x00001be8:    20747261    art     DCD    544502369
        0x00001bec:    6a6f7250    Proj    DCD    1785688656
        0x00001bf0:    7e746365    ect~    DCD    2121556837
        0x00001bf4:    0000000a    ....    DCD    10
    $d.realdata
    .constdata
    _aV2C
        0x00001bf8:    33323130    0123    DCD    858927408
        0x00001bfc:    37363534    4567    DCD    926299444
        0x00001c00:    42413938    89AB    DCD    1111570744
        0x00001c04:    46454443    CDEF    DCD    1178944579
    .constdata
    maptable
        0x00001c08:    08000004    ....    DCD    134217732
        0x00001c0c:    00000000    ....    DCD    0
        0x00001c10:    02000000    ....    DCD    33554432
        0x00001c14:    00000100    ....    DCD    256
        0x00001c18:    00000010    ....    DCD    16
    Region$$Table$$Base
        0x00001c1c:    00001c3c    <...    DCD    7228
        0x00001c20:    20000000    ...     DCD    536870912
        0x00001c24:    0000000c    ....    DCD    12
        0x00001c28:    00000154    T...    DCD    340
        0x00001c2c:    00001c48    H...    DCD    7240
        0x00001c30:    2000000c    ...     DCD    536870924
        0x00001c34:    00000a5c    \...    DCD    2652
        0x00001c38:    00000170    p...    DCD    368
    Region$$Table$$Limit

====================================

** Section #4

    Name        : RW_IRAM0
    Type        : SHT_PROGBITS (0x00000001)
    Flags       : SHF_ALLOC + SHF_WRITE (0x00000003)
    Addr        : 0x20000000
    File Offset : 7280 (0x1c70)
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
    File Offset : 7292 (0x1c7c)
    Size        : 2652 bytes (0xa5c)
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
    File Offset : 7292 (0x1c7c)
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
    File Offset : 8768 (0x2240)
    Size        : 3624 bytes (0xe28)
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
    File Offset : 12392 (0x3068)
    Size        : 130164 bytes (0x1fc74)
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
    File Offset : 142556 (0x22cdc)
    Size        : 16356 bytes (0x3fe4)
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
    File Offset : 158912 (0x26cc0)
    Size        : 7724 bytes (0x1e2c)
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
    File Offset : 166636 (0x28aec)
    Size        : 31320 bytes (0x7a58)
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
    File Offset : 197956 (0x30544)
    Size        : 2435 bytes (0x983)
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
    File Offset : 200392 (0x30ec8)
    Size        : 10960 bytes (0x2ad0)
    Link        : Section 14 (.strtab)
    Info        : Last local symbol no = 513
    Alignment   : 4
    Entry Size  : 16


====================================

** Section #14

    Name        : .strtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 211352 (0x33998)
    Size        : 8820 bytes (0x2274)
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
    File Offset : 220172 (0x35c0c)
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
    File Offset : 220208 (0x35c30)
    Size        : 14256 bytes (0x37b0)
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
    
    p2958-3
    
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
    
    p2de8-3
    
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
    
    p2cfc-3
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    test_gpio.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_gpio.o --depend=.\objects\test_gpio.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\test_gpio.crf src\test_gpio.c
    
    
    
    
    test_adc.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armlink [4d35e2]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\test_adc.o --vfemode=force

    Input Comments:
    
    p2cb4-3
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: armasm [4d35e1]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    test_adc.o
    
    Component: ARM Compiler 5.06 update 5 (build 528) Tool: ArmCC [4d3621]
    ArmCC --c99 --split_sections --debug -c -o.\objects\test_adc.o --depend=.\objects\test_adc.d --cpu=Cortex-M3 --apcs=interwork --diag_suppress=9931 -I..\..\..\ELF2_BSP -I..\..\..\ELF2_BSP\CMSIS\Core\Include -I..\..\..\ELF2_BSP\Debug -I..\..\..\ELF2_BSP\Debug\RTT -I..\..\..\ELF2_BSP\Device\ELF2\Include -I..\..\..\ELF2_BSP\Driver -I..\..\..\ELF2_BSP\Driver\regmap -I..\..\..\ELF2_BSP\Device\ELF2\Source\ARM -I.\RTE\_demo -ID:\keil\ARM\PACK\ARM\CMSIS\5.3.0\Device\ARM\ARMCM3\Include -ID:\keil\ARM\CMSIS\Include -D__UVISION_VERSION=524 -DARMCM3 --omf_browse=.\objects\test_adc.crf src\test_adc.c
    
    
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
    
    
    
    adcc_m.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armlink [4d35a8]
    armlink --partial --no_add_relocs_to_undefined --no_generate_mapping_symbols --diag_suppress=9931,9931,6642 --cpu=Cortex-M3 --fpu=SoftVFP --output=.\objects\adcc_m.o --vfemode=force

    Input Comments:
    
    p2358-3
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: armasm [4d35a5]
    armasm --debug --diag_suppress=9931,9931,1602,1073 --cpu=Cortex-M3 --fpu=SoftVFP --apcs=/interwork/interwork --divide 
    adcc_m.o
    
    Component: ARM Compiler 5.06 update 1 (build 61) Tool: ArmCC [4d35ad]
    ArmCC --c99 --split_sections --debug -c -o.\objects\adcc_m.o --depend=.\objects\adcc_m.d --cpu=Cortex-M3 --apcs=interwork -O0 --diag_suppress=9931 -I..\sdk\src\Device\ELF2\Include -I..\sdk\src\CMSIS\Core\Include -I..\sdk -I..\sdk\src\soc\debug\RTT -I..\sdk\src\soc\debug -I..\sdk\src\soc\driver\regmap -I..\sdk\src\soc\driver -II:\project\ELF2\lib_tester\RTE -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\4.5.0\Device\ARM\ARMCM3\Include -IC:\Keil_v5\ARM\CMSIS\Include -D__UVISION_VERSION=518 -DARMCM3 --omf_browse=.\objects\adcc_m.crf ..\sdk\src\soc\driver\adcc_m.c
    
    
    
    

====================================

** Section #17

    Name        : .shstrtab
    Type        : SHT_STRTAB (0x00000003)
    Flags       : None (0x00000000)
    Addr        : 0x00000000
    File Offset : 234464 (0x393e0)
    Size        : 180 bytes (0xb4)
    Link        : SHN_UNDEF
    Info        : 0
    Alignment   : 1
    Entry Size  : 0


====================================

address     size       variable name                            type
0x20000008  0x1        mcu_bit                                  uint8_t

address     size       variable name                            type
0x200004c4  0x40       adc_result                               array[16] of volatile uint32_t

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
0x00000088  0x90       int_callback                             array[18] of int_callback_t

address     size       variable name                            type
0x20000000  0x4        SystemCoreClock                          uint32_t

