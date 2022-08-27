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

import core.models.*;
import core.xml.*;

public class BASE_GET_RANKINFO_ACK extends auth.network.protocol.AuthPacketACK
{
	public BASE_GET_RANKINFO_ACK()
	{
		super(true); //2669
	}
	@Override
	public void writeImpl()
	{
		for (RankInfo r : RankXML.gI().ranks)
		{
			WriteC(r.id);
			for (int itemId : r.gifts)
				WriteD(itemId); //1500000000
		}
	}
}