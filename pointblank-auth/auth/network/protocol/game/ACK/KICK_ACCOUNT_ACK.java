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

package auth.network.protocol.game.ACK;

import auth.network.protocol.*;

public class KICK_ACCOUNT_ACK extends GamePacketACK
{
	protected long pId;
	public KICK_ACCOUNT_ACK(long pId)
	{
		super(true);
		this.pId = pId;
	}
	@Override
	public void writeImpl()
	{
		WriteQ(pId);
	}
}