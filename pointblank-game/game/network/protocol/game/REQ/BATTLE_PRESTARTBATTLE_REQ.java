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

import core.enums.*;
import core.models.*;
import game.manager.*;
import game.network.protocol.game.ACK.*;

public class BATTLE_PRESTARTBATTLE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected Player p;
	protected RoomSlot s;
	protected boolean error = false;
	public BATTLE_PRESTARTBATTLE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		p = client.getPlayer();
        if (r != null && p != null)
        {
        	s = r.getSlotByPID(p.id);
        	if (s != null)
        	{
	        	if ((r.map + r.stage4v4 + r.type.ordinal()) != (ReadH() + ReadC() + ReadC()))
					error = true;
        	}
        	else
        	{
        		error = true;
        	}
        }
        else
        {
        	error = true;
        }
	}
	@Override
	public void runImpl()
	{
		if (!error)
		{
			int active = r.rstate.ordinal();
			if (active < 2 || active > 5 || s.state != SlotState.RENDEZVOUS || s.state.ordinal() < 8 || r.getSlotState(r.LIDER).ordinal() < 8 || _IP(p, false).length == 0 || _IP(p, false) == new byte[4] || _IP(p, true).length == 0 || _IP(p, true) == new byte[4] || _IP(r.getLeader(), false).length == 0 || _IP(r.getLeader(), false) == new byte[4] || _IP(r.getLeader(), true).length == 0 || _IP(r.getLeader(), true) == new byte[4])
				error = true;
			if (error)
			{
				error();
				return;
			}
			p.slot = s.id;
			synchronized (r)
			{
				if (r.getLeader() == null)
					r.setNewLeader(true);
			}
			s.death = r.isGhostMode(p.espectador);
			s.espectador = r.isGhostMode(p.espectador);
			BattleServerManager.gI().ADD_PLAYER(r, s.id);
			if (r.LIDER != p.id)
			{
				Player c = r.getLeader();
				if (c != null)
					c.connection.sendPacket(new BATTLE_PRESTARTBATTLE_ACK(r, p, s.id, false, 1));
			}
			else
			{
				r.rstate = RoomState.PRE_BATTLE;
				r.updateBInfo();
			}
			sendPacket(new BATTLE_PRESTARTBATTLE_ACK(r, p, s.id, true, 1));
			r.changeState(p, SlotState.PRESTART, true);
		}
		else
		{
			error();
		}
	}
	protected byte[] _IP(Player p, boolean localhost)
	{
		return localhost ? p.localhost : p.IP();
	}
	protected void error()
	{
		sendPacket(new BATTLE_PRESTARTBATTLE_ACK(null, null, -1, false, 0));
		sendPacket(new SERVER_MESSAGE_KICK_BATTLE_ACK(BattleErrorMessage.EVENT_ERROR_PRESTART_BATTLE_ALEADY_END, r, s));
	}
	protected int players()
	{
		int jogadores = 0;
		for (int i = 0; i < 16; i++)
		{
			int state = r.getSlotState(i).ordinal();
			if (state > 8 && state < 12)
			{
				jogadores++;
			}
		}
		return jogadores;
	}
}