package core.utils;

import java.util.*;

import core.models.*;

public class ListUser
{
	protected static final ListUser INSTANCE = new ListUser();
	public List<User> list = new ArrayList<User>();
	public ListUser()
	{
		list.add(new User("localhost1", "localhost1", "10.0.0.4",  "1.15.41.5", 38, "52.157.238.17",""));
	}
	public User AUTHENTICATION(String user, String pass)
	{
		for (User s : list)
		{
			if (s.user.equals(user) && s.pass.equals(pass))
				return s;
		}
		return null;
	}
	public static ListUser gI()
	{
		return INSTANCE;
	}
}