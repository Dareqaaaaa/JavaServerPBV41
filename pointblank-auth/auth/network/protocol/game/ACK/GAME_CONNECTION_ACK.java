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

public class GAME_CONNECTION_ACK extends GamePacketACK
{
	protected int sucess;
	public GAME_CONNECTION_ACK(int sucess)
	{
		super(true);
		this.sucess = sucess;
	}
	@Override
	public void writeImpl()
	{
		WriteD(sucess);
	}
}