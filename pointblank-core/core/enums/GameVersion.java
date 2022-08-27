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

package core.enums;

public enum GameVersion
{
	AMERIKA(128, 11), //ct2.4
	FREYA(0); //ct2.5
	private int obfuscatorLength;
	private long[] protocols;
	GameVersion(int obfuscationLength, long... range)
	{
		obfuscatorLength = obfuscationLength;
		protocols = range;
	}
	public boolean isInRange(long val)
	{
		return isInArray(protocols, val);
	}
	public int getObfuscatorLength()
	{
		return obfuscatorLength;
	}
	public long[] getVersions()
	{
		return protocols;
	}
	public boolean isInArray(int[] array, int val)
	{
		if (array != null)
			for (int $ : array)
				if ($ == val)
					return true;
		return false;
	}
	public boolean isInArray(long[] array, long val)
	{
		if (array != null)
			for (long $ : array)
				if ($ == val)
					return true;
		return false;
	}
}