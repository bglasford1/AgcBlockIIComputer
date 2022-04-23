/*
 * Copyright 2003-2005,2009-2010,2016-2018 Ronald S. Burkey <info@sandroid.org>
 *
 * This file is part of yaAGC.
 *
 * yaAGC is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * yaAGC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with yaAGC; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Filename:	yaYUL.c
 * Purpose:	This is an assembler for Apollo Guidance Computer (AGC)
 * 		assembly language.  It is called yaYUL because the original
 * 		assembler was called YUL, and this "yet another YUL".
 * Contact:	Ron Burkey <info@sandroid.org>
 * Website:	www.ibiblio.org/apollo/index.html
 * Mods:	04/11/03 RSB.	Began.
 *		07/03/04 RSB.	Now writes the binary file, but does not
 * 				yet compute the bugger words.  This is
 * 				principally useful as a temporary measure
 * 				to allow me to assemble Validation.s,
 * 				which doesn't use the bugger words.
 * 		07/04/04 RSB	Now returns non-zero if there are fatal
 * 				errors in assembly.
 * 		07/07/04 RSB	Added the predefined symbol "$7".
 * 		07/26/04 RSB	Added --force.
 * 		07/30/04 RSB	Added terminating bugger words to banks.
 * 		08/12/04 RSB	Added NVER.
 *		05/14/05 RSB	Corrected website reference.
 * 		07/27/05 JMS	(04/30/05) Write symbol table to binary file
 * 				with --g flag.
 * 		07/28/05 RSB	Made --g the default.  Still accepts the
 * 				--g switch, but it doesn't do anything.
 * 		07/28/05 JMS    Added support for writing SymbolLines_to to symbol
 * 				table file.
 * 		03/17/09 RSB	Make sure there's no .bin file produced on error.
 * 		06/06/09 RSB	Corrected the address offsets printed in the
 * 				bugger word table.  (Was printing addresses like
 * 				33,1777 rather than 33,3777.)
 * 		06/27/09 RSB	Added some stuff for HtmlOut.  Don't know yet if
 * 				it will actually go anywhere, or if I'm just
 * 				messing around.
 * 		07/25/09 RSB	Began adding the --block1 feature.  Since there's
 * 				mostly source-level compatibility, the way
 * 				I'm *trying* to do this is to just basically
 * 				do a normal assembly but to substitute different
 * 				binary codes at the final step and to limit
 * 				the memory size differently.  I'm sure I'll
 * 				have to add additional tweaks as I go along.
 * 		02/20/10 RSB	Added --unpound-page.
 * 		08/18/16 RSB    Various stuff related to --block1.
 * 		08/21/16 RSB    Now outputs the correct number of banks for --block1.
 * 		08/23/16 RSB	Corrected the address offsets used for block 1 in the
 * 				bugger-word table at the end of the listing.  Also,
 * 				for block 2, yaYUL automatically adds the two
 * 				extra pre-bugger-word address indicators, but in
 * 				block 1 these appear explicitly in the code, so
 * 				if yaYUL were to do it they would appear twice,
 * 				and the bugger words would be wrong as well.
 * 		09/26/16 RSB	Added the --blk2 switch.  I think it may be complete,
 * 				but won't be sure until I can assembly the actual
 * 				Aurora.
 * 		2016-10-05 JL	Added -syntax switch. This just checks the syntax
 * 				and does not attempt symbol resolution. This is intended for 
 * 				proofing.
 * 		2016-10-20 RSB  Restored the TC SELF exception for --blk2 bugger-word
 * 		                processing, which I had added above and then removed.
 * 		2016-10-21 RSB  Added --flip switch.  --flip=7 is needed for Aurora12.
 * 		                Added a fix by Harmuth Gutsche to account for the fact
 * 		                that fatal errors would defeat a forced save of
 * 		                the generated rope.
 *              2016-11-01 RSB  No longer generates checksums for empty banks.
 *              2016-11-02 RSB  Added --yul and --trace.  Now continues doing symbol-resolution
 *                              passes with the pass() function, not merely until all symbols
 *                              are resolved, but until the value of no symbol changes during
 *                              a pass.  Otherwise, there was a theoretical possibility,
 *                              depending on the order in which EQUALS or = appear, that a
 *                              symbol could be resolved but have the wrong value.  This
 *                              possibility became a reality in Artemis072 when some fixes
 *                              to EQUALS/= needed for Sunburst120 were made.
 *              2016-11-14 RSB  Added --to-yul.
 *              2016-12-18 MAS  Added --no-checksums.
 *              2017-01-29 MAS  Added --raytheon.
 *              2017-01-30 MAS  Split parity bit calculation into a separate array that is
 *                              updated on the fly during assembly. This prevents parity
 *                              bits from being generated for unused words. Also added a
 *                              --parity flag which generates parity but does *not* swap
 *                              the bank order.
 *              2017-06-04 MAS  Repositioned the parity bit from bit 1 to bit 15 for
 *                              --hardware, based on new information from ND-1021042.
 *              2017-06-17 MAS  Added --early-sbank, which simulates the behavior of
 *                              earlier (pre-1967) versions of YUL when it comes to
 *                              superbank bits.
 *              2017-06-18 MAS  Added --pos-checksums
 *              2017-08-31 RSB	Added stuff associated with --debug.
 *              2017-09-20 RSB	Gave --hardware type parity priority over --parity (since
 *                            	builds with "--hardware --parity" was giving hardware-
 *                            	incompatible binaries).
 *             	2018-10-12 RSB  Added stuff associated with --simulation.
 */

