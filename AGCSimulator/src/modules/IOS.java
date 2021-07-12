/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the I/O channels that are not associated
            with other modules.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import gui.AGCControl;

public class IOS
{
  // Jet controls:
  // Bit 1 = Jet B4U
  // Bit 2 = Jet A4D
  // Bit 3 = Jet A3U
  // Bit 4 = Jet B3D
  // Bit 5 = Jet B2U
  // Bit 6 = Jet A2D
  // Bit 7 = Jet A1U
  // Bit 8 = Jet B1D
  private Register channel5  = new Register(8);

  // Jet controls:
  // Bit 1 = Jet B3A
  // Bit 2 = Jet B4F
  // Bit 3 = Jet A1F
  // Bit 4 = Jet A2A
  // Bit 5 = Jet B2L
  // Bit 6 = Jet A3R
  // Bit 7 = Jet A4R
  // Bit 8 = Jet B1L
  private Register channel6  = new Register(8);

  // IMU, CDU and Optics Control:
  // Bit 1 = Zero Optics CDUs
  // Bit 2 = Enable Optics CDU Error Counters
  // Bit 3 = Not Used
  // Bit 4 = Coarse Align Enable of IMU
  // Bit 5 = Zero IMU CDUs
  // Bit 6 = Enable IMU & CDU  Error Counters
  // Bit 7 = Spare
  // Bit 8 = Display Inertial Data
  // Bit 9 =  -Pitch Gimbal Trim Descent Engine
  // Bit 10 = +Pitch Gimbal Trim Descent Engine
  // Bit 11 = -Roll Gimbal Trim Descent Engine
  // Bit 12 = +Roll Gimbal Trim Descent Engine
  // Bit 13 = LR Position 2 Command
  // Bit 14 = Enable RR Lock-On; Auto Angle Tracking
  // Bit 15 = ISS Turn-on Delay Complete
  private Register channel12 = new Register(15);

  // Gyro Control:
  // Bit 1 = Not Used
  // Bit 2 = Altitude Rate or Altitude Selector
  // Bit 3 = Altitude Meter Activity
  // Bit 4 = Thrust Drive Activity for Descent Engine
  // Bit 5 = Spare
  // Bit 6 = Gyro Enable Power for Pulses
  // Bit 7 = Gyro Select B  Pair of bits identifies axis of gyro system
  // Bit 8 = Gyro Select A    to be torqued.
  // Bit 9 = Gyro Sign (1 = minus) (command torque in negative direction)
  // Bit 10 = Gyro Activity
  // Bit 11 = Drive CDU S (Shaft)
  // Bit 12 = Drive CDU T (Trunion)
  // Bit 13 = Drive CDU Z
  // Bit 14 = Drive CDU Y
  // Bit 15 = Drive CDU X
  private Register channel14 = new Register(15);

  // Various Hardware Inputs:
  // Bit 1 = Abort with Descent Stage
  // Bit 2 = Unused
  // Bit 3 = Engine Armed Signal
  // Bit 4 = Abort with Ascent Engine Stage
  // Bit 5 = Auto Throttle; Computer Control of Descent Engine
  // Bit 6 = Display Inertial Data
  // Bit 7 = RR CDU Fail
  // Bit 8 = Spare
  // Bit 9 = IMU Operate with no Malfunction
  // Bit 10 = LM Computer (not AGS) has control of LM
  // Bit 11 = IMU Cage Command to Drive IMU Gimbal Angles to 0
  // Bit 12 = IMU CDU Fail (Malfunction of IMU CDUs)
  // Bit 13 = IMU Fail (Malfunction of IMU Stabilization Loops)
  // Bit 14 = ISS Turn-On Requested
  // Bit 15 = Temperature of Stable Member in Limits
  private Register channel30 = new Register(15);

