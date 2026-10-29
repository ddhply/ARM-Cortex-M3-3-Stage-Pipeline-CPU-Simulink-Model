
========================================================================

** ELF Header Information

    File Name: ..\..\Output\atk_f103.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x08000131
    Flags: EF_ARM_HASENTRY + EF_ARM_ABI_FLOAT_SOFT (0x05000202)

    ARM ELF revision: 5 (ABI version 2)

    Conforms to Soft float procedure-call standard

    Built with
    Component: ARM Compiler 5.06 update 7 (build 960) Tool: armasm [4d35fa]
    Component: ARM Compiler 5.06 update 7 (build 960) Tool: armlink [4d3601]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 1
    Section header entries: 16

    Program header offset: 41788 (0x0000a33c)
    Section header offset: 41820 (0x0000a35c)

    Section header string table index: 15

========================================================================

** Program header #0 (PT_LOAD) [PF_X + PF_W + PF_R + PF_ARM_ENTRY]
    Size : 5504 bytes (4184 bytes in file)
    Virtual address: 0x08000000 (Alignment 8)


========================================================================

** Section #1 'ER_IROM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_EXECINSTR]
    Size   : 4176 bytes (alignment 4)
    Address: 0x08000000

    $d.realdata
    RESET
    __Vectors
        0x08000000:    20000530    0..     DCD    536872240
        0x08000004:    080001cd    ....    DCD    134218189
        0x08000008:    080001d1    ....    DCD    134218193
        0x0800000c:    080001d3    ....    DCD    134218195
        0x08000010:    080001d5    ....    DCD    134218197
        0x08000014:    080001d7    ....    DCD    134218199
        0x08000018:    080001d9    ....    DCD    134218201
        0x0800001c:    00000000    ....    DCD    0
        0x08000020:    00000000    ....    DCD    0
        0x08000024:    00000000    ....    DCD    0
        0x08000028:    00000000    ....    DCD    0
        0x0800002c:    080001db    ....    DCD    134218203
        0x08000030:    080001dd    ....    DCD    134218205
        0x08000034:    00000000    ....    DCD    0
        0x08000038:    080001df    ....    DCD    134218207
        0x0800003c:    080001e1    ....    DCD    134218209
        0x08000040:    080001e3    ....    DCD    134218211
        0x08000044:    080001e3    ....    DCD    134218211
        0x08000048:    080001e3    ....    DCD    134218211
        0x0800004c:    080001e3    ....    DCD    134218211
        0x08000050:    080001e3    ....    DCD    134218211
        0x08000054:    080001e3    ....    DCD    134218211
        0x08000058:    080001e3    ....    DCD    134218211
        0x0800005c:    080001e3    ....    DCD    134218211
        0x08000060:    080001e3    ....    DCD    134218211
        0x08000064:    080001e3    ....    DCD    134218211
        0x08000068:    080001e3    ....    DCD    134218211
        0x0800006c:    080001e3    ....    DCD    134218211
        0x08000070:    080001e3    ....    DCD    134218211
        0x08000074:    080001e3    ....    DCD    134218211
        0x08000078:    080001e3    ....    DCD    134218211
        0x0800007c:    080001e3    ....    DCD    134218211
        0x08000080:    080001e3    ....    DCD    134218211
        0x08000084:    080001e3    ....    DCD    134218211
        0x08000088:    080001e3    ....    DCD    134218211
        0x0800008c:    080001e3    ....    DCD    134218211
        0x08000090:    080001e3    ....    DCD    134218211
        0x08000094:    080001e3    ....    DCD    134218211
        0x08000098:    080001e3    ....    DCD    134218211
        0x0800009c:    080001e3    ....    DCD    134218211
        0x080000a0:    080001e3    ....    DCD    134218211
        0x080000a4:    080001e3    ....    DCD    134218211
        0x080000a8:    080001e3    ....    DCD    134218211
        0x080000ac:    080001e3    ....    DCD    134218211
        0x080000b0:    080001e3    ....    DCD    134218211
        0x080000b4:    080001e3    ....    DCD    134218211
        0x080000b8:    080001e3    ....    DCD    134218211
        0x080000bc:    080001e3    ....    DCD    134218211
        0x080000c0:    080001e3    ....    DCD    134218211
        0x080000c4:    080001e3    ....    DCD    134218211
        0x080000c8:    080001e3    ....    DCD    134218211
        0x080000cc:    080001e3    ....    DCD    134218211
        0x080000d0:    080001e3    ....    DCD    134218211
        0x080000d4:    08000321    !...    DCD    134218529
        0x080000d8:    080001e3    ....    DCD    134218211
        0x080000dc:    080001e3    ....    DCD    134218211
        0x080000e0:    080001e3    ....    DCD    134218211
        0x080000e4:    080001e3    ....    DCD    134218211
        0x080000e8:    080001e3    ....    DCD    134218211
        0x080000ec:    080001e3    ....    DCD    134218211
        0x080000f0:    080001e3    ....    DCD    134218211
        0x080000f4:    080001e3    ....    DCD    134218211
        0x080000f8:    080001e3    ....    DCD    134218211
        0x080000fc:    080001e3    ....    DCD    134218211
        0x08000100:    080001e3    ....    DCD    134218211
        0x08000104:    080001e3    ....    DCD    134218211
        0x08000108:    080001e3    ....    DCD    134218211
        0x0800010c:    080001e3    ....    DCD    134218211
        0x08000110:    080001e3    ....    DCD    134218211
        0x08000114:    080001e3    ....    DCD    134218211
        0x08000118:    080001e3    ....    DCD    134218211
        0x0800011c:    080001e3    ....    DCD    134218211
        0x08000120:    080001e3    ....    DCD    134218211
        0x08000124:    080001e3    ....    DCD    134218211
        0x08000128:    080001e3    ....    DCD    134218211
        0x0800012c:    080001e3    ....    DCD    134218211
    $t
    !!!main
    __Vectors_End
    __main
        0x08000130:    f000f802    ....    BL       __scatterload ; 0x8000138
        0x08000134:    f000f83a    ..:.    BL       __rt_entry ; 0x80001ac
    !!!scatter
    __scatterload
    __scatterload_rt2
    __scatterload_rt2_thumb_only
        0x08000138:    a00a        ..      ADR      r0,{pc}+0x2c ; 0x8000164
        0x0800013a:    e8900c00    ....    LDM      r0,{r10,r11}
        0x0800013e:    4482        .D      ADD      r10,r10,r0
        0x08000140:    4483        .D      ADD      r11,r11,r0
        0x08000142:    f1aa0701    ....    SUB      r7,r10,#1
    __scatterload_null
        0x08000146:    45da        .E      CMP      r10,r11
        0x08000148:    d101        ..      BNE      0x800014e ; __scatterload_null + 8
        0x0800014a:    f000f82f    ../.    BL       __rt_entry ; 0x80001ac
        0x0800014e:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x8000147
        0x08000152:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x08000156:    f0130f01    ....    TST      r3,#1
        0x0800015a:    bf18        ..      IT       NE
        0x0800015c:    1afb        ..      SUBNE    r3,r7,r3
        0x0800015e:    f0430301    C...    ORR      r3,r3,#1
        0x08000162:    4718        .G      BX       r3
    $d
        0x08000164:    00000ecc    ....    DCD    3788
        0x08000168:    00000eec    ....    DCD    3820
    $t
    !!handler_copy
    __scatterload_copy
        0x0800016c:    3a10        .:      SUBS     r2,r2,#0x10
        0x0800016e:    bf24        $.      ITT      CS
        0x08000170:    c878        x.      LDMCS    r0!,{r3-r6}
        0x08000172:    c178        x.      STMCS    r1!,{r3-r6}
        0x08000174:    d8fa        ..      BHI      __scatterload_copy ; 0x800016c
        0x08000176:    0752        R.      LSLS     r2,r2,#29
        0x08000178:    bf24        $.      ITT      CS
        0x0800017a:    c830        0.      LDMCS    r0!,{r4,r5}
        0x0800017c:    c130        0.      STMCS    r1!,{r4,r5}
        0x0800017e:    bf44        D.      ITT      MI
        0x08000180:    6804        .h      LDRMI    r4,[r0,#0]
        0x08000182:    600c        .`      STRMI    r4,[r1,#0]
        0x08000184:    4770        pG      BX       lr
        0x08000186:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x08000188:    2300        .#      MOVS     r3,#0
        0x0800018a:    2400        .$      MOVS     r4,#0
        0x0800018c:    2500        .%      MOVS     r5,#0
        0x0800018e:    2600        .&      MOVS     r6,#0
        0x08000190:    3a10        .:      SUBS     r2,r2,#0x10
        0x08000192:    bf28        (.      IT       CS
        0x08000194:    c178        x.      STMCS    r1!,{r3-r6}
        0x08000196:    d8fb        ..      BHI      0x8000190 ; __scatterload_zeroinit + 8
        0x08000198:    0752        R.      LSLS     r2,r2,#29
        0x0800019a:    bf28        (.      IT       CS
        0x0800019c:    c130        0.      STMCS    r1!,{r4,r5}
        0x0800019e:    bf48        H.      IT       MI
        0x080001a0:    600b        .`      STRMI    r3,[r1,#0]
        0x080001a2:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x080001a4:    b51f        ..      PUSH     {r0-r4,lr}
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
        0x080001a6:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x080001a8:    b510        ..      PUSH     {r4,lr}
    .ARM.Collect$$libshutdown$$00000002
    .ARM.Collect$$libshutdown$$00000004
    .ARM.Collect$$libshutdown$$00000006
    .ARM.Collect$$libshutdown$$00000009
    .ARM.Collect$$libshutdown$$0000000C
    .ARM.Collect$$libshutdown$$0000000E
    .ARM.Collect$$libshutdown$$00000011
    .ARM.Collect$$libshutdown$$00000012
    __rt_lib_shutdown_cpp_1
    __rt_lib_shutdown_fini_1
    __rt_lib_shutdown_fp_trap_1
    __rt_lib_shutdown_heap_1
    __rt_lib_shutdown_return
    __rt_lib_shutdown_signal_1
    __rt_lib_shutdown_stdio_1
    __rt_lib_shutdown_user_alloc_1
        0x080001aa:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x080001ac:    f000f886    ....    BL       __user_setup_stackheap ; 0x80002bc
        0x080001b0:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x080001b2:    f7fffff7    ....    BL       __rt_lib_init ; 0x80001a4
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x080001b6:    f000f8fa    ....    BL       main ; 0x80003ae
        0x080001ba:    f000f8a4    ....    BL       exit ; 0x8000306
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x080001be:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x080001c0:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x80001a8
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x080001c4:    bc03        ..      POP      {r0,r1}
        0x080001c6:    f000f8ed    ....    BL       _sys_exit ; 0x80003a4
        0x080001ca:    0000        ..      MOVS     r0,r0
    .text
    Reset_Handler
        0x080001cc:    4808        .H      LDR      r0,[pc,#32] ; [0x80001f0] = 0x8000131
        0x080001ce:    4700        .G      BX       r0
    NMI_Handler
        0x080001d0:    e7fe        ..      B        NMI_Handler ; 0x80001d0
    HardFault_Handler
        0x080001d2:    e7fe        ..      B        HardFault_Handler ; 0x80001d2
    MemManage_Handler
        0x080001d4:    e7fe        ..      B        MemManage_Handler ; 0x80001d4
    BusFault_Handler
        0x080001d6:    e7fe        ..      B        BusFault_Handler ; 0x80001d6
    UsageFault_Handler
        0x080001d8:    e7fe        ..      B        UsageFault_Handler ; 0x80001d8
    SVC_Handler
        0x080001da:    e7fe        ..      B        SVC_Handler ; 0x80001da
    DebugMon_Handler
        0x080001dc:    e7fe        ..      B        DebugMon_Handler ; 0x80001dc
    PendSV_Handler
        0x080001de:    e7fe        ..      B        PendSV_Handler ; 0x80001de
    SysTick_Handler
        0x080001e0:    e7fe        ..      B        SysTick_Handler ; 0x80001e0
    ADC1_2_IRQHandler
    ADC3_IRQHandler
    CAN1_RX1_IRQHandler
    CAN1_SCE_IRQHandler
    DMA1_Channel1_IRQHandler
    DMA1_Channel2_IRQHandler
    DMA1_Channel3_IRQHandler
    DMA1_Channel4_IRQHandler
    DMA1_Channel5_IRQHandler
    DMA1_Channel6_IRQHandler
    DMA1_Channel7_IRQHandler
    DMA2_Channel1_IRQHandler
    DMA2_Channel2_IRQHandler
    DMA2_Channel3_IRQHandler
    DMA2_Channel4_5_IRQHandler
    EXTI0_IRQHandler
    EXTI15_10_IRQHandler
    EXTI1_IRQHandler
    EXTI2_IRQHandler
    EXTI3_IRQHandler
    EXTI4_IRQHandler
    EXTI9_5_IRQHandler
    FLASH_IRQHandler
    FSMC_IRQHandler
    I2C1_ER_IRQHandler
    I2C1_EV_IRQHandler
    I2C2_ER_IRQHandler
    I2C2_EV_IRQHandler
    PVD_IRQHandler
    RCC_IRQHandler
    RTC_Alarm_IRQHandler
    RTC_IRQHandler
    SDIO_IRQHandler
    SPI1_IRQHandler
    SPI2_IRQHandler
    SPI3_IRQHandler
    TAMPER_IRQHandler
    TIM1_BRK_IRQHandler
    TIM1_CC_IRQHandler
    TIM1_TRG_COM_IRQHandler
    TIM1_UP_IRQHandler
    TIM2_IRQHandler
    TIM3_IRQHandler
    TIM4_IRQHandler
    TIM5_IRQHandler
    TIM6_IRQHandler
    TIM7_IRQHandler
    TIM8_BRK_IRQHandler
    TIM8_CC_IRQHandler
    TIM8_TRG_COM_IRQHandler
    TIM8_UP_IRQHandler
    UART4_IRQHandler
    UART5_IRQHandler
    USART2_IRQHandler
    USART3_IRQHandler
    USBWakeUp_IRQHandler
    USB_HP_CAN1_TX_IRQHandler
    USB_LP_CAN1_RX0_IRQHandler
    WWDG_IRQHandler
        0x080001e2:    e7fe        ..      B        ADC1_2_IRQHandler ; 0x80001e2
    __user_initial_stackheap
        0x080001e4:    4803        .H      LDR      r0,[pc,#12] ; [0x80001f4] = 0x20000130
        0x080001e6:    4904        .I      LDR      r1,[pc,#16] ; [0x80001f8] = 0x20000530
        0x080001e8:    4a02        .J      LDR      r2,[pc,#8] ; [0x80001f4] = 0x20000130
        0x080001ea:    4b04        .K      LDR      r3,[pc,#16] ; [0x80001fc] = 0x20000130
        0x080001ec:    4770        pG      BX       lr
    $d
        0x080001ee:    0000        ..      DCW    0
        0x080001f0:    08000131    1...    DCD    134218033
        0x080001f4:    20000130    0..     DCD    536871216
        0x080001f8:    20000530    0..     DCD    536872240
        0x080001fc:    20000130    0..     DCD    536871216
    $t
    .text
    __use_no_semihosting
        0x08000200:    4770        pG      BX       lr
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x08000202:    b510        ..      PUSH     {r4,lr}
        0x08000204:    3a20         :      SUBS     r2,r2,#0x20
        0x08000206:    f0c0800b    ....    BCC.W    0x8000220 ; __aeabi_memcpy4 + 30
        0x0800020a:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x0800020e:    3a20         :      SUBS     r2,r2,#0x20
        0x08000210:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x08000214:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x08000218:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x0800021c:    f4bfaff5    ....    BCS.W    0x800020a ; __aeabi_memcpy4 + 8
        0x08000220:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x08000224:    bf24        $.      ITT      CS
        0x08000226:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x0800022a:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x0800022e:    bf44        D.      ITT      MI
        0x08000230:    c918        ..      LDMMI    r1!,{r3,r4}
        0x08000232:    c018        ..      STMMI    r0!,{r3,r4}
        0x08000234:    e8bd4010    ...@    POP      {r4,lr}
        0x08000238:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x0800023c:    bf24        $.      ITT      CS
        0x0800023e:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x08000242:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x08000246:    bf08        ..      IT       EQ
        0x08000248:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x0800024a:    07d2        ..      LSLS     r2,r2,#31
        0x0800024c:    bf28        (.      IT       CS
        0x0800024e:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x08000252:    bf48        H.      IT       MI
        0x08000254:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x08000258:    bf28        (.      IT       CS
        0x0800025a:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x0800025e:    bf48        H.      IT       MI
        0x08000260:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x08000264:    4770        pG      BX       lr
    .text
    __aeabi_memclr4
    __aeabi_memclr8
    __rt_memclr_w
        0x08000266:    f04f0200    O...    MOV      r2,#0
    _memset_w
        0x0800026a:    b500        ..      PUSH     {lr}
        0x0800026c:    4613        .F      MOV      r3,r2
        0x0800026e:    4694        .F      MOV      r12,r2
        0x08000270:    4696        .F      MOV      lr,r2
        0x08000272:    3920         9      SUBS     r1,r1,#0x20
        0x08000274:    bf22        ".      ITTT     CS
        0x08000276:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x0800027a:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x0800027e:    f1b10120    .. .    SUBSCS   r1,r1,#0x20
        0x08000282:    f4bfaff7    ....    BCS.W    0x8000274 ; _memset_w + 10
        0x08000286:    0709        ..      LSLS     r1,r1,#28
        0x08000288:    bf28        (.      IT       CS
        0x0800028a:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x0800028e:    bf48        H.      IT       MI
        0x08000290:    c00c        ..      STMMI    r0!,{r2,r3}
        0x08000292:    f85deb04    ]...    POP      {lr}
        0x08000296:    0089        ..      LSLS     r1,r1,#2
        0x08000298:    bf28        (.      IT       CS
        0x0800029a:    f8402b04    @..+    STRCS    r2,[r0],#4
        0x0800029e:    bf08        ..      IT       EQ
        0x080002a0:    4770        pG      BXEQ     lr
        0x080002a2:    bf48        H.      IT       MI
        0x080002a4:    f8202b02     ..+    STRHMI   r2,[r0],#2
        0x080002a8:    f0114f80    ...O    TST      r1,#0x40000000
        0x080002ac:    bf18        ..      IT       NE
        0x080002ae:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x080002b2:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x080002b4:    4770        pG      BX       lr
    __rt_heap_escrow$2region
        0x080002b6:    4770        pG      BX       lr
    __rt_heap_expand$2region
        0x080002b8:    4770        pG      BX       lr
    .text
    __semihosting$guard
    __use_no_semihosting_swi
        0x080002ba:    4770        pG      BX       lr
    .text
    __user_setup_stackheap
        0x080002bc:    4675        uF      MOV      r5,lr
        0x080002be:    f000f82b    ..+.    BL       __user_libspace ; 0x8000318
        0x080002c2:    46ae        .F      MOV      lr,r5
        0x080002c4:    0005        ..      MOVS     r5,r0
        0x080002c6:    4669        iF      MOV      r1,sp
        0x080002c8:    4653        SF      MOV      r3,r10
        0x080002ca:    f0200007     ...    BIC      r0,r0,#7
        0x080002ce:    4685        .F      MOV      sp,r0
        0x080002d0:    b018        ..      ADD      sp,sp,#0x60
        0x080002d2:    b520         .      PUSH     {r5,lr}
        0x080002d4:    f7ffff86    ....    BL       __user_initial_stackheap ; 0x80001e4
        0x080002d8:    e8bd4020    .. @    POP      {r5,lr}
        0x080002dc:    f04f0600    O...    MOV      r6,#0
        0x080002e0:    f04f0700    O...    MOV      r7,#0
        0x080002e4:    f04f0800    O...    MOV      r8,#0
        0x080002e8:    f04f0b00    O...    MOV      r11,#0
        0x080002ec:    f0210107    !...    BIC      r1,r1,#7
        0x080002f0:    46ac        .F      MOV      r12,r5
        0x080002f2:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080002f6:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080002fa:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080002fe:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x08000302:    468d        .F      MOV      sp,r1
        0x08000304:    4770        pG      BX       lr
    .text
    exit
        0x08000306:    b510        ..      PUSH     {r4,lr}
        0x08000308:    4604        .F      MOV      r4,r0
        0x0800030a:    f3af8000    ....    NOP.W    
        0x0800030e:    4620         F      MOV      r0,r4
        0x08000310:    e8bd4010    ...@    POP      {r4,lr}
        0x08000314:    f7ffbf53    ..S.    B.W      __rt_exit ; 0x80001be
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x08000318:    4800        .H      LDR      r0,[pc,#0] ; [0x800031c] = 0x200000d0
        0x0800031a:    4770        pG      BX       lr
    $d
        0x0800031c:    200000d0    ...     DCD    536871120
    $t
    i.USART1_IRQHandler
    USART1_IRQHandler
        0x08000320:    491d        .I      LDR      r1,[pc,#116] ; [0x8000398] = 0x40013800
        0x08000322:    6809        .h      LDR      r1,[r1,#0]
        0x08000324:    f0010120    .. .    AND      r1,r1,#0x20
        0x08000328:    b311        ..      CBZ      r1,0x8000370 ; USART1_IRQHandler + 80
        0x0800032a:    491b        .I      LDR      r1,[pc,#108] ; [0x8000398] = 0x40013800
        0x0800032c:    1d09        ..      ADDS     r1,r1,#4
        0x0800032e:    6809        .h      LDR      r1,[r1,#0]
        0x08000330:    b2c8        ..      UXTB     r0,r1
        0x08000332:    491a        .I      LDR      r1,[pc,#104] ; [0x800039c] = 0x20000004
        0x08000334:    8809        ..      LDRH     r1,[r1,#0]
        0x08000336:    f4014100    ...A    AND      r1,r1,#0x8000
        0x0800033a:    b9c9        ..      CBNZ     r1,0x8000370 ; USART1_IRQHandler + 80
        0x0800033c:    4917        .I      LDR      r1,[pc,#92] ; [0x800039c] = 0x20000004
        0x0800033e:    8809        ..      LDRH     r1,[r1,#0]
        0x08000340:    f4014180    ...A    AND      r1,r1,#0x4000
        0x08000344:    b161        a.      CBZ      r1,0x8000360 ; USART1_IRQHandler + 64
        0x08000346:    280a        .(      CMP      r0,#0xa
        0x08000348:    d003        ..      BEQ      0x8000352 ; USART1_IRQHandler + 50
        0x0800034a:    2100        .!      MOVS     r1,#0
        0x0800034c:    4a13        .J      LDR      r2,[pc,#76] ; [0x800039c] = 0x20000004
        0x0800034e:    8011        ..      STRH     r1,[r2,#0]
        0x08000350:    e020         .      B        0x8000394 ; USART1_IRQHandler + 116
        0x08000352:    4912        .I      LDR      r1,[pc,#72] ; [0x800039c] = 0x20000004
        0x08000354:    8809        ..      LDRH     r1,[r1,#0]
        0x08000356:    f4414100    A..A    ORR      r1,r1,#0x8000
        0x0800035a:    4a10        .J      LDR      r2,[pc,#64] ; [0x800039c] = 0x20000004
        0x0800035c:    8011        ..      STRH     r1,[r2,#0]
        0x0800035e:    e019        ..      B        0x8000394 ; USART1_IRQHandler + 116
        0x08000360:    280d        .(      CMP      r0,#0xd
        0x08000362:    d106        ..      BNE      0x8000372 ; USART1_IRQHandler + 82
        0x08000364:    490d        .I      LDR      r1,[pc,#52] ; [0x800039c] = 0x20000004
        0x08000366:    8809        ..      LDRH     r1,[r1,#0]
        0x08000368:    f4414180    A..A    ORR      r1,r1,#0x4000
        0x0800036c:    4a0b        .J      LDR      r2,[pc,#44] ; [0x800039c] = 0x20000004
        0x0800036e:    8011        ..      STRH     r1,[r2,#0]
        0x08000370:    e010        ..      B        0x8000394 ; USART1_IRQHandler + 116
        0x08000372:    490a        .I      LDR      r1,[pc,#40] ; [0x800039c] = 0x20000004
        0x08000374:    8809        ..      LDRH     r1,[r1,#0]
        0x08000376:    f3c1010d    ....    UBFX     r1,r1,#0,#14
        0x0800037a:    4a09        .J      LDR      r2,[pc,#36] ; [0x80003a0] = 0x20000008
        0x0800037c:    5450        PT      STRB     r0,[r2,r1]
        0x0800037e:    4907        .I      LDR      r1,[pc,#28] ; [0x800039c] = 0x20000004
        0x08000380:    8809        ..      LDRH     r1,[r1,#0]
        0x08000382:    1c49        I.      ADDS     r1,r1,#1
        0x08000384:    4a05        .J      LDR      r2,[pc,#20] ; [0x800039c] = 0x20000004
        0x08000386:    8011        ..      STRH     r1,[r2,#0]
        0x08000388:    4611        .F      MOV      r1,r2
        0x0800038a:    8809        ..      LDRH     r1,[r1,#0]
        0x0800038c:    29c7        .)      CMP      r1,#0xc7
        0x0800038e:    dd01        ..      BLE      0x8000394 ; USART1_IRQHandler + 116
        0x08000390:    2100        .!      MOVS     r1,#0
        0x08000392:    8011        ..      STRH     r1,[r2,#0]
        0x08000394:    4770        pG      BX       lr
    $d
        0x08000396:    0000        ..      DCW    0
        0x08000398:    40013800    .8.@    DCD    1073821696
        0x0800039c:    20000004    ...     DCD    536870916
        0x080003a0:    20000008    ...     DCD    536870920
    $t
    i._sys_exit
    _sys_exit
        0x080003a4:    bf00        ..      NOP      
        0x080003a6:    4770        pG      BX       lr
    i.helper_add
    helper_add
        0x080003a8:    4602        .F      MOV      r2,r0
        0x080003aa:    1850        P.      ADDS     r0,r2,r1
        0x080003ac:    4770        pG      BX       lr
    i.main
    main
        0x080003ae:    f000f934    ..4.    BL       test_data_processing ; 0x800061a
        0x080003b2:    f000f8a1    ....    BL       test_branch_and_jump ; 0x80004f8
        0x080003b6:    f000fa9b    ....    BL       test_load_store ; 0x80008f0
        0x080003ba:    f000fb63    ..c.    BL       test_logical_and_shift ; 0x8000a84
        0x080003be:    f000f9f3    ....    BL       test_flags_and_compare ; 0x80007a8
        0x080003c2:    f000fc01    ....    BL       test_multiply_divide ; 0x8000bc8
        0x080003c6:    f000f809    ....    BL       test_bit_manipulation ; 0x80003dc
        0x080003ca:    f000fd15    ....    BL       test_stack_and_multi ; 0x8000df8
        0x080003ce:    f000fda3    ....    BL       test_system_instructions ; 0x8000f18
        0x080003d2:    f000fc83    ....    BL       test_pipeline_hazards ; 0x8000cdc
        0x080003d6:    bf00        ..      NOP      
        0x080003d8:    e7fe        ..      B        0x80003d8 ; main + 42
        0x080003da:    0000        ..      MOVS     r0,r0
    i.test_bit_manipulation
    test_bit_manipulation
        0x080003dc:    b51c        ..      PUSH     {r2-r4,lr}
        0x080003de:    2000        .       MOVS     r0,#0
        0x080003e0:    21ff        .!      MOVS     r1,#0xff
        0x080003e2:    9101        ..      STR      r1,[sp,#4]
        0x080003e4:    9901        ..      LDR      r1,[sp,#4]
        0x080003e6:    b2c9        ..      UXTB     r1,r1
        0x080003e8:    9100        ..      STR      r1,[sp,#0]
        0x080003ea:    9900        ..      LDR      r1,[sp,#0]
        0x080003ec:    29ff        .)      CMP      r1,#0xff
        0x080003ee:    d101        ..      BNE      0x80003f4 ; test_bit_manipulation + 24
        0x080003f0:    2301        .#      MOVS     r3,#1
        0x080003f2:    e000        ..      B        0x80003f6 ; test_bit_manipulation + 26
        0x080003f4:    2300        .#      MOVS     r3,#0
        0x080003f6:    4601        .F      MOV      r1,r0
        0x080003f8:    1c40        @.      ADDS     r0,r0,#1
        0x080003fa:    0089        ..      LSLS     r1,r1,#2
        0x080003fc:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x08000400:    600b        .`      STR      r3,[r1,#0]
        0x08000402:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08000406:    1c4a        J.      ADDS     r2,r1,#1
        0x08000408:    b90a        ..      CBNZ     r2,0x800040e ; test_bit_manipulation + 50
        0x0800040a:    2401        .$      MOVS     r4,#1
        0x0800040c:    e000        ..      B        0x8000410 ; test_bit_manipulation + 52
        0x0800040e:    2400        .$      MOVS     r4,#0
        0x08000410:    4602        .F      MOV      r2,r0
        0x08000412:    1c40        @.      ADDS     r0,r0,#1
        0x08000414:    0092        ..      LSLS     r2,r2,#2
        0x08000416:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x0800041a:    6014        .`      STR      r4,[r2,#0]
        0x0800041c:    f64f71ff    O..q    MOV      r1,#0xffff
        0x08000420:    9101        ..      STR      r1,[sp,#4]
        0x08000422:    9901        ..      LDR      r1,[sp,#4]
        0x08000424:    b289        ..      UXTH     r1,r1
        0x08000426:    9100        ..      STR      r1,[sp,#0]
        0x08000428:    f64f72ff    O..r    MOV      r2,#0xffff
        0x0800042c:    9900        ..      LDR      r1,[sp,#0]
        0x0800042e:    4291        .B      CMP      r1,r2
        0x08000430:    d101        ..      BNE      0x8000436 ; test_bit_manipulation + 90
        0x08000432:    2301        .#      MOVS     r3,#1
        0x08000434:    e000        ..      B        0x8000438 ; test_bit_manipulation + 92
        0x08000436:    2300        .#      MOVS     r3,#0
        0x08000438:    4602        .F      MOV      r2,r0
        0x0800043a:    1c40        @.      ADDS     r0,r0,#1
        0x0800043c:    0091        ..      LSLS     r1,r2,#2
        0x0800043e:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x08000442:    600b        .`      STR      r3,[r1,#0]
        0x08000444:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08000448:    1c4a        J.      ADDS     r2,r1,#1
        0x0800044a:    b90a        ..      CBNZ     r2,0x8000450 ; test_bit_manipulation + 116
        0x0800044c:    2401        .$      MOVS     r4,#1
        0x0800044e:    e000        ..      B        0x8000452 ; test_bit_manipulation + 118
        0x08000450:    2400        .$      MOVS     r4,#0
        0x08000452:    4602        .F      MOV      r2,r0
        0x08000454:    1c40        @.      ADDS     r0,r0,#1
        0x08000456:    0092        ..      LSLS     r2,r2,#2
        0x08000458:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x0800045c:    6014        .`      STR      r4,[r2,#0]
        0x0800045e:    4923        #I      LDR      r1,[pc,#140] ; [0x80004ec] = 0x12345678
        0x08000460:    060a        ..      LSLS     r2,r1,#24
        0x08000462:    f401437f    ...C    AND      r3,r1,#0xff00
        0x08000466:    ea422203    B.."    ORR      r2,r2,r3,LSL #8
        0x0800046a:    f401037f    ....    AND      r3,r1,#0xff0000
        0x0800046e:    ea422213    B.."    ORR      r2,r2,r3,LSR #8
        0x08000472:    ea426211    B..b    ORR      r2,r2,r1,LSR #24
        0x08000476:    9200        ..      STR      r2,[sp,#0]
        0x08000478:    4b1d        .K      LDR      r3,[pc,#116] ; [0x80004f0] = 0x78563412
        0x0800047a:    9a00        ..      LDR      r2,[sp,#0]
        0x0800047c:    429a        .B      CMP      r2,r3
        0x0800047e:    d101        ..      BNE      0x8000484 ; test_bit_manipulation + 168
        0x08000480:    2401        .$      MOVS     r4,#1
        0x08000482:    e000        ..      B        0x8000486 ; test_bit_manipulation + 170
        0x08000484:    2400        .$      MOVS     r4,#0
        0x08000486:    4602        .F      MOV      r2,r0
        0x08000488:    1c40        @.      ADDS     r0,r0,#1
        0x0800048a:    0092        ..      LSLS     r2,r2,#2
        0x0800048c:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000490:    6014        .`      STR      r4,[r2,#0]
        0x08000492:    4916        .I      LDR      r1,[pc,#88] ; [0x80004ec] = 0x12345678
        0x08000494:    b2ca        ..      UXTB     r2,r1
        0x08000496:    f3c12307    ...#    UBFX     r3,r1,#8,#8
        0x0800049a:    ea432202    C.."    ORR      r2,r3,r2,LSL #8
        0x0800049e:    f401037f    ....    AND      r3,r1,#0xff0000
        0x080004a2:    ea422203    B.."    ORR      r2,r2,r3,LSL #8
        0x080004a6:    f001437f    ...C    AND      r3,r1,#0xff000000
        0x080004aa:    ea422213    B.."    ORR      r2,r2,r3,LSR #8
        0x080004ae:    9200        ..      STR      r2,[sp,#0]
        0x080004b0:    4b10        .K      LDR      r3,[pc,#64] ; [0x80004f4] = 0x34127856
        0x080004b2:    9a00        ..      LDR      r2,[sp,#0]
        0x080004b4:    429a        .B      CMP      r2,r3
        0x080004b6:    d101        ..      BNE      0x80004bc ; test_bit_manipulation + 224
        0x080004b8:    2401        .$      MOVS     r4,#1
        0x080004ba:    e000        ..      B        0x80004be ; test_bit_manipulation + 226
        0x080004bc:    2400        .$      MOVS     r4,#0
        0x080004be:    4602        .F      MOV      r2,r0
        0x080004c0:    1c40        @.      ADDS     r0,r0,#1
        0x080004c2:    0092        ..      LSLS     r2,r2,#2
        0x080004c4:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080004c8:    6014        .`      STR      r4,[r2,#0]
        0x080004ca:    f04f5108    O..Q    MOV      r1,#0x22000000
        0x080004ce:    2201        ."      MOVS     r2,#1
        0x080004d0:    600a        .`      STR      r2,[r1,#0]
        0x080004d2:    680a        .h      LDR      r2,[r1,#0]
        0x080004d4:    2a01        .*      CMP      r2,#1
        0x080004d6:    d101        ..      BNE      0x80004dc ; test_bit_manipulation + 256
        0x080004d8:    2401        .$      MOVS     r4,#1
        0x080004da:    e000        ..      B        0x80004de ; test_bit_manipulation + 258
        0x080004dc:    2400        .$      MOVS     r4,#0
        0x080004de:    4602        .F      MOV      r2,r0
        0x080004e0:    1c40        @.      ADDS     r0,r0,#1
        0x080004e2:    0092        ..      LSLS     r2,r2,#2
        0x080004e4:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080004e8:    6014        .`      STR      r4,[r2,#0]
        0x080004ea:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x080004ec:    12345678    xV4.    DCD    305419896
        0x080004f0:    78563412    .4Vx    DCD    2018915346
        0x080004f4:    34127856    Vx.4    DCD    873625686
    $t
    i.test_branch_and_jump
    test_branch_and_jump
        0x080004f8:    b578        x.      PUSH     {r3-r6,lr}
        0x080004fa:    2400        .$      MOVS     r4,#0
        0x080004fc:    2001        .       MOVS     r0,#1
        0x080004fe:    9000        ..      STR      r0,[sp,#0]
        0x08000500:    9800        ..      LDR      r0,[sp,#0]
        0x08000502:    b108        ..      CBZ      r0,0x8000508 ; test_branch_and_jump + 16
        0x08000504:    2364        d#      MOVS     r3,#0x64
        0x08000506:    e000        ..      B        0x800050a ; test_branch_and_jump + 18
        0x08000508:    23c8        .#      MOVS     r3,#0xc8
        0x0800050a:    2b64        d+      CMP      r3,#0x64
        0x0800050c:    d101        ..      BNE      0x8000512 ; test_branch_and_jump + 26
        0x0800050e:    2201        ."      MOVS     r2,#1
        0x08000510:    e000        ..      B        0x8000514 ; test_branch_and_jump + 28
        0x08000512:    2200        ."      MOVS     r2,#0
        0x08000514:    4620         F      MOV      r0,r4
        0x08000516:    1c64        d.      ADDS     r4,r4,#1
        0x08000518:    0080        ..      LSLS     r0,r0,#2
        0x0800051a:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x0800051e:    6002        .`      STR      r2,[r0,#0]
        0x08000520:    2000        .       MOVS     r0,#0
        0x08000522:    9000        ..      STR      r0,[sp,#0]
        0x08000524:    9800        ..      LDR      r0,[sp,#0]
        0x08000526:    b110        ..      CBZ      r0,0x800052e ; test_branch_and_jump + 54
        0x08000528:    f44f7396    O..s    MOV      r3,#0x12c
        0x0800052c:    e001        ..      B        0x8000532 ; test_branch_and_jump + 58
        0x0800052e:    f44f73c8    O..s    MOV      r3,#0x190
        0x08000532:    f5b37fc8    ....    CMP      r3,#0x190
        0x08000536:    d101        ..      BNE      0x800053c ; test_branch_and_jump + 68
        0x08000538:    2201        ."      MOVS     r2,#1
        0x0800053a:    e000        ..      B        0x800053e ; test_branch_and_jump + 70
        0x0800053c:    2200        ."      MOVS     r2,#0
        0x0800053e:    4620         F      MOV      r0,r4
        0x08000540:    1c64        d.      ADDS     r4,r4,#1
        0x08000542:    0080        ..      LSLS     r0,r0,#2
        0x08000544:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x08000548:    6002        .`      STR      r2,[r0,#0]
        0x0800054a:    2125        %!      MOVS     r1,#0x25
        0x0800054c:    2019        .       MOVS     r0,#0x19
        0x0800054e:    f7ffff2b    ..+.    BL       helper_add ; 0x80003a8
        0x08000552:    4603        .F      MOV      r3,r0
        0x08000554:    2b3e        >+      CMP      r3,#0x3e
        0x08000556:    d101        ..      BNE      0x800055c ; test_branch_and_jump + 100
        0x08000558:    2201        ."      MOVS     r2,#1
        0x0800055a:    e000        ..      B        0x800055e ; test_branch_and_jump + 102
        0x0800055c:    2200        ."      MOVS     r2,#0
        0x0800055e:    4621        !F      MOV      r1,r4
        0x08000560:    1c64        d.      ADDS     r4,r4,#1
        0x08000562:    0088        ..      LSLS     r0,r1,#2
        0x08000564:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x08000568:    6002        .`      STR      r2,[r0,#0]
        0x0800056a:    f06f0004    o...    MVN      r0,#4
        0x0800056e:    2103        .!      MOVS     r1,#3
        0x08000570:    4288        .B      CMP      r0,r1
        0x08000572:    da01        ..      BGE      0x8000578 ; test_branch_and_jump + 128
        0x08000574:    2301        .#      MOVS     r3,#1
        0x08000576:    e000        ..      B        0x800057a ; test_branch_and_jump + 130
        0x08000578:    2300        .#      MOVS     r3,#0
        0x0800057a:    2b01        .+      CMP      r3,#1
        0x0800057c:    d101        ..      BNE      0x8000582 ; test_branch_and_jump + 138
        0x0800057e:    2601        .&      MOVS     r6,#1
        0x08000580:    e000        ..      B        0x8000584 ; test_branch_and_jump + 140
        0x08000582:    2600        .&      MOVS     r6,#0
        0x08000584:    4622        "F      MOV      r2,r4
        0x08000586:    1c64        d.      ADDS     r4,r4,#1
        0x08000588:    0092        ..      LSLS     r2,r2,#2
        0x0800058a:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x0800058e:    6016        .`      STR      r6,[r2,#0]
        0x08000590:    2005        .       MOVS     r0,#5
        0x08000592:    2103        .!      MOVS     r1,#3
        0x08000594:    4288        .B      CMP      r0,r1
        0x08000596:    d901        ..      BLS      0x800059c ; test_branch_and_jump + 164
        0x08000598:    2301        .#      MOVS     r3,#1
        0x0800059a:    e000        ..      B        0x800059e ; test_branch_and_jump + 166
        0x0800059c:    2300        .#      MOVS     r3,#0
        0x0800059e:    2b01        .+      CMP      r3,#1
        0x080005a0:    d101        ..      BNE      0x80005a6 ; test_branch_and_jump + 174
        0x080005a2:    2601        .&      MOVS     r6,#1
        0x080005a4:    e000        ..      B        0x80005a8 ; test_branch_and_jump + 176
        0x080005a6:    2600        .&      MOVS     r6,#0
        0x080005a8:    4622        "F      MOV      r2,r4
        0x080005aa:    1c64        d.      ADDS     r4,r4,#1
        0x080005ac:    0092        ..      LSLS     r2,r2,#2
        0x080005ae:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080005b2:    6016        .`      STR      r6,[r2,#0]
        0x080005b4:    2100        .!      MOVS     r1,#0
        0x080005b6:    2001        .       MOVS     r0,#1
        0x080005b8:    e001        ..      B        0x80005be ; test_branch_and_jump + 198
        0x080005ba:    4401        .D      ADD      r1,r1,r0
        0x080005bc:    1c40        @.      ADDS     r0,r0,#1
        0x080005be:    280a        .(      CMP      r0,#0xa
        0x080005c0:    d9fb        ..      BLS      0x80005ba ; test_branch_and_jump + 194
        0x080005c2:    2937        7)      CMP      r1,#0x37
        0x080005c4:    d101        ..      BNE      0x80005ca ; test_branch_and_jump + 210
        0x080005c6:    2601        .&      MOVS     r6,#1
        0x080005c8:    e000        ..      B        0x80005cc ; test_branch_and_jump + 212
        0x080005ca:    2600        .&      MOVS     r6,#0
        0x080005cc:    4622        "F      MOV      r2,r4
        0x080005ce:    1c64        d.      ADDS     r4,r4,#1
        0x080005d0:    0092        ..      LSLS     r2,r2,#2
        0x080005d2:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080005d6:    6016        .`      STR      r6,[r2,#0]
        0x080005d8:    2000        .       MOVS     r0,#0
        0x080005da:    b908        ..      CBNZ     r0,0x80005e0 ; test_branch_and_jump + 232
        0x080005dc:    2301        .#      MOVS     r3,#1
        0x080005de:    e000        ..      B        0x80005e2 ; test_branch_and_jump + 234
        0x080005e0:    2300        .#      MOVS     r3,#0
        0x080005e2:    2b01        .+      CMP      r3,#1
        0x080005e4:    d101        ..      BNE      0x80005ea ; test_branch_and_jump + 242
        0x080005e6:    2501        .%      MOVS     r5,#1
        0x080005e8:    e000        ..      B        0x80005ec ; test_branch_and_jump + 244
        0x080005ea:    2500        .%      MOVS     r5,#0
        0x080005ec:    4621        !F      MOV      r1,r4
        0x080005ee:    1c64        d.      ADDS     r4,r4,#1
        0x080005f0:    0089        ..      LSLS     r1,r1,#2
        0x080005f2:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x080005f6:    600d        .`      STR      r5,[r1,#0]
        0x080005f8:    2005        .       MOVS     r0,#5
        0x080005fa:    b108        ..      CBZ      r0,0x8000600 ; test_branch_and_jump + 264
        0x080005fc:    2301        .#      MOVS     r3,#1
        0x080005fe:    e000        ..      B        0x8000602 ; test_branch_and_jump + 266
        0x08000600:    2300        .#      MOVS     r3,#0
        0x08000602:    2b01        .+      CMP      r3,#1
        0x08000604:    d101        ..      BNE      0x800060a ; test_branch_and_jump + 274
        0x08000606:    2501        .%      MOVS     r5,#1
        0x08000608:    e000        ..      B        0x800060c ; test_branch_and_jump + 276
        0x0800060a:    2500        .%      MOVS     r5,#0
        0x0800060c:    4621        !F      MOV      r1,r4
        0x0800060e:    1c64        d.      ADDS     r4,r4,#1
        0x08000610:    0089        ..      LSLS     r1,r1,#2
        0x08000612:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x08000616:    600d        .`      STR      r5,[r1,#0]
        0x08000618:    bd78        x.      POP      {r3-r6,pc}
    i.test_data_processing
    test_data_processing
        0x0800061a:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x0800061e:    2000        .       MOVS     r0,#0
        0x08000620:    210a        .!      MOVS     r1,#0xa
        0x08000622:    2514        .%      MOVS     r5,#0x14
        0x08000624:    194a        J.      ADDS     r2,r1,r5
        0x08000626:    2a1e        .*      CMP      r2,#0x1e
        0x08000628:    d102        ..      BNE      0x8000630 ; test_data_processing + 22
        0x0800062a:    f04f0c01    O...    MOV      r12,#1
        0x0800062e:    e001        ..      B        0x8000634 ; test_data_processing + 26
        0x08000630:    f04f0c00    O...    MOV      r12,#0
        0x08000634:    4606        .F      MOV      r6,r0
        0x08000636:    1c40        @.      ADDS     r0,r0,#1
        0x08000638:    00b6        ..      LSLS     r6,r6,#2
        0x0800063a:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x0800063e:    f8c6c000    ....    STR      r12,[r6,#0]
        0x08000642:    2132        2!      MOVS     r1,#0x32
        0x08000644:    250f        .%      MOVS     r5,#0xf
        0x08000646:    1b4a        J.      SUBS     r2,r1,r5
        0x08000648:    2a23        #*      CMP      r2,#0x23
        0x0800064a:    d102        ..      BNE      0x8000652 ; test_data_processing + 56
        0x0800064c:    f04f0c01    O...    MOV      r12,#1
        0x08000650:    e001        ..      B        0x8000656 ; test_data_processing + 60
        0x08000652:    f04f0c00    O...    MOV      r12,#0
        0x08000656:    4606        .F      MOV      r6,r0
        0x08000658:    1c40        @.      ADDS     r0,r0,#1
        0x0800065a:    00b6        ..      LSLS     r6,r6,#2
        0x0800065c:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x08000660:    f8c6c000    ....    STR      r12,[r6,#0]
        0x08000664:    2107        .!      MOVS     r1,#7
        0x08000666:    f1c10264    ..d.    RSB      r2,r1,#0x64
        0x0800066a:    2a5d        ]*      CMP      r2,#0x5d
        0x0800066c:    d102        ..      BNE      0x8000674 ; test_data_processing + 90
        0x0800066e:    f04f0c01    O...    MOV      r12,#1
        0x08000672:    e001        ..      B        0x8000678 ; test_data_processing + 94
        0x08000674:    f04f0c00    O...    MOV      r12,#0
        0x08000678:    4606        .F      MOV      r6,r0
        0x0800067a:    1c40        @.      ADDS     r0,r0,#1
        0x0800067c:    00b6        ..      LSLS     r6,r6,#2
        0x0800067e:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x08000682:    f8c6c000    ....    STR      r12,[r6,#0]
        0x08000686:    210c        .!      MOVS     r1,#0xc
        0x08000688:    250b        .%      MOVS     r5,#0xb
        0x0800068a:    fb01f205    ....    MUL      r2,r1,r5
        0x0800068e:    2a84        .*      CMP      r2,#0x84
        0x08000690:    d102        ..      BNE      0x8000698 ; test_data_processing + 126
        0x08000692:    f04f0c01    O...    MOV      r12,#1
        0x08000696:    e001        ..      B        0x800069c ; test_data_processing + 130
        0x08000698:    f04f0c00    O...    MOV      r12,#0
        0x0800069c:    4606        .F      MOV      r6,r0
        0x0800069e:    1c40        @.      ADDS     r0,r0,#1
        0x080006a0:    00b6        ..      LSLS     r6,r6,#2
        0x080006a2:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x080006a6:    f8c6c000    ....    STR      r12,[r6,#0]
        0x080006aa:    2401        .$      MOVS     r4,#1
        0x080006ac:    2600        .&      MOVS     r6,#0
        0x080006ae:    46a4        .F      MOV      r12,r4
        0x080006b0:    ea84070c    ....    EOR      r7,r4,r12
        0x080006b4:    4076        v@      EORS     r6,r6,r6
        0x080006b6:    4337        7C      ORRS     r7,r7,r6
        0x080006b8:    d100        ..      BNE      0x80006bc ; test_data_processing + 162
        0x080006ba:    e001        ..      B        0x80006c0 ; test_data_processing + 166
        0x080006bc:    f04f0c00    O...    MOV      r12,#0
        0x080006c0:    4606        .F      MOV      r6,r0
        0x080006c2:    1c40        @.      ADDS     r0,r0,#1
        0x080006c4:    00b6        ..      LSLS     r6,r6,#2
        0x080006c6:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x080006ca:    f8c6c000    ....    STR      r12,[r6,#0]
        0x080006ce:    f04f33ff    O..3    MOV      r3,#0xffffffff
        0x080006d2:    2400        .$      MOVS     r4,#0
        0x080006d4:    1c5e        ^.      ADDS     r6,r3,#1
        0x080006d6:    b93e        >.      CBNZ     r6,0x80006e8 ; test_data_processing + 206
        0x080006d8:    ea840706    ....    EOR      r7,r4,r6
        0x080006dc:    4076        v@      EORS     r6,r6,r6
        0x080006de:    4337        7C      ORRS     r7,r7,r6
        0x080006e0:    d102        ..      BNE      0x80006e8 ; test_data_processing + 206
        0x080006e2:    f04f0c01    O...    MOV      r12,#1
        0x080006e6:    e001        ..      B        0x80006ec ; test_data_processing + 210
        0x080006e8:    f04f0c00    O...    MOV      r12,#0
        0x080006ec:    4606        .F      MOV      r6,r0
        0x080006ee:    1c40        @.      ADDS     r0,r0,#1
        0x080006f0:    00b6        ..      LSLS     r6,r6,#2
        0x080006f2:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x080006f6:    f8c6c000    ....    STR      r12,[r6,#0]
        0x080006fa:    f04f36ff    O..6    MOV      r6,#0xffffffff
        0x080006fe:    f04f0800    O...    MOV      r8,#0
        0x08000702:    f04f0a01    O...    MOV      r10,#1
        0x08000706:    f8cda000    ....    STR      r10,[sp,#0]
        0x0800070a:    f04f0900    O...    MOV      r9,#0
        0x0800070e:    f8dda000    ....    LDR      r10,[sp,#0]
        0x08000712:    eb06070a    ....    ADD      r7,r6,r10
        0x08000716:    eb080a09    ....    ADD      r10,r8,r9
        0x0800071a:    42b7        .B      CMP      r7,r6
        0x0800071c:    d202        ..      BCS      0x8000724 ; test_data_processing + 266
        0x0800071e:    f04f0b01    O...    MOV      r11,#1
        0x08000722:    e001        ..      B        0x8000728 ; test_data_processing + 270
        0x08000724:    f04f0b00    O...    MOV      r11,#0
        0x08000728:    eb0a0c0b    ....    ADD      r12,r10,r11
        0x0800072c:    b92f        /.      CBNZ     r7,0x800073a ; test_data_processing + 288
        0x0800072e:    f1bc0f01    ....    CMP      r12,#1
        0x08000732:    d102        ..      BNE      0x800073a ; test_data_processing + 288
        0x08000734:    f04f0b01    O...    MOV      r11,#1
        0x08000738:    e001        ..      B        0x800073e ; test_data_processing + 292
        0x0800073a:    f04f0b00    O...    MOV      r11,#0
        0x0800073e:    4682        .F      MOV      r10,r0
        0x08000740:    1c40        @.      ADDS     r0,r0,#1
        0x08000742:    ea4f0a8a    O...    LSL      r10,r10,#2
        0x08000746:    f10a5a00    ...Z    ADD      r10,r10,#0x20000000
        0x0800074a:    f8cab000    ....    STR      r11,[r10,#0]
        0x0800074e:    2600        .&      MOVS     r6,#0
        0x08000750:    f04f0801    O...    MOV      r8,#1
        0x08000754:    2701        .'      MOVS     r7,#1
        0x08000756:    46b1        .F      MOV      r9,r6
        0x08000758:    eba60a07    ....    SUB      r10,r6,r7
        0x0800075c:    f8cda000    ....    STR      r10,[sp,#0]
        0x08000760:    eba80a09    ....    SUB      r10,r8,r9
        0x08000764:    42be        .B      CMP      r6,r7
        0x08000766:    d202        ..      BCS      0x800076e ; test_data_processing + 340
        0x08000768:    f04f0b01    O...    MOV      r11,#1
        0x0800076c:    e001        ..      B        0x8000772 ; test_data_processing + 344
        0x0800076e:    f04f0b00    O...    MOV      r11,#0
        0x08000772:    ebaa0c0b    ....    SUB      r12,r10,r11
        0x08000776:    f8dda000    ....    LDR      r10,[sp,#0]
        0x0800077a:    f10a0a01    ....    ADD      r10,r10,#1
        0x0800077e:    f1ba0f00    ....    CMP      r10,#0
        0x08000782:    d105        ..      BNE      0x8000790 ; test_data_processing + 374
        0x08000784:    f1bc0f00    ....    CMP      r12,#0
        0x08000788:    d102        ..      BNE      0x8000790 ; test_data_processing + 374
        0x0800078a:    f04f0b01    O...    MOV      r11,#1
        0x0800078e:    e001        ..      B        0x8000794 ; test_data_processing + 378
        0x08000790:    f04f0b00    O...    MOV      r11,#0
        0x08000794:    4682        .F      MOV      r10,r0
        0x08000796:    1c40        @.      ADDS     r0,r0,#1
        0x08000798:    ea4f0a8a    O...    LSL      r10,r10,#2
        0x0800079c:    f10a5a00    ...Z    ADD      r10,r10,#0x20000000
        0x080007a0:    f8cab000    ....    STR      r11,[r10,#0]
        0x080007a4:    e8bd8ff8    ....    POP      {r3-r11,pc}
    i.test_flags_and_compare
    test_flags_and_compare
        0x080007a8:    b57c        |.      PUSH     {r2-r6,lr}
        0x080007aa:    2000        .       MOVS     r0,#0
        0x080007ac:    2205        ."      MOVS     r2,#5
        0x080007ae:    9201        ..      STR      r2,[sp,#4]
        0x080007b0:    9200        ..      STR      r2,[sp,#0]
        0x080007b2:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x080007b6:    429a        .B      CMP      r2,r3
        0x080007b8:    d101        ..      BNE      0x80007be ; test_flags_and_compare + 22
        0x080007ba:    2101        .!      MOVS     r1,#1
        0x080007bc:    e000        ..      B        0x80007c0 ; test_flags_and_compare + 24
        0x080007be:    2100        .!      MOVS     r1,#0
        0x080007c0:    2901        .)      CMP      r1,#1
        0x080007c2:    d101        ..      BNE      0x80007c8 ; test_flags_and_compare + 32
        0x080007c4:    2401        .$      MOVS     r4,#1
        0x080007c6:    e000        ..      B        0x80007ca ; test_flags_and_compare + 34
        0x080007c8:    2400        .$      MOVS     r4,#0
        0x080007ca:    4602        .F      MOV      r2,r0
        0x080007cc:    1c40        @.      ADDS     r0,r0,#1
        0x080007ce:    0092        ..      LSLS     r2,r2,#2
        0x080007d0:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080007d4:    6014        .`      STR      r4,[r2,#0]
        0x080007d6:    220a        ."      MOVS     r2,#0xa
        0x080007d8:    9201        ..      STR      r2,[sp,#4]
        0x080007da:    2203        ."      MOVS     r2,#3
        0x080007dc:    9200        ..      STR      r2,[sp,#0]
        0x080007de:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x080007e2:    429a        .B      CMP      r2,r3
        0x080007e4:    d901        ..      BLS      0x80007ea ; test_flags_and_compare + 66
        0x080007e6:    2101        .!      MOVS     r1,#1
        0x080007e8:    e000        ..      B        0x80007ec ; test_flags_and_compare + 68
        0x080007ea:    2100        .!      MOVS     r1,#0
        0x080007ec:    2901        .)      CMP      r1,#1
        0x080007ee:    d101        ..      BNE      0x80007f4 ; test_flags_and_compare + 76
        0x080007f0:    2401        .$      MOVS     r4,#1
        0x080007f2:    e000        ..      B        0x80007f6 ; test_flags_and_compare + 78
        0x080007f4:    2400        .$      MOVS     r4,#0
        0x080007f6:    4602        .F      MOV      r2,r0
        0x080007f8:    1c40        @.      ADDS     r0,r0,#1
        0x080007fa:    0092        ..      LSLS     r2,r2,#2
        0x080007fc:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000800:    6014        .`      STR      r4,[r2,#0]
        0x08000802:    2203        ."      MOVS     r2,#3
        0x08000804:    9201        ..      STR      r2,[sp,#4]
        0x08000806:    220a        ."      MOVS     r2,#0xa
        0x08000808:    9200        ..      STR      r2,[sp,#0]
        0x0800080a:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x0800080e:    429a        .B      CMP      r2,r3
        0x08000810:    d201        ..      BCS      0x8000816 ; test_flags_and_compare + 110
        0x08000812:    2101        .!      MOVS     r1,#1
        0x08000814:    e000        ..      B        0x8000818 ; test_flags_and_compare + 112
        0x08000816:    2100        .!      MOVS     r1,#0
        0x08000818:    2901        .)      CMP      r1,#1
        0x0800081a:    d101        ..      BNE      0x8000820 ; test_flags_and_compare + 120
        0x0800081c:    2401        .$      MOVS     r4,#1
        0x0800081e:    e000        ..      B        0x8000822 ; test_flags_and_compare + 122
        0x08000820:    2400        .$      MOVS     r4,#0
        0x08000822:    4602        .F      MOV      r2,r0
        0x08000824:    1c40        @.      ADDS     r0,r0,#1
        0x08000826:    0092        ..      LSLS     r2,r2,#2
        0x08000828:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x0800082c:    6014        .`      STR      r4,[r2,#0]
        0x0800082e:    f06f4200    o..B    MVN      r2,#0x80000000
        0x08000832:    1c53        S.      ADDS     r3,r2,#1
        0x08000834:    f1b34f00    ...O    CMP      r3,#0x80000000
        0x08000838:    d101        ..      BNE      0x800083e ; test_flags_and_compare + 150
        0x0800083a:    2601        .&      MOVS     r6,#1
        0x0800083c:    e000        ..      B        0x8000840 ; test_flags_and_compare + 152
        0x0800083e:    2600        .&      MOVS     r6,#0
        0x08000840:    4604        .F      MOV      r4,r0
        0x08000842:    1c40        @.      ADDS     r0,r0,#1
        0x08000844:    00a4        ..      LSLS     r4,r4,#2
        0x08000846:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x0800084a:    6026        &`      STR      r6,[r4,#0]
        0x0800084c:    227b        {"      MOVS     r2,#0x7b
        0x0800084e:    9201        ..      STR      r2,[sp,#4]
        0x08000850:    4252        RB      RSBS     r2,r2,#0
        0x08000852:    9200        ..      STR      r2,[sp,#0]
        0x08000854:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x08000858:    441a        .D      ADD      r2,r2,r3
        0x0800085a:    b90a        ..      CBNZ     r2,0x8000860 ; test_flags_and_compare + 184
        0x0800085c:    2101        .!      MOVS     r1,#1
        0x0800085e:    e000        ..      B        0x8000862 ; test_flags_and_compare + 186
        0x08000860:    2100        .!      MOVS     r1,#0
        0x08000862:    2901        .)      CMP      r1,#1
        0x08000864:    d101        ..      BNE      0x800086a ; test_flags_and_compare + 194
        0x08000866:    2401        .$      MOVS     r4,#1
        0x08000868:    e000        ..      B        0x800086c ; test_flags_and_compare + 196
        0x0800086a:    2400        .$      MOVS     r4,#0
        0x0800086c:    4602        .F      MOV      r2,r0
        0x0800086e:    1c40        @.      ADDS     r0,r0,#1
        0x08000870:    0092        ..      LSLS     r2,r2,#2
        0x08000872:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000876:    6014        .`      STR      r4,[r2,#0]
        0x08000878:    f640720f    @..r    MOV      r2,#0xf0f
        0x0800087c:    9201        ..      STR      r2,[sp,#4]
        0x0800087e:    0112        ..      LSLS     r2,r2,#4
        0x08000880:    9200        ..      STR      r2,[sp,#0]
        0x08000882:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x08000886:    401a        .@      ANDS     r2,r2,r3
        0x08000888:    b90a        ..      CBNZ     r2,0x800088e ; test_flags_and_compare + 230
        0x0800088a:    2101        .!      MOVS     r1,#1
        0x0800088c:    e000        ..      B        0x8000890 ; test_flags_and_compare + 232
        0x0800088e:    2100        .!      MOVS     r1,#0
        0x08000890:    2901        .)      CMP      r1,#1
        0x08000892:    d101        ..      BNE      0x8000898 ; test_flags_and_compare + 240
        0x08000894:    2401        .$      MOVS     r4,#1
        0x08000896:    e000        ..      B        0x800089a ; test_flags_and_compare + 242
        0x08000898:    2400        .$      MOVS     r4,#0
        0x0800089a:    4602        .F      MOV      r2,r0
        0x0800089c:    1c40        @.      ADDS     r0,r0,#1
        0x0800089e:    0092        ..      LSLS     r2,r2,#2
        0x080008a0:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080008a4:    6014        .`      STR      r4,[r2,#0]
        0x080008a6:    4a11        .J      LDR      r2,[pc,#68] ; [0x80008ec] = 0x12345678
        0x080008a8:    9201        ..      STR      r2,[sp,#4]
        0x080008aa:    9200        ..      STR      r2,[sp,#0]
        0x080008ac:    e9dd3200    ...2    LDRD     r3,r2,[sp,#0]
        0x080008b0:    405a        Z@      EORS     r2,r2,r3
        0x080008b2:    b90a        ..      CBNZ     r2,0x80008b8 ; test_flags_and_compare + 272
        0x080008b4:    2101        .!      MOVS     r1,#1
        0x080008b6:    e000        ..      B        0x80008ba ; test_flags_and_compare + 274
        0x080008b8:    2100        .!      MOVS     r1,#0
        0x080008ba:    2901        .)      CMP      r1,#1
        0x080008bc:    d101        ..      BNE      0x80008c2 ; test_flags_and_compare + 282
        0x080008be:    2401        .$      MOVS     r4,#1
        0x080008c0:    e000        ..      B        0x80008c4 ; test_flags_and_compare + 284
        0x080008c2:    2400        .$      MOVS     r4,#0
        0x080008c4:    4602        .F      MOV      r2,r0
        0x080008c6:    1c40        @.      ADDS     r0,r0,#1
        0x080008c8:    0092        ..      LSLS     r2,r2,#2
        0x080008ca:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x080008ce:    6014        .`      STR      r4,[r2,#0]
        0x080008d0:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x080008d4:    1c53        S.      ADDS     r3,r2,#1
        0x080008d6:    b90b        ..      CBNZ     r3,0x80008dc ; test_flags_and_compare + 308
        0x080008d8:    2601        .&      MOVS     r6,#1
        0x080008da:    e000        ..      B        0x80008de ; test_flags_and_compare + 310
        0x080008dc:    2600        .&      MOVS     r6,#0
        0x080008de:    4604        .F      MOV      r4,r0
        0x080008e0:    1c40        @.      ADDS     r0,r0,#1
        0x080008e2:    00a4        ..      LSLS     r4,r4,#2
        0x080008e4:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x080008e8:    6026        &`      STR      r6,[r4,#0]
        0x080008ea:    bd7c        |.      POP      {r2-r6,pc}
    $d
        0x080008ec:    12345678    xV4.    DCD    305419896
    $t
    i.test_load_store
    test_load_store
        0x080008f0:    b530        0.      PUSH     {r4,r5,lr}
        0x080008f2:    b093        ..      SUB      sp,sp,#0x4c
        0x080008f4:    2400        .$      MOVS     r4,#0
        0x080008f6:    2220         "      MOVS     r2,#0x20
        0x080008f8:    495f        _I      LDR      r1,[pc,#380] ; [0x8000a78] = 0x8000fe8
        0x080008fa:    a80b        ..      ADD      r0,sp,#0x2c
        0x080008fc:    f7fffc81    ....    BL       __aeabi_memcpy4 ; 0x8000202
        0x08000900:    2120         !      MOVS     r1,#0x20
        0x08000902:    a803        ..      ADD      r0,sp,#0xc
        0x08000904:    f7fffcaf    ....    BL       __aeabi_memclr4 ; 0x8000266
        0x08000908:    a05c        \.      ADR      r0,{pc}+0x174 ; 0x8000a7c
        0x0800090a:    6800        .h      LDR      r0,[r0,#0]
        0x0800090c:    9002        ..      STR      r0,[sp,#8]
        0x0800090e:    495a        ZI      LDR      r1,[pc,#360] ; [0x8000a78] = 0x8000fe8
        0x08000910:    3120         1      ADDS     r1,r1,#0x20
        0x08000912:    c903        ..      LDM      r1,{r0,r1}
        0x08000914:    e9cd0100    ....    STRD     r0,r1,[sp,#0]
        0x08000918:    980d        ..      LDR      r0,[sp,#0x34]
        0x0800091a:    9003        ..      STR      r0,[sp,#0xc]
        0x0800091c:    9803        ..      LDR      r0,[sp,#0xc]
        0x0800091e:    281e        .(      CMP      r0,#0x1e
        0x08000920:    d101        ..      BNE      0x8000926 ; test_load_store + 54
        0x08000922:    2201        ."      MOVS     r2,#1
        0x08000924:    e000        ..      B        0x8000928 ; test_load_store + 56
        0x08000926:    2200        ."      MOVS     r2,#0
        0x08000928:    4620         F      MOV      r0,r4
        0x0800092a:    1c64        d.      ADDS     r4,r4,#1
        0x0800092c:    0080        ..      LSLS     r0,r0,#2
        0x0800092e:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x08000932:    6002        .`      STR      r2,[r0,#0]
        0x08000934:    a80f        ..      ADD      r0,sp,#0x3c
        0x08000936:    6801        .h      LDR      r1,[r0,#0]
        0x08000938:    2932        2)      CMP      r1,#0x32
        0x0800093a:    d101        ..      BNE      0x8000940 ; test_load_store + 80
        0x0800093c:    2501        .%      MOVS     r5,#1
        0x0800093e:    e000        ..      B        0x8000942 ; test_load_store + 82
        0x08000940:    2500        .%      MOVS     r5,#0
        0x08000942:    4622        "F      MOV      r2,r4
        0x08000944:    1c64        d.      ADDS     r4,r4,#1
        0x08000946:    0092        ..      LSLS     r2,r2,#2
        0x08000948:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x0800094c:    6015        .`      STR      r5,[r2,#0]
        0x0800094e:    f89d0009    ....    LDRB     r0,[sp,#9]
        0x08000952:    9004        ..      STR      r0,[sp,#0x10]
        0x08000954:    9904        ..      LDR      r1,[sp,#0x10]
        0x08000956:    2934        4)      CMP      r1,#0x34
        0x08000958:    d101        ..      BNE      0x800095e ; test_load_store + 110
        0x0800095a:    2301        .#      MOVS     r3,#1
        0x0800095c:    e000        ..      B        0x8000960 ; test_load_store + 112
        0x0800095e:    2300        .#      MOVS     r3,#0
        0x08000960:    4621        !F      MOV      r1,r4
        0x08000962:    1c64        d.      ADDS     r4,r4,#1
        0x08000964:    0089        ..      LSLS     r1,r1,#2
        0x08000966:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x0800096a:    600b        .`      STR      r3,[r1,#0]
        0x0800096c:    21aa        .!      MOVS     r1,#0xaa
        0x0800096e:    f88d100a    ....    STRB     r1,[sp,#0xa]
        0x08000972:    f89d100a    ....    LDRB     r1,[sp,#0xa]
        0x08000976:    29aa        .)      CMP      r1,#0xaa
        0x08000978:    d101        ..      BNE      0x800097e ; test_load_store + 142
        0x0800097a:    2301        .#      MOVS     r3,#1
        0x0800097c:    e000        ..      B        0x8000980 ; test_load_store + 144
        0x0800097e:    2300        .#      MOVS     r3,#0
        0x08000980:    4621        !F      MOV      r1,r4
        0x08000982:    1c64        d.      ADDS     r4,r4,#1
        0x08000984:    0089        ..      LSLS     r1,r1,#2
        0x08000986:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x0800098a:    600b        .`      STR      r3,[r1,#0]
        0x0800098c:    f8bd0002    ....    LDRH     r0,[sp,#2]
        0x08000990:    9005        ..      STR      r0,[sp,#0x14]
        0x08000992:    f2456278    E.xb    MOV      r2,#0x5678
        0x08000996:    9905        ..      LDR      r1,[sp,#0x14]
        0x08000998:    4291        .B      CMP      r1,r2
        0x0800099a:    d101        ..      BNE      0x80009a0 ; test_load_store + 176
        0x0800099c:    2301        .#      MOVS     r3,#1
        0x0800099e:    e000        ..      B        0x80009a2 ; test_load_store + 178
        0x080009a0:    2300        .#      MOVS     r3,#0
        0x080009a2:    4621        !F      MOV      r1,r4
        0x080009a4:    1c64        d.      ADDS     r4,r4,#1
        0x080009a6:    0089        ..      LSLS     r1,r1,#2
        0x080009a8:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x080009ac:    600b        .`      STR      r3,[r1,#0]
        0x080009ae:    f2412134    A.4!    MOV      r1,#0x1234
        0x080009b2:    f8ad1006    ....    STRH     r1,[sp,#6]
        0x080009b6:    f8bd1006    ....    LDRH     r1,[sp,#6]
        0x080009ba:    f2412234    A.4"    MOV      r2,#0x1234
        0x080009be:    4291        .B      CMP      r1,r2
        0x080009c0:    d101        ..      BNE      0x80009c6 ; test_load_store + 214
        0x080009c2:    2301        .#      MOVS     r3,#1
        0x080009c4:    e000        ..      B        0x80009c8 ; test_load_store + 216
        0x080009c6:    2300        .#      MOVS     r3,#0
        0x080009c8:    4621        !F      MOV      r1,r4
        0x080009ca:    1c64        d.      ADDS     r4,r4,#1
        0x080009cc:    0089        ..      LSLS     r1,r1,#2
        0x080009ce:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x080009d2:    600b        .`      STR      r3,[r1,#0]
        0x080009d4:    2000        .       MOVS     r0,#0
        0x080009d6:    e006        ..      B        0x80009e6 ; test_load_store + 246
        0x080009d8:    aa0b        ..      ADD      r2,sp,#0x2c
        0x080009da:    f8522020    R.      LDR      r2,[r2,r0,LSL #2]
        0x080009de:    ab03        ..      ADD      r3,sp,#0xc
        0x080009e0:    f8432020    C.      STR      r2,[r3,r0,LSL #2]
        0x080009e4:    1c40        @.      ADDS     r0,r0,#1
        0x080009e6:    2808        .(      CMP      r0,#8
        0x080009e8:    dbf6        ..      BLT      0x80009d8 ; test_load_store + 232
        0x080009ea:    2101        .!      MOVS     r1,#1
        0x080009ec:    2000        .       MOVS     r0,#0
        0x080009ee:    e00a        ..      B        0x8000a06 ; test_load_store + 278
        0x080009f0:    aa03        ..      ADD      r2,sp,#0xc
        0x080009f2:    f8522020    R.      LDR      r2,[r2,r0,LSL #2]
        0x080009f6:    ab0b        ..      ADD      r3,sp,#0x2c
        0x080009f8:    f8533020    S. 0    LDR      r3,[r3,r0,LSL #2]
        0x080009fc:    429a        .B      CMP      r2,r3
        0x080009fe:    d001        ..      BEQ      0x8000a04 ; test_load_store + 276
        0x08000a00:    2100        .!      MOVS     r1,#0
        0x08000a02:    e002        ..      B        0x8000a0a ; test_load_store + 282
        0x08000a04:    1c40        @.      ADDS     r0,r0,#1
        0x08000a06:    2808        .(      CMP      r0,#8
        0x08000a08:    dbf2        ..      BLT      0x80009f0 ; test_load_store + 256
        0x08000a0a:    bf00        ..      NOP      
        0x08000a0c:    b109        ..      CBZ      r1,0x8000a12 ; test_load_store + 290
        0x08000a0e:    2501        .%      MOVS     r5,#1
        0x08000a10:    e000        ..      B        0x8000a14 ; test_load_store + 292
        0x08000a12:    2500        .%      MOVS     r5,#0
        0x08000a14:    4622        "F      MOV      r2,r4
        0x08000a16:    1c64        d.      ADDS     r4,r4,#1
        0x08000a18:    0092        ..      LSLS     r2,r2,#2
        0x08000a1a:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000a1e:    6015        .`      STR      r5,[r2,#0]
        0x08000a20:    2100        .!      MOVS     r1,#0
        0x08000a22:    2000        .       MOVS     r0,#0
        0x08000a24:    e003        ..      B        0x8000a2e ; test_load_store + 318
        0x08000a26:    aa02        ..      ADD      r2,sp,#8
        0x08000a28:    5c12        .\      LDRB     r2,[r2,r0]
        0x08000a2a:    4411        .D      ADD      r1,r1,r2
        0x08000a2c:    1c40        @.      ADDS     r0,r0,#1
        0x08000a2e:    2804        .(      CMP      r0,#4
        0x08000a30:    dbf9        ..      BLT      0x8000a26 ; test_load_store + 310
        0x08000a32:    f5b17fb4    ....    CMP      r1,#0x168
        0x08000a36:    d101        ..      BNE      0x8000a3c ; test_load_store + 332
        0x08000a38:    2501        .%      MOVS     r5,#1
        0x08000a3a:    e000        ..      B        0x8000a3e ; test_load_store + 334
        0x08000a3c:    2500        .%      MOVS     r5,#0
        0x08000a3e:    4622        "F      MOV      r2,r4
        0x08000a40:    1c64        d.      ADDS     r4,r4,#1
        0x08000a42:    0092        ..      LSLS     r2,r2,#2
        0x08000a44:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000a48:    6015        .`      STR      r5,[r2,#0]
        0x08000a4a:    2100        .!      MOVS     r1,#0
        0x08000a4c:    2000        .       MOVS     r0,#0
        0x08000a4e:    e003        ..      B        0x8000a58 ; test_load_store + 360
        0x08000a50:    f83d2010    =..     LDRH     r2,[sp,r0,LSL #1]
        0x08000a54:    4411        .D      ADD      r1,r1,r2
        0x08000a56:    1c40        @.      ADDS     r0,r0,#1
        0x08000a58:    2804        .(      CMP      r0,#4
        0x08000a5a:    dbf9        ..      BLT      0x8000a50 ; test_load_store + 352
        0x08000a5c:    4a08        .J      LDR      r2,[pc,#32] ; [0x8000a80] = 0x1159c
        0x08000a5e:    4291        .B      CMP      r1,r2
        0x08000a60:    d101        ..      BNE      0x8000a66 ; test_load_store + 374
        0x08000a62:    2501        .%      MOVS     r5,#1
        0x08000a64:    e000        ..      B        0x8000a68 ; test_load_store + 376
        0x08000a66:    2500        .%      MOVS     r5,#0
        0x08000a68:    4622        "F      MOV      r2,r4
        0x08000a6a:    1c64        d.      ADDS     r4,r4,#1
        0x08000a6c:    0092        ..      LSLS     r2,r2,#2
        0x08000a6e:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000a72:    6015        .`      STR      r5,[r2,#0]
        0x08000a74:    b013        ..      ADD      sp,sp,#0x4c
        0x08000a76:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x08000a78:    08000fe8    ....    DCD    134221800
        0x08000a7c:    78563412    .4Vx    DCD    2018915346
        0x08000a80:    0001159c    ....    DCD    71068
    $t
    i.test_logical_and_shift
    test_logical_and_shift
        0x08000a84:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08000a86:    2000        .       MOVS     r0,#0
        0x08000a88:    f640720f    @..r    MOV      r2,#0xf0f
        0x08000a8c:    23ff        .#      MOVS     r3,#0xff
        0x08000a8e:    ea020103    ....    AND      r1,r2,r3
        0x08000a92:    290f        .)      CMP      r1,#0xf
        0x08000a94:    d101        ..      BNE      0x8000a9a ; test_logical_and_shift + 22
        0x08000a96:    2601        .&      MOVS     r6,#1
        0x08000a98:    e000        ..      B        0x8000a9c ; test_logical_and_shift + 24
        0x08000a9a:    2600        .&      MOVS     r6,#0
        0x08000a9c:    4604        .F      MOV      r4,r0
        0x08000a9e:    1c40        @.      ADDS     r0,r0,#1
        0x08000aa0:    00a4        ..      LSLS     r4,r4,#2
        0x08000aa2:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000aa6:    6026        &`      STR      r6,[r4,#0]
        0x08000aa8:    f44f6270    O.pb    MOV      r2,#0xf00
        0x08000aac:    23f0        .#      MOVS     r3,#0xf0
        0x08000aae:    ea420103    B...    ORR      r1,r2,r3
        0x08000ab2:    f5b16f7f    ...o    CMP      r1,#0xff0
        0x08000ab6:    d101        ..      BNE      0x8000abc ; test_logical_and_shift + 56
        0x08000ab8:    2601        .&      MOVS     r6,#1
        0x08000aba:    e000        ..      B        0x8000abe ; test_logical_and_shift + 58
        0x08000abc:    2600        .&      MOVS     r6,#0
        0x08000abe:    4604        .F      MOV      r4,r0
        0x08000ac0:    1c40        @.      ADDS     r0,r0,#1
        0x08000ac2:    00a4        ..      LSLS     r4,r4,#2
        0x08000ac4:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000ac8:    6026        &`      STR      r6,[r4,#0]
        0x08000aca:    22ff        ."      MOVS     r2,#0xff
        0x08000acc:    0113        ..      LSLS     r3,r2,#4
        0x08000ace:    ea820103    ....    EOR      r1,r2,r3
        0x08000ad2:    f640740f    @..t    MOV      r4,#0xf0f
        0x08000ad6:    42a1        .B      CMP      r1,r4
        0x08000ad8:    d101        ..      BNE      0x8000ade ; test_logical_and_shift + 90
        0x08000ada:    2601        .&      MOVS     r6,#1
        0x08000adc:    e000        ..      B        0x8000ae0 ; test_logical_and_shift + 92
        0x08000ade:    2600        .&      MOVS     r6,#0
        0x08000ae0:    4604        .F      MOV      r4,r0
        0x08000ae2:    1c40        @.      ADDS     r0,r0,#1
        0x08000ae4:    00a4        ..      LSLS     r4,r4,#2
        0x08000ae6:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000aea:    6026        &`      STR      r6,[r4,#0]
        0x08000aec:    2201        ."      MOVS     r2,#1
        0x08000aee:    0111        ..      LSLS     r1,r2,#4
        0x08000af0:    2910        .)      CMP      r1,#0x10
        0x08000af2:    d101        ..      BNE      0x8000af8 ; test_logical_and_shift + 116
        0x08000af4:    2601        .&      MOVS     r6,#1
        0x08000af6:    e000        ..      B        0x8000afa ; test_logical_and_shift + 118
        0x08000af8:    2600        .&      MOVS     r6,#0
        0x08000afa:    4604        .F      MOV      r4,r0
        0x08000afc:    1c40        @.      ADDS     r0,r0,#1
        0x08000afe:    00a4        ..      LSLS     r4,r4,#2
        0x08000b00:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000b04:    6026        &`      STR      r6,[r4,#0]
        0x08000b06:    f04f4200    O..B    MOV      r2,#0x80000000
        0x08000b0a:    0911        ..      LSRS     r1,r2,#4
        0x08000b0c:    f1b16f00    ...o    CMP      r1,#0x8000000
        0x08000b10:    d101        ..      BNE      0x8000b16 ; test_logical_and_shift + 146
        0x08000b12:    2601        .&      MOVS     r6,#1
        0x08000b14:    e000        ..      B        0x8000b18 ; test_logical_and_shift + 148
        0x08000b16:    2600        .&      MOVS     r6,#0
        0x08000b18:    4604        .F      MOV      r4,r0
        0x08000b1a:    1c40        @.      ADDS     r0,r0,#1
        0x08000b1c:    00a4        ..      LSLS     r4,r4,#2
        0x08000b1e:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000b22:    6026        &`      STR      r6,[r4,#0]
        0x08000b24:    f06f040f    o...    MVN      r4,#0xf
        0x08000b28:    10a1        ..      ASRS     r1,r4,#2
        0x08000b2a:    1d0d        ..      ADDS     r5,r1,#4
        0x08000b2c:    b90d        ..      CBNZ     r5,0x8000b32 ; test_logical_and_shift + 174
        0x08000b2e:    2701        .'      MOVS     r7,#1
        0x08000b30:    e000        ..      B        0x8000b34 ; test_logical_and_shift + 176
        0x08000b32:    2700        .'      MOVS     r7,#0
        0x08000b34:    4605        .F      MOV      r5,r0
        0x08000b36:    1c40        @.      ADDS     r0,r0,#1
        0x08000b38:    00ad        ..      LSLS     r5,r5,#2
        0x08000b3a:    f1055500    ...U    ADD      r5,r5,#0x20000000
        0x08000b3e:    602f        /`      STR      r7,[r5,#0]
        0x08000b40:    2401        .$      MOVS     r4,#1
        0x08000b42:    0865        e.      LSRS     r5,r4,#1
        0x08000b44:    ea4571c4    E..q    ORR      r1,r5,r4,LSL #31
        0x08000b48:    f1b14f00    ...O    CMP      r1,#0x80000000
        0x08000b4c:    d101        ..      BNE      0x8000b52 ; test_logical_and_shift + 206
        0x08000b4e:    2701        .'      MOVS     r7,#1
        0x08000b50:    e000        ..      B        0x8000b54 ; test_logical_and_shift + 208
        0x08000b52:    2700        .'      MOVS     r7,#0
        0x08000b54:    4605        .F      MOV      r5,r0
        0x08000b56:    1c40        @.      ADDS     r0,r0,#1
        0x08000b58:    00ad        ..      LSLS     r5,r5,#2
        0x08000b5a:    f1055500    ...U    ADD      r5,r5,#0x20000000
        0x08000b5e:    602f        /`      STR      r7,[r5,#0]
        0x08000b60:    f64f72ff    O..r    MOV      r2,#0xffff
        0x08000b64:    f002040f    ....    AND      r4,r2,#0xf
        0x08000b68:    b10c        ..      CBZ      r4,0x8000b6e ; test_logical_and_shift + 234
        0x08000b6a:    2101        .!      MOVS     r1,#1
        0x08000b6c:    e000        ..      B        0x8000b70 ; test_logical_and_shift + 236
        0x08000b6e:    2100        .!      MOVS     r1,#0
        0x08000b70:    2901        .)      CMP      r1,#1
        0x08000b72:    d101        ..      BNE      0x8000b78 ; test_logical_and_shift + 244
        0x08000b74:    2601        .&      MOVS     r6,#1
        0x08000b76:    e000        ..      B        0x8000b7a ; test_logical_and_shift + 246
        0x08000b78:    2600        .&      MOVS     r6,#0
        0x08000b7a:    4604        .F      MOV      r4,r0
        0x08000b7c:    1c40        @.      ADDS     r0,r0,#1
        0x08000b7e:    00a4        ..      LSLS     r4,r4,#2
        0x08000b80:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000b84:    6026        &`      STR      r6,[r4,#0]
        0x08000b86:    2200        ."      MOVS     r2,#0
        0x08000b88:    43d1        .C      MVNS     r1,r2
        0x08000b8a:    1c4c        L.      ADDS     r4,r1,#1
        0x08000b8c:    b90c        ..      CBNZ     r4,0x8000b92 ; test_logical_and_shift + 270
        0x08000b8e:    2601        .&      MOVS     r6,#1
        0x08000b90:    e000        ..      B        0x8000b94 ; test_logical_and_shift + 272
        0x08000b92:    2600        .&      MOVS     r6,#0
        0x08000b94:    4604        .F      MOV      r4,r0
        0x08000b96:    1c40        @.      ADDS     r0,r0,#1
        0x08000b98:    00a4        ..      LSLS     r4,r4,#2
        0x08000b9a:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000b9e:    6026        &`      STR      r6,[r4,#0]
        0x08000ba0:    4c08        .L      LDR      r4,[pc,#32] ; [0x8000bc4] = 0x12345678
        0x08000ba2:    0125        %.      LSLS     r5,r4,#4
        0x08000ba4:    ea457114    E..q    ORR      r1,r5,r4,LSR #28
        0x08000ba8:    ea4f7534    O.4u    ROR      r5,r4,#28
        0x08000bac:    42a9        .B      CMP      r1,r5
        0x08000bae:    d101        ..      BNE      0x8000bb4 ; test_logical_and_shift + 304
        0x08000bb0:    2701        .'      MOVS     r7,#1
        0x08000bb2:    e000        ..      B        0x8000bb6 ; test_logical_and_shift + 306
        0x08000bb4:    2700        .'      MOVS     r7,#0
        0x08000bb6:    4605        .F      MOV      r5,r0
        0x08000bb8:    1c40        @.      ADDS     r0,r0,#1
        0x08000bba:    00ad        ..      LSLS     r5,r5,#2
        0x08000bbc:    f1055500    ...U    ADD      r5,r5,#0x20000000
        0x08000bc0:    602f        /`      STR      r7,[r5,#0]
        0x08000bc2:    bdf0        ..      POP      {r4-r7,pc}
    $d
        0x08000bc4:    12345678    xV4.    DCD    305419896
    $t
    i.test_multiply_divide
    test_multiply_divide
        0x08000bc8:    e92d43fe    -..C    PUSH     {r1-r9,lr}
        0x08000bcc:    2000        .       MOVS     r0,#0
        0x08000bce:    230c        .#      MOVS     r3,#0xc
        0x08000bd0:    9302        ..      STR      r3,[sp,#8]
        0x08000bd2:    230b        .#      MOVS     r3,#0xb
        0x08000bd4:    9301        ..      STR      r3,[sp,#4]
        0x08000bd6:    e9dd4301    ...C    LDRD     r4,r3,[sp,#4]
        0x08000bda:    4363        cC      MULS     r3,r4,r3
        0x08000bdc:    9300        ..      STR      r3,[sp,#0]
        0x08000bde:    9b00        ..      LDR      r3,[sp,#0]
        0x08000be0:    2b84        .+      CMP      r3,#0x84
        0x08000be2:    d101        ..      BNE      0x8000be8 ; test_multiply_divide + 32
        0x08000be4:    2501        .%      MOVS     r5,#1
        0x08000be6:    e000        ..      B        0x8000bea ; test_multiply_divide + 34
        0x08000be8:    2500        .%      MOVS     r5,#0
        0x08000bea:    4603        .F      MOV      r3,r0
        0x08000bec:    1c40        @.      ADDS     r0,r0,#1
        0x08000bee:    009b        ..      LSLS     r3,r3,#2
        0x08000bf0:    f1035300    ...S    ADD      r3,r3,#0x20000000
        0x08000bf4:    601d        .`      STR      r5,[r3,#0]
        0x08000bf6:    2305        .#      MOVS     r3,#5
        0x08000bf8:    9302        ..      STR      r3,[sp,#8]
        0x08000bfa:    2306        .#      MOVS     r3,#6
        0x08000bfc:    9301        ..      STR      r3,[sp,#4]
        0x08000bfe:    2307        .#      MOVS     r3,#7
        0x08000c00:    9300        ..      STR      r3,[sp,#0]
        0x08000c02:    e9dd6501    ...e    LDRD     r6,r5,[sp,#4]
        0x08000c06:    9c00        ..      LDR      r4,[sp,#0]
        0x08000c08:    fb054306    ...C    MLA      r3,r5,r6,r4
        0x08000c0c:    2b25        %+      CMP      r3,#0x25
        0x08000c0e:    d101        ..      BNE      0x8000c14 ; test_multiply_divide + 76
        0x08000c10:    2601        .&      MOVS     r6,#1
        0x08000c12:    e000        ..      B        0x8000c16 ; test_multiply_divide + 78
        0x08000c14:    2600        .&      MOVS     r6,#0
        0x08000c16:    4604        .F      MOV      r4,r0
        0x08000c18:    1c40        @.      ADDS     r0,r0,#1
        0x08000c1a:    00a4        ..      LSLS     r4,r4,#2
        0x08000c1c:    f1045400    ...T    ADD      r4,r4,#0x20000000
        0x08000c20:    6026        &`      STR      r6,[r4,#0]
        0x08000c22:    f04f34ff    O..4    MOV      r4,#0xffffffff
        0x08000c26:    2302        .#      MOVS     r3,#2
        0x08000c28:    fba41203    ....    UMULL    r1,r2,r4,r3
        0x08000c2c:    1f1e        ..      SUBS     r6,r3,#4
        0x08000c2e:    2701        .'      MOVS     r7,#1
        0x08000c30:    ea810506    ....    EOR      r5,r1,r6
        0x08000c34:    ea820607    ....    EOR      r6,r2,r7
        0x08000c38:    4335        5C      ORRS     r5,r5,r6
        0x08000c3a:    d100        ..      BNE      0x8000c3e ; test_multiply_divide + 118
        0x08000c3c:    e000        ..      B        0x8000c40 ; test_multiply_divide + 120
        0x08000c3e:    2700        .'      MOVS     r7,#0
        0x08000c40:    4605        .F      MOV      r5,r0
        0x08000c42:    1c40        @.      ADDS     r0,r0,#1
        0x08000c44:    00ad        ..      LSLS     r5,r5,#2
        0x08000c46:    f1055500    ...U    ADD      r5,r5,#0x20000000
        0x08000c4a:    602f        /`      STR      r7,[r5,#0]
        0x08000c4c:    f06f0401    o...    MVN      r4,#1
        0x08000c50:    2303        .#      MOVS     r3,#3
        0x08000c52:    fb845c03    ...\    SMULL    r5,r12,r4,r3
        0x08000c56:    4666        fF      MOV      r6,r12
        0x08000c58:    f06f0905    o...    MVN      r9,#5
        0x08000c5c:    ea850709    ....    EOR      r7,r5,r9
        0x08000c60:    ea770706    w...    ORNS     r7,r7,r6
        0x08000c64:    d102        ..      BNE      0x8000c6c ; test_multiply_divide + 164
        0x08000c66:    f04f0801    O...    MOV      r8,#1
        0x08000c6a:    e001        ..      B        0x8000c70 ; test_multiply_divide + 168
        0x08000c6c:    f04f0800    O...    MOV      r8,#0
        0x08000c70:    4607        .F      MOV      r7,r0
        0x08000c72:    1c40        @.      ADDS     r0,r0,#1
        0x08000c74:    00bf        ..      LSLS     r7,r7,#2
        0x08000c76:    f1075700    ...W    ADD      r7,r7,#0x20000000
        0x08000c7a:    f8c78000    ....    STR      r8,[r7,#0]
        0x08000c7e:    2364        d#      MOVS     r3,#0x64
        0x08000c80:    2407        .$      MOVS     r4,#7
        0x08000c82:    fbb3f5f4    ....    UDIV     r5,r3,r4
        0x08000c86:    fbb3f7f4    ....    UDIV     r7,r3,r4
        0x08000c8a:    fb043617    ...6    MLS      r6,r4,r7,r3
        0x08000c8e:    2d0e        .-      CMP      r5,#0xe
        0x08000c90:    d104        ..      BNE      0x8000c9c ; test_multiply_divide + 212
        0x08000c92:    2e02        ..      CMP      r6,#2
        0x08000c94:    d102        ..      BNE      0x8000c9c ; test_multiply_divide + 212
        0x08000c96:    f04f0801    O...    MOV      r8,#1
        0x08000c9a:    e001        ..      B        0x8000ca0 ; test_multiply_divide + 216
        0x08000c9c:    f04f0800    O...    MOV      r8,#0
        0x08000ca0:    4607        .F      MOV      r7,r0
        0x08000ca2:    1c40        @.      ADDS     r0,r0,#1
        0x08000ca4:    00bf        ..      LSLS     r7,r7,#2
        0x08000ca6:    f1075700    ...W    ADD      r7,r7,#0x20000000
        0x08000caa:    f8c78000    ....    STR      r8,[r7,#0]
        0x08000cae:    f06f0363    o.c.    MVN      r3,#0x63
        0x08000cb2:    2407        .$      MOVS     r4,#7
        0x08000cb4:    fb93f5f4    ....    SDIV     r5,r3,r4
        0x08000cb8:    f105060e    ....    ADD      r6,r5,#0xe
        0x08000cbc:    b916        ..      CBNZ     r6,0x8000cc4 ; test_multiply_divide + 252
        0x08000cbe:    f04f0c01    O...    MOV      r12,#1
        0x08000cc2:    e001        ..      B        0x8000cc8 ; test_multiply_divide + 256
        0x08000cc4:    f04f0c00    O...    MOV      r12,#0
        0x08000cc8:    4606        .F      MOV      r6,r0
        0x08000cca:    1c40        @.      ADDS     r0,r0,#1
        0x08000ccc:    00b6        ..      LSLS     r6,r6,#2
        0x08000cce:    f1065600    ...V    ADD      r6,r6,#0x20000000
        0x08000cd2:    f8c6c000    ....    STR      r12,[r6,#0]
        0x08000cd6:    e8bd83fe    ....    POP      {r1-r9,pc}
        0x08000cda:    0000        ..      MOVS     r0,r0
    i.test_pipeline_hazards
    test_pipeline_hazards
        0x08000cdc:    b570        p.      PUSH     {r4-r6,lr}
        0x08000cde:    b088        ..      SUB      sp,sp,#0x20
        0x08000ce0:    2000        .       MOVS     r0,#0
        0x08000ce2:    210a        .!      MOVS     r1,#0xa
        0x08000ce4:    9107        ..      STR      r1,[sp,#0x1c]
        0x08000ce6:    9907        ..      LDR      r1,[sp,#0x1c]
        0x08000ce8:    1d49        I.      ADDS     r1,r1,#5
        0x08000cea:    9106        ..      STR      r1,[sp,#0x18]
        0x08000cec:    9906        ..      LDR      r1,[sp,#0x18]
        0x08000cee:    1d49        I.      ADDS     r1,r1,#5
        0x08000cf0:    9105        ..      STR      r1,[sp,#0x14]
        0x08000cf2:    9905        ..      LDR      r1,[sp,#0x14]
        0x08000cf4:    1d49        I.      ADDS     r1,r1,#5
        0x08000cf6:    9104        ..      STR      r1,[sp,#0x10]
        0x08000cf8:    9904        ..      LDR      r1,[sp,#0x10]
        0x08000cfa:    2919        .)      CMP      r1,#0x19
        0x08000cfc:    d101        ..      BNE      0x8000d02 ; test_pipeline_hazards + 38
        0x08000cfe:    2301        .#      MOVS     r3,#1
        0x08000d00:    e000        ..      B        0x8000d04 ; test_pipeline_hazards + 40
        0x08000d02:    2300        .#      MOVS     r3,#0
        0x08000d04:    4601        .F      MOV      r1,r0
        0x08000d06:    1c40        @.      ADDS     r0,r0,#1
        0x08000d08:    0089        ..      LSLS     r1,r1,#2
        0x08000d0a:    f1015100    ...Q    ADD      r1,r1,#0x20000000
        0x08000d0e:    600b        .`      STR      r3,[r1,#0]
        0x08000d10:    4a37        7J      LDR      r2,[pc,#220] ; [0x8000df0] = 0x12345678
        0x08000d12:    9203        ..      STR      r2,[sp,#0xc]
        0x08000d14:    a903        ..      ADD      r1,sp,#0xc
        0x08000d16:    680a        .h      LDR      r2,[r1,#0]
        0x08000d18:    9207        ..      STR      r2,[sp,#0x1c]
        0x08000d1a:    9a07        ..      LDR      r2,[sp,#0x1c]
        0x08000d1c:    1c52        R.      ADDS     r2,r2,#1
        0x08000d1e:    9206        ..      STR      r2,[sp,#0x18]
        0x08000d20:    4b33        3K      LDR      r3,[pc,#204] ; [0x8000df0] = 0x12345678
        0x08000d22:    1c5b        [.      ADDS     r3,r3,#1
        0x08000d24:    9a06        ..      LDR      r2,[sp,#0x18]
        0x08000d26:    429a        .B      CMP      r2,r3
        0x08000d28:    d101        ..      BNE      0x8000d2e ; test_pipeline_hazards + 82
        0x08000d2a:    2401        .$      MOVS     r4,#1
        0x08000d2c:    e000        ..      B        0x8000d30 ; test_pipeline_hazards + 84
        0x08000d2e:    2400        .$      MOVS     r4,#0
        0x08000d30:    4602        .F      MOV      r2,r0
        0x08000d32:    1c40        @.      ADDS     r0,r0,#1
        0x08000d34:    0092        ..      LSLS     r2,r2,#2
        0x08000d36:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000d3a:    6014        .`      STR      r4,[r2,#0]
        0x08000d3c:    2201        ."      MOVS     r2,#1
        0x08000d3e:    9203        ..      STR      r2,[sp,#0xc]
        0x08000d40:    2100        .!      MOVS     r1,#0
        0x08000d42:    9a03        ..      LDR      r2,[sp,#0xc]
        0x08000d44:    b10a        ..      CBZ      r2,0x8000d4a ; test_pipeline_hazards + 110
        0x08000d46:    2164        d!      MOVS     r1,#0x64
        0x08000d48:    e000        ..      B        0x8000d4c ; test_pipeline_hazards + 112
        0x08000d4a:    21c8        .!      MOVS     r1,#0xc8
        0x08000d4c:    2964        d)      CMP      r1,#0x64
        0x08000d4e:    d101        ..      BNE      0x8000d54 ; test_pipeline_hazards + 120
        0x08000d50:    2401        .$      MOVS     r4,#1
        0x08000d52:    e000        ..      B        0x8000d56 ; test_pipeline_hazards + 122
        0x08000d54:    2400        .$      MOVS     r4,#0
        0x08000d56:    4602        .F      MOV      r2,r0
        0x08000d58:    1c40        @.      ADDS     r0,r0,#1
        0x08000d5a:    0092        ..      LSLS     r2,r2,#2
        0x08000d5c:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000d60:    6014        .`      STR      r4,[r2,#0]
        0x08000d62:    4e24        $N      LDR      r6,[pc,#144] ; [0x8000df4] = 0x8001020
        0x08000d64:    ce78        x.      LDM      r6,{r3-r6}
        0x08000d66:    e88d0078    ..x.    STM      sp,{r3-r6}
        0x08000d6a:    2200        ."      MOVS     r2,#0
        0x08000d6c:    2100        .!      MOVS     r1,#0
        0x08000d6e:    e003        ..      B        0x8000d78 ; test_pipeline_hazards + 156
        0x08000d70:    f85d3021    ].!0    LDR      r3,[sp,r1,LSL #2]
        0x08000d74:    441a        .D      ADD      r2,r2,r3
        0x08000d76:    1c49        I.      ADDS     r1,r1,#1
        0x08000d78:    2904        .)      CMP      r1,#4
        0x08000d7a:    dbf9        ..      BLT      0x8000d70 ; test_pipeline_hazards + 148
        0x08000d7c:    2a0a        .*      CMP      r2,#0xa
        0x08000d7e:    d101        ..      BNE      0x8000d84 ; test_pipeline_hazards + 168
        0x08000d80:    2501        .%      MOVS     r5,#1
        0x08000d82:    e000        ..      B        0x8000d86 ; test_pipeline_hazards + 170
        0x08000d84:    2500        .%      MOVS     r5,#0
        0x08000d86:    4603        .F      MOV      r3,r0
        0x08000d88:    1c40        @.      ADDS     r0,r0,#1
        0x08000d8a:    009b        ..      LSLS     r3,r3,#2
        0x08000d8c:    f1035300    ...S    ADD      r3,r3,#0x20000000
        0x08000d90:    601d        .`      STR      r5,[r3,#0]
        0x08000d92:    2101        .!      MOVS     r1,#1
        0x08000d94:    1c49        I.      ADDS     r1,r1,#1
        0x08000d96:    1c49        I.      ADDS     r1,r1,#1
        0x08000d98:    1c49        I.      ADDS     r1,r1,#1
        0x08000d9a:    2904        .)      CMP      r1,#4
        0x08000d9c:    d101        ..      BNE      0x8000da2 ; test_pipeline_hazards + 198
        0x08000d9e:    2401        .$      MOVS     r4,#1
        0x08000da0:    e000        ..      B        0x8000da4 ; test_pipeline_hazards + 200
        0x08000da2:    2400        .$      MOVS     r4,#0
        0x08000da4:    4602        .F      MOV      r2,r0
        0x08000da6:    1c40        @.      ADDS     r0,r0,#1
        0x08000da8:    0092        ..      LSLS     r2,r2,#2
        0x08000daa:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000dae:    6014        .`      STR      r4,[r2,#0]
        0x08000db0:    2101        .!      MOVS     r1,#1
        0x08000db2:    2102        .!      MOVS     r1,#2
        0x08000db4:    2103        .!      MOVS     r1,#3
        0x08000db6:    2903        .)      CMP      r1,#3
        0x08000db8:    d101        ..      BNE      0x8000dbe ; test_pipeline_hazards + 226
        0x08000dba:    2401        .$      MOVS     r4,#1
        0x08000dbc:    e000        ..      B        0x8000dc0 ; test_pipeline_hazards + 228
        0x08000dbe:    2400        .$      MOVS     r4,#0
        0x08000dc0:    4602        .F      MOV      r2,r0
        0x08000dc2:    1c40        @.      ADDS     r0,r0,#1
        0x08000dc4:    0092        ..      LSLS     r2,r2,#2
        0x08000dc6:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000dca:    6014        .`      STR      r4,[r2,#0]
        0x08000dcc:    2101        .!      MOVS     r1,#1
        0x08000dce:    460a        .F      MOV      r2,r1
        0x08000dd0:    2102        .!      MOVS     r1,#2
        0x08000dd2:    b11a        ..      CBZ      r2,0x8000ddc ; test_pipeline_hazards + 256
        0x08000dd4:    2902        .)      CMP      r1,#2
        0x08000dd6:    d101        ..      BNE      0x8000ddc ; test_pipeline_hazards + 256
        0x08000dd8:    2501        .%      MOVS     r5,#1
        0x08000dda:    e000        ..      B        0x8000dde ; test_pipeline_hazards + 258
        0x08000ddc:    2500        .%      MOVS     r5,#0
        0x08000dde:    4603        .F      MOV      r3,r0
        0x08000de0:    1c40        @.      ADDS     r0,r0,#1
        0x08000de2:    009b        ..      LSLS     r3,r3,#2
        0x08000de4:    f1035300    ...S    ADD      r3,r3,#0x20000000
        0x08000de8:    601d        .`      STR      r5,[r3,#0]
        0x08000dea:    b008        ..      ADD      sp,sp,#0x20
        0x08000dec:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08000dee:    0000        ..      DCW    0
        0x08000df0:    12345678    xV4.    DCD    305419896
        0x08000df4:    08001020     ...    DCD    134221856
    $t
    i.test_stack_and_multi
    test_stack_and_multi
        0x08000df8:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08000dfc:    b088        ..      SUB      sp,sp,#0x20
        0x08000dfe:    2300        .#      MOVS     r3,#0
        0x08000e00:    f04f3411    O..4    MOV      r4,#0x11111111
        0x08000e04:    0065        e.      LSLS     r5,r4,#1
        0x08000e06:    f04f3633    O.36    MOV      r6,#0x33333333
        0x08000e0a:    00a7        ..      LSLS     r7,r4,#2
        0x08000e0c:    4620         F      MOV      r0,r4
        0x08000e0e:    4629        )F      MOV      r1,r5
        0x08000e10:    4632        2F      MOV      r2,r6
        0x08000e12:    46bc        .F      MOV      r12,r7
        0x08000e14:    f1b03f11    ...?    CMP      r0,#0x11111111
        0x08000e18:    d10b        ..      BNE      0x8000e32 ; test_stack_and_multi + 58
        0x08000e1a:    f1b13f22    .."?    CMP      r1,#0x22222222
        0x08000e1e:    d108        ..      BNE      0x8000e32 ; test_stack_and_multi + 58
        0x08000e20:    f1b23f33    ..3?    CMP      r2,#0x33333333
        0x08000e24:    d105        ..      BNE      0x8000e32 ; test_stack_and_multi + 58
        0x08000e26:    f1bc3f44    ..D?    CMP      r12,#0x44444444
        0x08000e2a:    d102        ..      BNE      0x8000e32 ; test_stack_and_multi + 58
        0x08000e2c:    f04f0a01    O...    MOV      r10,#1
        0x08000e30:    e001        ..      B        0x8000e36 ; test_stack_and_multi + 62
        0x08000e32:    f04f0a00    O...    MOV      r10,#0
        0x08000e36:    4698        .F      MOV      r8,r3
        0x08000e38:    1c5b        [.      ADDS     r3,r3,#1
        0x08000e3a:    ea4f0888    O...    LSL      r8,r8,#2
        0x08000e3e:    f1085800    ...X    ADD      r8,r8,#0x20000000
        0x08000e42:    f8c8a000    ....    STR      r10,[r8,#0]
        0x08000e46:    f8df90cc    ....    LDR      r9,[pc,#204] ; [0x8000f14] = 0x8001010
        0x08000e4a:    e9d9c801    ....    LDRD     r12,r8,[r9,#4]
        0x08000e4e:    f8d92000    ...     LDR      r2,[r9,#0]
        0x08000e52:    f8d9900c    ....    LDR      r9,[r9,#0xc]
        0x08000e56:    e9cdc805    ....    STRD     r12,r8,[sp,#0x14]
        0x08000e5a:    f8cd901c    ....    STR      r9,[sp,#0x1c]
        0x08000e5e:    9204        ..      STR      r2,[sp,#0x10]
        0x08000e60:    2200        ."      MOVS     r2,#0
        0x08000e62:    9200        ..      STR      r2,[sp,#0]
        0x08000e64:    9201        ..      STR      r2,[sp,#4]
        0x08000e66:    9202        ..      STR      r2,[sp,#8]
        0x08000e68:    9203        ..      STR      r2,[sp,#0xc]
        0x08000e6a:    2000        .       MOVS     r0,#0
        0x08000e6c:    e005        ..      B        0x8000e7a ; test_stack_and_multi + 130
        0x08000e6e:    aa04        ..      ADD      r2,sp,#0x10
        0x08000e70:    f8522020    R.      LDR      r2,[r2,r0,LSL #2]
        0x08000e74:    f84d2020    M.      STR      r2,[sp,r0,LSL #2]
        0x08000e78:    1c40        @.      ADDS     r0,r0,#1
        0x08000e7a:    2804        .(      CMP      r0,#4
        0x08000e7c:    dbf7        ..      BLT      0x8000e6e ; test_stack_and_multi + 118
        0x08000e7e:    2101        .!      MOVS     r1,#1
        0x08000e80:    2000        .       MOVS     r0,#0
        0x08000e82:    e009        ..      B        0x8000e98 ; test_stack_and_multi + 160
        0x08000e84:    f85d2020    ].      LDR      r2,[sp,r0,LSL #2]
        0x08000e88:    f10d0c10    ....    ADD      r12,sp,#0x10
        0x08000e8c:    f85cc020    \. .    LDR      r12,[r12,r0,LSL #2]
        0x08000e90:    4562        bE      CMP      r2,r12
        0x08000e92:    d000        ..      BEQ      0x8000e96 ; test_stack_and_multi + 158
        0x08000e94:    2100        .!      MOVS     r1,#0
        0x08000e96:    1c40        @.      ADDS     r0,r0,#1
        0x08000e98:    2804        .(      CMP      r0,#4
        0x08000e9a:    dbf3        ..      BLT      0x8000e84 ; test_stack_and_multi + 140
        0x08000e9c:    b111        ..      CBZ      r1,0x8000ea4 ; test_stack_and_multi + 172
        0x08000e9e:    f04f0801    O...    MOV      r8,#1
        0x08000ea2:    e001        ..      B        0x8000ea8 ; test_stack_and_multi + 176
        0x08000ea4:    f04f0800    O...    MOV      r8,#0
        0x08000ea8:    461a        .F      MOV      r2,r3
        0x08000eaa:    1c5b        [.      ADDS     r3,r3,#1
        0x08000eac:    0092        ..      LSLS     r2,r2,#2
        0x08000eae:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000eb2:    f8c28000    ....    STR      r8,[r2,#0]
        0x08000eb6:    4629        )F      MOV      r1,r5
        0x08000eb8:    4620         F      MOV      r0,r4
        0x08000eba:    f7fffa75    ..u.    BL       helper_add ; 0x80003a8
        0x08000ebe:    4680        .F      MOV      r8,r0
        0x08000ec0:    f1b83f33    ..3?    CMP      r8,#0x33333333
        0x08000ec4:    d101        ..      BNE      0x8000eca ; test_stack_and_multi + 210
        0x08000ec6:    2201        ."      MOVS     r2,#1
        0x08000ec8:    e000        ..      B        0x8000ecc ; test_stack_and_multi + 212
        0x08000eca:    2200        ."      MOVS     r2,#0
        0x08000ecc:    4619        .F      MOV      r1,r3
        0x08000ece:    1c5b        [.      ADDS     r3,r3,#1
        0x08000ed0:    0088        ..      LSLS     r0,r1,#2
        0x08000ed2:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x08000ed6:    6002        .`      STR      r2,[r0,#0]
        0x08000ed8:    2104        .!      MOVS     r1,#4
        0x08000eda:    2003        .       MOVS     r0,#3
        0x08000edc:    f7fffa64    ..d.    BL       helper_add ; 0x80003a8
        0x08000ee0:    4681        .F      MOV      r9,r0
        0x08000ee2:    2102        .!      MOVS     r1,#2
        0x08000ee4:    2001        .       MOVS     r0,#1
        0x08000ee6:    f7fffa5f    .._.    BL       helper_add ; 0x80003a8
        0x08000eea:    4682        .F      MOV      r10,r0
        0x08000eec:    4649        IF      MOV      r1,r9
        0x08000eee:    f7fffa5b    ..[.    BL       helper_add ; 0x80003a8
        0x08000ef2:    4680        .F      MOV      r8,r0
        0x08000ef4:    f1b80f0a    ....    CMP      r8,#0xa
        0x08000ef8:    d101        ..      BNE      0x8000efe ; test_stack_and_multi + 262
        0x08000efa:    2201        ."      MOVS     r2,#1
        0x08000efc:    e000        ..      B        0x8000f00 ; test_stack_and_multi + 264
        0x08000efe:    2200        ."      MOVS     r2,#0
        0x08000f00:    4618        .F      MOV      r0,r3
        0x08000f02:    1c5b        [.      ADDS     r3,r3,#1
        0x08000f04:    0080        ..      LSLS     r0,r0,#2
        0x08000f06:    f1005000    ...P    ADD      r0,r0,#0x20000000
        0x08000f0a:    6002        .`      STR      r2,[r0,#0]
        0x08000f0c:    b008        ..      ADD      sp,sp,#0x20
        0x08000f0e:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x08000f12:    0000        ..      DCW    0
        0x08000f14:    08001010    ....    DCD    134221840
    $t
    i.test_system_instructions
    test_system_instructions
        0x08000f18:    b538        8.      PUSH     {r3-r5,lr}
        0x08000f1a:    2000        .       MOVS     r0,#0
        0x08000f1c:    2100        .!      MOVS     r1,#0
        0x08000f1e:    9100        ..      STR      r1,[sp,#0]
        0x08000f20:    2105        .!      MOVS     r1,#5
        0x08000f22:    2205        ."      MOVS     r2,#5
        0x08000f24:    4291        .B      CMP      r1,r2
        0x08000f26:    d102        ..      BNE      0x8000f2e ; test_system_instructions + 22
        0x08000f28:    2301        .#      MOVS     r3,#1
        0x08000f2a:    9300        ..      STR      r3,[sp,#0]
        0x08000f2c:    e001        ..      B        0x8000f32 ; test_system_instructions + 26
        0x08000f2e:    2300        .#      MOVS     r3,#0
        0x08000f30:    9300        ..      STR      r3,[sp,#0]
        0x08000f32:    9b00        ..      LDR      r3,[sp,#0]
        0x08000f34:    2b01        .+      CMP      r3,#1
        0x08000f36:    d101        ..      BNE      0x8000f3c ; test_system_instructions + 36
        0x08000f38:    2501        .%      MOVS     r5,#1
        0x08000f3a:    e000        ..      B        0x8000f3e ; test_system_instructions + 38
        0x08000f3c:    2500        .%      MOVS     r5,#0
        0x08000f3e:    4603        .F      MOV      r3,r0
        0x08000f40:    1c40        @.      ADDS     r0,r0,#1
        0x08000f42:    009b        ..      LSLS     r3,r3,#2
        0x08000f44:    f1035300    ...S    ADD      r3,r3,#0x20000000
        0x08000f48:    601d        .`      STR      r5,[r3,#0]
        0x08000f4a:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08000f4e:    1c4a        J.      ADDS     r2,r1,#1
        0x08000f50:    b90a        ..      CBNZ     r2,0x8000f56 ; test_system_instructions + 62
        0x08000f52:    2501        .%      MOVS     r5,#1
        0x08000f54:    e000        ..      B        0x8000f58 ; test_system_instructions + 64
        0x08000f56:    2500        .%      MOVS     r5,#0
        0x08000f58:    4603        .F      MOV      r3,r0
        0x08000f5a:    1c40        @.      ADDS     r0,r0,#1
        0x08000f5c:    009b        ..      LSLS     r3,r3,#2
        0x08000f5e:    f1035300    ...S    ADD      r3,r3,#0x20000000
        0x08000f62:    601d        .`      STR      r5,[r3,#0]
        0x08000f64:    2100        .!      MOVS     r1,#0
        0x08000f66:    b909        ..      CBNZ     r1,0x8000f6c ; test_system_instructions + 84
        0x08000f68:    2401        .$      MOVS     r4,#1
        0x08000f6a:    e000        ..      B        0x8000f6e ; test_system_instructions + 86
        0x08000f6c:    2400        .$      MOVS     r4,#0
        0x08000f6e:    4602        .F      MOV      r2,r0
        0x08000f70:    1c40        @.      ADDS     r0,r0,#1
        0x08000f72:    0092        ..      LSLS     r2,r2,#2
        0x08000f74:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000f78:    6014        .`      STR      r4,[r2,#0]
        0x08000f7a:    2101        .!      MOVS     r1,#1
        0x08000f7c:    b109        ..      CBZ      r1,0x8000f82 ; test_system_instructions + 106
        0x08000f7e:    2401        .$      MOVS     r4,#1
        0x08000f80:    e000        ..      B        0x8000f84 ; test_system_instructions + 108
        0x08000f82:    2400        .$      MOVS     r4,#0
        0x08000f84:    4602        .F      MOV      r2,r0
        0x08000f86:    1c40        @.      ADDS     r0,r0,#1
        0x08000f88:    0092        ..      LSLS     r2,r2,#2
        0x08000f8a:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000f8e:    6014        .`      STR      r4,[r2,#0]
        0x08000f90:    4914        .I      LDR      r1,[pc,#80] ; [0x8000fe4] = 0x12345678
        0x08000f92:    460a        .F      MOV      r2,r1
        0x08000f94:    4291        .B      CMP      r1,r2
        0x08000f96:    d101        ..      BNE      0x8000f9c ; test_system_instructions + 132
        0x08000f98:    2401        .$      MOVS     r4,#1
        0x08000f9a:    e000        ..      B        0x8000f9e ; test_system_instructions + 134
        0x08000f9c:    2400        .$      MOVS     r4,#0
        0x08000f9e:    4602        .F      MOV      r2,r0
        0x08000fa0:    1c40        @.      ADDS     r0,r0,#1
        0x08000fa2:    0092        ..      LSLS     r2,r2,#2
        0x08000fa4:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000fa8:    6014        .`      STR      r4,[r2,#0]
        0x08000faa:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08000fae:    f0014270    ..pB    AND      r2,r1,#0xf0000000
        0x08000fb2:    1c52        R.      ADDS     r2,r2,#1
        0x08000fb4:    b10a        ..      CBZ      r2,0x8000fba ; test_system_instructions + 162
        0x08000fb6:    2401        .$      MOVS     r4,#1
        0x08000fb8:    e000        ..      B        0x8000fbc ; test_system_instructions + 164
        0x08000fba:    2400        .$      MOVS     r4,#0
        0x08000fbc:    4602        .F      MOV      r2,r0
        0x08000fbe:    1c40        @.      ADDS     r0,r0,#1
        0x08000fc0:    0092        ..      LSLS     r2,r2,#2
        0x08000fc2:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000fc6:    6014        .`      STR      r4,[r2,#0]
        0x08000fc8:    2100        .!      MOVS     r1,#0
        0x08000fca:    b909        ..      CBNZ     r1,0x8000fd0 ; test_system_instructions + 184
        0x08000fcc:    2401        .$      MOVS     r4,#1
        0x08000fce:    e000        ..      B        0x8000fd2 ; test_system_instructions + 186
        0x08000fd0:    2400        .$      MOVS     r4,#0
        0x08000fd2:    4602        .F      MOV      r2,r0
        0x08000fd4:    1c40        @.      ADDS     r0,r0,#1
        0x08000fd6:    0092        ..      LSLS     r2,r2,#2
        0x08000fd8:    f1025200    ...R    ADD      r2,r2,#0x20000000
        0x08000fdc:    6014        .`      STR      r4,[r2,#0]
        0x08000fde:    bf00        ..      NOP      
        0x08000fe0:    bd38        8.      POP      {r3-r5,pc}
    $d
        0x08000fe2:    0000        ..      DCW    0
        0x08000fe4:    12345678    xV4.    DCD    305419896
    $d.realdata
    .constdata
        0x08000fe8:    0000000a    ....    DCD    10
        0x08000fec:    00000014    ....    DCD    20
        0x08000ff0:    0000001e    ....    DCD    30
        0x08000ff4:    00000028    (...    DCD    40
        0x08000ff8:    00000032    2...    DCD    50
        0x08000ffc:    0000003c    <...    DCD    60
        0x08001000:    00000046    F...    DCD    70
        0x08001004:    00000050    P...    DCD    80
        0x08001008:    56781234    4.xV    DCD    1450709556
        0x0800100c:    def09abc    ....    DCD    3740310204
        0x08001010:    00000001    ....    DCD    1
        0x08001014:    00000002    ....    DCD    2
        0x08001018:    00000003    ....    DCD    3
        0x0800101c:    00000004    ....    DCD    4
        0x08001020:    00000001    ....    DCD    1
        0x08001024:    00000002    ....    DCD    2
        0x08001028:    00000003    ....    DCD    3
        0x0800102c:    00000004    ....    DCD    4
    Region$$Table$$Base
        0x08001030:    08001050    P...    DCD    134221904
        0x08001034:    20000000    ...     DCD    536870912
        0x08001038:    00000008    ....    DCD    8
        0x0800103c:    0800016c    l...    DCD    134218092
        0x08001040:    08001058    X...    DCD    134221912
        0x08001044:    20000008    ...     DCD    536870920
        0x08001048:    00000528    (...    DCD    1320
        0x0800104c:    08000188    ....    DCD    134218120
    Region$$Table$$Limit

** Section #2 'RW_IRAM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 8 bytes (alignment 4)
    Address: 0x20000000


** Section #3 'RW_IRAM1' (SHT_NOBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 1320 bytes (alignment 8)
    Address: 0x20000008


** Section #4 '.debug_abbrev' (SHT_PROGBITS)
    Size   : 1476 bytes


** Section #5 '.debug_frame' (SHT_PROGBITS)
    Size   : 1260 bytes


** Section #6 '.debug_info' (SHT_PROGBITS)
    Size   : 8184 bytes


** Section #7 '.debug_line' (SHT_PROGBITS)
    Size   : 3860 bytes


** Section #8 '.debug_loc' (SHT_PROGBITS)
    Size   : 2124 bytes


** Section #9 '.debug_macinfo' (SHT_PROGBITS)
    Size   : 3076 bytes


** Section #10 '.debug_pubnames' (SHT_PROGBITS)
    Size   : 735 bytes


** Section #11 '.symtab' (SHT_SYMTAB)
    Size   : 5232 bytes (alignment 4)
    String table #12 '.strtab'
    Last local symbol no. 162


** Section #12 '.strtab' (SHT_STRTAB)
    Size   : 5848 bytes


** Section #13 '.note' (SHT_NOTE)
    Size   : 28 bytes (alignment 4)


** Section #14 '.comment' (SHT_PROGBITS)
    Size   : 5572 bytes


** Section #15 '.shstrtab' (SHT_STRTAB)
    Size   : 156 bytes


