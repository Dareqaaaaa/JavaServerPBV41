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

public class BATTLE_NETWORK_ERROR_REQ extends game.network.protocol.GamePacketREQ
{
	public BATTLE_NETWORK_ERROR_REQ(int opcode)
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
		//sendPacket(new SERVER_MESSAGE_KICK_BATTLE_ACK(BattleErrorMessage.EVENT_ERROR_EVENT_BATTLE_TIMEOUT_CS));
		//BATTLE_LEAVEP2PSERVER_REQ packet = new BATTLE_LEAVEP2PSERVER_REQ(3384);
		//packet.client = client;
		//packet.buf = null;
		//packet.runImpl();
		//packet = null;
	}
}