package core.xml;

import java.io.*;
import java.util.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.models.*;
import core.utils.*;

public class RankXML extends SyncerXML
{
	protected static final RankXML INSTANCE = new RankXML();
	public List<RankInfo> ranks = new ArrayList<RankInfo>();
	public RankXML()
	{
	}
	public static RankXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		for (File f : new File("data/ranks").listFiles())
		{
			int id = Integer.parseInt(f.getName().replace(".xml", ""));
			RankInfo rank = new RankInfo(id);
			Document doc = open("data/ranks/" + f.getName());
		    NodeList list = doc.getElementsByTagName("list");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		        	rank.onNextLevel = ReadD("onNextLevel");
		        	rank.onGPUp = ReadD("onGPUp");
		        	rank.onCPUP = ReadD("onCPUP");
		        	rank.onAllExp = ReadD("onAllExp");
		        	break;
		        }
	        }
	        list = doc.getElementsByTagName("rank");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);
		    		rank.rewards.add(new PlayerInventory(0, ReadD("itemid"), ReadD("count"), ReadD("equip")));
		        }
	        }
	        rank.set();
        	RankInfo rr = get(id);
        	if (rr != null)
        	{
    	        synchronized (rr)
    	        {
    	        	rr = rank;
    	        }
        	}
        	else
        	{
        		ranks.add(rank);
        	}
	        close(list);
		}
	}
	public int proxRankUp(int rank)
	{
		RankInfo r = get(rank);
		if (r != null)
			return r.onNextLevel + r.onAllExp;
		return 0;
	}
	public RankInfo get(int id)
	{
		for (RankInfo r : ranks)
			if (r.id == id)
				return r;
		return null;
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
}