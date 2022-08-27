/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package data;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;

import java.io.*;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.*;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.parsers.*;

import org.apache.commons.mail.EmailException;
import org.w3c.dom.*;
import org.xml.sax.*;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.EnumVariant;
import com.jacob.com.Variant;

import core.enums.ShopTag;
import core.jdbc.DatabaseFactory;
import core.models.Good;
import core.models.Maps;
import core.models.PlayerInventory;
import core.models.RankInfo;
import core.models.Room;
import core.sql.PlayerSQL;
import core.system.ConnectionLoader;
import core.utils.*;


/**
 * 
 * @author Henrique
 *
 */

@SuppressWarnings("unused")
public class Program
{
	/*static ByteArrayInputStream bais;
	public static byte ReadC() throws IOException
	{
		return ByteBuffer.wrap(ReadB(1)).order(ByteOrder.LITTLE_ENDIAN).get();
	}
	public static short ReadH() throws IOException
	{
		return ByteBuffer.wrap(ReadB(2)).order(ByteOrder.LITTLE_ENDIAN).getShort();
	}
	public static int ReadD() throws IOException
	{
	    return ByteBuffer.wrap(ReadB(4)).order(ByteOrder.LITTLE_ENDIAN).getInt();
	}
	public static float ReadF() throws IOException
	{
		return ByteBuffer.wrap(ReadB(4)).order(ByteOrder.LITTLE_ENDIAN).getFloat();
	}
	public static byte[] ReadB(int length) throws IOException
	{
		byte[] bytes = new byte[length];
	    bais.read(bytes);
	    return bytes;
	}
	public static String ReadS(int lenght) throws IOException
	{
		byte[] val = new byte[lenght];
		ByteBuffer.wrap(ReadB(lenght)).order(ByteOrder.LITTLE_ENDIAN).get(val);
		return new String(val, "UTF-8");
	}
	/*public static String generateLicenseKey() throws Exception
    {
        SystemInfo systemInfo = new SystemInfo();
        OperatingSystem operatingSystem = systemInfo.getOperatingSystem();
        HardwareAbstractionLayer hardwareAbstractionLayer = systemInfo.getHardware();
        CentralProcessor centralProcessor = hardwareAbstractionLayer.getProcessor();

        String vendor = operatingSystem.getManufacturer();
        String processorSerialNumber = centralProcessor.getSystemSerialNumber();
        String processorIdentifier = centralProcessor.getIdentifier();
        int processors = centralProcessor.getLogicalProcessorCount();

        String delimiter = "#";
        

        return vendor +
                delimiter +
                processorSerialNumber +
                delimiter +
                processorIdentifier +
                delimiter +
                processors;
    }
	  /**
     * Gives a HWID I.E (350-30a-3ae-30e-304-3d6-37d-359-371-3e0-3d8-3e1-369-3b2-34a-314) - Hexeption
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     *
    
    public static byte[] getMACAddress() throws SocketException, UnknownHostException
    {
        InetAddress address = InetAddress.getLocalHost();
        NetworkInterface networkInterface = NetworkInterface.getByInetAddress(address);

        return networkInterface.getHardwareAddress();
    }
    // If you want a String representation, do this
    public static void crash()
    {
    	throw new StackOverflowError();
    	//crash();
    }

    private static final String encryptionKey           = "ABCDEFGHIJKLMNOP";
    private static final String characterEncoding       = "UTF-8";
    private static final String cipherTransformation    = "AES/CBC/PKCS5PADDING";
    private static final String aesEncryptionAlgorithem = "AES";*/
    
    
    /**
     * Method for Encrypt Plain String Data
     * @param plainText
     * @return encryptedText
     */
    /*public static String encrypt(String plainText) {
        String encryptedText = "";
        try {
            Cipher cipher   = Cipher.getInstance(cipherTransformation);
            byte[] key      = encryptionKey.getBytes(characterEncoding);
            SecretKeySpec secretKey = new SecretKeySpec(key, aesEncryptionAlgorithem);
            IvParameterSpec ivparameterspec = new IvParameterSpec(key);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivparameterspec);
            byte[] cipherText = cipher.doFinal(plainText.getBytes("UTF8"));
            Base64.Encoder encoder = Base64.getEncoder();
            encryptedText = encoder.encodeToString(cipherText);

        } catch (Exception E) {
             System.err.println("Encrypt Exception : "+E.getMessage());
        }
        return encryptedText;
    }*/

