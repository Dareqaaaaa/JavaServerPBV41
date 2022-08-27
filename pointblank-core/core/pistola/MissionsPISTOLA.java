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

package core.pistola;

import java.io.*;
import java.util.*;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class MissionsPISTOLA extends BinaryEncrypt
{
	protected static final MissionsPISTOLA INSTANCE = new MissionsPISTOLA();
	protected List<CardAwards> cardsReward = new ArrayList<CardAwards>();
	protected List<MissionAwards> missionReward = new ArrayList<MissionAwards>();
	protected List<CardsList> cardsList = new ArrayList<CardsList>();
	protected List<Card> cards = new ArrayList<Card>();
    public int missionList;
	public MissionsPISTOLA()
	{
		super("data/package/cards.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static MissionsPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeAward = br.ReadD();
		int sizeReward = br.ReadD();
		int sizeList = br.ReadD();
		int sizeMission = br.ReadD();
		for (int i = 0; i < sizeAward; i++)
			cardsReward.add(new CardAwards(br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD()));
		for (int i = 0; i < sizeReward; i++)
			missionReward.add(new MissionAwards(br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD(),
					br.ReadD()));
		br.ReadB(sizeList * 16);
		for (int i = 0; i < sizeMission; i++)
		{
			int cardIdx = br.ReadD();
			int sizeCards = br.ReadD();
			for (int j = 0; j < sizeCards; j++)
			{
				Card c = new Card();
				c.id = br.ReadD();
				c.limit = br.ReadD();
				c.mission_id = br.ReadD();
				c.type = MissionType.values()[br.ReadD()];
				c.cardIdx = cardIdx;
				cards.add(c);
			}
		}
		for (CardsEnum enums : CardsEnum.values())
		{
			cardsList.add(new CardsList(enums.id, enums.gold));
			missionList += 1 << enums.id;
		}
		close();
	}
	public int BUY_CARD(int mission_id)
	{
		for (CardsList c : cardsList)
			if (c.id == mission_id)
				return c.buy;
		return 0;
	}
	public int getCard(int mission, int card, int[] list)
	{
	    int value = 0;
	    for (Card c : getCardsToId(mission, card))
        	if (list[getValue(c.id, c.mission_id)] >= c.limit)
        		value |= (0x0f << 4 * c.mission_id);
	    return value;
	}
	public List<Card> getCards(int cardIdx)
    {
		List<Card> list = new ArrayList<Card>();
		for (Card c : cards)
			if (c.cardIdx == cardIdx)
				list.add(c);
		return list;
    }
	public List<Card> getCardsToId(int cardIdx, int id)
    {
		List<Card> list = new ArrayList<Card>();
		for (Card c : cards)
			if (c.id == id && c.cardIdx == cardIdx)
				list.add(c);
		return list;
    }
	public List<CardAwards> getCardAwards(int mission, int cartao)
    {
         List<CardAwards> list = new ArrayList<CardAwards>();       
         for (CardAwards c : cardsReward)
             if (c.id == mission && c.card == cartao)
            	 list.add(c);
         return list;
    }
	public List<MissionAwards> getMissionAwards(int id)
	{
		List<MissionAwards> list = new ArrayList<MissionAwards>();
		for (MissionAwards m : missionReward)
			if (m.id == id)
				list.add(m);
		return list;
	}
	public int getValue(int cId, int cMId)
    {
        if (cId == 0 && cMId == 0) return 1;
        else if (cId == 0 && cMId == 1) return 2;
        else if (cId == 0 && cMId == 2) return 3;
        else if (cId == 0 && cMId == 3) return 4;
        else if (cId == 1 && cMId == 0) return 5;
        else if (cId == 1 && cMId == 1) return 6;
        else if (cId == 1 && cMId == 2) return 7;
        else if (cId == 1 && cMId == 3) return 8;
        else if (cId == 2 && cMId == 0) return 9;
        else if (cId == 2 && cMId == 1) return 10;
        else if (cId == 2 && cMId == 2) return 11;
        else if (cId == 2 && cMId == 3) return 12;
        else if (cId == 3 && cMId == 0) return 13;
        else if (cId == 3 && cMId == 1) return 14;
        else if (cId == 3 && cMId == 2) return 15;
        else if (cId == 3 && cMId == 3) return 16;
        else if (cId == 4 && cMId == 0) return 17;
        else if (cId == 4 && cMId == 1) return 18;
        else if (cId == 4 && cMId == 2) return 19;
        else if (cId == 4 && cMId == 3) return 20;
        else if (cId == 5 && cMId == 0) return 21;
        else if (cId == 5 && cMId == 1) return 22;
        else if (cId == 5 && cMId == 2) return 23;
        else if (cId == 5 && cMId == 3) return 24;
        else if (cId == 6 && cMId == 0) return 25;
        else if (cId == 6 && cMId == 1) return 26;
        else if (cId == 6 && cMId == 2) return 27;
        else if (cId == 6 && cMId == 3) return 28;
        else if (cId == 7 && cMId == 0) return 29;
        else if (cId == 7 && cMId == 1) return 30;
        else if (cId == 7 && cMId == 2) return 31;
        else if (cId == 7 && cMId == 3) return 32;
        else if (cId == 8 && cMId == 0) return 33;
        else if (cId == 8 && cMId == 1) return 34;
        else if (cId == 8 && cMId == 2) return 35;
        else if (cId == 8 && cMId == 3) return 36;
        else if (cId == 9 && cMId == 0) return 37;
        else if (cId == 9 && cMId == 1) return 38;
        else if (cId == 9 && cMId == 2) return 39;
        else if (cId == 9 && cMId == 3) return 40;
        return 0;
    }
}