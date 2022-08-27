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
import auth.network.client.*;

public abstract class GamePacketREQ extends PacketREQ<GamePacketREQ, GameClient> implements Cloneable
{
	public boolean sync = true;
	protected GamePacketREQ(int opcode)
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
	protected void sendPacket(GamePacketACK msg)
	{
		client.sendPacket(msg);
	}
	@Override
	public GamePacketREQ clonePacket()
	{
		try
		{
			return (GamePacketREQ) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
}