/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the registers related to the instruction
            that is being executed.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class InstructionPanel extends JPanel
{
  private JTextField bRegText = new JTextField();
  private JTextField tpText = new JTextField();
  private JTextField subseqText = new JTextField();
  private JTextField stageRegText = new JTextField();
  private JTextField preStageRegText = new JTextField();
  private JTextField br1RegText = new JTextField();
  private JTextField br2RegText = new JTextField();
  private JTextField sniRegText = new JTextField();
  private JTextField extText = new JTextField();
  private JTextField sqText = new JTextField();

  private static final JLabel bRegLabel = new JLabel("B:", SwingConstants.RIGHT);
  private static final JLabel tpLabel = new JLabel("TP:", SwingConstants.RIGHT);
  private static final JLabel subseqLabel = new JLabel("SUBSEQ:", SwingConstants.RIGHT);
  private static final JLabel stageRegLabel = new JLabel("STAGE:", SwingConstants.RIGHT);
  private static final JLabel preStageRegLabel = new JLabel("Pre-STAGE:", SwingConstants.RIGHT);
  private static final JLabel br1RegLabel = new JLabel("BR1:", SwingConstants.RIGHT);
  private static final JLabel br2RegLabel = new JLabel("BR2:", SwingConstants.RIGHT);
  private static final JLabel sniRegLabel = new JLabel("SNI:", SwingConstants.RIGHT);
  private static final JLabel extRegLabel = new JLabel("EXT:", SwingConstants.RIGHT);
  private static final JLabel sqRegLabel = new JLabel("SQ:", SwingConstants.RIGHT);

  InstructionPanel()
  {
    this.setLayout(new GridLayout(5, 4));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Instruction");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    this.add(subseqLabel);
    this.add(subseqText);
    this.add(bRegLabel);
    this.add(bRegText);
    this.add(tpLabel);
    this.add(tpText);
    this.add(sqRegLabel);
    this.add(sqText);
    this.add(stageRegLabel);
    this.add(stageRegText);
    this.add(preStageRegLabel);
    this.add(preStageRegText);
    this.add(br2RegLabel);
    this.add(br2RegText);
    this.add(sniRegLabel);
    this.add(sniRegText);
    this.add(br1RegLabel);
    this.add(br1RegText);
    this.add(extRegLabel);
    this.add(extText);
  }

  public void setBRegText(String bRegText)
  {
    this.bRegText.setText(bRegText);
  }

  public void setBr1RegText(String br1RegText)
  {
    this.br1RegText.setText(br1RegText);
  }

  public void setBr2RegText(String br2RegText)
  {
    this.br2RegText.setText(br2RegText);
  }

  public void setStageRegText(String staRegText)
  {
    this.stageRegText.setText(staRegText);
  }

  public void setPreStageRegText(String preStageRegText)
  {
    this.preStageRegText.setText(preStageRegText);
  }

  public void setSniRegText(String sniText)
  {
    this.sniRegText.setText(sniText);
  }

  public void setTpText(String tpText)
  {
    this.tpText.setText(tpText);
  }

  public void setSubseqText(String subseqText)
  {
    this.subseqText.setText(subseqText);
  }

  public void setExtText(String extText)
  {
    this.extText.setText(extText);
  }

  public void setSqText(String sqText)
  {
    this.sqText.setText(sqText);
  }
}
