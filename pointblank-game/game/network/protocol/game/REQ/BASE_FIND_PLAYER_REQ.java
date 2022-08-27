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

public class BASE_FIND_PLAYER_REQ extends game.network.protocol.GamePacketREQ
{
	protected long pId;
	public BASE_FIND_PLAYER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		String owner = (ReadS(33).replace(" ", "").trim());
		if (owner.length() > 0 && owner != "" && owner != " " && !owner.isEmpty())
		{
			Player p = AccountSyncer.gI().get(owner);
			if (p != null)
				pId = p.id;
			else
				pId = db.playerExist(owner);
		}
	}
	@Override
	public void runImpl()
	{
		try
		{
			sendPacket(new BASE_FIND_PLAYER_ACK(pId, pId > 0 ? 0 : 0x80001803)); //0x80001070 | offline: 0x80001804
		}
    	catch (Exception e)
		{
    		sendPacket(new BASE_FIND_PLAYER_ACK(0, 0x8000106F));
    	}
	}
}