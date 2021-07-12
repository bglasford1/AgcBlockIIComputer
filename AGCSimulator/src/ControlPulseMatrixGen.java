/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This program generates the Control Pulse Matrix file that is
            in a Motorola S-Record format.  The resulting file is used as
            input to the AGC Simulator and can be used to burn a series of
            EPROMs.  The contents of this file can be found in original
            NASA documentation.  Note that there are minor discrepancies
            in the different versions contained within NASA documentation.
            The original NASA definition has also been modified slightly
            for simulation purposes of this implementation.

  Mods:		  07/15/21 Initial Release.
*/

import enums.CpType;
import enums.Subseq;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * This class is used to build the EPROM definition files in Motorola S-Record format for the Control Pulse Matrix.
 */
public class ControlPulseMatrixGen
{
  private static final int MAXPULSES = 15;
  private static final int MAX_IPULSES = 5; // no more than 5 instruction-generated pulses active at any time

  private static CpType[] glbl_cp = new CpType[MAXPULSES]; // current set of asserted control pulses (MAXPULSES)

  private enum BrType
  {
    BR00,  // BR1=0, BR2=0
    BR01,  // BR1=0, BR2=1
    BR10,  // BR1=1, BR2=0
    BR11,  // BR1=1, BR2=1
    NO_BR  // NO BRANCH
  }

  private class ControlSubStep
  {
    BrType br;       // normally no branch (NO_BR)
    CpType[] pulses; // contains 0 - MAXPULSES control pulses

    ControlSubStep(BrType br, CpType p1, CpType p2, CpType p3, CpType p4, CpType p5)
    {
      this.br = br;
      this.pulses = new CpType[]{p1, p2, p3, p4, p5};
    }

    CpType[] getPulses()
    {
      return pulses;
    }
  }

  private class ControlStep
  {
    private ControlSubStep[] substeps = new ControlSubStep[4];

    ControlStep(CpType p1, CpType p2, CpType p3, CpType p4, CpType p5)
    {
      setSubstep(p1, p2, p3, p4, p5);
    }

    ControlSubStep getSubstep(int br)
    {
      return substeps[br];
    }

    void setSubstep(CpType p1, CpType p2, CpType p3, CpType p4, CpType p5)
    {
      substeps[0] = new ControlSubStep(BrType.NO_BR, p1, p2, p3, p4, p5);
      for (int i = 1; i < 4; i++)
      {
        substeps[i] = new ControlSubStep(BrType.NO_BR,
                                         CpType.NO_PULSE,
                                         CpType.NO_PULSE,
                                         CpType.NO_PULSE,
                                         CpType.NO_PULSE,
                                         CpType.NO_PULSE);
      }
    }

    void setBranchStep(BrType br, CpType p1, CpType p2, CpType p3, CpType p4, CpType p5)
    {
      substeps[br.ordinal()] = new ControlSubStep(br, p1, p2, p3, p4, p5);
    }
  }

  private class Subsequence
  {
    // An array indexed by TP consisting of 12 control steps.
    private ControlStep[] controlSteps = new ControlStep[15];

    ControlStep getControlStep(int tp)
    {
      return controlSteps[tp];
    }

    void setStep(int tp, ControlStep controlStep)
    {
      this.controlSteps[tp + 1] = controlStep;
    }

    void setBrStep(int tp, BrType br, CpType p1, CpType p2, CpType p3, CpType p4, CpType p5)
    {
      ControlStep thisStep = this.controlSteps[tp + 1];
      if (thisStep == null)
        this.controlSteps[tp + 1] = new ControlStep(p1, p2, p3, p4, p5);

      this.controlSteps[tp + 1].setBranchStep(br, p1, p2, p3, p4, p5);
    }
  }

  private Subsequence NO_SUBSEQ = new Subsequence();
  private Subsequence SUB_STD2  = new Subsequence();
  private Subsequence SUB_TC0   = new Subsequence();
  private Subsequence SUB_TCF0  = new Subsequence();
  private Subsequence SUB_CCS0  = new Subsequence();
  private Subsequence SUB_BZF0  = new Subsequence();
  private Subsequence SUB_BZMF0 = new Subsequence();
  private Subsequence SUB_CA0   = new Subsequence();
  private Subsequence SUB_CS0   = new Subsequence();
  private Subsequence SUB_DCA0  = new Subsequence();
  private Subsequence SUB_DCA1  = new Subsequence();
  private Subsequence SUB_DCS0  = new Subsequence();
  private Subsequence SUB_DCS1  = new Subsequence();
  private Subsequence SUB_TS0   = new Subsequence();
  private Subsequence SUB_XCH0  = new Subsequence();
  private Subsequence SUB_LXCH0 = new Subsequence();
  private Subsequence SUB_QXCH0 = new Subsequence();
  private Subsequence SUB_DXCH0 = new Subsequence();
  private Subsequence SUB_DXCH1 = new Subsequence();
  private Subsequence SUB_NDX0  = new Subsequence();
  private Subsequence SUB_NDX1  = new Subsequence();
  private Subsequence SUB_NDXX0 = new Subsequence();
  private Subsequence SUB_NDXX1 = new Subsequence();
  private Subsequence SUB_AD0   = new Subsequence();
  private Subsequence SUB_SU0   = new Subsequence();
  private Subsequence SUB_MP0   = new Subsequence();
  private Subsequence SUB_MP1   = new Subsequence();
  private Subsequence SUB_MP3   = new Subsequence();
  private Subsequence SUB_DV0   = new Subsequence();
  private Subsequence SUB_DV1   = new Subsequence();
  private Subsequence SUB_DV3   = new Subsequence();
  private Subsequence SUB_DV7   = new Subsequence();
  private Subsequence SUB_DV6   = new Subsequence();
  private Subsequence SUB_DV4   = new Subsequence();
  private Subsequence SUB_ADS0  = new Subsequence();
  private Subsequence SUB_DAS0  = new Subsequence();
  private Subsequence SUB_DAS1  = new Subsequence();
  private Subsequence SUB_INCR0 = new Subsequence();
  private Subsequence SUB_AUG0  = new Subsequence();
  private Subsequence SUB_DIM0  = new Subsequence();
  private Subsequence SUB_MSU0  = new Subsequence();
  private Subsequence SUB_MSK0  = new Subsequence();
  private Subsequence SUB_READ0  = new Subsequence();
  private Subsequence SUB_WRITE0  = new Subsequence();
  private Subsequence SUB_RAND0  = new Subsequence();
  private Subsequence SUB_WAND0  = new Subsequence();
  private Subsequence SUB_ROR0  = new Subsequence();
  private Subsequence SUB_WOR0  = new Subsequence();
  private Subsequence SUB_RXOR0  = new Subsequence();
  private Subsequence SUB_RSM3  = new Subsequence();
  private Subsequence SUB_RUPT0 = new Subsequence();
  private Subsequence SUB_RUPT1 = new Subsequence();
  private Subsequence SUB_GOJ1  = new Subsequence();
  private Subsequence SUB_PINC  = new Subsequence();

  private ControlStep stepInactive = new ControlStep(CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE,
                                                     CpType.NO_PULSE);

