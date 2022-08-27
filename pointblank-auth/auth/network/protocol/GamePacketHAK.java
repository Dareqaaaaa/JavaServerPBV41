/*
 * Point Blank Emulador
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2016-2018
 */

package auth.network.protocol;

import core.network.*;
import auth.network.client.*;
import auth.network.protocol.game.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class GamePacketHAK extends ProtocolExecutor
{
	protected static final GamePacketHAK INSTANCE = new GamePacketHAK();
	public GamePacketHAK()
	{
		put(new RECEIVE_PLAYER_CHANNEL_REQ(3));
		put(new AUTH_KICK_PLAYER_REQ(4));
	}
	public static GamePacketHAK gI()
	{
		return INSTANCE;
	}
	public GamePacketREQ MONTAR_PACOTE(ByteBuf buffer, GameClient client) throws Exception
	{
		int opcode = buffer.readUnsignedShort();
		if (buffer.readableBytes() > 0)
		{
			if (opcode == 3)
			{
				synchronized (this)
				{
					GamePacketREQ packet = (GamePacketREQ) getPacket(opcode, buffer, client, true);
					if (packet != null)
						packet.sync = true;
					return packet;
				}
			}
			else
			{
				GamePacketREQ packet = (GamePacketREQ) getPacket(opcode, buffer, client, true);
				if (packet != null)
					packet.sync = false;
				return packet;
			}
		}
		return null;
	}
}