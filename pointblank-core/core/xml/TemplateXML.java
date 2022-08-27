package core.xml;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class TemplateXML extends SyncerXML
{
	protected static final TemplateXML INSTANCE = new TemplateXML();
	public Player account = new Player();
	public volatile List<PlayerInventory> items = new ArrayList<PlayerInventory>();
	public TemplateXML()
	{
	}
	public static TemplateXML gI()
	{
		return INSTANCE;
	}
	@Override
	public void LOAD() throws ParserConfigurationException, SAXException, IOException
	{
		Document doc = open("data/template/account.xml");
	    NodeList list = doc.getElementsByTagName("list");
        for (int i = 0; i < list.getLength(); i++)
        {
	    	Node atr = list.item(i);
	        if (atr.getNodeType() == Node.ELEMENT_NODE)
	        {
	        	patch(atr);
	        	synchronized (account)
	        	{
		        	account.rank = ReadD("rank");
		        	account.gold = ReadD("gold");
		        	account.cash = ReadD("cash");
		        	account.vip.pc_cafe = ReadD("pc_cafe");
		        	account.vip.expire = ReadD("pc_cafe_day");
		        	account.access_level = AccessLevel.values()[ReadD("access_level")];
		        	account.brooch = ReadD("brooch");
		        	account.insignia = ReadD("insignia");
		        	account.medal = ReadD("medal");
		        	account.blue_order = ReadD("blue_order");
		        	account.last_up = ReadD("last_up");
		        	account.tourney_level = ReadD("tourney_level");
		        	account.mission1 = ReadD("mission1");
		        	account.mission2 = ReadD("mission2");
		        	account.mission3 = ReadD("mission3");
		        	account.mission4 = ReadD("mission4");
		        	account.missions.active = ReadD("active");
		        	account.country = CountryEnum.valueOf(ReadS("country"));
	        	}
	        }
        }
        synchronized (items)
        {
        	items.clear();
	        list = doc.getElementsByTagName("initial");
	        for (int i = 0; i < list.getLength(); i++)
	        {
		    	Node atr = list.item(i);
		        if (atr.getNodeType() == Node.ELEMENT_NODE)
		        {
		        	patch(atr);        	
		        	PlayerInventory p = new PlayerInventory();
		        	p.item_id = ReadD("id");
		        	p.equip = ReadD("equip");
		        	p.count = ReadD("count");
		        	p.starter = ReadB("starter");
		        	items.add(p);
		        }
	        }
        }
        close(list);
	}
	@Override
	public void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException
	{
	}
}