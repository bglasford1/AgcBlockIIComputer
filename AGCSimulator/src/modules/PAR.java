/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Parity Generation and Test module.
            Parity is only placed on erasable memory words.  The generation
            and testing of parity is driven by internal control pulses.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import gui.AGCControl;

public class PAR
{
  private final Register registerP    = new Register(16); // Parity register
  private final Register registerPalm = new Register(1);  // Parity alarm flip flop

  private final AGCControl parent;

  public PAR(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerP.clk();
    registerPalm.clk();
  }

  public int readRegisterP()
  {
    return registerP.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  public void execWP_GENRST()
  {
    registerPalm.write(0);
  }

  // Get data from the memory bus, add parity bit and write result back to memory bus.
  public void execGP()
  {
    // set all bits except parity bit
    registerP.write(parent.getMemoryBus().read() & 077777);
    int parity = gen1_15Parity(registerP.read());

    // now set parity bit; in the actual AGC, this is a single operation.
    registerP.writeField(16, 16, parity);

    // Write results back to memory bus.
    parent.getMemoryBus().write(registerP.read());
  }

  // Get data from memory bus and test parity.  Currently FMEM does not have parity set.
  public void execTP()
  {
    if (!parent.getAdr().GTR_1777())
    {
      registerP.write(parent.getMemoryBus().read());
      if (parent.getAdr().GTR_7 () && genP_15Parity(registerP.read()) == 1)
        registerPalm.write(genP_15Parity(registerP.read()));
    }
  }

  // asynchronous clear for PARITY ALARM (from MON)
  public void clearParityAlarm()
  {
    registerPalm.clear();
  }

  //check the lower 15 bits of 'r' and return the odd parity; //bit 16 is ignored.
  private int gen1_15Parity(int r)
  {
    int evenParity =
      (1 & r) ^ (1 & (r >> 1)) ^ (1 & (r >> 2)) ^ (1 & (r >> 3)) ^
        (1 & (r >> 4)) ^ (1 & (r >> 5)) ^ (1 & (r >> 6)) ^ (1 & (r >> 7)) ^
        (1 & (r >> 8)) ^ (1 & (r >> 9)) ^ (1 & (r >> 10)) ^ (1 & (r >> 11)) ^
        (1 & (r >> 12)) ^ (1 & (r >> 13)) ^ (1 & (r >> 14));
    return ~evenParity & 1; // odd parity
  }

  //check all 16 bits of 'r' and return the odd parity
  private int genP_15Parity(int r)
  {
    int evenParity =
      (1 & r) ^ (1 & (r >> 1)) ^ (1 & (r >> 2)) ^ (1 & (r >> 3)) ^
        (1 & (r >> 4)) ^ (1 & (r >> 5)) ^ (1 & (r >> 6)) ^ (1 & (r >> 7)) ^
        (1 & (r >> 8)) ^ (1 & (r >> 9)) ^ (1 & (r >> 10)) ^ (1 & (r >> 11)) ^
        (1 & (r >> 12)) ^ (1 & (r >> 13)) ^ (1 & (r >> 14)) ^ (1 & (r >> 15));
    return ~evenParity & 1; // odd parity
  }
}
