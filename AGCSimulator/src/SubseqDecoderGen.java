/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This program builds a sub-sequence decoder matrix file in Motorola S-Record
            format.  This file is used by the AGC Simulator to simplify the decoding
            of machine code instructions into sub-sequences.  This file ultimately
            reduces the chip count and complexity of the hardware implementation.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

import enums.Subseq;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * The input to the matrix is the extend bit, the opcode, the quarter code, the channel code and the stage value.
 * The output is a number that represents the positional notation of the subsequence.  See Subseq enum type.
 *
 * There are 54 subsequences that are being implemented.  This requires 6 bits which can represent 64 values.
 *
 * The input value or index into the matrix requires 10 bits defined as follows:
 * EOOOQQCSSS where E = the EXTEND bit, OOO = the 3 bit opcode, QQ = the 2 bit quarter code, C = the channel bit and
 * SSS = the 3 bit stage.  If in the definition a bit is defined as X = don't care, a 0 is put in its place.
 *
 * The EPROM needs to be at least 2048 x 8 bit.  This is built for MM2716Q chip.
 */
public class SubseqDecoderGen
{
  private final Map<Integer, Subseq> valueMap = new HashMap<>();

  private void initialize()
  {
    valueMap.put(0000, Subseq.TC0);        // 0 000 xxx 000
    valueMap.put(0002, Subseq.STD2);       // x xxx xxx 010 The only valid subsequence for stage = 2
    valueMap.put(0100, Subseq.CCS0);       // 0 001 00x 000
    valueMap.put(0120, Subseq.TCF0);       // 0 001 nnx 000  nn = 1
    valueMap.put(0140, Subseq.TCF0);       // 0 001 nnx 000  nn = 2
    valueMap.put(0160, Subseq.TCF0);       // 0 001 nnx 000  nn = 3
    valueMap.put(0200, Subseq.DAS0);       // 0 010 00x 000
    valueMap.put(0201, Subseq.DAS1);       // 0 010 00x 001
    valueMap.put(0220, Subseq.LXCH0);      // 0 010 01x 000
    valueMap.put(0240, Subseq.INCR0);      // 0 010 10x 000
    valueMap.put(0260, Subseq.ADS0);       // 0 010 11x 000
    valueMap.put(0300, Subseq.CA0);        // 0 011 xxx 000
    valueMap.put(0400, Subseq.CS0);        // 0 100 xxx 000
    valueMap.put(0500, Subseq.NDX0);       // 0 101 00x 000
    valueMap.put(0501, Subseq.NDX1);       // 0 101 00x 001
    valueMap.put(0503, Subseq.RSM3);       // 0 101 00x 003
    valueMap.put(0520, Subseq.DXCH0);      // 0 101 01x 000
    valueMap.put(0521, Subseq.DXCH1);      // 0 101 01x 001
    valueMap.put(0540, Subseq.TS0);        // 0 101 10x 000
    valueMap.put(0560, Subseq.XCH0);       // 0 101 11x 000
    valueMap.put(0600, Subseq.AD0);        // 0 110 xxx 000
    valueMap.put(0700, Subseq.MSK0);       // 0 111 xxx 000
    valueMap.put(01000, Subseq.READ0);     // 1 000 000 000
    valueMap.put(01010, Subseq.WRITE0);    // 1 000 001 000
    valueMap.put(01020, Subseq.RAND0);     // 1 000 010 000
    valueMap.put(01030, Subseq.WAND0);     // 1 000 011 000
    valueMap.put(01040, Subseq.ROR0);      // 1 000 100 000
    valueMap.put(01050, Subseq.WOR0);      // 1 000 101 000
    valueMap.put(01060, Subseq.RXOR0);     // 1 000 110 000
    valueMap.put(01070, Subseq.RUPT0);     // 1 000 111 000
    valueMap.put(01071, Subseq.RUPT1);     // 1 000 111 001
    valueMap.put(01100, Subseq.DV0);       // 1 001 00x 000
    valueMap.put(01101, Subseq.DV1);       // 1 001 00x 001
    valueMap.put(01103, Subseq.DV3);       // 1 001 00x 011
    valueMap.put(01104, Subseq.DV4);       // 1 001 00x 100
    valueMap.put(01106, Subseq.DV6);       // 1 001 00x 110
    valueMap.put(01107, Subseq.DV7);       // 1 001 00x 111
    valueMap.put(01120, Subseq.BZF0);      // 1 001 nnx 000  nn = 1
    valueMap.put(01140, Subseq.BZF0);      // 1 001 nnx 000  nn = 2
    valueMap.put(01160, Subseq.BZF0);      // 1 001 nnx 000  nn = 3
    valueMap.put(01200, Subseq.MSU0);      // 1 010 00x 000
    valueMap.put(01220, Subseq.QXCH0);     // 1 010 01x 000
    valueMap.put(01240, Subseq.AUG0);      // 1 010 10x 000
    valueMap.put(01260, Subseq.DIM0);      // 1 010 11x 000
    valueMap.put(01300, Subseq.DCA0);      // 1 011 xxx 000
    valueMap.put(01301, Subseq.DCA1);      // 1 011 xxx 001
    valueMap.put(01400, Subseq.DCS0);      // 1 100 xxx 000
    valueMap.put(01401, Subseq.DCS1);      // 1 100 xxx 001
    valueMap.put(01500, Subseq.NDXX0);     // 1 101 xxx 000
    valueMap.put(01501, Subseq.NDXX1);     // 1 101 xxx 001
    valueMap.put(01600, Subseq.SU0);       // 1 110 00x 000
    valueMap.put(01620, Subseq.BZMF0);     // 1 110 nnx 000  nn = 1
    valueMap.put(01640, Subseq.BZMF0);     // 1 110 nnx 000  nn = 2
    valueMap.put(01660, Subseq.BZMF0);     // 1 110 nnx 000  nn = 3
    valueMap.put(01700, Subseq.MP0);       // 1 111 xxx 000
    valueMap.put(01701, Subseq.MP1);       // 1 111 xxx 001
    valueMap.put(01703, Subseq.MP3);       // 1 111 xxx 011
    valueMap.put(01770, Subseq.PINC);      // 1 111 111 000    This was arbitrary
    valueMap.put(01777, Subseq.NO_SEQ);    // 1 111 111 111    This was arbitrary
  }

