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

import core.models.*;
import auth.manager.*;
import auth.network.client.*;
import auth.network.protocol.*;
import auth.network.protocol.auth.ACK.*;

public class RECEIVE_PLAYER_CHANNEL_REQ extends GamePacketREQ
{
	protected AccountManager ac;
	public RECEIVE_PLAYER_CHANNEL_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		ac = AccountManager.gI();
		int size = ReadC();
		for (int i = 0; i < size; i++)
			ac.playersSessions.replace(ReadD(), ReadD());
	}
	@Override
	public void runImpl()
	{
		for (AuthClient c : ac.WAITING.values())
		{
			if (c != null)
			{
				boolean access = false;
				Player p = c.player;
				if (p != null)
					if (p.rank == 53 || p.rank == 54 || p.access_level.ordinal() > 0)
						access = true;
				c.sendPacket(new BASE_UPDATE_SCHANNEL_LIST_ACK(access));
				if (ac.WAITING.containsKey(c.id))
					ac.WAITING.remove(c.id);
			}
		}
		ac.receivered = false;
	}
}