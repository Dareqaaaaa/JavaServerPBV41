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

public enum GamePacketIdACK
{
	GAME_CONNECTION_ACK(1),
	KICK_ACCOUNT_ACK(2),
	RECEIVE_PLAYER_CHANNEL_ACK(3);
	public int id;
	GamePacketIdACK(int id)
	{
		this.id = id;
	}
	public static int getOpcode(String packet)
	{
		GamePacketIdACK p = valueOf(packet);
		return p != null ? p.id : 0;
	}
}