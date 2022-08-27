package core.xml;

import game.network.client.*;
import game.network.protocol.game.ACK.*;

import java.io.*;
import java.util.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class GameServerXML extends SyncerXML
{
	protected static final GameServerXML INSTANCE = new GameServerXML();
	public volatile transient List<Channel> channels = new ArrayList<Channel>();
	public volatile transient List<GameServerInfo> servers = new ArrayList<GameServerInfo>();
	public GameServerXML()
	{
	}
	public static GameServerXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD(boolean updateGameSrv) throws ParserConfigurationException, SAXException, IOException
	{
		for (File f : new File("data/gameserver").listFiles())
		{
			int id = Integer.parseInt(f.getName().replace(".xml", ""));
			Document doc = open("data/gameserver/" + f.getName());
		    NodeList list = doc.getElementsByTagName("list");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr); 
	        	    GameServerInfo g = new GameServerInfo(id);
	        	    g.active = ReadB("active");
	        	    g.type = GameServerEnum.valueOf(ReadS("type"));
	        	    g.max_players = ReadD("max_players");
	        	    g.channel_players = ReadD("channel_players");
	        	    g.port = ReadD("port");
	        	    g.ip = NetworkUtil.parseIpToBytes(g.addr = ReadS("ip"));
	        	    g.senha = ReadS("pass");
	        	    if (g.senha.length() > 0)
	        		   g.type = GameServerEnum.S_CHANNEL_TYPE_CONBINATION;
	        	    if (updateGameSrv)
	        	    {
		        	    GameServerInfo gs = getServer(id);
		        	    if (gs != null)
		        	    {
		        	    	synchronized (gs)
		        	    	{
			        	    	gs.active = g.active;
				        	    gs.type = g.type;
				        	    gs.max_players = g.max_players;
				        	    gs.channel_players = g.channel_players;
				        	    gs.port = g.port;
				        	    gs.addr = g.addr;
				        	    gs.ip = g.ip;
				        	    gs.senha = g.senha;
		        	    	}
		        	    }
		        	    else
		        	    {
		        	    	servers.add(g);
		        	    }
	        	    }
	        	    else
	        	    {
	        	    	servers.add(g);
	        	    }
	           }
	        }
		    list = doc.getElementsByTagName("channel");
		    for (int i = 0; i < list.getLength(); i++)
		    {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	Channel c = new Channel(id);
			       	c.id = ReadD("id");
			       	c.type = ChannelServerEnum.valueOf(ReadS("type"));
			       	c.anuncio = ReadS("announce");
			       	c.max_rooms = ReadD("max_rooms");
			       	c.only_acess = ReadB("only_acess");
			       	c.bonusExp = ReadF("bonusExp");
			       	c.bonusGold = ReadF("bonusGold");
			       	c.bonusCash = ReadF("bonusCash");
			       	try
			       	{
				       	if (c.type == ChannelServerEnum.CHANNEL_TYPE_CLAN)
				       		c.max_cf = ReadD("max_cf");
			       	}
			       	catch (Exception e)
			       	{
			       	}
			       	Channel ch = getChannel(c.id, id);
			       	if (ch != null)
			       	{
			       		synchronized (ch)
			       		{
		        			ch.type = c.type;
					       	ch.anuncio = c.anuncio;
					       	ch.max_rooms = c.max_rooms;
					       	ch.only_acess = c.only_acess;
					       	ch.bonusExp = c.bonusExp;
					       	ch.bonusGold = c.bonusGold;
					       	ch.bonusCash = c.bonusCash;
				       		ch.max_cf = c.max_cf;
							for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
							{
								if (pR != null && pR.connection != null && pR.connection instanceof GameClient)
								{
									if (ch.server_id == pR.server_id && pR.channel_id == ch.id)
										pR.connection.sendPacket(new BASE_CHANNEL_ANNOUNCE_ACK(ch, 0));
								}
							}
			       		}
			       	}
			       	else
			       	{
			       		channels.add(c);
			       	}
		        }
		    }
		    close(list);
		}
	}
	public Channel getChannel(int id, int gameServer)
	{
		for (Channel ch : channels)
			if (ch.id == id && ch.server_id == gameServer)
				return ch;
		return null;
	}
	public GameServerInfo getServer(int server)
	{
		for (GameServerInfo c : servers)
			if (c.id == server)
				return c;
		return null;
	}
	public List<Channel> getChannels(int gameServer)
	{
		List<Channel> list = new ArrayList<Channel>(10);
		for (Channel c : channels)
			if (c.server_id == gameServer)
				list.add(c);
		return list;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
	}
}