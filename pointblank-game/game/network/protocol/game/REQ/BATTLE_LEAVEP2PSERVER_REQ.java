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
import game.network.protocol.game.ACK.*;

public class BATTLE_LEAVEP2PSERVER_REQ extends game.network.protocol.GamePacketREQ
{
	public boolean remove = false;
	public boolean escape = true;
	public BATTLE_LEAVEP2PSERVER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		if (buf != null)
			ReadD();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null)
		{
			RoomSlot s = r.getSlotByPID(p.id);
			if (s != null && s.state.ordinal() > 8)
			{
				if (s.respawn == 0)
					escape = false;
				r.RESETAR_SLOT_PLAYER(s, remove, escape);
				if (r.votekick != null && r.threadVOTE != null && r.votekick.jogador_kikado == s.id)
				{
					for (int i = 0; i < 16; i++)
					{
						Player mM = r.getPlayerBySlot(i);
						if (mM != null && i != r.votekick.jogador_kikado)
							mM.connection.sendPacket(new VOTEKICK_RESULT_ACK(s.id, r.votekick.kikar, r.votekick.deixar, false, true));
			        }
					r.stopTask(ThreadState.VOTEKICK);
					r.threadVOTE = null;
					r.votekick = null;
				}
				sendPacket(new BATTLE_ENDBATTLE_ACK(p, r, 0, 0, 0));
				for (int i = 0; i < 16; i++)
				{
					Player mM = r.getPlayerBySlot(i);
					if (mM != null)
						mM.connection.sendPacket(new BATTLE_LEAVEP2PSERVER_ACK(p, s.id, client.LEAVEP2P));
				}
				int players = testPlayers(r);
				r.VERIFICAR_JOGADORES_NA_PARTIDA(s.id);
				r.TROCAR_HOST(players, s.id);
				r.updateInfo();
			}
		}
	}
	protected int testPlayers(Room r)
	{
		int jogadores = 0;
		for (int i = 0; i < 16; i++)
			if (r.getSlotState(i).ordinal() > 11)
				jogadores++;
		return jogadores;
	}
}