/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package core.udp;

import core.udp.P2P.*;

public class UDP_SubHead
{
	public static UDP_P2P getSubHead(int value)
	{
		switch (value)
		{
			case 0: return new P2P_SUB_HEAD_USER();
			case 1: return new P2P_SUB_HEAD_GRENADE();
			case 2: return new P2P_SUB_HEAD_DROPEDWEAPON();
			case 3: return new P2P_SUB_HEAD_OBJECT_STATIC();
			case 4: return new P2P_SUB_HEAD_OBJECT_MOVE();
			case 5: return new P2P_SUB_HEAD_OBJECT_DYNAMIC();
			case 6: return new P2P_SUB_HEAD_OBJECT_ANIM();
			case 7: return new P2P_SUB_HEAD_NPC();
			case 8: return new P2P_SUB_HEAD_STAGEINFO_CHARA();
			case 9: return new P2P_SUB_HEAD_STAGEINFO_OBJ_STATIC();
			case 10: return new P2P_SUB_HEAD_STAGEINFO_OBJ_MOVE();
			case 11: return new P2P_SUB_HEAD_STAGEINFO_OBJ_DYNAMIC();
			case 12: return new P2P_SUB_HEAD_STAGEINFO_OBJ_ANIM();
			case 13: return new P2P_SUB_HEAD_CONTROLED_OBJECT();
			case 14: return new P2P_SUB_HEAD_STAGEINFO_MISSION();
			//case 15: return new P2P_SUB_HEAD_AI();
			//case 16: return new P2P_SUB_HEAD_DOMISKILLOBJECT();
			//case 17: return new P2P_SUB_HEAD_DOMIEVENT();
			//case 18: return new P2P_SUB_HEAD_SENTRYGUN();
			default: return new SEARCHING(value);
		}
	}
}