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

package game.network.protocol.auth.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.*;
import game.network.protocol.auth.ACK.*;
import game.network.protocol.game.ACK.*;

public class KICK_ACCOUNT_REQ extends AuthPacketREQ
{
	protected Player p;
	protected long pId;
	public KICK_ACCOUNT_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		p = AccountSyncer.gI().get(pId = ReadQ());
	}
	@Override
	public void runImpl()
	{
		if (p != null && p.connection != null)
			p.connection.close(new BASE_KICK_ACCOUNT_ACK(p.connection, KickType.O_JOGO_SERA_FINALIZADO_POR_CONEXÃO_SIMULTÃNEA));
		else
			sendPacket(new AUTH_KICK_PLAYER_ACK(0, pId));
	}
}