/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Control Pulse Matrix module.  This includes
            reading control pulses by address from the CPM EPROMs and then
            asserting them along with control pulses from the memory cycle.  The
            EPROM contents are read from the actual S-Record files.  The Sub-sequence
            Decoder EPROM and sub-sequence decoding occurs here, however in the H/W
            implementation this code is in the SEQ module.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import enums.CpType;
import enums.Subseq;
import enums.TpType;
import gui.AGCControl;

public class CPM
{
  private static final int EPROM_SIZE = 0x10000; // # of cells in a 16-bit address range
  private static final int SUBSEQ_EPROM_SIZE = 0x800; // # of cells in a 10-bit address range

  private Register registerCLREXT = new Register(1); // Flip-flop that remembers if extend bit should be cleared.

  public enum eprom
  {
    None,
    EPROM1_8,
    EPROM9_16,
    EPROM17_24,
    EPROM25_32,
    EPROM33_40,
    EPROM41_48,
    EPROM49_56,
    EPROM57_64,
    EPROM65_72
  }

  private int[] subseqEprom = new int[SUBSEQ_EPROM_SIZE];

  private int[] EPROM1_8 = new int[EPROM_SIZE];
  private int[] EPROM9_16 = new int[EPROM_SIZE];
  private int[] EPROM17_24 = new int[EPROM_SIZE];
  private int[] EPROM25_32 = new int[EPROM_SIZE];
  private int[] EPROM33_40 = new int[EPROM_SIZE];
  private int[] EPROM41_48 = new int[EPROM_SIZE];
  private int[] EPROM49_56 = new int[EPROM_SIZE];
  private int[] EPROM57_64 = new int[EPROM_SIZE];
  private int[] EPROM65_72 = new int[EPROM_SIZE];

  // This is debug code not implemented in the H/W.
  private static boolean waitPrinted = false;
  private static boolean srlsePrinted = false;

  private AGCControl parent;

  public CPM(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
  }

  // This is debug code not implemented in the H/W.
  private void printDebugTp()
  {
    TpType tpState = TpType.values()[parent.getTpg().readRegisterSG()];
    if (tpState == TpType.SRLSE)
    {
      if (!srlsePrinted)
      {
        System.out.println("TP: " + tpState);
        srlsePrinted = true;
      }
    }
    else if (tpState == TpType.WAIT)
    {
      if (!waitPrinted)
      {
        System.out.println("TP: " + tpState);
        waitPrinted = true;
      }
    }
    else
    {
      System.out.printf("TP: %5s, Pulses: ", tpState);
      waitPrinted = false;
      srlsePrinted = false;
    }
  }

  // This is debug code not implemented in the H/W.
  private void printDebugNewline()
  {
    TpType tpState = TpType.values()[parent.getTpg().readRegisterSG()];
    if (tpState == TpType.SRLSE)
    {
      if (!srlsePrinted)
      {
        System.out.println();
        srlsePrinted = true;
      }
    }
    else if (tpState == TpType.WAIT)
    {
      if (!waitPrinted)
      {
        System.out.println();
        waitPrinted = true;
      }
    }
    else
    {
      System.out.println();
      waitPrinted = false;
      srlsePrinted = false;
    }
  }

  public void loadSubseqEprom(int index, int data)
  {
    subseqEprom[index] = data;
  }

  public void loadEprom1_8(int address, int data)
  {
    EPROM1_8[address] = ((~data) & 0xff);
  }

  public void loadEprom9_16(int address, int data)
  {
    EPROM9_16[address] = ((~data) & 0xff);
  }

  public void loadEprom17_24(int address, int data)
  {
    EPROM17_24[address] = ((~data) & 0xff);
  }

  public void loadEprom25_32(int address, int data)
  {
    EPROM25_32[address] = ((~data) & 0xff);
  }

  public void loadEprom33_40(int address, int data)
  {
    EPROM33_40[address] = ((~data) & 0xff);
  }

  public void loadEprom41_48(int address, int data)
  {
    EPROM41_48[address] = ((~data) & 0xff);
  }

