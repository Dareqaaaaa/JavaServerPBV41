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

public enum FragValues 
{
	NONE(0),
	PIERCING_SHOT(1),
	MASS_KILL(2),
	CHAIN_STOPPER(4),
	HEADSHOT(8),
	CHAIN_HEADSHOT(16),
	CHAIN_SLUGGER(32),
	SUICIDE(64),
	OBJECT_DEFENCE(128),
	PIERCING_HEADSHOT(1),
	PIERCING_CHAIN_HEADSHOT(1),
	PIERCING_CHAIN_SLUGGER(1);
	public int value;
	FragValues(int value)
	{
		this.value = value;
	}
}