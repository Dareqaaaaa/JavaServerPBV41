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

public enum CommState
{
	NADA(0),
	CONVITE1(16 + 2),
	CONVITE2(32),
	OFFLINE(48),
	AGUARDANDO(64),
	ONLINE(80),
	SALA(96);
	public int value;
	CommState(int value)
	{
		this.value = value;
	}
	public static CommState valueOf(int value)
	{
		for (CommState pR : values())
			if (pR.value == value)
				return pR;
		return OFFLINE;
	}
}