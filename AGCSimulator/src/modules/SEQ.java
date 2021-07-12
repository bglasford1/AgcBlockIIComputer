/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Sequence Generator module.  This module
            manages the stage, branch, sequence and sub-sequence registers as
            well as teh SNI and EXT bits.  The current control pulses are
            saved here.  Setting the branch bits involves asserting test
            control pulses that check various register states.  This controls
            which control pulses of a sub-sequence get executed next.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import enums.CpType;
import enums.Subseq;
import gui.AGCControl;

public class SEQ
{
  public static final int MAXPULSES = 15;

  private Register registerSNI    = new Register(1);    // Select next intruction flag
  private Register registerEXT    = new Register(1);    // Extend register. (bit 16)
  private Register registerSQ     = new Register(6);    // Instruction register (bits 10-15 of next instruction)
  private Register registerStage  = new Register(3);    // Stage counter
  private Register registerPreStage = new Register(3);  // Pre-Stage counter that hold the next stage count.
  private Register registerBR1    = new Register(1);    // Branch register1
  private Register registerBR2    = new Register(1);    // Branch register2
  private Register registerSubseq = new Register(6);    // Made up ordinal of subsequence being executed.

  private CpType[] controlPulses = new CpType[MAXPULSES];    // current set of asserted control pulses (MAXPULSES)

  private AGCControl parent;

  public SEQ(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerSNI.clk();
    registerSQ.clk();
    registerStage.clk();
    registerPreStage.clk();
    registerBR1.clk();
    registerBR2.clk();
    registerEXT.clk();
    registerSubseq.clk();
  }

  public int readRegisterSNI()
  {
    return registerSNI.read();
  }

  public int readRegisterSQ()
  {
    return registerSQ.read();
  }

  public int readRegisterStage()
  {
    return registerStage.read();
  }

  public int readRegisterPreStage()
  {
    return registerPreStage.read();
  }

  public int readRegisterBR1()
  {
    return registerBR1.read();
  }

  public int readRegisterBR2()
  {
    return registerBR2.read();
  }

  public int readRegisterEXT()
  {
    return registerEXT.read();
  }

  // Get the sub-sequence currently being executed.
  public Subseq readSubseq()
  {
    return Subseq.values()[registerSubseq.read()];
  }

  // ************************
  // Control Pulse Processing
  // ************************

  void execWP_GENRST()
  {
    registerSQ.write(0);
    registerBR1.write(0);
    registerBR2.write(0);
    registerSNI.write(0);
    registerStage.write(1); // Causes the GOJ1 command to run on restart.
    registerPreStage.write(0);
    registerEXT.write(0);
  }

  // Set the sub-sequence being executed.
  public void setSubseq(Subseq subseq)
  {
    registerSubseq.write(subseq.ordinal());
  }

  // Clears the SQ register and writes bits 16, 14-10 of the write bus into bit positions 16 and 14-10.
  void execWP_WSQ()
  {
    registerSQ.write(parent.getWriteBus().read() >> 9);
    registerSQ.writeField(16, 16, registerEXT.readField(1, 1));
  }

  // Indicate next instruction is to be loaded.
  void execWP_NISQ()
  {
    registerSNI.writeField(1, 1, 1);
  }

  // Clear the next instruction bit.
  void execWP_CLISQ()
  {
    registerSNI.writeField(1, 1, 0);
  }

  // Set the extend bit
  void execWP_EXT()
  {
    registerEXT.writeField(1, 1, 1);
  }

  // Clear the extend bit
  void execWP_CLEXT()
  {
    registerEXT.writeField(1, 1, 0);
  }

  // Get the control pulses to execute.
  public CpType getControlPulse(int position)
  {
    return controlPulses[position];
  }

  // Set the control pulses to execute.
  public void setControlPulse(int position, CpType pulse)
  {
    controlPulses[position] = pulse;
  }

  // Check: Is a control pulse asserted?
  boolean isAsserted(CpType pulse)
  {
    for (int i = 0; i < MAXPULSES; i++)
    {
      if (controlPulses[i] == pulse)
      {
        return true;
      }
    }
    return false;
  }

  // Get control pulses as a string to display.
  public String getControlPulses()
  {
    String controlPulses = "";

    for (int i = 0; i < MAXPULSES && this.controlPulses[i] != CpType.NO_PULSE; i++)
    {
      controlPulses = controlPulses + this.controlPulses[i].toString() + " ";
    }
    if (controlPulses.length() == 0)
      controlPulses = "NONE";

    return controlPulses;
  }

  // Set stage register bit 1.
  void execWP_ST1()
  {
    registerPreStage.write(registerPreStage.read() | 1);
  }

