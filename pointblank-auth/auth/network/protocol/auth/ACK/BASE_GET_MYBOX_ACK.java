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

import core.enums.*;
import core.models.*;

public class BASE_GET_MYBOX_ACK extends auth.network.protocol.AuthPacketACK
{
	protected Player p;
	public BASE_GET_MYBOX_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
		WriteC(p.mensagens.size());
		for (PlayerMessage msg : p.mensagens)
		{
			WriteD(msg.object);
			WriteD(msg.object);
			WriteD(0);
			WriteC(msg.type.ordinal());
			WriteC(msg.readed.ordinal());
			WriteC(msg.dias);
			WriteD(msg.type.ordinal() > 3 ? (int)msg.owner_id : 0);
		}
		for (PlayerMessage msg : p.mensagens)
		{
			WriteC(msg.name.length() + 1);
			WriteC(msg.type.ordinal() == 5 || msg.type.ordinal() == 4 ? 0 : msg.texto.length() + 1);
			WriteS(msg.name, msg.name.length() + 1);
			if (msg.type.ordinal() == 5)
			{
	            WriteC(NoteReceive.PEDIDO_RECUSADO.ordinal());
	            WriteC(NoteReceive.PEDIDO_APROVADO.ordinal());
	            WriteC(NoteReceive.CONVITE.ordinal());
			}
			else if (msg.type.ordinal() == 4)
			{
				WriteC(msg.owner_name.length() + 1);
				WriteC(msg.receive.ordinal() + 1);
				WriteS(msg.owner_name, msg.owner_name.length());
			}
			else
			{
				WriteS(msg.texto, msg.texto.length() + 1);
			}
		}
	}
}