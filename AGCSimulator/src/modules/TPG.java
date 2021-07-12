/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Time Pulse Generator module.  There are
            12 timing pulses per memory cycle.  Each sub-sequence runs in a
            single memory cycle.  For debugging purposes the states of SRLSE
            and WAIT have been added.  For startup processing the STBY and
            PWRON states have been added.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import enums.CpType;
import enums.TpType;
import gui.AGCControl;

public class TPG
{
  private Register registerSG = new Register(4); // static member

  private TpType previousState = TpType.STBY;
  private AGCControl parent;

  public TPG(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerSG.clk();
  }

  public int readRegisterSG()
  {
    return registerSG.read();
  }

  // Used to display state that syncs with everything else.
  public TpType getPreviousState()
  {
    return previousState;
  }

  // ************************
  // Control Pulse Processing
  // ************************

  public void doexecWP_TPG()
  {
    // Read current state from SG register.
    TpType mystate = TpType.values()[registerSG.read()];
    previousState = mystate;

    switch (mystate)
    {
      case STBY:
        if (!parent.getMon().PURST && ((!parent.getMon().FCLK) || parent.getScl().F17x() == 1))
        mystate = TpType.PWRON;
        break;

      case PWRON:
        if (((!parent.getMon().FCLK) || parent.getScl().F13x() == 1))
        mystate = TpType.TP1;
        break;

      case TP1:
        mystate = TpType.TP2;
        break;

      case TP2:
        mystate = TpType.TP3;
        break;

      case TP3:
        mystate = TpType.TP4;
        break;

      case TP4:
        mystate = TpType.TP5;
        break;

      case TP5:
        mystate = TpType.TP6;
        break;

      case TP6:
        mystate = TpType.TP7;
        break;

      case TP7:
        mystate = TpType.TP8;
        break;

      case TP8:
        mystate = TpType.TP9;
        break;

      case TP9:
        mystate = TpType.TP10;
        break;

      case TP10:
        mystate = TpType.TP11;
        break;

      case TP11:
        mystate = TpType.TP12;
        break;

      case TP12:
        int address = parent.getAdr().decodeAddress((parent.getCrg().readRegisterZ() - 1),
                                      parent.getAdr().readRegisterFB(),
                                      parent.getAdr().readRegisterEB());

        if (parent.getSeq().readRegisterSNI() == 1 && parent.getMon().PROG)
        {
          mystate = TpType.STBY;
        }
        else if (parent.getMon().breakpointEnabled &&
                 parent.getMon().breakpointAddress == address)
        {
          parent.getMon().RUN = false;
          parent.getMon().FCLK = false;
          mystate = TpType.SRLSE;
          parent.getMon().breakpointEnabled = false;
          parent.getMon().breakpointAddress = 0;
        }
        // NOTE: CPM occurs before this so IRQ() can't be used...
        else if (parent.getMon().ruptBreakpointEnabled && parent.getInr().isRupt())
        {
          parent.getMon().RUN = false;
          parent.getMon().FCLK = false;
          mystate = TpType.SRLSE;
          parent.getMon().ruptBreakpointEnabled = false;
        }
        else if (parent.getMon().counterBreakpointEnabled && parent.getSeq().isAsserted(CpType.PINC))
        {
          parent.getMon().RUN = false;
          parent.getMon().FCLK = false;
          mystate = TpType.SRLSE;
          parent.getMon().counterBreakpointEnabled = false;
        }
        else if ((parent.getMon().RUN) || (parent.getSeq().readRegisterSNI() == 0 && parent.getMon().INST))
        {
          mystate = TpType.TP1;
        }
        else
        {
          mystate = TpType.SRLSE;
        }
        break;

      case SRLSE:
        if (!parent.getMon().STEP)
        {
          mystate = TpType.WAIT;
        }
        break;

      case WAIT:
        if (parent.getMon().STEP || parent.getMon().RUN)
        {
          mystate = TpType.TP1;
        }
        break;

      default:
        break;
    }
    // Write new state back to SG register.
    registerSG.write(mystate.ordinal());
  }
}
