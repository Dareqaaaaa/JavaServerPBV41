package core.xml;

import java.io.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.models.*;
import core.utils.*;

public class ChristimasXML extends SyncerXML
{
	protected static final ChristimasXML INSTANCE = new ChristimasXML();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	public EventPresent e = new EventPresent();
	public ChristimasXML()
	{
	}
	public static ChristimasXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		Document doc = open("data/christimas/natal");
	    NodeList list = doc.getElementsByTagName("list");
        for (int i = 0; i < list.getLength(); i++)
        {
	    	Node atr = list.item(i);
	        if (atr.getNodeType() == Node.ELEMENT_NODE)
	        {
	        	patch(atr);
	        	e.id = ReadD("id");
	        	e.enable = ReadB("enable");
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
	        	e.items.add(t);
	        }
	    }
	    close(list);
	}
	public EventPresent EVENT_AVAILABLE()
	{
		if (e.enable && e.inicio < date.getDateTime() && e.termino > date.getDateTime())
			return e;
		else
			return null;
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
}