    /**
     * Method For Get encryptedText and Decrypted provided String
     * @param encryptedText
     * @return decryptedText
     */
    /*public static String decrypt(String encryptedText) {
        String decryptedText = "";
        try {
            Cipher cipher = Cipher.getInstance(cipherTransformation);
            byte[] key = encryptionKey.getBytes(characterEncoding);
            SecretKeySpec secretKey = new SecretKeySpec(key, aesEncryptionAlgorithem);
            IvParameterSpec ivparameterspec = new IvParameterSpec(key);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivparameterspec);
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] cipherText = decoder.decode(encryptedText.getBytes("UTF8"));
            decryptedText = new String(cipher.doFinal(cipherText), "UTF-8");

        } catch (Exception E) {
            System.err.println("decrypt Exception : "+E.getMessage());
        }
        return decryptedText;
    }*/
    
   
	public static String getHWID() throws NoSuchAlgorithmException, UnsupportedEncodingException
    {
        String s = "";
        final String main = System.getenv("PROCESSOR_IDENTIFIER") + System.getenv("COMPUTERNAME") + System.getProperty("user.name").trim();
        final byte[] bytes = main.getBytes("UTF-8");
        final MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        final byte[] md5 = messageDigest.digest(bytes);
        for (int i = 0; i < md5.length; i++)
        {
            s += Integer.toHexString((md5[i] & 0xFF) | 0x300).substring(0, 3);
            if (i != md5.length - 1)
            {
                s += "-";
            }
        }
        return s;
    }
	public static List<Good> LOAD_SETS()
	{
		List<Good> _sets = new ArrayList<Good>();
		try
    	{
	        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(System.getProperty("user.dir") + "\\xml\\sets_setup.xml"));
	        doc.getDocumentElement().normalize();
	        NodeList elementos = doc.getElementsByTagName("set");
	        for (int i = 0; i < elementos.getLength(); i++)
	        {
	           Node nNode = elementos.item(i);
	           if (nNode.getNodeType() == Node.ELEMENT_NODE)
	           {
	        	   Element eElement = (Element) nNode;
	        	   if (Boolean.parseBoolean(eElement.getAttribute("enable")))
	        		   _sets.addAll(TEMPLATESET(eElement.getAttribute("id")));
	           }
	        }
    	}
    	catch (Exception e)
		{ e.printStackTrace(); }
		return _sets;
	}
	public static List<Good> TEMPLATESET(String path)
	{
		List<Good> list = new ArrayList<Good>();
		try
    	{
			File arquivo = new File(System.getProperty("user.dir") + "\\xml\\sets\\" + path + ".xml");
			if (arquivo.exists())
			{
		        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(arquivo);
		        doc.getDocumentElement().normalize();
		        NodeList elementos = doc.getElementsByTagName("set");
		        for (int i = 0; i < elementos.getLength(); i++)
		        {
		           Node nNode = elementos.item(i);
		           if (nNode.getNodeType() == Node.ELEMENT_NODE)
		           {
		        	   Element eElement = (Element) nNode;
	        		   Good set = new Good();
	        		   set.id = Integer.parseInt(eElement.getAttribute("id"));
	        		   if (eElement.getAttribute("item_id").equals("GOLD"))
	        			   set.bonusGold = 1;
	        		   else
	        			   set.item_id = Integer.parseInt(eElement.getAttribute("item_id"));
	        		   set.gold = Integer.parseInt(eElement.getAttribute("gold"));
	        		   set.cash = Integer.parseInt(eElement.getAttribute("cash"));
	        		   set.count = Integer.parseInt(eElement.getAttribute("count"));
	        		   set.tag = ShopTag.values()[Integer.parseInt(eElement.getAttribute("tag"))];
	        		   set.show = Boolean.parseBoolean(eElement.getAttribute("principal"));
	        		   set.set = true;
	        		   list.add(set);
		           }
		        }
			}
			else
			{
				 System.out.println(" [!] SET NOT FOUNDED: " + arquivo.getName());
			}
    	}
    	catch (Exception e)
		{ e.printStackTrace(); }
		return list;
	}
	public static void main(String[] args) throws NoSuchAlgorithmException, IOException, ParseException, InterruptedException
	{
        /*ComThread.InitMTA();
        try {
            ActiveXComponent wmi = new ActiveXComponent("winmgmts:\\\\.");
            Variant instances = wmi.invoke("InstancesOf", "Win32_BaseBoard");
            Enumeration<Variant> en = new EnumVariant(instances.getDispatch());
            while (en.hasMoreElements())
            {
                ActiveXComponent bb = new ActiveXComponent(en.nextElement().getDispatch());
                System.out.println(bb.getPropertyAsString("SerialNumber"));
                break;
            }
        } finally {
            ComThread.Release();
        }*/
		//byte[] macAddress = getMACAddress();
	    //for (int byteIndex = 0; byteIndex < macAddress.length; byteIndex++)
	    //    System.out.format("%02X%s", macAddress[byteIndex], (byteIndex < macAddress.length - 1) ? "-" : "");
	    //UUID.fromString("");
        //int olddate = DateTimeUtil.gI().getDateTime();
        //int newdate = DateTimeUtil.gI().getDateIncDate(String.valueOf(olddate), Integer.parseInt(System.console().readLine()));
        //System.out.println(" old date: " + olddate);
        //System.out.println(" new date: " + newdate);
        //System.out.println(" days: " + (olddate - newdate));
		System.out.println();
		System.out.println("[============================================================================]");
		System.out.println("[  DATA SERVER                                       '  [][][][] [][][]   '  ]");
		System.out.println("[  JAVA JDK: 1.8.0_60                                '  []    [] []   []  '  ]");
		System.out.println("[  _________________________________                 '  [][][][] [][][]]  '  ]");
		System.out.println("[                                                    '  []       []   []  '  ]");
		System.out.println("[  COPYRIGHT: HENRIQUE RODRIGUES </>                 '  []       [][][]   '  ]");
		System.out.println("[============================================================================]");
		System.out.println(" Aguardando comandos... ");

		
		//SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
		//Date dataDe = sdf.parse("1801131658");
		//Date dataAte = sdf.parse("1901131658");
		 
		//long diferencaMinutos = (dataAte.getTime() - dataDe.getTime()) / (1000*60);
		//System.out.println("minutos jogados: " + diferencaMinutos);
		
		//int numero = Integer.parseInt(System.console().readLine());
		//BigDecimal num = new BigDecimal(numero / 592).setScale(0, BigDecimal.ROUND_UP);
		//System.out.println(" [BigDecimal] resultado: " + (num.intValue() + 1));
		//System.out.println(" [Math.ceil]  resultado: " + ((int)Math.ceil((double)numero / 592)));
		
		/*RankSUB s = RankSUB.gI();
		
		for (RankInfo r : s.ranks)
		{
			FileWriter fw = new FileWriter(r.rank + ".xml", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write("<?xml version='1.0' encoding='UTF-8'?>");
			bw.newLine();
			bw.write("<list onNextLevel='" + r.onNextLevel + "' onGPUp='" + r.onGPUp + "' onCPUP='0' onAllExp='" + r.onAllExp + "'>");
			bw.newLine();
			bw.write("</list>");
			bw.flush();
			bw.close();
		}*/
	
		while (true)
		{
			try
			{
				String comando = System.console().readLine();
				if (comando.startsWith("patch_set"))
				{
					int sucesso = 0;
			    	List<Good> _sets = LOAD_SETS();
			    	BinaryWriter bw = new BinaryWriter("sets.pistola");
			    	bw.WriteD(_sets.size());
			    	for (Good c : _sets)
			    	{
			    		bw.WriteD(c.id);
			    		bw.WriteD(c.bonusGold > 0 ? 1 : 0);
			    		bw.WriteD(c.bonusGold > 0 ? c.bonusGold : c.item_id);
			    		bw.WriteD(c.gold);
			    		bw.WriteD(c.cash);
			    		bw.WriteD(c.count);
			    		bw.WriteD(c.tag.ordinal());
			    		bw.WriteD(c.show ? 1 : 0);
			    		sucesso++;
			    	}
			    	System.out.println(" Path Sets: " + sucesso + " sucesso.");
			    	bw.flush();
			    	bw.close();
				}
				else if (comando.startsWith("enc "))
				{
					String texto = comando.substring(4);
					System.out.println(" Texto Encryptado: " + EncryptSyncer.enc(texto));
				}
				else if (comando.startsWith("dec "))
				{
					String texto = comando.substring(4);
					System.out.println(" Texto Decryptado: " + EncryptSyncer.dec(texto));
				}
				else if (comando.startsWith("hwid"))
				{
					System.out.println(" Meu HWID: " + getHWID());
				}
				else if (comando.startsWith("ip_bytes "))
				{
					byte[] bb = NetworkUtil.parseIpToBytes(comando.substring(9));
					System.out.println(" IP Bytes: " + Arrays.toString(bb));
				}
				else
				{
					System.out.println(" Comando nao foi encontrado: (" + comando + ")");
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		/*long packages = 0;
		for (File f : new File("libs").listFiles())
		{
			if (!f.getName().contains("pb-"))
			{
				long modific = f.lastModified();
				long memory = f.getUsableSpace();
				int hash = f.hashCode();
				packages += modific + memory + hash;
			}
			//System.out.println(" File: " + f.getName() + " Hash: " + hash + " Memory: " + memory + " Modific: " + modific);
			//System.out.flush();
		}
		System.out.println(packages);*/

		//bb = new byte[] { 25, 73, -117, 63 };

		//InetAddress addr = InetAddress.getByAddress(bb);
		//System.out.println(addr.getHostAddress());
		//String key = EmailFactory.generateCode();
		//System.out.println(key);
		//EmailFactory.sendEmail();
		
		
		//AuthenticationAddress.gI().sendEMAIL();
        /*String hwid = getHWID();
		FileWriter fw = new FileWriter("hwid.txt", true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(hwid);
		bw.newLine();
		bw.close();
		fw.close();*/
		
		//ru.pb.global.utils.EssencialUtil.gI().MD5file("c:\\UserFileList.dat");
		//String hex = "00 01 00 f7 00 06 00 00 ff f0 ff ff ff ff ff f8";
		//byte[] data = NetworkUtil.hexStringToByteArray(hex);
		//System.out.println(NetworkUtil.printData("bytes originais: ", Unpooled.copiedBuffer(data, 0, data.length)));
		//BitShift.unshift(data, data.length % 6 + 1);
		//System.out.println(NetworkUtil.printData("bytes decrypted: ", Unpooled.copiedBuffer(data, 0, data.length)));
		//BitShift.shift(data, data.length % 6 + 1);
		//System.out.println(NetworkUtil.printData("bytes ecrypted: ", Unpooled.copiedBuffer(data, 0, data.length)));
		//FileInputStream fs = new FileInputStream("resource/527.txt");
		//BinaryReader fr = new BinaryReader(fs);
		//byte[] byteArray = NetworkUtil.hexStringToByteArray(fr.ReadS(fr.available()));
		//fs.close();
		//fr.close();
		//bais = new ByteArrayInputStream(byteArray);
		//int size1 = ReadD();
		//int size2 = ReadD();
		//int size3 = ReadD();
		//FileWriter fw = new FileWriter("PACKET_527_.txt", true);
		//BufferedWriter bw = new BufferedWriter(fw);
		//bw.write("size1: " + size1);
		//bw.newLine();
		//bw.write("size2: " + size2);
		//bw.newLine();
		//bw.write("size3: " + size3);
		//bw.newLine();
		//bw.write("===========================================================================");
		//bw.newLine();
		//for (int i = 0; i < size2; i++)
		//{
		//	//int itemId = ReadD();
		//	//byte type1 = ReadC();
		//	//byte type2 = ReadC();
		//	//byte type3 = ReadC();
		//	//byte titulo = ReadC();
		//	
		//	//int good = ReadD();
		//	//byte unk1 = ReadC();
		//	//byte unk2 = ReadC();
		//	//int gold = ReadD();
		//	//int cash = ReadD();
		//	//byte tag = ReadC();
		//	int good = ReadD();
		//	int itemId = ReadD();
		//	int count = ReadD();
		//	System.out.println();
		//	if (bais.available() > 4)
		//	{
		//		bw.write(i + " good: " + good + " itemId: " + itemId + " count: " + count);
		//		bw.newLine();
		//	}
		//}
		//bw.write("===========================================================================");
		//bw.newLine();
		//if (bais.available() == 4)
		//	bw.write("unknown: " + ReadD());
		//bw.close();
		//fw.close();
		//System.out.println("" + bais.available());
		//bais.close();
		//System.out.println("OK!");
		//while (true)
		//{
			//String read = System.console().readLine();
			//if (read.startsWith("set ip "))
			//{
			//	try
			//	{
			//		String ip = read.substring(7);
			//		if (ip != null)
			//		{
			//			if (ip.length() > 32)
			//				System.out.println(" O ip deve conter ate 32 digitos.");
			//			else
			//			{
			//				byte[] array = NetworkUtil.parseIpToBytes(ip);
			//				if (array != null && array.length > 0)
			//				{
			//			    	//BinaryWriter bw = new BinaryWriter("resource/network.src");
			//			    	//bw.WriteD(array.length);
			//			    	//bw.WriteB(array);
			//			    	//bw.flush();
			//			    	//bw.close();
			//			    	//System.out.println(" " + ip + " writed sucessfully.");
			//				}
			//				else
			//				{
			//					System.out.println(" Sequencia de dados desse ip nao foi fornecido.");
			//				}
			//			}
			//		}
			//		else
			//		{
			//			System.out.println(" O ip digitado e nulo.");
			//		}
			//	}
			//	catch (Exception e)
			//	{
			//		System.out.println(" Error. " + e.getLocalizedMessage());
			//	}
			//}
		//}
		//FileInputStream fs = new FileInputStream("Goods.Pef");
		//BinaryReader br = new BinaryReader(fs);
		//ByteBuf buf = Unpooled.buffer().order(ByteOrder.LITTLE_ENDIAN);
		//buf.writeBytes(br.ReadB(br.available()));
		//System.out.println(NetworkUtil.printData("", buf));
		//br.close();
		//fs.close();
		//int server = 1;
		//int channel = 2;
		//int room = 1;
		//int state = (((server) & 0x000000FF) << 20) | (((channel) & 0x000000FF) << 12) | ((room) & 0x00000FFF);
		//System.out.println(" friend state: " + state);
		//if (!new File("resource/network.src").exists())
		//{
		//}
		//int value = 0;
		//for (int i = 0; i < 16; i++)
		//{
		//	value += 1 << i;
		//	System.out.println(" slot " + i + " value: " + (1 << i));
		//}
		//int value1 = 0,
		//	value2 = 0,
		//	value3 = 0,
		//	value4 = 0;
		//value1 |= (0x0f << 4 * 0);
		//value2 |= (0x0f << 4 * 1);
		//value3 |= (0x0f << 4 * 2);
		//value4 |= (0x0f << 4 * 3);
		//System.out.println(" value1 is: " + value1);
		//System.out.println(" value2 is: " + value2);
		//System.out.println(" value3 is: " + value3);
		//System.out.println(" value4 is: " + value4);
		//TutorialCard.mqf
		//try
		//{
		//	ReadQuest(new FileInputStream("xml/TutorialCard.mqf"));
		//	WriteSets();
		//}
		//catch (IOException e)
		//{ e.printStackTrace(); }
		//ReadShop();
	}
	/*public static List<CLANRANK> loadClanRank() throws SAXException, IOException, ParserConfigurationException
	{
		List<CLANRANK> list = new ArrayList<CLANRANK>();
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(System.getProperty("user.dir") + "\\xml\\RankClanInfoTemplate.xml"));
        doc.getDocumentElement().normalize();
        NodeList elementos = doc.getElementsByTagName("rank");
        for (int i = 0; i < elementos.getLength(); i++)
        {
           Node nNode = elementos.item(i);
           if (nNode.getNodeType() == Node.ELEMENT_NODE)
           {
        	   Element eElement = (Element) nNode;	     
    		   list.add(new CLANRANK(
        			   Integer.parseInt(eElement.getAttribute("id")),
        			   Integer.parseInt(eElement.getAttribute("onNextLevel")),
        			   Integer.parseInt(eElement.getAttribute("onAllExp"))));
           }
        }
        return list;
	}
	static class CLANRANK
	{
		public int id;
		public int onNextLevel;
		public int onAllExp;
		public CLANRANK(int id, int onNextLevel, int onAllExp)
		{
			this.id = id;
			this.onNextLevel = onNextLevel;
			this.onAllExp = onAllExp;
		}
	}
	public static void WriteClanRank() throws FileNotFoundException, IOException, SAXException, ParserConfigurationException
    {
    	//BinaryWriter bw = new BinaryWriter("resource/clan.dat");
    	//List<CLANRANK> ranks = loadClanRank();
    	//bw.WriteD(ranks.size());
    	//for (CLANRANK c : ranks)
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.onNextLevel);
    	//	bw.WriteD(c.onAllExp);
    	//}
    	//System.out.println(bw.getChannel().toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
	public static void WriteCamp() throws IOException
	{
		Map<Integer, String> equips = new HashMap<Integer, String>();
		equips.put(100003051, "FAMAS G2 M203");
		equips.put(100003068, "AK-47 FC Red");
		equips.put(100003096, "SCAR-L FC");
		equips.put(100003218, "SCAR-L F.C PBNC2015US");
		equips.put(100003103, "M4 SR-16 FC");
		equips.put(601014018, "Scorpion Vz.61 G.");
		equips.put(601014017, "Scorpion Vz.61");
		equips.put(601014020, "Scorpion Vz.61 Woody");
		equips.put(601014021, "Scorpion Vz.61 Gorgeous");
		equips.put(702001162, "Halloween Hammer");
		equips.put(100003086, "AK-47 Goddess");
		equips.put(100003119, "AK-47 Elite");
		equips.put(100003247, "AK 12 Gold");
		equips.put(100003246, "AK 12");
		equips.put(100003254, "Water Gun 2016");
		equips.put(100003313, "Cane Gun");
		equips.put(200018004, "Dual Uzi");
		equips.put(200018005, "Dual Mini Uzi");
		equips.put(200018007, "Dual Uzi Silencer");
		equips.put(200018008, "Dual Mini Uzi Silencer");
		equips.put(200018009, "Dual Micro Uzi Silencer");
		equips.put(200018011, "Dual Micro Uzi Silencer Silver");
		equips.put(300005075, "PSG1 Elite");
		equips.put(300005076, "Dragunov Elite");
		equips.put(100003178, "AUG A3 CoupleBreaker");
		equips.put(200004170, "Kriss S.V CoupleBreaker");
		equips.put(300005099, "CheyTac M200 CoupleBreaker");
		equips.put(702001167, "Fang Blade Ice");
		equips.put(300005194, "Cheytac M200 Ice");
		equips.put(702015018, "Dual Sword Samurai");
		equips.put(100003336, "AUG A3 Samurai");
		equips.put(200004385, "Kriss S.V Samurai");
		equips.put(300005210, "Tactilite Samurai");
		equips.put(601002115, "Glock 18 Samurai");
		equips.put(100003349, "AUG A3 Midnight3");
		equips.put(300005217, "AS-50 Midnight3");
		equips.put(200004403, "Kriss S.V Midnight3");
		equips.put(200004405, "OA-93 Midnight3");
		equips.put(702001180, "Arabian Sword Beach");
		equips.put(500010015, "L86 LSW Beach");
		equips.put(400006099, "M1887 Beach");
		equips.put(300005213, "PGM Hecate2 Beach");
		equips.put(200004391, "Kriss S.V Beach");
		equips.put(100003343, "AUG A3 Beach");
		equips.put(400006087, "Cane Shotgun");
		equips.put(400006088, "Zombie Slayer Ice");
		equips.put(500010009, "L86 LSW XMAS");
		equips.put(500010011, "Ultimax-100");
		equips.put(500010012, "Ultimax-100 Gold");
		equips.put(500010013, "Ultimax-100 Madness");
		equips.put(500010014, "Ultimax-100 Mummy");
		equips.put(601002029, "GL-06");
		equips.put(601002106, "C. Python Ice");
		equips.put(904007051, "Medical Kit PBNC 2015");
		equips.put(904007043, "Medical Kit Kurma");
		equips.put(904007032, "Medical Kit Lotus2014");
		equips.put(904007025, "Medical Kit Opor Ayam");
		equips.put(904007021, "Medical Kit Lotus");
		equips.put(904007015, "Chocolate Medical Kit");
		equips.put(904007014, "Halloween Medical Kit");
		equips.put(803007033, "Soccer Grenade");
		equips.put(803007040, "M18A1 Claymore");
		equips.put(803007053, "Water Bomb");
		equips.put(803007066, "FootBall Bomb2016");
		equips.put(100003316, "Pindad SS2 V5 Ice");
		equips.put(100003315, "AUG A3 Ice");
		equips.put(300005189, "Cheytac M200 Halloween 2016");
		equips.put(200004328, "OA-93 Halloween 2016");
		equips.put(100003300, "AUG A3 Halloween 2016");
		equips.put(400006072, "M1887 Dolphin");
		equips.put(300005169, "L115A1 Dolphin");
		equips.put(300005168, "Cheytac M200 Dolphin");
		equips.put(200004291, "P90 Ext. Dolphin");
		equips.put(200004289, "Kriss S.V Dolphin");
		equips.put(702001146, "Death Scythe Demonic");
		equips.put(300005167, "Cheytac M200 Demonic");
		equips.put(200004288, "P90 Ext. Demonic");
		equips.put(200004286, "Kriss S.V Demonic");
		equips.put(100003276, "SC 2010 Dolphin");
		equips.put(100003275, "AUG A3 Dolphin");
		equips.put(100003274, "AUG A3 Demonic");
		equips.put(300005139, "Tactilite T2 X-MAS 2015");
		equips.put(300005138, "CheyTac M200 X-MAS 2015");
		equips.put(200004251, "OA-93 X-MAS 2015");
		equips.put(200004249, "Kriss S.V X-MAS 2015");
		equips.put(100003242, "SC-2010 X-MAS 2015");
		equips.put(100003241, "AUG A3 X-MAS 2015");
		equips.put(100003209, "Vz.52 Black Pearl");
		equips.put(100003239, "M14 EBR Gold");
		equips.put(100003146, "G36 Elite");
		equips.put(100003143, "FG-42");
		equips.put(100003223, "M14 EBR");
		equips.put(100003125, "AK-47 F.C");
		equips.put(300005032, "Barret M82A1");
		equips.put(300005082, "Barret M82A1 P.");
		equips.put(300005232, "Barret M82A1 Premium");
		equips.put(400006042, "Zombie Slayer");
		equips.put(400006019, "JackHammer");
		equips.put(400006039, "UTS-15");
		equips.put(400006046, "UTS-15 D.");
		equips.put(400006048, "UTS-15 G.");
		equips.put(400006047, "Cerberus");
		equips.put(400006084, "Cerberus Gorgeous");
		equips.put(601002054, "GL-06 ANC 2015");
		equips.put(200004362, "OA-93 Mech Hero");
		equips.put(1001001011, "Reinforced D-Fox");
		equips.put(1001002012, "Reinforced Leopard");
		equips.put(1001001013, "Reinforced Viper Red");
		equips.put(1001002014, "Reinforced Hide");
		equips.put(1001001015, "Reinforced Combo D-Fox (+20% EXP)");
		equips.put(1001002016, "Reinforced Combo Leopard (+20% EXP");
		equips.put(1001001017, "Reinforced Combo Viper Red (+30% Point)");
		equips.put(1001002018, "Reinforced Combo Hide (+30% Point)");
		equips.put(1001002019, "Reinforced Acid Poll");
		equips.put(1001002020, "Reinforced Keen Eyes");
		equips.put(1001001021, "Reinforced Red Bulls");
		equips.put(1001001022, "Reinforced Tarantula");
		equips.put(1001002035, "Reinforced Chou");
		equips.put(1001001036, "Reinforced Rica");
		equips.put(1001002051, "Hide Kopassus");
		equips.put(1001002052, "Leopard Bope");
		equips.put(1001002053, "Hide Cup");
		equips.put(1001001054, "World Tarantula");
		equips.put(1001001055, "Viper Shadow");
		equips.put(1001002056, "Hide Recon");
		equips.put(1001002067, "Hide Strik");
		equips.put(1001001068, "Viper Kopassus");
		equips.put(1001001137, "Hitman D-Fox");
		equips.put(1001002225, "Hitman Leopard");
		equips.put(1001001283, "Tarantula Pirate");
		equips.put(1001001302, "P1000 Tarantula");
		equips.put(1001002305, "P1000 Keen Eyes");
		equips.put(1001001087, "Gengster Viper Red");
		equips.put(1001002175, "Undercover Hide");
		equips.put(1001002287, "Hide Admiral");
		equips.put(1001002294, "Hide Gign");
		equips.put(1001001286, "Viper Captain");
		equips.put(1001001295, "Viper Matilda");
		equips.put(1001002067, "Hide Elite");
		equips.put(1001002144, "Chou FBI");
		equips.put(1001001069, "Bela Rica");
		equips.put(1001002282, "Swat sniper");
		BinaryWriter bw = new BinaryWriter("maps-camp.dat");
		Set<Integer> keys = equips.keySet();
    	bw.WriteD(keys.size());
    	for (int id : keys)
    		bw.WriteD(id);
    	System.out.println(bw.getChannel().toString() + " flushed.");
    	bw.flush();
    	bw.close();
	}
    public static void ReadShop() throws IOException
    {
    	FileWriter fw = new FileWriter("storageDated.txt", false);
    	BinaryReader br = new BinaryReader(new FileInputStream("resource/shopStorage2.dat"));
    	int size1 = br.ReadD();
    	int size2 = br.ReadD();
    	int size3 = br.ReadD();
    	fw.write("=======================================================\n");
    	for (int i = 0; i < size1; i++)
    	{
    		int goodId = br.ReadD();
    		if (goodId == 0)
    		{
    			br.ReadB(8);
    			continue;
    		}
    		int itemId = br.ReadD();
    		int count = br.ReadD();
    		String more = "", more2 = "";
    		String ided = String.valueOf(goodId);
    		int espaco = 10 - ided.length();
    		for (int j = 0; j < espaco; j++)
    			more += " ";
    		String idet = String.valueOf(itemId);
    		espaco = 10 - idet.length();
    		for (int j = 0; j < espaco; j++)
    			more2 += " ";
    		fw.write("goodId: " + goodId + more + " itemId: " + itemId + more2 + " count: " + count + "\n");
    		System.out.println("goodId: " + goodId + " itemId: " + itemId + " count: " + count + "\n");
    	}
    	int restant = br.available();
    	fw.write("=======================================================\n");
    	fw.write("size1: " + size1 + " size2: " + size2 + " size3: " + size3 + " restante: " + restant);
    	System.out.println("size1: " + size1 + " size2: " + size2 + " size3: " + size3 + " restante: " + restant);
    	br.close();
    	fw.close();
    	//String array1 = "370600005002000000000000D9989800010100000000FA0000000085A698000101000000005E0100000021A698000101000000002C01000000E9A69800010100000000FA00000000B1A79800010100000000640000000015A8980001010000000096000000004DA798000101000000006400000000D1AA980001010000000096000000006DAA9800010100000000FA0000000041A998000101000000002C01000000A5A99800010100000000FA00000000BDA59800010100000000FA00000000DDA898000101000000002C01000000C88793030101204E000000000000008BA698000101000000001A04000000A2A69800010100000000AC0D000000EFA69800010100000000EE0200000006A79800010100000000C409000000C3A598000101000000005802000000DAA59800010100000000D007000000DF989800010100000000EE02000000F6989800010100000000C40900000027A6980001010000000084030000003EA69800010100000000B80B00000053A798000101000000002C010000006AA79800010100000000E803000000B7A798000101000000002C01000000CEA79800010100000000E8030000001BA89800010100000000C20100000032A89800010100000000DC05000000D7AA9800010100000000C201000000EEAA9800010100000000DC05000000ABA99800010100000000EE02000000C2A99800010100000000C40900000047A9980001010000000084030000005EA99800010100000000B80B00000073AA9800010100000000EE020000008AAA9800010100000000C409000000E3A898000101000000005802000000FAA89800010100000000D00700000009AA980001010000000096000000000FAA9800010100000000C20100000026AA9800010100000000DC05000000C5AC98000101000000005E01000000CBAC98000101000000001A04000000E2AC9800010100000000AC0D00000065BC98000101000000002C010000006BBC9800010100000000840300000082BC9800010100000000B80B00000031B498000101000000002C0100000037B4980001010000000084030000004EB49800010100000000B80B0000003DB29800010100000000900100000043B29800010100000000B0040000005AB29800010100000000A00F00000029AD980001010000000096000000002FAD9800010100000000C20100000046AD9800010100000000DC050000008DAD9800010100000000C80000000093AD98000101000000005802000000AAAD9800010100000000D00700000011B19800010100000000FA0000000017B19800010100000000EE020000002EB19800010100000000C409000000F1AD98000101000000002C01000000F7AD980001010000000084030000000EAE9800010100000000B80B00000081AF98000101000000005E0100000087AF98000101000000001A040000009EAF9800010100000000AC0D00000095B4980001010000000090010000009BB49800010100000000B004000000B2B49800010100000000A00F00000075B19800010100000000C8000000007BB19800010100000000580200000092B19800010100000000D007000000D9B19800010100000000FA00000000DFB19800010100000000EE02000000F6B19800010100000000C409000000B13131010101000000009600000000B7313101010100000000C201000000CE313101010100000000DC050000001532310101010000000096000000001B323101010100000000C20100000032323101010100000000DC0500000085303101010100000000C8000000008B3031010101000000005802000000A2303101010100000000D00700000079323101010100000000FA000000007F323101010100000000EE0200000096323101010100000000C40900000011C5C901010100000000640000000017C5C9010101000000002C010000002EC5C901010100000000E80300000075C5C901010100000000FA000000007BC5C901010100000000EE0200000092C5C901010100000000C409000000C95A62020101000000006400000000CF5A62020101000000002C01000000E65A6202010100000000E803000000ADF1FA020101000000006400000000B3F1FA020101000000002C01000000CAF1FA02010100000000E8030000007598980001010000000090010000007B989800010100000000B00400000092989800010100000000A00F0000000DBA98000101000000005E0100000013BA98000101000000001A040000002ABA9800010100000000AC0D00000005B398000101000000002C010000000BB39800010100000000840300000022B39800010100000000B80B00000099AB98000101000000002C010000009FAB98000101000000008403000000B6AB9800010100000000B80B000000491E2C0401010000000096000000004F1E2C04010100000000EE02000000661E2C04010100000000D00700000069212C04010100000000C8000000006F212C04010100000000520300000086212C04010100000000B80B000000CD212C04010100000000C800000000D3212C040101000000005203000000EA212C04010100000000B80B00000031222C04010100000000C80000000037222C0401010000000052030000004E222C04010100000000B80B000000C9E1F5050101000000002C01000000CFE1F505010100000000DC05000000E6E1F505010100000000941100000091E2F5050101000000002C0100000097E2F505010100000000DC05000000AEE2F5050101000000009411000000BDE3F505010100000000C800000000C3E3F5050101000000005203000000DAE3F505010100000000B80B00000021E4F505010100000000C80000000027E4F50501010000000052030000003EE4F505010100000000B80B00000060F3F505010100000000881300000028F4F505010100000000B80B000000C4F3F505010100000000B80B00000090B5C40401017C1500000000000000F4B5C404010188130000000000000058B6C4040101881300000000000000BCB6C404010188130000000000000020B7C404010118150000000000000084B7C4040101A81600000000000000E8B7C40401016C20000000000000004CB8C4040101F82A00000000000000B0B8C4040101B0360000000000000078B9C40401017C1500000000000000DCB9C404010188130000000000000095222C04010100000000FA0000000096222C04010100000000E80300000097222C04010100000000AC0D0000005D232C04010100000000FA000000005E232C04010100000000E8030000005F232C04010100000000AC0D00000089242C040101000000002C010000008A242C04010100000000DC050000008B242C040101000000009411000000C1232C04010100000000FA00000000C2232C04010100000000E803000000C3232C04010100000000AC0D000000F9222C04010100000000FA00000000FA222C04010100000000E803000000FB222C04010100000000AC0D000000E98A93030101000000002C01000000EA8A93030101000000004006000000EB8A93030101000000007017000000858A93030101000000002C01000000868A93030101000000004006000000878A930301010000000070170000003D202C040101000000002C010000003E202C04010100000000DC050000003F202C040101000000009411000000D91F2C04010100000000C800000000DA1F2C040101000000005203000000DB1F2C04010100000000B80B000000E1F6F5050101000000008813000000B5F5F505010100000000881300000051F5F505010100000000B80B00000081EDF505010100000000FA0000000082EDF505010100000000E80300000083EDF505010100000000100E0000001DEDF505010100000000FA000000001EEDF505010100000000E8030000001FEDF505010100000000100E000000B9ECF5050101000000002C01000000BAECF505010100000000B004000000BBECF505010100000000A00F0000007DF6F505010100000000B80B000000ADEEF505010100000000FA00000000AEEEF505010100000000B004000000AFEEF505010100000000A00F00000040BAC40401011C2500000000000000A4BAC404010128230000000000000001FAF505010100000000FA0000000002FAF505010100000000E80300000003FAF505010100000000AC0D000000A1F0F505010100000000FA00000000A2F0F5050101000000000203000000A3F0F5050101000000008C0A0000003DC6C901010100000000C8000000003EC6C90101010000000058020000003FC6C901010100000000D00700000011EFF5050101000000000E0100000012EFF505010100000000140500000013EFF505010100000000A00F000000A5E7F5050101000000005E01000000A6E7F505010100000000DC05000000A7E7F505010100000000C0120000004D8B930301010000000090010000004E8B9303010100000000D0070000004F8B9303010100000000581B000000B18B93030101000000009001000000B28B9303010100000000D007000000B38B9303010100000000581B00000001A39800010170170000000000000002A398000101606D0000000000000065A3980001014C1D0000000000000066A398000101B88800000000000000059A98000101E45700000000000000069A98000101289A01000000000000499798000101983A000000000000004A979800010170110100000000000049C4C90101012823000000000000004AC4C901010110A400000000000000BBAE98000101624300000000000000BCAE98000101743A01000000000000675A62020101941100000000000000685A6202010108520000000000000023303101010104290000000000000024303101010168BF00000000000000652D31010101941100000000000000682D31010101085200000000000000E19F98000101F22B00000000000000E29F9800010114CD00000000000000ABA098000101BC3400000000000000ACA09800010118F6000000000000005B2F310101014C1D000000000000005C2F31010101B88800000000000000F72E31010101701700000000000000F82E31010101606D000000000000002F5B62020101A60E00000000000000305B620201015C4400000000000000E7C3C9010101941100000000000000E8C3C9010101085200000000000000119898000101F22B0000000000000014989800010114CD00000000000000E5F0FA020101CA0800000000000000E8F0FA020101042900000000000000A39998000101744000000000000000A49998000101C82C01000000000000699A98000101B80B000000000000006C9A98000101B03600000000000000CD9A980001013A2000000000000000D09A98000101649600000000000000B79E98000101E45700000000000000B89E98000101289A01000000000000F5A498000101F22B00000000000000F8A49800010114CD00000000000000C92D31010101CA0800000000000000CC2D31010101042900000000000000319B98000101941100000000000000349B98000101085200000000000000C39C98000101701700000000000000C49C98000101606D000000000000005D9C980001014C1D00000000000000609C98000101B88800000000000000ED9D98000101282300000000000000EE9D9800010110A400000000000000932E31010101701700000000000000942E31010101606D000000000000007D9F98000101983A00000000000000809F9800010170110100000000000093BD98000101AC260000000000000094BD9800010180BB000000000000000FA1980001013E490000000000000010A198000101CC55010000000000003F99980001013E4900000000000000409998000101CC5501000000000000CBA398000101BC3400000000000000CCA39800010118F600000000000000959B98000101701700000000000000989B98000101606D000000000000008B9D980001014C1D000000000000008C9D98000101B8880000000000000071A19800010128230000000000000074A19800010110A400000000000000E59698000101CE3100000000000000E896980001016CE800000000000000658793030101204E00000000000000259D98000101941100000000000000289D980001010852000000000000004BF1FA0201019411000000000000004CF1FA02010108520000000000000099C49800010100000000FA000000009AC49800010100000000EE020000009BC49800010100000000C40900000009C398000101000000000E010000000AC398000101000000002A030000000BC398000101000000008C0A000000C5C598000101000000005E01000000C6C598000101000000001A04000000C7C59800010100000000AC0D00000035C49800010100000000CC0100000036C49800010100000000640500000037C49800010100000000F81100000035353101010100000000E60000000036353101010100000000B20200000037353101010100000000FC080000001D362C0401010000000096000000001E362C04010100000000EE020000001F362C04010100000000D0070000001108F60501010000000090010000001208F605010100000000A4060000001308F6050101000000008813000000519E98000101282300000000000000529E98000101409C00000000000000A9B99800010100000000FA00000000AAB99800010100000000EE02000000ABB99800010100000000C40900000005C7C901010100000000820000000006C7C901010100000000860100000007C7C901010100000000140500000045B998000101000000002C0100000046B99800010100000000840300000047B99800010100000000B80B000000BDBE98000101000000002C01000000BEBE98000101000000008403000000BFBE9800010100000000B80B00000069C7C90101010000000018010000006AC7C90101010000000048030000006BC7C901010100000000F00A000000F9B49800010100000000C201000000FAB498000101000000004605000000FBB49800010100000000A00F000000FDC498000101000000005E01000000FEC498000101000000001A04000000FFC49800010100000000AC0D00000025CF9800010100000000A40100000026CF9800010100000000EC0400000027CF98000101000000006810000000EDCF98000101000000007C01000000EECF98000101000000007404000000EFCF9800010100000000D80E000000C1CE98000101000000009001000000C2CE9800010100000000B004000000C3CE9800010100000000A00F00000019262C040101000000002C010000001A262C04010100000000DC050000001B262C0401010000000094110000007D262C040101000000002C010000007E262C04010100000000DC050000007F262C040101000000009411000000E1262C040101000000002C01000000E2262C04010100000000B004000000E3262C04010100000000A00F000000B5252C040101000000009001000000B6252C04010100000000A406000000B7252C040101000000008813000000DDC198000101000000005E01000000DEC198000101000000004C04000000DFC19800010100000000AC0D000000C1B598000101983A00000000000000C2B598000101E8FD0000000000000006A18E06010100000000F82A000000DA9F8E06010100000000C8320000003EA08E06010100000000E02E00000011F2FA02010100000000780000000012F2FA02010100000000680100000013F2FA02010100000000B004000000A910F6050101000000009001000000AA10F605010100000000A406000000AB10F6050101000000008813000000A9272C040101000000001801000000AA272C040101000000004C04000000AB272C04010100000000D80E0000007DB898000101000000007C010000007EB8980001010000000074040000007FB89800010100000000D80E00000059A59800010100000000FA000000005AA59800010100000000EE020000005BA59800010100000000C40900000035AB98000101000000002C0100000036AB9800010100000000840300000037AB9800010100000000B80B000000DD8C9303010100000000A401000000DE8C9303010100000000C409000000DF8C93030101000000002823000000158C93030101000000009001000000168C9303010100000000CA08000000178C93030101000000003421000000798C930301010000000090010000007A8C9303010100000000CA080000007B8C93030101000000003421000000418D9303010100000000A401000000428D9303010100000000C409000000438D93030101000000002823000000DD3231010101000000002C01000000DE3231010101000000008403000000DF323101010100000000B80B000000413331010101E02E00000000000000423331010101C0DA00000000000000EDB69800010100000000A401000000EEB69800010100000000EC04000000EFB69800010100000000681000000051B798000101000000002C0100000052B79800010100000000840300000053B79800010100000000B80B000000B5B79800010100000000FA00000000B6B79800010100000000EE02000000B7B79800010100000000C4090000006DDC9800010100000000C2010000006EDC980001010000000078050000006FDC98000101000000009411000000E5A4BF07010400000000F40100000049A5BF07010400000000B004000000ADA5BF07010400000000D007000000AD1E2C04010100000000FA00000000AE1E2C04010100000000E803000000AF1E2C04010100000000AC0D000000B11E2C04010401000000000000000031F2F505010100000000900100000032F2F505010100000000400600000033F2F505010100000000881300000079A89800010100000000C8000000007AA8980001010000000058020000007BA89800010100000000D0070000007DA898000104010000000000000000E1B89800010100000000FA00000000E2B89800010100000000EE02000000E3B89800010100000000C409000000E5B898000104010000000000000000A58D930301040100000000000000009D3531010104010000000000000000BD352C040104010000000000000000D14E5D05010401000000000000000009212C040104010000000000000000A5202C040104010000000000000000958893030104010000000000000000F988930301040100000000000000007DD1980001010000000090010000007ED19800010100000000B0040000007FD19800010100000000A00F000000D1C398000101000000009001000000D2C39800010100000000B004000000D3C39800010100000000A00F0000002DBD98000101AC26000000000000002EBD9800010180BB00000000000000D5D39800010100000000FA00000000D6D39800010100000000EE02000000D7D39800010100000000C4090000009DD49800010100000000C8000000009ED4980001010000000058020000009FD49800010100000000D007000000C9D59800010100000000E100000000CAD59800010100000000EE02000000CBD59800010100000000CA0800000065D59800010100000000FA0000000066D59800010100000000EE0200000067D59800010100000000C40900000001D59800010100000000130100000002D59800010100000000390300000003D59800010100000000BE0A0000004D3131010101000000002C010000004E313101010100000000E8030000004F313101010100000000AC0D00000051313101010401000000000000000049C9980001010000000004010000004AC998000101000000000C030000004BC99800010100000000280A00000049B09800010100000000C2010000004AB0980001010000000046050000004BB098000101000000009411000000E5C898000101000000009001000000E6C89800010100000000B004000000E7C89800010100000000A00F00000051252C040101000000002C0100000052252C04010100000000A40600000053252C040101000000008813000000B99293030101000000002C01000000BA9293030101000000004006000000BB9293030101000000007017000000559293030101000000002C01000000569293030101000000004006000000579293030101000000007017000000BD2F3101010100000000FA00000000BE2F3101010100000000EE02000000BF2F3101010100000000C409000000ED242C040101000000002C01000000EE242C04010100000000A406000000EF242C040101000000008813000000759593030101000000005E0100000076959303010100000000780500000077959303010100000000C012000000119593030101000000005E0100000012959303010100000000780500000013959303010100000000C012000000D99593030101000000005E01000000DA9593030101000000007805000000DB959303010100000000C01200000085BF9800010100000000FA0000000086BF9800010100000000EE0200000087BF9800010100000000C40900000051D09800010100000000180100000052D09800010100000000480300000053D09800010100000000F00A000000E9BF9800010100000000FA00000000EABF9800010100000000EE02000000EBBF9800010100000000C40900000089CF98000101000000002C010000008ACF980001010000000084030000008BCF9800010100000000B80B00000019B89800010100000000FA000000001AB89800010100000000EE020000001BB89800010100000000C4090000005DCE98000101000000002C010000005ECE980001010000000084030000005FCE9800010100000000B80B000000C9BC9800010100000000FA00000000CABC9800010100000000EE02000000CBBC9800010100000000C40900000039D49800010100000000E1000000003AD49800010100000000A3020000003BD49800010100000000CA0800000031CD98000101000000002C0100000032CD9800010100000000840300000033CD9800010100000000B80B000000EDF4F50501010000000070170000008DEBF5050101000000002C010000008EEBF505010100000000E8030000008FEBF505010100000000100E00000029EBF5050101000000002C010000002AEBF505010100000000E8030000002BEBF505010100000000100E0000002DEBF5050104010000000000000000310BF605010100000000C201000000320BF605010100000000C409000000330BF6050101000000003421000000D9EFF505010100000000C201000000DAEFF505010100000000C409000000DBEFF5050101000000003421000000950BF6050101000000002C01000000960BF6050101000000004C04000000970BF605010100000000D80E00000021D89800010100000000180100000022D89800010100000000480300000023D89800010100000000F00A0000004DE5F505010100000000F4010000004EE5F505010100000000B80B0000004FE5F5050101000000002823000000A9402C040101000000002C01000000AA402C04010100000000B004000000AB402C04010100000000A00F000000AD402C0401040100000000000000001D0FF6050104010000000000000000AD9798000101162600000000000000AE9798000101BCB100000000000000B19798000104010000000000000000DD4C5D0501040100000000000000005DB598000101401F000000000000005EB5980001017094000000000000003DF3FA0201010000000078000000003EF3FA0201010000000068010000003FF3FA02010100000000B00400000041F3FA020104010000000000000000FDDD9800010100000000CC01000000FEDD98000101000000006405000000FFDD9800010100000000F81100000005FE9800010100000000900100000006FE9800010100000000B00400000007FE9800010100000000A00F00000015DA98000101000000002C0100000016DA9800010100000000840300000017DA9800010100000000B80B000000F9C8C9010101000000009600000000FAC8C901010100000000C201000000FBC8C901010100000000DC05000000398F93030104010000000000000000718E93030104010000000000000000D58E930301040100000000000000009D8F93030104010000000000000000FD9B980001040100000000000000001D9F98000104010000000000000000A5C29800010100000000FA01000000A6C29800010100000000EE05000000A7C29800010100000000C413000000F50899000101504600000000000000F608990001012048010000000000002E000000";
    	//BinaryWriter bw = new BinaryWriter("resource/shopGoods1.dat");
    	//bw.WriteB(NetworkUtil.hexStringToByteArray(array1));
    	//bw.flush();
    	//bw.close();
    	
    	//String array2 = "3706000050020000500200001DAF980001010000000040010000001EAF9800010100000000C0030000001FAF9800010100000000800C000000753B3101010100000000FA00000000763B3101010100000000EE02000000773B3101010100000000C409000000D5CEC9010101000000001801000000D6CEC9010101000000004803000000D7CEC901010100000000F00A000000BD5C62020101000000006400000000BE5C62020101000000002C01000000BF5C6202010100000000E803000000B1F298000101000000001801000000B2F298000101000000004803000000B3F29800010100000000F00A000000910899000101504600000000000000920899000101204801000000000000E90A99000101A41F00000000000000210A99000101A41F00000000000000220A99000101A893000000000000004D0B99000101A41F000000000000004E0B99000101A8930000000000000091EF98000101000000005E0100000092EF98000101000000001A0400000093EF9800010100000000AC0D000000D9282C04010401000000000000000009179900010401000000000000000031D1C9010104010000000000000000255F2C0401040100000000000000002D0899000101000000007C010000002E08990001010000000074040000002F089900010100000000D80E0000005909990001018C3C000000000000005A09990001010A2201000000000000B10B99000101662100000000000000B20B99000101709400000000000000850A99000101701700000000000000860A99000101606D00000000000000999893030104010000000000000000AD20F605010100000000EE020000008D04F605010100000000EE02000000FABB8E060101000000002E3B00000021BF98000101000000007C0100000022BF9800010100000000740400000023BF9800010100000000D80E000000E1D198000101000000008601000000E2D198000101000000009204000000E3D198000101000000003C0F00000045D29800010100000000860100000046D29800010100000000920400000047D298000101000000003C0F000000A9D298000101000000009001000000AAD29800010100000000B004000000ABD29800010100000000A00F000000A1CB98000101000000009001000000A2CB9800010100000000B004000000A3CB9800010100000000A00F000000350F990001013A2000000000000000360F99000101649600000000000000F1373101010100000000E600000000F2373101010100000000B202000000F3373101010100000000FC08000000053D31010101C01200000000000000063D31010101805700000000000000A13C31010101001900000000000000A23C310101013075000000000000007DE6F50501040100000000000000007EE6F5050104010000000000000000C5DE98000101000000000E01000000C6DE98000101000000002A03000000C7DE98000101000000008C0A00000061F79800010100000000180100000062F79800010100000000480300000063F79800010100000000F00A00000029F8980001010000000090010000002AF89800010100000000B0040000002BF89800010100000000A00F000000C5F798000101000000002201000000C6F798000101000000006603000000C7F79800010100000000540B0000008DE898000104010000000000000000913731010104010000000000000000CD079900010401000000000000000039322C040104010000000000000000D10E99000101000000002C01000000D20E99000101000000008403000000D30E9900010100000000B80B000000693D310101011815000000000000006A3D31010101706200000000000000990F990001010000000018010000009A0F990001010000000048030000009B0F9900010100000000F00A0000006D0E990001013E49000000000000006E0E99000101CC55010000000000008D6F2C0401040100000000000000004DEEF5050104010000000000000000891A9900010100000000FA000000008A1A9900010100000000EE020000008B1A9900010100000000C409000000352899000104010000000000000000362899000104010000000000000000372899000104010000000000000000DD612C040104010000000000000000DE612C04010401000000000000000041622C04010401000000000000000042622C040104010000000000000000A5622C040104010000000000000000A6622C04010401000000000000000009632C0401040100000000000000000A632C0401040100000000000000001D682C0401040100000000000000001E682C0401040100000000000000006D632C0401040100000000000000006E632C040104010000000000000000D1632C040104010000000000000000D2632C04010401000000000000000035642C04010401000000000000000036642C04010401000000000000000099642C0401040100000000000000009A642C04010401000000000000000055672C04010401000000000000000056672C040104010000000000000000FD642C040104010000000000000000FE642C04010401000000000000000061652C04010401000000000000000062652C040104010000000000000000C5652C040104010000000000000000C6652C040104010000000000000000B9672C040104010000000000000000BA672C04010401000000000000000029662C0401040100000000000000002A662C0401040100000000000000008D662C0401040100000000000000008E662C040104010000000000000000F1662C040104010000000000000000F2662C040104010000000000000000CD6C2C040104010000000000000000CE6C2C0401040100000000000000005D6E2C0401040100000000000000005E6E2C040104010000000000000000756A2C040104010000000000000000766A2C040104010000000000000000116A2C040104010000000000000000126A2C040104010000000000000000316D2C040104010000000000000000326D2C040104010000000000000000956D2C040104010000000000000000966D2C0401040100000000000000003D6B2C0401040100000000000000003E6B2C040104010000000000000000056C2C040104010000000000000000066C2C04010401000000000000000049692C0401040100000000000000004A692C040104010000000000000000F96D2C040104010000000000000000FA6D2C040104010000000000000000AD692C040104010000000000000000AE692C040104010000000000000000696C2C0401040100000000000000006A6C2C040104010000000000000000A16B2C040104010000000000000000A26B2C040104010000000000000000C16E2C040104010000000000000000C26E2C040104010000000000000000D96A2C040104010000000000000000DA6A2C040104010000000000000000915B62020104010000000000000000855D620201040100000000000000005EBC8E06010100000000E02E000000C2BC8E06010100000000BC34000000416062020104010000000000000000426062020104010000000000000000CDCC98000104010000000000000000D9CA9800010401000000000000000069CC9800010401000000000000000091D1C9010104010000000000000000251A9900010100000000FA00000000261A9900010100000000EE02000000271A9900010100000000C40900000031189900010401000000000000000035322C04010401000000000000000071732C04010401000000000000000072732C040104010000000000000000AD39F605010401000000000000000054252C0401040100000000000000009D742C0401040100000000000000009E742C0401040100000000000000009F742C040104010000000000000000BD5E2C040104010000000000000000412699000101204E00000000000000422699000101905F01000000000000BD0999000104010000000000000000BE0999000104010000000000000000BF0999000104010000000000000000C009990001040100000000000000001D38F605010401000000000000000079FFF5050104010000000000000000053CF6050104010000000000000000BCECF5050104010000000000000000A4F0F505010401000000000000000014EFF5050104010000000000000000980BF605010401000000000000000022E4F50501040100000000000000009598930301040100000000000000000D282C040101000000002C010000000E282C04010100000000B0040000000F282C04010100000000D80E000000B1D998000101000000006801000000B2D998000101000000003804000000B3D99800010100000000100E000000BDD798000101000000002C01000000BED798000101000000008403000000BFD79800010100000000B80B000000F5D69800010100000000DC00000000F6D698000101000000009402000000F7D69800010100000000980800000059D79800010100000000FA000000005AD79800010100000000EE020000005BD79800010100000000C409000000D5282C04010401000000000000000031C8C901010100000000780000000032C8C901010100000000680100000033C8C901010100000000B004000000CDC7C9010101000000008200000000CEC7C9010101000000008601000000CFC7C90101010000000014050000003828990001040100000000000000008926F60501040100000000000000003ECB98000104010000000000000000CECC980001040100000000000000006ACC9800010401000000000000000038AB9800010401000000000000000042A99800010401000000000000000018DA98000104010000000000000000C0BE980001040100000000000000008C1A9900010401000000000000000000C59800010401000000000000000000DE9800010401000000000000000076C5C901010401000000000000000086A698000104010000000000000000300899000104010000000000000000EAA69800010401000000000000000066BC980001040100000000000000001CB898000104010000000000000000DA9898000104010000000000000000C6AC980001040100000000000000002AAD98000104010000000000000000E4B898000104010000000000000000D2AA98000104010000000000000000D8D398000104010000000000000000D40E990001040100000000000000008EAD98000104010000000000000000FD4199000104010000000000000000FE4199000104010000000000000000FF41990001040100000000000000000042990001040100000000000000000142990001040100000000000000006D40990001040100000000000000006E40990001040100000000000000006F4099000104010000000000000000704099000104010000000000000000714099000104010000000000000000D14099000104010000000000000000D24099000104010000000000000000D34099000104010000000000000000D44099000104010000000000000000D540990001040100000000000000009941990001040100000000000000009A41990001040100000000000000009B41990001040100000000000000009C41990001040100000000000000009D419900010401000000000000000001575D0501040100000000000000009D565D050104010000000000000000A52699000101000000004A01000000A6269900010100000000DE03000000A7269900010100000000E40C0000007AFFF50501040100000000000000009AAB98000104010000000000000000ECBF9800010401000000000000000054B79800010401000000000000000075CA98000104010000000000000000B4D998000104010000000000000000E4D1980001040100000000000000004EA798000104010000000000000000C8DE98000104010000000000000000C8C598000104010000000000000000C1099900010401000000000000000054D098000104010000000000000000B4F29800010401000000000000000024D89800010401000000000000000034CD9800010401000000000000000029C6980001040100000000000000003D1699000104010000000000000000C90799000104010000000000000000F99893030101000000009001000000FA989303010100000000D007000000FB989303010100000000581B0000005D99930301010000000090010000005E999303010100000000D0070000005F999303010100000000581B000000213C99000101000000006801000000223C99000101000000003804000000233C9900010100000000100E000000593B99000101000000005E010000005A3B99000101000000001A040000005B3B9900010100000000AC0D000000E93C99000101000000006801000000EA3C99000101000000003804000000EB3C9900010100000000100E0000002526F6050104010000000000000000A532F60501040100000000000000005537F6050104010000000000000000B937F6050104010000000000000000693CF60501040100000000000000008138F60501040100000000000000000D1E990001040100000000000000000E1E990001040100000000000000000F1E99000104010000000000000000711E99000104010000000000000000721E99000104010000000000000000A91D99000104010000000000000000AA1D99000104010000000000000000AB1D99000104010000000000000000A13BF6050104010000000000000000D51E99000104010000000000000000D61E99000104010000000000000000D71E99000104010000000000000000391F990001040100000000000000003A1F990001040100000000000000003B1F99000104010000000000000000063099000104010000000000000000DA2E9900010401000000000000000088D3C901010401000000000000000089D3C9010104010000000000000000731E99000104010000000000000000953199000104010000000000000000CFCC98000104010000000000000000ADC4C9010101701700000000000000AEC4C9010101606D000000000000005DC9C9010101000000002C010000005EC9C90101010000000038040000005FC9C901010100000000100E000000B5D098000101000000005E01000000B6D098000101000000001A04000000B7D09800010100000000AC0D000000D9C5C9010101000000009600000000DAC5C901010100000000C201000000DBC5C901010100000000DC050000004D3D990001010000000090010000004E3D9900010100000000B0040000004F3D9900010100000000A00F000000913A9900010100000000B801000000923A99000101000000002805000000933A99000101000000003011000000BD3B99000101000000005E01000000BE3B99000101000000001A04000000BF3B9900010100000000AC0D000000D0CC9800010401000000000000000096319900010401000000000000000070DC9800010401000000000000000076B198000104010000000000000000ED3399000104010000000000000000FD35310101040100000000000000007A3231010104010000000000000000BC9293030104010000000000000000C02F31010104010000000000000000EC8A93030104010000000000000000863031010104010000000000000000508B93030104010000000000000000163231010104010000000000000000349893030104010000000000000000503131010104010000000000000000F43731010104010000000000000000589293030104010000000000000000F8D698000104010000000000000000B48B93030104010000000000000000C0D798000104010000000000000000888A93030104010000000000000000A68D9303010401000000000000000040C6C901010401000000000000000052CBC90101040100000000000000006CC7C9010104010000000000000000D8CEC901010401000000000000000060C9C9010104010000000000000000DCC5C90101040100000000000000001C262C04010401000000000000000020362C040104010000000000000000AC272C040104010000000000000000B8252C04010401000000000000000028242C040104010000000000000000E4262C040104010000000000000000F0242C040104010000000000000000C4232C04010401000000000000000098222C040104010000000000000000FC222C04010401000000000000000090EBF5050104010000000000000000BDECF50501040100000000000000002CEBF505010401000000000000000015EFF505010401000000000000000050E5F505010401000000000000000084EDF505010401000000000000000010282C040104010000000000000000FCC8C901010401000000000000000020EDF505010401000000000000000064F7980001040100000000000000001D262C04010401000000000000000005212C040104010000000000000000AC402C0401040100000000000000002AC6980001040100000000000000009C0F9900010401000000000000000089F4F505010401000000000000000059772C0401040100000000000000000927990001010000000090010000000A279900010100000000B0040000000B279900010100000000A00F000000F53A99000104010000000000000000E1582C04010401000000000000000061363101010100000000FA0000000062363101010100000000EE0200000063363101010100000000C409000000C9752C04010401000000000000000066752C0401040100000000000000006AD38E06010100000000744000000085E4F50501040100000000000000000961620201040100000000000000009D45310101040100000000000000008AE3C901010401000000000000000005F4FA02010401000000000000000006F4FA020104010000000000000000AD4B5D050104010000000000000000B5525D0501040100000000000000007DE5C901010401000000000000000081682C04010401000000000000000082682C0401040100000000000000005A772C040104010000000000000000592299000104010000000000000000DAB1980001040100000000000000005B772C040104010000000000000000BE5E2C04010401000000000000000041D6C9010104010000000000000000A0742C040104010000000000000000654631010104010000000000000000F9D698000104010000000000000000F16462020104010000000000000000B94499000101000000005E01000000BA4499000101000000001A04000000BB449900010100000000AC0D00000051CBC901010100000000E60000000053CBC901010100000000B20200000054CBC901010100000000FC08000000D5443101010401000000000000000034C8C9010104010000000000000000BF5E2C04010401000000000000000065F7980001040100000000000000006DD7C90101040100000000000000006ED7C9010104010000000000000000D6443101010401000000000000000064363101010401000000000000000006212C04010401000000000000000007212C040104010000000000000000A1202C040104010000000000000000A2202C0401040100000000000000006FD7C901010401000000000000000001752C04010401000000000000000002752C04010401000000000000000003752C040104010000000000000000296462020104010000000000000000FCE1C901010401000000000000000081E7F60501040100000000000000001DE7F6050104010000000000000000E5E7F6050104010000000000000000212D2C0401040100000000000000001DC8980001040100000000000000000940990001010000000018010000000A40990001010000000048030000000B409900010100000000F00A0000000A7C2C040104010000000000000000E9D3C901010100000000D200000000EAD3C9010101000000007602000000EBD3C9010101000000003408000000ECD3C9010104010000000000000000EDD3C901010401000000000000000036322C04010401000000000000000037322C0401040100000000000000000B7C2C0401040100000000000000007BFFF505010401000000000000000049EEF505010401000000000000000014F2FA02010401000000000000000015F2FA020104010000000000000000097C2C0401040100000000000000004DDFF6050104010000000000000000B1DFF605010401000000000000000079E0F6050104010000000000000000DDE0F605010401000000000000000041E1F60501040100000000000000005CD2C90101040100000000000000005DD2C901010401000000000000000023E4F50501040100000000000000005DF6FA0201040100000000000000005EF6FA020104010000000000000000F14399000101000000003601000000F2439900010100000000A203000000F34399000101000000001C0C00000031989303010100000000A40100000032989303010100000000C409000000339893030101000000002823000000C5E4F60501040100000000000000003951990001040100000000000000009D51990001040100000000000000009E4531010104010000000000000000655299000104010000000000000000BD772C0401040100000000000000002D5399000104010000000000000000321899000104010000000000000000997D2C0401040100000000000000009A7D2C040104010000000000000000FD7D2C040104010000000000000000FE7D2C0401040100000000000000004AEEF505010401000000000000000089E3C901010401000000000000000051349900010401000000000000000085F198000104010000000000000000EDCAC9010104010000000000000000499493030104010000000000000000AD94930301040100000000000000008D9193030104010000000000000000F19193030104010000000000000000E593930301040100000000000000003D9693030104010000000000000000C590930301040100000000000000002991930301040100000000000000000A6162020104010000000000000000494B5D050104010000000000000000795C5D050104010000000000000000155F62020104010000000000000000302199000104010000000000000000603F310101040100000000000000005ED2C90101040100000000000000005D22990001040100000000000000005FF6FA020104010000000000000000BF772C040104010000000000000000F0B698000104010000000000000000FD1BF605010401000000000000000001A09303010100000000A40100000002A09303010100000000C40900000003A0930301010000000028230000009D9F9303010100000000A4010000009E9F9303010100000000C4090000009F9F930301010000000028230000009B7D2C040104010000000000000000FF7D2C040104010000000000000000F5585D050104010000000000000000AD822C040104010000000000000000AE822C040104010000000000000000E26799000101000000004F01000000E3679900010100000000ED03000000E4679900010100000000160D000000F2646202010401000000000000000019423101010401000000000000000029DAC90101040100000000000000002ADAC90101040100000000000000002BDAC90101040100000000000000002CDAC9010104010000000000000000CA5A62020104010000000000000000653631010104010000000000000000D13431010104010000000000000000D23431010104010000000000000000D33431010104010000000000000000D43431010104010000000000000000D534310101040100000000000000006DF0C901010401000000000000000025CAC901010401000000000000000026CAC90101040100000000000000000D3799000104010000000000000000313E310101040100000000000000009C7D2C04010401000000000000000079D5C9010104010000000000000000F63A99000104010000000000000000FCB498000104010000000000000000F73A99000101000000004A01000000F83A9900010100000000DE03000000F93A9900010100000000E40C000000CD1799000101000000002C01000000CE1799000101000000008403000000CF179900010100000000B80B00000005499900010100000000C201000000064999000101000000004605000000074999000101000000009411000000232D2C0401040100000000000000004D5E62020104010000000000000000242D2C040101000000002C010000002E000000";
    	//bw = new BinaryWriter("resource/shopGoods2.dat");
    	//bw.WriteB(NetworkUtil.hexStringToByteArray(array2));
    	//bw.flush();
    	//bw.close();
    	
    	//String array3 = "3706000097010000A0040000252D2C04010100000000DC05000000262D2C040101000000009411000000C0772C040101000000002C01000000C1772C04010100000000A406000000C2772C040101000000007C1500000067752C040101000000002C0100000068752C04010100000000A40600000069752C040101000000009411000000592C2C040101000000002C010000005A2C2C04010100000000B0040000005B2C2C04010100000000F00A000000215F2C040101000000002C01000000225F2C04010100000000B004000000235F2C04010100000000D80E000000B87F990001040100000000000000001C8099000104010000000000000000488199000104010000000000000000808099000104010000000000000000AC8199000104010000000000000000108299000104010000000000000000B5F8FA0201040100000000000000002A2A99000104010000000000000000C52FF70501010000000058020000002930F7050101000000005802000000DD3E99000104010000000000000000413F990001040100000000000000004A1E2C04010401000000000000000066F798000104010000000000000000AD7899000101000000005E01000000AE7899000101000000001A04000000AF789900010100000000AC0D00000011799900010100000000120200000012799900010100000000360600000013799900010100000000B41400000075799900010100000000C201000000767999000101000000004605000000777999000101000000009411000000794B310101010000000040010000007A4B31010101000000001A040000007B4B3101010100000000740E00000049789900010100000000C2010000004A78990001010000000046050000004B789900010100000000941100000021ECC901010100000000180100000022ECC901010100000000480300000023ECC901010100000000F00A000000F1EBF5050101000000005E01000000F2EBF5050101000000001A04000000F3EBF505010100000000AC0D0000007508F60501040100000000000000006D312C040104010000000000000000A5D6C90101040100000000000000001D6662020104010000000000000000314A99000104010000000000000000254C9900010401000000000000000021DEF605010401000000000000000085DEF6050104010000000000000000E9DEF605010401000000000000000015E0F6050104010000000000000000B5892C040104010000000000000000DDEEC9010104010000000000000000C14B99000104010000000000000000690AF605010401000000000000000051E5F5050104010000000000000000E18A2C040104010000000000000000E28A2C0401040100000000000000007D9999000104010000000000000000D4C3980001040100000000000000000C2799000104010000000000000000B0EEF5050104010000000000000000D50E99000104010000000000000000994E3101010100000000FA000000009A4E3101010100000000EE020000009B4E3101010100000000C409000000119299000101000000000401000000129299000101000000000C0300000013929900010100000000280A00000066463101010401000000000000000040F3FA0201040100000000000000003C8D2C040104010000000000000000BCF4C90101040100000000000000007EE5C90101040100000000000000004E5E62020104010000000000000000BC449900010401000000000000000052E5F505010401000000000000000099A599000104010000000000000000A1F8C90101040100000000000000002D8F2C04010401000000000000000061A69900010401000000000000000029A799000104010000000000000000FDA59900010401000000000000000009A499000104010000000000000000A5A3990001040100000000000000008D5031010104010000000000000000D9F7C9010104010000000000000000D1A4990001040100000000000000006DA499000104010000000000000000E5AF980001040100000000000000007DCCC901010401000000000000000089B698000104010000000000000000ADB098000104010000000000000000CDB398000104010000000000000000398399000104010000000000000000FC9893030104010000000000000000AEF1FA020104010000000000000000C05C6202010401000000000000000012C5C901010401000000000000000013C5C9010104010000000000000000B01E2C040104010000000000000000AFF1FA020104010000000000000000B0F1FA020104010000000000000000C15C62020104010000000000000000C25C62020104010000000000000000DE3E99000104010000000000000000423F9900010401000000000000000042D6C901010401000000000000000042F3FA0201040100000000000000002A646202010401000000000000000055CBC9010104010000000000000000609993030104010000000000000000FD6262020101000000008200000000FE6262020101000000008601000000FF626202010100000000140500000019CCC9010101000000002C010000001ACCC90101010000000084030000001BCCC901010100000000B80B000000697B99000101000000005E010000006A7B99000101000000001A040000006B7B9900010100000000AC0D0000007DFD8E06010100000000780500000083FD8E06010100000000D80E0000009AFD8E06010100000000442F000000D5059900010401000000000000000079E6F50501040100000000000000008D342C0401040100000000000000008E342C0401040100000000000000008F342C0401040100000000000000005C3B990001040100000000000000007C4B3101010401000000000000000081362C04010401000000000000000082362C040104010000000000000000154AF60501040100000000000000003DAC990001040100000000000000000D4431010104010000000000000000CDAD9900010401000000000000000055DBC9010104010000000000000000D9AB99000104010000000000000000DAAB99000104010000000000000000DBAB990001040100000000000000004967620201040100000000000000004A67620201040100000000000000004B676202010401000000000000000075AB9900010401000000000000000076AB9900010401000000000000000077AB99000104010000000000000000B9DBC901010401000000000000000005AD9900010401000000000000000006AD9900010401000000000000000007AD9900010401000000000000000008AD990001040100000000000000005960F60501040100000000000000005A60F60501040100000000000000005B60F6050104010000000000000000BADBC9010104010000000000000000152F2C04010401000000000000000045A098000104010000000000000000E95599000104010000000000000000F55B6202010401000000000000000001432C04010401000000000000000002432C04010401000000000000000046A098000104010000000000000000EA5599000104010000000000000000F65B62020104010000000000000000F75B62020104010000000000000000006362020104010000000000000000D16162020104010000000000000000658E2C040104010000000000000000C1872C04010401000000000000000085A09900010100000000FE0100000086A09900010100000000FA0500000087A09900010100000000EC130000007144310101040100000000000000001DDCC9010104010000000000000000E1B299000104010000000000000000D55A2C04010401000000000000000019B299000104010000000000000000AD6762020104010000000000000000E5A999000104010000000000000000F1DAC901010401000000000000000011AB99000104010000000000000000ADAA9900010401000000000000000049AA99000104010000000000000000783B31010104010000000000000000D65A2C040104010000000000000000AE6762020104010000000000000000F4EBF5050104010000000000000000316FF6050104010000000000000000956FF60501040100000000000000002571F6050104010000000000000000056EF60501040100000000000000000D75F60501040100000000000000007175F6050104010000000000000000D575F60501040100000000000000004574F6050104010000000000000000A974F6050104010000000000000000F96FF6050104010000000000000000C170F6050104010000000000000000792599000104010000000000000000057B99000104010000000000000000BEE3F5050104010000000000000000A96899000104010000000000000000F58F2C040104010000000000000000094D31010104010000000000000000154B3101010401000000000000000021D3C90101040100000000000000009BAB98000104010000000000000000594831010104010000000000000000DD4B3101010401000000000000000021B9990001040100000000000000003DDFC901010401000000000000000085B9990001040100000000000000004DBA99000104010000000000000000B1BA99000104010000000000000000610A8F060101000000005A05000000670A8F06010100000000D80E0000007E0A8F06010100000000632E000000B5B19900010401000000000000000091EBF5050104010000000000000000067B9900010401000000000000000015BB9900010401000000000000000009BD99000104010000000000000000DDBB99000104010000000000000000A5BC990001040100000000000000006DBD99000104010000000000000000D1BD9900010401000000000000000081DCC901010401000000000000000079BB99000104010000000000000000E5C299000104010000000000000000ADC39900010401000000000000000049C39900010401000000000000000075C499000104010000000000000000D9C4990001040100000000000000005CD7980001040100000000000000003E16990001040100000000000000007A2599000104010000000000000000495F99000104010000000000000000E55E9900010401000000000000000001E9C90101040100000000000000006D279900010401000000000000000022D3C901010401000000000000000069179900010401000000000000000002E9C90101040100000000000000001408F605010401000000000000000099F69800010401000000000000000020AF9800010401000000000000000055ECF5050104010000000000000000056A62020104010000000000000000066A62020104010000000000000000157CF60501040100000000000000004C789900010401000000000000000077C5C9010104010000000000000000E8C898000104010000000000000000D9CEC901010401000000000000000024ECC901010401000000000000000077B198000104010000000000000000C03B990001040100000000000000001492990001040100000000000000006F0E990001040100000000000000006B3D31010104010000000000000000F70899000104010000000000000000230A9900010401000000000000000008C7C9010104010000000000000000A5F0F5050104010000000000000000C13B9900010401000000000000000038C498000104010000000000000000DC1F2C040104010000000000000000619993030104010000000000000000FD98930301040100000000000000009C4E310101040100000000000000004D789900010401000000000000000005F9C9010104010000000000000000190399000104010000000000000000354199000104010000000000000000814599000104010000000000000000954A99000104010000000000000000E14231010104010000000000000000D1D7C90101040100000000000000001EC8980001040100000000000000008D30F7050104010000000000000000164AF605010401000000000000000092E2F505010401000000000000000004FAF505010401000000000000000005FAF5050104010000000000000000B0789900010401000000000000000080D198000104010000000000000000ADDDC901010401000000000000000035BE99000104010000000000000000F15031010104010000000000000000BD902C04010401000000000000000029C09900010401000000000000000061BF9900010401000000000000000011686202010401000000000000000099BE99000104010000000000000000FDBE99000104010000000000000000F2DAC9010104010000000000000000943A99000104010000000000000000084999000104010000000000000000C2872C040104010000000000000000C3872C0401040100000000000000007B2599000104010000000000000000340BF6050104010000000000000000350BF6050104010000000000000000B149F6050104010000000000000000B249F60501040100000000000000002E539900010401000000000000000056ECF50501040100000000000000008D248F060101000000005A0500000193248F06010100000000D80E000001AA248F06010100000000632E00000169F9C90101040100000000000000001D5231010104010000000000000000BDD199000104010000000000000000BED19900010401000000000000000085D29900010401000000000000000086D29900010401000000000000000021D29900010401000000000000000022D299000104010000000000000000D95431010104010000000000000000DA54310101040100000000000000005DFBC90101040100000000000000005EFBC9010104010000000000000000A5942C040104010000000000000000A6942C04010401000000000000000009952C0401040100000000000000000A952C040104010000000000000000167CF6050104010000000000000000177CF605010401000000000000000082E7F605010401000000000000000083E7F60501040100000000000000001EE7F60501040100000000000000001FE7F6050104010000000000000000E6E7F6050104010000000000000000E7E7F60501040100000000000000004D49F6050104010000000000000000C62FF7050104010000000000000000696A6202010401000000000000000041D59900010401000000000000000042D59900010401000000000000000079D4990001040100000000000000007AD499000104010000000000000000B1D399000104010000000000000000B2D399000104010000000000000000E9D299000104010000000000000000EAD299000104010000000000000000A5D599000104010000000000000000A6D59900010401000000000000000019FEC9010104010000000000000000E13599000104010000000000000000A93699000104010000000000000000453699000104010000000000000000F9E099000104000000009001000001FAE09900010400000000B004000001FBE09900010400000000A00F00000125E29900010400000000120200000126E29900010400000000360600000127E29900010400000000B4140000019D8FF605010400000000C4090000019E8FF6050104000000005E1A0000017DFEC90101040100000000000000004D4A3101010401000000000000000035739900010401000000000000000009729900010401000000000000000041C6C901010401000000000000000096D48E06010100000000A43800000032D48E06010100000000BC34000000CED38E06010100000000B036000000797CF60501040100000000000000007C25990001040100000000000000006A17990001040100000000000000006B179900010401000000000000000089403101010401000000000000000051702C0401040100000000000000003598F605010100000000DC050000013698F605010100000000100E00000119E4990001010000000090010000011AE49900010100000000B00400000169563101010100000000FA000000016A563101010100000000EE0200000171E699000101000000005E0100000172E699000101000000001A040000010DE69900010100000000C2010000010EE6990001010000000046050000017DE4990001010000000090010000017EE49900010100000000B00400000145E59900010100000000900100000146E59900010100000000B004000001F578F60501040100000000000000004196F6050104010000000000000000A596F60501040100000000000000000997F60501040100000000000000006D97F6050104010000000000000000D197F6050104010000000000000000990BF6050104010000000000000000A154F605010401000000000000000022DEF605010401000000000000000023DEF60501040100000000000000004E49F60501040100000000000000002E000000";
    	//bw = new BinaryWriter("resource/shopGoods3.dat");
    	//bw.WriteB(NetworkUtil.hexStringToByteArray(array3));
    	//bw.flush();
    	//bw.close();
    	
    	//BinaryReader br = new BinaryReader(new FileInputStream("resource/shopGoods1.dat"));
    	//System.out.println(" size: " + br.available());
    	//br.close();
    	
    	//br = new BinaryReader(new FileInputStream("resource/shopGoods2.dat"));
    	//System.out.println(" size: " + br.available());
    	//br.close();
    	
    	//br = new BinaryReader(new FileInputStream("resource/shopGoods3.dat"));
    	//System.out.println(" size: " + br.available());
    	//br.close();
    }
    public static void WriteSets() throws FileNotFoundException, IOException
    {
    	//ShopManager g = ShopManager.gI();
    	//g.LOAD_SETS();
    	//BinaryWriter bw = new BinaryWriter("resource/sets.dat");
    	//bw.WriteD(g._sets.size());
    	//for (Good c : g._sets)
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.bonusGold > 0 ? 1 : 0);
    	//	bw.WriteD(c.bonusGold > 0 ? c.bonusGold : c.item_id);
    	//	bw.WriteD(c.gold);
    	//	bw.WriteD(c.cash);
    	//	bw.WriteD(c.count);
    	//	bw.WriteD(c.tag);
    	//	bw.WriteD(c.show ? 1 : 0);
    	//}
    	//System.out.println(bw.getChannel().toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteBox() throws FileNotFoundException, IOException
    {
    	//BinaryWriter bw = new BinaryWriter("resource/randomBox.dat");
    	//RandomXml c = RandomXml.gI();
    	//bw.WriteD(c.randomBox.size());
    	//for (RandomBox r : c.randomBox)
    	//{
    	//	bw.WriteD(r.id);
    	//	bw.WriteD(r.total);
    	//	bw.WriteD(r.probability);
    	//	bw.WriteD(r.items.size());
    	//	for (RBReward i : r.items)
    	//	{
    	//		bw.WriteD(i.random);
    	//		bw.WriteD(i.item_id);
    	//		bw.WriteD(i.count);
    	//		bw.WriteD(i.equip);
    	//		bw.WriteD(i.percent);
    	//		bw.WriteD(i.jackpot ? 1 : 0);
    	//	}
    	//}
    	//System.out.println(bw.getChannel().toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteMaps() throws FileNotFoundException, IOException, SAXException, ParserConfigurationException
    {
    	//BinaryWriter bw = new BinaryWriter("maps.dat");
    	//DaoXML dao = DaoXML.gI();
    	//dao.LOAD();
    	//bw.WriteD(dao.maps.size());
    	//for (Maps map : dao.maps)
    	//{
    	//	bw.WriteD(map.id);
    	//	bw.WriteD(map.mode);
    	//	bw.WriteC(map.tag);
    	//	bw.WriteD(map.list);
    	//	bw.WriteD(map.value);
    	//}
    	//System.out.println(bw.getChannel().toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteMissions() throws FileNotFoundException, IOException
    {
    	//BinaryWriter bw = new BinaryWriter("resource/cards.dat");
    	//MissionsDAT m = MissionsDAT.gI();
    	//List<Card> cardes = m.cards;
    	//assert !m.cardsReward.isEmpty() && !m.missionReward.isEmpty() && !m.cardsList.isEmpty() && (cardes.size() / 40) > 0;
    	//bw.WriteD(m.cardsReward.size());
    	//bw.WriteD(m.missionReward.size());
    	//bw.WriteD(m.cardsList.size());
    	//bw.WriteD(cardes.size() / 40);
    	//for (CardAwards c : m.cardsReward)
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.card);
    	//	bw.WriteD(c.insignia);
    	//	bw.WriteD(c.medal);
    	//	bw.WriteD(c.brooch);
    	//	bw.WriteD(c.exp);
    	//	bw.WriteD(c.gp);
    	//}
    	//for (MisAwards c : m.missionReward)
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.blue_order);
    	//	bw.WriteD(c.exp);
    	//	bw.WriteD(c.gp);
    	//	bw.WriteD(c.item_id);
    	//	bw.WriteD(c.count);
    	//}
    	//for (CardsList c : m.cardsList)
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.value);
    	//	bw.WriteD(c.list);
    	//	bw.WriteD(c.buy);
    	//}
    	//for (int i = 1; i < 18; i++)
    	//{
        //	List<Card> cards = m.getCards(i);
        //	if (cards.size() > 0)
        //	{
    	//		bw.WriteD(i);
		//    	bw.WriteD(cards.size());
		//    	for (Card c : cards)
		//    	{
		//    		bw.WriteD(c.id);
		//    		bw.WriteD(c.limit);
		//    		bw.WriteD(c.mission_id);
		//    		bw.WriteD(c.type.ordinal());
		//    	}
        //	}
    	//}
    	//System.out.println(bw.toString() + " flushed. " + (cardes.size() / 40));
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteCoupons() throws FileNotFoundException, IOException
    {
    	//BinaryWriter bw = new BinaryWriter("resource/couponsValues.dat");
    	//bw.WriteD(CouponXML.gI().coupons.size());
    	//for (Coupon c : CouponXML.gI().coupons.values())
    	//{
    	//	bw.WriteD(c.id);
    	//	bw.WriteD(c.type);
    	//	bw.WriteD(c.list);
    	//	bw.WriteD(c.value);
    	//}
    	//System.out.println(bw.toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteRanked() throws FileNotFoundException, IOException
    {
    	//BinaryWriter bw = new BinaryWriter("xml/rank.dat");
    	//bw.WriteD(RankDAT.gI().ranks.size());
    	//for (RankInfo r : RankDAT.gI().ranks)
    	//{
    	//	bw.WriteD(r.rank);
    	//	bw.WriteD(r.onNextLevel);
    	//	bw.WriteD(r.onGPUp);
    	//	bw.WriteD(r.onAllExp);
    	//	List<PlayerInventory> rewards = RankDAT.gI().getAwards(r.rank);
    	//	bw.WriteD(rewards.size());
    	//	for (PlayerInventory c : rewards)
    	//	{
        //		bw.WriteD(c.item_id);
        //		bw.WriteD(c.count);
        //		bw.WriteD(c.equip);
    	//	}
    	//}
    	//System.out.println(bw.toString() + " flushed.");
    	//bw.flush();
    	//bw.close();
    }
    public static void WriteTitles() throws FileNotFoundException, IOException
    {
    	//TitlesXml x = TitlesXml.gI();
    	//x.LOAD();
    	//BinaryWriter bw = new BinaryWriter("xml/titles.dat");
    	//bw.WriteD(x.titles.size());
    	//for (ru.pb.global.models.TitleV t : x.titles)
    	//{
    	//	bw.WriteD(t.id);
    	//	bw.WriteD(t.pos);
    	//	bw.WriteD(t.pos_v);
    	//	bw.WriteD(t.brooch);
    	//	bw.WriteD(t.insignia);
    	//	bw.WriteD(t.medals);
    	//	bw.WriteD(t.blue_order);
    	//	bw.WriteD(t.rank);
    	//	bw.WriteD(t.slot);
    	//	bw.WriteD(t.reqT1);
    	//	bw.WriteD(t.reqT2);
    	//	bw.WriteD(t.rewards.size());
    	//	for (ru.pb.global.models.PlayerInventory r : t.rewards)
    	//	{
    	//		bw.WriteD(r.item_id);
    	//		bw.WriteD(r.count);
    	//		bw.WriteD(r.equip);
    	//	}
    	//}
    	//bw.flush();
    	//bw.close();
    	//BinaryWriter bw = new BinaryWriter("xml/titlesReward.dat");
    	//bw.WriteD(27);
    	//bw.WriteD(8); bw.WriteD(100003014); bw.WriteD(10); bw.WriteD(1); 	
    	//bw.WriteD(10); bw.WriteD(100003013); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(12); bw.WriteD(100003036); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(12); bw.WriteD(100003015); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(13); bw.WriteD(1103003001); bw.WriteD(1); bw.WriteD(3);
    	//bw.WriteD(14); bw.WriteD(300005006); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(16); bw.WriteD(300005024); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(18); bw.WriteD(300005005); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(19); bw.WriteD(1103003003); bw.WriteD(1); bw.WriteD(3);
    	//bw.WriteD(19); bw.WriteD(300005032); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(20); bw.WriteD(200004007); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(20); bw.WriteD(200004009); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(22); bw.WriteD(200004011); bw.WriteD(10); bw.WriteD(1);	
    	//bw.WriteD(24); bw.WriteD(200004013); bw.WriteD(10); bw.WriteD(1);	
    	//bw.WriteD(25); bw.WriteD(1103003002); bw.WriteD(1); bw.WriteD(3);
    	//bw.WriteD(26); bw.WriteD(702015001); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(28); bw.WriteD(702001004); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(29); bw.WriteD(702001007); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(30); bw.WriteD(601013001); bw.WriteD(10); bw.WriteD(1); 	
    	//bw.WriteD(32); bw.WriteD(601014001); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(32); bw.WriteD(601014002); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(34); bw.WriteD(1103003005); bw.WriteD(1); bw.WriteD(3);
    	//bw.WriteD(35); bw.WriteD(400006004); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(37); bw.WriteD(400006003); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(39); bw.WriteD(1103003004); bw.WriteD(1); bw.WriteD(3);
    	//bw.WriteD(40); bw.WriteD(803007004); bw.WriteD(10); bw.WriteD(1);
    	//bw.WriteD(42); bw.WriteD(904007005); bw.WriteD(10); bw.WriteD(1);
		//bw.WriteD(t.id);
		//bw.WriteD(t.pos);
		//bw.WriteD(t.pos_v);
		//bw.WriteD(t.brooch);
		//bw.WriteD(t.insignia);
		//bw.WriteD(t.medals);
		//bw.WriteD(t.blue_order);
		//bw.WriteD(t.rank);
		//bw.WriteD(t.slot);
		//bw.WriteD(t.reqT1);
		//bw.WriteD(t.reqT2);
		//bw.flush();
    	//bw.close();
    }
    public static boolean deleteDir(File dir)
    {
        if (dir.isDirectory())
            for (String child : dir.list())
                if (!deleteDir(new File(dir, child)))
                    return false;
        return dir.delete();
    }*/
}