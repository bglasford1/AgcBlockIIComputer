This assembler is a modification of Ronald S. Burkey's yaYUL assembler.  I added an option to output the binary executable in a Motorola
S-Record format by adding the "--rom" option to the command line.  The two files modified are yaYUL.c and yaYUL.h

The code, when run with a command line argument containing --rom and the file to compile, the program outputs a file with a .hex extension.
The original code outputs .lst and .symtab files.  If you are compiling the Test.agc code that I have provided here, 
the compiler will output three files: Test.hex, Test.agc.lst adn Test.agc.symtab.  

To recreate this assembler, take the original yaYUL from https://github.com/virtualagc/virtualagc/tree/master/yaYUL and add the two files
I modified here.  Notice that Ron is actively modifying this code.  This is based on a version dated May 27, 2021.