#include "yaYUL.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

//#define VERSION(x) #x

//-------------------------------------------------------------------------
// Some global data.

int debugLevel = 0;
int debugPass = 0;
int debugLine = 0;
char *debugLineString = "";
void
debugPrint(char *msg)
{
  printf("Debug (%d,%d) %s: %s\n", debugPass, debugLine, msg, debugLineString);
}

// *** Added WTG *** //
int rom = 0;
char *RomFilename = NULL;
FILE *RomFile = NULL;
int sumCheck;
int maxBytes = 20; // set limit on record length = 14 hex
int addressBytes = 3; // 16-bit address range = 3 bytes or 6 characters
int sumCheckBytes = 1;
int maxdata;
// *** Added WTG *** //

int formatOnly = 0;
int toYulOnly = 0, toYulOnlySequenceNumber;
Line_t toYulOnlyLogSection;
int syntaxOnly = 0;
int Force = 0;
char *InputFilename = NULL, *OutputFilename = NULL;
//FILE *InputFile = NULL;
FILE *OutputFile = NULL;
static int NoChecksums = 0;
static int Parity = 0;
static int Hardware = 0;
int posChecksums = 0;
int asYUL = 0, trace = 0;
int Simulation = 0;

static Address_t RegEB = REG(03);
static Address_t RegFB = REG(04);
static Address_t RegZ = REG(05);
static Address_t RegBB = REG(06);
static Address_t RegZeroes = REG(07);
static Address_t RegBRUPT = REG(017);

//-------------------------------------------------------------------------
// The following two utility functions are used in computing the bank
// checksums, and were simply copied from Oct2Bin.c.

// Convert an AGC-format signed integer to native format.
static int
AgcToNative(uint16_t n)
{
  int i;
  i = n;
  if (0 != (n & 040000))
    i = -(077777 & ~i);
  return (i);
}

// This function takes two signed integers in AGC format, adds them, and returns
// the sum (also in AGC format).  If there's overflow or underflow, the
// carry is added in also.  This is done because that's the goofy way the
// AGC checksum is created.
int
Add(int n1, int n2)
{
  int i1, i2, Sum;
  // Convert from AGC 1's-complement format to the native integer format of this CPU.
  i1 = AgcToNative(n1);
  i2 = AgcToNative(n2);
  // Add 'em up.
  Sum = i1 + i2;
  // Account for carry or underflow.
  if (Sum > 16383)
    {
      Sum -= 16384;
      Sum++;
    }
  else if (Sum < -16383)
    {
      Sum += 16384;
      Sum--;
    }
  // The following condition can't occur, but I'll check for it anyway.
  //if (Sum > 16383 || Sum < -16383)
  //  printf ("Arithmetic overflow.\n");
  // Convert back to 1's-complement and return.
  if (Sum >= 0)
    return (Sum);
  return (077777 & ~(-Sum));
}

//-------------------------------------------------------------------------
// The main program.

