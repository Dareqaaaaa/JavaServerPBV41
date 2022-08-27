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

package auth.network.protocol.game.REQ;

import core.sql.*;
import auth.network.protocol.*;

public class AUTH_KICK_PLAYER_REQ extends GamePacketREQ
{
	protected int success;
	protected long pId;
	public AUTH_KICK_PLAYER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		success = ReadD();
		pId = ReadQ();
	}
	@Override
	public void runImpl()
	{
		PlayerSQL.gI().updateOnline(pId, success);
	}
}