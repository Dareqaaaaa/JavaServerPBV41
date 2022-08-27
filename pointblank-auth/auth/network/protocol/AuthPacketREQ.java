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

package auth.network.protocol;

import core.network.*;
import core.sql.*;
import auth.network.client.*;

public abstract class AuthPacketREQ extends PacketREQ<AuthPacketREQ, AuthClient> implements Cloneable
{
	protected final PlayerSQL db = PlayerSQL.gI();
	protected AuthPacketREQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public final void run()
	{
		try
		{
			runImpl();
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected void sendPacket(AuthPacketACK msg)
	{
		client.sendPacket(msg);
	}
	@Override
	protected AuthPacketREQ clonePacket()
	{
		try
		{
			return (AuthPacketREQ) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
}