/*
 * Point Blank Emulador
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2016-2018
 */

package auth;

import java.awt.*;

import core.info.*;
import core.jdbc.*;
import core.log.*;
import core.manager.*;
import core.pistola.*;
import core.sql.*;
import core.system.*;
import core.thread.*;
import core.utils.*;
import core.xml.*;
import auth.manager.*;
import auth.network.protocol.*;

/**
 * 
 * @author Henrique
 *
 */

public class Program extends core.sql.InterfaceSQL
{
	protected static final long startTime = System.currentTimeMillis();
	protected static final String key = EmailFactory.generateCode();
	protected static String passwd = "";
	public static void main(String[] args)
	{
		try
		{
			Software.printIntro(key, "Auth", Color.ORANGE);
			ThreadPoolManager.gI();
			MapsLoader.gI();
			ConfigurationLoader.gI();
			DatabaseFactory.gI();
			GamePacketHAK.gI();
			AuthPacketHAK.gI();
			AccountManager.gI();
			GameServerManager.gI();
			GameServerXML.gI().LOAD(false);
			CheckXML.gI().LOAD();
			TemplateXML.gI().LOAD();
			RankXML.gI().LOAD();
			IPSystemManager.gI().LOAD();
			TitlesPISTOLA.gI();
			MapsPISTOLA.gI();
			MissionsPISTOLA.gI();
			Logger.gI();
			PlayerSQL.gI();
			AccountSQL.gI();
			FriendSQL.gI();
			AuthenticationAddress.gI().LIST();
			Software.MEMORY("Auth");
			Socket.start();
			commands();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			error(Program.class, e);
			System.out.println(" Erro Fatal. Check log files!!! ");
			System.out.flush();
		}
	}
	protected static void commands()
	{
		while (true)
		{
			try
			{
				String read = Software.console.readLine();
				if (read.startsWith("/a "))
				{
					String command = read.substring(3).trim();
					if (command.startsWith("recarregar_config"))
					{
						ConfigurationLoader.gI().LOAD();
						log("As configuracoes foram recarregadas.");
					}
					else if (command.startsWith("recarregar_xml"))
					{
						GameServerXML.gI().LOAD(true);
						CheckXML.gI().LOAD();
						TemplateXML.gI().LOAD();
						RankXML.gI().LOAD();
						log("Os XML foram recarregados.");
					}
					else
					{
						log("Comando nao foi encontrado. (" + command + ")");
					}
				}
			}
			catch (Exception e)
			{
				log("-------------------------------------------------");
				log("Erro Fatal (Causa: " + e.getCause() + ")");
				log("-------------------------------------------------");
			}
		}
	}
	protected static void log(String texto)
	{
		String print = "";
		if (!texto.substring(1).equals("-"))
			print = " [Admin] ";
		System.out.println(print + texto);
		System.out.flush();
	}
}