  // Orientation Rotation and Translation:
  // Bit 1 = + Pitch and Elevation Rotation (These are commanded by RHC)
  // Bit 2 = - Pitch and Elevation Rotation
  // Bit 3 = + Yaw Rotation
  // Bit 4 = - Yaw Rotation
  // Bit 5 = + Roll Rotation
  // Bit 6 = - Roll Rotation
  // Bit 7 = + X Translation (These are commanded by THC)
  // Bit 8 = - X Translation
  // Bit 9 = + Y Translation
  // Bit 10 = - Y Translation
  // Bit 11 = + Z Translation
  // Bit 12 = - Z Translation
  // Bit 13 = Attitude Hold Mode on SCS Mode Control Switch
  // Bit 14 = Auto Stabilization of Attitude on SCS Mode Switch
  // Bit 15 = Attitude Control out of Detent (RHC not in neutral)
  private Register channel31 = new Register(15);

  // Various Warnings and Alarms:
  // Bit 1 = Spare
  // Bit 2 = RR Auto-Power On
  // Bit 3 = RR Range Low Scale
  // Bit 4 = RR Data Good
  // Bit 5 = LR Range Data Good
  // Bit 6 = LR Pos1
  // Bit 7 = LR Pos2
  // Bit 8 = LR Vel Data Good
  // Bit 9 = LR Range Low Scale
  // Bit 10 = Block Uplink Input
  // Bit 11 = Uplink Too Fast
  // Bit 12 = Downlink Too Fast
  // Bit 13 = PIPA Fail
  // Bit 14 = AGC Warning of Repeated Alarms: Restart, Counter Fail, Voltage Fail & Scalar Double
  // Bit 15 = AGC Oscillator Alarm
  private Register channel33 = new Register(15);

  // Failure Outputs:
  // Bit 1 = Parity Fail (E or F memory)
  // Bit 2 = Parity Fail (E memory)
  // Bit 3 = TC Trap
  // Bit 4 = RUPT Lock
  // Bit 5 = Night Watchman
  // Bit 6 = Voltage Fail
  // Bit 7 = Counter Fail
  // Bit 8 = Scalar Fail
  // Bit 9 = Scalar Double Frequency Alarm
  // Bit 10 = Spare
  // Bit 11 = Spare
  // Bit 12 = Spare
  // Bit 13 = Spare
  // Bit 14 = Spare
  // Bit 15 = Spare
  private Register channel77 = new Register(15);

  private AGCControl parent;

  public IOS(AGCControl parent)
  {
    this.parent = parent;
  }

  public int readChannel5()
  {
    return channel5.read();
  }

  public int readChannel6()
  {
    return channel6.read();
  }

  public int readChannel12()
  {
    return channel12.read();
  }

  public int readChannel14()
  {
    return channel14.read();
  }

  public int readChannel30()
  {
    return channel30.read();
  }

  public int readChannel31()
  {
    return channel31.read();
  }

  public int readChannel33()
  {
    return channel33.read();
  }

  public int readChannel77()
  {
    return channel77.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  public void clockPulse()
  {
    channel5.clk();
    channel6.clk();
    channel12.clk();
    channel14.clk();
    channel30.clk();
    channel31.clk();
    channel33.clk();
    channel77.clk();
  }

  void execWP_GENRST()
  {
    channel5.write(0);
    channel6.write(0);
    channel12.write(0);
    channel14.write(0);
    channel30.write(077777);
    channel31.write(077777);
    channel33.write(077777);
    channel77.write(0);
  }

  // Write the channel bus into channel 5
  void execWP_CH5()
  {
    channel5.write(parent.getChannelDataBus().read());
  }

  // Write the channel bus into channel 6
  void execWP_CH6()
  {
    channel6.write(parent.getChannelDataBus().read());
  }

  // Write the channel bus into channel 12
  void execWP_CH12()
  {
    channel12.write(parent.getChannelDataBus().read());
  }

  // Write the channel bus into channel 14
  void execWP_CH14()
  {
    channel14.write(parent.getChannelDataBus().read());
  }

  // Read channel 30 and place data on channel data bus.
  void execRP_CH30()
  {
    parent.getChannelDataBus().write(channel30.read());
  }

  // Read channel 31 and place data on channel data bus.
  void execRP_CH31()
  {
    parent.getChannelDataBus().write(channel31.read());
  }

  // Read channel 33 and place data on channel data bus.
  void execRP_CH33()
  {
    parent.getChannelDataBus().write(channel33.read());
  }

  // Write the channel bus into channel 77
  void execWP_CH77()
  {
    channel77.write(parent.getChannelDataBus().read());
  }
}
