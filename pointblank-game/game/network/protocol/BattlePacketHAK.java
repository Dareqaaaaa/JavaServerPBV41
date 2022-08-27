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
import game.network.protocol.battle.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class BattlePacketHAK extends ProtocolExecutor
{
	protected static final BattlePacketHAK INSTANCE = new BattlePacketHAK();
	public BattlePacketHAK()
	{
		put(new REQUEST_BATTLE_CONNECTION_REQ(1));
		put(new REQUEST_GAME_SEND_REQ(2));
		put(new REQUEST_BATTLE_PRESTART_REQ(3));
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