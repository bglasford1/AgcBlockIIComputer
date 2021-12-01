/*
  Copyright 2021, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This class implements the clock module by pulsing all asserted
            control pulses in a sequence that works for the software simulation.
            In the hardware implementation the read control pulses occur before
            the write control pulses.

  Mods:		  07/15/21  Initial Release.
            11/30/21  Fixed Proceed Key.
*/

package modules;

import enums.CpType;
import gui.AGCControl;

public class CLK
{
  private AGCControl parent;

  public CLK(AGCControl parent)
  {
    this.parent = parent;
  }

  public void clockPulse()
  {
  }

  // Do the read pulses first.
  public void doexecR(CpType pulse)
  {
    switch (pulse)
    {
      case A2X:
        parent.getCrg().execRP_A2X();
        break;
      case G2LS:
        parent.getMbf().execRP_G2LS();
        break;
      case L2GD:
        parent.getCrg().execRP_L2GD();
        break;
      case RA:
        parent.getCrg().execRP_RA();
        break;
      case RB:
        parent.getAlu().execRP_RB();
        break;
      case RBBK:
        parent.getAdr().execRP_RBBK();
        break;
      case RC:
        // This must be after the RA for the mask OR.
        parent.getAlu().execRP_RC();
        break;
      case RG:
        parent.getMbf().execRP_RG();
        break;
      case RL:
        parent.getCrg().execRP_RL();
        break;
      case RL10BB:
        parent.getAlu().execRP_RL10BB();
        break;
      case RQ:
        parent.getCrg().execRP_RQ();
        break;
      case RRPA:
        parent.getInr().execRP_RRPA();
        break;
      case RSCT:
        parent.getCtr().execRP_RSCT();
        break;
      case RU:
        // This must be after the RB and RC for RAND, WAND & ROR.
        parent.getAlu().execRP_RU();
        break;
      case RUS:
        parent.getAlu().execRP_RUS();
        break;
      case RZ:
        parent.getCrg().execRP_RZ();
        break;
      case RA0:
        parent.getCrg().execRP_RA();
        break;
      case RA1:
        parent.getCrg().execRP_RL();
        break;
      case RA2:
        parent.getCrg().execRP_RQ();
        break;
      case RA3:
        parent.getAdr().execRP_REB();
        break;
      case RA4:
        parent.getAdr().execRP_RFB();
        break;
      case RA5:
        parent.getCrg().execRP_RZ();
        break;
      case RA6:
        parent.getAdr().execRP_RBBK();
        break;
      case WCH:
        parent.getCrg().execRP_WCH();
        break;
      case RC1:
        parent.getCrg().execRP_WLC();
        break;
      case RC2:
        parent.getCrg().execRP_WQC();
        break;
      case RC7:
        parent.getAdr().execRP_WSB();
        break;
      case RC15:
        parent.getKbd().execRP_KBD1();
        break;
      case RC30:
        parent.getIos().execRP_CH30();
        break;
      case RC31:
        parent.getIos().execRP_CH31();
        break;
      case RC32:
        parent.getKbd().execRP_RPRO();
        break;
      case RC33:
        parent.getIos().execRP_CH33();
        break;
      case SBWG:
        parent.getEfm().execRP_SBWG();
        break;
      default:
        break;
    }
  }

  // These are the commands that place fixed data values on the write bus.
  public void doexecR_ALU_OR(CpType pulse)
  {
    switch (pulse)
    {
      case R15:
        parent.getAlu().execRP_R15();
        break;
      case RB1F:
        parent.getAlu().execRP_RB1F();
        break;
      case RB1:
        parent.getAlu().execRP_RB1();
        break;
      case R1C:
        parent.getAlu().execRP_R1C();
        break;
      case RB2:
        parent.getAlu().execRP_RB2();
        break;
      case R6:
        parent.getAlu().execRP_R6();
        break;
      case RSTRT:
        parent.getAlu().execRP_RSTRT();
        break;
      default:
        break;
    }
  }

  public void execW_GENRST()
  {
    parent.getSeq().execWP_GENRST();
    parent.getMbf().execWP_GENRST();
    parent.getCrg().execWP_GENRST();
    parent.getPar().execWP_GENRST();
    parent.getAlu().execWP_GENRST();
    parent.getCtr().execWP_GENRST();
    parent.getInr().execWP_GENRST();
    parent.getKbd().execWP_GENRST();
    parent.getDsp().execWP_GENRST();
    parent.getScl().execWP_GENRST();
    parent.getIos().execWP_GENRST();
  }

