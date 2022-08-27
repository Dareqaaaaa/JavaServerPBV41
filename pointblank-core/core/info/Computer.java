package core.info;

public class Computer implements Runnable
{
	public String type;
	public Computer(String type)
	{
		this.type = type;
	}
	@Override
	public void run()
	{
		try
		{
			while (true)
			{
				Thread.sleep(1000);
				Software.MEMORY(type);
			}
		}
		catch (Throwable e)
		{
		}
	}
}