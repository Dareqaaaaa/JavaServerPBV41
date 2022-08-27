package core.xml;

import java.io.*;
import java.util.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.models.*;
import core.utils.*;

public class PlaytimeXML extends SyncerXML
{
	protected static final PlaytimeXML INSTANCE = new PlaytimeXML();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	public List<EventPlaytime> playtime = new ArrayList<EventPlaytime>();
	public PlaytimeXML()
	{
	}
	public static PlaytimeXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		for (File f : new File("data/playtime").listFiles())
		{
			EventPlaytime e = new EventPlaytime();
			Document doc = open("data/playtime/" + f.getName());
		    NodeList list = doc.getElementsByTagName("list");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	e.id = ReadD("id");
		        	e.enable = ReadB("enable");
		        	e.titulo = ReadS("titulo");
		        	e.minutos = ReadD("minutos");
		        	e.inicio = Integer.parseInt(ReadS("inicio").replace("-", "").replace("/", "").replace(":", "").replace(" ", ""));
		        	e.termino = Integer.parseInt(ReadS("termino").replace("-", "").replace("/", "").replace(":", "").replace(" ", ""));
		        	e.gift1 = ReadD("gift1");
		        	e.gift2 = ReadD("gift2");
		        }
	        }
	        list = doc.getElementsByTagName("item");
		    for (int i = 0; i < list.getLength(); i++)
		    {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	EventReward t = new EventReward();
		        	t.item_id = ReadD("item_id");
		        	t.count = ReadD("count");
		        	t.equip = ReadD("equip");
		        	t.gift = ReadD("gift");
		        	e.items.add(t);
		        }
		    }
		    EventPlaytime ev = PLAYTIME_ID(e.id);
		    if (ev != null)
		    {
		    	synchronized (ev)
		    	{
		    		ev = e;
		    	}
		    }
		    else
		    {
		    	playtime.add(e);
		    }
		    close(list);
		}
	}
	public EventPlaytime PLAYTIME_ID(int id)
	{
		for (EventPlaytime e : playtime)
			if (e.id == id)
				return e;
		return null;
	}
	public EventPlaytime PLAYTIME_NOW()
	{
		for (EventPlaytime e : playtime)
			if (e.enable && e.inicio < date.getDateTime() && e.termino > date.getDateTime())
				return e;
		return null;
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
}