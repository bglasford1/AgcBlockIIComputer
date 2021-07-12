/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the register values related to memory
            processing.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class MemoryPanel extends JPanel
{
  private static final JLabel f10RegLabel = new JLabel("F10:", SwingConstants.RIGHT);
  private static final JLabel f13RegLabel = new JLabel("F13:", SwingConstants.RIGHT);
  private static final JLabel f17RegLabel = new JLabel("F17:", SwingConstants.RIGHT);
  private static final JLabel gRegLabel = new JLabel("G:", SwingConstants.RIGHT);
  private static final JLabel pRegLabel = new JLabel("P:", SwingConstants.RIGHT);
  private static final JLabel sclRegLabel = new JLabel("SCL:", SwingConstants.RIGHT);
  private static final JLabel writeBusLabel = new JLabel("W.Bus:", SwingConstants.RIGHT);
  private static final JLabel sRegLabel = new JLabel("S:", SwingConstants.RIGHT);

  private JTextField f10RegText = new JTextField();
  private JTextField f13RegText = new JTextField();
  private JTextField f17RegText = new JTextField();
  private JTextField gRegText = new JTextField();
  private JTextField pRegText = new JTextField();
  private JTextField sclRegText = new JTextField();
  private JTextField writeBusText = new JTextField();
  private JTextField sRegText = new JTextField();

  MemoryPanel()
  {
    this.setLayout(new GridLayout(4, 4));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Memory");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    gRegText.setMinimumSize(new Dimension(60, 20));
    gRegText.setPreferredSize(new Dimension(60, 20));

    this.add(gRegLabel);
    this.add(gRegText);
    this.add(f10RegLabel);
    this.add(f10RegText);
    this.add(sRegLabel);
    this.add(sRegText);
    this.add(f13RegLabel);
    this.add(f13RegText);
    this.add(pRegLabel);
    this.add(pRegText);
    this.add(f17RegLabel);
    this.add(f17RegText);
    this.add(sclRegLabel);
    this.add(sclRegText);
    this.add(writeBusLabel);
    this.add(writeBusText);
  }

  public void setF10RegText(String f10RegText)
  {
    this.f10RegText.setText(f10RegText);
  }

  public void setF13RegText(String f13RegText)
  {
    this.f13RegText.setText(f13RegText);
  }

  public void setF17RegText(String f17RegText)
  {
    this.f17RegText.setText(f17RegText);
  }

  public void setGRegText(String gRegText)
  {
    this.gRegText.setText(gRegText);
  }

  public void setSRegText(String sRegText)
  {
    this.sRegText.setText(sRegText);
  }

  public void setPRegText(String pRegText)
  {
    this.pRegText.setText(pRegText);
  }

  public void setSclRegText(String sclRegText)
  {
    this.sclRegText.setText(sclRegText);
  }

  public void setWriteBusText(String writeBusText)
  {
    this.writeBusText.setText(writeBusText);
  }
}
