/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the various state values of the simulation.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up code.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;

public class SimStatesPanel extends JPanel
{
  private static final JLabel RUN_LABEL = new JLabel("RUN:", SwingConstants.RIGHT);
  private static final JLabel STEP_LABEL = new JLabel("STEP:", SwingConstants.RIGHT);
  private static final JLabel INST_LABEL = new JLabel("INST:", SwingConstants.RIGHT);
  private static final JLabel PROG_LABEL = new JLabel("PROG:", SwingConstants.RIGHT);
  private static final JLabel PURST_LABEL = new JLabel("PURST:", SwingConstants.RIGHT);
  private static final JLabel FCLK_LABEL = new JLabel("FLCK:", SwingConstants.RIGHT);
  private static final JLabel DEBUG_LABEL = new JLabel("Debug:", SwingConstants.RIGHT);
  private static final JLabel RUPT_LABEL = new JLabel("RUPT-I:", SwingConstants.RIGHT);
  private static final JLabel CTR_LABEL = new JLabel("RUPT-C:", SwingConstants.RIGHT);
  private static final JLabel ADDR_LABEL = new JLabel("Addr:", SwingConstants.RIGHT);

  private final JTextField runText = new JTextField();
  private final JTextField stepText = new JTextField();
  private final JTextField instText = new JTextField();
  private final JTextField progText = new JTextField();
  private final JTextField purstText = new JTextField();
  private final JTextField fclkText = new JTextField();
  private final JTextField debugText = new JTextField();
  private final JTextField ruptText = new JTextField();
  private final JTextField ctrText = new JTextField();
  private final JTextField addrText = new JTextField();

  SimStatesPanel()
  {
    this.setLayout(new GridLayout(5, 4));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Sim States");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    addrText.setMinimumSize(new Dimension(60, 20));
    addrText.setPreferredSize(new Dimension(60, 20));

    this.add(FCLK_LABEL);
    this.add(fclkText);
    this.add(STEP_LABEL);
    this.add(stepText);
    this.add(RUN_LABEL);
    this.add(runText);
    this.add(INST_LABEL);
    this.add(instText);
    this.add(PROG_LABEL);
    this.add(progText);
    this.add(PURST_LABEL);
    this.add(purstText);
    this.add(DEBUG_LABEL);
    this.add(debugText);
    this.add(ADDR_LABEL);
    this.add(addrText);
    this.add(RUPT_LABEL);
    this.add(ruptText);
    this.add(CTR_LABEL);
    this.add(ctrText);
  }

  public void setRunText(String runText)
  {
    this.runText.setText(runText);
  }

  public void setStepText(String stepText)
  {
    this.stepText.setText(stepText);
  }

  public void setInstText(String instText)
  {
    this.instText.setText(instText);
  }

  public void setProgText(String progText)
  {
    this.progText.setText(progText);
  }

  public void setPurstText(String purstText)
  {
    this.purstText.setText(purstText);
  }

  public void setFclkText(String fclkText)
  {
    this.fclkText.setText(fclkText);
  }

  public void setDebugText(String debugText)
  {
    this.debugText.setText(debugText);
  }

  public void setRuptText(String ruptText)
  {
    this.ruptText.setText(ruptText);
  }

  public void setCtrText(String ctrText)
  {
    this.ctrText.setText(ctrText);
  }

  public void setAddrText(String addrText)
  {
    this.addrText.setText(addrText);
  }
}
