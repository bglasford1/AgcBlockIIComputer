This folder contains the AGC Simulator code.  This code is Java that was developed using IntelliJ Idea.

The simulator runs the code contained in a file named AGC_H.hex.  This file represents a 16-bit EPROM format that is 
produced by the YUL assembler.  It also requires the nine CPMx_y.hex file set that contains the Control Pulse Matrix
as well as the Subseq.hex file that is used to decode the subsequences.  You need to move over the .lst file from
the YUL directory and rename it to the generic agc.lst filename.  This file is used to display a block of code
around the current line of code being executed.  

All of the code is contained in the "src" directory.  I have included here the assembly output of my Test.agc code.
