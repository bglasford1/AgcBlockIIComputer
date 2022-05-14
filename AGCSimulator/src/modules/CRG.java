/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements Central Registers module which includes
            the A, L, Q and Z registers.  This module also implements the
            read and write channel commands which can AND/OR/XOR the A
            register data with the channel data.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import enums.BusLineDesignation;
import enums.Subseq;
import gui.AGCControl;

public class CRG
{
  private final Register registerA = new Register(16); // Accumulator
  private final Register registerL = new Register(16); // Lower accumulator
  private final Register registerQ = new Register(16); // Return address
  private final Register registerZ = new Register(16); // Program counter

  // Defines how to load data.
  // BX = don't care, leave alone
  // D0 = zero bit
  // SG = sign bit (1's compliment)
  // SGM = sign bit in memory
  // B1 to B14 = value in bit position n
  private final BusLineDesignation conv_WALS_A[] =
    { BusLineDesignation.SG,
      BusLineDesignation.SG,
      BusLineDesignation.SG,
      BusLineDesignation.US,
      BusLineDesignation.B14,
      BusLineDesignation.B13,
      BusLineDesignation.B12,
      BusLineDesignation.B11,
      BusLineDesignation.B10,
      BusLineDesignation.B9,
      BusLineDesignation.B8,
      BusLineDesignation.B7,
      BusLineDesignation.B6,
      BusLineDesignation.B5,
      BusLineDesignation.B4,
      BusLineDesignation.B3
    };

  private final AGCControl parent;

  public CRG(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerA.clk();
    registerL.clk();
    registerZ.clk();
    registerQ.clk();
  }

  public int readRegisterA()
  {
    return registerA.read();
  }

  public int readRegisterL()
  {
    return registerL.read();
  }

  public int readRegisterZ()
  {
    return registerZ.read();
  }

