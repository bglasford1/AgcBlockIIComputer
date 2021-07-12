/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the lower erasable memory registers.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class MemoryRegistersPanel extends JPanel
{
  private JTextField aRegText = new JTextField();
  private JTextField lRegText = new JTextField();
  private JTextField qRegText = new JTextField();
  private JTextField ebRegText = new JTextField();
  private JTextField fbRegText = new JTextField();
  private JTextField zRegText = new JTextField();
  private JTextField bbRegText = new JTextField();
  private JTextField aruptText = new JTextField();
  private JTextField lruptText = new JTextField();
  private JTextField qruptText = new JTextField();
  private JTextField zruptText = new JTextField();
  private JTextField bbruptText = new JTextField();
  private JTextField bruptText = new JTextField();
  private JTextField cyrText = new JTextField();
  private JTextField srText = new JTextField();
  private JTextField cylText = new JTextField();
  private JTextField edopText = new JTextField();
  private JTextField time2Text = new JTextField();
  private JTextField time1Text = new JTextField();
  private JTextField time3Text = new JTextField();
  private JTextField time4Text = new JTextField();

  private static final JLabel aRegLabel    = new JLabel("00      A:", SwingConstants.RIGHT);
  private static final JLabel lRegLabel    = new JLabel("01      L:", SwingConstants.RIGHT);
  private static final JLabel qRegLabel    = new JLabel("02      Q:", SwingConstants.RIGHT);
  private static final JLabel ebRegLabel   = new JLabel("03     EB:", SwingConstants.RIGHT);
  private static final JLabel fbRegLabel   = new JLabel("04     FB:", SwingConstants.RIGHT);
  private static final JLabel zRegLabel    = new JLabel("05      Z:", SwingConstants.RIGHT);
  private static final JLabel bbRegLabel   = new JLabel("06     BB:", SwingConstants.RIGHT);
  private static final JLabel zerosLabel   = new JLabel("07  ZEROS:", SwingConstants.RIGHT);
  private static final JLabel aruptLabel   = new JLabel("10  ARUPT:", SwingConstants.RIGHT);
  private static final JLabel lruptLabel   = new JLabel("11  LRUPT:", SwingConstants.RIGHT);
  private static final JLabel qruptLabel   = new JLabel("12  QRUPT:", SwingConstants.RIGHT);
  private static final JLabel spare1Label  = new JLabel("13  spare:", SwingConstants.RIGHT);
  private static final JLabel spare2Label  = new JLabel("14  spare:", SwingConstants.RIGHT);
  private static final JLabel zruptLabel   = new JLabel("15  ZRUPT:", SwingConstants.RIGHT);
  private static final JLabel bbruptLabel  = new JLabel("16 BBRUPT:", SwingConstants.RIGHT);
  private static final JLabel bruptLabel   = new JLabel("17  BRUPT:", SwingConstants.RIGHT);
  private static final JLabel cyrLabel     = new JLabel("20    CYR:", SwingConstants.RIGHT);
  private static final JLabel srLabel      = new JLabel("21     SR:", SwingConstants.RIGHT);
  private static final JLabel cylLabel     = new JLabel("22    CYL:", SwingConstants.RIGHT);
  private static final JLabel edopLabel    = new JLabel("23   EDOP:", SwingConstants.RIGHT);
  private static final JLabel time2Label   = new JLabel("24  TIME2:", SwingConstants.RIGHT);
  private static final JLabel time1Label   = new JLabel("25  TIME1:", SwingConstants.RIGHT);
  private static final JLabel time3Label   = new JLabel("26  TIME3:", SwingConstants.RIGHT);
  private static final JLabel time4Label   = new JLabel("27  TIME4:", SwingConstants.RIGHT);

  private static final JLabel allZerosLabel  = new JLabel("00000");
  private static final JLabel blankLabel1 = new JLabel("");
  private static final JLabel blankLabel2 = new JLabel("");

  MemoryRegistersPanel()
  {
    this.setLayout(new GridLayout(8, 6));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Memory Registers");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    this.add(aRegLabel);
    this.add(aRegText);
    this.add(aruptLabel);
    this.add(aruptText);
    this.add(cyrLabel);
    this.add(cyrText);

    this.add(lRegLabel);
    this.add(lRegText);
    this.add(lruptLabel);
    this.add(lruptText);
    this.add(srLabel);
    this.add(srText);

    this.add(qRegLabel);
    this.add(qRegText);
    this.add(qruptLabel);
    this.add(qruptText);
    this.add(cylLabel);
    this.add(cylText);

    this.add(ebRegLabel);
    this.add(ebRegText);
    this.add(spare1Label);
    this.add(blankLabel1);
    this.add(edopLabel);
    this.add(edopText);

    this.add(fbRegLabel);
    this.add(fbRegText);
    this.add(spare2Label);
    this.add(blankLabel2);
    this.add(time2Label);
    this.add(time2Text);

    this.add(zRegLabel);
    this.add(zRegText);
    this.add(zruptLabel);
    this.add(zruptText);
    this.add(time1Label);
    this.add(time1Text);

    this.add(bbRegLabel);
    this.add(bbRegText);
    this.add(bbruptLabel);
    this.add(bbruptText);
    this.add(time3Label);
    this.add(time3Text);

    this.add(zerosLabel);
    this.add(allZerosLabel);
    this.add(bruptLabel);
    this.add(bruptText);
    this.add(time4Label);
    this.add(time4Text);
  }

  public void setARegText(String aRegText)
  {
    this.aRegText.setText(aRegText);
  }

  public void setLRegText(String lRegText)
  {
    this.lRegText.setText(lRegText);
  }

  public void setQRegText(String qRegText)
  {
    this.qRegText.setText(qRegText);
  }

  public void setEBRegText(String ebRegText)
  {
    this.ebRegText.setText(ebRegText);
  }

  public void setFBRegText(String fbRegText)
  {
    this.fbRegText.setText(fbRegText);
  }

  public void setZRegText(String zRegText)
  {
    this.zRegText.setText(zRegText);
  }

  public void setBBRegText(String bbRegText)
  {
    this.bbRegText.setText(bbRegText);
  }

  public void setAruptText(String aruptText)
  {
    this.aruptText.setText(aruptText);
  }

  public void setLruptText(String lruptText)
  {
    this.lruptText.setText(lruptText);
  }

  public void setQruptText(String qruptText)
  {
    this.qruptText.setText(qruptText);
  }

  public void setZruptText(String zruptText)
  {
    this.zruptText.setText(zruptText);
  }

  public void setBBruptText(String bbruptText)
  {
    this.bbruptText.setText(bbruptText);
  }

  public void setBruptText(String bruptText)
  {
    this.bruptText.setText(bruptText);
  }

  public void setCyrText(String cyrText)
  {
    this.cyrText.setText(cyrText);
  }

  public void setSrText(String srText)
  {
    this.srText.setText(srText);
  }

  public void setCylText(String cylText)
  {
    this.cylText.setText(cylText);
  }

  public void setEdopText(String edopText)
  {
    this.edopText.setText(edopText);
  }

  public void setTime2Text(String time2Text)
  {
    this.time2Text.setText(time2Text);
  }

  public void setTime1Text(String time1Text)
  {
    this.time1Text.setText(time1Text);
  }

  public void setTime3Text(String time3Text)
  {
    this.time3Text.setText(time3Text);
  }

  public void setTime4Text(String time4Text)
  {
    this.time4Text.setText(time4Text);
  }
}
