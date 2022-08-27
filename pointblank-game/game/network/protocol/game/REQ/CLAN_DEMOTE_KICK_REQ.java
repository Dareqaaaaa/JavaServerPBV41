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
import core.manager.*;
import core.models.*;
import core.utils.*;
import core.xml.GameServerXML;
import game.network.protocol.game.ACK.*;

public class CLAN_DEMOTE_KICK_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error;
	public CLAN_DEMOTE_KICK_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Player p = client.getPlayer();
		if (p != null && p.clan_id > 0)
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
							for (Player k : ck.getPlayers(c))
							{
								try
								{
									if (k != null && k.id == pId)
									{
										for (Player ge : c.membros)
										{
											if (ge.id == pId)
											{
												c.membros.remove(ge);
												break;
											}
										}
										k.clan_invited = 0;
										k.clanDate = 0;
										k.clan_id = 0;
										k.role = ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN;
										db.updateRole(pId, k.role.ordinal());
										db.updateClanDate(k);
										db.updateClanID(k);
										sendMessage(c, k);
										ClanInviteManager.gI().deleteInvite(k);
										EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(k, true, false, false);
										AccountSyncer.gI().UPDATE(k);
										if (k.connection != null)
										{
								        	k.connection.sendPacket(new CLAN_READ_MEMBERS_ACK(new Clan(0, true)));
								        	Channel ch = GameServerXML.gI().getChannel(k.channel_id, k.server_id);
								        	if (ch != null)
								        	{
								        		Room r = ch.BUSCAR_SALA(k.room_id);
								        		if (r == null || r != null && r.getSlotState(k.id).ordinal() < 8)
								        		{
								        			k.connection.sendPacket(new CLAN_LEAVE_ACK()); //Kitar do clan
								        		}
								        	}
										}
										error++;
										break;
									}
								}
								catch (Exception e)
								{
								}
							}
			                for (Player f : ck.getPlayers(c))
			                	if (f != null && f.connection != null)
			                		f.connection.sendPacket(new CLAN_MEMBER_INFO_DELETE_ACK(pId));
						}
						catch (Exception e)
						{
						}
					}
					if (size > 0)
						ck.ATUALIZAR_INFO(c);
				}
				else
				{
					error = 0x8000105B;
				}
			}
			catch (Exception e)
			{
				error = 0x80000000;
			}
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_DEPORTATION_ACK(error));
	}
	public void sendMessage(Clan c, Player p)
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, NoteReceive.EXCLUIDO_CLAN, false);
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