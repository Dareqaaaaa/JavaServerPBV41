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

package auth.network.protocol.auth.ACK;

public class BASE_GET_LOGIN_ACK extends auth.network.protocol.AuthPacketACK
{
	protected int result;
	protected int ALLOW;
	protected long id;
	protected String login;
	public BASE_GET_LOGIN_ACK(int result, int ALLOW, long id, String login)
	{
		super(true);
		this.result = result;
		this.id = id;
		this.login = login;
		this.ALLOW = ALLOW;
	}
	@Override
	public void writeImpl()
	{
		WriteD(result);
		WriteC(0); //1 - Non String
		WriteQ(id);
		WriteC(login.length());
		WriteS(login, login.length());
		WriteH(ALLOW);
	}
}