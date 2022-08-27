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

package auth.network.protocol.auth.REQ;

import core.enums.*;
import core.info.*;
import core.log.*;
import core.models.*;
import core.system.*;
import core.utils.*;
import auth.manager.*;
import auth.network.protocol.auth.ACK.*;

public class BASE_GET_LOGIN_REQ extends auth.network.protocol.AuthPacketREQ
{
	protected String login, passwd, userfilelist, clientversion, hardwareId;
	protected int login_length, password_length, connection, gold, cash, zero, value = 1;
	protected byte[] ip;
	protected long launcher_key, pId;
	protected int error;
	public BASE_GET_LOGIN_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			clientversion = String.valueOf(ReadC() + "." + ReadH() + "." + ReadH() + "." + ReadC());
			login_length = ReadC();
			password_length = ReadC();
			login = ReadS(login_length);
			passwd = ReadS(password_length);
			client.mac = NetworkUtil.parseMac(ReadB(6));
			zero = ReadH();
			connection = ReadC();
			ip = ReadB(4);
			launcher_key = ReadQ();
			userfilelist = ReadS(32);
			ReadD(); //0
			hardwareId = ReadS(32);
			ReadC(); //0
			Logger.gI().info("HWID", null, "HWID: " + hardwareId, getClass());
			//ReadS(32); PB TAM
		}
		catch (Exception e)
		{
			error = 1;
		}
	}
	@Override
	public void runImpl()
	{
		if (error == 2)
		{
			try
			{
				client.close(null);
			}
			catch (Exception e)
			{
			}
			return;
		}
		else if (error == 1)
		{
			sendPacket(new BASE_GET_LOGIN_ACK(LoginAccess.EVENT_ERROR_LOGIN_BREAK_SESSION.value, 0, 0, ""));
			return;
		}
		ConnectionLoader con = ConnectionLoader.gI();
		if (!ConfigurationLoader.gI().login_active)
		{
			sendPacket(new BASE_GET_LOGIN_ERROR_ACK(0x80000100));
			return;
		}
		if (con.launcher_key != -1 && launcher_key != con.launcher_key)
		{
			sendPacket(new BASE_GET_LOGIN_ERROR_ACK(0x80000100));
			return;
		}
		if (!clientversion.equals(Software.client))
		{
			sendPacket(new BASE_GET_LOGIN_ERROR_ACK(0x80000100));
			return;
		}
		if (con.userfilelist.length() > 0 && !userfilelist.equals(con.userfilelist))
		{
			sendPacket(new BASE_GET_LOGIN_ERROR_ACK(0x80000100));
			return;
		}
		if (connection == ConnectionLoader.gI().connection && zero == 0)
		{
			value = AccountManager.gI().LOGIN(client, login, passwd, clientversion, Software.rev, launcher_key, userfilelist, ip);
			Player p = client.player;
			Account a = client.account;
			if (a != null) pId = a.id;
			if (p != null)
			{
				gold = p.gold;
				cash = p.cash;
			}
			sendPacket(new BASE_GET_LOGIN_ACK(value, zero, pId, login));
			if (value == 1)
			{
				sendPacket(new BASE_GET_MYCASH_ACK(gold, cash));
				db.executeQuery("UPDATE contas SET last_port='" + client.address.getPort() + "' WHERE id='" + pId + "'");
			}
			return;
		}
		else
		{
			sendPacket(new BASE_GET_LOGIN_ERROR_ACK(0x80000100));
		}
	}
}