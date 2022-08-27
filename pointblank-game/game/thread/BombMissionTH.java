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

public class BombMissionTH implements PrincipalAbstract
{
	@Override
	public void run(int roomId, int channelId, int serverId, int currentRound) throws Exception
	{
		Channel ch = GameServerXML.gI().getChannel(channelId, serverId);
		if (ch != null)
		{
			Room r = ch.BUSCAR_SALA(roomId);
			if (r != null)
			{
				if (r.threadBOMB != null && r.rstate == RoomState.BATTLE && r.bomba && r.rodadas == currentRound)
					r.round(TimeEnum.TIME_VERMELHO, WinnerRound.BOMBFIRE);
				r.stopTask(ThreadState.BOMB);
				r.threadBOMB = null;
			}
		}
	}
}