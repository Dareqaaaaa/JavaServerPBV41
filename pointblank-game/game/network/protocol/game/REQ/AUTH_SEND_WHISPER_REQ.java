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

public class AUTH_SEND_WHISPER_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player c;
	protected Player p;
	protected String owner;
	protected String message;
	protected int length;
	protected int susurro;
	protected long pId;
	public AUTH_SEND_WHISPER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		if (opcode == 292)
			pId = ReadQ();
		owner = ReadS(33);
		if (pId > 0) c = AccountSyncer.gI().get(pId);
		else c = AccountSyncer.gI().get(owner);
		length = ReadH();
		if (length > 60) length = 60;
		message = ReadS(length);
		if (c != null)
		{
			if (c.config != null)
				susurro = c.config.chatSusurro;
			else
				susurro = db.returnQueryValueI("SELECT chatsusurro FROM jogador_config WHERE player_id='" + c.id + "'", "chatsusurro");
		}
	}
	@Override
	public void runImpl()
	{
		p = client.getPlayer();
		if (p != null && c != null && c.connection != null && c.online == 1 && susurro == 0)
		{
			sendPacket(new AUTH_SEND_WHISPER_ACK(owner, message, 0, susurro));
			c.connection.sendPacket(new AUTH_RECV_WHISPER_ACK(p, message));
		}
		else
		{
			sendPacket(new AUTH_SEND_WHISPER_ACK(owner, message, 0x80000000, susurro));
		}
	}
}