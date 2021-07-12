This folder contains the AGC Simulator code.  This code is Java that was developed using IntelliJ Idea.

The simulator runs the code contained in a file named AGC_H.hex.  This file represents a 16-bit EPROM format that is 
produced by the YUL assembler.  It also requires the nine CPMx_y.hex file set that contains the Control Pulse Matrix
as well as the Subseq.hex file that is used to decode the subsequences.  You need to move over the .lst file from
the YUL directory and rename it to the generic agc.lst filename.  This file is used to display a block of code
around the current line of code being executed.  

All of the code is contained in the "src" directory.  I have included the assembly output of the Test.agc code here
for ease of execution.

CPM EPROM Generator:

The Control Pulse Matrix EPROM generator takes the control pulse matrix as defined in the R-700 document and generates a set of Motorola S-record files used to burn a series of EPROMs.  The original computer used a diode matrix to implement this data.  The data is organized by address as defined above in the Control Pulse Matrix module definition.  The data is burned into the EPROMs in a 1's compliment format.   Because each EPROM can contain an 8-bit byte per address, nine EPROMs are required.  The first EPROM contains control signals 1-8.  The second EPROM contains control signals 9-16 and so on.  The control signal numbers are defined in the Control Pulse table above.  

This program outputs nine files containing records in the Motorola S-format. These files are used to burn the nine EPROMs required by the computer and are read into the software simulator.  

Sub-Sequence Decoder EPROM Generator:

The Sub-sequence Decoder EPROM generator takes the opcode of an instruction along with the stage value as an address and outputs the corresponding sub-sequence value.  This approach reduced the chip count. 

This program outputs a Motorola S-format file. This file is used to burn an EPROM required by the computer and is read into the software simulator.  

AGC Simulator:

The simulator simulates the computer at a hardware level.  The EPROM files; code, control pulse matrix and sub-sequence decoder are read into the simulator.  The code is executed by replicating all the hardware components such as registers, buses, interrupts, control pulses, etc.  There is a control panel that displays many internal items such as registers and buses along with switches that can control the execution of the code by stepping through each instruction, subsequence or timing pulse.  This capability will be built into the replica computer so the actual hardware can be tested at the same level. 

Low level hardware components such as registers and buses are abstracted into their own classes.  Each module is contained within its own class.  The control of hardware components is via control pulses which are method calls into the various module classes.  The user interface is via a main panel, similar to how the hardware will operate except the registers and buses contain octal numbers versus LED lights.  

The simulator, just like the actual hardware, starts up in standby mode.  The power-on button needs to be pressed to start stepping the simulator through the TPG states.  There is a help screen that defines the various buttons and how to get the simulator started.  

Not only does the simulator execute the actual AGC code, it also evolved a GUI debugging capability which is ultimately reflected in the hardware implementation.  At first it was good enough to see the register and bus values as you stepped the machine through the timing pulses of the test code.  Once the basic instructions were working it was time to run the actual AGC code.  Running the actual code helped in understanding the architecture of the code.  Given the number of instructions involved, the ability to set breakpoints was imperative.  I created three types of breakpoints; break on an interrupt, break on a counter overflow and break at a specific address.  This allowed me to set a breakpoint and let the code free run until a specific action or location was reached.  At that point I could resume stepping through instructions.  

There are some instructions that are not fully tested by running the actual code.  I wrote a test program using the actual instruction set and the yaYUL assembler to test specific instructions to their fullest.  For the multiply and divide I used the examples in the following document.

APOLLO GUIDANCE COMPUTER Information Series ISSUE 32, 
BLOCK II MACHINE INSTRUCTIONS  
FR-2 - 132    

This document was invaluable in understanding and testing the instructions.  Note that there are a few errors in the multiply and divide examples.  Within the actual AGC code I found test code for the CYR, CYL, SR and EDOP shift/rotate registers that I incorporated into my test code.  I also included instructions that I had not yet encountered in the AGC code.  These are AUG, DIM, SU, MSU and DCS.   The success/failure of each test is output to the DSKY 7-segment LEDs.  Each digit displays either a 1 or 0 for success/failure.  The code to accomplish all this utilizes many of the other instructions.   
