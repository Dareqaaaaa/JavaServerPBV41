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

package game.thread;

import core.enums.*;
import core.models.*;
import core.tasks.*;
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class VoteKickTH implements PrincipalAbstract
{
	@Override
	public void run(int roomId, int channelId, int serverId, int value) throws Exception
	{
		Channel ch = GameServerXML.gI().getChannel(channelId, serverId);
		if (ch != null)
		{
			Room r = ch.BUSCAR_SALA(roomId);
			if (r != null)
			{
		        boolean kikar_jogador = false;
		        int jogador_kikado = 0, kikar = 0, deixar = 0;
				if (r.votekick != null)
				{
					jogador_kikado = r.votekick.jogador_kikado;
					kikar = r.votekick.kikar;
					deixar = r.votekick.deixar;
		            int jogadores_vermelho = r.getPlayingPlayers(0, true, -1); 
		            int jogadores_azul = r.getPlayingPlayers(1, true, -1);
		            if (jogador_kikado % 2 == 0)
		            	jogadores_vermelho--;
		            else
		            	jogadores_azul--;
					if (kikar > (jogadores_vermelho) || kikar > (jogadores_azul) || kikar >= (jogadores_vermelho + jogadores_azul))
						kikar_jogador = r.KIKAR_JOGADOR(jogador_kikado);
				}
				for (int i = 0; i < 16; i++)
				{
					Player mM = r.getPlayerBySlot(i);
					if (mM != null && i != jogador_kikado)
						mM.connection.sendPacket(new VOTEKICK_RESULT_ACK(jogador_kikado, kikar, deixar, kikar_jogador, false));
		        }
				r.stopTask(ThreadState.VOTEKICK);
				r.threadVOTE = null;
				r.votekick = null;
			}
		}
	}
}