  public int readRegisterQ()
  {
    return registerQ.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  void execWP_GENRST()
  {
    registerQ.write(0);
    registerZ.write(0);
    registerL.write(0);
    registerA.write(0);
  }

  // **** Q Register Control ****

  // Read the Q register.
  void execRP_RQ()
  {
    parent.getWriteBus().write(registerQ.read());
  }

  // Write the Q register onto the channel data bus.
  void execRP_WQC()
  {
    parent.getChannelDataBus().write(registerQ.read());
  }

  // Write to Q register.
  void execWP_WQ()
  {
    registerQ.write(parent.getWriteBus().read());
  }

  // Read the Q register from the channel data bus.
  void execWP_RQC()
  {
    registerQ.write(parent.getChannelDataBus().read());
  }

  // **** Z Register Control ****

  // Read the Z register.
  void execRP_RZ()
  {
    parent.getWriteBus().write(registerZ.read());
  }

  // Write to Z register.
  void execWP_WZ()
  {
    registerZ.write(parent.getWriteBus().read());
  }

  // Set bit 15 of Z register.
  void execWP_Z15()
  {
    registerL.write(0040000);
  }

  // Set bit 16 of Z register.
  void execWP_Z16()
  {
    registerL.write(0100000);
  }

  // **** L Register Control ****

  // Read the L register.
  void execRP_RL()
  {
    parent.getWriteBus().write(registerL.read());
  }

  // Write to L register.
  void execWP_WL()
  {
    registerL.write(parent.getWriteBus().read());
  }

  // Write the L register onto channel data bus.
  void execRP_WLC()
  {
    parent.getChannelDataBus().write(registerL.read());
  }

  // Read the L register from the channel data bus.
  void execWP_RLC()
  {
    registerL.write(parent.getChannelDataBus().read());
  }

  // Copy LG bus into L register directly using special LG bus.
  void execWP_G2LS()
  {
    registerL.write(parent.getLgBus().read());
  }

  // Copy L register into special LG bus.
  void execRP_L2GD()
  {
    parent.getLgBus().write(registerL.read());
  }

  // Set bit 16 of L register.
  void execWP_L16()
  {
    registerL.write(readRegisterL() | 0100000);
  }

  // **** A Register Control ****

  // Write to A and L registers: Clears register A and writes the content of write bus bits 16-3 into bits 14-1.
  // If bit 1 of G register is 0, the content of bit 16 of G register is entered into bits 16 and 15 of register A;
  // If bit 1 of G register is 1, the content of bit 16 of U register is entered into bits 16 and 15 of register A.
  // WALS also clears bits 14 and 13 of L register, and writes bits 2-1 of write bus into these bit positions.
  void execWP_WALS()
  {
    // Set bits 13 & 14 of L register.
    registerL.writeField(14, 13, parent.getWriteBus().read() & 03);

    // Set up A register.
    registerA.writeShift(parent.getWriteBus().read(), conv_WALS_A);

    // If G register bit 1 is 1 then use sign bits from U register.
    if ((parent.getMbf().readRegisterG() & 000001) == 1)
    {
      int signBit = parent.getAlu().readRegisterU() | 0100000;
      registerA.writeField(16, 16, signBit);
      registerA.writeField(15, 15, signBit);
    }
  }

  // Read the A register and put on special AX bus.
  void execRP_A2X()
  {
    parent.getAxBus().write(registerA.read());
  }

  // Read A register.
  void execRP_RA()
  {
    parent.getWriteBus().write(registerA.read());
  }

  // Write to A register.
  void execWP_WA()
  {
    registerA.write(parent.getWriteBus().read());
  }

  // Read channel Bus or AND/OR/XOR register A contents with what is already in the channel bus based on Channel
  // command being executed.  Channels 1 & 2 same as RL and RQ.
  // Note: this command must follow the various RCx pulses that place data on the channel data bus.
  void execWP_RCH()
  {
    // The channel number is only in the first 9 bits.
    int address = parent.getAdr().getAddress() & 0777;

    if (isChannelImplemented(address))
    {
      Subseq subseq = parent.getSeq().readSubseq();

      // Read the data placed on the channel data bus.
      int data = parent.getChannelDataBus().read();

      if (subseq == Subseq.READ0 || subseq == Subseq.WRITE0 || subseq == Subseq.WAND0 || subseq == Subseq.WOR0)
      {
        parent.getWriteBus().write(data);
      }
      else if (subseq == Subseq.RAND0)
      {
        parent.getWriteBus().write(data & registerA.read());
      }
      else if (subseq == Subseq.ROR0)
      {
        parent.getWriteBus().write(data | registerA.read());
      }
      else if (subseq == Subseq.RXOR0)
      {
        parent.getWriteBus().write(data ^ registerA.read());
      }
    }
    else
    {
      parent.getWriteBus().write(0);
      System.out.println("Channel " + Integer.toOctalString(address) + " not implemented..........");
    }
  }

  // Write channel H or AND/OR register A content with what is already in channel H based on Channel command being
  // executed.  Channels 1 & 2 same as WL and WQ.
  // Note: This command must occur before various WCx commands execute.
  void execRP_WCH()
  {
    // The channel number is only in the first 9 bits.
    int address = parent.getAdr().getAddress() & 0777;

    if (isChannelImplemented(address))
    {
      Subseq subseq = parent.getSeq().readSubseq();

      // Get data.
      int data = parent.getWriteBus().read();

      if (subseq == Subseq.WRITE0)
      {
        parent.getChannelDataBus().write(data);
      }
      else if (subseq == Subseq.WAND0)
      {
        parent.getChannelDataBus().write(registerA.read() & data);
      }
      else if (subseq == Subseq.WOR0)
      {
        parent.getChannelDataBus().write(registerA.read() | data);
      }
    }
    else
    {
      System.out.println("Channel " + Integer.toOctalString(address) + " not implemented..........");
    }
  }

  private boolean isChannelImplemented(int address)
  {
    if (address == 1)
      return true;
    else if (address == 2)
      return true;
    else if (address == 3)
      return false;
    else if (address == 4)
      return false;
    else if (address == 7)
      return true;
    else if (address == 010)
      return true;
    else if (address == 011)
      return true;
    else if (address == 012)
      return true;
    else if (address == 013)
      return true;
    else if (address == 014)
      return true;
    else if (address == 015)
      return true;
    else if (address == 016)
      return false;
    else if (address == 030)
      return true;
    else if (address == 032)
      return true;
    else if (address == 033)
      return true;
    else if (address == 077)
      return true;
    else
      return false;
  }
}
