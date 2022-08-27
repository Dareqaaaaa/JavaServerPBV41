package core.sql;

import core.log.*;

public abstract class InterfaceSQL
{
	public InterfaceSQL()
	{
	}
	public static void error(Class<?> classe, Exception e)
	{
		Logger.gI().info("error", e, "", classe);
	}
}