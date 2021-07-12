/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class displays the main simulation window which includes
            the main menu.

  Mods:		  07/15/21 Initial Release.
*/

package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrame extends JFrame implements ActionListener
{
  private AGCControl parent;

  private ProcessingPanel processingPanel;
  private InstructionPanel instructionPanel;
  private MemoryPanel memoryPanel;
  private IndicatorsPanel indicatorsPanel;
  private DisplayPanel displayPanel;
  private MemoryRegistersPanel memoryRegistersPanel;
  private ChannelPanel channelPanel;
  private ControlPulsePanel controlPulsePanel;
  private SimStatesPanel simStatesPanel;
  private HelpWindow helpWindow = null;
  private SourceCodeWindow sourceCodeWindow = null;

  // Menu Definitions
  private static final String SIMULATOR_CONTROL_MENU = "Control";
  private static final String QUIT = "Quit";
  private static final String LOAD = "Load";

  private static final String BREAKPOINT_MENU = "Breakpoint";
  private static final String SET_BREAKPOINT = "Set Breakpoint";
  private static final String CLEAR_BREAKPOINT = "Clear Breakpoint";
  private static final String RUPT_BREAKPOINT = "Interrupt Breakpoint";
  private static final String COUNTER_BREAKPOINT = "Counter Breakpoint";
  private static final String DISPLAY_MENU = "Display";
  private static final String DISPLAY_DETAILS = "Display Details";
  private static final String EXAMINE = "Examine";
  private static final String SHOW_SOURCE = "Show Source";

  private static final String HELP_MENU = "Help";
  private static final String SHOW_HELP = "Help";

  private JCheckBox displayDetailsItem = new JCheckBox(DISPLAY_DETAILS);

  MainFrame(AGCControl parent)
  {
    this.parent = parent;

    KeyboardPanel keyboardPanel = new KeyboardPanel(parent);
    processingPanel = new ProcessingPanel();
    instructionPanel = new InstructionPanel();
    memoryPanel = new MemoryPanel();
    ControlPanel controlPanel = new ControlPanel(parent);
    indicatorsPanel = new IndicatorsPanel();
    displayPanel = new DisplayPanel();
    memoryRegistersPanel = new MemoryRegistersPanel();
    channelPanel = new ChannelPanel();
    controlPulsePanel = new ControlPulsePanel();
    simStatesPanel = new SimStatesPanel();

    try
    {
      UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    this.setLayout(new GridBagLayout());
    GridBagConstraints c = new GridBagConstraints();
    c.weighty = 1.0;
    c.weightx = 1.0;
    c.gridx = 0;
    c.gridy = 0;
    this.add(keyboardPanel, c);

    c.gridy = 1;
    this.add(controlPanel, c);

    c.gridx = 1;
    c.gridy = 0;
    c.gridheight = 2;
    this.add(indicatorsPanel, c);

    c.gridx = 2;
    c.gridheight = 2;
    this.add(displayPanel, c);

    c.gridx = 0;
    c.gridy = 2;
    c.gridheight = 1;
    this.add(processingPanel, c);

    c.gridx = 1;
    this.add(instructionPanel, c);

    c.gridx = 2;
    this.add(memoryPanel, c);

    c.gridx = 0;
    c.gridy = 3;
    this.add(memoryRegistersPanel, c);

    c.gridx = 1;
    this.add(channelPanel, c);

    c.gridx = 2;
    this.add(simStatesPanel, c);

    c.gridx = 0;
    c.gridy = 4;
    c.gridwidth = 4;
    controlPulsePanel.setMinimumSize(new Dimension(600, 20));
    this.add(controlPulsePanel, c);

    JMenu fileMenu = new JMenu(SIMULATOR_CONTROL_MENU);

    JMenuItem quitItem = new JMenuItem(QUIT);
    quitItem.setActionCommand(QUIT);
    quitItem.addActionListener(this);

    JMenuItem loadItem = new JMenuItem(LOAD);
    loadItem.setActionCommand(LOAD);
    loadItem.addActionListener(this);

    fileMenu.add(loadItem);
    fileMenu.addSeparator();
    fileMenu.add(quitItem);

    JMenu debugMenu = new JMenu(BREAKPOINT_MENU);

    JMenuItem setBreakpointItem = new JMenuItem(SET_BREAKPOINT);
    setBreakpointItem.setActionCommand(SET_BREAKPOINT);
    setBreakpointItem.addActionListener(this);

    JMenuItem clearBreakpointItem = new JMenuItem(CLEAR_BREAKPOINT);
    clearBreakpointItem.setActionCommand(CLEAR_BREAKPOINT);
    clearBreakpointItem.addActionListener(this);

    JMenuItem ruptBreakpointItem = new JMenuItem(RUPT_BREAKPOINT);
    ruptBreakpointItem.setActionCommand(RUPT_BREAKPOINT);
    ruptBreakpointItem.addActionListener(this);

    JMenuItem counterBreakpointItem = new JMenuItem(COUNTER_BREAKPOINT);
    counterBreakpointItem.setActionCommand(COUNTER_BREAKPOINT);
    counterBreakpointItem.addActionListener(this);

    debugMenu.add(setBreakpointItem);
    debugMenu.add(clearBreakpointItem);
    debugMenu.add(ruptBreakpointItem);
    debugMenu.add(counterBreakpointItem);

    JMenu displayMenu = new JMenu(DISPLAY_MENU);

    displayDetailsItem.setSelected(false);
    displayDetailsItem.setActionCommand(DISPLAY_DETAILS);
    displayDetailsItem.addActionListener(this);

    JMenuItem examineItem = new JMenuItem(EXAMINE);
    examineItem.setActionCommand(EXAMINE);
    examineItem.addActionListener(this);

    JMenuItem debugItem = new JMenuItem(SHOW_SOURCE);
    debugItem.setActionCommand(SHOW_SOURCE);
    debugItem.addActionListener(this);

    displayMenu.add(displayDetailsItem);
    displayMenu.add(examineItem);
    displayMenu.add(debugItem);

    JMenu helpMenu = new JMenu(HELP_MENU);

    JMenuItem helpItem = new JMenuItem(SHOW_HELP);
    helpItem.setActionCommand(SHOW_HELP);
    helpItem.addActionListener(this);

    helpMenu.add(helpItem);

    JMenuBar menuBar = new JMenuBar();
    menuBar.add(fileMenu);
    menuBar.add(debugMenu);
    menuBar.add(displayMenu);
    menuBar.add(helpMenu);
    this.setJMenuBar(menuBar);

    setResizable(false);
    setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    pack();
    setVisible(true);
  }

  public void displayAGC()
  {
    instructionPanel.setTpText(parent.getTpg().getPreviousState().name());
    instructionPanel.setStageRegText(Integer.toOctalString(parent.getSeq().readRegisterStage()));
    instructionPanel.setPreStageRegText(Integer.toOctalString(parent.getSeq().readRegisterPreStage()));
    instructionPanel.setBr1RegText(Integer.toOctalString(parent.getSeq().readRegisterBR1()));
    instructionPanel.setBr2RegText(Integer.toOctalString(parent.getSeq().readRegisterBR2()));
    instructionPanel.setSniRegText(Integer.toOctalString(parent.getSeq().readRegisterSNI()));
    instructionPanel.setSubseqText(parent.getSeq().readSubseq().toString());
    instructionPanel.setBRegText(Integer.toOctalString(parent.getAlu().readRegisterB()));
    instructionPanel.setExtText(Integer.toOctalString(parent.getSeq().readRegisterEXT()));
    instructionPanel.setSqText(Integer.toOctalString(parent.getSeq().readRegisterSQ()));

    processingPanel.setXRegText(Integer.toOctalString(parent.getAlu().readRegisterX()));
    processingPanel.setYRegText(Integer.toOctalString(parent.getAlu().readRegisterY()));
    processingPanel.setUpcellRegText(Integer.toOctalString(parent.getCtr().readRegisterUpCell()));
    processingPanel.setURegText(Integer.toOctalString(parent.getAlu().readRegisterU()));
    processingPanel.setRpCellRegText(Integer.toOctalString(parent.getInr().readRegisterRpCell()));
    processingPanel.setInhRegText(Integer.toOctalString(parent.getInr().readRegisterINHINT()));
    processingPanel.setCiRegText(Integer.toOctalString(parent.getAlu().readRegisterCI()));

    controlPulsePanel.setControlPulseText(parent.getSeq().getControlPulses());

    memoryPanel.setF10RegText(Integer.toOctalString(parent.getScl().readRegisterF10()));
    memoryPanel.setF13RegText(Integer.toOctalString(parent.getScl().readRegisterF13()));
    memoryPanel.setF17RegText(Integer.toOctalString(parent.getScl().readRegisterF17()));
    memoryPanel.setSclRegText(Integer.toOctalString(parent.getScl().readRegisterSCL()));
    memoryPanel.setSRegText(Integer.toOctalString(parent.getAdr().readRegisterS()));
    memoryPanel.setGRegText(Integer.toOctalString(parent.getMbf().readRegisterG()));
    memoryPanel.setPRegText(Integer.toOctalString(parent.getPar().readRegisterP()));
    memoryPanel.setWriteBusText(Integer.toOctalString(parent.getWriteBus().read()));

    simStatesPanel.setRunText(Boolean.toString(parent.getMon().RUN));
    simStatesPanel.setStepText(Boolean.toString(parent.getMon().STEP));
    simStatesPanel.setInstText(Boolean.toString(parent.getMon().INST));
    simStatesPanel.setProgText(Boolean.toString(parent.getMon().PROG));
    simStatesPanel.setPurstText(Boolean.toString(parent.getMon().PURST));
    simStatesPanel.setFclkText(Boolean.toString(parent.getMon().FCLK));
    simStatesPanel.setDebugText(Boolean.toString(parent.getMon().breakpointEnabled));
    simStatesPanel.setRuptText(Boolean.toString(parent.getMon().ruptBreakpointEnabled));
    simStatesPanel.setCtrText(Boolean.toString(parent.getMon().counterBreakpointEnabled));
    simStatesPanel.setAddrText(Integer.toOctalString(parent.getMon().breakpointAddress));

    displayPanel.lightCompActivity(parent.getDsp().getCompActy());
    displayPanel.lightFlash(parent.getDsp().getFlash());
    indicatorsPanel.lightUplinkActivity(parent.getDsp().getUplinkActy());
    indicatorsPanel.lightTemp(parent.getDsp().getTemp());
    indicatorsPanel.lightKeyRel(parent.getDsp().getKeyRel());
    indicatorsPanel.lightOperErr(parent.getDsp().getOperErr());
    indicatorsPanel.lightStby(parent.getDsp().getStby());
    indicatorsPanel.lightAlt(parent.getDsp().getAltIndicator());
    indicatorsPanel.lightVel(parent.getDsp().getVelIndicator());
    indicatorsPanel.lightGimbalLock(parent.getDsp().getGimbalLockIndicator());
    indicatorsPanel.lightNoAtt(parent.getDsp().getNoAttIndicator());
    indicatorsPanel.lightProg(parent.getDsp().getProgIndicator());
    indicatorsPanel.lightTracker(parent.getDsp().getTrackerIndicator());

    memoryRegistersPanel.setARegText(Integer.toOctalString(parent.getCrg().readRegisterA()));
    memoryRegistersPanel.setLRegText(Integer.toOctalString(parent.getCrg().readRegisterL()));
    memoryRegistersPanel.setQRegText(Integer.toOctalString(parent.getCrg().readRegisterQ()));
    memoryRegistersPanel.setEBRegText(Integer.toOctalString(parent.getAdr().readRegisterEB()));
    memoryRegistersPanel.setFBRegText(Integer.toOctalString(parent.getAdr().readRegisterFBShifted()));
    memoryRegistersPanel.setZRegText(Integer.toOctalString(parent.getCrg().readRegisterZ()));
    memoryRegistersPanel.setBBRegText(Integer.toOctalString(parent.getAdr().readRegisterBB()));
    memoryRegistersPanel.setAruptText(Integer.toOctalString(parent.getEfm().readMemory (010)));
    memoryRegistersPanel.setLruptText(Integer.toOctalString(parent.getEfm().readMemory (011)));
    memoryRegistersPanel.setQruptText(Integer.toOctalString(parent.getEfm().readMemory (012)));
    memoryRegistersPanel.setZruptText(Integer.toOctalString(parent.getEfm().readMemory (015)));
    memoryRegistersPanel.setBBruptText(Integer.toOctalString(parent.getEfm().readMemory (016)));
    memoryRegistersPanel.setBruptText(Integer.toOctalString(parent.getEfm().readMemory (017)));
    memoryRegistersPanel.setCyrText(Integer.toOctalString(parent.getEfm().readMemory(020)));
    memoryRegistersPanel.setSrText(Integer.toOctalString(parent.getEfm().readMemory (021)));
    memoryRegistersPanel.setCylText(Integer.toOctalString(parent.getEfm().readMemory (022)));
    memoryRegistersPanel.setEdopText(Integer.toOctalString(parent.getEfm().readMemory (023)));
    memoryRegistersPanel.setTime2Text(Integer.toOctalString(parent.getEfm().readMemory (024)));
    memoryRegistersPanel.setTime1Text(Integer.toOctalString(parent.getEfm().readMemory(025)));
    memoryRegistersPanel.setTime3Text(Integer.toOctalString(parent.getEfm().readMemory(026)));
    memoryRegistersPanel.setTime4Text(Integer.toOctalString(parent.getEfm().readMemory(027)));

    channelPanel.setChannel7Text(Integer.toOctalString((parent.getAdr().readChannel7() >> 6) & 01));
    channelPanel.setChannel10Text(Integer.toOctalString(parent.getDsp().readChannel10()));
    channelPanel.setChannel11Text(Integer.toOctalString(parent.getDsp().readChannel11()));
    channelPanel.setChannel12Text(Integer.toOctalString(parent.getIos().readChannel12()));
    channelPanel.setChannel13Text(Integer.toOctalString(parent.getDsp().readChannel13()));
    channelPanel.setChannel14Text(Integer.toOctalString(parent.getIos().readChannel14()));
    channelPanel.setChannel15Text(Integer.toOctalString(parent.getKbd().readChannel15()));
    channelPanel.setChannel16Text(Integer.toOctalString(parent.getKbd().readChannel16()));
    channelPanel.setChannel30Text(Integer.toOctalString(parent.getIos().readChannel30()));
    channelPanel.setChannel32Text(Integer.toOctalString(parent.getKbd().readChannel32()));
    channelPanel.setChannel33Text(Integer.toOctalString(parent.getIos().readChannel33()));
    channelPanel.setChannel77Text(Integer.toOctalString(parent.getIos().readChannel77()));

    displayPanel.lightFlash(parent.getDsp().flash);
    displayPanel.setMD1(String.valueOf(parent.getDsp().MD1));
    displayPanel.setMD2(String.valueOf(parent.getDsp().MD2));
    displayPanel.setVD1(String.valueOf(parent.getDsp().VD1));
    displayPanel.setVD2(String.valueOf(parent.getDsp().VD2));
    displayPanel.setND1(String.valueOf(parent.getDsp().ND1));
    displayPanel.setND2(String.valueOf(parent.getDsp().ND2));
    displayPanel.setR1S(String.valueOf(parent.getDsp().R1S));
    displayPanel.setR1D1(String.valueOf(parent.getDsp().R1D1));
    displayPanel.setR1D2(String.valueOf(parent.getDsp().R1D2));
    displayPanel.setR1D3(String.valueOf(parent.getDsp().R1D3));
    displayPanel.setR1D4(String.valueOf(parent.getDsp().R1D4));
    displayPanel.setR1D5(String.valueOf(parent.getDsp().R1D5));
    displayPanel.setR2S(String.valueOf(parent.getDsp().R2S));
    displayPanel.setR2D1(String.valueOf(parent.getDsp().R2D1));
    displayPanel.setR2D2(String.valueOf(parent.getDsp().R2D2));
    displayPanel.setR2D3(String.valueOf(parent.getDsp().R2D3));
    displayPanel.setR2D4(String.valueOf(parent.getDsp().R2D4));
    displayPanel.setR2D5(String.valueOf(parent.getDsp().R2D5));
    displayPanel.setR3S(String.valueOf(parent.getDsp().R3S));
    displayPanel.setR3D1(String.valueOf(parent.getDsp().R3D1));
    displayPanel.setR3D2(String.valueOf(parent.getDsp().R3D2));
    displayPanel.setR3D3(String.valueOf(parent.getDsp().R3D3));
    displayPanel.setR3D4(String.valueOf(parent.getDsp().R3D4));
    displayPanel.setR3D5(String.valueOf(parent.getDsp().R3D5));
  }

  public void actionPerformed(ActionEvent e)
  {
    if (e.getActionCommand().equalsIgnoreCase(QUIT))
    {
      System.exit(0);
    }
    else if (e.getActionCommand().equalsIgnoreCase(LOAD))
    {
      String filename = JOptionPane.showInputDialog("Load Memory -- enter filename:");
      parent.loadMemory(filename);
    }
    else if (e.getActionCommand().equalsIgnoreCase(SET_BREAKPOINT))
    {
      parent.setBreakpoint();
    }
    else if (e.getActionCommand().equalsIgnoreCase(CLEAR_BREAKPOINT))
    {
      parent.getMon().breakpointEnabled = false;
      parent.getMon().breakpointAddress = 0;
      displayAGC();
    }
    else if (e.getActionCommand().equalsIgnoreCase(RUPT_BREAKPOINT))
    {
      parent.getMon().ruptBreakpointEnabled = true;
      displayAGC();
    }
    else if (e.getActionCommand().equalsIgnoreCase(COUNTER_BREAKPOINT))
    {
      parent.getMon().counterBreakpointEnabled = true;
      displayAGC();
    }
    else if (e.getActionCommand().equalsIgnoreCase(DISPLAY_DETAILS))
    {
      parent.getMon().displayDetails = displayDetailsItem.isSelected();
      displayAGC();
    }
    else if (e.getActionCommand().equalsIgnoreCase(EXAMINE))
    {
      parent.examineMemory(this);
    }
    else if (e.getActionCommand().equalsIgnoreCase(SHOW_SOURCE))
    {
      // Display lines of source code around current line.
      String[] lines = parent.getSourceCode();
      if (sourceCodeWindow == null)
      {
        sourceCodeWindow = new SourceCodeWindow(lines, parent);
      }
      else
      {
        sourceCodeWindow.updateLines(lines);
        sourceCodeWindow.setVisible(true);
      }
    }
    else if (e.getActionCommand().equalsIgnoreCase(SHOW_HELP))
    {
      // Display the help index window.
      if (helpWindow == null)
        helpWindow = new HelpWindow();
      else
        helpWindow.setVisible(true);
    }
    else
    {
      System.out.println("Bad Input: " + e.getActionCommand());
    }
  }
}

