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

package core.network;

import java.util.*;
import java.util.concurrent.locks.*;

@SuppressWarnings("rawtypes")
public class ProtocolProcessor<P extends PacketREQ> extends core.sql.InterfaceSQL
{
	protected final Lock lock = new ReentrantLock();
	protected final Condition notEmpty = lock.newCondition();
	protected final List<P> packets = new LinkedList<P>();
	protected final List<Thread> threads = new ArrayList<Thread>();
	protected final int minThreads;
	protected final int maxThreads;
	public ProtocolProcessor(int minThreads, int maxThreads)
	{
		if (minThreads <= 0)
			minThreads = 1;
		if (maxThreads < minThreads)
			maxThreads = minThreads;
		this.minThreads = minThreads;
		this.maxThreads = maxThreads;
		try
		{
			if (minThreads != maxThreads)
				startCheckerThread();
			for (int i = 0; i < minThreads; i++)
				newThread();
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	private void startCheckerThread()
	{
		try
		{
			Thread t = new Thread(new CheckerTask(), "PacketProcessor:Checker");
			t.start();
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	private boolean newThread()
	{
		if (threads.size() >= maxThreads)
			return false;
		try
		{
			Thread t = new Thread(new PacketProcessorTask(), "PacketProcessor:" + threads.size());
			threads.add(t);
			t.start();
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
		return true;
	}
	private void killThread()
	{
		try
		{
			if (threads.size() < minThreads) 
			{
				Thread t = threads.remove((threads.size() - 1));
				t.interrupt();
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public final void newThread(P packet)
	{
		try
		{
			lock.lock();
			if (packet != null)
			{
				packets.add(packet);
				notEmpty.signal();
			}
			packet = null;
		}
		finally
		{
			lock.unlock();
		}
	}
	private P getFirstAviable()
	{
		while (true)
		{
			while (packets.isEmpty())
				notEmpty.awaitUninterruptibly();
			ListIterator<P> it = packets.listIterator();
			while (it.hasNext())
			{
				P packet = it.next();
				it.remove();
				return packet;
			}
			notEmpty.awaitUninterruptibly();
		}
	}
	private final class PacketProcessorTask implements Runnable
	{
		@Override
		public void run()
		{
			P packet = null;
			while (true)
			{
				try
				{
					lock.lock();
					if (Thread.interrupted())
						return;
					packet = getFirstAviable();
				}
				finally
				{
					lock.unlock();
				}
				if (packet != null)
					packet.run();
			}
		}
	}
	private final class CheckerTask implements Runnable
	{
		private final int sleepTime = 60 * 1000;
		private int lastSize = 0;
		@Override
		public void run()
		{
			try
			{
				Thread.sleep(sleepTime);
			}
			catch (InterruptedException e)
			{
			}
			int sizeNow = packets.size();
			if (sizeNow < lastSize)
			{
				if (sizeNow < 3)
					killThread();
			}
			else if (sizeNow > lastSize && sizeNow > 50)
			{
				try
				{
					if (!newThread() && sizeNow >= 150)
					{
						System.out.print(" [!] Lag in thread processor [" + sizeNow + " client packets are waiting for execution]");
						System.out.flush();
					}
				}
				catch (Exception e)
				{
					error(getClass(), e);
				}
			}
			lastSize = sizeNow;
		}
	}
}