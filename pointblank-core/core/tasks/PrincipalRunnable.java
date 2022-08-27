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

package core.tasks;

public class PrincipalRunnable extends core.sql.InterfaceSQL implements Runnable
{
	protected int roomId, channelId, serverId;
	protected int value;
	protected PrincipalAbstract task;
	public PrincipalRunnable(int roomId, int channelId, int serverId, int value, PrincipalAbstract task)
	{
		this.roomId = roomId;
		this.channelId = channelId;
		this.serverId = serverId;
		this.value = value;
		this.task = task;
	}
	@Override
	public void run()
	{
		try
		{
			if (task != null)
				task.run(roomId, channelId, serverId, value);
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
}