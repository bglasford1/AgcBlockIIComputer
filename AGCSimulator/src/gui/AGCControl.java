/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class controls the flow and execution of the AGC Simulation.
            All the basic components are defined here.  Upon initialization the
            EPROMs are loaded and the clock thread is started.  The clock thread
            loops the simulation which runs the clock and therefore the memory
            cycles / timing pulse generator.  The clock thread runs continuously
            or stops periodically depending on the monitor switch settings.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package gui;

import components.*;
import enums.RuptNumber;
import enums.TpType;
import modules.*;
import enums.CpType;

import javax.swing.*;
import java.io.*;

public class AGCControl
{
  private boolean singleClock = false;

  private final ADR adr = new ADR(this);
  private final ALU alu = new ALU(this);
  private final CLK clk = new CLK(this);
  private final CPM cpm = new CPM(this);
  private final CRG crg = new CRG(this);
  private final CTR ctr = new CTR(this);
  private final DSP dsp = new DSP(this);
  private final EFM efm = new EFM(this);
  private final INT inr = new INT(this);
  private final KBD kbd = new KBD(this);
  private final MBF mbf = new MBF(this);
  private final MON mon = new MON();
  private final PAR par = new PAR(this);
  private final SCL scl = new SCL(this);
  private final SEQ seq = new SEQ(this);
  private final TPG tpg = new TPG(this);
  private final IOS ios = new IOS(this);

  private final Bus writeBus = new Bus();
  private final Bus memoryBus = new Bus();
  private final Bus axBus = new Bus();
  private final Bus lgBus = new Bus();
  private final Bus channelDataBus = new Bus();

  private final MainFrame mainFrame = new MainFrame(this);
  private MemoryDialog memoryDialog;

  // Temporary buffer for assembling H,L memory data
  private static final int[] loadBuf = new int[0x8FFF + 1];

  // Contains prefix for source filename.  i.e.: the portion of the filename before .obj or .lst
  private String filename = "agc";
  private static final String DIRECTORY_NAME =
    "/Users/bill/Documents/Bill/TTLComputers/ApolloLandingComputer/BlockII/AGC Simulator/";

  // Load the EPROMs, reset the simulation and start the clock thread.
  public void initialize()
  {
    loadSubseqEPROM();

    loadEPROM("CPM1_8.hex", CPM.eprom.EPROM1_8);
    loadEPROM("CPM9_16.hex", CPM.eprom.EPROM9_16);
    loadEPROM("CPM17_24.hex", CPM.eprom.EPROM17_24);
    loadEPROM("CPM25_32.hex", CPM.eprom.EPROM25_32);
    loadEPROM("CPM33_40.hex", CPM.eprom.EPROM33_40);
    loadEPROM("CPM41_48.hex", CPM.eprom.EPROM41_48);
    loadEPROM("CPM49_56.hex", CPM.eprom.EPROM49_56);
    loadEPROM("CPM57_64.hex", CPM.eprom.EPROM57_64);
    loadEPROM("CPM65_72.hex", CPM.eprom.EPROM65_72);

    loadMemory("Test");

    // Reset AGC which sets the opcode to 0 and stage to 1 which will trigger a GOJ1 sub-instruction.
    clk.execW_GENRST();

    genAGCStates();
    mainFrame.displayAGC();

    ClockThread clockThread = new ClockThread();
    clockThread.start();
  }

  public ADR getAdr()
  {
    return adr;
  }

  public ALU getAlu()
  {
    return alu;
  }

  public CLK getClk()
  {
    return clk;
  }

  public CPM getCpm()
  {
    return cpm;
  }

  public CRG getCrg()
  {
    return crg;
  }

  public CTR getCtr()
  {
    return ctr;
  }

  public DSP getDsp()
  {
    return dsp;
  }

  public EFM getEfm()
  {
    return efm;
  }

  public INT getInr()
  {
    return inr;
  }

  public KBD getKbd()
  {
    return kbd;
  }

  public MBF getMbf()
  {
    return mbf;
  }

  public MON getMon()
  {
    return mon;
  }

