Overview: 

The schematics have been drawn in a free tool called KiCad that seems to be the drawing tool of choice at this time.  In Ronald's words, its the software that all the cool kids are using.  Having never used one of these tools before I have found it to be easy to use and widely supported.  

The design depends in part on a high level hardware configuration.  This configuration depends on a number of factors.  First, it should be compact.  Second, all the debug LEDs and switches should be visible and accessible.  Third, is the consideration of the interconnects between the boards.  The design by John Pultora took into consideration the interconnects and they are minimal.  However it was anything but compact.  There is another implementation by Alessandro Cinquemani who stacked the logic boards behind the LED boards and combined two of the sub-systems.  This is significantly more compact.  

I chose to combine all the LEDs and switches into a single display board and stacked the logic boards behind the display board.  The only sub-system that is broken out into its own board set is the DSKY which I call the I/O sub-system.  For this board stack, the DSKY LEDs, switches and indicators are on the front board with the remaining logic stacked behind on a single board.  Only two cables (16 bit and 20 bit) are required between the I/O assembly and the other board stack.  

A single power supply supplies power to all the boards.  A backplane is constructed so that the logic boards are interchangeable.  This is so that the logic board under test can be placed in the rear slot for easy debugging access.  

Subsystems:

The modules are grouped into closely related functional sets called sub-systems.  The modules are grouped to limit the interconnections between sub-systems and the functionality in terms of chip count is evenly divided among physical hardware boards.  

There are five sub-systems; Control (CTL), Processing (PROC), Memory (MEM), Display (DISP) and I/O (the DSKY).  The Control sub-system contains the CLK, SCL, TPG, SEQ, and CPM modules.  The Processing sub-system contains the ALU and CRG modules.  The Memory sub-system contains the EFM, MBF, PAR, ADR, INT and CTR modules.  The Display sub-system contains the MON module along with all the LEDs and switches from the Control, Processing and Memory sub-systems.  The I/O sub-system encapsulates the DSKY functionality and contains the KBD and DSP modules. 

In KiCad I have created one project per sub-system.  The sheets are named using sub-system acronym followed by module acronym.  If a module needs to be broken into more than one sheet, then a sub-module name/acronym is created.  An example is the Memory sub-system's Addressing module contains a Bank sub-module with a name of MEM-ADR-BNK.  This sheet contains the bank registers and associated control pulse logic and bus drivers.
