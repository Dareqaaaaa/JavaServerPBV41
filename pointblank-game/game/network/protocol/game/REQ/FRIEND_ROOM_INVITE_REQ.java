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

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class FRIEND_ROOM_INVITE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int indexOf;
	public FRIEND_ROOM_INVITE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		indexOf = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Room r = client.getRoom();
		if (p != null && r != null)
		{
			PlayerFriend ft = p.amigos.get(indexOf);
			if (ft != null)
			{
				Player a = AccountSyncer.gI().get(ft.id);
				if (a != null && a.connection != null)
				{
					for (PlayerFriend f : a.amigos)
					{
						if (f.id == p.id)
						{
							a.connection.sendPacket(new FRIEND_ROOM_INVITE_ACK(a.amigos.indexOf(f)));
							break;
						}
					}
				}
			}
		}
	}
}