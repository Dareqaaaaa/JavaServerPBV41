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

public class REQUEST_GAME_CONNECTION_ACK extends BattlePacketACK
{
	protected String key;
	public REQUEST_GAME_CONNECTION_ACK(String key)
	{
		super(true);
		this.key = key;
	}
	@Override
	public void writeImpl()
	{
		WriteH(key.length());
		WriteS(key, key.length());
	}
}