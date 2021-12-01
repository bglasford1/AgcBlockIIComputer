/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the DSKY keyboard.

  Mods:		  07/15/21  Initial Release.
            11/30/21  Fixed Proceed Key.
*/

package gui;

import enums.KeyInType;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class KeyboardPanel extends JPanel implements ActionListener
{
  private AGCControl agcControl;

  private static final String ZERO_STRING = "0";
  private static final String ONE_STRING = "1";
  private static final String TWO_STRING = "2";
  private static final String THREE_STRING = "3";
  private static final String FOUR_STRING = "4";
  private static final String FIVE_STRING = "5";
  private static final String SIX_STRING = "6";
  private static final String SEVEN_STRING = "7";
  private static final String EIGHT_STRING = "8";
  private static final String NINE_STRING = "9";
  private static final String PLUS_STRING = "+";
  private static final String MINUS_STRING = "-";
  private static final String CLEAR_STRING = "CLEAR";
  private static final String VERB_STRING = "VERB";
  private static final String NOUN_STRING = "NOUN";
  private static final String ENTER_STRING = "ENTER";
  private static final String RESET_STRING = "Reset";
  private static final String KEY_RELEASE_STRING = "KeyRel";
  private static final String PRO_STRING = "PRO";

  private JButton zeroButton = new JButton(ZERO_STRING);
  private JButton oneButton = new JButton(ONE_STRING);
  private JButton twoButton = new JButton(TWO_STRING);
  private JButton threeButton = new JButton(THREE_STRING);
  private JButton fourButton = new JButton(FOUR_STRING);
  private JButton fiveButton = new JButton(FIVE_STRING);
  private JButton sixButton = new JButton(SIX_STRING);
  private JButton sevenButton = new JButton(SEVEN_STRING);
  private JButton eightButton = new JButton(EIGHT_STRING);
  private JButton nineButton = new JButton(NINE_STRING);
  private JButton plusButton = new JButton(PLUS_STRING);
  private JButton minusButton = new JButton(MINUS_STRING);
  private JButton clearButton = new JButton(CLEAR_STRING);
  private JButton verbButton = new JButton(VERB_STRING);
  private JButton nounButton = new JButton(NOUN_STRING);
  private JButton enterButton = new JButton(ENTER_STRING);
  private JButton resetButton = new JButton(RESET_STRING);
  private JButton keyReleaseButton = new JButton(KEY_RELEASE_STRING);
  private JButton proButton = new JButton(PRO_STRING);
  private JLabel blankLabel1 = new JLabel("");
  private JLabel blankLabel2 = new JLabel("");

  KeyboardPanel(AGCControl agcControl)
  {
    this.agcControl = agcControl;

    this.setLayout(new GridLayout(3, 7));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Keyboard");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    verbButton.setActionCommand(VERB_STRING);
    verbButton.addActionListener(this);

    plusButton.setActionCommand(PLUS_STRING);
    plusButton.addActionListener(this);

    sevenButton.setActionCommand(SEVEN_STRING);
    sevenButton.addActionListener(this);

    eightButton.setActionCommand(EIGHT_STRING);
    eightButton.addActionListener(this);

    nineButton.setActionCommand(NINE_STRING);
    nineButton.addActionListener(this);

    clearButton.setActionCommand(CLEAR_STRING);
    clearButton.addActionListener(this);

    enterButton.setActionCommand(ENTER_STRING);
    enterButton.addActionListener(this);

    nounButton.setActionCommand(NOUN_STRING);
    nounButton.addActionListener(this);

    minusButton.setActionCommand(MINUS_STRING);
    minusButton.addActionListener(this);

    fourButton.setActionCommand(FOUR_STRING);
    fourButton.addActionListener(this);

    fiveButton.setActionCommand(FIVE_STRING);
    fiveButton.addActionListener(this);

    sixButton.setActionCommand(SIX_STRING);
    sixButton.addActionListener(this);

    proButton.setActionCommand(PRO_STRING);
    proButton.addActionListener(this);

    resetButton.setActionCommand(RESET_STRING);
    resetButton.addActionListener(this);

    zeroButton.setActionCommand(ZERO_STRING);
    zeroButton.addActionListener(this);

    oneButton.setActionCommand(ONE_STRING);
    oneButton.addActionListener(this);

    twoButton.setActionCommand(TWO_STRING);
    twoButton.addActionListener(this);

    threeButton.setActionCommand(THREE_STRING);
    threeButton.addActionListener(this);

    keyReleaseButton.setActionCommand(KEY_RELEASE_STRING);
    keyReleaseButton.addActionListener(this);

    this.add(verbButton);
    this.add(plusButton);
    this.add(sevenButton);
    this.add(eightButton);
    this.add(nineButton);
    this.add(clearButton);
    this.add(enterButton);
    this.add(nounButton);
    this.add(minusButton);
    this.add(fourButton);
    this.add(fiveButton);
    this.add(sixButton);
    this.add(proButton);
    this.add(resetButton);
    this.add(blankLabel1);
    this.add(zeroButton);
    this.add(oneButton);
    this.add(twoButton);
    this.add(threeButton);
    this.add(keyReleaseButton);
    this.add(blankLabel2);
  }

  @Override
  public void actionPerformed(ActionEvent e)
  {
    if (e.getActionCommand().equalsIgnoreCase(ZERO_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_0);
    }
    else if (e.getActionCommand().equalsIgnoreCase(ONE_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_1);
    }
    else if (e.getActionCommand().equalsIgnoreCase(TWO_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_2);
    }
    else if (e.getActionCommand().equalsIgnoreCase(THREE_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_3);
    }
    else if (e.getActionCommand().equalsIgnoreCase(FOUR_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_4);
    }
    else if (e.getActionCommand().equalsIgnoreCase(FIVE_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_5);
    }
    else if (e.getActionCommand().equalsIgnoreCase(SIX_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_6);
    }
    else if (e.getActionCommand().equalsIgnoreCase(SEVEN_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_7);
    }
    else if (e.getActionCommand().equalsIgnoreCase(EIGHT_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_8);
    }
    else if (e.getActionCommand().equalsIgnoreCase(NINE_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_9);
    }
    else if (e.getActionCommand().equalsIgnoreCase(PLUS_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_PLUS);
    }
    else if (e.getActionCommand().equalsIgnoreCase(MINUS_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_MINUS);
    }
    else if (e.getActionCommand().equalsIgnoreCase(VERB_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_VERB);
    }
    else if (e.getActionCommand().equalsIgnoreCase(NOUN_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_NOUN);
    }
    else if (e.getActionCommand().equalsIgnoreCase(CLEAR_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_CLEAR);
    }
    else if (e.getActionCommand().equalsIgnoreCase(ENTER_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_ENTER);
    }
    else if (e.getActionCommand().equalsIgnoreCase(RESET_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_ERROR_RESET);
    }
    else if (e.getActionCommand().equalsIgnoreCase(KEY_RELEASE_STRING))
    {
      agcControl.getKbd().keyPress(KeyInType.KEYIN_KEY_RELEASE);
    }
    else if (e.getActionCommand().equalsIgnoreCase(PRO_STRING))
    {
      agcControl.getKbd().proPress();
    }
  }
}