int
main(int argc, char *argv[])
{
  int MaxPasses = 10;
  int RetVal = 1, i, j, k, LastUnresolved, Fatals = 0, Warnings = 0;
  extern int UnpoundPage;

  // JMS: OutputSymbols = 1 to output a symbol table to SymbolFile.
  // RSB: Jordan made this an option, but I think it should be the default.
  int OutputSymbols = 1;	// 0;
  char *SymbolFile = NULL;

  // Parse the command-line options.
  for (i = 1; i < argc; i++)
    {
      if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "/?"))
        goto Done;
      else if (1 == sscanf(argv[i], "--debug=%d", &j))
	debugLevel = j;
      else if (1 == sscanf(argv[i], "--max-passes=%d", &j))
        MaxPasses = j;
      else if (!strcmp(argv[i], "--pos-checksums"))
        posChecksums = 1;
      else if (!strcmp(argv[i], "--force"))
        Force = 1;
      else if (!strcmp(argv[i], "--g"))
        OutputSymbols = 1;
      else if (!strcmp(argv[i], "--html"))
        Html = 1;
      else if (!strcmp(argv[i], "--unpound-page"))
        UnpoundPage = 1;
      else if (!strcmp(argv[i], "--yul"))
        asYUL = 1;
      else if (!strcmp(argv[i], "--trace"))
        trace = 1;
      else if (!strcmp(argv[i], "--block1"))
        {
          Block1 = 1;
          assemblyTarget = "BLK1";
        }
      else if (!strcmp(argv[i], "--early-sbank"))
        {
          EarlySBank = 1;
        }
      else if (!strcmp(argv[i], "--raytheon"))
        {
          Raytheon = 1;
        }
      else if (!strcmp(argv[i], "--blk2"))
        {
          blk2 = 1;
          posChecksums = 1;
          assemblyTarget = "BLK2";
        }
      else if (!strcmp(argv[i], "--no-checksums"))
        NoChecksums = 1;
      else if (!strcmp(argv[i], "--hardware"))
        Hardware = 1;
      else if (!strcmp(argv[i], "--parity"))
        Parity = 1;
      else if (!strcmp(argv[i], "--format"))
        formatOnly = 1;
      else if (!strcmp(argv[i], "--syntax"))
        {
          syntaxOnly = 1;
          formatOnly = 0;
          Html = 0;
          MaxPasses = 3;
          OutputSymbols = 0;
        }
      else if (2 == sscanf(argv[i], "--to-yul=%d,%[^\n]", &j, toYulOnlyLogSection))
        {
          toYulOnly = 1;
          toYulOnlySequenceNumber = j;
        }
      else if (!strcmp(argv[i], "--simulation"))
	Simulation = 1;
// *** Added WTG *** //
      else if (!strcmp(argv[i], "--rom"))
        {
          rom = 1;
        }
