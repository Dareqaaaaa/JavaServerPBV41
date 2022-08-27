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

import java.util.*;

public class EventVerification
{
	public int id;
	public int checks;
	public int inicio;
	public int termino;
	public String titulo;
	public boolean enable;
	public List<EventReward> items = new ArrayList<EventReward>();
	public List<EventGifts> gifts = new ArrayList<EventGifts>();
	public EventVerification()
	{
	}
	public EventGifts GIFT(int day)
	{
		for (EventGifts e : gifts)
			if (e.time == day)
				return e;
		return new EventGifts();
	}
}