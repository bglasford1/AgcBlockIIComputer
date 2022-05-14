/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Memory Buffer module.  This module
            implements the G register which is where data that goes to/from
            memory is stored.  Data can be exchanged directly with the L
            register.  The four shift registers are implemented here.

            The shift registers are as follows along with their addresses.
                   020  CYR  (rotate right)
                   021  SR   (shift right)
                   022  CYL  (rotate left)
                   023  EDOP (shift right 7 bits)

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import enums.BusLineDesignation;
import enums.CpType;
import gui.AGCControl;

public class MBF
{
  private final Register registerG = new Register(16);

  // Defines how to load data.
  // BX = don't care, leave alone
  // D0 = zero bit
  // SG = sign bit (1's compliment)
  // SGM = sign bit in memory
  // B1 to B14 = value in bit position n
  private final BusLineDesignation conv_L2GD[] =
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

  private final BusLineDesignation conv_G2LS[] =
    { BusLineDesignation.SG,
      BusLineDesignation.B1,
      BusLineDesignation.D0, // To be filled in by WALS
      BusLineDesignation.D0, // To be filled in by WALS
      BusLineDesignation.US, // Bit 15
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
      BusLineDesignation.B4
    };

  //CYR (rotate right)
  private BusLineDesignation conv_W20[] =
    { BusLineDesignation.BX,
      BusLineDesignation.B1,
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
      BusLineDesignation.B3,
      BusLineDesignation.B2
    };

  // SR (shift right)
  private BusLineDesignation conv_W21[] =
    { BusLineDesignation.SG,
      BusLineDesignation.BX,
      BusLineDesignation.SG,
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
      BusLineDesignation.B2
    };

  // CYL (rotate left) register.
  private BusLineDesignation conv_W22[] =
    { BusLineDesignation.US,
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
      BusLineDesignation.SG
    };

  // EDOP (shift right 7 bits)
  private BusLineDesignation conv_W23[] =
    { BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.BX,
      BusLineDesignation.B14,
      BusLineDesignation.B13,
      BusLineDesignation.B12,
      BusLineDesignation.B11,
      BusLineDesignation.B10,
      BusLineDesignation.B9,
      BusLineDesignation.B8
    };

  private AGCControl parent;

  public MBF(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerG.clk();
  }

  public int readRegisterG()
  {
    return registerG.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  // Check: instruction is RELINT (TC 03))
  boolean EQU_3()
  {
    return (registerG.read() == 003);
  }

  // Check: instruction is INHINT (TC 04))
  boolean EQU_4()
  {
    return (registerG.read() == 004);
  }

  // Check: instruction is EXTEND (TC 06))
  boolean EQU_6()
  {
    return (registerG.read() == 006);
  }

  void execWP_GENRST()
  {
    registerG.write(0);
  }

  // Read G register
  void execRP_RG()
  {
    parent.getWriteBus().write(registerG.read());
  }

  // Copies bits 16, 15-4, and 1 of register G directly (not through Write Bus)
  // into bits 16, 12-1, and 15 of special bus.
  void execRP_G2LS()
  {
    parent.getLgBus().write(registerG.shiftData(registerG.read(), conv_G2LS));
  }

  // Copies bits 16 & 14-1 of register L directly (not through Write Bus) into bit positions 16 & 15-2 of register G.
  // enters a ONE into bit position 1 of register G if pulse MCRO is asserted.
  void execWP_L2GD()
  {
    registerG.writeShift(parent.getCrg().readRegisterL(), conv_L2GD);

    if (parent.getSeq().isAsserted(CpType.MCRO))
    {
      registerG.writeField(1, 1, 1);
    }
  }

  // Write to G register from write bus except for addresses 020-023 which causes editing.
  // The CPM-B module converts a WG pulse into the W20-W23 pulse.
  void execWP_WG()
  {
    registerG.write(parent.getWriteBus().read());
  }

  // Write G register onto memory bus.
  void execRP_WE()
  {
    parent.getMemoryBus().write(registerG.read());
  }

  // Write memory bus into G register.
  void execWP_SBWG()
  {
    registerG.write(parent.getMemoryBus().read());
  }

  // CYR (rotate right) register.
  void execWP_W20()
  {
    registerG.writeShift(parent.getWriteBus().read(), conv_W20);
  }

  // SR (shift right) register.
  void execWP_W21()
  {
    registerG.writeShift(parent.getWriteBus().read(), conv_W21);
  }

  // CYL (rotate left) register.
  void execWP_W22()
  {
    registerG.writeShift(parent.getWriteBus().read(), conv_W22);
  }

  // EDOP (shift right 7 bits) register.
  void execWP_W23()
  {
    registerG.writeShift(parent.getWriteBus().read(), conv_W23);
  }
}