  public PAR getPar()
  {
    return par;
  }

  public SCL getScl()
  {
    return scl;
  }

  public SEQ getSeq()
  {
    return seq;
  }

  public TPG getTpg()
  {
    return tpg;
  }

  public IOS getIos()
  {
    return ios;
  }

  public Bus getWriteBus()
  {
    return writeBus;
  }

  public Bus getMemoryBus()
  {
    return memoryBus;
  }

  public Bus getAxBus()
  {
    return axBus;
  }

  public Bus getLgBus()
  {
    return lgBus;
  }

  public Bus getChannelDataBus()
  {
    return channelDataBus;
  }

  void updateDisplay()
  {
    mainFrame.displayAGC();
  }

  /**
   * Loop through all modules clocking them.
   */
  private void clkAGC()
  {
    adr.clockPulse();
    alu.clockPulse();
    clk.clockPulse();
    cpm.clockPulse();
    crg.clockPulse();
    ctr.clockPulse();
    dsp.clockPulse();
    inr.clockPulse();
    kbd.clockPulse();
    mbf.clockPulse();
    efm.clockPulse();
    par.clockPulse();
    scl.clockPulse();
    seq.clockPulse();
    tpg.clockPulse();
  }

  // Execute control pulses for the current state.
  void genAGCStates()
  {
    // Decode the current instruction sub-sequence and build a list of control pulses for this state.
    cpm.doControlPulseMatrix();

    // Execute the control pulses for this state. In the real AGC, these occur
    // simultaneously. Since we can't achieve that here, we break it down into the
    // following steps.
    // Most operations involve data transfers--usually reading data from
    // a register onto a bus and then writing that data into another register. To
    // approximate this, we first iterate through all registers to perform
    // the 'read' operation--this transfers data from register to bus.
    // Then we again iterate through the registers to do 'write' operations,
    // which move data from the bus back into the register.

    memoryBus.write(0); // clear data lines: memory bits 15-1
    writeBus.write(0);  // clear data lines: write bits 15-1
    channelDataBus.write(0);

    // Executing the pulses:
    // First, read register outputs onto the write bus or anywhere else.
    int i;
    for (i = 0; i < SEQ.MAXPULSES && seq.getControlPulse(i) != CpType.NO_PULSE; i++)
    {
      clk.doexecR(seq.getControlPulse(i));
    }

    // Perform the bus ORs
    for (i = 0; i < SEQ.MAXPULSES && seq.getControlPulse(i) != CpType.NO_PULSE; i++)
    {
      clk.doexecR_ALU_OR(seq.getControlPulse(i));
    }

    // Write the bus and any other signals into the register inputs.
    for (i = 0; i < SEQ.MAXPULSES && seq.getControlPulse(i) != CpType.NO_PULSE; i++)
    {
      clk.doexecW(seq.getControlPulse(i));
    }

    // Always execute these pulses.
    scl.doexecWP_SCL(); // Increment the SCL register.
    scl.doexecWP_F17(); // Trigger F17 timing pulse.
    scl.doexecWP_F13(); // Trigger F13 timing pulse.
    scl.doexecWP_F10(); // Trigger F10 timing pulse.
    tpg.doexecWP_TPG(); // Move to the next TPG state.

    // Turned off periodic task and added these here...
    clkAGC();
    updateAGCDisplay();

    // Clear the single step switch on TP1; in the hardware AGC, this happens when the switch is released
    if (mon.STEP && tpg.readRegisterSG() == TpType.TP1.ordinal())
    {
      mon.STEP = false;
    }

    // Turn off momentary power on switch.
    mon.PURST = true;
  }

//-----------------------------------------------------------------------
// Methods called by the MainFrame to process menu items.
//-----------------------------------------------------------------------

  // Get user input to increment a counter.
  void incrCntr()
  {
    String input = JOptionPane.showInputDialog("Increment counter: -- enter address (0-3):");
    if (input.length() > 0)
    {
      ctr.setIncrementCounter(Integer.parseInt(input));
    }
  }

