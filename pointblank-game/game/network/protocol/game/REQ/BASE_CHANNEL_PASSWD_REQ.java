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
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class BASE_CHANNEL_PASSWD_REQ extends game.network.protocol.GamePacketREQ
{
	protected GameServerInfo gameServer;
	protected boolean enter = false;
	public BASE_CHANNEL_PASSWD_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		gameServer = GameServerXML.gI().getServer(client.serverIndex);
		if (gameServer != null)
		{
			String passwd = ReadS(ReadC()).trim();
			enter = passwd.equals(gameServer.senha) || gameServer.senha.isEmpty();
		}
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null && (p.rank == 53 || p.access_level.ordinal() > 0))
			enter = true;
		sendPacket(new BASE_CHANNEL_PASSWD_ACK(enter ? 1 : 0x80000000));
	}
}