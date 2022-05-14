/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the DSKY output values, i.e. the 7-segment
            displays.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class DisplayPanel extends JPanel
{
  private final JTextField MD1 = new JTextField();
  private final JTextField MD2 = new JTextField();
  private final JTextField ND1 = new JTextField();
  private final JTextField ND2 = new JTextField();
  private final JTextField VD1 = new JTextField();
  private final JTextField VD2 = new JTextField();
  private final JTextField R1S = new JTextField();
  private final JTextField R1D1 = new JTextField();
  private final JTextField R1D2 = new JTextField();
  private final JTextField R1D3 = new JTextField();
  private final JTextField R1D4 = new JTextField();
  private final JTextField R1D5 = new JTextField();
  private final JTextField R2S = new JTextField();
  private final JTextField R2D1 = new JTextField();
  private final JTextField R2D2 = new JTextField();
  private final JTextField R2D3 = new JTextField();
  private final JTextField R2D4 = new JTextField();
  private final JTextField R2D5 = new JTextField();
  private final JTextField R3S = new JTextField();
  private final JTextField R3D1 = new JTextField();
  private final JTextField R3D2 = new JTextField();
  private final JTextField R3D3 = new JTextField();
  private final JTextField R3D4 = new JTextField();
  private final JTextField R3D5 = new JTextField();
  private final JButton activeButton = new JButton("ACT");
  private final JButton flashButton = new JButton("FLA");

  private static final JLabel modeLabel = new JLabel("P:", SwingConstants.RIGHT);
  private static final JLabel nounLabel = new JLabel("N:", SwingConstants.RIGHT);
  private static final JLabel verbLabel = new JLabel("V:", SwingConstants.RIGHT);
  private static final JLabel r1Label = new JLabel("R1:", SwingConstants.RIGHT);
  private static final JLabel r2Label = new JLabel("R2:", SwingConstants.RIGHT);
  private static final JLabel r3Label = new JLabel("R3:", SwingConstants.RIGHT);

  private final JLabel blankLabel1 = new JLabel("");
  private final JLabel blankLabel2 = new JLabel("");
  private final JLabel blankLabel3 = new JLabel("");

  DisplayPanel()
  {
    this.setLayout(new GridLayout(5, 7));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Display");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    activeButton.setBackground(Color.WHITE);
    activeButton.setOpaque(true);
    flashButton.setBackground(Color.WHITE);
    flashButton.setOpaque(true);

    this.add(blankLabel1);
    this.add(activeButton);
    this.add(blankLabel2);
    this.add(flashButton);
    this.add(modeLabel);
    this.add(MD1);
    this.add(MD2);
    this.add(verbLabel);
    this.add(VD1);
    this.add(VD2);
    this.add(blankLabel3);
    this.add(nounLabel);
    this.add(ND1);
    this.add(ND2);
    this.add(r1Label);
    this.add(R1S);
    this.add(R1D1);
    this.add(R1D2);
    this.add(R1D3);
    this.add(R1D4);
    this.add(R1D5);
    this.add(r2Label);
    this.add(R2S);
    this.add(R2D1);
    this.add(R2D2);
    this.add(R2D3);
    this.add(R2D4);
    this.add(R2D5);
    this.add(r3Label);
    this.add(R3S);
    this.add(R3D1);
    this.add(R3D2);
    this.add(R3D3);
    this.add(R3D4);
    this.add(R3D5);
  }

  public void setMD1(String text)
  {
    this.MD1.setText(text);
  }

  public void setMD2(String text)
  {
    this.MD2.setText(text);
  }

  public void setVD1(String text)
  {
    this.VD1.setText(text);
  }

  public void setVD2(String text)
  {
    this.VD2.setText(text);
  }

  public void setND1(String text)
  {
    this.ND1.setText(text);
  }

  public void setND2(String text)
  {
    this.ND2.setText(text);
  }

  public void setR1S(String text)
  {
    this.R1S.setText(text);
  }

  public void setR1D1(String text)
  {
    this.R1D1.setText(text);
  }

  public void setR1D2(String text)
  {
    this.R1D2.setText(text);
  }

  public void setR1D3(String text)
  {
    this.R1D3.setText(text);
  }

  public void setR1D4(String text)
  {
    this.R1D4.setText(text);
  }

  public void setR1D5(String text)
  {
    this.R1D5.setText(text);
  }

  public void setR2S(String text)
  {
    this.R2S.setText(text);
  }

  public void setR2D1(String text)
  {
    this.R2D1.setText(text);
  }

  public void setR2D2(String text)
  {
    this.R2D2.setText(text);
  }

  public void setR2D3(String text)
  {
    this.R2D3.setText(text);
  }

  public void setR2D4(String text)
  {
    this.R2D4.setText(text);
  }

  public void setR2D5(String text)
  {
    this.R2D5.setText(text);
  }

  public void setR3S(String text)
  {
    this.R3S.setText(text);
  }

  public void setR3D1(String text)
  {
    this.R3D1.setText(text);
  }

  public void setR3D2(String text)
  {
    this.R3D2.setText(text);
  }

  public void setR3D3(String text)
  {
    this.R3D3.setText(text);
  }

  public void setR3D4(String text)
  {
    this.R3D4.setText(text);
  }

  public void setR3D5(String text)
  {
    this.R3D5.setText(text);
  }

  public void lightCompActivity(boolean state)
  {
    activeButton.setBackground(state ? Color.GREEN : Color.LIGHT_GRAY);
  }

  public void lightFlash(boolean state)
  {
    flashButton.setBackground(state ? Color.BLUE : Color.LIGHT_GRAY);
  }
}
