package core.system;

import java.util.*;

import core.enums.*;
import core.models.*;
import core.udp.UDP_Type;

public class ConnectionLoader extends SystemLoader
{
	protected static final ConnectionLoader INSTANCE = new ConnectionLoader();
	public int connection;
	public int limit_online;
	public boolean mask_ip;
	public String userfilelist;
	public long launcher_key;
	public String bad_string;
	public String has_string;
	public UDP_Type udp;
	public List<Regions> regioes = new ArrayList<Regions>();
	public ConnectionLoader()
	{
		super("data/client/connection.pistola");
		LOAD();
	}
	@Override
	public void LOAD()
	{
		super.LOAD();
		connection = ReadD("connection");
		limit_online = ReadD("limit_online");
		mask_ip = ReadL("mask_ip");
		userfilelist = ReadS("userfilelist");
		if (!userfilelist.contains("-"))
			userfilelist = userfilelist.substring(1);
		else
			userfilelist = "";
		launcher_key = ReadQ("launcher_key");
		bad_string = ReadS("bad_string");
		has_string = ReadS("has_string");
		udp = UDP_Type.valueOf(ReadS("udp_server"));
		PROPERTIES.clear();
	}
	public static ConnectionLoader gI()
	{
		return INSTANCE;
	}
	public boolean isBlocked(CountryEnum pais)
	{
		for (Regions r : regioes)
			if (r.country == pais && r.blocked)
				return true;
		return false;
	}
}