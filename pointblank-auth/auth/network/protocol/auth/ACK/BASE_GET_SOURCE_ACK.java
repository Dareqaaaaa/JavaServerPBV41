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

public class BASE_GET_SOURCE_ACK extends auth.network.protocol.AuthPacketACK
{
	protected String data = "Feb 18 2018";
	protected String name = "DIST";
	protected String hora = "11:04:00";
	public BASE_GET_SOURCE_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(hora.length()); //8
		WriteB(new byte[] { 0x01, 0x05, 0x01, 0x00 });
		WriteH(15);
		WriteH(38);
		WriteH(23);
		WriteC(244);
		WriteC(3);
		WriteH(data.length() + 1);
		WriteC(name.length() + 1);
		WriteS(data, data.length() + 4);
		WriteS(hora, 23);
		WriteS(name, name.length() + 2);
	}
}