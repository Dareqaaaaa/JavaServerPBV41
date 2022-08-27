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
import core.xml.*;
import game.network.protocol.*;
import game.network.protocol.game.ACK.*;

public class BASE_CHANNEL_ANNOUNCE_REQ extends GamePacketREQ
{
	protected Channel c;
	protected GameServerXML g;
	protected int error;
	public BASE_CHANNEL_ANNOUNCE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		g = GameServerXML.gI();
		c = g.getChannel(ReadD(), client.serverIndex);
	}
	@Override
	public void runImpl()
	{
		try
		{
			Player p = client.getPlayer();
			Room r = client.getRoom();
			if (p != null && c != null && r == null)
			{
				if (c.CONTADOR_DE_JOGADORES() >= g.getServer(c.server_id).channel_players)
					error = 0x80000201;
				else if (c.type == ChannelServerEnum.CHANNEL_TYPE_CLAN && p.clan_id == 0)
					error = 0x80000202;
				else if (c.only_acess)
					error = 0x80000205;
				else
					error = 0;
				if (p.rank == 53 || p.rank == 54 || p.access_level.ordinal() > 0)
					error = 0;
				if (error == 0)
				{
					p.channel_id = c.id;
					p.server_id = c.server_id;
				}
			}
			else
			{
				error = 0x80000200;
			}
		}
		catch (Exception e)
		{
			error = 0x80000200;
		}
		sendPacket(new BASE_CHANNEL_ANNOUNCE_ACK(c, error));
	}
}