  // Set stage register bit 2.
  void execWP_ST2()
  {
    registerPreStage.write(registerPreStage.read() | 2);
  }

  // Set sequence to next divide number
  void execWP_DVST()
  {
    // Rotate the 3 bits in the stage register.
    // Reverse the high order bit.
    if (registerStage.read() == 0)
    {
      registerPreStage.write(1);
    }
    else if (registerStage.read() == 1)
    {
      registerPreStage.write(3);
    }
    else if (registerStage.read() == 3)
    {
      registerPreStage.write(7);
    }
    else if (registerStage.read() == 7)
    {
      registerPreStage.write(6);
    }
    else if (registerStage.read() == 6)
    {
      registerPreStage.write(4);
    }
  }

  // Execute next sub-instruction based on stage register.  This relates to DV command.
  void execWP_STAGE()
  {
    registerStage.write(registerPreStage.read());
  }

  // Execute RUPT0 as the next instruction.
  void execWP_INTR()
  {
    registerStage.write(0);
    registerPreStage.write(0);
    registerEXT.writeField(1, 1, 1);
    registerSQ.write(07);
  }

  // Execute PINC0 as the next instruction.
  void execWP_PINC()
  {
    setSubseq(Subseq.PINC);
  }

  // Write L register bit 15 to BR1.
  void execWP_TL15()
  {
    registerBR1.writeField(1, 1, parent.getCrg().readRegisterL() & 040000);
  }

  // Test for Resume Address during NDX0.  If exists, set STAGE register to 3 to execute RSM3,
  // else set STAGE register to 1.
  void execWP_TRSM()
  {
    if (parent.getAdr().EQU_17())
    {
      registerPreStage.write(3);
    }
    else
    {
      registerPreStage.write(1);
    }
  }

  // Test for sign in U register: if a ZERO, flip-flop BR1 is set to ZERO; if a ONE, flip-flop BR1 is set to ONE.
  // Return whether or not bit 16 is set.
  public boolean execTSGU()
  {
    int regUBit16 = (parent.getAlu().readRegisterU() & 0100000) >> 15;
    registerBR1.writeField(1, 1, regUBit16);
    return regUBit16 == 1;
  }

  // Clear the stage register if pre-stage = 0, else move pre-stage to stage.  Reset Branch registers.
  void execWP_RSTSTG()
  {
    if (registerPreStage.read() == 0)
    {
      registerStage.write(0);
    }
    else
    {
      registerStage.write(registerPreStage.read());
      registerPreStage.write(0);
    }
    registerBR1.write(0);
    registerBR2.write(0);
  }

  // Test sign:  if a ZERO, flip-flop BR1 is set to ZERO; if a ONE, flip-flop BR1 is set to ONE without changing
  // the content of flip-flop BR2.
  void execWP_TSGN()
  {
    if ((parent.getWriteBus().read() & 040000) == 0)
    {
      registerBR1.write(0);
    }
    else
    {
      registerBR1.write(1);
    }
  }

  // Test sign 2:  if a ZERO, flip-flop BR2 is set to ZERO; if a ONE, flip-flop BR2 is set to ONE without changing
  //  // the content of flip-flop BR1.
  void execWP_TSGN2()
  {
    if ((parent.getWriteBus().read() & 040000) == 0)
    {
      registerBR2.write(0);
    }
    else
    {
      registerBR2.write(1);
    }
  }

  // Test G register for plus zero: if bits 16 through l are all ZEROs, flip-flop BR2 is set to ONE;
  // otherwise the content of BR2 is not changed.
  void execWP_TPZG()
  {
    if ((parent.getMbf().readRegisterG() & 077777) == 0)
    {
      registerBR2.write(1);
    }
  }

  // Test write bus for overflow. Tests the write bus bits 15 & 16: set flip-flops BR1 and BR2 to 00 if no overflow,
  // 01 in case of positive overflow, or to 10 in case of negative overflow.
  void execWP_TOV()
  {
    if (parent.getSeq().isAsserted(CpType.RA))
    {
      return;
    }

    if ((parent.getWriteBus().read() & 0100000) == 0100000)
    {
      registerBR1.write(1);
    }
    else
    {
      registerBR1.write(0);
    }

    if ((parent.getWriteBus().read() & 040000) == 040000)
    {
      registerBR2.write(1);
    }
    else
    {
      registerBR2.write(0);
    }
  }

  // Test write bus for zero, positive or negative (all ones in 1's compliment).  Set BR2 to 1 if true else set to 0.
  void execWP_TMZ()
  {
    if ((parent.getWriteBus().read() & 077777) == 077777 || parent.getWriteBus().read() == 0)
    {
      registerBR2.write(1);
    }
    else
    {
      registerBR2.write(0);
    }
  }
}
