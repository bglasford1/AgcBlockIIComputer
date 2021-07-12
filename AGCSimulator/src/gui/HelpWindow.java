/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the help window.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import java.awt.*;
import java.io.FileReader;
import java.io.IOException;

class HelpWindow extends JFrame
{
  HelpWindow()
  {
    setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);

    JPanel panel = new JPanel(new BorderLayout());

    final JTextArea document = new JTextArea();
    panel.add(new JScrollPane(document), BorderLayout.CENTER);

    try
    {
      // Read help file and put into text area.
      FileReader reader = new FileReader("helpfile.txt");
      document.read(reader, "helpfile.txt");
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }

    setContentPane(panel);
    pack();
    setSize(700,600);
    setLocationByPlatform(true);
    setVisible(true);
  }
}
