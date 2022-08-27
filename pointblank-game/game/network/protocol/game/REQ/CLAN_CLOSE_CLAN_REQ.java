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
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_CLOSE_CLAN_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error;
	public CLAN_CLOSE_CLAN_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			try
			{
				int clan_id = p.clan_id;
				Clan c = ck.getClanId(clan_id);
				if (c != null && p.id == c.owner && c.membros.size() == 1)
				{
					synchronized (c)
					{
						db.deleteClan(clan_id);
						ck.removeClan(clan_id);
					}
					for (Player f : ck.getPlayers(c))
					{
						try
						{
							f.clanDate = 0;
							f.clan_id = 0;
							f.role = ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN;
							db.updateRole(f.id, f.role.ordinal());
							db.updateClanDate(f);
							db.updateClanID(f);
							EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(f, true, false, false);
							AccountSyncer.gI().UPDATE(f);
							if (f.connection != null)
					        	f.connection.sendPacket(new CLAN_READ_MEMBERS_ACK(new Clan(0, true)));
						}
						catch (Exception e)
						{
						}
					}
					c.membros.clear();
					c = null;
				}
				else
				{
					error = 0x8000106A;
				}
			}
			catch (Exception e)
			{
				error = 0x8000106A;
			}
		}
		else
		{
			error = 0x8000106A;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_DELETE_ACK(error));
	}
}