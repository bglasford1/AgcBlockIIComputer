/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the source code window.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

class SourceCodeWindow extends JFrame implements ActionListener
{
  private final JTextArea document = new JTextArea();
  private static final String UPDATE = "Update";
  private AGCControl agcControl;

  SourceCodeWindow(String[] lines, AGCControl agcControl) throws HeadlessException
  {
    this.agcControl = agcControl;

    setDefaultCloseOperation(WindowConstants.HIDE_ON_CLOSE);

    JButton updateButton = new JButton(UPDATE);
    updateButton.setActionCommand(UPDATE);
    updateButton.addActionListener(this);

    JPanel panel = new JPanel(new BorderLayout());
    panel.add(new JScrollPane(document), BorderLayout.CENTER);
    panel.add(updateButton, BorderLayout.SOUTH);

    updateLines(lines);

    setContentPane(panel);
    pack();
    setSize(700,600);
    setLocationByPlatform(true);
    setVisible(true);
  }

  public void updateLines(String[] lines)
  {
    document.setText("");
    for (String nextline : lines)
    {
      document.append(nextline);
      document.append("\n");
    }
  }

  @Override
  public void actionPerformed(ActionEvent e)
  {
    if (e.getActionCommand().equalsIgnoreCase(UPDATE))
    {
      String[] lines = agcControl.getSourceCode();
      updateLines(lines);
    }
  }
}
