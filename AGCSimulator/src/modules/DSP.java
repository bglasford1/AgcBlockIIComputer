/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the DSKY Display module.  Channels 10, 11
            and 13 are implemented here.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import gui.AGCControl;

public class DSP
{
  // DSKY display command:
  // Bits 1-5   = the right hand digit value (DSPL)
  // Bits 6-10  = the left hand digit value (DSPH)
  // Bit 11     = the verb and noun digits should be flashing (DSPC)
  // Bits 12-15 = the relay word (RLYWD)
  private Register channel10 = new Register(15);

  // DSKY indicator lights:
  // Bit 1 = ISS Warning
  // Bit 2 = Light Computer Activity Lamp
  // Bit 3 = Light Uplink Activity Lamp
  // Bit 4 = Light Temp Caution Lamp
  // Bit 5 = Light Keyboard Release Lamp
  // Bit 6 = Flash Verb and Noun Lamps
  // Bit 7 = Light Operator Error Lamp
  // Bit 8 = Spare
  // Bit 9 = Test Connector Outbit
  // Bit 10 = Caution Reset
  // Bit 13 = Engine On
  // Bit 14 = Engine Off
  // Bit 15 = Spare
  private Register channel11 = new Register(15);

  // Various Hardware Outputs:  Only the Enable Standby & Test Lights are implemented
  // Bit 10 = Test Alarms & DSKY Lights
  // Bit 11 = Enable Standby
  private Register channel13 = new Register(15);

  // Negative logic: a 1 in the bit turns off the light.
  // Bit 1 = PRIO DISP indicator
  // Bit 2 = NO DAP indicator
  // Bit 3 = VEL indicator
  // Bit 4 = NO ATT indicator
  // Bit 5 = ALT indicator
  // Bit 6 = GIMBAL LOCK indicator
  // Bit 8 = TRACKER indicator
  // Bit 9 = PROG indicator
  private Register indicators = new Register(15); // This is sent using the 1100 = 014 Relay Word

  private boolean dskyChanged = false; // true when DSKY display changes

  // major mode display
  public char MD1 = 0;
  public char MD2 = 0;

  // verb display
  public char VD1 = 0;
  public char VD2 = 0;

  // noun display
  public char ND1 = 0;
  public char ND2 = 0;

  // R1
  public char R1S = 0;
  public char R1D1 = 0;
  public char R1D2 = 0;
  public char R1D3 = 0;
  public char R1D4 = 0;
  public char R1D5 = 0;

  // R2
  public char R2S = 0;
  public char R2D1 = 0;
  public char R2D2 = 0;
  public char R2D3 = 0;
  public char R2D4 = 0;
  public char R2D5 = 0;

  // R3
  public char R3S = 0;
  public char R3D1 = 0;
  public char R3D2 = 0;
  public char R3D3 = 0;
  public char R3D4 = 0;
  public char R3D5 = 0;

  // These flags control the sign; if both bits are 0 or 1, there is no sign.
  // Otherwise, the sign is set by the selected bit.
  private int R1SP = 0;
  private int R1SM = 0;
  private int R2SP = 0;
  private int R2SM = 0;
  private int R3SP = 0;
  private int R3SM = 0;

  // Flag controls 1 Hz flash of verb and noun display
  public boolean flash = false; // 0=flash off, 1=flash on

  private AGCControl parent;

