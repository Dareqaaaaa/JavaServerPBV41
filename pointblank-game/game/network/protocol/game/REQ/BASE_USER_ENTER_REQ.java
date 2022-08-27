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

import java.net.*;
import java.util.*;

import core.enums.*;
import core.manager.*;
import core.models.*;
import core.utils.*;
import core.xml.PlaytimeXML;

public class BASE_USER_ENTER_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected String login;
	protected byte[] localhost;
	protected boolean error = true;
	protected boolean firstLoad = true;
	public BASE_USER_ENTER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			login = ReadS(ReadC());
			client.pId = ReadQ();
			int conexao = ReadC();
			localhost = ReadB(4);
			InetAddress net = InetAddress.getByAddress(localhost);
			if (net != null && (conc.mask_ip && NetworkUtil.parseIp(client.ip).equals(localhost) || !conc.mask_ip))
			{
				if (login.length() > 0 && client.pId != 0 && conexao == conc.connection)
				{
					p = client.getPlayer();
					if (p != null)
					{
						if (!Arrays.equals(p.localhost, localhost))
							return;
						firstLoad = false;
					}
					else
					{
						p = db.CARREGAR(client.pId);
						firstLoad = true;
					}
					if (p != null && p.online == 1)
					{
						p.firstEnter = p.name.isEmpty();
						p.server_id = client.serverIndex;
						p.address = net;
						p.localhost = localhost;
						p.connection = client;
						p.addrEndPoint = client.ip;
						p.login = login;
						p.changeServer = false;
						db.REPLACE_NICK(p.id, p.name);
						db.REPLACE_RANK(p.id, p.rank);
						client.mac = db.returnQueryValueS("SELECT mac FROM contas WHERE id='" + p.id + "'", "mac");
						for (Player member : AccountSyncer.gI().ACCOUNTS.values())
						{
							if (member != null && member.connection != null && member.id != p.id)
							{
								io.netty.channel.Channel socket = member.connection.channel;
								if (socket.compareTo(client.socket) == 0)
								{
									member.connection.close(new BASE_KICK_ACCOUNT_ACK(member.connection, KickType.O_JOGO_SERA_FINALIZADO_POR_CONEXÃO_SIMULTÃNEA));
									return;
								}
							}
						}
						String permite = EssencialUtil.gI().stringBad(p.name, conc.bad_string);
						if (permite.length() > 0 && !AuthenticationAddress.gI().addr.containsKey(client.mac))
						{
							sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK("System has blocked this string for your nickname. (" + permite + ")"));
							return;
						}
						AccountSyncer.gI().PUT(p);
						error = false;
					}
				}
				else
				{
					excp(new Exception("login.length() > 0 && client.pId != 0 && conexao == conc.connection"));
				}
			}
			else
			{
				excp(new Exception("net != null && (conc.mask_ip && NetworkUtil.parseIp(client.ip).equals(localhost) || !conc.mask_ip)"));
			}
		}
		catch (Exception e)
		{
			excp(e);
			error = true;
		}
	}
	@Override
	public void runImpl()
	{
		try
		{
			if (p != null && !error && firstLoad)
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null)
				{
					sendPacket(new CLAN_READ_MEMBERS_ACK(c));
					ClanInviteManager.gI().deleteInvite(p);
				}
				sendPacket(new FRIEND_INFO_ACK(p));
				if (p.status() > 0)
					EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 64, false);
				checkBonuses();
				playTime();
			}
		}
		catch (Exception e)
		{
			excp(e);
			error = true;
		}
		sendPacket(new BASE_USER_ENTER_ACK(error ? 0x80000000 : 0));
		if (error)
		{
			try
			{
				client.close(null);
			}
			catch (Exception e)
			{
			}
		}
	}
	public void checkBonuses()
	{
		if (p.event.christmas == 1)
		{
			sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, 702001024, 100, 1, -1, true));
			db.updateChristmas(p, p.event.christmas = 2);
		}
		if (p.vip.pc_cafe == 4)
		{
			sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, 1105003005, 100, 1, -1, true));
			db.executeQuery("UPDATE jogador_vip SET pc_cafe='" + (p.vip.pc_cafe = 0) + "' WHERE player_id='" + p.id + "'");
		}
	}
	public void playTime()
	{
		EventPlaytime e = PlaytimeXML.gI().PLAYTIME_NOW();
		if (e != null && p.event.play_day != e.id)
		{
			if (p.event.played == 0)
			{
				p.event.played = e.minutos;
				db.executeQuery("UPDATE jogador_evento SET played='" + p.event.played + "' WHERE player_id='" + p.id + "'");
			}
			p.event.event_playtime = e.id;
		}
	}
}