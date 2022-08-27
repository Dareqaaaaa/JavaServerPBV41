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

import core.manager.*;
import core.network.*;
import core.pistola.*;
import core.sql.*;
import core.system.*;
import core.utils.*;
import game.network.client.*;

public abstract class GamePacketACK extends PacketACK
{
	protected final DateTimeUtil date = DateTimeUtil.gI();
	protected final MissionsPISTOLA missao = MissionsPISTOLA.gI();
	protected final PlayerSQL db = PlayerSQL.gI();
	protected final ClanManager ck = ClanManager.gI();
	protected final ConfigurationLoader setting = ConfigurationLoader.gI();
	protected GameClient conn;
	public GamePacketACK(boolean clear)
	{
		super(0); //Opcode 0
		opcode = getId();
		if (opcode == 0)
			msgError("Opcode not founded in ACK: " + super.toString());
	}
	public int getId()
	{
		return GamePacketIdACK.getOpcode(toString());
	}
	@Override
	public String toString()
	{
		return getClass().getSimpleName();
	}
	public void write(GameClient client) throws Exception
	{
		if (runner)
		{
			conn = client;
			writeImpl();
			byte[] data = buf.array();
			buf.clear();
			buf.capacity(data.length + 4);
			WriteH(data.length);
			WriteH(opcode);
			WriteB(data);
			conn.channel.writeAndFlush(buf);
			buf = null;
			data = null;
		}
	}
	protected abstract void writeImpl();
}