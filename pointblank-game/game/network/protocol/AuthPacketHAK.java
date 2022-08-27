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

package game.network.protocol;

import core.network.*;
import game.network.client.*;
import game.network.protocol.auth.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class AuthPacketHAK extends ProtocolExecutor
{
	protected static final AuthPacketHAK INSTANCE = new AuthPacketHAK();
	public AuthPacketHAK()
	{
		put(new AUTH_CONNECTION_REQ(1));
		put(new KICK_ACCOUNT_REQ(2));
		put(new RECEIVE_PLAYER_CHANNEL_REQ(3));
	}
	public static AuthPacketHAK gI()
	{
		return INSTANCE;
	}
	public AuthPacketREQ MONTAR_PACOTE(ByteBuf buffer, AuthClient client) throws Exception
	{
		int opcode = buffer.readUnsignedShort();
		if (buffer.readableBytes() > 0) 
			return (AuthPacketREQ) getPacket(opcode, buffer, client, true);
		return null;
	}
}