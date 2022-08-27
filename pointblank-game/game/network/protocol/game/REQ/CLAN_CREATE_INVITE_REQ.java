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

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.manager.*;
import core.models.*;

public class CLAN_CREATE_INVITE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int clan_id;
	protected int error;
	protected String message;
	public CLAN_CREATE_INVITE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		clan_id = ReadD();
		message = ReadT(ReadC());
	}
	@Override
	public void runImpl()
	{
		try
		{
			Player p = client.getPlayer();
			if (p != null)
			{
				List<PlayerInvites> list = ClanInviteManager.gI().getInvitesClan(clan_id);
				if (list.size() >= 100)
					error = 0x80001057;
				else
				{
					Clan clan = ck.getClanId(clan_id);
					if (clan != null)
					{
						if (!ClanInviteManager.gI().playerHasInvited(p.id))
						{
							PlayerInvites pi = new PlayerInvites();
							pi.player_id = p.id;
							pi.clan_id = clan_id;
							pi.date = date.getClanTime();
							pi.texto = message;
							p.clan_invited = clan_id;
							db.executeQuery("INSERT INTO jogador_invites (clan_id, player_id, date, texto) VALUES ('" + pi.clan_id + "', '" + pi.player_id + "', '" + pi.date + "', '" + pi.texto + "')");
							db.executeQuery("UPDATE jogador SET clan_invited='" + pi.clan_id + "' WHERE id='" + pi.player_id + "'");
							ClanInviteManager.gI().addInvite(pi);
							error = 0;
						}
						else
						{
							error = 0x80001068;
						}
					}
					else
					{
						error = 0x8000105B;
					}
				}
				list.clear();
			}
			else
			{
				error = 0x80001068;
			}
		}
		catch (Exception e)
		{
			error = 0x80001068;
		}
		sendPacket(new CLAN_CREATE_INVITE_ACK(error));
		if (error == 0)
			sendPacket(new CLAN_ENTER_ACK(clan_id, 0));
	}
}