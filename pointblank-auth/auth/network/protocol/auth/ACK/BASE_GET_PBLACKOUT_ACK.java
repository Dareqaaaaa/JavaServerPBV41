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

public class BASE_GET_PBLACKOUT_ACK extends auth.network.protocol.AuthPacketACK
{
	public BASE_GET_PBLACKOUT_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteB(new byte[268]);
	}
}