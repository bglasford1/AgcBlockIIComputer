/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This program decodes a set of Control Pulse Matrix S-record files
            for the purpose of verifying the files were generated correctly.

  Mods:		  07/15/21 Initial Release.
*/

import enums.Instruction;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class ControlPulseMatrixDecoder
{
  private void decodeEPROMs()
  {
    // Open the EPROM files.
    try (BufferedReader eprom1_8Reader = new BufferedReader(new FileReader("CPM1_8.hex"));
         BufferedReader eprom9_16Reader = new BufferedReader(new FileReader("CPM9_16.hex"));
         BufferedReader eprom17_24Reader = new BufferedReader(new FileReader("CPM17_24.hex"));
         BufferedReader eprom25_32Reader = new BufferedReader(new FileReader("CPM25_32.hex"));
         BufferedReader eprom33_40Reader = new BufferedReader(new FileReader("CPM33_40.hex"));
         BufferedReader eprom41_48Reader = new BufferedReader(new FileReader("CPM41_48.hex"));
         BufferedReader eprom49_56Reader = new BufferedReader(new FileReader("CPM49_56.hex"));
         BufferedReader eprom57_64Reader = new BufferedReader(new FileReader("CPM57_64.hex"));
         BufferedReader eprom65_72Reader = new BufferedReader(new FileReader("CPM65_72.hex")))
    {
      // Read and decode the first lines which are a header lines.
      String line1_8 = eprom1_8Reader.readLine();
      String line9_16 = eprom9_16Reader.readLine();
      String line17_24 = eprom17_24Reader.readLine();
      String line25_32 = eprom25_32Reader.readLine();
      String line33_40 = eprom33_40Reader.readLine();
      String line41_48 = eprom41_48Reader.readLine();
      String line49_56 = eprom49_56Reader.readLine();
      String line57_64 = eprom57_64Reader.readLine();
      String line65_72 = eprom65_72Reader.readLine();

      decodeHeaderLine(line1_8, "CPM1_8.hex");
      decodeHeaderLine(line9_16, "CPM9_16.hex");
      decodeHeaderLine(line17_24, "CPM17_24.hex");
      decodeHeaderLine(line25_32, "CPM25_32.hex");
      decodeHeaderLine(line33_40, "CPM33_40.hex");
      decodeHeaderLine(line41_48, "CPM41_48.hex");
      decodeHeaderLine(line49_56, "CPM49_56.hex");
      decodeHeaderLine(line57_64, "CPM57_64.hex");
      decodeHeaderLine(line65_72, "CPM65_72.hex");

      line1_8 = eprom1_8Reader.readLine();
      line9_16 = eprom9_16Reader.readLine();
      line17_24 = eprom17_24Reader.readLine();
      line25_32 = eprom25_32Reader.readLine();
      line33_40 = eprom33_40Reader.readLine();
      line41_48 = eprom41_48Reader.readLine();
      line49_56 = eprom49_56Reader.readLine();
      line57_64 = eprom57_64Reader.readLine();
      line65_72 = eprom65_72Reader.readLine();
      // Loop assuming each file is the same size.
      while (line1_8 != null)
      {
        decodeData(line1_8, line9_16, line17_24, line25_32, line33_40, line41_48, line49_56, line57_64, line65_72);

        line1_8 = eprom1_8Reader.readLine();
        line9_16 = eprom9_16Reader.readLine();
        line17_24 = eprom17_24Reader.readLine();
        line25_32 = eprom25_32Reader.readLine();
        line33_40 = eprom33_40Reader.readLine();
        line41_48 = eprom41_48Reader.readLine();
        line49_56 = eprom49_56Reader.readLine();
        line57_64 = eprom57_64Reader.readLine();
        line65_72 = eprom65_72Reader.readLine();
      }
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open file: " + ioe.getMessage());
      System.exit(-1);
    }
  }

  private void decodeHeaderLine(String line, String filename)
  {
    // Check the first record
    if (!line.startsWith("S"))
    {
      System.out.println("Error reading start of EPROM record for file: " + filename);
      System.exit(-1);
    }

    int charCount = (Integer.parseInt(line.substring(2, 4), 16) - 3);
    String hexHeader = line.substring(8, 8 + charCount * 2);
    byte[] bytes = new byte[0];
    try
    {
      bytes = Hex.decodeHex(hexHeader.toCharArray());
    }
    catch (DecoderException e)
    {
      System.out.println("Error decoding header line in file: " + filename);
      System.exit(-1);
    }
    try
    {
      System.out.println("File: " + filename + " Header: " + new String(bytes, "UTF-8"));
    }
    catch (UnsupportedEncodingException e)
    {
      System.out.println("Error decoding header line in file: " + filename);
      System.exit(-1);
    }
  }

  private void decodeData(String line1_8, String line9_16, String line17_24, String line25_32, String line33_40,
                          String line41_48, String line49_56, String line57_64, String line65_72)
  {
    int addressBytes = 3; // 24-bit address range
    int sumCheckBytes = 1;

    String byteCountString = line1_8.substring(2, 4);
    int totalByteCount = Integer.parseInt(byteCountString, 16);

    int sumCheck1_8 = totalByteCount & 0xff;

    // Only decode one address string, the others should be the same.
    String addressString = line1_8.substring(4, 10);
    int address = Integer.parseInt(addressString, 16);

    // Only checksum the first file's line, the others should be OK.
    sumCheck1_8 = (sumCheck1_8 + ((address & 0xff0000) >> 16)) % 256;
    sumCheck1_8 = (sumCheck1_8 + ((address & 0x00ff00) >> 8)) % 256;
    sumCheck1_8 = (sumCheck1_8 + ((address & 0x0000ff) )) % 256;

    int dataBytes = totalByteCount - addressBytes - sumCheckBytes;

    int index = (addressBytes + 2) * 2; // index to 1st databyte char.
    for (int j = 0; j < dataBytes; j++)
    {
      Instruction instruction;
      try
      {
        int orderCode = getOrderCode(address);
        instruction = Instruction.getInstruction(orderCode);
        if (getStage(address) == 2)
          instruction = Instruction.STD2;
      }
      catch (ArrayIndexOutOfBoundsException e)
      {
        return;  // Unused address.
      }
      int tpg = getTPG(address);
      int stage = getStage(address);
      int opcode = getOpcode(address);
      int channelCode = getChannelCode(address);

      if (address == 012000)
      {
        System.out.println();
      }

      if (!isValid(instruction, stage, opcode, channelCode))
        return;

      // Note: tpg is not TPG, it is SG which is the TpType ordinal.  TPG = SG - 1
      if (tpg > 1 && tpg <= 14)
      {
        System.out.printf("Address: %o, type: %o, inst: %s, stage: %o, tpg: ", address, getType(address),
                         instruction.getName(), stage);
        System.out.print((tpg - 1) + "." + getBranch(address) + " Data: ");

        // Print out the data similar to what is in the ControlPulseMatrixGen for visual verification.
        parseControlPulses(Integer.parseInt(line1_8.substring(index, index + 2), 16), "1-8");
        parseControlPulses(Integer.parseInt(line9_16.substring(index, index + 2), 16), "9-16");
        parseControlPulses(Integer.parseInt(line17_24.substring(index, index + 2), 16), "17-24");
        parseControlPulses(Integer.parseInt(line25_32.substring(index, index + 2), 16), "25-32");
        parseControlPulses(Integer.parseInt(line33_40.substring(index, index + 2), 16), "33-40");
        parseControlPulses(Integer.parseInt(line41_48.substring(index, index + 2), 16), "41-48");
        parseControlPulses(Integer.parseInt(line49_56.substring(index, index + 2), 16), "49-56");
        parseControlPulses(Integer.parseInt(line57_64.substring(index, index + 2), 16), "57-64");
        parseControlPulses(Integer.parseInt(line65_72.substring(index, index + 2), 16), "65-72");
        System.out.println();
      }

      int data1_8 = Integer.parseInt(line1_8.substring(index, index + 2), 16);
      sumCheck1_8 = (sumCheck1_8 + data1_8) % 256;

      address++;
      index += 2; // bump to next databyte char
    }

    int startCheckSum = (totalByteCount + 1) * 2;
    String checkSumString = line1_8.substring(startCheckSum, startCheckSum + 2);
    int sumCheck = Integer.parseInt(checkSumString, 16);

    if (sumCheck != ((~sumCheck1_8) & 0xff))
    {
      System.out.println("sumCheck failed; file: CPM1_8.hex, address: " + address +
                         ", sumCheck: " + sumCheck + ", mySumCheck: " + sumCheck1_8);
      System.exit(-1);
    }
  }

  private void parseControlPulses(int data, String range)
  {
    data = ~data;
    if (range.equals("1-8"))
    {
      if ((data & 0x01) == 1)
        System.out.print("A2X, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("B15X, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("CI, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("CLXC, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("DVST, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("EXT, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("G2LS, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("KRPT, ");
    }
    else if (range.equals("9-16"))
    {
      if ((data & 0x01) == 1)
        System.out.print("L16, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("L2GD, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("MONEX, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("NEACOF, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("NEACON, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("NISQ, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("PIFL, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("PONEX, ");
    }
    else if (range.equals("17-24"))
    {
      if ((data & 0x01) == 1)
        System.out.print("PTWOX, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("R15, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("R1C, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("R6, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("RA, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("RAD, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("RB, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("RB1, ");
    }
    else if (range.equals("25-32"))
    {
      if ((data & 0x01) == 1)
        System.out.print("RB1F, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("RB2, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("RBBK, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("RC, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("RCH, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("RG, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("RL, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("RL10BB, ");
    }
    else if (range.equals("33-40"))
    {
      if ((data & 0x01) == 1)
        System.out.print("RQ, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("RRPA, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("RSC, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("RSCT, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("RSTRT, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("RSTSTG, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("RU, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("RUS, ");
    }
    else if (range.equals("41-48"))
    {
      if ((data & 0x01) == 1)
        System.out.print("RZ, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("ST1, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("ST2, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("STAGE, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("TL15, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("TMZ, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("TOV, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("TPZG, ");
    }
    else if (range.equals("49-56"))
    {
      if ((data & 0x01) == 1)
        System.out.print("TRSM, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("TSGN, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("TSGN2, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("TSGU, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("U2BBK, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("WA, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("WALS, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("WB, ");
    }
    else if (range.equals("57-64"))
    {
      if ((data & 0x01) == 1)
        System.out.print("WCH, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("WG, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("WL, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("WOVR, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("WQ, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("WS, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("WSC, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("WSQ, ");
    }
    else if (range.equals("65-72"))
    {
      if ((data & 0x01) == 1)
        System.out.print("WY, ");
      if (((data >> 1) & 0x01) == 1)
        System.out.print("WY12, ");
      if (((data >> 2) & 0x01) == 1)
        System.out.print("WYD, ");
      if (((data >> 3) & 0x01) == 1)
        System.out.print("WZ, ");
      if (((data >> 4) & 0x01) == 1)
        System.out.print("Z15, ");
      if (((data >> 5) & 0x01) == 1)
        System.out.print("Z16, ");
      if (((data >> 6) & 0x01) == 1)
        System.out.print("ZAP, ");
      if (((data >> 7) & 0x01) == 1)
        System.out.print("ZIP, ");
    }
  }

  private boolean isValid(Instruction instruction, int stage, int opcode, int channelCode)
  {
    if (stage == 2)
      return true;

    if (opcode == 010)
    {
      switch (channelCode)
      {
        case 0:
          return (stage == 0);
        case 1:
          return (stage == 0);
        case 2:
          return (stage == 0);
        case 3:
          return (stage == 0);
        case 4:
          return (stage == 0);
        case 5:
          return (stage == 0);
        case 6:
          return (stage == 0);
        case 7:
          return (stage == 0 || stage == 1);
      }
    }

    if (instruction == Instruction.TC)
      return (stage == 0 || stage == 1 || stage == 2);  // Stage 2 is STD2
    else if (instruction == Instruction.CCS)
      return (stage == 0);
    else if (instruction == Instruction.TCF2)
      return (stage == 0);
    else if (instruction == Instruction.TCF4)
      return (stage == 0);
    else if (instruction == Instruction.TCF6)
      return (stage == 0);
    else if (instruction == Instruction.DAS)
      return (stage == 0 || stage == 1);
    else if (instruction == Instruction.LXCH)
      return (stage == 0);
    else if (instruction == Instruction.INCR)
      return (stage == 0);
    else if (instruction == Instruction.ADS)
      return (stage == 0);
    else if (instruction == Instruction.CA)
      return (stage == 0);
    else if (instruction == Instruction.CS)
      return (stage == 0);
    else if (instruction == Instruction.NDX)
      return (stage == 0 || stage == 1 || stage == 3); // Stage 3 is RMS3
    else if (instruction == Instruction.DXCH)
      return (stage == 0 || stage == 1);
    else if (instruction == Instruction.TS)
      return (stage == 0);
    else if (instruction == Instruction.XCH)
      return (stage == 0);
    else if (instruction == Instruction.AD)
      return (stage == 0);
    else if (instruction == Instruction.MASK)
      return (stage == 0);
    else if (instruction == Instruction.DV)
      return (stage == 0 || stage == 1 || stage == 3 || stage == 4 || stage == 6 || stage == 7);
    else if (instruction == Instruction.BZF2)
      return (stage == 0);
    else if (instruction == Instruction.BZF4)
      return (stage == 0);
    else if (instruction == Instruction.BZF6)
      return (stage == 0);
    else if (instruction == Instruction.MSU)
      return (stage == 0);
    else if (instruction == Instruction.QXCH)
      return (stage == 0);
    else if (instruction == Instruction.AUG)
      return (stage == 0);
    else if (instruction == Instruction.DIM)
      return (stage == 0);
    else if (instruction == Instruction.DCA)
      return (stage == 0 || stage == 1);
    else if (instruction == Instruction.DCS)
      return (stage == 0 || stage == 1);
    else if (instruction == Instruction.NDXX)
      return (stage == 0 || stage == 1);
    else if (instruction == Instruction.SU)
      return (stage == 0);
    else if (instruction == Instruction.BZMF2)
      return (stage == 0);
    else if (instruction == Instruction.BZMF4)
      return (stage == 0);
    else if (instruction == Instruction.BZMF6)
      return (stage == 0);
    else if (instruction == Instruction.MP)
      return (stage == 0 || stage == 1 || stage == 3);
    else if (instruction == Instruction.PINC)
      return (stage == 0);
    else
      return false;
  }

  private int getBranch(int address)
  {
    return address & 0x03;
  }

  private int getTPG(int address)
  {
    return (address >> 2) & 0x0F;
  }

  private int getStage(int address)
  {
    return (address >> 6) & 0x07;
  }

  private int getOrderCode(int address)
  {
    return (address >> 9) & 0x7F;
  }

  private int getOpcode(int address)
  {
    return (address >> 12) & 0x0F;
  }

  private int getChannelCode(int address)
  {
    return (address >> 9) & 0x07;
  }

  private int getType(int address)
  {
    return (address >> 16) & 0x01;
  }

  public static void main(String[] args)
  {
    ControlPulseMatrixDecoder decoder = new ControlPulseMatrixDecoder();

    decoder.decodeEPROMs();
  }
}
