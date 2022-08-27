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

import core.enums.*;

public class Clan
{
	public String name = "",
			notice = "",
			info = "",
			url = "";
	public int id,
			  rank,
			  logo = 0xFFFFFFFF,
			  color,
			  data,
			  partidas,
			  vitorias,
			  derrotas,
			  autoridade,
			  limite_rank,
			  limite_idade,
			  limite_idade2,
			  pontos = 1000, //Float.floatToIntBits(1000);
			  vagas = 50,
			  exp,
			  rating = 10000, //10000
			  top_rating;
    public long owner,
    		 player_vitorias,
    		 player_matou,
    		 player_headshots,
    		 player_exp,
    		 player_participacao;
    public boolean nuller = false;
	public volatile List<Player> membros = new ArrayList<Player>();
	public int countPlayers = -1;
	public Clan(int id, boolean nuller)
	{
		this.id = id;
		this.nuller = nuller;
	}
    public ClanUnit nivel()
    {
    	int count = 0;
    	if (countPlayers != -1) count = countPlayers;
    	else count = membros.size();
        if (count >= 250) return ClanUnit.CLAN_UNIT_CORPS;
        else if (count >= 200) return ClanUnit.CLAN_UNIT_DIVISION;
        else if (count >= 150) return ClanUnit.CLAN_UNIT_BRIGADE;
        else if (count >= 100) return ClanUnit.CLAN_UNIT_REGIMENT;
        else if (count >= 50) return ClanUnit.CLAN_UNIT_BATTALION;
        else if (count >= 30) return ClanUnit.CLAN_UNIT_COMPANY;
        else if (count >= 10) return ClanUnit.CLAN_UNIT_PLATOON;
        else return ClanUnit.CLAN_UNIT_SQUARD;
    }
}