  // Get user input to cause an interrupt.
  void interrupt()
  {
    String input = JOptionPane.showInputDialog("Interrupt: -- enter priority (1-6):");
    if (input.length() > 0)
    {
      inr.setRupt(RuptNumber.values()[Integer.parseInt(input)], 1);
    }
  }

  /**
   * Method to load a subsequence decode EPROM table from the EPROM file.  The EPROM file is in Motorola S-Record
   * format.
   */
  private void loadSubseqEPROM()
  {
    // Open the EPROM file.
    String filename = "Subseq.hex";
    try (BufferedReader epromReader = new BufferedReader(new FileReader(filename)))
    {
      int addressBytes = 2; // 16-bit address range
      int sumCheckBytes = 1;

      String line = epromReader.readLine();
      while (line != null)
      {
        // Every line should start with an "S", if not abort, this is the wrong file format.
        if (!line.startsWith("S"))
        {
          System.out.println("Error reading start of EPROM record for file: " + filename);
          System.exit(-1);
        }

        // Discard first record.
        if (line.startsWith("S0"))
        {
          line = epromReader.readLine();
          continue;
        }

        // Discard last record.
        if (line.startsWith("S9"))
        {
          line = epromReader.readLine();
          continue;
        }

        String byteCountString = line.substring(2, 4);
        int totalByteCount = Integer.parseInt(byteCountString, 16);

        int mySumCheck = totalByteCount & 0xff;

        String addressString = line.substring(4, 8);
        int address = Integer.parseInt(addressString, 16);

        mySumCheck = (mySumCheck + ((address & 0xFF00) >> 8)) % 256;
        mySumCheck = (mySumCheck + ((address & 0x00FF) )) % 256;

        int dataBytes = totalByteCount - addressBytes - sumCheckBytes;

        int index = (addressBytes + 2) * 2; // index to 1st databyte char.
        for (int j = 0; j < dataBytes; j++)
        {
          // get next data byte
          int data = (Integer.parseInt(line.substring(index, index + 2), 16) & 0xFF);
          mySumCheck = (mySumCheck + data) % 256;

          if (data != 0xFF)
          {
            getCpm().loadSubseqEprom(address, data);
          }

          address++;
          index += 2; // bump to next databyte char
        }

        int startCheckSum = (totalByteCount + 1) * 2;
        String checkSumString = line.substring(startCheckSum, startCheckSum + 2);
        int sumCheck = Integer.parseInt(checkSumString, 16);

        if (sumCheck != ((~mySumCheck) & 0xff))
        {
          System.out.println("sumCheck failed; file: " + filename + ", address: " + address +
                             ", sumCheck: " + sumCheck + ", mySumCheck: " + mySumCheck);
          System.exit(-1);
        }

        line = epromReader.readLine();
      }
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open file: " + filename);
      System.exit(-1);
    }
  }

