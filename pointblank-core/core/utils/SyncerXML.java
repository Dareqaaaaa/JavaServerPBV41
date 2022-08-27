package core.utils;

import java.io.*;

import javax.xml.parsers.*;

import org.w3c.dom.*;
import org.xml.sax.*;

public abstract class SyncerXML
{
	protected Element read;
	public SyncerXML()
	{
	}
	public abstract void LOAD() throws ParserConfigurationException, SAXException, IOException;
	public abstract void LOAD(boolean object) throws ParserConfigurationException, SAXException, IOException;
	public void patch(Node node)
	{
		read = (Element)node;
	}
	public byte ReadC(String bind)
	{
		return Byte.parseByte(ReadS(bind));
	}
	public int ReadD(String bind)
	{
		return Integer.parseInt(ReadS(bind));
	}
	public long ReadQ(String bind)
	{
		return Long.parseLong(ReadS(bind));
	}
	public double ReadF(String bind)
	{
		return Double.parseDouble(ReadS(bind));
	}
	public boolean ReadB(String bind)
	{
		return Boolean.parseBoolean(ReadS(bind));
	}
	public String ReadS(String bind)
	{
		return read.getAttribute(bind);
	}
	public Document open(String bind) throws ParserConfigurationException, SAXException, IOException
	{
		File f = new File(bind);
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(f);
	    doc.getDocumentElement().normalize();
	    return doc;
	}
	public void close(NodeList nodeList)
	{
		nodeList = null;
		read = null;
	}
}