  public void loadEprom49_56(int address, int data)
  {
    EPROM49_56[address] = ((~data) & 0xff);
  }

  public void loadEprom57_64(int address, int data)
  {
    EPROM57_64[address] = ((~data) & 0xff);
  }

  public void loadEprom65_72(int address, int data)
  {
    EPROM65_72[address] = ((~data) & 0xff);
  }

  /**
   * Generate the EPROM address which is based on the Branch registers, the timing pulse, the stage and the
   * order code.  Parts of the order code are zeroed out based on the instruction type.
   *
   * @return The address, used to index into the EPROMs.
   */
  private int generateAddress()
  {
    int sq = parent.getSeq().readRegisterSQ() | (parent.getSeq().readRegisterEXT() << 6); // Add extend bit
    int orderCode = (sq >> 3) & 0x0F; // Opcode plus extend bit
    int quarterCode = (sq >> 1) & 0x03;

    int address = 0;
    address = address | ((parent.getSeq().readRegisterStage() << 6) | (parent.getTpg().readRegisterSG() << 2) |
                         (parent.getSeq().readRegisterBR1() << 1) | parent.getSeq().readRegisterBR2());

    // The PINC instruction is a special code.  Don't run PINC if the next instruction is INDEX, EXTEND and
    // don't split an instruction.
    if (parent.getSeq().readSubseq() == Subseq.PINC)
    {
      address = address | 0177000;
    }
    // The channel instructions use the entire SQ value.
    else if (orderCode == 010)
    {
      address = address | (sq << 9);
    }
    // These are the opcodes that do not use quarter codes.
    else if (orderCode == 0 || orderCode == 3 || orderCode == 4 || orderCode == 6 || orderCode == 7 ||
             orderCode == 013 || orderCode == 014 || orderCode == 015 || orderCode == 017)
    {
      address = address | (orderCode << 12);
    }
    // The remainder of the opcodes use the order code and quarter code.
    else
    {
      address = address | (quarterCode << 10) | (orderCode << 12);
    }
    return address;
  }

  /**
   * This method decodes the sub-sequence based on the variable length sq and the stage.
   * First look at the opcode plus EXT bit.  These are the simple instructions that either use the
   * three bit opcode and the extend bit.  Then look at an order code of 010 which is the seven
   * channel instructions.  What remains is the quarter codes.  Once the subsequence is decoded,
   * the stage register must be looked at.
   *
   * From a hardware implementation standpoint, this is implemented as an EPROM.  The "address" is a 10-bit quantity;
   * consisting of EOOOQQCSSS where E = the EXTEND bit, OOO = the 3 bit opcode, QQ = the 2 bit quarter code,
   * C = the channel bit and SSS = the 3 bit stage.  The output data from the EPROM is the ordinal of the Subseq
   * type.  There is currently 54 subsequences that take 6 bits to represent.
   */
  void execWP_DCDSUB()
  {
    int sq = parent.getSeq().readRegisterSQ() | (parent.getSeq().readRegisterEXT() << 6); // Add extend bit
    int stage = parent.getSeq().readRegisterStage();

    int orderCode = (sq >> 3) & 0x0F; // Opcode plus extend bit
    int quarterCode = (sq >> 1) & 0x03;
    int channelCode = sq & 0x07;

    int subseqIndex = orderCode;

    if (stage == 2)
    {
      // For stage 2 : STD2, zero out everything but the stage number.
      subseqIndex = 0;
    }
    else if (orderCode == 010)
    {
      subseqIndex = (subseqIndex << 3) | channelCode;
    }
    else if (orderCode == 1 || orderCode == 2 || orderCode == 5 ||
             orderCode == 011 || orderCode == 012 || orderCode == 016)
    {
      subseqIndex = (subseqIndex << 3) | (quarterCode << 1);  // last bit is zero
    }
    else // the quarter code and last bits are zeroed.
    {
      subseqIndex = subseqIndex << 3;
    }

    subseqIndex = (subseqIndex << 3) | stage;

    int subseqNum = subseqEprom[subseqIndex];
    parent.getSeq().setSubseq(Subseq.getSubseq(subseqNum));
  }

