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

public class CLAN_ACCEPT_REQUEST_REQ extends game.network.protocol.GamePacketREQ
{
	protected int sucess;
	public CLAN_ACCEPT_REQUEST_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			Player p = client.getPlayer();
			if (p != null && p.rolePermisse())
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null)
				{
					int size = ReadC();
					if ((c.membros.size() + size) > c.vagas)
					{
						sucess = 0x80001056;
						return;
					}
					else
					{
						for (int i = 0; i < size; i++)
						{
							try
							{
								long pId = ReadQ();
								Player pC = AccountSyncer.gI().get(pId);
								if (pC == null)
								{
									pC = new Player();
									pC.id = pId;
									pC.name = EssencialUtil.gI().BUSCAR_NICK(pId);
									pC.rank = EssencialUtil.gI().BUSCAR_RANK(pId);
								}
								else
								{
									if (pC.clan_id != 0)
									{
										sucess++;
										continue;
									}
								}
								ck.inserirJogador(pC, false, c.id);
								sendMessage(c, pC);
								sucess++;
							}
							catch (Exception e)
							{
							}
						}
						if (size > 0)
							ck.ATUALIZAR_INFO(c);
					}
				}
				else
				{
					sucess = 0x8000105B;
				}
			}
			else
			{
				sucess = 0x80000000;
			}
		}
		catch (Exception e)
		{
			sucess = 0x80000000;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_ACCEPT_REQUEST_ACK(sucess));
	}
	public void sendMessage(Clan c, Player p) throws Exception
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, NoteReceive.PEDIDO_APROVADO, false);
			msg.name = c.name;
			msg.owner_name = p.name;
			msg.texto = "";
			db.CRIAR_MENSAGEM(msg);
			if (msg != null && p.connection != null)
				p.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, p));
			msg = null;
		}
	}
}