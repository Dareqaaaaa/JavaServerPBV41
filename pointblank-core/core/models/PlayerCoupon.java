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

public class PlayerCoupon
{
	public int cor_mira;
	public int false_rank;
	public int cor_chat;
	public int bonus30;
	public int bonus50;
	public int bonus100;
	public int freepass;
	public int effects1;
	public int effects2;
	public int effects3;
	public int effects4;
	public int effects5;
	public String false_nick;
	public PlayerCoupon()
	{
		cor_mira = 0;
		false_rank = 55;
		false_nick = "";
		cor_chat = 0;
		bonus30 = 0;
		bonus50 = 0;
		bonus100 = 0;
		freepass = 0;
		effects1 = 0;
		effects2 = 0;
		effects3 = 0;
		effects4 = 0;
		effects5 = 0;
	}
}