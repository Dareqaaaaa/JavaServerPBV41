/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package battle;

import java.awt.*;

import core.info.*;
import core.system.*;
import core.thread.*;
import core.utils.*;
import core.xml.MapsLocalXML;
import battle.controllers.*;
import battle.network.protocol.*;

/**
 * 
 * @author Henrique
 *
 */

public class Program extends core.sql.InterfaceSQL
{
	protected static final long startTime = System.currentTimeMillis();
	protected static final String key = EmailFactory.generateCode();
	protected static String passwd = "";
	public static boolean debug = false;
	public static void main(String[] args)
	{
		try
		{
			Software.printIntro(key, "UDP", Color.GREEN);
			ConnectionLoader.gI();
			ThreadPoolManager.gI();
			RoomController.gI();
			MapsLocalXML.gI().LOAD();
			BattlePacketHAK.gI();
			Software.MEMORY("UDP");
			Socket.start();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			error(Program.class, e);
			System.out.println(" Erro fatal. Check log files!!! ");
			System.out.flush();
		}
	}
}