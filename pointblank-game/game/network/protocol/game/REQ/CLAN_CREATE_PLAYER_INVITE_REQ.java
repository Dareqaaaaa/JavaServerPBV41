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

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_CREATE_PLAYER_INVITE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int clan_id;
	public CLAN_CREATE_PLAYER_INVITE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		clan_id = ReadD();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			if (p.clan_id == 0)
			{
				Clan c = ck.getClanId(clan_id);
				if (c != null)
				{
					if (p.rank < c.limite_rank)
						sendPacket(new CLAN_CREATE_PLAYER_INVITE_ACK(0x8000107B, clan_id)); //0x8000107A - idade
					else
						sendPacket(new CLAN_CREATE_PLAYER_INVITE_ACK(0, clan_id));
				}
				else
				{
					sendPacket(new CLAN_CREATE_PLAYER_INVITE_ACK(0x8000105B, clan_id));
				}
			}
			else
			{
				sendPacket(new CLAN_CREATE_PLAYER_INVITE_ACK(0x80001058, clan_id)); //EVENT_ERROR_CLAN_MEMBER
			}
		}
		else
		{
			sendPacket(new CLAN_CREATE_PLAYER_INVITE_ACK(0x8000105B, clan_id));
		}
	}
}