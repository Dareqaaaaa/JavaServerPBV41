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

package core.models;

public class PlayerMission
{
	public int[] mission1 = new int[41];
	public int[] mission2 = new int[41];
	public int[] mission3 = new int[41];
	public int[] mission4 = new int[41];
	public int card1, card2, card3, card4;
    public int active;
    public PlayerMission()
    {
		for (int i = 1; i < 41; i++)
		{
			mission1[i] = 0;
			mission2[i] = 0;
			mission3[i] = 0;
			mission4[i] = 0;
		}
		card1 = 0;
		card2 = 0;
		card3 = 0;
		card4 = 0;
		active = 0;
    }
}