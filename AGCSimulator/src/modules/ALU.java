/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the arithmetic logic unit module that performs
            a number of functions required by the AGC.  Registers X and Y are
            input to an adder that generates the data in register U.  The 1's
            compliment is referred to as register C although no register exists.
            The carry bit for the adder is rather complicated, especially due to
            the multiply command which uses 2's compliment versus 1's compliment
            math.  Adding to the complication is the ability for the control
            pulses to set a no end around carry state.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import enums.BusLineDesignation;
import enums.CpType;
import enums.Subseq;
import gui.AGCControl;

public class ALU
{
  private final Register registerB  = new Register(16); // B register (next instruction)
  private final Register registerCI = new Register(1);  // Carry-in flip flop
  private final Register registerX  = new Register(16); // X register
  private final Register registerY  = new Register(16); // Y register
  private final Register registerU  = new Register(16);   // ALU sum
  private final Register registerNEAC = new Register(1); // No end around carry flip flop

  // Defines how to load buses with data.
  // BX = don't care, leave alone
  // D0 = zero bit
  // SG = sign bit (1's compliment)
  // SGM = sign bit in memory
  // B1 to B14 = value in bit position x
  private final BusLineDesignation conv_U[] =
    { BusLineDesignation.SGM,
      BusLineDesignation.SGM,
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
      BusLineDesignation.B3,
      BusLineDesignation.B2,
      BusLineDesignation.B1
    };

  private final BusLineDesignation conv_WYD[] =
    { BusLineDesignation.SG,
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
      BusLineDesignation.B3,
      BusLineDesignation.B2,
      BusLineDesignation.B1,
      BusLineDesignation.D0
    };

  private final AGCControl parent;

  public ALU(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
  }

  public int readRegisterB()
  {
    return registerB.read();
  }

  public int readRegisterCI()
  {
    return registerCI.read();
  }

  public int readRegisterX()
  {
    return registerX.read();
  }

  public int readRegisterY()
  {
    return registerY.read();
  }

