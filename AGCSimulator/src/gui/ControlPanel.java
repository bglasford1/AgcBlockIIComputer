/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the control panel which consists of the
            switches that control the simulation.

  Mods:		  07/15/21  Initial Release.
            11/30/21  Implemented Standby.
*/

package gui;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ControlPanel extends JPanel implements ActionListener
{
  private final AGCControl agcControl;

  private static final String MANUAL_CLK_STRING = "CLK: STEP";
  private static final String FAST_CLK_STRING = "CLK: RUN";
  private static final String STEP_CLOCK_STRING = "STEP CLOCK";
  private static final String SCALER_STRING = "SCALER";
  private static final String STANDBY_ALLOWED_STRING = "STBY ALLOW";
  private static final String RUN_INST_STRING = "EXEC: RUN";
  private static final String STEP_INST_STRING = "EXEC: STEP";
  private static final String STEP_INSTRUCTION_STRING = "STEP";
  private static final String CLEAR_PARITY_ALARM_STRING = "CLR PARALM";
  private static final String INSTRUCTION_STRING = "EXEC: INST";
  private static final String SEQUENCE_STRING = "EXEC: SEQ";
  private static final String INTERRUPT_STRING = "INTERRUPT";
  private static final String F13_STRING = "F13";
  private static final String F17_STRING = "F17";
  private static final String RESET_STRING = "RESET";
  private static final String INCREMENT_COUNTER_STRING = "INC CTR";
  private static final String STANDBY_STRING = "STANDBY";

  private final JButton scalerButton = new JButton(SCALER_STRING);
  private final JButton standbyAllowedButton = new JButton(STANDBY_ALLOWED_STRING);
  private final JButton runStepClockButton = new JButton(MANUAL_CLK_STRING);
  private final JButton runStepInstButton = new JButton(STEP_INST_STRING);
  private final JButton clearParityAlarmButton = new JButton(CLEAR_PARITY_ALARM_STRING);
  private final JButton stepClockButton = new JButton(STEP_CLOCK_STRING);
  private final JButton instructionSequenceButton = new JButton(SEQUENCE_STRING);
  private final JButton interruptButton = new JButton(INTERRUPT_STRING);
  private final JButton f13Button = new JButton(F13_STRING);
  private final JButton f17Button = new JButton(F17_STRING);
  private final JButton stepInstructionButton = new JButton(STEP_INSTRUCTION_STRING);
  private final JButton resetButton = new JButton(RESET_STRING);
  private final JButton incCounterButton = new JButton(INCREMENT_COUNTER_STRING);
  private final JButton standbyButton = new JButton(STANDBY_STRING);

  ControlPanel(AGCControl agcControl)
  {
    this.agcControl = agcControl;

    this.setLayout(new GridLayout(4, 4));
    TitledBorder centerBorder = BorderFactory.createTitledBorder("Control");
    centerBorder.setTitleJustification(TitledBorder.CENTER);
    this.setBorder(centerBorder);

    scalerButton.setActionCommand(SCALER_STRING);
    scalerButton.addActionListener(this);
    scalerButton.setBackground(Color.GREEN);
    scalerButton.setOpaque(true);

    standbyAllowedButton.setActionCommand(STANDBY_ALLOWED_STRING);
    standbyAllowedButton.addActionListener(this);
    standbyAllowedButton.setBackground(Color.WHITE);
    standbyAllowedButton.setOpaque(true);

    runStepClockButton.setActionCommand(MANUAL_CLK_STRING);
    runStepClockButton.addActionListener(this);

    stepClockButton.setActionCommand(STEP_CLOCK_STRING);
    stepClockButton.addActionListener(this);
    stepClockButton.setEnabled(true);

    runStepInstButton.setActionCommand(STEP_INST_STRING);
    runStepInstButton.addActionListener(this);

    clearParityAlarmButton.setActionCommand(CLEAR_PARITY_ALARM_STRING);
    clearParityAlarmButton.addActionListener(this);

    instructionSequenceButton.setActionCommand(INSTRUCTION_STRING);
    instructionSequenceButton.addActionListener(this);

    interruptButton.setActionCommand(INTERRUPT_STRING);
    interruptButton.addActionListener(this);

    f13Button.setActionCommand(F13_STRING);
    f13Button.addActionListener(this);

    f17Button.setActionCommand(F17_STRING);
    f17Button.addActionListener(this);

    stepInstructionButton.setActionCommand(STEP_INSTRUCTION_STRING);
    stepInstructionButton.addActionListener(this);
    stepInstructionButton.setEnabled(true);

    resetButton.setActionCommand(RESET_STRING);
    resetButton.addActionListener(this);

    incCounterButton.setActionCommand(INCREMENT_COUNTER_STRING);
    incCounterButton.addActionListener(this);

    clearParityAlarmButton.setActionCommand(CLEAR_PARITY_ALARM_STRING);
    clearParityAlarmButton.addActionListener(this);

    standbyButton.setActionCommand(STANDBY_STRING);
    standbyButton.addActionListener(this);

    this.add(runStepClockButton);
    this.add(stepClockButton);
    this.add(resetButton);
    this.add(scalerButton);
    this.add(runStepInstButton);
    this.add(instructionSequenceButton);
    this.add(stepInstructionButton);
    this.add(standbyAllowedButton);
    this.add(clearParityAlarmButton);
    this.add(interruptButton);
    this.add(incCounterButton);
    this.add(f13Button);
    this.add(f17Button);
    this.add(standbyButton);
  }

  @Override
  public void actionPerformed(ActionEvent e)
  {
    // <MCLK> (F2) Works in conjunction with FAST_CLK_STRING to choose either step or free run the clock.
    if (e.getActionCommand().equalsIgnoreCase(MANUAL_CLK_STRING))
    {
      agcControl.getMon().FCLK = true;
      agcControl.updateDisplay();

      runStepClockButton.setText(FAST_CLK_STRING);
      runStepClockButton.setActionCommand(FAST_CLK_STRING);
      stepClockButton.setEnabled(false);
    }
    // <FCLK> (F4) Works in conjunction with MANUAL_CLK_STRING to either step or free run the clock.
    else if (e.getActionCommand().equalsIgnoreCase(FAST_CLK_STRING))
    {
      agcControl.getMon().FCLK = false;
      agcControl.updateDisplay();

      runStepClockButton.setText(MANUAL_CLK_STRING);
      runStepClockButton.setActionCommand(MANUAL_CLK_STRING);
      stepClockButton.setEnabled(true);
    }

    // <CLK> (F1) If RUN/STEP clock is set to STEP, then single step the clock.
    else if (e.getActionCommand().equalsIgnoreCase(STEP_CLOCK_STRING))
    {
      agcControl.setSingleClock(true);
    }

    // <RUN> (r) Toggle between RUN and STEP modes.  RUN is normal mode, free-running.
    // STEP single steps by either an instruction or instruction subsequence.
    else if (e.getActionCommand().equalsIgnoreCase(RUN_INST_STRING))
    {
      agcControl.getMon().RUN = false;
      if (!agcControl.getMon().FCLK)
        agcControl.updateDisplay();

      runStepInstButton.setText(STEP_INST_STRING);
      runStepInstButton.setActionCommand(STEP_INST_STRING);
      stepInstructionButton.setEnabled(true);
    }
    // Works in conjunction with the RUN_INST_STRING.
    else if (e.getActionCommand().equalsIgnoreCase(STEP_INST_STRING))
    {
      agcControl.getMon().RUN = true;
      if (!agcControl.getMon().FCLK)
        agcControl.updateDisplay();

      runStepInstButton.setText(RUN_INST_STRING);
      runStepInstButton.setActionCommand(RUN_INST_STRING);
      stepInstructionButton.setEnabled(false);
    }

    // <STEP> (s) Single step to the next instruction or instruction subsequence.
    else if (e.getActionCommand().equalsIgnoreCase(STEP_INSTRUCTION_STRING))
    {
      agcControl.getMon().STEP = !agcControl.getMon().STEP;
      agcControl.genAGCStates();
      if (!agcControl.getMon().FCLK)
        agcControl.updateDisplay();
    }

    // <INST> (n) Toggle between instruction and instruction subsequence.
    else if (e.getActionCommand().equalsIgnoreCase(INSTRUCTION_STRING))
    {
      agcControl.getMon().INST = false;
      agcControl.updateDisplay();

      instructionSequenceButton.setText(SEQUENCE_STRING);
      instructionSequenceButton.setActionCommand(SEQUENCE_STRING);
    }
    // Works in conjunction with INSTRUCTION_STRING.
    else if (e.getActionCommand().equalsIgnoreCase(SEQUENCE_STRING))
    {
      agcControl.getMon().INST = true;
      agcControl.updateDisplay();

      instructionSequenceButton.setText(INSTRUCTION_STRING);
      instructionSequenceButton.setActionCommand(INSTRUCTION_STRING);
    }

    // <CLEAR PARITY ALARM> (;) Clear the parity alarm.
    else if (e.getActionCommand().equalsIgnoreCase(CLEAR_PARITY_ALARM_STRING))
    {
      // Clear ALARM indicators
      agcControl.getPar().clearParityAlarm(); // Asynchronously clear PARITY FAIL
      agcControl.updateDisplay();
    }

    // <INTERRUPT> (i) Manually generate an interrupt.  Will ask for an interrupt number.
    else if (e.getActionCommand().equalsIgnoreCase(INTERRUPT_STRING))
    {
      agcControl.interrupt();
    }

    // <TOGGLE SCALAR> (c) Toggles the scaler on/off.  When off the F13 and F17 signals are not generated.
    else if (e.getActionCommand().equalsIgnoreCase(SCALER_STRING))
    {
      if (agcControl.getMon().SCL_ENAB)
      {
        agcControl.getMon().SCL_ENAB = false;
        scalerButton.setBackground(Color.WHITE);
      }
      else
      {
        agcControl.getMon().SCL_ENAB = true;
        scalerButton.setBackground(Color.GREEN);
      }

      agcControl.genAGCStates();
      agcControl.updateDisplay();
    }

    // <F17> (z) Manually generate an F17 pulse.  Use when scalar is off and stepping through code.
    else if (e.getActionCommand().equalsIgnoreCase(F17_STRING))
    {
      //SCL.F17 = (SCL.F17 + 1) % 2;
      agcControl.genAGCStates();
      agcControl.updateDisplay();
    }

    // <F13> (x) Manually generate an F13 pulse.  Use when scalar is off and stepping through code.
    else if (e.getActionCommand().equalsIgnoreCase(F13_STRING))
    {
      //SCL.F13 = (SCL.F13 + 1) % 2;
      agcControl.genAGCStates();
      agcControl.updateDisplay();
    }

    // <RESET> (h) Resets the AGC by sending a GENRST signal.
    // This is a momentary switch.
    else if (e.getActionCommand().equalsIgnoreCase(RESET_STRING))
    {
      agcControl.getMon().PURST = false;
      agcControl.genAGCStates();
    }

    // <+CNTR> ([) Manually increment a counter.  Will ask for cell number.
    else if (e.getActionCommand().equalsIgnoreCase(INCREMENT_COUNTER_STRING))
    {
      agcControl.incrCntr();
    }

    // <STANDBY> (n/a) Go to Standby mode.
    else if (e.getActionCommand().equalsIgnoreCase(STANDBY_STRING))
    {
      // Set Standby mode.
      agcControl.getMon().SA = true;
      agcControl.updateDisplay();
    }
  }
}