// *** Added WTG *** //
      else if (*argv[i] == '-' || *argv[i] == '/')
        {
          printf("Unknown switch \"%s\".\n", argv[i]);
          goto Done;
        }
      else if (InputFilename == NULL)
        {
          InputFilename = argv[i];
          OutputFilename = (char *) malloc(5 + strlen(InputFilename));
          if (OutputFilename == NULL)
            {
              printf("Out of memory (1).\n");
              goto Done;
            }
          sprintf(OutputFilename, "%s.bin", InputFilename);
          //InputFile = fopen (InputFilename, "r");
          //if (InputFile == NULL)
          //  {
          //    printf ("Input file does not exist.\n");
          //    goto Done;
          //  }
          OutputFile = fopen(OutputFilename, "wb");
          if (OutputFile == NULL)
            {
              printf("Cannot create output file.\n");
              goto Done;
            }
            
// *** Added WTG *** //
          if (rom)
          {
              RomFilename = malloc(strlen(argv[i]) + 5);
              strcpy(RomFilename,argv[i]);
              strcat(RomFilename,".hex");
              RomFile = fopen(RomFilename, "wb");
              if (RomFile == NULL)
              {
                  printf("Cannot create .hex file.\n");
                  goto Done;
              }
          }
// *** Added WTG *** //

        }
      else
        {
          printf("Two input files defined.\n");
          goto Done;
        }
    }

  if (formatOnly || toYulOnly)
    {
      Pass(0, InputFilename, NULL, &Fatals, &Warnings);
      return (0);
    }

  printf("Apollo Guidance Computer (AGC) assembler, version " NVER
  ", built " __DATE__ ", target %s\n", assemblyTarget);
  printf("(c)2003-2005,2009-2010,2016-2018 Ronald S. Burkey\n");
  printf(
      "Refer to http://www.ibiblio.org/apollo/index.html for more information.\n");

  if (InputFilename == NULL || OutputFile == NULL)
    goto Done;
  if (Html)
    {
      if (HtmlCreate(InputFilename))
        goto Done;
    }

  // Perform a preliminary pass, whose sole purpose is to identify
  // all symbols defined in the program.
  SymbolPass(InputFilename);
  // Also, define all register names.
  // ... Later:  It turns out that the Luminary or Colossus source code
  // defines any registers it needs, so this step isn't required.
  // I use the following symbols, which I don't allow the source to define.
  AddSymbol("$3");
  AddSymbol("$4");
  AddSymbol("$5");
  AddSymbol("$6");
  AddSymbol("$7");
  AddSymbol("$17");
  if (Block1)
    {
      AddSymbol("$16");
      AddSymbol("$25");
      AddSymbol("$5777");
    }

  // Sort the symbol table, or else we won't be able to locate the
  // symbols later.
  Fatals += SortSymbols();

  // Assign the registers their proper addresses.
  if (!Block1)
    {
      EditSymbol("$3", &RegEB);
      EditSymbol("$4", &RegFB);
      EditSymbol("$5", &RegZ);
      EditSymbol("$6", &RegBB);
      EditSymbol("$7", &RegZeroes);
      EditSymbol("$17", &RegBRUPT);
    }
  else
    {
      Address_t Location3 = REG(03);
      Address_t Location4 = REG(04);
      Address_t Location5 = REG(05);
      Address_t Location6 = REG(06);
      Address_t Location7 = REG(07);
      Address_t Location16 = REG(016);
      Address_t Location17 = REG(017);
      Address_t Location25 = REG(025);
      Address_t Location5777 = FIXEDADD(05777);
      EditSymbol("$3", &Location3);
      EditSymbol("$4", &Location4);
      EditSymbol("$5", &Location5);
      EditSymbol("$6", &Location6);
      EditSymbol("$7", &Location7);
      EditSymbol("$16", &Location16);
      EditSymbol("$17", &Location17);
      EditSymbol("$25", &Location25);
      EditSymbol("$5777", &Location5777);
    }

  // Perform all compiler passes. What happens is that we keep
  // running passes until all defined symbols have known values.
  // Then we do one final pass to actually generate object code.
  // At the end of each pass we do a check, and if some symbols
  // are still not resolved, we bump LAST_PASS upward.  I'm sure
  // there's a more mathematically sophisticated way to do this,
  // but it's not worth the effort to figure it out.

  LastUnresolved = UnresolvedSymbols();

  for (i = 1; i <= MaxPasses; i++)
    {
      debugPass = i;
      printf("Pass #%d\n", i);
      j = Pass(0, InputFilename, OutputFile, &Fatals, &Warnings);
      k = UnresolvedSymbols();
      if (j == -1)
        {
          printf("Unrecoverable error.\n");
          break;
        }
      if ((k == 0 || k >= LastUnresolved) && numSymbolsReassigned == 0)
        {
	  debugPass++;
          printf("Pass #%d\n", i + 1);
          Pass(1, InputFilename, OutputFile, &Fatals, &Warnings);
          break;
        }
      LastUnresolved = k;
      //PrintSymbols ();
    }

  if (syntaxOnly)
    {
      printf("Fatal errors:  %d\n", Fatals);
      printf("Warnings:  %d\n", Warnings);
      return (Fatals);
    }

  // Print the symbol table.
  printf("\n\n");
  PrintBankCounts();
  printf("\n\n");
  PrintSymbols();
  printf("\nUnresolved symbols:  %d\n", UnresolvedSymbols());
  printf("Fatal errors:  %d\n", Fatals);
  printf("Warnings:  %d\n", Warnings);
  if (HtmlOut != NULL)
    {
      fprintf(HtmlOut, "\n");
      fprintf(HtmlOut, "</pre>\n<h1>Assembly Status</h1>\n<pre>\n");
      fprintf(HtmlOut, "Unresolved symbols:  %d\n", UnresolvedSymbols());
      fprintf(HtmlOut, "Fatal errors:  %d\n", Fatals);
      fprintf(HtmlOut, "Warnings:  %d\n", Warnings);
      fprintf(HtmlOut, "\n");
      fprintf(HtmlOut, "</pre>\n<h1>Bugger Words</h1>\n<pre>\n");
    }

  // JMS: 07.28
  // We sort the lines by increasing physical address so we can look them
  // up later.
  SortLines(SORT_YUL);

  // JMS: Print the symbol table to a binary file if we want to
  if (OutputSymbols)
    {
      SymbolFile = (char *) malloc(8 + strlen(InputFilename));
      if (SymbolFile == NULL)
        {
          printf("Out of memory (2).\n");
          goto Done;
        }
      sprintf(SymbolFile, "%s.symtab", InputFilename);
      WriteSymbolsToFile(SymbolFile);
    }

  // Output the executable object code.
  if (Fatals == 0 || Force)
    {
// *** Added WTG *** //
        // Output the binary data in a Motorola S-Record format.
        if (rom)
        {
            maxdata = maxBytes - addressBytes - sumCheckBytes;

            // Output the header record.
            char header[] = "AGC";
            int headerLength = strlen(header);

            int length = 3 + headerLength;
            fprintf(RomFile, "S0%02x0000", length);

            sumCheck = length; // byte count of address (2) + data (header) + checksum (1).
            // Don't need to add the address to the checksum as it is always zero.
              
            // Write the header as the data field.
            char hexValue[4];
            for (int nextChar = 0; nextChar < headerLength; nextChar++)
            {
              sprintf(hexValue, "%02X", header[nextChar]);

              fprintf(RomFile, "%s", hexValue);
              sumCheck = (sumCheck + (int)(header[nextChar])) % 256;
            }

            int checksum = (~sumCheck & 0xff);
            fprintf(RomFile, "%02x\n", checksum);
        }
// *** Added WTG *** //

      int BankRaw, Bank, Offset, Value;
      uint16_t Bugger, GuessBugger;

      printf("\n");
      for (BankRaw = (Block1 ? 1 : 0); BankRaw < (Block1 ? 035 : 044);
          BankRaw++)
        {
// *** Added WTG *** //
            if (rom)
            {
                // S-record Format:
                //   Each record always starts with the letter "S" followed by the record type,
                //     in this case a "2" is always used.  S2 translates into a 24-bit address.
                //   The next two characters are the remaining bytes in hex (character pairs) in this
                //     record to include the address, data and Checksum.  To get the total # of
                //     characters convert to decimal then double it and subtract 2+6.  In our case
                //     14 = 20 * 2 = 40 - 8 = 32 characters of data.
                //   The address is 6 characters followed by the data, in this case all data is 32
                //     characters.
                //   The checksum is always 2 characters or one byte in hex format.
                //   The record is then followed by a character return and line feed.
                // The last record is a termination record of format S8, bytes to follow = 04 and
                // a 6 character address, followed by a checksum.
                int dataWordCount = 0;
                int addr;
                int value;
                Offset = 0;
                while (Offset < 02000)
                {
                    // Get dataByteCount, the number of words of EPROM data per record.
                    dataWordCount = maxdata;
                    if ((Offset + dataWordCount) >= 02000)
                    {
                      dataWordCount = 02000 - Offset;
                    }
                    int totalByteCount = dataWordCount * 2 + addressBytes + sumCheckBytes;
                    addr = (BankRaw * 02000 + Offset) * 2;
                    fprintf(RomFile, "S2%02x%06x", totalByteCount, addr);

                    // Checksum is the least significant byte of the ones complement of the sum of the
                    // byte values of the pairs of characters making up the total bytes, address bytes
                    // and data bytes.  The total byte count and address bytes are summed here.  The
                    // data is added a chunk at a time below.
                    sumCheck = totalByteCount & 0xff;
                    sumCheck = (sumCheck + ((addr & 0xff0000) >> 16)) % 256;
                    sumCheck = (sumCheck + ((addr & 0x00ff00) >> 8)) % 256;
                    sumCheck = (sumCheck + ((addr & 0x0000ff) )) % 256;

                    // Output the binary data.
                    // write data bytes into record
                    for (int j = 0; j < dataWordCount; j++)
                    {
                        value = (ObjectCode[BankRaw][Offset + j]) & 0xffff;
                        fprintf(RomFile, "%04x", value);
                        sumCheck = (sumCheck + ((value & 0xff00) >> 8)) % 256;
                        sumCheck = (sumCheck + ((value & 0x00ff) )) % 256;
                    }

                    // Terminate record by adding the least significant byte of the one's compliment of
                    // the checksum and a newline.
                    fprintf(RomFile, "%02x\n", (~sumCheck & 0xff));

                    Offset += dataWordCount;
                }
            }
// *** Added WTG *** //
            
          // Compute the actual bank number.
          Bank = BankRaw;
          if (Bank < 4 && !Hardware && !Block1)	// flip-flop 0,1 with 2,3 when not building for hardware targets
            Bank ^= 2;
          // Add bugger info to the bank.
          if (!NoChecksums)
            {
              if (Block1)
                {
                  if (Bank == 0)
                    Offset = 02000;
                  else if (Bank == 1)
                    Offset = 04000;
                  else
                    Offset = 06000;
                }
              else
                {
                  if (Bank == 2)
                    Offset = 04000;
                  else if (Bank == 3)
                    Offset = 06000;
                  else
                    Offset = 02000;
                }
              Value = GetBankCount(Bank);
              if (Value > 0)
                {
                  if (!Block1 && !blk2)
                    {
                      if (Value < 01776)
                        {
                          ObjectCode[Bank][Value] = Value + Offset;
                          Parities[Bank][Value] = CalculateParity(Value + Offset);
                          Value++;
                        }
                      if (Value < 01777)
                        {
                          ObjectCode[Bank][Value] = Value + Offset;
                          Parities[Bank][Value] = CalculateParity(Value + Offset);
                          Value++;
                        }
                    }
                  if (Value < 02000)
                    {
                      for (Bugger = Offset = 0; Offset < Value; Offset++) {
                        Bugger = Add(Bugger, ObjectCode[Bank][Offset]);
                      }
                      if ((0 == (040000 & Bugger)) || posChecksums)
                        GuessBugger = Add(Bank, 077777 & ~Bugger);
                      else
                        GuessBugger = Add(077777 & ~Bank, 077777 & ~Bugger);
                      ObjectCode[Bank][Value] = GuessBugger;
                      Parities[Bank][Value] = CalculateParity(GuessBugger);
                      printf("Bugger word %05o at %02o,%04o.\n", GuessBugger, Bank,
                          (Block1 ? 06000 : 02000) + Value);
                      if (HtmlOut != NULL)
                        fprintf(HtmlOut, "Bugger word %05o at %02o,%04o.\n",
                            GuessBugger, Bank, (Block1 ? 06000 : 02000) + Value);
                    }
                }
            }
          // Output the binary data.
          for (Offset = 0; Offset < 02000; Offset++)
            {
              Value = ObjectCode[Bank][Offset] << 1;

              // Add in the parity bits if requested
              if (Hardware)
                // The AGC hardware used bit 15 for parity
                Value = (Value & 0100000)  |
                        (Parities[Bank][Offset] << 14) |
                        ((Value & 077776) >> 1);
              else if (Parity)
                // yaAGC uses bit position 1 for parity
                Value |= Parities[Bank][Offset];

              fputc(Value >> 8, OutputFile);
              fputc(Value, OutputFile);
            }
        }
    }
    