  private void initialize()
  {
    NO_SUBSEQ.setStep(1,  stepInactive);
    NO_SUBSEQ.setStep(2,  stepInactive);
    NO_SUBSEQ.setStep(3,  stepInactive);
    NO_SUBSEQ.setStep(4,  stepInactive);
    NO_SUBSEQ.setStep(5,  stepInactive);
    NO_SUBSEQ.setStep(6,  stepInactive);
    NO_SUBSEQ.setStep(7,  stepInactive);
    NO_SUBSEQ.setStep(8,  stepInactive);
    NO_SUBSEQ.setStep(9,  stepInactive);
    NO_SUBSEQ.setStep(10, stepInactive);
    NO_SUBSEQ.setStep(11, stepInactive);
    NO_SUBSEQ.setStep(12, stepInactive);

    SUB_STD2.setStep(1,  new ControlStep(CpType.RZ,   CpType.WY12,     CpType.CI,        CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_STD2.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NISQ,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_STD2.setStep(3,  stepInactive);
    SUB_STD2.setStep(4,  stepInactive);
    SUB_STD2.setStep(5,  stepInactive);
    SUB_STD2.setStep(6,  new ControlStep(CpType.RU,   CpType.WZ,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_STD2.setStep(7,  stepInactive);
    SUB_STD2.setStep(8,  new ControlStep(CpType.RAD,  CpType.WB,       CpType.WS,        CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_STD2.setStep(9,  stepInactive);
    SUB_STD2.setStep(10, stepInactive);
    SUB_STD2.setStep(11, stepInactive);
    SUB_STD2.setStep(12, stepInactive);

    SUB_TC0.setStep(1,  new ControlStep(CpType.RB,    CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TC0.setStep(2,  new ControlStep(CpType.RSC,   CpType.WG,       CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TC0.setStep(3,  new ControlStep(CpType.RZ,    CpType.WQ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TC0.setStep(4,  stepInactive);
    SUB_TC0.setStep(5,  stepInactive);
    SUB_TC0.setStep(6,  new ControlStep(CpType.RU,    CpType.WZ,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TC0.setStep(7,  stepInactive);
    SUB_TC0.setStep(8,  new ControlStep(CpType.RAD,   CpType.WB,       CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TC0.setStep(9,  stepInactive);
    SUB_TC0.setStep(10, stepInactive);
    SUB_TC0.setStep(11, stepInactive);
    SUB_TC0.setStep(12, stepInactive);

    SUB_TCF0.setStep(1,  new ControlStep(CpType.RB,    CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TCF0.setStep(2,  new ControlStep(CpType.RSC,   CpType.WG,       CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TCF0.setStep(3,  stepInactive);
    SUB_TCF0.setStep(4,  stepInactive);
    SUB_TCF0.setStep(5,  stepInactive);
    SUB_TCF0.setStep(6,  new ControlStep(CpType.RU,    CpType.WZ,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TCF0.setStep(7,  stepInactive);
    SUB_TCF0.setStep(8,  new ControlStep(CpType.RAD,   CpType.WB,       CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TCF0.setStep(9,  stepInactive);
    SUB_TCF0.setStep(10, stepInactive);
    SUB_TCF0.setStep(11, stepInactive);
    SUB_TCF0.setStep(12, stepInactive);

    SUB_CCS0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CCS0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CCS0.setStep(3,  stepInactive);
    SUB_CCS0.setStep(4,  stepInactive);
    SUB_CCS0.setStep(5,  new ControlStep(CpType.RG,     CpType.WB,       CpType.TSGN,     CpType.TMZ,      CpType.TPZG));
    SUB_CCS0.setStep(6,  stepInactive);
    SUB_CCS0.setBrStep(7,  BrType.BR00,  CpType.RZ,     CpType.WY12,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_CCS0.setBrStep(7,  BrType.BR01,  CpType.RZ,     CpType.WY12,     CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_CCS0.setBrStep(7,  BrType.BR10,  CpType.RZ,     CpType.WY12,     CpType.PTWOX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_CCS0.setBrStep(7,  BrType.BR11,  CpType.RZ,     CpType.WY12,     CpType.PONEX,    CpType.PTWOX,    CpType.NO_PULSE);
    SUB_CCS0.setStep(8,  new ControlStep(CpType.RU,     CpType.WZ,       CpType.WS,       CpType.NO_PULSE, CpType.TPZG));
    SUB_CCS0.setStep(9,  new ControlStep(CpType.RB,     CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CCS0.setBrStep(10, BrType.BR00,  CpType.WY,     CpType.RB,       CpType.MONEX,    CpType.CI,       CpType.ST2);
    SUB_CCS0.setBrStep(10, BrType.BR01,  CpType.WY,     CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_CCS0.setBrStep(10, BrType.BR10,  CpType.WY,     CpType.RC,       CpType.MONEX,    CpType.CI,       CpType.ST2);
    SUB_CCS0.setBrStep(10, BrType.BR11,  CpType.WY,     CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_CCS0.setStep(11, new ControlStep(CpType.RU,     CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CCS0.setStep(12, stepInactive);

    SUB_BZF0.setStep(1,  new ControlStep(CpType.RA,   CpType.WG,       CpType.TSGN,     CpType.TMZ,      CpType.NO_PULSE));
    SUB_BZF0.setStep(2,  new ControlStep(CpType.TPZG, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_BZF0.setStep(3,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_BZF0.setStep(4,  stepInactive);
    SUB_BZF0.setBrStep(5,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(5,  BrType.BR01,  CpType.RB,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(5,  BrType.BR10,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(5,  BrType.BR11,  CpType.RB,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(6,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(6,  BrType.BR01,  CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(6,  BrType.BR10,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(6,  BrType.BR11,  CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setStep(7,  stepInactive);
    SUB_BZF0.setBrStep(8,  BrType.BR00,  CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(8,  BrType.BR01,  CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NISQ,     CpType.NO_PULSE);
    SUB_BZF0.setBrStep(8,  BrType.BR10,  CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZF0.setBrStep(8,  BrType.BR11,  CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NISQ,     CpType.NO_PULSE);
    SUB_BZF0.setStep(9,  stepInactive);
    SUB_BZF0.setStep(10, stepInactive);
    SUB_BZF0.setStep(11, stepInactive);
    SUB_BZF0.setStep(12, stepInactive);

    SUB_BZMF0.setStep(1,  new ControlStep(CpType.RA,   CpType.WG,       CpType.TSGN,     CpType.TMZ,      CpType.NO_PULSE));
    SUB_BZMF0.setStep(2,  new ControlStep(CpType.TPZG, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_BZMF0.setStep(3,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_BZMF0.setStep(4,  stepInactive);
    SUB_BZMF0.setBrStep(5,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(5,  BrType.BR01,  CpType.RB,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(5,  BrType.BR10,  CpType.RB,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(5,  BrType.BR11,  CpType.RB,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(6,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(6,  BrType.BR01,  CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(6,  BrType.BR10,  CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(6,  BrType.BR11,  CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setStep(7,  stepInactive);
    SUB_BZMF0.setBrStep(8,  BrType.BR00,  CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(8,  BrType.BR01,  CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NISQ,     CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(8,  BrType.BR10,  CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NISQ,     CpType.NO_PULSE);
    SUB_BZMF0.setBrStep(8,  BrType.BR11,  CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NISQ,     CpType.NO_PULSE);
    SUB_BZMF0.setStep(9,  stepInactive);
    SUB_BZMF0.setStep(10, stepInactive);
    SUB_BZMF0.setStep(11, stepInactive);
    SUB_BZMF0.setStep(12, stepInactive);

    SUB_CA0.setStep(1,  stepInactive);
    SUB_CA0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CA0.setStep(3,  stepInactive);
    SUB_CA0.setStep(4,  stepInactive);
    SUB_CA0.setStep(5,  stepInactive);
    SUB_CA0.setStep(6,  stepInactive);
    SUB_CA0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CA0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CA0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CA0.setStep(10, new ControlStep(CpType.RB,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CA0.setStep(11, stepInactive);
    SUB_CA0.setStep(12, stepInactive);

    SUB_CS0.setStep(1,  stepInactive);
    SUB_CS0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CS0.setStep(3,  stepInactive);
    SUB_CS0.setStep(4,  stepInactive);
    SUB_CS0.setStep(5,  stepInactive);
    SUB_CS0.setStep(6,  stepInactive);
    SUB_CS0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CS0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CS0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CS0.setStep(10, new ControlStep(CpType.RC,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_CS0.setStep(11, stepInactive);
    SUB_CS0.setStep(12, stepInactive);

    SUB_DCA0.setStep(1,  new ControlStep(CpType.RB,   CpType.WY12,     CpType.MONEX,    CpType.CI,       CpType.NO_PULSE));
    SUB_DCA0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA0.setStep(3,  stepInactive);
    SUB_DCA0.setStep(4,  stepInactive);
    SUB_DCA0.setStep(5,  stepInactive);
    SUB_DCA0.setStep(6,  stepInactive);
    SUB_DCA0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA0.setStep(8,  new ControlStep(CpType.RU,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA0.setStep(10, new ControlStep(CpType.RB,   CpType.WL,       CpType.ST1,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA0.setStep(11, stepInactive);
    SUB_DCA0.setStep(12, stepInactive);

    SUB_DCA1.setStep(1,  stepInactive);
    SUB_DCA1.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA1.setStep(3,  stepInactive);
    SUB_DCA1.setStep(4,  stepInactive);
    SUB_DCA1.setStep(5,  stepInactive);
    SUB_DCA1.setStep(6,  stepInactive);
    SUB_DCA1.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA1.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA1.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA1.setStep(10, new ControlStep(CpType.RB,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCA1.setStep(11, stepInactive);
    SUB_DCA1.setStep(12, stepInactive);

    SUB_DCS0.setStep(1,  new ControlStep(CpType.RB,   CpType.WY12,     CpType.MONEX,    CpType.CI,       CpType.NO_PULSE));
    SUB_DCS0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS0.setStep(3,  stepInactive);
    SUB_DCS0.setStep(4,  stepInactive);
    SUB_DCS0.setStep(5,  stepInactive);
    SUB_DCS0.setStep(6,  stepInactive);
    SUB_DCS0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS0.setStep(8,  new ControlStep(CpType.RU,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS0.setStep(10, new ControlStep(CpType.RC,   CpType.WL,       CpType.ST1,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS0.setStep(11, stepInactive);
    SUB_DCS0.setStep(12, stepInactive);

    SUB_DCS1.setStep(1,  stepInactive);
    SUB_DCS1.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS1.setStep(3,  stepInactive);
    SUB_DCS1.setStep(4,  stepInactive);
    SUB_DCS1.setStep(5,  stepInactive);
    SUB_DCS1.setStep(6,  stepInactive);
    SUB_DCS1.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS1.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS1.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS1.setStep(10, new ControlStep(CpType.RC,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DCS1.setStep(11, stepInactive);
    SUB_DCS1.setStep(12, stepInactive);

    SUB_TS0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setStep(3,  new ControlStep(CpType.RA,       CpType.WB,       CpType.TOV,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setBrStep(4,  BrType.BR00,  CpType.RZ,       CpType.WY12,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(4,  BrType.BR01,  CpType.RZ,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(4,  BrType.BR10,  CpType.RZ,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(4,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(5,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(5,  BrType.BR01,  CpType.RB1,      CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(5,  BrType.BR10,  CpType.R1C,      CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setBrStep(5,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_TS0.setStep(6,  new ControlStep(CpType.RU,       CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setStep(7,  new ControlStep(CpType.RB,       CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_TS0.setStep(9,  stepInactive);
    SUB_TS0.setStep(10, stepInactive);
    SUB_TS0.setStep(11, stepInactive);
    SUB_TS0.setStep(12, stepInactive);

    SUB_XCH0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(3,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(4,  stepInactive);
    SUB_XCH0.setStep(5,  new ControlStep(CpType.RG,     CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(6,  stepInactive);
    SUB_XCH0.setStep(7,  new ControlStep(CpType.RB,     CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_XCH0.setStep(9,  stepInactive);
    SUB_XCH0.setStep(10, stepInactive);
    SUB_XCH0.setStep(11, stepInactive);
    SUB_XCH0.setStep(12, stepInactive);

    SUB_LXCH0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(3,  new ControlStep(CpType.RL,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(4,  stepInactive);
    SUB_LXCH0.setStep(5,  new ControlStep(CpType.RG,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(6,  stepInactive);
    SUB_LXCH0.setStep(7,  new ControlStep(CpType.RB,     CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_LXCH0.setStep(9,  stepInactive);
    SUB_LXCH0.setStep(10, stepInactive);
    SUB_LXCH0.setStep(11, stepInactive);
    SUB_LXCH0.setStep(12, stepInactive);

    SUB_QXCH0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(3,  new ControlStep(CpType.RQ,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(4,  stepInactive);
    SUB_QXCH0.setStep(5,  new ControlStep(CpType.RG,     CpType.WQ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(6,  stepInactive);
    SUB_QXCH0.setStep(7,  new ControlStep(CpType.RB,     CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_QXCH0.setStep(9,  stepInactive);
    SUB_QXCH0.setStep(10, stepInactive);
    SUB_QXCH0.setStep(11, stepInactive);
    SUB_QXCH0.setStep(12, stepInactive);

    SUB_DXCH0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.WY12,     CpType.MONEX,    CpType.CI));
    SUB_DXCH0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(3,  new ControlStep(CpType.RL,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(4,  stepInactive);
    SUB_DXCH0.setStep(5,  new ControlStep(CpType.RG,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(6,  stepInactive);
    SUB_DXCH0.setStep(7,  new ControlStep(CpType.RB,     CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(8,  new ControlStep(CpType.RU,     CpType.WS,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(9,  stepInactive);
    SUB_DXCH0.setStep(10, new ControlStep(CpType.ST1,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH0.setStep(11, stepInactive);
    SUB_DXCH0.setStep(12, stepInactive);

    SUB_DXCH1.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(3,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(4,  stepInactive);
    SUB_DXCH1.setStep(5,  new ControlStep(CpType.RG,     CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(6,  stepInactive);
    SUB_DXCH1.setStep(7,  new ControlStep(CpType.RB,     CpType.WSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DXCH1.setStep(9,  stepInactive);
    SUB_DXCH1.setStep(10, stepInactive);
    SUB_DXCH1.setStep(11, stepInactive);
    SUB_DXCH1.setStep(12, stepInactive);

    SUB_NDX0.setStep(1,  stepInactive);
    SUB_NDX0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(3,  stepInactive);
    SUB_NDX0.setStep(4,  stepInactive);
    SUB_NDX0.setStep(5,  new ControlStep(CpType.TRSM, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(6,  stepInactive);
    SUB_NDX0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(10, new ControlStep(CpType.ST1,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX0.setStep(11, stepInactive);
    SUB_NDX0.setStep(12, stepInactive);

    SUB_NDX1.setStep(1,  new ControlStep(CpType.RZ,   CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(3,  new ControlStep(CpType.RB,   CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(4,  new ControlStep(CpType.RA,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(5,  new ControlStep(CpType.RZ,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(6,  new ControlStep(CpType.RU,   CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(7,  new ControlStep(CpType.RG,   CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(8,  new ControlStep(CpType.RU,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(9,  new ControlStep(CpType.RB,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(10, new ControlStep(CpType.RU,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDX1.setStep(11, stepInactive);
    SUB_NDX1.setStep(12, stepInactive);

    SUB_NDXX0.setStep(1,  stepInactive);
    SUB_NDXX0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX0.setStep(3,  stepInactive);
    SUB_NDXX0.setStep(4,  stepInactive);
    SUB_NDXX0.setStep(5,  stepInactive);
    SUB_NDXX0.setStep(6,  stepInactive);
    SUB_NDXX0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX0.setStep(10, new ControlStep(CpType.ST1,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX0.setStep(11, stepInactive);
    SUB_NDXX0.setStep(12, stepInactive);

    SUB_NDXX1.setStep(1,  new ControlStep(CpType.RZ,   CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(3,  new ControlStep(CpType.RB,   CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(4,  new ControlStep(CpType.RA,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(5,  new ControlStep(CpType.RZ,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(6,  new ControlStep(CpType.RU,   CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(7,  new ControlStep(CpType.RG,   CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(8,  new ControlStep(CpType.RU,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(9,  new ControlStep(CpType.RB,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(10, new ControlStep(CpType.RU,   CpType.WB,       CpType.EXT,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_NDXX1.setStep(11, stepInactive);
    SUB_NDXX1.setStep(12, stepInactive);

    SUB_AD0.setStep(1,  stepInactive);
    SUB_AD0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(3,  stepInactive);
    SUB_AD0.setStep(4,  stepInactive);
    SUB_AD0.setStep(5,  stepInactive);
    SUB_AD0.setStep(6,  stepInactive);
    SUB_AD0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(9,  new ControlStep(CpType.RB,   CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(10, new ControlStep(CpType.RB,   CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(11, new ControlStep(CpType.RU,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AD0.setStep(12, stepInactive);

    SUB_SU0.setStep(1,  stepInactive);
    SUB_SU0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(3,  stepInactive);
    SUB_SU0.setStep(4,  stepInactive);
    SUB_SU0.setStep(5,  stepInactive);
    SUB_SU0.setStep(6,  stepInactive);
    SUB_SU0.setStep(7,  new ControlStep(CpType.RG,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(9,  new ControlStep(CpType.RB,       CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(10, new ControlStep(CpType.RC,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(11, new ControlStep(CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_SU0.setStep(12, stepInactive);

    SUB_MP0.setStep(1,  stepInactive);
    SUB_MP0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP0.setStep(3,  new ControlStep(CpType.RA,     CpType.WB,       CpType.TSGN,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP0.setBrStep(4,  BrType.BR00,  CpType.RB,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(4,  BrType.BR01,  CpType.RB,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(4,  BrType.BR10,  CpType.RC,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(4,  BrType.BR11,  CpType.RC,     CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setStep(5,  stepInactive);
    SUB_MP0.setStep(6,  stepInactive);
    SUB_MP0.setStep(7,  new ControlStep(CpType.RG,     CpType.WB,       CpType.TSGN2,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP0.setBrStep(9,  BrType.BR00,  CpType.RB,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(9,  BrType.BR01,  CpType.RB,     CpType.WY,       CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(9,  BrType.BR10,  CpType.RC,     CpType.WY,       CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(9,  BrType.BR11,  CpType.RC,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setStep(10, new ControlStep(CpType.RU,     CpType.WB,       CpType.TSGN,     CpType.NEACON,   CpType.ST1));
    SUB_MP0.setBrStep(11, BrType.BR00,  CpType.WA,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(11, BrType.BR01,  CpType.WA,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP0.setBrStep(11, BrType.BR10,  CpType.RB1,    CpType.R1C,      CpType.WA,       CpType.L16,      CpType.NO_PULSE);
    SUB_MP0.setBrStep(11, BrType.BR11,  CpType.RB1,    CpType.R1C,      CpType.WA,       CpType.L16,      CpType.NO_PULSE);
    SUB_MP0.setStep(12, stepInactive);

    SUB_MP1.setStep(1,  new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(2,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(3,  new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(4,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(5,  new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(6,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(7,  new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(8,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(9,  new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(10, new ControlStep(CpType.ZAP,      CpType.ST1,      CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(11, new ControlStep(CpType.ZIP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP1.setStep(12, stepInactive);

    SUB_MP3.setStep(1,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(2,  new ControlStep(CpType.ZIP,      CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(3,  new ControlStep(CpType.ZAP,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(4,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(5,  new ControlStep(CpType.RZ,       CpType.WY12,     CpType.CI,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(6,  new ControlStep(CpType.RU,       CpType.WZ,       CpType.TL15,     CpType.NEACOF,   CpType.NO_PULSE));
    SUB_MP3.setBrStep(7,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(7,  BrType.BR01,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(7,  BrType.BR10,  CpType.RB,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(7,  BrType.BR11,  CpType.RB,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setStep(8,  new ControlStep(CpType.RAD,      CpType.WB,       CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(9,  new ControlStep(CpType.RA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setStep(10, new ControlStep(CpType.RL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MP3.setBrStep(11, BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(11, BrType.BR01,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(11, BrType.BR10,  CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setBrStep(11, BrType.BR11,  CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MP3.setStep(12, stepInactive);

    SUB_DV0.setStep(1,  new ControlStep(CpType.RA,       CpType.WB,       CpType.TSGN,     CpType.TMZ,      CpType.NO_PULSE));
    SUB_DV0.setBrStep(2,  BrType.BR00,  CpType.RC,       CpType.WA,       CpType.TMZ,      CpType.DVST,     CpType.NO_PULSE);
    SUB_DV0.setBrStep(2,  BrType.BR01,  CpType.RC,       CpType.WA,       CpType.TMZ,      CpType.DVST,     CpType.NO_PULSE);
    SUB_DV0.setBrStep(2,  BrType.BR10,  CpType.DVST,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV0.setBrStep(2,  BrType.BR11,  CpType.DVST,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV0.setStep(3,  new ControlStep(CpType.RU,       CpType.WB,       CpType.STAGE,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV0.setStep(4,  stepInactive);
    SUB_DV0.setStep(5,  stepInactive);
    SUB_DV0.setStep(6,  stepInactive);
    SUB_DV0.setStep(7,  stepInactive);
    SUB_DV0.setStep(8,  stepInactive);
    SUB_DV0.setStep(9,  stepInactive);
    SUB_DV0.setStep(10, stepInactive);
    SUB_DV0.setStep(11, stepInactive);
    SUB_DV0.setStep(12, stepInactive);

    SUB_DV1.setStep(1,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV1.setBrStep(2,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV1.setBrStep(2,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV1.setBrStep(2,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV1.setBrStep(2,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV1.setStep(3,  new ControlStep(CpType.RU,       CpType.WB,       CpType.STAGE,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV1.setBrStep(4,  BrType.BR00,  CpType.RL,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(4,  BrType.BR01,  CpType.RL,       CpType.WB,       CpType.TSGN,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(4,  BrType.BR10,  CpType.RL,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(4,  BrType.BR11,  CpType.RL,       CpType.WB,       CpType.TSGN,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(5,  BrType.BR00,  CpType.RB,       CpType.WY,       CpType.B15X,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(5,  BrType.BR01,  CpType.RB,       CpType.WY,       CpType.B15X,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(5,  BrType.BR10,  CpType.RC,       CpType.WY,       CpType.B15X,     CpType.Z16,      CpType.NO_PULSE);
    SUB_DV1.setBrStep(5,  BrType.BR11,  CpType.RC,       CpType.WY,       CpType.B15X,     CpType.Z16,      CpType.NO_PULSE);
    SUB_DV1.setStep(6,  new ControlStep(CpType.RU,       CpType.WL,       CpType.TOV,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV1.setStep(7,  new ControlStep(CpType.RG,       CpType.RSC,      CpType.WB,       CpType.TSGN,     CpType.NO_PULSE));
    SUB_DV1.setBrStep(8,  BrType.BR00,  CpType.RA,       CpType.WY,       CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(8,  BrType.BR01,  CpType.RA,       CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(8,  BrType.BR10,  CpType.RA,       CpType.WY,       CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(8,  BrType.BR11,  CpType.RA,       CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(9,  BrType.BR00,  CpType.RB,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(9,  BrType.BR01,  CpType.RB,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(9,  BrType.BR10,  CpType.RC,       CpType.WA,       CpType.Z15,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setBrStep(9,  BrType.BR11,  CpType.RC,       CpType.WA,       CpType.Z15,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV1.setStep(10, new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV1.setStep(11, new ControlStep(CpType.RL,       CpType.WYD,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV1.setStep(12, new ControlStep(CpType.RU,       CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));

    SUB_DV3.setStep(1,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV3.setBrStep(2,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV3.setBrStep(2,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV3.setBrStep(2,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV3.setBrStep(2,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV3.setStep(3,  new ControlStep(CpType.RU,       CpType.WB,       CpType.STAGE,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV3.setStep(4,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV3.setBrStep(5,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(5,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(5,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(5,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setStep(6,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV3.setStep(7,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV3.setBrStep(8,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(8,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(8,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU ,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(8,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setStep(9,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV3.setStep(10, new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV3.setBrStep(11, BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(11, BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(11, BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setBrStep(11, BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV3.setStep(12, new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));

    SUB_DV7.setStep(1,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV7.setBrStep(2,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV7.setBrStep(2,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV7.setBrStep(2,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV7.setBrStep(2,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV7.setStep(3,  new ControlStep(CpType.RU,       CpType.WB,       CpType.STAGE,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV7.setStep(4,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV7.setBrStep(5,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(5,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(5,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(5,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setStep(6,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV7.setStep(7,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV7.setBrStep(8,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(8,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(8,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU ,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(8,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setStep(9,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV7.setStep(10, new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV7.setBrStep(11, BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(11, BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(11, BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setBrStep(11, BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV7.setStep(12, new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));

    SUB_DV6.setStep(1,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV6.setBrStep(2,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV6.setBrStep(2,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV6.setBrStep(2,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV6.setBrStep(2,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.DVST,     CpType.NO_PULSE);
    SUB_DV6.setStep(3,  new ControlStep(CpType.RU,       CpType.WB,       CpType.STAGE,    CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV6.setStep(4,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV6.setBrStep(5,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE,  CpType.NO_PULSE);
    SUB_DV6.setBrStep(5,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(5,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(5,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setStep(6,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV6.setStep(7,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV6.setBrStep(8,  BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(8,  BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(8,  BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU ,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(8,  BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setStep(9,  new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV6.setStep(10, new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV6.setBrStep(11, BrType.BR00,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(11, BrType.BR01,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(11, BrType.BR10,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setBrStep(11, BrType.BR11,  CpType.RG,       CpType.WL,       CpType.TSGU,     CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV6.setStep(12, new ControlStep(CpType.RU,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));

    SUB_DV4.setStep(1,  stepInactive);
    SUB_DV4.setStep(2,  stepInactive);
    SUB_DV4.setStep(3,  stepInactive);
    SUB_DV4.setStep(4,  new ControlStep(CpType.L2GD,     CpType.RB,       CpType.WYD,      CpType.A2X,      CpType.PIFL));
    SUB_DV4.setBrStep(5,  BrType.BR00,  CpType.RG,       CpType.WB,       CpType.WA,       CpType.TSGU,     CpType.NO_PULSE);
    SUB_DV4.setBrStep(5,  BrType.BR01,  CpType.RG,       CpType.WB,       CpType.WA,       CpType.TSGU,     CpType.NO_PULSE);
    SUB_DV4.setBrStep(5,  BrType.BR10,  CpType.RG,       CpType.WB,       CpType.WA,       CpType.TSGU,     CpType.NO_PULSE);
    SUB_DV4.setBrStep(5,  BrType.BR11,  CpType.RG,       CpType.WB,       CpType.WA,       CpType.TSGU,     CpType.NO_PULSE);
    SUB_DV4.setStep(6,  new ControlStep(CpType.RZ,       CpType.TOV,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV4.setBrStep(7,  BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(7,  BrType.BR01,  CpType.RC,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(7,  BrType.BR10,  CpType.RC,       CpType.WA,       CpType.NO_PULSE ,CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(7,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.TSGN,     CpType.RSTSTG));
    SUB_DV4.setStep(9,  new ControlStep(CpType.RU,       CpType.WB,       CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DV4.setBrStep(10, BrType.BR00,  CpType.RC,       CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(10, BrType.BR01,  CpType.RC,       CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(10, BrType.BR10,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setBrStep(10, BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DV4.setStep(11, stepInactive);
    SUB_DV4.setStep(12, stepInactive);

    SUB_ADS0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(3,  stepInactive);
    SUB_ADS0.setStep(4,  stepInactive);
    SUB_ADS0.setStep(5,  new ControlStep(CpType.RG,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(6,  new ControlStep(CpType.RU,       CpType.WSC,      CpType.WG,       CpType.TOV,      CpType.NO_PULSE));
    SUB_ADS0.setBrStep(7,  BrType.BR00,  CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_ADS0.setBrStep(7,  BrType.BR01,  CpType.WA,       CpType.RB1,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_ADS0.setBrStep(7,  BrType.BR10,  CpType.WA,       CpType.R1C,      CpType.NO_PULSE ,CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_ADS0.setBrStep(7,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_ADS0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(9,  new ControlStep(CpType.RC,       CpType.TMZ,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(10, stepInactive);
    SUB_ADS0.setStep(11, new ControlStep(CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ADS0.setStep(12, stepInactive);

    SUB_DAS0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.WY12,     CpType.MONEX,    CpType.CI));
    SUB_DAS0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(3,  new ControlStep(CpType.RA,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(4,  new ControlStep(CpType.RL,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(5,  new ControlStep(CpType.RU,       CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(6,  new ControlStep(CpType.RG,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(7,  new ControlStep(CpType.RB,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(8,  new ControlStep(CpType.RL,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS0.setStep(9,  new ControlStep(CpType.RU,       CpType.WSC,      CpType.WG,       CpType.TOV,      CpType.NO_PULSE));
    SUB_DAS0.setBrStep(10, BrType.BR00,  CpType.RA,       CpType.WY,       CpType.ST1,      CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS0.setBrStep(10, BrType.BR01,  CpType.RA,       CpType.WY,       CpType.PONEX,    CpType.ST1,      CpType.NO_PULSE);
    SUB_DAS0.setBrStep(10, BrType.BR10,  CpType.RA,       CpType.WY,       CpType.MONEX,    CpType.ST1,      CpType.NO_PULSE);
    SUB_DAS0.setBrStep(10, BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS0.setStep(11, stepInactive);
    SUB_DAS0.setStep(12, stepInactive);

    SUB_DAS1.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setStep(3,  new ControlStep(CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setStep(4,  stepInactive);
    SUB_DAS1.setStep(5,  new ControlStep(CpType.RG,       CpType.WY,       CpType.A2X,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setStep(6,  new ControlStep(CpType.RU,       CpType.WG,       CpType.WSC,      CpType.TOV,      CpType.NO_PULSE));
    SUB_DAS1.setBrStep(7,  BrType.BR00,  CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(7,  BrType.BR01,  CpType.WA,       CpType.RB1,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(7,  BrType.BR10,  CpType.WA,       CpType.R1C,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(7,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setStep(9,  new ControlStep(CpType.RC,       CpType.TMZ,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DAS1.setBrStep(10, BrType.BR00,  CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(10, BrType.BR01,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(10, BrType.BR10,  CpType.WL,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(10, BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(11, BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(11, BrType.BR01,  CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(11, BrType.BR10,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setBrStep(11, BrType.BR11,  CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DAS1.setStep(12, stepInactive);

    SUB_INCR0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_INCR0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_INCR0.setStep(3,  stepInactive);
    SUB_INCR0.setStep(4,  stepInactive);
    SUB_INCR0.setStep(5,  new ControlStep(CpType.RG,       CpType.WY,       CpType.TSGN,     CpType.TMZ,      CpType.TPZG));
    SUB_INCR0.setStep(6,  new ControlStep(CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_INCR0.setStep(7,  new ControlStep(CpType.RU,       CpType.WSC,      CpType.WG,       CpType.WOVR,     CpType.NO_PULSE));
    SUB_INCR0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_INCR0.setStep(9,  stepInactive);
    SUB_INCR0.setStep(10, stepInactive);
    SUB_INCR0.setStep(11, stepInactive);
    SUB_INCR0.setStep(12, stepInactive);

    SUB_AUG0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AUG0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AUG0.setStep(3,  stepInactive);
    SUB_AUG0.setStep(4,  stepInactive);
    SUB_AUG0.setStep(5,  new ControlStep(CpType.RG,       CpType.WY,       CpType.TSGN,     CpType.TMZ,      CpType.TPZG));
    SUB_AUG0.setBrStep(6,  BrType.BR00,  CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_AUG0.setBrStep(6,  BrType.BR01,  CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_AUG0.setBrStep(6,  BrType.BR10,  CpType.MONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_AUG0.setBrStep(6,  BrType.BR11,  CpType.MONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_AUG0.setStep(7,  new ControlStep(CpType.RU,       CpType.WSC,      CpType.WG,       CpType.WOVR,     CpType.NO_PULSE));
    SUB_AUG0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_AUG0.setStep(9,  stepInactive);
    SUB_AUG0.setStep(10, stepInactive);
    SUB_AUG0.setStep(11, stepInactive);
    SUB_AUG0.setStep(12, stepInactive);

    SUB_DIM0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DIM0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DIM0.setStep(3,  stepInactive);
    SUB_DIM0.setStep(4,  stepInactive);
    SUB_DIM0.setStep(5,  new ControlStep(CpType.RG,       CpType.WY,       CpType.TSGN,     CpType.TMZ,      CpType.TPZG));
    SUB_DIM0.setBrStep(6,  BrType.BR00,  CpType.MONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DIM0.setBrStep(6,  BrType.BR01,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DIM0.setBrStep(6,  BrType.BR10,  CpType.PONEX,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DIM0.setBrStep(6,  BrType.BR11,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_DIM0.setStep(7,  new ControlStep(CpType.RU,       CpType.WSC,      CpType.WG,       CpType.WOVR,     CpType.NO_PULSE));
    SUB_DIM0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_DIM0.setStep(9,  stepInactive);
    SUB_DIM0.setStep(10, stepInactive);
    SUB_DIM0.setStep(11, stepInactive);
    SUB_DIM0.setStep(12, stepInactive);

    SUB_MSU0.setStep(1,  new ControlStep(CpType.RL10BB,   CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(2,  new ControlStep(CpType.RSC,      CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(3,  stepInactive);
    SUB_MSU0.setStep(4,  stepInactive);
    SUB_MSU0.setStep(5,  new ControlStep(CpType.RG,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(6,  new ControlStep(CpType.RC,       CpType.WY,       CpType.CI,       CpType.A2X,      CpType.NO_PULSE));
    SUB_MSU0.setStep(7,  new ControlStep(CpType.RUS,      CpType.WA,       CpType.TSGN,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(8,  new ControlStep(CpType.RZ,       CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(9,  new ControlStep(CpType.RB,       CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setBrStep(10, BrType.BR00,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MSU0.setBrStep(10, BrType.BR01,  CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MSU0.setBrStep(10, BrType.BR10,  CpType.RA,       CpType.WY,       CpType.MONEX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MSU0.setBrStep(10, BrType.BR11,  CpType.RA,       CpType.WY,       CpType.MONEX,    CpType.NO_PULSE, CpType.NO_PULSE);
    SUB_MSU0.setStep(11, new ControlStep(CpType.RUS,      CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSU0.setStep(12, stepInactive);

    SUB_MSK0.setStep(1,  stepInactive);
    SUB_MSK0.setStep(2,  new ControlStep(CpType.RSC,  CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(3,  new ControlStep(CpType.RA,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(4,  new ControlStep(CpType.RC,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(5,  stepInactive);
    SUB_MSK0.setStep(6,  stepInactive);
    SUB_MSK0.setStep(7,  new ControlStep(CpType.RG,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(8,  new ControlStep(CpType.RZ,   CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(9,  new ControlStep(CpType.RC,   CpType.RA,       CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(10, new ControlStep(CpType.RU,   CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(11, new ControlStep(CpType.RC,   CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_MSK0.setStep(12, stepInactive);

    SUB_READ0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(3,  new ControlStep(CpType.WY,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(5,  new ControlStep(CpType.RB,     CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(7,  stepInactive);
    SUB_READ0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_READ0.setStep(9,  stepInactive);
    SUB_READ0.setStep(10, stepInactive);
    SUB_READ0.setStep(11, stepInactive);
    SUB_READ0.setStep(12, stepInactive);

    SUB_WRITE0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(3,  new ControlStep(CpType.WY,     CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(5,  new ControlStep(CpType.RA,     CpType.WCH,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(7,  stepInactive);
    SUB_WRITE0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WRITE0.setStep(9,  stepInactive);
    SUB_WRITE0.setStep(10, stepInactive);
    SUB_WRITE0.setStep(11, stepInactive);
    SUB_WRITE0.setStep(12, stepInactive);

    SUB_RAND0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(3,  new ControlStep(CpType.RC,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(5,  new ControlStep(CpType.RC,     CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(7,  new ControlStep(CpType.RC,     CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RAND0.setStep(9,  stepInactive);
    SUB_RAND0.setStep(10, stepInactive);
    SUB_RAND0.setStep(11, stepInactive);
    SUB_RAND0.setStep(12, stepInactive);

    SUB_WAND0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(3,  new ControlStep(CpType.RC,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(5,  new ControlStep(CpType.RC,     CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(7,  new ControlStep(CpType.RC,     CpType.WA,       CpType.WCH,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WAND0.setStep(9,  stepInactive);
    SUB_WAND0.setStep(10, stepInactive);
    SUB_WAND0.setStep(11, stepInactive);
    SUB_WAND0.setStep(12, stepInactive);

    SUB_ROR0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(3,  new ControlStep(CpType.RB,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(5,  new ControlStep(CpType.RB,     CpType.RU,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(7,  stepInactive);
    SUB_ROR0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_ROR0.setStep(9,  stepInactive);
    SUB_ROR0.setStep(10, stepInactive);
    SUB_ROR0.setStep(11, stepInactive);
    SUB_ROR0.setStep(12, stepInactive);

    SUB_WOR0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(3,  new ControlStep(CpType.RB,     CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(5,  new ControlStep(CpType.RB,     CpType.RU,       CpType.WA,       CpType.WCH,      CpType.NO_PULSE));
    SUB_WOR0.setStep(6,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(7,  stepInactive);
    SUB_WOR0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_WOR0.setStep(9,  stepInactive);
    SUB_WOR0.setStep(10, stepInactive);
    SUB_WOR0.setStep(11, stepInactive);
    SUB_WOR0.setStep(12, stepInactive);

    SUB_RXOR0.setStep(1,  new ControlStep(CpType.RL10BB, CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(2,  new ControlStep(CpType.RA,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(3,  new ControlStep(CpType.RC,     CpType.RCH,      CpType.WY,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(4,  new ControlStep(CpType.RCH,    CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(5,  new ControlStep(CpType.RA,     CpType.RC,       CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(6,  stepInactive);
    SUB_RXOR0.setStep(7,  new ControlStep(CpType.RG,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(9,  new ControlStep(CpType.RC,     CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(10, new ControlStep(CpType.RU,     CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(11, new ControlStep(CpType.RC,     CpType.RG,       CpType.WA,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RXOR0.setStep(12, stepInactive);

    SUB_RSM3.setStep(1,  new ControlStep(CpType.R15,    CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RSM3.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NISQ,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RSM3.setStep(3,  stepInactive);
    SUB_RSM3.setStep(4,  stepInactive);
    SUB_RSM3.setStep(5,  new ControlStep(CpType.RG,     CpType.WZ,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RSM3.setStep(6,  new ControlStep(CpType.RB,     CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RSM3.setStep(7,  stepInactive);
    SUB_RSM3.setStep(8,  new ControlStep(CpType.RAD,    CpType.WB,       CpType.WS,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RSM3.setStep(9,  stepInactive);
    SUB_RSM3.setStep(10, stepInactive);
    SUB_RSM3.setStep(11, stepInactive);
    SUB_RSM3.setStep(12, stepInactive);

    SUB_RUPT0.setStep(1,  new ControlStep(CpType.R15,    CpType.WS,      CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT0.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,      CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT0.setStep(3,  stepInactive);
    SUB_RUPT0.setStep(4,  stepInactive);
    SUB_RUPT0.setStep(5,  stepInactive);
    SUB_RUPT0.setStep(6,  stepInactive);
    SUB_RUPT0.setStep(7,  stepInactive);
    SUB_RUPT0.setStep(8,  stepInactive);
    SUB_RUPT0.setStep(9,  new ControlStep(CpType.RZ,     CpType.WG,       CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT0.setStep(10, new ControlStep(CpType.ST1,    CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT0.setStep(11, stepInactive);
    SUB_RUPT0.setStep(12, stepInactive);

    SUB_RUPT1.setStep(1,  new ControlStep(CpType.R15,    CpType.RB2,     CpType.WS,        CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT1.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,      CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT1.setStep(3,  new ControlStep(CpType.RRPA,   CpType.WZ,      CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT1.setStep(4,  stepInactive);
    SUB_RUPT1.setStep(5,  stepInactive);
    SUB_RUPT1.setStep(6,  stepInactive);
    SUB_RUPT1.setStep(7,  stepInactive);
    SUB_RUPT1.setStep(8,  new ControlStep(CpType.RZ,     CpType.WS,       CpType.ST2,      CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT1.setStep(9,  new ControlStep(CpType.RB,     CpType.WG,       CpType.KRPT,     CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_RUPT1.setStep(10, stepInactive);
    SUB_RUPT1.setStep(11, stepInactive);
    SUB_RUPT1.setStep(12, stepInactive);

    SUB_GOJ1.setStep(1,  stepInactive);
    SUB_GOJ1.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,      CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_GOJ1.setStep(3,  stepInactive);
    SUB_GOJ1.setStep(4,  stepInactive);
    SUB_GOJ1.setStep(5,  stepInactive);
    SUB_GOJ1.setStep(6,  stepInactive);
    SUB_GOJ1.setStep(7,  stepInactive);
    SUB_GOJ1.setStep(8,  new ControlStep(CpType.RSTRT,  CpType.WS,       CpType.WB,       CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_GOJ1.setStep(9,  stepInactive);
    SUB_GOJ1.setStep(10, stepInactive);
    SUB_GOJ1.setStep(11, stepInactive);
    SUB_GOJ1.setStep(12, stepInactive);

    SUB_PINC.setStep(1,  new ControlStep(CpType.RSCT,   CpType.WS,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_PINC.setStep(2,  new ControlStep(CpType.RSC,    CpType.WG,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_PINC.setStep(3,  stepInactive);
    SUB_PINC.setStep(4,  stepInactive);
    SUB_PINC.setStep(5,  new ControlStep(CpType.RG,     CpType.WY,       CpType.TSGN,      CpType.TMZ,      CpType.TPZG));
    SUB_PINC.setStep(6,  new ControlStep(CpType.PONEX,  CpType.NO_PULSE, CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_PINC.setStep(7,  new ControlStep(CpType.RU,     CpType.WSC,      CpType.WG,        CpType.WOVR,     CpType.NO_PULSE));
    SUB_PINC.setStep(8,  new ControlStep(CpType.RB,     CpType.WS,       CpType.NO_PULSE,  CpType.NO_PULSE, CpType.NO_PULSE));
    SUB_PINC.setStep(9,  stepInactive);
    SUB_PINC.setStep(10, stepInactive);
    SUB_PINC.setStep(11, stepInactive);
    SUB_PINC.setStep(12, stepInactive);
  }

  // This matrix is based on the order code (opcode + extend bit) by quarter code.
  private static final Subseq[][] subseqDecode =
    {
      { Subseq.TC0,    Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//00
      { Subseq.CCS0,   Subseq.TCF0,   Subseq.TCF0,   Subseq.TCF0   },//01
      { Subseq.DAS0,   Subseq.LXCH0,  Subseq.INCR0,  Subseq.ADS0   },//02
      { Subseq.CA0,    Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//03
      { Subseq.CS0,    Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//04
      { Subseq.NDX0,   Subseq.DXCH0,  Subseq.TS0,    Subseq.XCH0   },//05
      { Subseq.AD0,    Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//06
      { Subseq.MSK0,   Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//07

      { Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.RUPT0  },//10
      { Subseq.DV0,    Subseq.BZF0,   Subseq.BZF0,   Subseq.BZF0   },//11
      { Subseq.MSU0,   Subseq.QXCH0,  Subseq.AUG0,   Subseq.DIM0   },//12
      { Subseq.DCA0,   Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//13
      { Subseq.DCS0,   Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//14
      { Subseq.NDXX0,  Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//15
      { Subseq.SU0,    Subseq.BZMF0,  Subseq.BZMF0,  Subseq.BZMF0  },//16
      { Subseq.MP0,    Subseq.NO_SEQ, Subseq.NO_SEQ, Subseq.NO_SEQ },//17
    };

  // This matrix converts the subsequence to the control pulse steps defined above.
  private Subsequence subsp[] =
    {
      NO_SUBSEQ,  SUB_STD2,  SUB_TC0,   SUB_CCS0,  SUB_TCF0,  SUB_BZF0,  SUB_BZMF0, SUB_CA0,
      SUB_CS0,    SUB_DCA0,  SUB_DCA1,  SUB_DCS0,  SUB_DCS1,  SUB_TS0,   SUB_XCH0,
      SUB_LXCH0,  SUB_QXCH0, SUB_DXCH0, SUB_DXCH1, SUB_NDX0,  SUB_NDX1,  SUB_NDXX0,
      SUB_NDXX1,  SUB_AD0,   SUB_SU0,   SUB_MP0,   SUB_MP1,   SUB_MP3,   SUB_DV0,
      SUB_DV1,    SUB_DV3,   SUB_DV7,   SUB_DV6,   SUB_DV4,   SUB_ADS0,  SUB_DAS0,
      SUB_DAS1,   SUB_INCR0, SUB_AUG0,  SUB_DIM0,  SUB_MSU0,  SUB_MSK0,  SUB_READ0,
      SUB_WRITE0, SUB_RAND0, SUB_WAND0, SUB_ROR0,  SUB_WOR0,  SUB_RXOR0, SUB_RSM3,
      SUB_RUPT0,  SUB_RUPT1, SUB_GOJ1,  SUB_PINC
    };

  private void clearControlPulses()
  {
    for (int i = 0; i < MAXPULSES; i++)
      glbl_cp[i] = CpType.NO_PULSE;
  }

  private void assertPulses(CpType[] pulses)
  {
    int j=0;
    for (int i=0; i < MAXPULSES && j < MAX_IPULSES && pulses[j] != CpType.NO_PULSE; i++)
    {
      if (glbl_cp[i] == CpType.NO_PULSE)
      {
        glbl_cp[i] = pulses[j];
        j++;
      }
    }
  }

  private Subseq subsequenceDecoder(int sq, int stage)
  {
    int orderCode = (sq >> 3) & 0x0F; // Opcode plus extend bit
    int quarterCode = (sq >> 1) & 0x03;
    int channelCode = sq & 0x07;
    int channelBit = sq & 0x01; // Low order bit of sq.

    if (stage == 2)
    {
      return Subseq.STD2;
    }

    // Handle the channel codes.
    if (orderCode == 010)
    {
      if (stage == 0)
      {
        switch (channelCode)
        {
          case 0:
            return Subseq.READ0;
          case 1:
            return Subseq.WRITE0;
          case 2:
            return Subseq.RAND0;
          case 3:
            return Subseq.WAND0;
          case 4:
            return Subseq.ROR0;
          case 5:
            return Subseq.WOR0;
          case 6:
            return Subseq.RXOR0;
          case 7:
            return Subseq.RUPT0;
        }
      }
      else if (stage == 1 && channelCode == 7)
        return Subseq.RUPT1;
      else
        return Subseq.NO_SEQ;
    }
    else
    {
      // Ignore if channel bit (low order bit of sq) is one.
      if (channelBit == 1)
        return Subseq.NO_SEQ;

      Subseq subseq = subseqDecode[orderCode][quarterCode];

      if (stage == 0)
      {
        return subseq;
      }
      else if (stage == 1)
      {
        if (subseq == Subseq.TC0)
          return Subseq.GOJ1;
        else if (subseq == Subseq.DCA0)
          return Subseq.DCA1;
        else if (subseq == Subseq.DCS0)
          return Subseq.DCS1;
        else if (subseq == Subseq.DXCH0)
          return Subseq.DXCH1;
        else if (subseq == Subseq.NDX0)
          return Subseq.NDX1;
        else if (subseq == Subseq.NDXX0)
          return Subseq.NDXX1;
        else if (subseq == Subseq.MP0)
          return Subseq.MP1;
        else if (subseq == Subseq.DAS0)
          return Subseq.DAS1;
        else if (subseq == Subseq.DV0)
          return Subseq.DV1;
        else
          return Subseq.NO_SEQ;
      }
      else if (stage == 3)
      {
        if (subseq == Subseq.MP0)
          return Subseq.MP3;
        else if (subseq == Subseq.DV0)
          return Subseq.DV3;
        else if (subseq == Subseq.NDX0)
          return Subseq.RSM3;
        else
          return Subseq.NO_SEQ;
      }
      else if (stage == 4)
      {
        if (subseq == Subseq.DV0)
          return Subseq.DV4;
        else
          return Subseq.NO_SEQ;
      }
      else if (stage == 6)
      {
        if (subseq == Subseq.DV0)
          return Subseq.DV6;
        else
          return Subseq.NO_SEQ;
      }
      else if (stage == 7)
      {
        if (subseq == Subseq.DV0)
          return Subseq.DV7;
        else
          return Subseq.NO_SEQ;
      }
    }
    return Subseq.NO_SEQ;
  }

  private void getCPM_A(int CPM_A_address, boolean print)
  {
    // EPROM address bits (bit 1 is LSB)
    // 1:      register BR2
    // 2:      register BR1
    // 3-6:    register SG (4) --> The SG register does not contain the TPG number.  Subtract one to get the TPG number.
    // 7-9:    register STAGE (3)
    // 10-16:  register SQ (7)

    //***********************************************************
    // EPROM emulator
    int sq    = (CPM_A_address >> 9) & 0x7F;
    int stage = (CPM_A_address >> 6) & 0x7;
    int tpg   = (CPM_A_address >> 2) & 0xF;
    int br1   = (CPM_A_address >> 1) & 0x1;
    int br2   = (CPM_A_address ) & 0x1;

    // Decode the current instruction subsequence.
    Subseq subseq;
    if (sq == 0x7F)
    {
      subseq = Subseq.PINC;
    }
    else
    {
      subseq = subsequenceDecoder(sq, stage);
    }

    if (print && subseq != Subseq.NO_SEQ)
    {
      System.out.printf("Address: %o, subseq: %s, stage: %o, tpg: %o, Data: ",
                        CPM_A_address, subseq.toString(), stage, (tpg - 1));
    }

    // Clear old control pulses.
    clearControlPulses();

    // Get new control pulses for the current instruction sub-sequence.
    // Note: tpg is not TPG, but SQ which is TPG + 2
    if (subseq != Subseq.NO_SEQ && tpg >= 2 && tpg <= 13)
    {
      Subsequence subseqP = subsp[subseq.ordinal()];
      if (subseqP != null)
      {
        ControlStep controlStep = subseqP.getControlStep(tpg);

        BrType b = BrType.values()[((br1 << 1) | br2)];
        ControlSubStep controlSubStep = controlStep.getSubstep(b.ordinal());

        if (controlSubStep.br == BrType.NO_BR)
          controlSubStep = controlStep.getSubstep(0);

        CpType[] p = controlSubStep.getPulses();
        if (print)
        {
          for (int i = 0; i < 5; i++)
          {
            if (p[i] != CpType.NO_PULSE)
            {
              System.out.print(p[i] + ", ");
            }
          }
          System.out.println();
        }
        assertPulses(p);
      }
    }
  }

  // return the EPROM word corresponding to the pulses in glbl_cp.
  private int getNextWord(int lowBit)
  {
    int EPROMword = 0x00; // no pulses; default
    for (int i = 0; i < MAXPULSES && glbl_cp[i] != CpType.NO_PULSE; i++)
    {
      int pulse = glbl_cp[i].getValue() - lowBit;
      if (pulse < 0 || pulse > 7)
        continue; // pulse is not in this EPROM
      EPROMword |= 0x01 << pulse;
    }

    // The CPM-A control signals are negative logic, so we need to
    // bit-flip the word. No signal is a 1, and an asserted signal is a 0:
    return ((~EPROMword) & 0xff);
  }

  private void writeEPROM(String filename, int lowBit)
  {
    // EPROM byte arrays that contain the bytes (in ints) of data to write.
    int epromMemSize = 0x10000; // # of cells in a 16-bit address range

    try (PrintWriter epromWriter = new PrintWriter(new FileWriter(filename)))
    {
      int maxBytes = 20; // set limit on record length = 14 hex
      int addressBytes = 3; // 16-bit address range = 4 bytes or 2 characters
      int sumCheckBytes = 1;

      int maxdata = maxBytes - addressBytes - sumCheckBytes;

      int i; // current EPROM address
      int sumCheck;

      // Write starting S0 record.  The address is zero.
      int length = 3 + filename.length();
      epromWriter.printf("S0%02X0000", length);

      sumCheck = length; // byte count of address (2) + data (header) + checksum (1).
      i = 0; // set address zero for first record
      sumCheck = (sumCheck + ((i & 0xff00) >> 8)) % 256;
      sumCheck = (sumCheck + ((i & 0x00ff) )) % 256;

      // Write the header as the data field.
      for (int nextChar = 0; nextChar < filename.length(); nextChar++)
      {
        char nextCharacter = filename.charAt(nextChar);
        epromWriter.printf("%h", nextCharacter);
        sumCheck = (sumCheck + nextCharacter) % 256;
      }

      epromWriter.printf("%02X\n", (~sumCheck) & 0xff);

      while (i < epromMemSize)
      {
        // get dataByteCount; the number of bytes of EPROM data per record.
        int dataByteCount = maxdata;
        if (i + dataByteCount >= epromMemSize)
        {
          dataByteCount = epromMemSize - i;
        }

        // S-record Format (*** 2 byte address assumed ***)
        //   Each record always starts with the letter "S" followed by the record type,
        //     in this case a "2" is always used.  S2 translates into a 24-bit address.
        //   The next two characters are the remaining bytes in hex (character pairs) in this record
        //     to include the address, data and Checksum.  To get the total # of characters convert to decimal
        //     then double it and subtract 2+6.  In our case 14 = 20 * 2 = 40 - 8 = 32 characters of data.
        //   The address is 6 characters followed by the data, in this case all data is 32 characters.
        //   The checksum is always 2 characters or one byte in hex format.
        //   The record is then followed by a character return and line feed.
        // The last record is a termination record of format S8, bytes to follow = 04 and a 6 character address,
        // followed by a checksum.
        int totalByteCount = dataByteCount + addressBytes + sumCheckBytes;
        epromWriter.printf("S2%02X%06X", totalByteCount, i);

        // Checksum is the least significant byte of the ones complement of the sum of the byte
        // values of the pairs of characters making up the total bytes, address bytes and data bytes.
        // The total byte count and address bytes are summed here.  The data is added a chunk at a time below.
        sumCheck = totalByteCount & 0xff;
        sumCheck = (sumCheck + ((i & 0xff0000) >> 16)) % 256;
        sumCheck = (sumCheck + ((i & 0x00ff00) >> 8)) % 256;
        sumCheck = (sumCheck + ((i & 0x0000ff))) % 256;

        // write data bytes into record
        for (int j = 0; j < dataByteCount; j++)
        {
          // The CPM-A control signals are negative logic, so we need to
          // bit-flip the word. No signal is a 1, and an asserted signal is a 0:
          boolean print = false;
          if (filename.equalsIgnoreCase("CPM1_8.hex"))
            print = true;
          getCPM_A(i + j, print); // get CPM-A pulses for address i+j
          int data = getNextWord(lowBit); // convert pulses to EPROM format
          epromWriter.printf("%02X", data);
          sumCheck = (sumCheck + data) % 256;
        }

        // terminate record by adding the least significant byte of the one's compliment of the checksum
        // and a newline.
        epromWriter.printf("%02X\n", (~sumCheck) & 0xff);

        i += dataByteCount;
      }
      // write an end-of-file record here
      sumCheck = 0x03; // byte count is always 03.
      // Address is always 0000
      epromWriter.printf("S9030000%02X\n", (~sumCheck) & 0xff);
    }
    catch (IOException ioe)
    {
      System.out.println("Failed to open required file...");
      System.exit(-1);
    }
  }

  public static void main(String[] args)
  {
    ControlPulseMatrixGen generator = new ControlPulseMatrixGen();
    generator.initialize();

    generator.writeEPROM("CPM1_8.hex",1);   // pulses 1-8
    generator.writeEPROM("CPM9_16.hex",9);  // pulses 9-16
    generator.writeEPROM("CPM17_24.hex",17); // pulses 17-24
    generator.writeEPROM("CPM25_32.hex",25); // pulses 25-32
    generator.writeEPROM("CPM33_40.hex",33); // pulses 33-40
    generator.writeEPROM("CPM41_48.hex",41); // pulses 41-48
    generator.writeEPROM("CPM49_56.hex",49); // pulses 49-56
    generator.writeEPROM("CPM57_64.hex",57); // pulses 57-64
    generator.writeEPROM("CPM65_72.hex",65); // pulses 65-72
  }
}
