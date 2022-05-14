/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the control pluse values.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package gui;

import javax.swing.*;
import java.awt.*;

public class ControlPulsePanel extends JPanel
{
  private final JTextField controlPulseText = new JTextField(40);
  private static final JLabel controlPulseLabel = new JLabel("Control Pulses:", SwingConstants.RIGHT);

  ControlPulsePanel()
  {
    this.setLayout(new GridLayout(1, 2));
    this.setBorder(BorderFactory.createEtchedBorder());

    controlPulseText.setMinimumSize(new Dimension(40, 20));
    controlPulseText.setPreferredSize(new Dimension(40, 20));

    this.add(controlPulseLabel);
    this.add(controlPulseText);
  }

  public void setControlPulseText(String controlPulseText)
  {
    this.controlPulseText.setText(controlPulseText);
  }
}
