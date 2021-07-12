/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class class implements the memory address module that calculates
            the memory address based on the S register and the Bank registers.
            The Erasable Bank and Fixed Bank registers are combined to form the
            Both Banks register.  These are redundant and therefore in the
            hardware implementation just the Both Banks register is implemented.
            Channel 7 is implemented here.  This register contains the extension
            bit.  This implementation uses only a single bit.  The original
            computer has this as a three bit quantity, however only one of the
            bits is used.  A tempS register exists because the S register is
            typically changed in TP8 before the WE memory write occurs during
            TP10.  During TP11 the tempS register value is moved to the S register.

  Mods:		  07/15/21 Initial Release.
*/

package modules;

import components.Register;
import gui.AGCControl;

public class ADR
{
  private Register registerS      = new Register(12); // Address register (bits 1-12 of next instruction)
  private Register registerEB     = new Register(3);  // Erasable Bank register
  private Register registerFB     = new Register(16); // Fixed Bank register F FFF FF0 000 000 000
  private Register registerBB     = new Register(16); // Both Banks register: F FFF FF0 000 000 EEE
  private Register registerTempS  = new Register(12); // S changes in TP8 before the WE in TP10 occurs.
  private Register channel7       = new Register(7);  // Fixed memory extension bit: only bit 7 is used
  private boolean regSUpdatePending = false;

  private AGCControl parent;

  public ADR(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
    registerS.clk();
    registerEB.clk();
    registerFB.clk();
    registerBB.clk();
    registerTempS.clk();
    channel7.clk();
  }

  public int readRegisterS()
  {
    return registerS.read();
  }

  public int readRegisterEB()
  {
    return registerEB.read();
  }

  public int readRegisterFB()
  {
    return registerFB.read();
  }

  public int readRegisterFBShifted()
  {
    return (registerFB.read() >> 10) & 037;
  }

  public int readRegisterBB()
  {
    return registerBB.read();
  }

  public int readChannel7()
  {
    return channel7.read();
  }

  // ************************
  // Control Pulse Processing
  // ************************

  // Read Both Bank register
  void execRP_RBBK()
  {
    parent.getWriteBus().write(registerBB.read());
  }

  // Read Erasable Bank register
  void execRP_REB()
  {
    parent.getWriteBus().write(registerEB.read());
  }

  // Read Fixed Bank register
  void execRP_RFB()
  {
    parent.getWriteBus().write(registerFB.read());
  }

  // Write to Both Bank register
  void execWP_WBB()
  {
    registerBB.write(parent.getWriteBus().read());
    registerEB.write(parent.getWriteBus().read() & 07);
    registerFB.write(parent.getWriteBus().read() & 0176000);
  }

  // Write to Erasable Bank register
  void execWP_WEB()
  {
    registerEB.write(parent.getWriteBus().read() & 07);
    registerBB.write(parent.getWriteBus().read() & 07 | registerBB.read() & 0176000);
  }

  // Write to Fixed Bank register
  void execWP_WFB()
  {
    registerFB.write(parent.getWriteBus().read() & 0176000);
    registerBB.write(parent.getWriteBus().read() & 0176000 | registerBB.read() & 01777);
  }

  // Read the superbit onto the channel bus
  void execWP_RSB()
  {
    channel7.write(parent.getChannelDataBus().read());
  }

  // Write the superbit from the channel bus
  void execRP_WSB()
  {
    parent.getChannelDataBus().write(channel7.read());
  }

  // Write to tempS register.  CPM will assert internal WTS to move this temporary value to actual S register
  // if not in TP8.
  void execWP_WS()
  {
    registerTempS.write(parent.getWriteBus().read() & 07777);
    regSUpdatePending = true;
  }

  // Move the tempS value into S register if not in TP8.  If in TP8 this will be called in TP11.
  void execWP_WTS()
  {
    if (regSUpdatePending)
    {
      registerS.write(registerTempS.read());
      regSUpdatePending = false;
    }
  }

  // Check: address is not a central register.
  public boolean GTR_7()
  {
    return (registerS.read() > 007);
  }

  // Check: instruction is RESUME (INDEX 017).
  public boolean EQU_17()
  {
    return (registerS.read() == 017);
  }

  // Check: address is fixed memory.
  public boolean GTR_1777()
  {
    return (registerS.read() > 01777);
  }

  /**
   * This method takes the S register contents along with the EB and FB registers and converts them into an address
   * that can be used to index into the EPROMs.
   *
   * @return The current EPROM address.
   */
  public int getAddress()
  {
    // Memory is organized into 8 banks of 265 words of erasable memory and 34 banks of 1024 words of fixed memory.
    // The erasable banks are numbered 0-7 and the fixed banks are numbered 0-43 octal.
    return decodeAddress(registerS.read(), registerFB.read(), registerEB.read());
  }

