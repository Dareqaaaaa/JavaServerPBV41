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

public class CLAN_MESSAGE_INVITE_RESP_REQ extends game.network.protocol.GamePacketREQ
{
	protected int clan_id;
	protected int response;
	public CLAN_MESSAGE_INVITE_RESP_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		clan_id = ReadD();
		ReadD(); //0
		response = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			for (PlayerMessage msg : p.mensagens)
			{
				if (msg.owner_id == clan_id && msg.readed == ReadType.NAO_VISUALIZADO && msg.type == NoteType.CLAN)
				{
					msg.readed = ReadType.VISUALIZADO;
					db.executeQuery("UPDATE jogador_mensagem SET readed='0', response='1' WHERE object='" + msg.object + "'");
					break;
				}
			}
			Clan c = ck.getClanId(clan_id);
			if (c == null)
			{
				sendPacket(new CLAN_MESSAGE_INVITE_RESP_ACK(0x8000105B));
				return;
			}
			else if (p.clan_id > 0)
			{
				sendPacket(new CLAN_MESSAGE_INVITE_RESP_ACK(0x80001058));
				return;
			}
			else if (response == 1)
			{
				if ((c.membros.size() + 1) > c.vagas)
					sendPacket(new CLAN_MESSAGE_INVITE_RESP_ACK(0x80001056));
				else
					ck.inserirJogador(p, true, c.id);
			}
			sendMessage(c, p);
		}
		else
		{
			sendPacket(new CLAN_MESSAGE_INVITE_RESP_ACK(0x80000000));
		}
	}
	public void sendMessage(Clan c, Player p)
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, response == 1 ? NoteReceive.CONVITE_ACEITO : NoteReceive.CONVITE_REJEITADO, false);
			msg.name = c.name;
			msg.owner_name = p.name;
			msg.texto = "";
			for (Player m : ck.getPlayers(c))
			{
				if (msg != null && (m != null && m.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER || m.role == ClanRole.CLAN_MEMBER_LEVEL_STAFF))
				{
					msg.player_id = m.id;
					db.CRIAR_MENSAGEM(msg);
					if (msg != null && m.connection != null)
						m.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, AccountSyncer.gI().get(m.id)));
				}
			}
			sendPacket(new MESSENGER_NOTE_ACCEPT_ACK(0)); //0 - Mensagem enviada | 1 - Falha ao enviar mensagem
			msg = null;
		}
	}
}