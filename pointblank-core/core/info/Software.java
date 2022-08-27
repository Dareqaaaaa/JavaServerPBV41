/*
1 * PointBlank Java Server
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

package core.info;

import java.awt.*;
import java.io.*;
import java.lang.management.*;
import java.security.*;

import core.models.*;
import core.utils.*;
import enigma.console.Console;
import enigma.console.TextAttributes;
import enigma.core.*;

public class Software
{
	public static String enviroment;
	public static String build;
	public static String client;
	public static String text = "";
	public static int rev;
	public static long packages;
	public static User pc;
	public static Console console;
	static
	{
		client = "?";
		build = "90.1804151919";
		console = Enigma.getConsole();
		System.setErr(console.getOutputStream());
		System.setOut(console.getOutputStream());
		System.setIn(console.getInputStream());
	}
	public static void setColor(Color fore, Color back)
	{
		try
		{
			TextAttributes text = new TextAttributes(fore, back);
			console.setTextAttributes(text);
		}
		catch (Exception e)
		{
		}
	}
	public static void printIntro(String key, String type, Color back) throws NoSuchAlgorithmException, UnsupportedEncodingException, InterruptedException
	{
		console.setTitle("Point Blank " + type + " [Build: " + build + "] [" + client + "] [0 KB]");
		setColor(Color.WHITE, Color.BLACK);
		enviroment = "@" + build + "close ";
		System.out.print(" User: ");
		String user = "localhost1";
		System.out.print(" Pass: ");
		String pass = "localhost1";
		pc = ListUser.gI().AUTHENTICATION(user, pass);
		if (pc != null)
		{
			client = pc.client;
			rev = pc.revision;
			console.setTitle("Point Blank " + type + " [Build: " + build + "] [" + client + "] [0 KB]");
			System.out.println(" Point Blank: Copyright 2018 Zepetto Co. All rights reserved.");
			EmailFactory.openWebpage(false, "www.facebook.com/eoqhenrqu");
			setColor(back, Color.BLACK);
            System.out.println("               ________  _____  __      ______ _______          ");
            System.out.println("              / ____/  |/  / / / /     / /  / / /  / /          ");
            System.out.println("             / __/ / /|_/ / / / /     / /__/_/ /__/ /           ");
            System.out.println("            / /___/ /  / / /_/ / _   / /    / /  / /            ");
            System.out.println("           /_____/_/  /_/\'____/ /_/ /_/    /_/__/_/             ");
            System.out.println();
			System.out.flush();
			setColor(Color.WHITE, Color.BLACK);
		}
		else
		{
			System.out.println(" User not founded.");
			Thread.sleep(1000);
			System.exit(0);
		}
	}
	public static void MEMORY(String type)
	{
		//getJavaRuntime();
		com.sun.management.OperatingSystemMXBean mxbean = (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();

		String freeMemory = String.valueOf(((mxbean.getFreePhysicalMemorySize() / 1024) / 1024));
		//String freeMemory = String.format("%s", String.valueOf(Integer.parseInt(getMemoryMaxMb().replace("MB", "")) - Integer.parseInt(getMemoryUsedMb().replace("MB", ""))));
		
		console.setTitle("Point Blank " + type + " [Build: " + build + "] [" + client + "] [" + freeMemory + " KB] Monitoring...");
	}


	/*public static void getJavaRuntime()
	{
		OperatingSystemMXBean osbean = ManagementFactory.getOperatingSystemMXBean();
		RuntimeMXBean runbean = ManagementFactory.getRuntimeMXBean();
		int nCPUs = osbean.getAvailableProcessors();
		long prevUpTime = runbean.getUptime();
		long prevProcessCpuTime = ((com.sun.management.OperatingSystemMXBean) osbean).getProcessCpuTime();
		try
		{
		   Thread.sleep(500);
		}
		catch (Exception e)
		{
		}
		osbean = ManagementFactory.getOperatingSystemMXBean();
		upTime = runbean.getUptime();
		long processCpuTime = ((com.sun.management.OperatingSystemMXBean) osbean).getProcessCpuTime();
		if (prevUpTime > 0L && upTime > prevUpTime)
		{
			long elapsedCpu = processCpuTime - prevProcessCpuTime;
			long elapsedTime = upTime - prevUpTime;
			javacpu = Math.min(99F, elapsedCpu / (elapsedTime * 10000F * nCPUs));
		}
		else
		{
			javacpu = 0.001;
		}
		upTime = runbean.getUptime();
	}*/
	public static double getMemoryUsagePercent()
	{
		MemoryUsage heapMemoryUsage = ManagementFactory.getMemoryMXBean().getHeapMemoryUsage();
		return 100.0F * (float) heapMemoryUsage.getUsed() / (float) heapMemoryUsage.getMax();
	}
	public static double getMemoryFreePercent()
	{
		return 100.0D - getMemoryUsagePercent();
	}
	public static String getMemoryMaxMb()
	{
		return getMemoryMax() / 1048576L + "MB";
	}
	public static String getMemoryUsedMb()
	{
		return getMemoryUsed() / 1048576L + "MB";
	}
	public static long getMemoryMax()
	{
		return ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax();
	}
	public static long getMemoryUsed()
	{
		return ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed();
	}
}