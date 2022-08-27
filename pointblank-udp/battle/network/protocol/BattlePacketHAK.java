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

package battle.network.protocol;

import core.network.*;
import battle.network.client.*;
import battle.network.protocol.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class BattlePacketHAK extends ProtocolExecutor
{
	protected static final BattlePacketHAK INSTANCE = new BattlePacketHAK();
	public BattlePacketHAK()
	{
		put(new REQUEST_GAME_CONNECTION_REQ(1));
		put(new REQUEST_REGISTER_ROOM_REQ(16));
		put(new REQUEST_UNREGISTER_ROOM_REQ(17));
		put(new REQUEST_ADD_PLAYER_REQ(18));
		put(new REQUEST_REMOVE_PLAYER_REQ(19));
		put(new REQUEST_CHANGE_HOST_REQ(20));
		put(new REQUEST_PRESTART_PLAYER_REQ(21));
	}
	public static BattlePacketHAK gI()
	{
		return INSTANCE;
	}
	public BattlePacketREQ MONTAR_PACOTE(ByteBuf buffer, BattleClient client) throws Exception
	{
		int opcode = buffer.readUnsignedShort();
		if (buffer.readableBytes() > 0)
			return (BattlePacketREQ) getPacket(opcode, buffer, client, true);
		return null;
	}
}