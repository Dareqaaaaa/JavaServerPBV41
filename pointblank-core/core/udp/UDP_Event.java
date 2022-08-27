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

package core.udp;

public enum UDP_Event
{
	None(0),
    ActionState(0x01),
    Animation(0x02), //State
    PosRotate(0x04),
    UseObject(0x08),
    ActionForObjectSync(0x10),
    RadioChat(0x20),
    WeaponSync(0x40),
    ObjectStatus(0x100),
    Suicide(0x200),
    MissionDataForHost(0x400),
    DeathDataForClient(0x800),
    HpSync(0x1000),
    DropWeaponForClient(0x20000),
    GetWeapon(0x40000),
    FireDataOnObject(0x80000),
    HitData(0x200000),
    PosRotation2(0x8000000);
	//Events.ActionState | Events.Animation | Events.PosRotate; // 7
	//Events.PosRotate | Events.UseObject; // 12
	//Events.Animation | Events.PosRotate | Events.UseObject; // 14
	public int value;
	UDP_Event(int value)
	{
		this.value = value;
	}
	public static UDP_Event valueOf(int value)
	{
		for (UDP_Event e : values())
			if (e.value == value)
				return e;
		return None;
	}
}