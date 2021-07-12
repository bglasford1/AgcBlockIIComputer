/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Counters module.  There are many counters
            to determine rates of change for things like the IMU.  These changes
            occur so frequently that interrupt processing is not fast enough.
            Counters use cycle stealing.  This is where a single sub-sequence
            called PINC is run to increment a counter.  There are many other
            counter sub-sequences, however only the PINC is implemented along with
            only four timers.  Timers 1 and 2 keep system time which is the time
            since the computer was turned on.  Timer 3 is used by the waitlist and
            timer 4 is used to update the DSKY display.

            The counters include the following along with their address in erasable memory.
                  024  TIME2
                  025  TIME1
                  026  TIME3
                  027  TIME4

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import enums.CtrNumber;
import enums.RuptNumber;
import gui.AGCControl;

public class CTR
{
  // Latches the selected priority counter cell (0-3 (decimal))
  private Register registerUpCell = new Register(4);

  private int[] pcUp = new int[4];

  private AGCControl parent;

  public CTR(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerUpCell.clk();
  }

  // Read the UpCell register.
  public int readRegisterUpCell()
  {
    return registerUpCell.read();
  }

  // Increment one of the counters.
  public void setIncrementCounter(int counter)
  {
    pcUp[counter] = 1;
  }

  // Zero out all of the counters.
  private void resetAllpc()
  {
    for (int i = 0; i < 4; i++)
    {
      pcUp[i] = 0;
    }
  }

  // Get the counter to increment based on an assumed priority.
  private int getPriority()
  {
    int priority = 3; // default (lowest priority)

    for (int i = 0; i < 4; i++)
    {
      if (registerUpCell.readField(i, i) == 1)
      {
        priority = i;
        break;
      }
    }
    return priority;
  }

  // ************************
  // Control Pulse Processing
  // ************************

  // Method to determine if a PINC sub-command should run.
  boolean runPINC()
  {
    int pc = getPriority();
    return (registerUpCell.readField(pc, pc) == 1);
  }

  void execWP_GENRST()
  {
    registerUpCell.write(0);
    resetAllpc();
  }

  // Transfer cell data into up synch register
  void execWP_WPCTR()
  {
    for (int i = 0; i < 4; i++)
    {
      registerUpCell.writeField(i, i, pcUp[i]);
    }
  }

  // Write into the write bus the address of a counter address supplied by the Counter Priority Control.
  void execRP_RSCT()
  {
    parent.getWriteBus().write(024 + getPriority());
  }

  // Test for overflow: if S register contains 0025, counter OO24 is incremented;
  // if S register contains 0026 , 0027, or 0030, instruction RUPT is executed.
  void execWP_WOVR()
  {
    int pc = getPriority();
    if (registerUpCell.readField(pc, pc) == 1)
    {
      pcUp[pc] = 0;
    }

    // Generate various actions in response to counter overflows:
    switch (parent.getWriteBus().testOverflow(parent.getWriteBus().read()))
    {
      case POS_OVF: // positive overflow
        CtrNumber value = CtrNumber.values()[getPriority()];
        switch (value) // get the counter
        {
          case TIME1:
            pcUp[CtrNumber.TIME2.ordinal()] = 1;
            break; // overflow from TIME1 increments TIME2
          case TIME3:
            parent.getInr().setRupt(RuptNumber.T3RUPT, 1);
            break; // overflow from TIME3 triggers T2RUPT
          case TIME4:
            parent.getInr().setRupt(RuptNumber.T4RUPT, 1);
            break; // overflow from TIME4 triggers T4RUPT
        }
        break;

      case NEG_OVF:
        break; // no actions for negative counter overflow
    }
  }
}
