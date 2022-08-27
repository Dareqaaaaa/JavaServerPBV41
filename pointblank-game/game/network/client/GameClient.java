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

package game.network.client;

import game.manager.*;
import game.network.protocol.*;
import game.network.protocol.game.ACK.*;
import game.network.protocol.game.REQ.*;
import io.netty.buffer.*;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.socket.*;

import java.io.*;
import java.nio.*;
import java.util.*;

import core.models.*;
import core.network.*;
import core.sql.*;
import core.utils.*;
import core.xml.*;

public class GameClient extends Connection
{
	protected final ProtocolProcessor<GamePacketREQ> processor = new ProtocolProcessor<GamePacketREQ>(1, 8);
	public long pId;
	public int shopId;
	public GameClient(SocketChannel socket, int serverIndex)
	{
		super(socket, serverIndex);
	}
	public Player getPlayer()
	{
		Player p = AccountSyncer.gI().get(pId);
		if (p != null && p.connection != null)
			p.connection = this;
		return p;
	}
	public Room getRoom()
	{
		Player p = getPlayer();
		Channel ch = getChannel();
		if (p != null && ch != null)
			return ch.BUSCAR_SALA(p.room_id);
		return null;
	}
	public Channel getChannel()
	{
		int server_id = -1, channel_id = -1;
		Player p = getPlayer();
		if (p != null)
		{
			server_id = p.server_id;
			channel_id = p.channel_id;
		}
		return GameServerXML.gI().getChannel(channel_id, server_id);
	}
	public void VERIFICAR_CONTA_ONLINE() throws Exception
	{
		PlayerSQL db = PlayerSQL.gI();
		Player p = getPlayer();
		if ((p != null && p.online == 1) || db.getOnlinePlayer(pId))
			db.updateOnline(pId, 0);
	}
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception
	{
		super.channelActive(ctx);
		sendPacket(new BASE_SCHANNEL_LIST_ACK());
	}
	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception
	{
		super.decode(ctx, in, out);
		ByteBuf buffer = in.order(ByteOrder.LITTLE_ENDIAN);
		if (readHeader)
		{
			if (buffer.readableBytes() < 4)
				return;
			LENGTH = buffer.readUnsignedShort();
			if (LENGTH > 8908)
			{
				LENGTH &= 32767;
				decrypt = true;
			}
			readHeader = false;
		}
		if (buffer.readableBytes() < (LENGTH + 2))
			return;
		ByteBuf recv = buffer.readBytes(LENGTH + 2);
		if (decrypt)
			BitShift.decrypt(recv, CRYPT_KEY);
		receivePacket(recv);
		readHeader = true;
		decrypt = false;
		buffer = null;
	}
	@Override
	public void channelUnregistered(ChannelHandlerContext ctx) throws Exception
	{
		if (!hasUnregistered)
		{
			boolean changeServer = false;
			try
			{
				PlayerSQL db = PlayerSQL.gI();
				Player p = getPlayer();
				if (p != null)
				{
					try
					{
						changeServer = p.changeServer;
						try
						{
							if (p.cf_id != -1)
							{
								CLAN_MATCH_REMOVE_CLAN_REQ packet = new CLAN_MATCH_REMOVE_CLAN_REQ(1550);
								packet.client = this;
								packet.buf = null;
								packet.runImpl();
								packet.finalize();
								packet = null;
							}
							Room r = getRoom();
							if (r != null)
							{
								BATTLE_LEAVEP2PSERVER_REQ packet = new BATTLE_LEAVEP2PSERVER_REQ(3384);
								packet.remove = true;
								packet.escape = false;
								packet.client = this;
								packet.buf = null;
								packet.runImpl();
								packet.finalize();
								packet = null;
								BattleServerManager.gI().REMOVE_PLAYER(r, p.slot);
								r.REMOVER_JOGADOR(p, false, true);
							}
						}
						catch (Exception e)
						{
						}
						Channel ch = getChannel();
						if (ch != null)
						{
							ch.REMOVER_JOGADOR(pId);
							ch.REMOVER_SALAS_VAZIAS();
						}
						p.cf_id = -1;
						p.cf_slot = -1;
						p.slot = -1;
						p.server_id = -1;
						p.channel_id = -1;
						p.room_id = -1;
						if (!changeServer)
						{
							p.online = 0;
							db.updateOnline(p.id, 0);
							db.update(p);
							db.REPLACE_NICK(p.id, p.name);
							db.REPLACE_RANK(p.id, p.rank);
							EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 48, false);
						}
						EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(p, false, false, true);
					}
					finally
					{
						if (p != null)
							p.finalize();
						if (!changeServer)
							p = null;
					}
				}
			}
			finally
			{
				if (!changeServer)
				{
					AccountSyncer.gI().REMOVE(pId);
					VERIFICAR_CONTA_ONLINE();
				}
			}
		}
		super.channelUnregistered(ctx);
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
	{
		super.exceptionCaught(ctx, cause);
		if (cause instanceof IOException)
			channelUnregistered(null);
	}
	@Override
	public void close(PacketACK packet)
	{
		super.close(packet);
		try
		{
			channelUnregistered(null);
		}
		catch (Exception e)
		{
		}
	}
	@Override
	public void sendPacket(PacketACK packet)
	{
		try
		{
			if (packet != null && (packet instanceof GamePacketACK))
			{
				((GamePacketACK) packet).write(this);
				packet.finalize();
			}
		}
		catch (Exception e)
		{
			excp(e);
		}
		packet = null;
	}
	protected void receivePacket(ByteBuf buffer)
	{
		GamePacketREQ packet = null;
		try
		{
			packet = GamePacketHAK.gI().MONTAR_PACOTE(buffer, this);
			executePacket(packet);
		}
		catch (Exception e)
		{
			excp(e);
		}
		packet = null;
	}
	protected void executePacket(GamePacketREQ packet)
	{
		if (packet != null && packet.read())
		{
			processor.newThread(packet);
			packet.finalize();
		}
	}
}