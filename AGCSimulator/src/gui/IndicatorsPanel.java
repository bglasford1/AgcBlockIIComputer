/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the DSKY indicator values.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package gui;

import javax.swing.*;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class IndicatorsPanel extends JPanel implements ActionListener
{
  private static final String UPLINK_ACTY_LABEL = "UPLINK ACTY";
  private static final String TEMP_LABEL = "TEMP";
  private static final String NO_ATT_LABEL = "NO ATT";
  private static final String GIMBAL_LOCK_LABEL = "GIMBAL LOCK";
  private static final String STBY_LABEL = "STBY";
  private static final String PROG_LABEL = "PROG";
  private static final String KEY_REL_LABEL = "KEY REL";
  private static final String RESTART_LABEL = "RESTART";
  private static final String OPER_ERR_LABEL = "OPR ERR";
  private static final String TRACKER_LABEL = "TRACKER";
  private static final String ALT_LABEL = "ALT";
  private static final String VEL_LABEL = "VEL";

  private final JButton uplinkActyButton = new JButton();
  private final JButton tempButton = new JButton();
  private final JButton noAttButton = new JButton();
  private final JButton gimbalLockButton = new JButton();
  private final JButton stbyButton = new JButton();
  private final JButton progButton = new JButton();
  private final JButton keyRelButton = new JButton();
  private final JButton restartButton = new JButton();
  private final JButton operErrButton = new JButton();
  private final JButton trackerButton = new JButton();
  private final JButton altButton = new JButton();
  private final JButton velButton = new JButton();
  private final JButton unused1Button = new JButton();
  private final JButton unused2Button = new JButton();

  IndicatorsPanel()
  {
    this.setLayout(new GridLayout(7, 2));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Indicators");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    uplinkActyButton.setText(UPLINK_ACTY_LABEL);
    uplinkActyButton.setActionCommand(UPLINK_ACTY_LABEL);
    uplinkActyButton.addActionListener(this);
    uplinkActyButton.setBackground(Color.GRAY);
    uplinkActyButton.setBorder(new LineBorder(Color.BLACK));
    uplinkActyButton.setOpaque(true);

    tempButton.setText(TEMP_LABEL);
    tempButton.setActionCommand(TEMP_LABEL);
    tempButton.addActionListener(this);
    tempButton.setBackground(Color.GRAY);
    tempButton.setBorder(new LineBorder(Color.BLACK));
    tempButton.setOpaque(true);

    noAttButton.setText(NO_ATT_LABEL);
    noAttButton.setActionCommand(NO_ATT_LABEL);
    noAttButton.addActionListener(this);
    noAttButton.setBackground(Color.GRAY);
    noAttButton.setBorder(new LineBorder(Color.BLACK));
    noAttButton.setOpaque(true);

    gimbalLockButton.setText(GIMBAL_LOCK_LABEL);
    gimbalLockButton.setActionCommand(GIMBAL_LOCK_LABEL);
    gimbalLockButton.addActionListener(this);
    gimbalLockButton.setBackground(Color.GRAY);
    gimbalLockButton.setBorder(new LineBorder(Color.BLACK));
    gimbalLockButton.setOpaque(true);

    stbyButton.setText(STBY_LABEL);
    stbyButton.setActionCommand(STBY_LABEL);
    stbyButton.addActionListener(this);
    stbyButton.setBackground(Color.GRAY);
    stbyButton.setBorder(new LineBorder(Color.BLACK));
    stbyButton.setOpaque(true);

    progButton.setText(PROG_LABEL);
    progButton.setActionCommand(PROG_LABEL);
    progButton.addActionListener(this);
    progButton.setBackground(Color.GRAY);
    progButton.setBorder(new LineBorder(Color.BLACK));
    progButton.setOpaque(true);

    keyRelButton.setText(KEY_REL_LABEL);
    keyRelButton.setActionCommand(KEY_REL_LABEL);
    keyRelButton.addActionListener(this);
    keyRelButton.setBackground(Color.GRAY);
    keyRelButton.setBorder(new LineBorder(Color.BLACK));
    keyRelButton.setOpaque(true);

    restartButton.setText(RESTART_LABEL);
    restartButton.setActionCommand(RESTART_LABEL);
    restartButton.addActionListener(this);
    restartButton.setBackground(Color.GRAY);
    restartButton.setBorder(new LineBorder(Color.BLACK));
    restartButton.setOpaque(true);

    operErrButton.setText(OPER_ERR_LABEL);
    operErrButton.setActionCommand(OPER_ERR_LABEL);
    operErrButton.addActionListener(this);
    operErrButton.setBackground(Color.GRAY);
    operErrButton.setBorder(new LineBorder(Color.BLACK));
    operErrButton.setOpaque(true);

    trackerButton.setText(TRACKER_LABEL);
    trackerButton.setActionCommand(TRACKER_LABEL);
    trackerButton.addActionListener(this);
    trackerButton.setBackground(Color.GRAY);
    trackerButton.setBorder(new LineBorder(Color.BLACK));
    trackerButton.setOpaque(true);

    altButton.setText(ALT_LABEL);
    altButton.setActionCommand(ALT_LABEL);
    altButton.addActionListener(this);
    altButton.setBackground(Color.GRAY);
    altButton.setBorder(new LineBorder(Color.BLACK));
    altButton.setOpaque(true);

    velButton.setText(VEL_LABEL);
    velButton.setActionCommand(VEL_LABEL);
    velButton.addActionListener(this);
    velButton.setBackground(Color.GRAY);
    velButton.setBorder(new LineBorder(Color.BLACK));
    velButton.setOpaque(true);

    unused1Button.setBackground(Color.LIGHT_GRAY);
    unused1Button.setBorder(new LineBorder(Color.BLACK));
    unused1Button.setOpaque(true);

    unused2Button.setBackground(Color.LIGHT_GRAY);
    unused2Button.setBorder(new LineBorder(Color.BLACK));
    unused2Button.setOpaque(true);

    this.add(uplinkActyButton);
    this.add(tempButton);
    this.add(noAttButton);
    this.add(gimbalLockButton);
    this.add(stbyButton);
    this.add(progButton);
    this.add(keyRelButton);
    this.add(restartButton);
    this.add(operErrButton);
    this.add(trackerButton);
    this.add(unused1Button);
    this.add(altButton);
    this.add(unused2Button);
    this.add(velButton);
  }

  // Do nothing as these are not functioning buttons, but light up indicators.
  @Override
  public void actionPerformed(ActionEvent e)
  {
  }

  public void lightUplinkActivity(boolean state)
  {
    uplinkActyButton.setBackground(state ? Color.WHITE : Color.LIGHT_GRAY);
  }

  public void lightTemp(boolean state)
  {
    tempButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightNoAtt(boolean state)
  {
    noAttButton.setBackground(state ? Color.WHITE : Color.LIGHT_GRAY);
  }

  public void lightGimbalLock(boolean state)
  {
    gimbalLockButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightStby(boolean state)
  {
    stbyButton.setBackground(state ? Color.WHITE : Color.LIGHT_GRAY);
  }

  public void lightProg(boolean state)
  {
    progButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightKeyRel(boolean state)
  {
    keyRelButton.setBackground(state ? Color.WHITE : Color.LIGHT_GRAY);
  }

  public void lightRestart(boolean state)
  {
    restartButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightOperErr(boolean state)
  {
    operErrButton.setBackground(state ? Color.WHITE : Color.LIGHT_GRAY);
  }

  public void lightTracker(boolean state)
  {
    trackerButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightAlt(boolean state)
  {
    altButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }

  public void lightVel(boolean state)
  {
    velButton.setBackground(state ? Color.YELLOW : Color.LIGHT_GRAY);
  }
}
