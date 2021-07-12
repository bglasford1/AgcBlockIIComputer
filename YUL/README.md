This assembler is a modification of Ronald S. Burkey's yaYUL assembler.  I hacked the main code by commenting out various output options 
to get it to output the Motorola S-Record format.  I need to go back and clean this up so I am only adding code and not commenting out
code.  

The code, when run with a command line argument of the file to compile, outputs a file called AGC_H.hex.  Again, I need to modify the code
so that it accepts a "--SRec" before the filename and outputs a file with the original filename and simply change the extension to .hex.  
The original portions of the code will output .lst and .symtab files.  If you are compiling the Test.agc code that I have provided here, 
the compiler will output three files: AGC_H.hex, Test.agc.lst adn Test.agc.symtab.  

To recreate this assembler, take the original yaYUL from https://github.com/virtualagc/virtualagc/tree/master/yaYUL and add the two files
I modified here.  
