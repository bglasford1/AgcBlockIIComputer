/*
  Copyright 2021-2022, William Glasford

  This file is part of the AGC Simulator.  You can redistribute it
  and/or modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 3 of the License,
  or any later version. This software is distributed without any warranty
  expressed or implied. See the GNU General Public License for more details.

  Purpose:	This enumeration class defines the keys on the DSKY and their
            numeric values.

  Mods:		  07/15/21  Initial Release.
            05/14/22  Cleaned up comments.
*/

package enums;

public enum KeyInType
{
  KEYIN_NONE (0),            // no key depressed**
  KEYIN_1    (001),
  KEYIN_2    (002),
  KEYIN_3    (003),
  KEYIN_4    (004),
  KEYIN_5    (005),
  KEYIN_6    (006),
  KEYIN_7    (007),
  KEYIN_8    (010),
  KEYIN_9    (011),
  KEYIN_0    (020),
  KEYIN_VERB (021),
  KEYIN_ERROR_RESET (022),
  KEYIN_KEY_RELEASE (031),
  KEYIN_PLUS  (032),
  KEYIN_MINUS (033),
  KEYIN_ENTER (034),
  KEYIN_CLEAR (036),
  KEYIN_NOUN  (037);

  private final int value;

  KeyInType(int value)
  {
    this.value = value;
  }

  public int getValue()
  {
    return this.value;
  }
}
