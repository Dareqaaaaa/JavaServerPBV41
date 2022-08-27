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

public class BASE_GET_MYCASH_ACK extends auth.network.protocol.AuthPacketACK
{
	protected int gold;
	protected int cash;
	public BASE_GET_MYCASH_ACK(int gold, int cash)
	{
		super(true);
		this.gold = gold;
		this.cash = cash;
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteD(gold);
		WriteD(cash);
	}
}