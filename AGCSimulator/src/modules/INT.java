/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Interrupt module.  Interrupts can queue
            up and can be inhibited.  The interrupts include the following
            along with their address in the jump table.

                  04000  GOPROG
                  04004  T6RUPT (not implemented)
                  04010  T5RUPT (not implemented)
                  04014  T3RUPT
                  04020  T4RUPT
                  04024  KEYRUPT1
                  04030  KEYRUPT2 (not implemented)
                  04034  UPRUPT (not implemented)
                  04040  DLKRPT (not implemented)
                  04044  RADAR RUPT (not implemented)
                  04050  HAND Control RUPT (not implemented)

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import enums.RuptNumber;
import gui.AGCControl;

public class INT
{
  private final Register registerRpCell  = new Register(5); // Latches the selected priority interrupt vector (1-5)
  private final Register registerINHINT  = new Register(1); // Inhibits interrupts on INHINT, reenables on RELINT

  // NOTE: the priority cells (rupt[]) are indexed 0-5, but stored in the
  //       RpCell register as 1-5; (0 in RpCell means no interrupt)
  private final int[] rupt = new int[6];

  private final AGCControl parent;

  public INT(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerRpCell.clk();
    registerINHINT.clk();
  }

  public int readRegisterRpCell()
  {
    return registerRpCell.read();
  }

  public int readRegisterINHINT()
  {
    return registerINHINT.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  public void setRupt(RuptNumber ruptNumber, int value)
  {
    rupt[ruptNumber.ordinal()] = value;
  }

  // Perform an interrupt request
  boolean IRQ()
  {
    if (getPriorityRupt() > 1       // if interrupt requested
      && registerRpCell.read() == 0  // and interrupt not currently being serviced
      && registerINHINT.read() == 0) // and interrupts enabled (RELINT)
    {
      return true;
    }
    return false;
  }

  // Is an interrupt pending?
  boolean isRupt()
  {
    return registerRpCell.read() > 0;
  }

  // Reset all interrupts.
  private void resetAllRupt()
  {
    for (int i = 0; i < 6; i++)
    {
      rupt[i] = 0;
    }
  }

  // Interrupt vector: outputs 1-5 (decimal) == vector; 0 == no interrupt
  private int getPriorityRupt()
  {
    for (int i = 1; i < 6; i++)
    {
      if (rupt[i] == 1)
      {
        return i;
      }
    }
    return 0;
  }

  // Place the address of the interrupt vector onto the write bus.
  void execRP_RRPA()
  {
    parent.getWriteBus().write(04000 + ((registerRpCell.read()) << 2));
  }

  // latches the selected priority interrupt vector (1-6)
  // also inhibits additional interrupts while an interrupt is being processed
  void execWP_GENRST()
  {
    registerRpCell.write(0);
    registerINHINT.write(1);
    resetAllRupt();
  }

  // Set interrupt to be executed.
  void execWP_RPT()
  {
    registerRpCell.write(getPriorityRupt());
  }

  // Reset RUPT priority.
  void execWP_KRPT()
  {
    rupt[registerRpCell.read()] = 0;
  }

  // Clear all interrupts.
  void execWP_CLRP()
  {
    registerRpCell.write(0);
  }

  // Inhibit interrupts
  void execWP_INH()
  {
    registerINHINT.write(1);
  }

  // Clear interrupt inhibit.
  void execWP_CLINH()
  {
    registerINHINT.write(0);
  }
}
