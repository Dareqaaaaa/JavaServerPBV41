package core.xml;

import java.io.*;
import java.util.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.models.*;
import core.utils.*;

public class MapsLocalXML extends SyncerXML
{
	protected static final MapsLocalXML INSTANCE = new MapsLocalXML();
	public List<MapLocation> loc = new ArrayList<MapLocation>();
	public MapsLocalXML()
	{
	}
	public static MapsLocalXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		for (File f : new File("data/maps/local").listFiles())
		{
			int id = Integer.parseInt(f.getName().replace(".xml", ""));
			Document doc = open("data/maps/local/" + f.getName());
		    NodeList list = doc.getElementsByTagName("int");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	loc.add(new MapLocation(id, ReadD("index"), ReadS("local")));
		        }
	        }
	        close(list);
		}
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
	public MapLocation get(int map, int index)
	{
		for (MapLocation m : loc)
		{
			if (m.map == map && m.index == index)
			{
				return m;
			}
		}
		return null;
	}
}