  /**
   * Method to load an EPROM table from a given EPROM file.  The EPROM files are in Motorola S-Record
   * format.  If the eprom value is given then the data is loaded into the CPM module else this is
   * the AGC assembler output consisting of a high and low file, so load the data into the temporary
   * loadbuf array.  The data is then loaded into the EFM module.
   *
   * @param fileName  The name of the EPROM file.
   * @param eprom     The eprom array to load the data into.
   */
  private void loadEPROM(String fileName, CPM.eprom eprom)
  {
    // Open the EPROM file.
    try (BufferedReader epromReader = new BufferedReader(new FileReader(fileName)))
    {
      int addressBytes = 3; // 24-bit address range
      int sumCheckBytes = 1;

      String line = epromReader.readLine();
      while (line != null)
      {
        // Every line should start with an "S", if not abort, this is the wrong file format.
        if (!line.startsWith("S"))
        {
          System.out.println("Error reading start of EPROM record for file: " + fileName);
          System.exit(-1);
        }

        // Discard first record.
        if (line.startsWith("S0"))
        {
          line = epromReader.readLine();
          continue;
        }

        // Discard last record.
        if (line.startsWith("S8") || line.startsWith("S9"))
        {
          line = epromReader.readLine();
          continue;
        }

        String byteCountString = line.substring(2, 4);
        int totalByteCount = Integer.parseInt(byteCountString, 16);

        int mySumCheck = totalByteCount & 0xff;

        String addressString = line.substring(4, 10);
        int address = Integer.parseInt(addressString, 16);

        mySumCheck = (mySumCheck + ((address & 0xff0000) >> 16)) % 256;
        mySumCheck = (mySumCheck + ((address & 0x00ff00) >> 8)) % 256;
        mySumCheck = (mySumCheck + ((address & 0x0000ff) )) % 256;

        int dataBytes = totalByteCount - addressBytes - sumCheckBytes;

        int i = (addressBytes + 2) * 2; // index to 1st databyte char.
        for (int j = 0; j < dataBytes; j++)
        {
          // get next data byte
          String nextByteString = line.substring(i, i + 2);
          int data = Integer.parseInt(nextByteString, 16);
          mySumCheck = (mySumCheck + data) % 256;

          // The H/W AGC needs negative logic in the EPROMS (0=asserted)
          // but this simulator needs positive logic, so we bit flip the word.
          switch (eprom)
          {
            case None:
              break;
            case EPROM1_8:
              cpm.loadEprom1_8(address, data);
              break;
            case EPROM9_16:
              cpm.loadEprom9_16(address, data);
              break;
            case EPROM17_24:
              cpm.loadEprom17_24(address, data);
              break;
            case EPROM25_32:
              cpm.loadEprom25_32(address, data);
              break;
            case EPROM33_40:
              cpm.loadEprom33_40(address, data);
              break;
            case EPROM41_48:
              cpm.loadEprom41_48(address, data);
              break;
            case EPROM49_56:
              cpm.loadEprom49_56(address, data);
              break;
            case EPROM57_64:
              cpm.loadEprom57_64(address, data);
              break;
            case EPROM65_72:
              cpm.loadEprom65_72(address, data);
              break;
          }

          address++;
          i += 2; // bump to next databyte char
        }

        int startCheckSum = (totalByteCount + 1) * 2;
        String checkSumString = line.substring(startCheckSum, startCheckSum + 2);
        int sumCheck = Integer.parseInt(checkSumString, 16);

        if (sumCheck != ((~mySumCheck) & 0xff))
        {
          System.out.println("sumCheck failed; file: " + fileName + ", address: " + address +
                               ", sumCheck: " + sumCheck + ", mySumCheck: " + mySumCheck);
          System.exit(-1);
        }

        line = epromReader.readLine();
      }
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open file: " + fileName);
      System.exit(-1);
    }
  }

