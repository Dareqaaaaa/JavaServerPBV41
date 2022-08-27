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

import auth.network.protocol.*;

public class BASE_GET_USER_GIFTLIST_ACK extends AuthPacketACK
{
	public BASE_GET_USER_GIFTLIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(date.getDateTime());
		WriteD(0);
		WriteD(0);
		WriteD(1);
		WriteD(0);
	}
}