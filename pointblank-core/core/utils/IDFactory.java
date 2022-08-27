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

import java.util.*;
import java.util.concurrent.locks.*;

public class IDFactory
{
	protected static final IDFactory INSTANCE = new IDFactory();
	protected final BitSet idList = new BitSet();
	protected final ReentrantLock lock = new ReentrantLock();
	protected volatile int nextMinId = 0;
	protected IDFactory()
	{
		idList.set(0);
	}
	public static final IDFactory gI()
	{
		return INSTANCE;
	}
	public int nextId()
	{
		int id = 0;
		try
		{
			lock.lock();
			if (nextMinId == Integer.MIN_VALUE)
				id = Integer.MIN_VALUE;
			else
				id = idList.nextClearBit(nextMinId);
			idList.set(id);
			nextMinId = id + 1;
		}
		finally
		{
			lock.unlock();
		}
		return id;
	}
	public void releaseId(int id)
	{
		try
		{
			lock.lock();
			if (idList.get(id))
			{
				idList.clear(id);
				if (id < nextMinId || nextMinId == Integer.MIN_VALUE)
					nextMinId = id;
			}
		} 
		finally
		{
			lock.unlock();
		}
	}
}