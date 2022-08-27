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
import game.network.protocol.game.ACK.*;

public class AUTH_GET_REMAIN_MONEY_REQ extends game.network.protocol.GamePacketREQ
{
	public AUTH_GET_REMAIN_MONEY_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			//p.gold = db.returnQueryValueI("SELECT gold FROM jogador WHERE id='" + p.id + "'", "gold");
			//p.cash = db.returnQueryValueI("SELECT cash FROM jogador WHERE id='" + p.id + "'", "cash");
			sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(p));
		}
	}
}