  private void clearControlPulses()
  {
  for (int i = 0; i < SEQ.MAXPULSES; i++)
    {
      parent.getSeq().setControlPulse(i, CpType.NO_PULSE);
    }
  }

  /**
   * Method to assert a pulse.
   *
   * @param pulse The pulse to assert.
   */
  private void assertPulse(CpType pulse)
  {
    for (int i = 0; i < SEQ.MAXPULSES; i++)
    {
      if (parent.getSeq().getControlPulse(i) == CpType.NO_PULSE)
      {
        parent.getSeq().setControlPulse(i, pulse);
        if (parent.getMon().displayDetails)
        {
          System.out.print(pulse + ", ");
        }
        break;
      }
    }
  }

  // Check the given EPROM for control pulses that are set.
  private void checkEPROM(int inval, int lowbit)
  {
    // Loop through the 8 bits of the inval byte
    for (int i = 0; i < 8; i++)
    {
      // Mask the inval to get the first byte.
      int newInval = inval & 0xff;
      // Shift the masked value right the next # of bits.
      newInval >>= i;
      // Now mask all but the first bit.
      newInval &= 0x01;

      if (newInval != 0)
      {
        assertPulse(CpType.values()[lowbit]);
      }
      lowbit++;
    }
  }

  // Perform the CPM-A EPROM function using the EPROM files
  private void getControlPulses(int address)
  {
    checkEPROM(EPROM1_8[address], 1);
    checkEPROM(EPROM9_16[address], 9);
    checkEPROM(EPROM17_24[address], 17);
    checkEPROM(EPROM25_32[address], 25);
    checkEPROM(EPROM33_40[address], 33);
    checkEPROM(EPROM41_48[address], 41);
    checkEPROM(EPROM49_56[address], 49);
    checkEPROM(EPROM57_64[address], 57);
    checkEPROM(EPROM65_72[address], 65);
  }

  // Perform CPM-A processing.
  private void processCPM_A()
  {
    // Use the EPROM tables to get the CPM-A control pulses documented in R-700.
    int address = generateAddress();
    getControlPulses(address);

    // ZIP and ZAP are pseudo control pulses that break out into many other control pulses.
    // These are used by the multiply instruction.
    if (parent.getSeq().isAsserted (CpType.ZAP))
    {
      assertPulse(CpType.RU);
      assertPulse(CpType.G2LS);
      assertPulse(CpType.WALS);
    }

    if (parent.getSeq().isAsserted (CpType.ZIP))
    {
      assertPulse(CpType.A2X);
      assertPulse(CpType.L2GD);

      // Get the L register bits 15, 2, 1.
      int tempValue = (parent.getCrg().readRegisterL() & 040000) >> 12 | parent.getCrg().readRegisterL() & 03;

      switch (tempValue)
      {
        case 0:
          assertPulse(CpType.WY);
          break;
        case 1:
        case 4:
          assertPulse(CpType.RB);
          assertPulse(CpType.WY);
          break;
        case 2:
        case 5:
          assertPulse(CpType.RB);
          assertPulse(CpType.WYD);
          break;
        case 3:
        case 6:
          assertPulse(CpType.RC);
          assertPulse(CpType.WY);
          assertPulse(CpType.CI);
          assertPulse(CpType.MCRO);
          break;
        case 7:
          assertPulse(CpType.WY);
          assertPulse(CpType.MCRO);
          break;
      }
    }
  }

