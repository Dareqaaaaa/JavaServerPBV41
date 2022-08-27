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

package game;

import java.awt.*;

import core.enums.*;
import core.info.*;
import core.jdbc.*;
import core.log.*;
import core.manager.*;
import core.models.*;
import core.pistola.*;
import core.sql.*;
import core.system.*;
import core.thread.*;
import core.utils.*;
import core.xml.*;
import game.manager.*;
import game.network.protocol.*;
import game.network.protocol.game.ACK.*;

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
			Software.printIntro(key, "Game", Color.MAGENTA);
			ThreadPoolManager.gI();
			ConnectionLoader.gI();
			ConfigurationLoader.gI();
			DatabaseFactory.gI();
			GamePacketHAK.gI();
			BattlePacketHAK.gI();
			AuthPacketHAK.gI();
			PlayerSQL.gI().NICKS_AND_RANKS();
			AccountSQL.gI();
			FriendSQL.gI();
			GameServerXML.gI().LOAD(false);
			CheckXML.gI().LOAD();
			PlaytimeXML.gI().LOAD();
			TemplateXML.gI().LOAD();
			CampXML.gI().LOAD();
			RankXML.gI().LOAD();
			ClanManager.gI().LOAD();
			ClanInviteManager.gI().LOAD();
			ShopFunction.gI().FONT();
			BattleServerManager.gI();
			AuthServerManager.gI();
			AccountSyncer.gI();
			TitlesPISTOLA.gI();
			CuponsPISTOLA.gI();
			MissionsPISTOLA.gI();
			BoxPISTOLA.gI();
			Logger.gI();
			Software.MEMORY("Game");
			Socket.start();
			commands();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			error(Program.class, e);
			System.out.println(" Erro fatal. Check log files!!! ");
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
					if (command.startsWith("online"))
					{
						log("Clientes online: " + AccountSyncer.gI().ACCOUNTS.size());
					}
					if (command.startsWith("recarregar_config"))
					{
						ConnectionLoader.gI().LOAD();
						ConfigurationLoader.gI().LOAD();
						log("As configuracoes foram recarregadas.");
					}
					else if (command.startsWith("recarregar_xml"))
					{
						GameServerXML.gI().LOAD(true);
						CheckXML.gI().LOAD();
						PlaytimeXML.gI().LOAD();
						TemplateXML.gI().LOAD();
						CampXML.gI().LOAD();
						RankXML.gI().LOAD();
						log("Os XML foram recarregados.");
					}
					else if (command.startsWith("recarregar_loja"))
					{
						ShopFunction s = ShopFunction.gI();
						int last = s.shopNow;
						s.FONT();
						log("Loja (" + s.shopNow + "/" + last + ") recarregada.");
					}
					else if (command.startsWith("msg "))
					{
						for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
							if (pR != null && pR.connection != null)
								pR.connection.sendPacket((new SERVER_MESSAGE_ANNOUNCE_ACK(command.substring(4) + " ")));
						log("Enviando mensagem ('" + command.substring(2) + "') para " + AccountSyncer.gI().ACCOUNTS.size() + " jogadores");
					}
					else if (command.startsWith("kikar_todos"))
					{
						int total = 0;
						for (Player mM : AccountSyncer.gI().ACCOUNTS.values())
						{
							if (mM != null && mM.connection != null && mM.rank != 53 && mM.rank != 54 && mM.access_level == AccessLevel.OFF)
							{
								mM.connection.close(new BASE_KICK_ACCOUNT_ACK(mM.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
								total++;
							}
						}
						log("Todos os jogadores foram desconectados: " + total + "/" + AccountSyncer.gI().ACCOUNTS.size());
					}
					else if (command.startsWith("forcado_kikar_todos"))
					{
						int total = 0;
						for (Player mM : AccountSyncer.gI().ACCOUNTS.values())
						{
							if (mM != null && mM.connection != null)
							{
								mM.connection.close(new BASE_KICK_ACCOUNT_ACK(mM.connection, KickType.O_JOGO_SERA_FINALIZADO_POR_SOLICITAÇÃO_DO_SERVIDOR));
								total++;
							}
						}
						log("Todos os jogadores foram desconectados (f): " + total + "/" + AccountSyncer.gI().ACCOUNTS.size());
					}
					else if (command.startsWith("kikar_jogador "))
					{
						String nome = command.substring(14);
						Player mM = AccountSyncer.gI().get(nome);
						if (mM != null && mM.connection != null)
						{
							mM.connection.close(new BASE_KICK_ACCOUNT_ACK(mM.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
							log("Jogador desconectado: " + nome + "");
						}
						else
						{
							log("Jogador nao foi encontrado: " + nome + "");
						}
					}
					else if (command.startsWith("resetar_online"))
					{
						int size = 0;
						for (long id : PlayerSQL.gI().getPlayerIds())
						{
							PlayerSQL.gI().updateOnline(id, 0);
							size++;
						}
						log("Todas as contas foram checkadas pelo status na database. (" + size + ")");
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