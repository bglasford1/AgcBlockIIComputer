/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the channel values.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class ChannelPanel extends JPanel
{
  private JTextField channel7Text = new JTextField();
  private JTextField channel10Text = new JTextField();
  private JTextField channel11Text = new JTextField();
  private JTextField channel12Text = new JTextField();
  private JTextField channel13Text = new JTextField();
  private JTextField channel14Text = new JTextField();
  private JTextField channel15Text = new JTextField();
  private JTextField channel16Text = new JTextField();
  private JTextField channel30Text = new JTextField();
  private JTextField channel32Text = new JTextField();
  private JTextField channel33Text = new JTextField();
  private JTextField channel77Text = new JTextField();

  private static final JLabel channel7Label  = new JLabel("07:", SwingConstants.RIGHT);
  private static final JLabel channel10Label = new JLabel("10:", SwingConstants.RIGHT);
  private static final JLabel channel11Label = new JLabel("11:", SwingConstants.RIGHT);
  private static final JLabel channel12Label = new JLabel("12:", SwingConstants.RIGHT);
  private static final JLabel channel13Label = new JLabel("13:", SwingConstants.RIGHT);
  private static final JLabel channel14Label = new JLabel("14:", SwingConstants.RIGHT);

  private static final JLabel channel15Label = new JLabel("15:", SwingConstants.RIGHT);
  private static final JLabel channel16Label = new JLabel("16:", SwingConstants.RIGHT);
  private static final JLabel channel30Label = new JLabel("30:", SwingConstants.RIGHT);
  private static final JLabel channel32Label = new JLabel("32:", SwingConstants.RIGHT);
  private static final JLabel channel33Label = new JLabel("33:", SwingConstants.RIGHT);
  private static final JLabel channel77Label = new JLabel("77:", SwingConstants.RIGHT);

  ChannelPanel()
  {
    this.setLayout(new GridLayout(6, 4));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Channels");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    channel7Text.setMinimumSize(new Dimension(60, 20));
    channel7Text.setPreferredSize(new Dimension(60, 20));

    this.add(channel7Label);
    this.add(channel7Text);
    this.add(channel15Label);
    this.add(channel15Text);
    this.add(channel10Label);
    this.add(channel10Text);
    this.add(channel16Label);
    this.add(channel16Text);
    this.add(channel11Label);
    this.add(channel11Text);
    this.add(channel30Label);
    this.add(channel30Text);
    this.add(channel12Label);
    this.add(channel12Text);
    this.add(channel32Label);
    this.add(channel32Text);
    this.add(channel13Label);
    this.add(channel13Text);
    this.add(channel33Label);
    this.add(channel33Text);
    this.add(channel14Label);
    this.add(channel14Text);
    this.add(channel77Label);
    this.add(channel77Text);
  }

  public void setChannel7Text(String channel7Text)
  {
    this.channel7Text.setText(channel7Text);
  }

  public void setChannel10Text(String channel10Text)
  {
    this.channel10Text.setText(channel10Text);
  }

  public void setChannel11Text(String channel11Text)
  {
    this.channel11Text.setText(channel11Text);
  }

  public void setChannel12Text(String channel12Text)
  {
    this.channel12Text.setText(channel12Text);
  }

  public void setChannel13Text(String channel13Text)
  {
    this.channel13Text.setText(channel13Text);
  }

  public void setChannel14Text(String channel14Text)
  {
    this.channel14Text.setText(channel14Text);
  }

  public void setChannel15Text(String channel15Text)
  {
    this.channel15Text.setText(channel15Text);
  }

  public void setChannel16Text(String channel16Text)
  {
    this.channel16Text.setText(channel16Text);
  }

  public void setChannel30Text(String channel30Text)
  {
    this.channel30Text.setText(channel30Text);
  }

  public void setChannel32Text(String channel32Text)
  {
    this.channel32Text.setText(channel32Text);
  }

  public void setChannel33Text(String channel33Text)
  {
    this.channel33Text.setText(channel33Text);
  }

  public void setChannel77Text(String channel77Text)
  {
    this.channel77Text.setText(channel77Text);
  }
}
