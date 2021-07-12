/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class defines a register.  A register can be any size from
            1 to 16 bits.

  Mods:		  07/15/21 Initial Release.
*/

package components;

import enums.BusLineDesignation;

public class Register
{
  private int size; // bits
  private int masterVal = 0;
  private int slaveVal = 0;
  private int mask;
  private boolean load = false;

  public Register() {}

  public Register(int size)
  {
    this.size = size;
    mask = buildMask(this.size);
  }

  void setRegisterSize(int size)
  {
    this.size = size;
    mask = buildMask(this.size);
  }

  public int read()
  {
    return mask & masterVal;
//    return mask & slaveVal;
  }

  public void write(int v)
  {
    load = true;
    masterVal = mask & v;
  }

  // asynchronous clear
  public void clear()
  {
    slaveVal = 0;
    masterVal = 0;
  }

  // load is set when a register is written into.
  public void clk()
  {
    if (load)
      slaveVal = masterVal;
    load = false;
  }

  private int buildMask(int s)
  {
    int msk = 0;
    for (int i = 0; i < s; i++)
    {
      msk = (msk << 1) | 1;
    }
    return msk;
  }

  public int readMask()
  {
    return mask;
  }

  // Read a portion of a register.
  public int readField(int msb, int lsb)
  {
    return (slaveVal >> (lsb - 1)) & buildMask((msb - lsb) + 1);
  }

  // Write specific bits to a register.
  public void writeField(int msb, int lsb, int v)
  {
    load = true;
    int fmask = buildMask((msb - lsb) + 1) << (lsb - 1);
    v = (v << (lsb - 1)) & fmask;
    masterVal = (masterVal & (~fmask)) | v;
  }

  // Use a BusLineDesignator to write shifted data to a register.
  public void writeShift(int in, BusLineDesignation[] ib)
  {
    load = true;
    masterVal = shiftData(in, ib);
  }

  // Use a BusLineDesignator to shift data.
  public int shiftData(int in, BusLineDesignation[] ib)
  {
    // Iterate through each bit of the output word, copying in bits from the input
    // word and transposing bit position according to the specification (ib)
    int returnValue = 0;
    for (int i = 0; i < 16; i++)
    {
      if (ib[i] == BusLineDesignation.BX)
      {
        continue; // BX is 'don't care', so leave it alone
      }

      // Zero the output bit at 'ob', where ob specifies a bit
      // position (numbered 16-1, where 1 is lsb)
      int ob = 16 - i;
      int obmask = 1 << (ob - 1); // create mask for output bit
      returnValue &= ~obmask;

      if (ib[i] == BusLineDesignation.D0)
      {
        continue; // D0 is 'force the bit to zero'
      }

      // Copy input bit ib[i] to output bit 'ob', where ib and ob
      // specify bit positions (numbered 16-1, where 1 is lsb)
      int ibmask = 1 << (ib[i].getValue() - 1); // create mask for input bit
      int inbit = in & ibmask;

      int shift = ib[i].getValue() - ob;
      if (shift < 0)
      {
        inbit = inbit << Math.abs(shift);
      }
      else if (shift > 0)
      {
        inbit = inbit >> shift;
      }
      returnValue |= inbit;
    }
    return returnValue;
  }
}
