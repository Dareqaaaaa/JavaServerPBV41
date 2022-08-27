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

package core.log;

import java.io.*;

import core.utils.*;

public class Logger
{
	protected static final Logger INSTANCE = new Logger();
	protected final String date = DateTimeUtil.gI().toDate("yyyy-MM-dd--HH-mm-ss");
	public Logger()
	{
	}
	public static Logger gI()
	{
		return INSTANCE;
	}
	public void info(String pasta, Throwable cause, String texto, Class<?> classe)
	{
		try
		{
			File file = new File("log/" + pasta + "//");
			if (!file.exists())
				file.mkdirs();
			if (cause != null)
				texto = cause.toString() + " | " + cause.getStackTrace().toString() + " | " + cause.getLocalizedMessage();
			FileWriter fw = new FileWriter("log/" + pasta + "//" + (date + "-" + classe.getSimpleName()) + ".txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(texto);
			bw.newLine();
			bw.flush();
			bw.close();
			fw.flush();
			fw.close();
		}
		catch (IOException e)
		{
		}
	}
}