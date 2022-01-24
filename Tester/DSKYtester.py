import RPi.GPIO as GPIO
import time
import sys

CHDIR = 0
CH1 = 2
CH2 = 3
CH3 = 4
CH4 = 5
CH5 = 6
CH6 = 7
CH7 = 8
CH8 = 9
CH9 = 10
CH10 = 11
CH11 = 12
CH12 = 13
CH13 = 14
CH14 = 15
CH15 = 16
CLK1 = 17
CLK2 = 18
CLK3 = 19
DISP = 20
INDC = 21
KBD1 = 22
KBSTR = 23
RPRO = 24
STBY = 25
RESET = 26
PALM = 27

def configGPIOforOutput():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(CHDIR, GPIO.OUT)
    GPIO.setup(CH1, GPIO.OUT)
    GPIO.setup(CH2, GPIO.OUT)
    GPIO.setup(CH3, GPIO.OUT)
    GPIO.setup(CH4, GPIO.OUT)
    GPIO.setup(CH5, GPIO.OUT)
    GPIO.setup(CH6, GPIO.OUT)
    GPIO.setup(CH7, GPIO.OUT)
    GPIO.setup(CH8, GPIO.OUT)
    GPIO.setup(CH9, GPIO.OUT)
    GPIO.setup(CH10, GPIO.OUT)
    GPIO.setup(CH11, GPIO.OUT)
    GPIO.setup(CH12, GPIO.OUT)
    GPIO.setup(CH13, GPIO.OUT)
    GPIO.setup(CH14, GPIO.OUT)
    GPIO.setup(CH15, GPIO.OUT)
    GPIO.setup(CLK1, GPIO.OUT)
    GPIO.setup(CLK2, GPIO.OUT)
    GPIO.setup(CLK3, GPIO.OUT)
    GPIO.setup(DISP, GPIO.OUT)
    GPIO.setup(INDC, GPIO.OUT)
    GPIO.setup(KBD1, GPIO.OUT)
    GPIO.setup(KBSTR, GPIO.IN)
    GPIO.setup(RPRO, GPIO.OUT)
    GPIO.setup(STBY, GPIO.OUT)
    GPIO.setup(RESET, GPIO.OUT)
    GPIO.setup(PALM, GPIO.OUT)

def configGPIOforInput():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(CHDIR, GPIO.OUT)
    GPIO.setup(CH1, GPIO.IN)
    GPIO.setup(CH2, GPIO.IN)
    GPIO.setup(CH3, GPIO.IN)
    GPIO.setup(CH4, GPIO.IN)
    GPIO.setup(CH5, GPIO.IN)
    GPIO.setup(CH6, GPIO.IN)
    GPIO.setup(CH7, GPIO.IN)
    GPIO.setup(CH8, GPIO.IN)
    GPIO.setup(CH9, GPIO.IN)
    GPIO.setup(CH10, GPIO.IN)
    GPIO.setup(CH11, GPIO.IN)
    GPIO.setup(CH12, GPIO.IN)
    GPIO.setup(CH13, GPIO.IN)
    GPIO.setup(CH14, GPIO.IN)
    GPIO.setup(CH15, GPIO.IN)
    GPIO.setup(CLK1, GPIO.OUT)
    GPIO.setup(CLK2, GPIO.OUT)
    GPIO.setup(CLK3, GPIO.OUT)
    GPIO.setup(DISP, GPIO.OUT)
    GPIO.setup(INDC, GPIO.OUT)
    GPIO.setup(KBD1, GPIO.OUT)
    GPIO.setup(KBSTR, GPIO.IN)
    GPIO.setup(RPRO, GPIO.OUT)
    GPIO.setup(STBY, GPIO.OUT)
    GPIO.setup(RESET, GPIO.OUT)
    GPIO.setup(PALM, GPIO.OUT)

def resetPins():
    GPIO.output(DIR, 1) # Dir: 0 = input, 1 = output
    GPIO.output(CH1, 0)
    GPIO.output(CH2, 0)
    GPIO.output(CH3, 0)
    GPIO.output(CH4, 0)
    GPIO.output(CH5, 0)
    GPIO.output(CH6, 0)
    GPIO.output(CH7, 0)
    GPIO.output(CH8, 0)
    GPIO.output(CH9, 0)
    GPIO.output(CH10, 0)
    GPIO.output(CH11, 0)
    GPIO.output(CH12, 0)
    GPIO.output(CH13, 0)
    GPIO.output(CH14, 0)
    GPIO.output(CH15, 0)
    GPIO.output(CLK1, 0)
    GPIO.output(CLK2, 0)
    GPIO.output(CLK3, 0)
    GPIO.output(DISP, 1)
    GPIO.output(INDC, 1)
    GPIO.output(KBD1, 1)
    GPIO.output(RPRO, 0) # Active High
    GPIO.output(STBY, 1)
    GPIO.output(RESET, 1)
    GPIO.output(PALM, 0) # Active High