  /**
   * Method to load an EPROM table from a given EPROM file.  The EPROM files are in Motorola S-Record
   * format.  If the eprom value is given then the data is loaded into the CPM module else this is
   * the AGC assembler output consisting of a high and low file, so load the data into the temporary
   * loadbuf array.  The data is then loaded into the EFM module.
   *
   * @param fileName  The name of the EPROM file.
   */
  private void loadCodeEPROM(String fileName)
  {
    // Open the EPROM file.
    try (BufferedReader epromReader = new BufferedReader(new FileReader(fileName)))
    {
      int addressBytes = 3; // 24-bit address range
      int sumCheckBytes = 1;

      String line = epromReader.readLine();
      while (line != null)
      {
        // Every line should start with an "S", if not abort, this is the wrong file format.
        if (!line.startsWith("S"))
        {
          System.out.println("Error reading start of EPROM record for file: " + fileName);
          System.exit(-1);
        }

        // Discard first record.
        if (line.startsWith("S0"))
        {
          line = epromReader.readLine();
          continue;
        }

        // Discard last record.
        if (line.startsWith("S8") || line.startsWith("S9"))
        {
          line = epromReader.readLine();
          continue;
        }

        String byteCountString = line.substring(2, 4);
        int totalByteCount = Integer.parseInt(byteCountString, 16);

        int mySumCheck = totalByteCount & 0xff;

        String addressString = line.substring(4, 10);
        int address = Integer.parseInt(addressString, 16);

        mySumCheck = (mySumCheck + ((address & 0xff0000) >> 16)) % 256;
        mySumCheck = (mySumCheck + ((address & 0x00ff00) >> 8)) % 256;
        mySumCheck = (mySumCheck + ((address & 0x0000ff) )) % 256;

        // Adjust address
        address = address / 2;

        int dataBytes = (totalByteCount - addressBytes - sumCheckBytes) / 2;

        int i = (addressBytes + 2) * 2; // index to 1st databyte char.
        for (int j = 0; j < dataBytes; j++)
        {
          // get next data word
          String nextByteString = line.substring(i, i + 4);
          int data = Integer.parseInt(nextByteString, 16);
          mySumCheck = (mySumCheck + ((data & 0xff00) >> 8)) % 256;
          mySumCheck = (mySumCheck + ((data & 0x00ff) )) % 256;

          loadBuf[address] = data & 0xffff;

          address++;
          i += 4; // bump to next databyte char
        }

        int startCheckSum = (totalByteCount + 1) * 2;
        String checkSumString = line.substring(startCheckSum, startCheckSum + 2);
        int sumCheck = Integer.parseInt(checkSumString, 16);

        if (sumCheck != ((~mySumCheck) & 0xff))
        {
          System.out.println("sumCheck failed; file: " + fileName + ", address: " + address +
                             ", sumCheck: " + sumCheck + ", mySumCheck: " + mySumCheck);
          System.exit(-1);
        }

        line = epromReader.readLine();
      }
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open file: " + fileName);
      System.exit(-1);
    }
  }

  // Load AGC memory from the specified EPROM files
  void loadMemory(String filename)
  {
    this.filename = filename;

    loadCodeEPROM(DIRECTORY_NAME + filename + ".hex");

    // EPROM is now in loadBuf; move it to AGC memory.
    // AGC fixed memory only uses NUMBER_OF_F_BANKS banks.
    // Don't load address region 0-2048; that region is allocated to eraseable memory.
    for (int address = 2048; address < 1024 * (EFM.NUMBER_OF_F_BANKS + 1); address++)
    {
      efm.writeMemory(address, loadBuf[address]);
    }
  }

  // Get user input to set a breakpoint on a specific address.
  void setBreakpoint()
  {
    String input = JOptionPane.showInputDialog("Set Breakpoint -- enter address bb,aaaa (octal):");
    if ( input == null || input.length() == 0)
      return;

    // Convert octal string to decimal integer
    String[] pieces = input.split(",");
    if (pieces.length != 2)
    {
      JOptionPane.showMessageDialog(mainFrame, "Invalid address.", "Error", JOptionPane.ERROR_MESSAGE);
      return;
    }

    getMon().breakpointAddress = getAdr().decodeAddress(Integer.parseInt(pieces[1], 8),
                                                        (Integer.parseInt(pieces[0], 8) << 10),
                                                        0);
    getMon().breakpointEnabled = true;
    mainFrame.displayAGC();
  }

  // Get user input to examine a specific memory location.
  void examineMemory(MainFrame parent)
  {
    String input = JOptionPane.showInputDialog("Examine Memory -- enter address (octal):");
    if ( input == null || input.length() == 0)
      return;

    int address;
    if (input.contains(","))
    {
      address = getAdr().convertAddress(input);
    }
    else
    {
      address = Integer.parseInt(input, 8);
    }

    String text = "";
    for (int i = address - 10; i < address + 11; i++)
    {
      text = text + Integer.toOctalString(i) + " = " + String.format("%05o", efm.readMemory(i)) + "\n";
    }

    if (memoryDialog == null)
    {
      memoryDialog = new MemoryDialog(parent, text);
    }
    else
    {
      memoryDialog.setText(text);
      memoryDialog.setVisible(true);
    }
  }