  public void doexecW(CpType pulse)
  {
    switch (pulse)
    {
      case RCH:
        parent.getCrg().execWP_RCH();
        break;
      case WC1:
        parent.getCrg().execWP_RLC();
        break;
      case WC2:
        parent.getCrg().execWP_RQC();
        break;
      case WC5:
        parent.getIos().execWP_CH5();
        break;
      case WC6:
        parent.getIos().execWP_CH6();
        break;
      case WC7:
        parent.getAdr().execWP_RSB();
        break;
      case WC10:
        parent.getDsp().execWP_DISP();
        break;
      case WC11:
        parent.getDsp().execWP_INDC();
        break;
      case WC12:
        parent.getIos().execWP_CH12();
        break;
      case WC13:
        parent.getDsp().execWP_CH13();
        break;
      case WC14:
        parent.getIos().execWP_CH14();
        break;
      case WC77:
        parent.getIos().execWP_CH77();
        break;
      case A2X:
        parent.getAlu().execWP_A2X();
        break;
      case B15X:
        parent.getAlu().execWP_B15X();
        break;
      case CI:
        parent.getAlu().execWP_CI();
        break;
      case CLXC:
        parent.getAlu().execWP_CLXC();
        break;
      case DVST:
        parent.getSeq().execWP_DVST();
        break;
      case EXT:
        parent.getSeq().execWP_EXT();
        break;
      case G2LS:
        parent.getCrg().execWP_G2LS();
        break;
      case KRPT:
        parent.getInr().execWP_KRPT();
        break;
      case L16:
        parent.getCrg().execWP_L16();
        break;
      case L2GD:
        parent.getMbf().execWP_L2GD();
        break;
      case NEACOF:
        parent.getAlu().execWP_NEACOF();
        break;
      case NEACON:
        parent.getAlu().execWP_NEACON();
        break;
      case MONEX:
        parent.getAlu().execWP_MONEX();
        break;
      case NISQ:
        parent.getSeq().execWP_NISQ();
        break;
      case PONEX:
        parent.getAlu().execWP_PONEX();
        break;
      case PTWOX:
        parent.getAlu().execWP_PTWOX();
        break;
      case RSTSTG:
        parent.getSeq().execWP_RSTSTG();
        break;
      case ST1:
        parent.getSeq().execWP_ST1();
        break;
      case ST2:
        parent.getSeq().execWP_ST2();
        break;
      case STAGE:
        parent.getSeq().execWP_STAGE();
        break;
      case TL15:
        parent.getSeq().execWP_TL15();
        break;
      case TMZ:
        parent.getSeq().execWP_TMZ();
        break;
      case TOV:
        parent.getSeq().execWP_TOV();
        break;
      case TPZG:
        parent.getSeq().execWP_TPZG();
        break;
      case TRSM:
        parent.getSeq().execWP_TRSM();
        break;
      case TSGN:
        parent.getSeq().execWP_TSGN();
        break;
      case TSGN2:
        parent.getSeq().execWP_TSGN2();
        break;
      case WA:
        parent.getCrg().execWP_WA();
        break;
      case WALS:
        parent.getCrg().execWP_WALS();
        break;
      case WB:
        parent.getAlu().execWP_WB();
        break;
      case WG:
        parent.getMbf().execWP_WG();
        break;
      case WL:
        parent.getCrg().execWP_WL();
        break;
      case WOVR:
        parent.getCtr().execWP_WOVR();
        break;
      case WQ:
        parent.getCrg().execWP_WQ();
        break;
      case WS:
        parent.getAdr().execWP_WS();
        break;
      case WSQ:
        parent.getSeq().execWP_WSQ();
        break;
      case WY:
        parent.getAlu().execWP_WY();
        break;
      case WY12:
        parent.getAlu().execWP_WY12();
        break;
      case WYD:
        parent.getAlu().execWP_WYD();
        break;
      case WZ:
        parent.getCrg().execWP_WZ();
        break;
      case Z15:
        parent.getCrg().execWP_Z15();
        break;
      case Z16:
        parent.getCrg().execWP_Z16();
        break;
      case WA0:
        parent.getCrg().execWP_WA();
        break;
      case WA1:
        parent.getCrg().execWP_WL();
        break;
      case WA2:
        parent.getCrg().execWP_WQ();
        break;
      case WA3:
        parent.getAdr().execWP_WEB();
        break;
      case WA4:
        parent.getAdr().execWP_WFB();
        break;
      case WA5:
        parent.getCrg().execWP_WZ();
        break;
      case WA6:
        parent.getAdr().execWP_WBB();
        break;
      case W20:
        parent.getMbf().execWP_W20();
        break;
      case W21:
        parent.getMbf().execWP_W21();
        break;
      case W22:
        parent.getMbf().execWP_W22();
        break;
      case W23:
        parent.getMbf().execWP_W23();
        break;
      case GENRST:
        execW_GENRST();
        break;
      case CLISQ:
        parent.getSeq().execWP_CLISQ();
        break;
      case CLRP:
        parent.getInr().execWP_CLRP();
        break;
      case EXTEND:
        parent.getSeq().execWP_EXT();
        break;
      case INHINT:
        parent.getInr().execWP_INH();
        break;
      case RELINT:
        parent.getInr().execWP_CLINH();
        break;
      case INTR:
        parent.getSeq().execWP_INTR();
        break;
      case RPT:
        parent.getInr().execWP_RPT();
        break;
      case WTS:
        parent.getAdr().execWP_WTS();
        break;
      case SBWG:
        parent.getMbf().execWP_SBWG();
        break;
      case WE:
        parent.getMbf().execRP_WE();
        parent.getEfm().execWP_WE();
        break;
      case WPCTR:
        parent.getCtr().execWP_WPCTR();
        break;
      case DCDSUB:
        parent.getCpm().execWP_DCDSUB();
        break;
      case PINC:
        parent.getSeq().execWP_PINC();
        break;
      default:
        break;
    }
  }
}
