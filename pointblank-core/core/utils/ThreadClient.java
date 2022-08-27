package core.utils;

import core.thread.*;

public class ThreadClient
{
	protected static final ThreadClient INSTANCE = new ThreadClient();
	public ThreadClient()
	{
	}
	public static ThreadClient gI()
	{
		return INSTANCE;
	}
	public void start(Runnable r)
	{
		try
		{
			ThreadPoolManager.gI().executeTask(r);
		}
		catch (Exception e)
		{
		}
	}
}