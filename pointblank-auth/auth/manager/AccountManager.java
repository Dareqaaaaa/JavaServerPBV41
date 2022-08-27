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

package auth.manager;

import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;

import core.enums.*;
import core.log.*;
import core.manager.*;
import core.models.*;
import core.network.*;
import core.sql.*;
import core.system.*;
import core.utils.*;
import core.xml.*;
import auth.network.client.*;
import auth.network.protocol.game.ACK.*;

public class AccountManager
{
	protected static final AccountManager INSTANCE = new AccountManager();
	public volatile ConcurrentMap<String, Account> accounts = new ConcurrentHashMap<String, Account>();
	public volatile ConcurrentMap<Integer, AuthClient> WAITING = new ConcurrentHashMap<Integer, AuthClient>();
	public volatile ConcurrentMap<String, Long> trialSessions = new ConcurrentHashMap<String, Long>();
	public volatile ConcurrentMap<Integer, Integer> playersSessions = new ConcurrentHashMap<Integer, Integer>();
	public volatile boolean receivered = false;
	public volatile Lock lock = new ReentrantLock();
	protected final PlayerSQL db = PlayerSQL.gI();
	protected final AccountSQL ac = AccountSQL.gI();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	public AccountManager()
	{
		for (GameServerInfo srv : GameServerXML.gI().servers)
			playersSessions.put(srv.id, 0);
	}
	public static AccountManager gI()
	{
		return INSTANCE;
	}
	public int sizePlayers(int id)
	{
		if (!playersSessions.containsKey(id))
			playersSessions.put(id, 0);
		return playersSessions.get(id);
	}
	private boolean LENGTH(String text, int length)
	{
		return text.length() < length;
	}
	public int LOGIN(AuthClient client, String login, String password, String version, int clientVersion, long launcher_key, String userfilelist, byte[] localhost)
	{
		lock.lock();
		LoginAccess sucesso = LoginAccess.EVENT_ERROR_LOGIN;
		try
		{
			sucesso = SYNCER(client, login, password, version, clientVersion, launcher_key, userfilelist, localhost);
			if (sucesso == null)
				sucesso = LoginAccess.EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT;
			if (sucesso == LoginAccess.SUCESSO)
			{
				client.login = login;
				Account a = client.account;
				a.connection = client;
				db.updateOnline(a.id, 1);
				if (accounts.containsKey(login))
					accounts.replace(login, a);
				else
					accounts.put(login, a);
				if (trialSessions.containsKey(client.mac))
					trialSessions.remove(client.mac);
				sucesso = LoginAccess.SUCESSO;
			}
		}
		catch (Exception e)
		{
			Logger.gI().info("login", null, client + " login: " + login + " senha: " + password + " mask: " + sucesso.toString() + " " + e.toString() + " | " + e.fillInStackTrace().toString(), getClass());
			sucesso = LoginAccess.EVENT_ERROR_LOGIN;
		}
		finally
		{
			lock.unlock();
		}
		return sucesso.value;
	}
	@SuppressWarnings("deprecation")
	public LoginAccess SYNCER(AuthClient client, String login, String senha, String version, int clientVersion, long launcher_key, String userfilelist, byte[] localhost) throws Exception
	{
		ConfigurationLoader sv = ConfigurationLoader.gI();
		ConnectionLoader conc = ConnectionLoader.gI();
		if (AuthenticationAddress.gI().addr.containsKey(client.mac))
			return PRO(client, login, senha, version, userfilelist, launcher_key, clientVersion);
		if (trialSessions.containsKey(client.mac))
		{
			long interval = System.currentTimeMillis() - trialSessions.get(client.mac);
			if (interval <= 500)
			{
				if (!ac.CONTA_BANIDA(client.ip, client.mac))
				{
					Calendar c = Calendar.getInstance();
					c.getTime().toLocaleString(); //DATE_LOCK
					c.roll(12, 5); //Bloqueio por 5 minutos
					c.getTime().toLocaleString(); //DATE_UNLOCK
					db.insertIP_MAC("", client.mac, "AutoBan: Intervalo de login incorreto");
					Logger.gI().info("login", null, "Conta auto banida: Intervalo de login incorreto (" + client.ip + " - " + client.mac + ") [" + login + "]", getClass());
				}
			}
		}
		else
		{
			trialSessions.put(client.mac, System.currentTimeMillis());
		}
		if (ac.CONTA_BANIDA(client.ip, client.mac))
		{
			return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_TIME_OUT2;
		}
		else if (IPSystemManager.gI().isInBlockedNetwork(client.ip))
		{
			return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_REGION_BLOCKED;
		}
		else if (conc.limit_online != -1 && db.playersOnline() >= conc.limit_online)
		{
			return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_MAXUSER;
		}
		else
		{
			InetAddress net = InetAddress.getByAddress(localhost);
			if (net == null)
			{
				return LoginAccess.EVENT_ERROR_LOGIN_BREAK_SESSION;
			}
			if (conc.mask_ip)
			{
				if (net != null && !net.getHostAddress().equals(client.ip))
				{
					return LoginAccess.EVENT_ERROR_LOGIN_BREAK_SESSION;
				}
			}
			Account a = ac.CARREGAR_PER_INFO(login, senha);
			if (a == null)
			{
				if (LENGTH(login, sv.login_min_length) || !LENGTH(login, sv.login_max_length) || LENGTH(senha, sv.pass_min_length) || !LENGTH(senha, sv.pass_max_length) || EssencialUtil.gI().containsString(login, ConnectionLoader.gI().bad_string, false) || EssencialUtil.gI().containsString(senha, ConnectionLoader.gI().bad_string, false))
				{
					return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT;
				}
				else
				{
					if (sv.auto_account && !ac.CONTA_EXISTENTE(login))
					{
						if (sv.account_for_address != -1 && ac.sizeAccountsByIp(client.ip) >= sv.account_for_address)
							return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT;
						else
						{
							a = new Account(login, senha);
							a.ip = client.ip;
							a.mac = client.mac;
							a.data = date.getDateNormal(0);
							a.client = version;
							a.userfilelist = userfilelist;
							a.launcher_key = launcher_key;
							a.ban_expires = 0;
							ac.CRIAR(a);
							Player p = db.CARREGAR(a.id);
							if (p == null)
								p = db.CRIAR(a.id);
							if (ConnectionLoader.gI().isBlocked(p.country))
								return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_REGION_BLOCKED;
							p.client_version = clientVersion;
							client.player = p;
							client.account = a;
							return LoginAccess.SUCESSO;
						}
					}
					else
					{
						return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT;
					}
				}
			}
			else
			{
				if (sv.only_gm)
				{
					if (db.returnQueryValueI("SELECT rank FROM jogador WHERE id='" + a.id + "'", "rank") < 53 || db.returnQueryValueI("SELECT access_level FROM jogador WHERE id='" + a.id + "'", "access_level") == 0)
					{
						return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_MAXUSER;
					}
				}
				/*if (a.bans > 5)
				{
					db.executeQuery("DELETE FROM jogador_config WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_coupon WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_equipamento WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_estatisticas WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_evento WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_invites WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_vip WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_missoes WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_mouse WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_teclado WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_titulos WHERE player_id='" + a.id + "'");
					db.executeQuery("DELETE FROM jogador_vip WHERE player_id='" + a.id + "'");
				}*/
				boolean banned = a.ban_expires > 0;
				if (banned && a.ban_expires > date.getDateTime())
				{
					return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_TIME_OUT2;
				}
				else
				{
					if (!a.actived)
					{
						return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_BLOCK_ACCOUNT; //LoginAccess.EVENT_ERROR_EVENT_LOG_IN_TIME_OUT1;
					}
					else
					{
						if (accounts.containsKey(login) || db.getOnlinePlayer(a.id))
						{
							Connection con = GameServerManager.gI().conn;
							if (con != null)
								con.sendPacket(new KICK_ACCOUNT_ACK(a.id));
							return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_ALEADY_LOGIN;
						}
						else
						{
							Player p = db.CARREGAR(a.id);
							if (p == null)
								p = db.CRIAR(a.id);
							if (ConnectionLoader.gI().isBlocked(p.country))
								return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_REGION_BLOCKED;
							p.client_version = clientVersion;
							a.ip = client.ip;
							a.mac = client.mac;
							a.data = date.getDateNormal(0);
							a.client = version;
							a.userfilelist = userfilelist;
							a.launcher_key = launcher_key;
							if (banned)
							{
								p.rank = 0;
								p.exp = 0;
								p.equipment = new PlayerEquipment();
								db.updateEquipment(p, p.equipment);
								db.executeQuery("UPDATE jogador WHERE rank='0', exp='0' WHERE id='" + p.id + "'");
							}
							a.ban_expires = 0;
							a.actived = true;
							client.player = p;
							client.account = a;
							ac.ATUALIZAR(a);
							return LoginAccess.SUCESSO;
						}
					}
				}
			}
		}
	}
	public LoginAccess PRO(AuthClient client, String login, String senha, String version, String userfilelist, long launcher_key, int clientVersion)
	{
		Account a = ac.CARREGAR_PER_INFO(login, senha);
		if (a == null)
		{
			if (!ac.CONTA_EXISTENTE(login))
			{
				a = new Account(login, senha);
				a.ip = client.ip;
				a.mac = client.mac;
				a.data = date.getDateNormal(0);
				a.client = version;
				a.userfilelist = userfilelist;
				a.launcher_key = launcher_key;
				a.ban_expires = 0;
				ac.CRIAR(a);
				Player p = db.CARREGAR(a.id);
				if (p == null)
					p = db.CRIAR(a.id);
				p.access_level = AccessLevel.MASTER_PLUS;
				p.brooch = 1000;
				p.insignia = 1000;
				p.medal = 1000;
				p.blue_order = 1000;
				p.vip.pc_cafe = 2;
				db.update(p);
				db.executeQuery("UPDATE jogador_vip SET pc_cafe='2', expirate='255' WHERE player_id='" + a.id + "'");
				p.client_version = clientVersion;
				client.player = p;
				client.account = a;
				return LoginAccess.SUCESSO;
			}
			else
			{
				return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT;
			}
		}
		else
		{
			if (accounts.containsKey(login) || db.getOnlinePlayer(a.id))
			{
				Connection con = GameServerManager.gI().conn;
				if (con != null)
					con.sendPacket(new KICK_ACCOUNT_ACK(a.id));
				return LoginAccess.EVENT_ERROR_EVENT_LOG_IN_ALEADY_LOGIN;
			}
			else
			{
				Player p = db.CARREGAR(a.id);
				if (p == null)
					p = db.CRIAR(a.id);
				p.access_level = AccessLevel.MASTER_PLUS;
				p.brooch = 1000;
				p.insignia = 1000;
				p.medal = 1000;
				p.blue_order = 1000;
				p.vip.pc_cafe = 2;
				db.update(p);
				db.executeQuery("UPDATE jogador_vip SET pc_cafe='2', expirate='255' WHERE player_id='" + a.id + "'");
				p.client_version = clientVersion;
				a.ip = client.ip;
				a.mac = client.mac;
				a.data = date.getDateNormal(0);
				a.client = version;
				a.userfilelist = userfilelist;
				a.launcher_key = launcher_key;
				a.ban_expires = 0;
				a.actived = true;
				client.player = p;
				client.account = a;
				ac.ATUALIZAR(a);
				return LoginAccess.SUCESSO;
			}
		}
	}
}