  /**
   * This writes a file using the Motorola S-Record format.  There are three data records based on the address size.
   * The smallest address record is 16-bits which is more than enough.
   */
  private void writeEPROM()
  {
    // EPROM byte arrays that contain the bytes (in ints) of data to write.
    int epromMemSize = 0x800; // # of cells in a 16-bit address range
    String filename = "Subseq.hex";

    try (PrintWriter epromWriter = new PrintWriter(new FileWriter(filename)))
    {
      int maxBytes = 19; // set limit on record length = 12 hex
      int addressBytes = 2; // 16-bit address range = 3 bytes or 6 characters
      int sumCheckBytes = 1;

      int maxdata = maxBytes - addressBytes - sumCheckBytes;

      int i; // current EPROM address
      int sumCheck;

      // ***********************************************
      // Write starting S0 record.  The address is zero.
      int length = 3 + filename.length();
      epromWriter.printf("S0%02X0000", length);

      sumCheck = length; // byte count of address (2) + data (header) + checksum (1).
      i = 0; // set address zero for first record
      sumCheck = (sumCheck + ((i & 0xFF00) >> 8)) % 256;
      sumCheck = (sumCheck + ((i & 0x00FF) )) % 256;

      // Write the header as the data field.
      for (int nextChar = 0; nextChar < filename.length(); nextChar++)
      {
        char nextCharacter = filename.charAt(nextChar);
        epromWriter.printf("%h", nextCharacter);
        sumCheck = (sumCheck + nextCharacter) % 256;
      }

      epromWriter.printf("%02X\n", (~sumCheck) & 0xFF);

      // ***********************************************
      // Write the data fields.
      while (i < epromMemSize)
      {
        // get dataByteCount; the number of bytes of EPROM data per record.
        int dataByteCount = maxdata;
        if (i + dataByteCount >= epromMemSize)
        {
          dataByteCount = epromMemSize - i;
        }

        // S-record Format (*** 2 byte address assumed ***)
        //   Each record always starts with the letter "S" followed by the record type,
        //     in this case a "1" is always used.  S1 translates into a 16-bit address.
        //   The next two characters are the remaining bytes in hex (character pairs) in this record
        //     to include the address, data and Checksum.  To get the total # of characters convert to decimal
        //     then double it and subtract 2+6.  In our case 14 = 20 * 2 = 40 - 8 = 32 characters of data.
        //   The address is 4 characters followed by the data, in this case all data is 32 characters.
        //   The checksum is always 2 characters or one byte in hex format.
        //   The record is then followed by a character return and line feed.
        // The last record is a termination record of format S9, bytes to follow = 03 and a 4 character address,
        // followed by a 2 byte checksum.
        int totalByteCount = dataByteCount + addressBytes + sumCheckBytes;
        epromWriter.printf("S1%02X%04X", totalByteCount, i);

        // Checksum is the least significant byte of the ones complement of the sum of the byte
        // values of the pairs of characters making up the total bytes, address bytes and data bytes.
        // The total byte count and address bytes are summed here.  The data is added a chunk at a time below.
        sumCheck = totalByteCount & 0xFF;
        sumCheck = (sumCheck + ((i & 0xFF00) >> 8)) % 256;
        sumCheck = (sumCheck + ((i & 0x00FF))) % 256;

        // Write data bytes into record
        for (int j = 0; j < dataByteCount; j++)
        {
          Subseq data = valueMap.get(i + j);
          if (data != null)
          {
            epromWriter.printf("%02X", data.ordinal());
            sumCheck = (sumCheck + data.ordinal()) % 256;
            System.out.printf("Address: %o Subseq: %s Data: %d", (i + j), data.toString(), data.ordinal());
            System.out.println();
          }
          else
          {
            epromWriter.printf("%02X", 0xFF);
            sumCheck = (sumCheck + 0xFF) % 256;
          }
        }

        // Terminate last record by adding the least significant byte of the one's compliment of the checksum
        // and a newline.
        epromWriter.printf("%02X\n", (~sumCheck) & 0xff);

        i += dataByteCount;
      }

      // ***********************************************
      // Write an end-of-file record.
      sumCheck = 0x03; // byte count is always 03.
      // Address is always 0000
      epromWriter.printf("S9030000%02X\n", (~sumCheck) & 0xFF);
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open required file...");
      System.exit(-1);
    }
  }

  public static void main(String[] args)
  {
    SubseqDecoderGen generator = new SubseqDecoderGen();
    generator.initialize();
    generator.writeEPROM();
  }
}
