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
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_MATCH_UPTIME_REQ extends game.network.protocol.GamePacketREQ
{
	protected int formacao;
	public CLAN_MATCH_UPTIME_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		formacao = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Channel ch = client.getChannel();
		if (p != null && ch != null)
		{
			ClanFronto cf = ch.BUSCAR_CF(p.cf_id);
			if (cf != null && cf.lider == p.id)
			{
				if (cf.PLAYERS() <= formacao)
				{
					if (formacao == cf.formacao)
						return;
					cf.formacao = formacao;
					for (RoomSlot slot : cf.SLOT)
					{
						if (slot.player_id > 0)
						{
							Player pR = AccountSyncer.gI().get(slot.player_id);
							if (pR != null && pR.connection != null)
								pR.connection.sendPacket(new CLAN_MATCH_UPTIME_ACK(0, formacao));
						}
					}
				}
				else
				{
					sendPacket(new CLAN_MATCH_UPTIME_ACK(0x80001095, 0));
				}
			}
			else
			{
				sendPacket(new CLAN_MATCH_UPTIME_ACK(0x80001095, 0));
			}
		}
		else
		{
			sendPacket(new CLAN_MATCH_UPTIME_ACK(0x80001095, 0));
		}
	}
}