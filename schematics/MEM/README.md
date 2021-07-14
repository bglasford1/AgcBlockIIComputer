The Memory (MEM) sub-system consists of the Erasable/Fixed Memory, Memory Address, Memory Buffer, Parity, Interrupts, Counters and MEM Interface modules. The following schematic sheets are used.

MEM_MMI : The Memory Interface Module

MEM_EFM : The Erasable/Fixed Memory Module

MEM_ADR : The Memory Address Module

    MEM_ADR_S : Contains the S and Temp-S registers

    MEM_ADR_BNK : Contains the Bank registers

    MEM_ADR_MDE : Contains the manual data entry logic

    MEM_ADR_ATS : Contains the address decoding logic

    MEM_ADR_CTL : Contains various control logic signal generation

MEM_MBF : The Memory Buffer Module

    MEM_MBF_SFT : Contains the shift/rotate logic

    MEM_MBF_MBL : Contains the G register along with bus buffers
    
    MEM_MBF_GMB : Contains the G register output buffers and control logic
    
MEM_PAR : The Parity Module

MEM_INT : The Interrupt Module

MEM_CTR : The Counters Module

    MEM_CTR_CNT : Contains the counter logic
    
    MEM_CTR_CTL : Contains counter interrupt logic
