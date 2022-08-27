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
import core.sql.*;
import core.system.*;
import core.utils.*;
import game.network.client.*;

public abstract class GamePacketREQ extends PacketREQ<GamePacketREQ, GameClient> implements Cloneable 
{
	protected final PlayerSQL db = PlayerSQL.gI();
	protected final FriendSQL fd = FriendSQL.gI();
	protected final AccountSQL ac = AccountSQL.gI();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	protected final ConfigurationLoader setting = ConfigurationLoader.gI();
	protected final ConnectionLoader conc = ConnectionLoader.gI();
	protected final ThreadClient thread = ThreadClient.gI();
	protected final ClanManager ck = ClanManager.gI();
	protected GamePacketREQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public final void run()
	{
		try
		{
			runImpl();
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected void sendPacket(GamePacketACK msg)
	{
		client.sendPacket(msg);
	}
	@Override
	protected GamePacketREQ clonePacket()
	{
		try
		{
			return (GamePacketREQ) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
}