# AgcBlockIIComputer
This is a software/hardware implementation of the Apollo Guidance Computer Block II computer using TTL chips.

This project extends the work of Ronald Burkey who has created an extensive collection of NASA documents, original source code, 
an assembler and a software based simulator.  This project also extends the work of John Pultorak who created a physical implementation 
of the AGC Block I computer using TTL chips.  There are other AGC Block II projects using either VHDL or 3-input XOR chips.  As far I as 
I can tell, this is the only project to implement an AGC Block II using TTL chips.

The overall steps include 
    1) understanding the overall design of the AGC, 
    2) building a hardware based software simulator, 
    3) creating hardware diagrams and
    4) building the actual hardware.
    
The overall design is contained in the Wiki pages.  The hardware based simulator and hardware diagrams are contained within the code
section.  

A test program named Test.agc was created to test the more complex instructions such as multiply and divide.  The output
of each test segment is placed in one of the DSKY 7-segment numbers.  A 1 indicates success where as a 0 indicates failure.

The compiler created by Ronald Burkey was modified to output a file in Motorola S-Record format.  These files are used as input
to the simulator and used to burn EPROMs for the physical hardware.  The compiler also outputs a .lst file and .symtab file.
The original code version I am using is the Luminary 099 which landed men on the moon during Apollo 11.  All the original code
compiles as "MAIN".  The S-Record file is named MAIN.hex.  

The simulator is written in Java, the most used high level, object oriented language that is free, open source and platform independant.
There are a number of free IDEs available including Eclipse and IntelliJ Idea.  This simulator was developed using IntelliJ Idea, 
however Eclipse is just as good.  
