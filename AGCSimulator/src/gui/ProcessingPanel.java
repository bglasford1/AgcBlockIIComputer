/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the register values related to ALU, CTR and
            INT processing.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class ProcessingPanel extends JPanel
{
  private JTextField xRegText = new JTextField();
  private JTextField yRegText = new JTextField();
  private JTextField rpcellRegText = new JTextField();
  private JTextField inhRegText = new JTextField();
  private JTextField upcellRegText = new JTextField();
  private JTextField uRegText = new JTextField();
  private JTextField ciRegText = new JTextField();

  private static final JLabel upcellRegLabel = new JLabel("UpCELL:", SwingConstants.RIGHT);
  private static final JLabel xRegLabel = new JLabel("X:", SwingConstants.RIGHT);
  private static final JLabel yRegLabel = new JLabel("Y:", SwingConstants.RIGHT);
  private static final JLabel rpcellRegLabel = new JLabel("RpCell:", SwingConstants.RIGHT);
  private static final JLabel inhRegLabel = new JLabel("INH:", SwingConstants.RIGHT);
  private static final JLabel uRegLabel = new JLabel("U:", SwingConstants.RIGHT);
  private static final JLabel ciRegLabel = new JLabel("CI:", SwingConstants.RIGHT);

  ProcessingPanel()
  {
    this.setLayout(new GridLayout(4, 2));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Processor");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    xRegText.setMinimumSize(new Dimension(60, 20));
    xRegText.setPreferredSize(new Dimension(60, 20));

    this.add(xRegLabel);
    this.add(xRegText);
    this.add(ciRegLabel);
    this.add(ciRegText);
    this.add(yRegLabel);
    this.add(yRegText);
    this.add(inhRegLabel);
    this.add(inhRegText);
    this.add(uRegLabel);
    this.add(uRegText);
    this.add(upcellRegLabel);
    this.add(upcellRegText);
    this.add(rpcellRegLabel);
    this.add(rpcellRegText);
  }

  public void setCiRegText(String sRegText)
  {
    this.ciRegText.setText(sRegText);
  }

  public void setRpCellRegText(String rpcellRegText)
  {
    this.rpcellRegText.setText(rpcellRegText);
  }

  public void setInhRegText(String inhRegText)
  {
    this.inhRegText.setText(inhRegText);
  }

  public void setUpcellRegText(String upcellRegText)
  {
    this.upcellRegText.setText(upcellRegText);
  }

  public void setXRegText(String xRegText)
  {
    this.xRegText.setText(xRegText);
  }

  public void setYRegText(String yRegText)
  {
    this.yRegText.setText(yRegText);
  }

  public void setURegText(String zRegText)
  {
    this.uRegText.setText(zRegText);
  }
}
