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

import java.util.*;

public class BASE_GET_URL_LIST_ACK extends auth.network.protocol.AuthPacketACK
{
	protected List<URL> list = new ArrayList<URL>();
	public BASE_GET_URL_LIST_ACK()
	{
		super(true);
		//list.add(new URL(1, 5, "http://www.facebook.com/eoqhenrqu"));
	}
	@Override
	public void writeImpl()
	{
		WriteC(list.size() > 0 ? 14 : 0);
		if (list.size() > 0)
		{
			WriteC(list.size());
			for (URL site : list)
			{
				WriteH(site.url.length());
				WriteD(site.enable);
				WriteD(site.value);
				WriteT(site.url, site.url.length());
			}
		}
		list = null;
	}
	class URL
	{
		public int enable;
		public int value;
		public String url;
		public URL(int enable, int value, String url)
		{
			this.enable = enable;
			this.value = value;
			this.url = url;
		}
	}
}