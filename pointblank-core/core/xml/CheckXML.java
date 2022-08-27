package core.xml;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.models.*;
import core.utils.*;

public class CheckXML extends SyncerXML
{
	protected static final CheckXML INSTANCE = new CheckXML();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	public List<EventVerification> verification = new ArrayList<EventVerification>();
	public CheckXML()
	{
	}
	public static CheckXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		for (File f : new File("data/check").listFiles())
		{
        	EventVerification e = new EventVerification();
			Document doc = open("data/check/" + f.getName());
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
		        	e.checks = ReadD("checks");
		        	e.inicio = Integer.parseInt(ReadS("inicio").replace("-", "").replace("/", "").replace(":", "").replace(" ", ""));
		        	e.termino = Integer.parseInt(ReadS("termino").replace("-", "").replace("/", "").replace(":", "").replace(" ", ""));
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
		    list = doc.getElementsByTagName("gift");
		    for (int i = 0; i < list.getLength(); i++)
		    {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	EventGifts t = new EventGifts();
		        	t.time = ReadD("time");
		        	t.gift1 = ReadD("gift1");
		        	t.gift2 = ReadD("gift2");
		        	t.clear = ReadB("clear");
		        	if (t.gift2 > 0)
		        		t.size++;
		        	e.gifts.add(t);
		        }
		    }
		    EventVerification ev = VERIFICATION_ID(e.id);
		    if (ev != null)
		    {
		    	synchronized (ev)
		    	{
		    		ev = e;
		    	}
		    }
		    else
		    {
		    	verification.add(e);
		    }
		    close(list);
		}
	}
	public EventVerification VERIFICATION_ID(int id)
	{
		for (EventVerification e : verification)
			if (e.id == id)
				return e;
		return null;
	}
	public EventVerification VERIFICATION_NOW()
	{
		for (EventVerification e : verification)
			if (e.enable && e.inicio < date.getDateTime() && e.termino > date.getDateTime())
				return e;
		return null;
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
}