def setRLYWD(bit15, bit14, bit13, bit12):
    GPIO.output(CH12, bit12)
    GPIO.output(CH13, bit13)
    GPIO.output(CH14, bit14)
    GPIO.output(CH15, bit15)

# To write to indicators, set INDC low, then CLK2 high/low, then INDC high
def indicatorWrite():
    GPIO.output(INDC, 0)
    GPIO.output(CLK2, 1)
    GPIO.output(CLK2, 0)
    GPIO.output(INDC, 1)

# To write to display, set DISP low, then CLK2 high/low, then CLK3 high/low, then DISP high
def displayWrite():
    GPIO.output(DISP, 0)
    GPIO.output(CLK2, 1)
    GPIO.output(CLK2, 0)
    GPIO.output(CLK3, 1)
    GPIO.output(CLK3, 0)
    GPIO.output(DISP, 1)

def setDisplayBitsHigh(bit5, bit4, bit3, bit2, bit1):
    GPIO.output(CH6, bit1)
    GPIO.output(CH7, bit2)
    GPIO.output(CH8, bit3)
    GPIO.output(CH9, bit4)
    GPIO.output(CH10, bit5)

def setDisplayBitsLow(bit5, bit4, bit3, bit2, bit1):
    GPIO.output(CH1, bit1)
    GPIO.output(CH2, bit2)
    GPIO.output(CH3, bit3)
    GPIO.output(CH4, bit4)
    GPIO.output(CH5, bit5)

# This sets either the high (1) or low (0) digit with the number provided.
def setDisplayDigits(number, loc):
    if (number == 0):
        if (loc == 0):
            setDisplayBitsHigh(1, 0, 1, 0, 1) # 10101
        else:
            setDisplayBitsLow(1, 0, 1, 0, 1)
    elif (number == 1):
        if (loc = 0):
           setDisplayBitsHigh(0, 0, 0, 1, 1) # 00011
       else:
            setDisplayBitsLow(0, 0, 0, 1, 1)
    elif (number == 2):
        if (loc = 0):
            setDisplayBitsHigh(1, 1, 0, 0, 1) # 11001
       else:
             setDisplayBitsLow(1, 1, 0, 0, 1)
    elif (number == 3):
        if (loc = 0):
            setDisplayBitsHigh(1, 1, 0, 1, 1) # 11011
       else:
            setDisplayBitsLow(1, 1, 0, 1, 1)
    elif (number == 4):
         if (loc = 0):
           setDisplayBitsHigh(0, 1, 1, 1, 1) # 01111
       else:
            setDisplayBitsLow(0, 1, 1, 1, 1)
    elif (number == 5):
        if (loc = 0):
            setDisplayBitsHigh(1, 1, 1, 1, 0) # 11110
       else:
            setDisplayBitsLow(1, 1, 1, 1, 0)
    elif (number == 6):
        if (loc = 0):
            setDisplayBitsHigh(1, 1, 1, 0, 0) # 11100
       else:
            setDisplayBitsLow(1, 1, 1, 0, 0)
    elif (number == 7):
        if (loc = 0):
            setDisplayBitsHigh(1, 0, 0, 1, 1) # 10011
       else:
            setDisplayBitsLow(1, 0, 0, 1, 1)
    elif (number == 8):
        if (loc = 0):
            setDisplayBitsHigh(1, 1, 1, 0, 1) # 11101
       else:
            setDisplayBitsLow(1, 1, 1, 0, 1)
    elif (number == 9):
       if (loc = 0):
            setDisplayBitsHigh(1, 1, 1, 1, 1) # 11111
       else:
            setDisplayBitsLow(1, 1, 1, 1, 1)
    elif (number == -1):
        if (loc = 0):
            setDisplayBitsHigh(0, 0, 0, 0, 0) # 00000
       else:
            setDisplayBitsLow(0, 0, 0, 0, 0)

