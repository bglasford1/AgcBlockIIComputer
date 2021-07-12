/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Scaler module.  In this implementation,
            only three of the pulses are used.

                  F10 - 100 Hz  : Used to increment the counters, specifically to keep time.
                  F13 - 12.5 Hz : Used to advance the timing pulse state machine.
                  F17 - 0.78 Hz : Used to advance the timing pulse state machine.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import enums.CtrNumber;
import gui.AGCControl;

public class SCL
{
  private Register registerSCL = new Register(17); // Scalar register
  private Register registerF17 = new Register(2);  // F17 register
  private Register registerF13 = new Register(2);  // F13 register
  private Register registerF10 = new Register(2);  // F10 register

  private AGCControl parent;

  public SCL(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerSCL.clk();
    registerF10.clk();
    registerF13.clk();
    registerF17.clk();
  }

  void execWP_GENRST()
  {
  }

  public int readRegisterSCL()
  {
    return registerSCL.read();
  }

  public int readRegisterF17()
  {
    return registerF17.read();
  }

  public int readRegisterF13()
  {
    return registerF13.read();
  }

  public int readRegisterF10()
  {
    return registerF10.read();
  }

  private enum OneShotType
  {
    // **inferred; not defined in orignal R393 AGC4 spec.
    WAIT_FOR_TRIGGER,
    OUTPUT_PULSE, // LSB (bit 1) is the output bit for the one-shot
    WAIT_FOR_RESET
  }

  // ************************
  // Control Pulse Processing
  // ************************

  public void doexecWP_F17()
  {
    int bit = registerSCL.readField(17, 17);

    OneShotType oneShot = OneShotType.values()[registerF17.read()];
    switch (oneShot)
    {
      case WAIT_FOR_TRIGGER:
        if (bit == 1)
        {
          registerF17.write(OneShotType.OUTPUT_PULSE.ordinal());
        }
        break;

      case OUTPUT_PULSE:
        registerF17.write(OneShotType.WAIT_FOR_RESET.ordinal());
        break;

      case WAIT_FOR_RESET:
        if (bit == 0)
        {
          registerF17.write(OneShotType.WAIT_FOR_TRIGGER.ordinal());
        }
        break;

      default:
    }
  }

  public void doexecWP_F13()
  {
    int bit = registerSCL.readField(13, 13);

    OneShotType oneShot = OneShotType.values()[registerF13.read()];
    switch (oneShot)
    {
      case WAIT_FOR_TRIGGER:
        if (bit == 1)
        {
          registerF13.write(OneShotType.OUTPUT_PULSE.ordinal());
        }
        break;

      case OUTPUT_PULSE:
        registerF13.write(OneShotType.WAIT_FOR_RESET.ordinal());
        break;

      case WAIT_FOR_RESET:
        if (bit == 0)
        {
          registerF13.write(OneShotType.WAIT_FOR_TRIGGER.ordinal());
        }
        break;

      default:
    }
  }

  public void doexecWP_F10()
  {
    int bit = registerSCL.readField(10, 10);

    OneShotType oneShot = OneShotType.values()[registerF10.read()];
    switch (oneShot)
    {
      case WAIT_FOR_TRIGGER:
        if (bit == 1)
        {
          registerF10.write(OneShotType.OUTPUT_PULSE.ordinal());
        }
        break;

      case OUTPUT_PULSE:
        registerF10.write(OneShotType.WAIT_FOR_RESET.ordinal());
        parent.getCtr().setIncrementCounter(CtrNumber.TIME1.ordinal());
        parent.getCtr().setIncrementCounter(CtrNumber.TIME3.ordinal());
        parent.getCtr().setIncrementCounter(CtrNumber.TIME4.ordinal());
        break;

      case WAIT_FOR_RESET:
        if (bit == 0)
        {
          registerF10.write(OneShotType.WAIT_FOR_TRIGGER.ordinal());
        }
        break;

      default:
    }
  }

  public int F17x()
  {
    return registerF17.readField(1, 1);
  }

  public int F13x()
  {
    return registerF13.readField(1, 1);
  }

  public int F10x()
  {
    return registerF10.readField(1, 1);
  }

  public void doexecWP_SCL()
  {
    if (parent.getMon().SCL_ENAB) // if the scaler is enabled
    {
      //write((read() + 1) % readMask());
      registerSCL.write((registerSCL.read() + 1));
    }
  }
}
