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

public class BASE_GET_LOGIN_ERROR_ACK extends auth.network.protocol.AuthPacketACK
{
	protected int error;
	public BASE_GET_LOGIN_ERROR_ACK(int error)
	{
		super(true);
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteB(new byte[] { 0x67, (byte) 0xD4, (byte) 0x90, 0x18 });
		WriteD(error);
		WriteD(0);
	}
}