def displayAllDigits():
    # Loop through the relay words.
    setRLYWD(0, 0, 0, 1) # 0001
    displayWrite()
    setRLYWD(0, 0, 1, 0) # 0010
    displayWrite()
    setRLYWD(0, 0, 1, 1) # 0011
    displayWrite()
    setRLYWD(0, 1, 0, 0) # 0100
    displayWrite()
    setRLYWD(0, 1, 0, 1) # 0101
    displayWrite()
    setRLYWD(0, 1, 1, 0) # 0110
    displayWrite()
    setRLYWD(0, 1, 1, 1) # 0111
    displayWrite()
    setRLYWD(1, 0, 0, 0) # 1000
    displayWrite()
    setRLYWD(1, 0, 0, 1) # 1001
    displayWrite()
    setRLYWD(1, 0, 1, 0) # 1010
    displayWrite()
    setRLYWD(1, 0, 1, 1) # 1011
    displayWrite()

def decodeKeyPress(bit1, bit2, bit3, bit4, bit5):
    if (bit5 == 0 and bit4 == 0 and bit3 == 0 and bit2 == 0 and bit1 == 1):
        return 1
    elif (bit5 == 0 and bit4 == 0 and bit3 == 0 and bit2 == 1 and bit1 == 0):
        return 2
    elif (bit5 == 0 and bit4 == 0 and bit3 == 0 and bit2 == 1 and bit1 == 1):
        return 3
    elif (bit5 == 0 and bit4 == 0 and bit3 == 1 and bit2 == 0 and bit1 == 0):
        return 4 
    elif (bit5 == 0 and bit4 == 0 and bit3 == 1 and bit2 == 0 and bit1 == 1):
        return 5
    elif (bit5 == 0 and bit4 == 0 and bit3 == 1 and bit2 == 1 and bit1 == 0):
        return 6
    elif (bit5 == 0 and bit4 == 0 and bit3 == 1 and bit2 == 1 and bit1 == 1):
        return 7
    elif (bit5 == 0 and bit4 == 1 and bit3 == 0 and bit2 == 0 and bit1 == 0):
        return 8
    elif (bit5 == 0 and bit4 == 1 and bit3 == 0 and bit2 == 0 and bit1 == 1):
        return 9
    elif (bit5 == 1 and bit4 == 0 and bit3 == 0 and bit2 == 0 and bit1 == 0):
        return 0
    elif (bit5 == 1 and bit4 == 0 and bit3 == 0 and bit2 == 0 and bit1 == 1):
        return 21
    elif (bit5 == 1 and bit4 == 0 and bit3 == 0 and bit2 == 1 and bit1 == 0):
        return 22
    elif (bit5 == 1 and bit4 == 1 and bit3 == 0 and bit2 == 0 and bit1 == 1):
        return 31
    elif (bit5 == 1 and bit4 == 1 and bit3 == 0 and bit2 == 1 and bit1 == 0):
        return 32
    elif (bit5 == 1 and bit4 == 1 and bit3 == 0 and bit2 == 1 and bit1 == 1):
        return 33
    elif (bit5 == 1 and bit4 == 1 and bit3 == 1 and bit2 == 0 and bit1 == 0):
        return 34
    elif (bit5 == 1 and bit4 == 1 and bit3 == 1 and bit2 == 1 and bit1 == 0):
        return 36
    elif (bit5 == 1 and bit4 == 1 and bit3 == 1 and bit2 == 1 and bit1 == 1):
        return 37
    else:
        return -1
 

#-------------- main --------------

configGPIOforOutput()
resetPins()

