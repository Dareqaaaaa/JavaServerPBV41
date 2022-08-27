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
import auth.network.protocol.auth.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class AuthPacketHAK extends ProtocolExecutor
{
	protected static final AuthPacketHAK INSTANCE = new AuthPacketHAK();
	public AuthPacketHAK()
	{
		put(new BASE_USER_GIFTLIST_REQ(528));

		put(new BASE_GET_LOGIN_REQ(2561));
		put(new BASE_GET_LOGIN_REQ(2563));
		put(new BASE_GET_MYINFO_REQ(2565));
		put(new BASE_GET_CONFIG_REQ(2567));
		put(new BASE_GET_LOGIN_REQ(2672));
		put(new BASE_GET_LOGIN_REQ(2673));
		put(new BASE_SCHANNEL_LIST_REQ(2575));
		put(new BASE_GET_ENTER_SERVER_REQ(2577));
		put(new BASE_GET_USER_ENTER_REQ(2579));
		put(new BASE_GET_CONFIG_UPDATE_REQ(2581));

		put(new BASE_GET_PBLACKOUT_REQ(2661));
		put(new BASE_UPDATE_SCHANNEL_LIST_REQ(2642));
		put(new BASE_EXIT_GAME_REQ(2654));
		put(new BASE_GET_RANKINFO_REQ(2668));
		put(new BASE_GET_SOURCE_REQ(2678));
		put(new BASE_GET_INVENTORY_REQ(2698));
	}
	public static AuthPacketHAK gI()
	{
		return INSTANCE;
	}
	public synchronized AuthPacketREQ MONTAR_PACOTE(ByteBuf buffer, AuthClient client) throws Exception
	{
		int opcode = buffer.readUnsignedShort();
		if (buffer.readableBytes() > 0)
		{
			AuthPacketREQ packet = (AuthPacketREQ) getPacket(opcode, buffer, client, false);
			if (packet == null)
				client.close(null);
			return packet;
		}
		return null;
	}
}