  /**
   * This method takes a given address along with the EB and FB registers and converts them into an address
   * that can be used to index into the EPROMs.
   *
   * address The 12-bit address to decode.
   * fbBank  The FB bank value.
   * ebBank  The EB Bank value.
   *
   * @return The current EPROM address.
   */
  public int decodeAddress(int address, int fbBank, int ebBank)
  {
    // Memory is organized into 8 banks of 265 words of erasable memory and 15 banks of 1024 words of fixed memory.
    // The erasable banks are numbered 0-7 and the fixed banks are numbered 0-15.
    if (address < 00400)	// EB0: Unswitched-erasable.
    {
      return address;
    }
    else if (address < 01000)	// EB1: Unswitched-erasable (continued).
    {
      return address;
    }
    else if (address < 01400)	// EB2: Unswitched-erasable (continued).
    {
      return address;
    }
    else if (address < 02000)	// EB3-EB7: Switched-erasable.
    {
      return ((ebBank << 8) | address);
    }
    else if (address < 04000)	// FB4-FB43: Fixed-switchable.
    {
      // Account for the superbank bit.
      // If superbank bit is set and the two FB high order bits are set then add in superbank bit.
      int highOrderFBOctal = fbBank & 060000;
      if ((channel7.read() & 0100) != 0 && highOrderFBOctal == 060000)
        fbBank = (fbBank & 076000) + 020000;
    }
    else if (address < 06000)	// FB2: Fixed-fixed.
      fbBank = 2 << 10;
    else			                // FB3: Fixed-fixed (continued).
      fbBank = 3 << 10;

    return (fbBank & 0176000) | (address & 01777);
  }

  /**
   * This method takes a given address along with the EB and FB registers and converts them into an address
   * that is used by the .lst file.  Note: This is not implemented in the H/W.
   *
   * address The 12-bit address to decode.
   * fbBank  The FB bank value.
   * ebBank  The EB Bank value.
   *
   * @return The current EPROM address.
   */
  public String convertAddress(int address, int fbBank, int ebBank)
  {
    // Memory is organized into 8 banks of 265 words of erasable memory and 15 banks of 1024 words of fixed memory.
    // The erasable banks are numbered 0-7 and the fixed banks are numbered 0-15.
    if (address < 00400)	// EB0: Unswitched-erasable.
    {
      return Integer.toOctalString(address);
    }
    else if (address < 01000)	// EB1: Unswitched-erasable (continued).
    {
      return Integer.toOctalString(address);
    }
    else if (address < 01400)	// EB2: Unswitched-erasable (continued).
    {
      return Integer.toOctalString(address);
    }
    else if (address < 02000)	// EB3-EB7: Switched-erasable.
    {
      return Integer.toOctalString((ebBank << 8) | address);
    }
    else if (address < 04000)	// FB4-FB43: Fixed-switchable.
    {
      // Account for the superbank bit.
      // If superbank bit is set and the two FB high order bits are set then add in superbank bit.
      int highOrderFBOctal = fbBank & 060000;
      if ((channel7.read() & 0100) != 0 && highOrderFBOctal == 060000)
        fbBank = (fbBank & 076000) + 020000;
    }
    else if (address < 06000)	// FB2: Fixed-fixed.
      fbBank = 0;
    else			                // FB3: Fixed-fixed (continued).
      fbBank = 0;

    String returnString;
    if (fbBank != 0)
    {
      String fbValue = String.format("%02o", (fbBank >> 10) & 077);
      returnString = fbValue + "," + Integer.toOctalString(address);
    }
    else
    {
      returnString = Integer.toOctalString(address);
    }
    return returnString;
  }

  /**
   * This method takes a given address string in the assembler format and converts it into an absolute address.
   *
   * address The address string to decode.
   *
   * @return The absolute address.
   */
  public int convertAddress(String addressString)
  {
    String[] parsedPieces = addressString.split(",");
    int address = Integer.parseInt(parsedPieces[1], 8);
    int fbBank = Integer.parseInt(parsedPieces[0], 8);
    int ebBank = parent.getAdr().readRegisterEB();

    // Memory is organized into 8 banks of 265 words of erasable memory and 15 banks of 1024 words of fixed memory.
    // The erasable banks are numbered 0-7 and the fixed banks are numbered 0-15.
    if (address < 00400)	// EB0: Unswitched-erasable.
    {
      return address;
    }
    else if (address < 01000)	// EB1: Unswitched-erasable (continued).
    {
      return address;
    }
    else if (address < 01400)	// EB2: Unswitched-erasable (continued).
    {
      return address;
    }
    else if (address < 02000)	// EB3-EB7: Switched-erasable.
    {
      return (ebBank << 8) | address;
    }
    else if (address < 04000)	// FB4-FB43: Fixed-switchable.
    {
      // Account for the superbank bit.
      // If superbank bit is set and the two FB high order bits are set then add in superbank bit.
      int highOrderFBOctal = fbBank & 060000;
      if ((channel7.read() & 0100) != 0 && highOrderFBOctal == 060000)
        fbBank = fbBank | 040;

      address = address & 01777;  // These addresses are all 2000-3777 which translates into 1-1777
      fbBank = fbBank << 10;
      return fbBank | address;
    }
    else 	// FB2: Fixed-fixed.   FB3: Fixed-fixed (continued).
      return address;
  }
}
