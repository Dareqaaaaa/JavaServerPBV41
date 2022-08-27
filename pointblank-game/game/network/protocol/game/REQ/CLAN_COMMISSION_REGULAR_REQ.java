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

public class CLAN_COMMISSION_REGULAR_REQ extends game.network.protocol.GamePacketREQ
{
	protected int sucess;
	public CLAN_COMMISSION_REGULAR_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Player p = client.getPlayer();
		if (p != null && p.rolePermisse())
		{
			try
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null)
				{
					int size = ReadC();
					for (int i = 0; i < size; i++)
					{
						try
						{
							long pId = ReadQ();
							for (Player f : ck.getPlayers(c))
							{
								if (f.id == pId && f.role != ClanRole.CLAN_MEMBER_LEVEL_REGULAR)
								{
									f.role = ClanRole.CLAN_MEMBER_LEVEL_REGULAR;
									db.updateRole(pId, f.role.ordinal());
									sendMessage(c, f);
									EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(f, true, false, true);
									AccountSyncer.gI().UPDATE(f);
									sucess++;
									break;
								}
							}
						}
						catch (Exception e)
						{
						}
					}
				}
				else
				{
					sucess = 0x8000105B;
				}
			}
			catch (Exception e)
			{
				sucess = 0x80001062;
			}
		}
		else
		{
			sucess = 0x80001062;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_COMMISSION_REGULAR_ACK(sucess));
	}
	public void sendMessage(Clan c, Player p) throws Exception 
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, NoteReceive.MEMBRO_CLAN, false);
			msg.name = c.name;
			msg.owner_name = p.name;
			msg.texto = "";
			db.CRIAR_MENSAGEM(msg);
			if (msg != null && p.connection != null)
				p.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, AccountSyncer.gI().get(p.id)));
			msg = null;
		}
	}
}