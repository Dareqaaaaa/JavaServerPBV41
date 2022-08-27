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

package core.utils;

import java.text.*;
import java.util.*;

public class DateTimeUtil
{
	protected static final DateTimeUtil INSTANCE = new DateTimeUtil();
	protected SimpleDateFormat format = new SimpleDateFormat("yyMMddHHmm");
	protected SimpleDateFormat hour = new SimpleDateFormat("dd");
	protected SimpleDateFormat minute = new SimpleDateFormat("HH");
	protected SimpleDateFormat clanDate = new SimpleDateFormat("yyyyMMdd");
	protected SimpleDateFormat playTime = new SimpleDateFormat("ddHHmm");
	protected SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	protected SimpleDateFormat normal = new SimpleDateFormat("yyyy/MM/dd | HH:mm:ss");
	protected SimpleDateFormat normal2 = new SimpleDateFormat("yyyy/MM/dd - HH:mm");
	protected SimpleDateFormat evento = new SimpleDateFormat("HH:mm:ss");
	protected SimpleDateFormat imbox = new SimpleDateFormat("yyMMdd");
	protected SimpleDateFormat sfp = new SimpleDateFormat("dd/MM/yyyy");
	public DateTimeUtil()
	{	
	}
	public static DateTimeUtil gI()
	{
		return INSTANCE;
	}
	public int getDateTime()
	{
		return getDateTime(0);
	}
	public int getDateIncDate(String oldDate, int addDays)
	{
		/*int year = Integer.parseInt(oldDate.substring(0, 2)),
				month = Integer.parseInt(oldDate.substring(2, 4)),
				day = Integer.parseInt(oldDate.substring(4, 6)),
				hour = Integer.parseInt(oldDate.substring(6, 8)),
				minute = Integer.parseInt(oldDate.substring(8, 10));*/
		Calendar cal = Calendar.getInstance();
		//cal.setTime(new Date(year, month, day, hour, minute, 0));
		//cal.set(year, month, day, hour, minute);
		try
		{
			cal.setTime(getDateFromString(oldDate));
		}
		catch (ParseException e)
		{
			try
			{
				cal.setTime(getDateFromString(oldDate));
			}
			catch (ParseException ex)
			{
			}
		}
		cal.add(Calendar.DAY_OF_MONTH, addDays);
		return Integer.parseInt(format.format(cal.getTime()));
	}
	public String toDate(String type)
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 0);
		return new SimpleDateFormat(type).format(cal.getTime());
	}
	public String convertTime(Integer oldDate)
	{
		Calendar cal = Calendar.getInstance();
		try
		{
			cal.setTime(getDateFromString(String.valueOf(oldDate)));
		}
		catch (ParseException e)
		{
		}
		cal.add(Calendar.DATE, 0);
		return normal2.format(cal.getTime());
	}
	public int getTimeFromDateM(int date)
	{
		Calendar cal = Calendar.getInstance();
		try
		{
			cal.setTime(getDateFromString(String.valueOf(date)));
		}
		catch (ParseException e)
		{
		}
		cal.add(Calendar.DATE, 0);
		return Integer.parseInt(imbox.format(cal.getTime()));
	}
	public int getTimeFromDateH(int date)
	{
		Calendar cal = Calendar.getInstance();
		try
		{
			cal.setTime(getDateFromStringBox(String.valueOf(date)));
		}
		catch (ParseException e)
		{
		}
		cal.add(Calendar.DATE, -getHourTime(0));
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	public int getTimeFromDateD(int addDays)
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(imbox.format(cal.getTime()));
	}
	public int getDateTime(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(format.format(cal.getTime()));
	}
	public Date getTimeHasPlay() throws ParseException 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 0);
		return format.parse(format.format(cal.getTime()));
	}
	public int getHourNow(int addHours) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR, addHours);
		return Integer.parseInt(format.format(cal.getTime()));
	}
	public int getMinutesNow(int addMinutes) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, addMinutes);
		return Integer.parseInt(format.format(cal.getTime()));
	}
	public int getDateTimeK(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(imbox.format(cal.getTime()));
	}
	public String getDateTimeKS(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return imbox.format(cal.getTime());
	}
	public Date getDateTimeP(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return cal.getTime();
	}
	public int getMinuteTime(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(minute.format(cal.getTime()));
	}
	public int getHourTime(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(hour.format(cal.getTime()));
	}
	public int getHourTimeH(int date, int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		try
		{
			cal.setTime(getDateFromStringBox(String.valueOf(date)));
		}
		catch (ParseException e)
		{
		}
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(hour.format(cal.getTime()));
	}
	public int getYearMouthDay(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(imbox.format(cal.getTime()));
	}
	public int getEventTime(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(evento.format(cal.getTime()));
	}
	public int getClanTime()
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 0);
		return Integer.parseInt(clanDate.format(cal.getTime()));
	}
	public int getPlayedTime(int add)
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, add);
		return Integer.parseInt(playTime.format(cal.getTime()));
	}
	public String getDateTimeBan(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return format2.format(cal.getTime());
	}
	public String getDateNormal(int addDays) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return normal.format(cal.getTime());
	}
	public int getDateTime(Date date)
	{
		return Integer.parseInt(format.format(date.getTime()));
	}
	public int getDateTime(SimpleDateFormat formatter) 
	{
		return getDateTime(0, formatter);
	}
	public int getDateTime(int addDays, SimpleDateFormat formatter) 
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, addDays);
		return Integer.parseInt(formatter.format(cal.getTime()));
	}
	public int getDateTime(Date date, SimpleDateFormat formatter)
	{
		return Integer.parseInt(formatter.format(date.getTime()));
	}
	public Date geDateFromString(String date, SimpleDateFormat formatter) throws ParseException
	{
		return formatter.parse(date);
	}
	public Date getDatePlayTimeString(String date) throws ParseException
	{
		return playTime.parse(date);
	}
	public Date getDateFromStringBox(String date) throws ParseException
	{
		return imbox.parse(date);
	}
	public Date getDateFromString(String date) throws ParseException
	{
		return format.parse(date);
	}
}