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

package core.thread;

import java.util.concurrent.*;

public class ServerRejectedExecutionHandler extends core.sql.InterfaceSQL implements RejectedExecutionHandler
{
	@Override
	public void rejectedExecution(Runnable runnable, ThreadPoolExecutor executor)
	{
		try
		{
			if (executor.isShutdown())
				return;
			if (Thread.currentThread().getPriority() > Thread.NORM_PRIORITY) 
			{
				Thread t = new Thread(runnable);
				t.start();
			}
			else
			{
				runnable.run();
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
}