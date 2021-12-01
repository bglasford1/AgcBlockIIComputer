/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the DSKY Keyboard module as well as
            channels 15, 16 and 32.

  Mods:		  07/15/21  Initial Release.
            11/30/21  Fixed Proceed Key.
*/

package modules;

import components.Register;
import enums.KeyInType;
import enums.RuptNumber;
import gui.AGCControl;

public class KBD
{
  // Bits 1-5 = input key code
  // Key Name	  Value
  // No key 	   00
  // 1		       01
  // 2		       02
  // 3		       03
  // 4		       04
  // 5		       05
  // 6		       06
  // 7		       07
  // 8		       10
  // 9		       11
  // 0		       20
  // Verb		     21
  // Reset		   22
  // Key Rel	   31
  // +		       32
  // -		       33
  // Enter		   34
  // Clear		   36
  // Noun		     37
  private Register channel15 = new Register(5);  // Main DSKY keyboard input

  // Bit 1 = Not Used
  // Bit 2 = Not Used
  // Bit 3 = Optics X-Axis Mark Signal for Align Optical Tscope
  // Bit 4 = Optics Y-Axis Mark Signal for AOT
  // Bit 5 = Optics Mark Reject Signal
  // Bit 6 = Descent+ : Crew Desiring Slowing Rate of Descent
  // Bit 7 = Descent- : Crew Desiring Speeding Up of Rate of Descent
  private Register channel16 = new Register(5);  // Navigation DSKY keyboard input

  // Orientation Minimum Impulse:
  // Bit 1 = Thrusters 2 & 4 Disabled by Crew
  // Bit 2 = Thrusters 5 & 8 Disabled by Crew
  // Bit 3 = Thrusters 1 & 3 Disabled by Crew
  // Bit 4 = Thrusters 6 & 7 Disabled by Crew
  // Bit 5 = Thrusters 14 & 16 Disabled by Crew
  // Bit 6 = Thrusters 13 & 15 Disabled by Crew
  // Bit 7 = Thrusters 9 & 12 Disabled by Crew
  // Bit 8 = Thrusters 10 & 11 Disabled by Crew
  // Bit 9 = Descent Engine Gimbals Disabled by Crew
  // Bit 10 = Apparent Descent Engine Gimbal Failure
  // Bit 11 = Spare
  // Bit 12 = Spare
  // Bit 13 = Spare
  // Bit 14 = Proceed Button Pressed (Standby button)
  // Bit 15 = Spare
  private Register channel32 = new Register(15);

  private AGCControl parent;

  public KBD(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    channel15.clk();
    channel16.clk();
    channel32.clk();
  }

  public int readChannel15()
  {
    return channel15.read();
  }

  public int readChannel16()
  {
    return channel16.read();
  }

  public int readChannel32()
  {
    return channel32.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  void execWP_GENRST()
  {
    channel15.write(0);
    channel16.write(0);
    channel32.write(0);
  }

  // Read keyboard input and place onto channel data bus.
  void execRP_KBD1()
  {
    parent.getChannelDataBus().write(channel15.read());
  }

  // Read channel 32 and place the proceed key data on channel data bus.
  void execRP_RPRO()
  {
    parent.getChannelDataBus().write(channel32.read());
  }

  // Process the Proceed key.
  public void proPress()
  {
    channel32.writeField(14, 14, 1);
  }

  // Process all key presses except the Proceed key.
  public void keyPress(KeyInType key)
  {
    // latch the keycode
    channel15.write(key.getValue());

    // generate KEYRUPT1 interrupt
    parent.getInr().setRupt(RuptNumber.KEYRUPT1, 1);
  }
}
