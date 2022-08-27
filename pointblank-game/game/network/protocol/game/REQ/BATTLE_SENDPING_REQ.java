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

package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class BATTLE_SENDPING_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected byte[] LATENCY;
	protected int preparedRed, preparedBlue, red, blue, loading;
	protected boolean ignore = true;
	public BATTLE_SENDPING_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		if (r != null)
		{
			LATENCY = ReadB(16);
			for (int i = 0; i < 16; i++)
			{
				RoomSlot slot = r.getRoomSlot(i);
				slot.ping = LATENCY[i];
				if (i == r._getMaster())
					r.ping = slot.ping;
			}
		}
	}
	@Override
	public void runImpl()
	{
		Channel ch = client.getChannel();
		if (r != null && ch != null)
		{
			for (int i = 0; i < 16; i++)
			{
				RoomSlot s = r.getRoomSlot(i);
				Player f = r.getPlayerBySlot(i);
				if (f != null)
				{
					int state = s.state.ordinal();
					if (state == 13)
					{
						f.connection.sendPacket(new BATTLE_SENDPING_ACK(LATENCY));
					}
					if (state > 8)
					{
						if (r.rstate.ordinal() < 2 || state < 8 || r.getSlotState(r.LIDER).ordinal() < 8 || _IP(f, false).length == 0 || _IP(f, false) == new byte[4] || _IP(f, true).length == 0 || _IP(f, true) == new byte[4] || _IP(r.getLeader(), false).length == 0 || _IP(r.getLeader(), false) == new byte[4] || _IP(r.getLeader(), true).length == 0 || _IP(r.getLeader(), true) == new byte[4])
						{
							sendPacket(new SERVER_MESSAGE_KICK_BATTLE_ACK(BattleErrorMessage.EVENT_ERROR_NO_REAL_IP, r, s));
							continue;
						}
					}
					if (state > 8 && state < 12)
					{
						if (i % 2 == 0)
							red++;
						else
							blue++;
						if (s.state == SlotState.RENDEZVOUS)
							loading++;
					}
					else if (state == 12)
					{
						if (i % 2 == 0)
							preparedRed++;
						else
							preparedBlue++;
					}
				}
			}
			if (r.rstate == RoomState.BATTLE && (red > 0 || blue > 0))
				r.start_battle();
			else
			{
				if (r.special == 6 || r.special == 9)
				{
					if (r.rstate == RoomState.PRE_BATTLE || (red + blue) == 0)
						r.start_battle();
				}
				else
				{
					if (ch.type == ChannelServerEnum.CHANNEL_TYPE_CLAN)
					{
						if ((red + blue) == 0)
							r.start_battle();
					}
					else
					{
						if (preparedRed > 0 && preparedBlue > 0)
							r.start_battle();
						else if ((red + blue) == 0)
							r.start_battle();
					}
				}
			}
		}
	}
	protected byte[] _IP(Player p, boolean localhost)
	{
		return localhost ? p.localhost : p.IP();
	}
}