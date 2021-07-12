/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This program decodes a sub-sequence decoder S-record file
            for the purpose of verifying the file was generated correctly.

  Mods:		  07/15/21 Initial Release.
*/

import enums.Subseq;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class SubseqDecoderDecode
{
  private static final String FILENAME = "Subseq.hex";

  private void decodeEPROM()
  {
    // Open the EPROM files.
    try (BufferedReader epromReader = new BufferedReader(new FileReader("Subseq.hex")))
    {
      // Read and decode the first lines which are a header lines.
      String nextLine = epromReader.readLine();

      decodeHeaderLine(nextLine);

      nextLine = epromReader.readLine();

      // Loop assuming each file is the same size.
      while (nextLine != null)
      {
        decodeData(nextLine);

        nextLine = epromReader.readLine();
        if (nextLine.startsWith("S9"))
          break;
      }
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open file: " + ioe.getMessage());
      System.exit(-1);
    }
  }

  private void decodeHeaderLine(String line)
  {
    // Check the first record
    if (!line.startsWith("S"))
    {
      System.out.println("Error reading start of EPROM record for file: " + FILENAME);
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
      System.out.println("Error decoding header line in file: " + FILENAME);
      System.exit(-1);
    }
    try
    {
      System.out.println("File: " + FILENAME + " Header: " + new String(bytes, "UTF-8"));
    }
    catch (UnsupportedEncodingException e)
    {
      System.out.println("Error decoding header line in file: " + FILENAME);
      System.exit(-1);
    }
  }

  private void decodeData(String nextLine)
  {
    int addressBytes = 2; // 16-bit address range
    int sumCheckBytes = 1;

    String byteCountString = nextLine.substring(2, 4);
    int totalByteCount = Integer.parseInt(byteCountString, 16);

    int sumCheck = totalByteCount & 0xFF;

    // Only decode one address string, the others should be the same.
    String addressString = nextLine.substring(4, 8);
    int address = Integer.parseInt(addressString, 16);

    // Only checksum the first file's line, the others should be OK.
    sumCheck = (sumCheck + ((address & 0xFF00) >> 8)) % 256;
    sumCheck = (sumCheck + ((address & 0x00FF) )) % 256;

    int dataBytes = totalByteCount - addressBytes - sumCheckBytes;

    int index = (addressBytes + 2) * 2; // index to 1st databyte char.
    for (int j = 0; j < dataBytes; j++)
    {
      int data = (Integer.parseInt(nextLine.substring(index, index + 2), 16) & 0xFF);
      sumCheck = (sumCheck + data) % 256;

      if (data != 0xFF)
      {
        Subseq subseq = Subseq.getSubseq(data);
        System.out.printf("Enum: %s Data: %2d Address: %o", subseq.toString(), data, address);
        System.out.println();
      }

      address++;
      index += 2; // bump to next databyte char
    }

    int startCheckSum = (totalByteCount + 1) * 2;
    String checkSumString = nextLine.substring(startCheckSum, startCheckSum + 2);
    int sumCheckValue = Integer.parseInt(checkSumString, 16);

    if (sumCheckValue != ((~sumCheck) & 0xFF))
    {
      System.out.println("sumCheck failed; file: Subseq.hex, address: " + address +
                         ", sumCheck: " + sumCheckValue + ", mySumCheck: " + sumCheck);
      System.exit(-1);
    }
  }

  public static void main(String[] args)
  {
    SubseqDecoderDecode decoder = new SubseqDecoderDecode();

    decoder.decodeEPROM();
  }
}
