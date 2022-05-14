/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the Eraseable & Fixed Memory module.
            Data is read from and written to both erasable and fixed memory banks.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package modules;

import components.Register;
import enums.BusLineDesignation;
import gui.AGCControl;

public class EFM
{
  private static final int ERASABLE_BANK_SIZE = 256; // size of an erasable bank
  private static final int NUMBER_OF_E_BANKS = 8; // number of 256 word erasable memory banks
  private static final int EMEM_SIZE = ERASABLE_BANK_SIZE * (NUMBER_OF_E_BANKS + 1);

  private static final int FIXED_BANK_SIZE = 1024; // size of a fixed bank
  public  static final int NUMBER_OF_F_BANKS = 35; // number of 1024 word fixed memory banks
  private static final int FMEM_SIZE = FIXED_BANK_SIZE * (NUMBER_OF_F_BANKS + 1);

  private final Register[] register_EMEM = new Register[EMEM_SIZE]; // erasable memory
  private final Register[] register_FMEM = new Register[FMEM_SIZE + 2]; // fixed memory (lowest 2048 words ignored)

  private final BusLineDesignation convSBWG[] =
    { BusLineDesignation.SGM,
      BusLineDesignation.SGM,
      BusLineDesignation.B14,
      BusLineDesignation.B13,
      BusLineDesignation.B12,
      BusLineDesignation.B11,
      BusLineDesignation.B10,
      BusLineDesignation.B9,
      BusLineDesignation.B8,
      BusLineDesignation.B7,
      BusLineDesignation.B6,
      BusLineDesignation.B5,
      BusLineDesignation.B4,
      BusLineDesignation.B3,
      BusLineDesignation.B2,
      BusLineDesignation.B1
    };

  private final AGCControl parent;

  // Called upon class instantiation.  The memory arrays are created.
  public EFM(AGCControl parent)
  {
    this.parent = parent;

    // Create RAM registers and pre-load with zero's, parity bit set.
    int initialValue = 1 << 15;
    for (int i = 0; i < EMEM_SIZE; i++)
    {
      register_EMEM[i] = new Register(16);
      register_EMEM[i].write(initialValue);
    }

    for (int i = 0; i < FMEM_SIZE + 1; i++)
    {
      register_FMEM[i] = new Register(16);
    }
  }

  public void clockPulse()
  {
  }

  // ************************
  // Control Pulse Processing
  // ************************

  // Write into memory; parity bit is bit 16
  public void execWP_WE()
  {
    if (!parent.getAdr().GTR_1777())
    {
      int address = parent.getAdr().getAddress();
      parent.getPar().execGP();
      register_EMEM[address].write(parent.getMemoryBus().read());
      register_EMEM[address].clk(); // not a synchronous FF, so execute immediately!!!
    }
  }

  // Read memory and place results into P register.
  public void execRP_SBWG()
  {
    int address = parent.getAdr().getAddress();
    int data;

    if (parent.getAdr().GTR_1777())
    {
      data = register_FMEM[address].read();
      parent.getMemoryBus().write(data);
    }
    else
    {
      data = register_EMEM[address].read();
      // Test parity
      parent.getMemoryBus().write(data);
      parent.getPar().execTP();
      // Replace parity bit with sign bit.
      parent.getMemoryBus().write(register_EMEM[address].shiftData(register_EMEM[address].read(), convSBWG));
    }
  }

  /**
   * This method reads the memory specified by the address supplied.  This is used by the main frame
   * to display specific memory data.
   *
   * @param address The address to read.
   * @return The data at that address.
   */
  public int readMemory(int address)
  {
    if (address <= 01777) // Erasable memory
    {
      return register_EMEM[address].read();
    }
    else
    {
      return register_FMEM[address].read();
    }
  }

  /**
   * This method writes the given data to the address specified. This is used to do an initial load of
   * data.
   *
   * @param address The address to load.
   * @param data The data to load.
   */
  public void writeMemory(int address, int data)
  {
    // Address is 14 bits. This function is used by the simulator for depositing into
    // memory; it is not part of the AGC design. This function is also used to
    // initialize fixed memory.
    //************************************************************
    // This function could also write the parity into memory
    //************************************************************
    if (address <= 01777) // Erasable memory
    {
      register_EMEM[address].write(data);
      register_EMEM[address].clk(); // execute immediately
    }
    else
    {
      register_FMEM[address].write(data);
      register_FMEM[address].clk(); // execute immediately
    }
  }
}
