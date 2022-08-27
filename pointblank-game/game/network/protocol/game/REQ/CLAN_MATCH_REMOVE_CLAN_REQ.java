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

public class CLAN_MATCH_REMOVE_CLAN_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error = 0x80001094; //Erro
	public CLAN_MATCH_REMOVE_CLAN_REQ(int opcode)
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
		Channel ch = client.getChannel();
		if (p != null && ch != null)
		{
			ClanFronto cf = ch.BUSCAR_CF(p.cf_id);
			if (cf != null)
			{
				cf.REMOVER_JOGADOR(p.cf_slot);
				if (cf.PLAYERS() == 0)
					ch.CLANFRONTOS.remove(cf.id);
				p.cf_id = -1;
				p.cf_slot = -1;
				error = 0;
			}
		}
		sendPacket(new CLAN_MATCH_REMOVE_CLAN_ACK(error));
	}
}