  /**
   * Combination logic decodes time pulse, subsequence, branch register, and
   * "select next instruction" latch to assert control pulses associated with those states.
   */
  public void doControlPulseMatrix()
  {
    // Clear out any old control pulses.
    clearControlPulses();

    //*************************************************************************************
    // SUBSYSTEM A : Use the address to get the CPM-A control pulses based on the address.
    //*************************************************************************************

    // Debug code, not implemented in H/W.
    TpType tpState = TpType.values()[parent.getTpg().readRegisterSG()];
    if (tpState == TpType.TP1)
    {
      if (parent.getMon().displayDetails)
      {
        System.out.println();
      }
      String CADR = parent.getAdr().convertAddress(parent.getCrg().readRegisterZ() - 1,
                                                   parent.getAdr().readRegisterFB(),
                                                   parent.getAdr().readRegisterEB());

      System.out.printf("Subseq:%6s Address: %s Instruction: %5s", parent.getSeq().readSubseq().toString(),
                        CADR, Integer.toOctalString(parent.getAlu().readRegisterB()));
      System.out.println();
    }
    if (parent.getMon().displayDetails)
    {
      printDebugTp();
    }

    processCPM_A();

    // TSGU only occurs in the divide instruction.  The issue is that this control pulse occurs concurrently with
    // pulses that depend on it and those control pulses have already occurred.  What this pulse does is control
    // whether the CLXC or RB1F control pulse is asserted.  These two pulses only occur in conjunction with TSGU,
    // therefore the CLXC and RB1F pulses have been removed from the Control Pulse Matrix and asserted here.
    if (parent.getSeq().isAsserted(CpType.TSGU))
    {
      if (parent.getSeq().execTSGU())
      {
        assertPulse(CpType.RB1F);
      }
      else
      {
        assertPulse(CpType.CLXC);
      }
    }

    //*******************************************************************************
    // SUBSYSTEM B : Converts RAD, RCH, WCH, WG, RSC and WSC to individual control pulses.
    //               Note: WG, RSC, WSC are generated by SUBSYSTEM A. Those 3 signals
    //               are only used by SUBSYSTEM B and nowhere else.
    //*******************************************************************************

    // Read address of next instruction. RAD appears only in TP8 and is normally interpreted as RG.
    // If the next instruction is INHINT (0004), RELINT (0003), or EXTEND (0006), RAD is interpreted
    // as RZ and ST2 instead.
    if (parent.getSeq().isAsserted(CpType.RAD))
    {
      if (parent.getMbf().EQU_4() || parent.getMbf().EQU_3() || parent.getMbf().EQU_6())
      {
        assertPulse(CpType.RZ);
        assertPulse(CpType.ST2);

        if (parent.getMbf().EQU_6())
        {
          assertPulse(CpType.EXTEND);  // TC (INDEX 04)
          registerCLREXT.writeField(1, 1, 0); // Handles the case of back to back EXTENDs.
        }
        if (parent.getMbf().EQU_4())
        {
          assertPulse(CpType.INHINT);  // TC (INDEX 04)
        }
        if (parent.getMbf().EQU_3())
        {
          assertPulse(CpType.RELINT); // TC (INDEX 03)
        }
      }
      else
        assertPulse(CpType.RG);
    }

    // Data must first be written onto channel data bus before the RCH is processed.
    int channelAddress = parent.getAdr().readRegisterS() & 0777;
    if (parent.getSeq().isAsserted(CpType.RCH))
    {
      if (channelAddress == 1)
      {
        assertPulse(CpType.RC1);
      }
      else if (channelAddress == 2)
      {
        assertPulse(CpType.RC2);
      }
      else if (channelAddress == 7)
      {
        assertPulse(CpType.RC7);
      }
      else if (channelAddress == 015)
      {
        assertPulse((CpType.RC15));
      }
      else if (channelAddress == 030)
      {
        assertPulse(CpType.RC30);
      }
      else if (channelAddress == 031)
      {
        assertPulse(CpType.RC31);
      }
      else if (channelAddress == 032)
      {
        assertPulse(CpType.RC32);
      }
      else if (channelAddress == 033)
      {
        assertPulse(CpType.RC33);
      }
    }

    // Data must first be written onto channel data bus using WCH before the other writes are asserted.
    channelAddress = parent.getAdr().readRegisterS() & 0777;
    if (parent.getSeq().isAsserted(CpType.WCH))
    {
      if (channelAddress == 1)
      {
        assertPulse(CpType.WC1);
      }
      else if (channelAddress == 2)
      {
        assertPulse(CpType.WC2);
      }
      else if (channelAddress == 5)
      {
        assertPulse(CpType.WC5);
      }
      else if (channelAddress == 6)
      {
        assertPulse(CpType.WC6);
      }
      else if (channelAddress == 7)
      {
        assertPulse(CpType.WC7);
      }
      else if (channelAddress == 010)
      {
        assertPulse(CpType.WC10);
      }
      else if (channelAddress == 011)
      {
        assertPulse(CpType.WC11);
      }
      else if (channelAddress == 012)
      {
        assertPulse(CpType.WC12);
      }
      else if (channelAddress == 013)
      {
        assertPulse(CpType.WC13);
      }
      else if (channelAddress == 014)
      {
        assertPulse(CpType.WC14);
      }
      else if (channelAddress == 077)
      {
        assertPulse(CpType.WC77);
      }
    }

    // These are the writes to the shift registers.
    if (parent.getSeq().isAsserted(CpType.WG))
    {
      switch (parent.getAdr().readRegisterS())
      {
        case 020:
          assertPulse(CpType.W20); // CYR Write
          break;
        case 021:
          assertPulse(CpType.W21); // SR Write
          break;
        case 022:
          assertPulse(CpType.W22); // CYL Write
          break;
        case 023:
          assertPulse(CpType.W23); // EDOP Write
          break;
      }
    }

    // These are the read channel control pulses.
    if (parent.getSeq().isAsserted(CpType.RSC))
    {
      switch (parent.getAdr().readRegisterS())
      {
        case 00:
          assertPulse(CpType.RA0); // A reg.
          break;
        case 01:
          assertPulse(CpType.RA1); // L reg.
          break;
        case 02:
          assertPulse(CpType.RA2); // Q reg.
          break;
        case 03:
          assertPulse(CpType.RA3); // EB reg.
          break;
        case 04:
          assertPulse(CpType.RA4); // FB reg.
          break;
        case 05:
          assertPulse(CpType.RA5); // Z reg.
          break;
        case 06:
          assertPulse(CpType.RA6); // BB reg.
          break;
        default:
          break;
      }
    }

    // These are the write channel control pulses.
    if (parent.getSeq().isAsserted (CpType.WSC))
    {
      switch (parent.getAdr().readRegisterS())
      {
        case 00:
          assertPulse(CpType.WA0); // A reg
          break;
        case 01:
          assertPulse(CpType.WA1); // L reg
          break;
        case 02:
          assertPulse(CpType.WA2); // Q reg
          break;
        case 03:
          assertPulse(CpType.WA3); // EB reg
          break;
        case 04:
          assertPulse(CpType.WA4); // FB reg
          break;
        case 05:
          assertPulse(CpType.WA5); // Z reg
          break;
        case 06:
          assertPulse(CpType.WA6); // BB reg
          break;
        default:
          break;
      }
    }

    //*******************************************************************************
    // SUBSYSTEM C : Generates the Memory Cycle control pulses.
    //*******************************************************************************

    TpType sqValue = TpType.values()[parent.getTpg().readRegisterSG()];
    switch (sqValue)
    {
      case STBY:
        assertPulse(CpType.GENRST);  // Reset the system.
        break;

      case PWRON:
        assertPulse(CpType.NISQ); // Set up to read next instruction.
        assertPulse(CpType.RSTRT);
        assertPulse((CpType.WZ));  // Place 04000 into program counter.
        break;

      case TP1:
        // The EXTEND bit needs to be set for one instruction after the EXTEND except if the next instruction is INDEX.
        // In this case the EXTEND persists.  Previous instruction sees the EXTEND instruction and sets the bit.
        // First go around if the extend bit is set and this is not the EXTEND instruction,  i.e. stage is not 2,
        // then set the CLREXT bit.  The next instruction, the CLREXT bit is set so clear the extend bit and
        // clear the CLREXT bit.
        if (parent.getSeq().readRegisterEXT() == 1 &&
            parent.getSeq().readRegisterStage() != 2 &&
            parent.getSeq().readSubseq() != Subseq.NDX0 && parent.getSeq().readSubseq() != Subseq.NDX1 &&
            parent.getSeq().readSubseq() != Subseq.NDXX0 && parent.getSeq().readSubseq() != Subseq.NDXX1 &&
            parent.getSeq().readSubseq() != Subseq.DCA0 && parent.getSeq().readSubseq() != Subseq.DCS0 &&
            parent.getSeq().readSubseq() != Subseq.DV0 && parent.getSeq().readSubseq() != Subseq.DV1 &&
            parent.getSeq().readSubseq() != Subseq.DV3 && parent.getSeq().readSubseq() != Subseq.DV7 &&
            parent.getSeq().readSubseq() != Subseq.MP0 &&
            parent.getSeq().readSubseq() != Subseq.MP1 && parent.getSeq().readSubseq() != Subseq.RUPT0)
        {
          registerCLREXT.writeField(1, 1, 1);
        }

        // WS only occurs in TP1 or TP8.  If it occurs in TP1, then move value from tempS to S.
        if (parent.getSeq().isAsserted(CpType.WS))
        {
          assertPulse(CpType.WTS);
        }
        break;

      case TP3:
        if (parent.getSeq().isAsserted(CpType.STAGE))
        {
          assertPulse(CpType.DCDSUB); // Decode the sub-sequence.
        }
        break;

      case TP4:
        // Data must be available in G register by TP6
        // Read memory if in RAM; i.e. not greater than 01777 or less than 07
        // Don't read if this is a divide instruction
        if (parent.getAdr().GTR_7() && !parent.getAdr().GTR_1777() &&
            parent.getSeq().readSubseq() != Subseq.DV3 && parent.getSeq().readSubseq() != Subseq.DV7 &&
            parent.getSeq().readSubseq() != Subseq.DV6 && parent.getSeq().readSubseq() != Subseq.DV4)
        {
          assertPulse(CpType.SBWG);
        }
        break;

      case TP6:
        // Data must be available in G register by TP7.  Don't read if this is a divide instruction.
        if (parent.getAdr().GTR_1777() &&
            parent.getSeq().readSubseq() != Subseq.DV3 && parent.getSeq().readSubseq() != Subseq.DV7 &&
            parent.getSeq().readSubseq() != Subseq.DV6 && parent.getSeq().readSubseq() != Subseq.DV4)
        {
          assertPulse(CpType.SBWG);
        }
        break;

      case TP7:
        // If WG is asserted, register G is written to memory.
        // This is used in instructions XCH, INCR, TS, LXCH, QXCH, DXCH, AUG, DIM & PINC
        if (parent.getSeq().isAsserted(CpType.WG) &&
            parent.getAdr().GTR_7() && !parent.getAdr().GTR_1777() &&
            parent.getSeq().readSubseq() != Subseq.TCF0 &&
            !parent.getSeq().isAsserted(CpType.WE)) // Not already asserted.
        {
          assertPulse(CpType.WE);
        }

        // For ADS, TS & DAS, need to write to memory before TP8 because that cycle changes the S register.
        if (parent.getSeq().readSubseq() == Subseq.ADS0 ||
            parent.getSeq().readSubseq() == Subseq.TS0 ||
            parent.getSeq().readSubseq() == Subseq.DAS1)
        {
          assertPulse(CpType.WE);
        }
        break;

      case TP10:
        // G register data is written to memory at TP10.  Memory updates are in G by TP10 for all normal and
        // extracode instructions, but the PINC sub-sequence writes to G in TP10 because it needs to update
        // the parity bit.  This command does not run for the sub-sequences: STD2, TC0, TCF0, BZF0, NDX1, NDXX1,
        // MP1, MP3, DXCH0/1, RSM3, all DVs and all channel commands.
        if (parent.getAdr().GTR_7() && // not a central register
            !parent.getAdr().GTR_1777() && // not fixed memory
            parent.getSeq().readSubseq() != Subseq.TCF0 && parent.getSeq().readSubseq() != Subseq.TC0 &&
            parent.getSeq().readRegisterStage() != 2 && parent.getSeq().readSubseq() != Subseq.BZF0 &&
            parent.getSeq().readSubseq() != Subseq.NDX1 && parent.getSeq().readSubseq() != Subseq.MP1 &&
            parent.getSeq().readSubseq() != Subseq.MP3 && parent.getSeq().readSubseq() != Subseq.RSM3 &&
            parent.getSeq().readSubseq() != Subseq.DV0 && parent.getSeq().readSubseq() != Subseq.DV1 &&
            parent.getSeq().readSubseq() != Subseq.DV3 && parent.getSeq().readSubseq() != Subseq.DV4 &&
            parent.getSeq().readSubseq() != Subseq.DV6 && parent.getSeq().readSubseq() != Subseq.DV7 &&
            parent.getSeq().readSubseq() != Subseq.READ0 && parent.getSeq().readSubseq() != Subseq.WRITE0 &&
            parent.getSeq().readSubseq() != Subseq.RAND0 && parent.getSeq().readSubseq() != Subseq.WAND0 &&
            parent.getSeq().readSubseq() != Subseq.ROR0 && parent.getSeq().readSubseq() != Subseq.WOR0 &&
            parent.getSeq().readSubseq() != Subseq.RXOR0 && parent.getSeq().readSubseq() != Subseq.DXCH0 &&
            parent.getSeq().readSubseq() != Subseq.DXCH1 && parent.getSeq().readSubseq() != Subseq.NDXX1)
        {
          assertPulse(CpType.WE);
        }
        break;

      case TP11:
        // WS only occurs in TP1 and TP8.  If in TP1, the value is moved from TempS to S.  If in TP8, the value is
        // not moved to S until now.
        assertPulse(CpType.WTS);

        // Clear the interrupt register at the end of the resume sub-sequence.
        if (parent.getSeq().readSubseq() == Subseq.RSM3)
          assertPulse(CpType.CLRP);

        // Check the priority counters; service any waiting inputs on the next memory cycle.
        assertPulse(CpType.WPCTR);

        break;

      case TP12:
        // if SNI is set, get next instruction
        if (parent.getSeq().readRegisterSNI() == 1)
        {
          // An interrupt can only occur between instructions and not sub-sequences within an instruction.
          // This means the stage register for the next instruction must be 0.
          if (parent.getInr().IRQ())
          {
            // Interrupt request:
            assertPulse(CpType.INTR);   // Setup to run RUPT0 sub-sequence
            assertPulse(CpType.RPT);    // latch interrupt vector
            assertPulse(CpType.INHINT); // Inhibit interrupts
          }
          else
          {
            // Normal instruction:
            assertPulse(CpType.RB);     // Read B register, contains next instruction
            assertPulse(CpType.WSQ);    // Write Bus -> SQ Reg
          }
          // Remove inhibition of interrupts (if they were) AFTER the next
          assertPulse(CpType.CLISQ); // Clear SNI bit.
        }

        // If this is a divide instruction:
        if (parent.getSeq().readSubseq() != Subseq.DV0 && parent.getSeq().readSubseq() != Subseq.DV1 &&
            parent.getSeq().readSubseq() != Subseq.DV3 && parent.getSeq().readSubseq() != Subseq.DV7 &&
            parent.getSeq().readSubseq() != Subseq.DV6)
        {
          assertPulse(CpType.RSTSTG); // Move the pre-stage register to the stage register, zero Branch regs.
          assertPulse(CpType.DCDSUB); // Decode the sub-sequence.
        }

        // A counter increment can only occur between instructions and not sub-sequences within an instruction.
        // This means the stage register for the next instruction must be 0.
        if (parent.getCtr().runPINC() &&
            parent.getSeq().readRegisterPreStage() == 0 &&
            parent.getSeq().readRegisterEXT() == 0)
        {
          assertPulse(CpType.PINC);  // Set sub-sequence to PINC.  Nothing else changes.
        }

        // If the extend bit is to be cleared then clear it.
        if (registerCLREXT.read() == 1)
        {
          parent.getSeq().execWP_CLEXT();
          registerCLREXT.writeField(1, 1, 0);
        }
        break;

      default:
        break;
    }
    if (parent.getMon().displayDetails)
    {
      printDebugNewline();
    }
  }
}
