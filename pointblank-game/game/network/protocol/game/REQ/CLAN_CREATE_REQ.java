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

public class CLAN_CREATE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Clan c;
	protected int error;
	protected int gold;
	public CLAN_CREATE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			Player p = client.getPlayer();
			if (p != null)
			{
				if (ck.clans.size() >= Integer.MAX_VALUE)
					error = 0x80001055;
				else
				{
					if (p.clan_id == 0 && p.rank >= setting.clan_requerits_rank && p.gold >= setting.clan_requerits_gold)
					{
						c = new Clan(0, false);
						int lengthName = ReadC();
						int lengthInfo = ReadC();
						int lengthNotice = ReadC();
						c.name = ReadS(lengthName);
						c.info = ReadT(lengthInfo);
						c.notice = ReadT(lengthNotice);
						c.logo = 0;	
						c.data = date.getClanTime();
						c.owner = p.id;
						if (db.createClan(c) && ck.addClan(c))
						{
							p.clan_id = c.id;
							p.clanDate = c.data;
							p.role = ClanRole.CLAN_MEMBER_LEVEL_MASTER;
							p.gold -= setting.clan_requerits_gold;
							if (p.gold < 0)
								p.gold = 0;
							gold = p.gold;
							p.novo_nome = "";
							p.clan_nome = "";
							p.clan_logo = 0;
							c.membros.add(p);
							db.updateClanID(p);
							db.updateClanDate(p);
							db.updateRole(p.id, 1);
							db.updateGold(p);
							ck.updateClan(c);
							EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(p, true, false, false);
							error = 0;
						}
						else
						{
							error = 0x80001048;
						}
					}
					else
					{
						error = 0x8000104A;
					}
				}
			}
		}
		catch (Exception e)
		{
			error = 0x80001048;
		}
	}
	@Override
	public void runImpl()
	{
		if (error != 0)
			c = null;
		sendPacket(new CLAN_CREATE_ACK(c, error, gold));
	}
}