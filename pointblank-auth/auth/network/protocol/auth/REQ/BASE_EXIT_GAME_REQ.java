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

import auth.network.protocol.auth.ACK.*;

public class BASE_EXIT_GAME_REQ extends auth.network.protocol.AuthPacketREQ
{
	public BASE_EXIT_GAME_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		client.VERIFICAR_CONTA_ONLINE();
		sendPacket(new BASE_EXIT_GAME_ACK());
	}
}