/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This is the Java main for the AGC hardware simulator.
            NOTE: Throughout this code octal notation is used, which in
            Java is a number preceeded with a '0'.

  Mods:		  07/15/21 Initial Release.
*/

import gui.AGCControl;

public class AGCMain
{
  public static void main(String[] args)
  {
    AGCControl agcControl = new AGCControl();

    agcControl.initialize();
  }
}