  public int readRegisterU()
  {
    return registerU.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  void execWP_GENRST()
  {
  }

  // If both RA and RC are asserted then perform an OR of the two registers for the MASK and RXOR instructions.
  // Else return the C register (~B register).
  void execRP_RC()
  {
    if (parent.getSeq().isAsserted(CpType.RA) && parent.getSeq().isAsserted(CpType.RC))
    {
      // The A register value should already be on the bus.
      int aluBus = parent.getWriteBus().read();

      aluBus |= registerB.readMask() & (~registerB.read());
      parent.getWriteBus().write(aluBus);
    }
    else
    {
      parent.getWriteBus().write(registerB.readMask() & (~registerB.read()));
    }
  }

  // Read B register.
  void execRP_RB()
  {
    parent.getWriteBus().write(registerB.read());
  }

  // Write to B register.
  void execWP_WB()
  {
    registerB.write(parent.getWriteBus().read());
  }

  // Read first 10 bits of B register. Replace c(S) by a 10 bit address.
  void execRP_RL10BB()
  {
    parent.getWriteBus().write(registerB.read() & 01777);
  }

  // If both RU and RC are asserted then perform an OR of the two registers for the RAND & WAND instructions.
  // If both RU and RB are asserted then perform an OR of the two registers for the ROR instruction.
  // Else return the U register.
  void execRP_RU()
  {
    if (parent.getSeq().isAsserted(CpType.RU) && parent.getSeq().isAsserted(CpType.RC))
    {
      // RC should have already occurred.
      int aluBus = ~registerB.read();
      aluBus |= readRegisterU();
      parent.getWriteBus().write(aluBus);
    }
    else if (parent.getSeq().isAsserted(CpType.RU) && parent.getSeq().isAsserted(CpType.RB))
    {
      // RB should have already occurred.
      int aluBus = registerB.read();
      aluBus |= readRegisterU();
      parent.getWriteBus().write(aluBus);
    }
    else
    {
      parent.getWriteBus().write(registerU.read());
    }
  }

  // This internal routine deals with the carry bit.
  private void writeRegisterU()
  {
    int carry = ((registerX.read() + registerY.read()) & 0200000) >> 16; // end-around carry bit
    if ((carry == 1) || (registerCI.read()) == 1 || parent.getSeq().isAsserted(CpType.CI))
    {
      carry = 1;
      if (!parent.getSeq().isAsserted(CpType.CLXC))
      {
        registerCI.writeField(1, 1, 1);
      }
    }
    else
    {
      carry = 0;
      if (!parent.getSeq().isAsserted(CpType.CLXC))
      {
        registerCI.writeField(1, 1, 0);
      }
    }
    // Multiply performs two's compliment, not 1's compliment.
    if (parent.getSeq().readSubseq() == Subseq.MP1 || parent.getSeq().readSubseq() == Subseq.MP3)
    {
      if (parent.getSeq().isAsserted(CpType.CI))
      {
        registerU.write(registerX.read() + registerY.read() + 1);
      }
      else
      {
        registerU.write(registerX.read() + registerY.read());
      }
    }
    else
    {
      registerU.write(registerX.read() + registerY.read() + carry);
    }
  }

  // Read U1-14 to WL1-14 & U15 to WL15,16.  Used in the MSU instruction.
  void execRP_RUS()
  {
    parent.getWriteBus().write(registerU.shiftData(readRegisterU(), conv_U));
  }

  //************************************************************
  // These control pulses OR specific values onto the write bus.
  // Note that there are two combinations present in the CPM; R15/RB2 = 017 and RB1/R1C = -0 (all ones).
  //************************************************************
  void execRP_R15()
  {
    parent.getWriteBus().write(015 | parent.getWriteBus().read());
  }

  void execRP_RB2()
  {
    parent.getWriteBus().write(02 | parent.getWriteBus().read());
  }

  void execRP_RB1()
  {
    parent.getWriteBus().write(01 | parent.getWriteBus().read());
  }

  void execRP_R1C()
  {
    parent.getWriteBus().write(0177776 | parent.getWriteBus().read());
  }

  void execRP_R6()
  {
    parent.getWriteBus().write(06 | parent.getWriteBus().read());
  }

  void execRP_RB1F()
  {
    if (parent.getSeq().readRegisterBR2() == 1)
    {
      parent.getWriteBus().write(01 | parent.getWriteBus().read());
    }
  }

  // Place the starting address onto the write bus.
  void execRP_RSTRT()
  {
    parent.getWriteBus().write(04000 | parent.getWriteBus().read());
  }

  // Copy A register to X register.  This is a direct connection, not through the write bus.
  void execWP_A2X()
  {
    registerX.write(parent.getAxBus().read());
  }

  // Set bit 15 of X register.
  void execWP_B15X()
  {
    registerX.write(0040000);
  }

  // Set carry in bit.
  void execWP_CI()
  {
    registerCI.writeField(1, 1, 1);
  }

  // Clear X register if BR1=0.  Used in the divide command.
  void execWP_CLXC()
  {
    if (parent.getSeq().readRegisterBR1() == 0)
    {
      registerX.write(0);
      registerCI.writeField(1, 1, 0);
    }
    writeRegisterU();
  }

  // Permit end around carry after end of MP3.
  void execWP_NEACOF()
  {
    registerNEAC.writeField(1, 1, 0);
  }

  // Inhibit end around carry until NEACOF.
  void execWP_NEACON()
  {
    registerNEAC.writeField(1, 1, 1);
  }

  // Set all X to 1 except clear bit 1.
  void execWP_MONEX()
  {
    registerX.write(0177776);
    writeRegisterU();
  }

  // Set X register to 1 unless PTWOX is also asserted, then set to 3.
  void execWP_PONEX()
  {
    if (parent.getSeq().isAsserted(CpType.PTWOX))
    {
      registerX.write(3);
    }
    else
    {
      registerX.write(1);
    }
    writeRegisterU();
  }

  // Set X register to 2 unless PONEX is asserted, then set to 3.
  void execWP_PTWOX()
  {
    if (parent.getSeq().isAsserted(CpType.PONEX))
    {
      registerX.write(3);
    }
    else
    {
      registerX.write(2);
    }
    writeRegisterU();
  }

  // Write bus contents into Y register, clearing X and CI.
  void execWP_WY()
  {
    if (!parent.getSeq().isAsserted(CpType.CI))
    {
      registerCI.writeField(1, 1, 0);
    }

    if (!parent.getSeq().isAsserted(CpType.A2X) && !parent.getSeq().isAsserted(CpType.PONEX) &&
        !parent.getSeq().isAsserted(CpType.PTWOX) && !parent.getSeq().isAsserted(CpType.MONEX) &&
        !parent.getSeq().isAsserted(CpType.B15X))
    {
      registerX.write(0);
    }

    registerY.write(parent.getWriteBus().read());
    writeRegisterU();
  }

  // Write first 12 bits of write bus into Y register, clearing X and CI.
  void execWP_WY12()
  {
    if (!parent.getSeq().isAsserted(CpType.CI))
    {
      registerCI.writeField(1, 1, 0);
    }

    if (!parent.getSeq().isAsserted(CpType.A2X) && !parent.getSeq().isAsserted(CpType.PONEX) &&
        !parent.getSeq().isAsserted(CpType.PTWOX) && !parent.getSeq().isAsserted(CpType.MONEX) &&
        !parent.getSeq().isAsserted(CpType.B15X))
    {
      registerX.write(0);
    }

    registerY.write(parent.getWriteBus().read() & 07777);
    writeRegisterU();
  }

  // Write bit 16 of write bus into bit 1 of y register unless bit 15 of L register = 1 and PIFL is active or
  // end-around carry is inhibited by control pulse NEACON.
  void execWP_WYD()
  {
    // Clear CI flip-flop.
    registerCI.writeField(1, 1, 0);

    if (!parent.getSeq().isAsserted(CpType.A2X) && !parent.getSeq().isAsserted(CpType.PONEX) &&
        !parent.getSeq().isAsserted(CpType.PTWOX) && !parent.getSeq().isAsserted(CpType.MONEX) &&
        !parent.getSeq().isAsserted(CpType.B15X))
    {
      registerX.write(0);
    }

    // Write bus contents into register Y shifted to the right one.
    registerY.writeShift(parent.getWriteBus().read(), conv_WYD);

    // Write bit 16 of bus into bit 1 of Y register unless L15 = 1 and PIFL is asserted or
    // end-around carry is inhibited by control pulse NEACON.
    int regWBbit16 = (parent.getWriteBus().read() >> 15) & 1;
    int regLbit15 = (parent.getCrg().readRegisterL() >> 14) & 1;
    if (!(registerNEAC.read() == 1 || (parent.getSeq().isAsserted(CpType.PIFL) && regLbit15 == 1)))
    {
      registerY.writeField(1, 1, regWBbit16);
    }
    writeRegisterU();
  }
}