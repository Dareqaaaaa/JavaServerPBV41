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

package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_CHECK_LOGO_REQ extends game.network.protocol.GamePacketREQ
{
	protected int new_logo;
	protected int error;
	public CLAN_CHECK_LOGO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		new_logo = ReadD();
	}
	@Override
	public void runImpl()
	{
    	try
    	{
    		Player p = client.getPlayer();
    		if (p != null && p.clan_id != 0 && p.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
    		{
    			Clan c = ck.getClanId(p.clan_id);
    			if (c != null)
    			{
    				boolean result = ck.logoExist(new_logo);
    				if (new_logo == 0 || new_logo == 0xFFFFFFFF)
    					result = true;
    				if (!result)
    					result = db.logoExist(new_logo);
    				error = result ? 0x80001075 : 0;
    				if (error == 0)
    					p.clan_logo = new_logo;
    			}
    			else
    			{
    				error = 0x8000105B;
    			}
    		}
    		else
    		{
    			error = 0x80000000;
    		}
    	}
    	catch (Exception e)
    	{
    		error = 0x80001075;
    	}
		sendPacket(new CLAN_CHECK_LOGO_ACK(error));
	}
}