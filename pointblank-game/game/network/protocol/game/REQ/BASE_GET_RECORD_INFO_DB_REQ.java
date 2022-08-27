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

public class BASE_GET_RECORD_INFO_DB_REQ extends game.network.protocol.GamePacketREQ
{
	protected PlayerStats s;
	public BASE_GET_RECORD_INFO_DB_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		long pId = ReadQ();
		Player p = AccountSyncer.gI().get(pId);
		if (p != null && p.stats != null)
			s = p.stats;
		else
			s = db.READ_STATS(pId);
	}
	@Override
	public void runImpl()
	{
		sendPacket(new BASE_GET_RECORD_INFO_DB_ACK(s));
	}
}