while True:
    command = input("Enter Command: ")

    if (command == 0):
       GPIO.cleanup()
       sys.exit()

    elif (command == 1):
       # Reset to low, CLK2 pulse, reset to high
       print ("Perform a Restart:")
       GPIO.output(RESET, 0)
       GPIO.output(CLK2, 1)
       GPIO.output(CLK2, 0)
       GPIO.output(RESET, 1)

    elif (command == 2):
       print ("Running Display Test:")

       # Loop through the digits; 0-9, sending commands.
       setDisplayDigits(0, 0)
       setDisplayDigits(0, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(1, 0)
       setDisplayDigits(1, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(2, 0)
       setDisplayDigits(2, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(3, 0)
       setDisplayDigits(3, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(4, 0)
       setDisplayDigits(4, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(5, 0)
       setDisplayDigits(5, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(6, 0)
       setDisplayDigits(6, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(7, 0)
       setDisplayDigits(7, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(8, 0)
       setDisplayDigits(8, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(9, 0)
       setDisplayDigits(9, 1)
       displayAllDigits()
       time.sleep(1)
       setDisplayDigits(-1, 0)
       setDisplayDigits(-1, 1)
       displayAllDigits()

       # Send the commands to set sign bits to "-"
       GPIO.output(CH11, 1)
       setRLYWD(0, 1, 1, 0)
       displayWrite()
       time.sleep(1)
       setRLYWD(0, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       setRLYWD(0, 0, 0, 1)
       displayWrite()
       time.sleep(1)

       # Send commands to clear sign bits.
       GPIO.output(CH11, 0)
       setRLYWD(0, 1, 1, 0)
       displayWrite()
       setRLYWD(0, 1, 0, 0)
       displayWrite()
       setRLYWD(0, 0, 0, 1)
       displayWrite()

       # send the commands to set sign bits to "+"
       GPIO.output(CH11, 1)
       setRLYWD(0, 1, 1, 1)
       displayWrite()
       time.sleep(1)
       setRLYWD(0, 1, 0, 1)
       displayWrite()
       time.sleep(1)
       setRLYWD(0, 0, 1, 0)
       displayWrite()
       time.sleep(1)

       # Send commands to clear sign bits.
       GPIO.output(CH11, 0)
       setRLYWD(0, 1, 1, 1)
       displayWrite()
       setRLYWD(0, 1, 0, 1)
       displayWrite()
       setRLYWD(0, 0, 1, 0)
       displayWrite()


    elif (command == 3):
       print ("Running Indicator Test:")

       # First set all the channel bus bits to zero.
       resetPins()

       # Light Uplink Activity light
       GPIO.output(CH3, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH3, 0)

       # Light Temp light
       GPIO.output(CH4, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH4, 0)

       # Light No ATT light
       GPIO.output(CH4, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH4, 0)

       # Light Gimbal Lock light
       GPIO.output(CH6, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH6, 0)

       # Light PROG light
       GPIO.output(CH9, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH9, 0)

       # Light Key Rel light
       GPIO.output(CH5, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH5, 0)

       # Light Opr Err light
       GPIO.output(CH7, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH7, 0)

       # Light Tracker light
       GPIO.output(CH8, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH8, 0)

       # Light Alt light
       GPIO.output(CH5, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH5, 0)

       # Light Vel light
       GPIO.output(CH3, 1)
       setRLYWD(1, 1, 0, 0)
       displayWrite()
       time.sleep(1)
       GPIO.output(CH3, 0)

       # Light Comp Acty light
       GPIO.output(CH2, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH2, 0)

       # Flash V/N
       GPIO.output(CH6, 1)
       indicatorWrite()
       time.sleep(1)
       GPIO.output(CH6, 0)

    elif (command == 4):
       print ("Running Keyboard Test:")

       # Set up to receive keyboard input
       configureGPIOforInput()

       # Loop, accepting characters and displaying them
       while (True):
           if (GPIO.input(KBSTR) == 1):
               print ("A key was pressed")
               GPIO.output(KBD1, 0)
               GPIO.output(CLK1, 1)

               bit1 = GPIO.input(CH1)
               bit2 = GPIO.input(CH2)
               bit3 = GPIO.input(CH3)
               bit4 = GPIO.input(CH4)
               bit5 = GPIO.input(CH5)
               keyPress = decodeKeyPress(bit1, bit2, bit3, bit4, bit5)

               if (keyPress == 1): print ("Key 1 pressed")
               elif (keyPress == 2): print ("Key 2 pressed")
               elif (keyPress == 3): print ("Key 3 pressed")
               elif (keyPress == 4): print ("Key 4 pressed")
               elif (keyPress == 5): print ("Key 5 pressed")
               elif (keyPress == 6): print ("Key 6 pressed")
               elif (keyPress == 7): print ("Key 7 pressed")
               elif (keyPress == 8): print ("Key 8 pressed")
               elif (keyPress == 9): print ("Key 9 pressed")
               elif (keyPress == 0): print ("Key 0 pressed")
               elif (keyPress == 21): print ("Key VERB pressed")
               elif (keyPress == 22): print ("Key RESET pressed")
               elif (keyPress == 31): print ("Key KEY REL pressed")
               elif (keyPress == 32): print ("Key + pressed")
               elif (keyPress == 33): print ("Key - pressed")
               elif (keyPress == 34): print ("Key ENTER pressed")
               elif (keyPress == 36): print ("Key CLEAR pressed")
               elif (keyPress == 37): print ("Key NOUN pressed")
               else: print ("Invalid key code")

               time.sleep(1)

               GPIO.output(CLK1, 0)
               GPIO.output(KBD1, 1)

       # Set back to all pins in output mode
       configureGPIOforOutput()        

    elif (command == 5):
       print ("Running Operational Test:")

       # Set up to receive keyboard input
       configureGPIOforInput()

       # Loop looking for either VERB, NOUN or ENTER
       receivingVerb = False
       verb1 = -1
       verb2 = -1
       receivingNoun = False
       noun1 = -1
       noun2 = -1
       looping = True
       while (looping):
           if (GPIO.input(KBSTR) == 0):
               GPIO.output(KBD1, 0)
               GPIO.output(CLK1, 1)

               bit1 = GPIO.input(CH1)
               bit2 = GPIO.input(CH2)
               bit3 = GPIO.input(CH3)
               bit4 = GPIO.input(CH4)
               bit5 = GPIO.input(CH5)
               keyPress = decodeKeyPress(bit1, bit2, bit3, bit4, bit5)
       
               configureGPIOforOutput()

               # If VERB, then next two characters go in verb digits
               if (keyPress == 21):
                   receivingVerb = True

               # If NOUN, then next two characters go in noun digits
               if (keyPress == 37):
                   receivingNoun = True

               # If 0-9
               if (keyPress == 0 or keyPress == 1 or keyPress == 2 or keyPress == 3 or
                   keyPress == 4 or keyPress == 5 or keyPress == 6 or keyPress == 7 or
                   keyPress == 8 or keyPress == 9):

                   if (receivingVerb):
                       if (verb1 == -1):
                           verb1 == keyPress
                           setDisplayDigits(keyPress, 1)
                           setRLYWD(1, 0, 1, 0)
                           displayWrite()

                       elif (verb2 == -1):
                           verb2 == keyPress
                           setDisplayDigits(keyPress, 0)
                           setRLYWD(1, 0, 1, 0)
                           displayWrite()
                           receivingVerb = False

                   elif (receivingNoun):
                       if (noun1 == -1):
                           noun1 == keyPress
                           setDisplayDigits(keyPress, 1)
                           setRLYWD(1, 0, 0, 1)
                           displayWrite()

                       elif (noun2 == -1):
                           noun2 == keyPress
                           setDisplayDigits(keyPress, 0)
                           setRLYWD(1, 0, 0, 1)
                           displayWrite()
                           receivingNoun = False

               # If ENTER
               if (keyPress == 34):
                   # Set Mode to "63"
                   setDisplayDigits(6, 1)
                   setRLYWD(1, 0, 1, 1)
                   displayWrite()
                   setDisplayDigits(3, 0)
                   setRLYWD(1, 0, 1, 1)
                   displayWrite()

                   # Set R1 to "23232"
                   setDisplayDigits(2, 0)
                   setRLYWD(1, 0, 0, 0)
                   displayWrite()
                   setDisplayDigits(3, 1)
                   setRLYWD(0, 1, 1, 1)
                   displayWrite()
                   setDisplayDigits(2, 0)
                   setRLYWD(0, 1, 1, 1)
                   displayWrite()
                   setDisplayDigits(3, 1)
                   setRLYWD(0, 1, 1, 0)
                   displayWrite()
                   setDisplayDigits(2, 0)
                   setRLYWD(0, 1, 1, 0)
                   displayWrite()

                   # Set R2 to "56565"
                   setDisplayDigits(5, 1)
                   setRLYWD(0, 1, 0, 1)
                   displayWrite()
                   setDisplayDigits(6, 0)
                   setRLYWD(0, 1, 0, 1)
                   displayWrite()
                   setDisplayDigits(5, 1)
                   setRLYWD(0, 1, 0, 0)
                   displayWrite()
                   setDisplayDigits(6, 0)
                   setRLYWD(0, 1, 0, 0)
                   displayWrite()
                   setDisplayDigits(5, 1)
                   setRLYWD(0, 0, 1, 1)
                   displayWrite()
                   setDisplayDigits(8, 0)
                   setRLYWD(0, 0, 1, 1)
                   displayWrite()

                   # Set R3 to "89898"
                   setDisplayDigits(9, 1)
                   setRLYWD(0, 0, 1, 0)
                   displayWrite()
                   setDisplayDigits(8, 0)
                   setRLYWD(0, 0, 1, 0)
                   displayWrite()
                   setDisplayDigits(9, 1)
                   setRLYWD(0, 0, 0, 1)
                   displayWrite()
                   setDisplayDigits(8, 0)
                   setRLYWD(0, 0, 0, 1)
                   displayWrite()

                   verb1 = False
                   verb2 = False
                   noun1 = False
                   noun2 = False

               # If CLEAR, then exit test
               if (keyPress == 36):
                   looping = False

               GPIO.output(CLK1, 0)
               GPIO.output(KBD1, 1)

               configureGPIOforInput()


       # Set back to all pins in output mode
       configureGPIOforOutput()

    else:
       print ("Unimplemented command: %d" % command)
