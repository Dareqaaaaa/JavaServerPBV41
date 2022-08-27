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

public class ThreadPoolManager extends core.sql.InterfaceSQL
{
	protected static final long MAX_DELAY = TimeUnit.NANOSECONDS.toMillis(Long.MAX_VALUE - System.nanoTime()) / 2;
	protected final ScheduledThreadPoolExecutor scheduledPool;
	protected final ThreadPoolExecutor instantPool;
	protected ThreadPoolManager()
	{
		scheduledPool = new ScheduledThreadPoolExecutor(5);
		scheduledPool.setRejectedExecutionHandler(new ServerRejectedExecutionHandler());
		scheduledPool.prestartAllCoreThreads();
		instantPool = new ThreadPoolExecutor(5, 5, 0, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(100000));
		instantPool.setRejectedExecutionHandler(new ServerRejectedExecutionHandler());
		instantPool.prestartAllCoreThreads();
		try
		{
			scheduleAtFixedRate(new Runnable()
			{
				@Override
				public void run()
				{
					try
					{
						purge();
					}
					catch (Exception e)
					{
						error(getClass(), e);
					}
				}
			}, 60000, 60000);
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public static ThreadPoolManager gI()
	{
		return SingletonHolder.INSTANCE;
	}
	private final long validate(long delay) throws Exception
	{
		return Math.max(0, Math.min(MAX_DELAY, delay));
	}
	public final ScheduledFuture<?> schedule(Runnable runnable, long delay) throws Exception
	{
		delay = validate(delay);
		return scheduledPool.schedule(runnable, delay * 1000, TimeUnit.MILLISECONDS);
	}
	public final ScheduledFuture<?> scheduleCOUNTD(Runnable runnable, long delay) throws Exception
	{
		delay = validate(delay);
		return scheduledPool.schedule(runnable, delay, TimeUnit.MILLISECONDS);
	}
	public final ScheduledFuture<?> scheduleAtFixedRate(Runnable runnable, long delay, long period) throws Exception
	{
		delay = validate(delay);
		period = validate(period);
		return scheduledPool.scheduleAtFixedRate(runnable, delay * 1000, period * 1000, TimeUnit.MILLISECONDS);
	}
	public ScheduledFuture<?> scheduleTaskManager(Runnable runnable, long delay) throws Exception
	{
		return schedule(runnable, delay);
	}
	public final void executeTask(Runnable r)
	{
		instantPool.execute(r);
	}
	public void purge() throws Exception
	{
		scheduledPool.purge();
		instantPool.purge();
	}
	public int getTaskCount(ThreadPoolExecutor tp)
	{
		return tp.getQueue().size() + tp.getActiveCount();
	}
	private static final class SingletonHolder
	{
		private static final ThreadPoolManager INSTANCE = new ThreadPoolManager();
	}
}