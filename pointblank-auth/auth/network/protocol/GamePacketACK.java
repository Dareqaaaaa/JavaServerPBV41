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

public abstract class GamePacketACK extends PacketACK
{
	protected GameClient conn;
	public GamePacketACK(boolean clear)
	{
		super(0);
		opcode = getId();
		if (opcode == 0)
			msgError("Opcode not founded in ACK: " + super.toString());
	}
	public int getId()
	{
		return GamePacketIdACK.getOpcode(toString());
	}
	@Override
	public String toString()
	{
		return getClass().getSimpleName();
	}
	public void write(GameClient client) throws Exception
	{
		if (runner)
		{
			conn = client;
			writeImpl();
			byte[] data = buf.array();
			buf.clear();
			buf.capacity(data.length + 4);
			WriteH(data.length);
			WriteH(opcode);
			WriteB(data);
			conn.channel.writeAndFlush(buf);
			buf = null;
			data = null;
		}
	}
	protected abstract void writeImpl();
}