  // Get and display source code around the currently executing instruction.
  String[] getSourceCode()
  {
    // Add the .lst extension.
    String fname = DIRECTORY_NAME + filename + ".lst";

    int maxLines = 31; // # of lines to display after selected line
    String[] outputLines = new String[maxLines];

    // Open the file containing the source code listing.
    try (BufferedReader fileReader = new BufferedReader(new FileReader(fname)))
    {
      // Get the address of the source code line to display.
      // The address we want is the current effective address is the S and bank registers.
      String CADR = adr.convertAddress(getCrg().readRegisterZ() - 1,
                                       getAdr().readRegisterFB(),
                                       getAdr().readRegisterEB());

      if (CADR.equalsIgnoreCase("0"))
        CADR = "4000";

      // Remember last 15 lines for future output.
      int lastLinesIndex = 0;
      String[] lastLines = new String[15];

      boolean found = false;
      int lineCount = 17;

      // Read through the file looking for the correct address.
      String nextline = fileReader.readLine();
      while (nextline != null)
      {
        // Get the address (CADR) from the line.
        String[] parseValues = nextline.split("\\s+");

        // If not found
        if (!found)
        {
          // If address found
          if (parseValues.length > 1 && parseValues[1].equalsIgnoreCase(CADR))
          {
            // Output last 15 lines.
            for (int i = 0; i < 15; i++)
            {
              outputLines[i] = " " + lastLines[lastLinesIndex];
              lastLinesIndex = (lastLinesIndex + 1) % 15;
            }

            // Output current line.
            outputLines[16] = ">" + nextline;
            found = true;
          }
        }
        else // found, outputting next 15 lines
        {
          // Output current line.
          outputLines[lineCount] = " " + nextline;

          lineCount++;
          if (lineCount >= maxLines)
            break;
        }

        // Save last line.
        lastLines[lastLinesIndex] = nextline;
        lastLinesIndex = (lastLinesIndex+1) % 15;

        // Get next line.
        nextline = fileReader.readLine();
      }
    }
    catch (IOException ioe)
    {
      System.out.println("*** ERROR: Can't load source list file: " + fname);
      System.exit(-1);
    }
    return outputLines;
  }

  public void setSingleClock(boolean value)
  {
    singleClock = value;
  }

  /*
   * The clock thread that cycles forever running the simulation.
   */
  private class ClockThread extends Thread
  {
    public void run()
    {
      int counter = 0;
      while (true)
      {
        // FCLK: 0 = clock is manual or slow, 1 = free running clock
        // Single clock is set when clock step button is pressed.
        if (mon.FCLK || singleClock)
        {
          do
          {
            clkAGC();
            singleClock = false;

            genAGCStates();

            counter++;
            if (counter == 150)
            {
              mainFrame.displayAGC();
              counter = 0;
            }

            try
            {
              Thread.sleep(1);
            }
            catch (InterruptedException e)
            {
              System.out.println("Sleep interrupted...");
            }

          } while (mon.FCLK);
        }

        // For convenience, clear the single step switch on TP1; in the
        // hardware AGC, this happens when the switch is released
        if (mon.STEP && tpg.readRegisterSG() == TpType.TP1.ordinal())
            mon.STEP = false;

        // Sleep a bit so as not to overload the CPU.
        try
        {
          Thread.sleep(100);
        }
        catch (InterruptedException e)
        {
          System.out.println("Sleep interrupted...");
        }
      }
    }
  }

  // Update the GUI showing the current state of the simulation.
  private void updateAGCDisplay()
  {
    if (mon.FCLK)
    {
      TpType sgValue = TpType.values()[tpg.readRegisterSG()];
      if (mon.RUN)
      {
        // update every 2 seconds at the start of a new instruction
        if (dsp.isDskyChanged())
        {
          if ((sgValue == TpType.TP12 && seq.readRegisterSNI() == 1) ||
            (sgValue == TpType.STBY) || dsp.isDskyChanged())
          {
            mainFrame.displayAGC();
            dsp.setDskyChanged(false);
          }
        }
      }
      else
      {
        if (sgValue == TpType.WAIT)
        {
          mainFrame.displayAGC();
        }
      }
    }
    else
      mainFrame.displayAGC(); // When the clock is manual or slow, always update.
  }
}
