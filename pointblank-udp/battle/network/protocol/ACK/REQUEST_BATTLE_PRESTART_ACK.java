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

package battle.network.protocol.ACK;

import battle.network.protocol.*;

public class REQUEST_BATTLE_PRESTART_ACK extends BattlePacketACK
{
	protected int roomId;
	protected int serverId;
	protected int channelId;
	protected int slot;
	protected int session;
	protected int event;
	public REQUEST_BATTLE_PRESTART_ACK(int roomId, int serverId, int channelId, int slot, int session, int event)
	{
		super(true);
		this.roomId = roomId;
		this.serverId = serverId;
		this.channelId = channelId;
		this.slot = slot;
		this.session = session;
		this.event = event;
	}
	@Override
	public void writeImpl()
	{
		WriteD(roomId);
		WriteD(serverId);
		WriteD(channelId);
		WriteD(slot);
		WriteD(session);
		WriteD(event);
	}
}