// *** Added WTG *** //
    if (rom)
      {
        // write an end-of-file record here
        sumCheck = 0x03; // byte count is always 03.
        // address is always 0000
        fprintf(RomFile, "S9030000%02x\n", (~sumCheck & 0xff));
      }
// *** Added WTG *** //

  // All done!
  RetVal = 0;
  Done:
  //if (InputFile != NULL)
  //  fclose (InputFile);
  if (OutputFile != NULL)
    fclose(OutputFile);
// *** Added WTG *** //
  if (RomFile != NULL)
    fclose(RomFile);
// *** Added WTG *** //
  HtmlClose();
  if (RetVal)
    {
      printf("USAGE:\n"
          "\tyaYUL [OPTIONS] InputFile\n"
          "The output (binary executable) always has the same name\n"
          "as the assembly-language input file, except that .bin is \n"
          "appended to it.  (E.g., Luminary.agc->Luminary.agc.bin.)\n"
          "No relocatable object-file output format is provided,\n"
          "because the original development team had no such\n"
          "capability, and so there is no linker.\n\n"
          "The assembly listing, including symbol table and any error\n"
          "messages appear on the standard output.\n\n"
          "OPTIONS:\n");
      printf("--help or /?     Display this message.\n");
      printf("--max-passes=n   By default, the assembler makes at most\n"
          "                 %d passes trying to resolve addresses.\n"
          "                 This switch changes that value.\n", MaxPasses);
      printf("--force          Force creation of core-rope image. (By\n"
          "                 default, the core-rope is not created if\n"
          "                 there were fatal errors during assembly.\n");
      //printf ("--g              Output the binary symbol table to the file\n"
      //        "                 InputFile.symtab\n");
      printf("--html           Causes an HTML file to be created, which is \n"
          "                 the same as the output listing except that it\n"
          "                 if a lot more convenient to use. It has syntax\n"
          "                 highlighting and hyperlinks from where each\n"
          "                 symbol is used back to where it was defined.\n"
          "                 The top-level HTML file produced is named the\n"
          "                 same as the input source file, except with .html\n"
          "                 replacing .s (if applicable).  Separate HTML\n"
          "                 files are produced for all source files included\n"
          "                 with the $ directive, and links between the files\n"
          "                 are provided.\n");
      printf("--unpound-page   Bypass --html processing for \"## Page\".\n");
      printf(
          "--block1         Assembles Block 1 code.  The default is Block 2.\n");
      printf(
          "--blk2           For the early version of Block 2 code, such as\n");
      printf(
          "                 in the AURORA program.  Not used for Block 2 in\n");
      printf(
          "                 general, though, and not for any flown missions.\n");
      printf(
          "                 The default (omitting both --block1 and --blk2)\n");
      printf(
          "                 is correct for almost all surviving AGC software.\n");
      printf(
          "                 Implies --pos-checksums.\n");
      printf(
          "--pos-checksums  Calculate checksums using BLK2 style, in which all\n");
      printf(
          "                 checksums must be equal to the positive bank number.\n");
      printf(
          "                 This is implied by --blk2, but is also needed for\n");
      printf(
          "                 early AGC programs (Sunburst 116 and earlier).\n");
      printf(
          "--early-sbank    Assembles the code using the original (pre-1967)\n");
      printf(
          "                 YUL superbank behavior.\n");
      printf(
          "--raytheon       Assembles Raytheon-style code.  The default is MIT.\n");
      printf("--no-checksums   Don't emit bank checksums. For use with Retread 44.\n");
      printf("--parity         Enable parity bit calculation.\n");
      printf("--hardware       Emit binary with hardware bank order. Also implies\n"
          "                 --parity.\n");
      printf(
          "--format         Just reformat the file and re-output. Don't assemble.\n");
      printf(
          "--syntax         Perform syntax-checking only, no symbol resolution.\n");
      printf(
          "--max-passes     Set the max number of assembler passes (default: 10).\n");
      printf(
          "                 words\" that lead to bank checksums equal to B (where B\n");
      printf(
          "                 is the fixed-bank number, in octal).  However, bank checksums\n");
      printf(
          "                 equal to -B (in 1's complement) are also valid.  This option\n");
      printf(
          "                 is used to instruct yaYUL to use the -B bugger word for bank B.\n");
      printf("                 Multiple --flip options can be used.\n");
      printf("--yul            Assemble as YUL rather than GAP.  Has no effect at present.\n");
      printf("--trace          Trace some of yaYUL's internal activity, for debugging.\n");
      printf("--to-yul=S,L     Processes a single input file in .agc format, outputting\n");
      printf("                 an equivalent .yul file on stdout.  S (a decimal number\n");
      printf("                 is the initial card-sequence number.  L (a string) is the\n");
      printf("                 name of the log section to use as a P-card.\n");
      printf("--simulation     Reacts to the string -SIMULATION and +SIMULATION in comments.\n");
      printf("--rom            Generate an output file in Motorola S-Record format suitable\n");
      printf("                 for burning the binary executable into an EPROM.\n");
    }
  if ((RetVal || Fatals) && !Force)
    remove(OutputFilename);
  if (RetVal == 0)
    return (Fatals);
  else
    return (RetVal);
}