  public DSP(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    channel10.clk();
    channel11.clk();
    channel13.clk();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  void execWP_GENRST()
  {
    channel10.write(0);
    channel11.write(0);
    channel13.write(2000); // Lights the STBY light
    clearDisplay();
  }

  public int readChannel10()
  {
    return channel10.read();
  }

  public int readChannel11()
  {
    return channel11.read();
  }

  public boolean getCompActy()
  {
    return (channel11.read() & 02) != 0;
  }

  public boolean getUplinkActy()
  {
    return (channel11.read() & 04) != 0;
  }

  public boolean getTemp()
  {
    return (channel11.read() & 010) != 0;
  }

  public boolean getKeyRel()
  {
    return (channel11.read() & 020) != 0;
  }

  public boolean getFlash()
  {
    return (channel11.read() & 040) != 0;
  }

  public boolean getOperErr()
  {
    return (channel11.read() & 0100) != 0;
  }

  public boolean getVelIndicator()
  {
    return (indicators.read() & 04) == 0;
  }

  public boolean getNoAttIndicator()
  {
    return (indicators.read() & 010) == 0;
  }

  public boolean getAltIndicator()
  {
    return (indicators.read() & 020) == 0;
  }

  public boolean getGimbalLockIndicator()
  {
    return (indicators.read() & 040) == 0;
  }

  public boolean getTrackerIndicator()
  {
    return (indicators.read() & 0200) == 0;
  }

  public boolean getProgIndicator()
  {
    return (indicators.read() & 0400) == 0;
  }

  public int readChannel13()
  {
    return channel13.read();
  }

  public boolean getStby()
  {
    return (channel13.read() & 02000) != 0;
  }

  // Write the channel bus into channel 10
  void execWP_DISP()
  {
    decodeRelayWord(parent.getChannelDataBus().read());
  }

  // Write the channel bus into channel 11
  void execWP_INDC()
  {
    channel11.write(parent.getChannelDataBus().read());
  }

  // Write the channel bus into channel 13
  void execWP_CH13()
  {
    channel13.write(parent.getChannelDataBus().read());
  }

  public boolean isDskyChanged()
  {
    return dskyChanged;
  }

  public void setDskyChanged(boolean value)
  {
    dskyChanged = value;
  }

  private void clearDisplay()
  {
    MD1 = ' ';
    MD2 = ' ';
    VD1 = ' ';
    VD2 = ' ';
    ND1 = ' ';
    ND2 = ' ';
    R1S = ' ';
    R1D1 = ' ';
    R1D2 = ' ';
    R1D3 = ' ';
    R1D4 = ' ';
    R1D5 = ' ';
    R2S  = ' ';
    R2D1 = ' ';
    R2D2 = ' ';
    R2D3 = ' ';
    R2D4 = ' ';
    R2D5 = ' ';
    R3S  = ' ';
    R3D1 = ' ';
    R3D2 = ' ';
    R3D3 = ' ';
    R3D4 = ' ';
    R3D5 = ' ';

    R1SP = 0;
    R1SM = 0;
    R2SP = 0;
    R2SM = 0;
    R3SP = 0;
    R3SM = 0;
  }

  // Process the sign bit.
  private char signConv(int p, int m)
  {
    if (p == 1 && m == 0)
    {
      return '+';
    }
    else if (m == 1 && p == 0)
    {
      return '-';
    }
    else
    {
      return ' ';
    }
  }

  // Determine the character to output.
  private char outConv(int in)
  {
    switch (in)
    {
      case 000:
        return ' ';
      case 025:
        return '0';
      case 003:
        return '1';
      case 031:
        return '2';
      case 033:
        return '3';
      case 017:
        return '4';
      case 036:
        return '5';
      case 034:
        return '6';
      case 023:
        return '7';
      case 035:
        return '8';
      case 037:
        return '9';
    }
    return ' '; // error
  }

  // Convert a relay word into the appropriate characters to display.
  private void decodeRelayWord(int in)
  {
    int charSelect = (in & 074000) >> 11; // get bits 15-12
    int b11 = (in & 02000) >> 10;  // get bit 11
    int bHigh = (in & 01740) >> 5;   // get bits 10-6
    int bLow = in & 037;

    System.out.println();
    System.out.println("Input: " + in + " Bits 15-12: " + charSelect + ", bit 11: " + b11 + ", bits 10-6: " +
                       bHigh + ", bits 5-1: " + bLow);
    System.out.println();

    dskyChanged = true;

    switch (charSelect)
    {
      case 014:
        indicators.write(in);
        break;

      case 013:
        MD1 = outConv(bHigh);
        MD2 = outConv(bLow);
        break;

      case 012:
        VD1 = outConv(bHigh);
        VD2 = outConv(bLow);
        flash = (b11 == 1);
        break;

      case 011:
        ND1 = outConv(bHigh);
        ND2 = outConv(bLow);
        break;

      case 010:
        R1D1 = outConv(bLow);
        break;
      // UPACT not implemented

      case 007:
        R1SP = b11;
        R1S = signConv(R1SP, R1SM);
        R1D2 = outConv(bHigh);
        R1D3 = outConv(bLow);
        break;

      case 006:
        R1SM = b11;
        R1S = signConv(R1SP, R1SM);
        R1D4 = outConv(bHigh);
        R1D5 = outConv(bLow);
        break;

      case 005:
        R2SP = b11;
        R2S = signConv(R2SP, R2SM);
        R2D1 = outConv(bHigh);
        R2D2 = outConv(bLow);
        break;

      case 004:
        R2SM = b11;
        R2S = signConv(R2SP, R2SM);
        R2D3 = outConv(bHigh);
        R2D4 = outConv(bLow);
        break;

      case 003:
        R2D5 = outConv(bHigh);
        R3D1 = outConv(bLow);
        break;

      case 002:
        R3SP = b11;
        R3S = signConv(R3SP, R3SM);
        R3D2 = outConv(bHigh);
        R3D3 = outConv(bLow);
        break;

      case 001:
        R3SM = b11;
        R3S = signConv(R3SP, R3SM);
        R3D4 = outConv(bHigh);
        R3D5 = outConv(bLow);
        break;
    }
  }
}
