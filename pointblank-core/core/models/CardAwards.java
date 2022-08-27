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

public class CardAwards
{
    public int id, card, insignia, medal, brooch, exp, gp;
    public CardAwards(int id, int card, int insignia, int medal, int brooch, int exp, int gp)
    {
        this.id = id;
        this.card = card;
        this.insignia = insignia;
        this.medal = medal;
        this.brooch = brooch;
        this.exp = exp;
        this.gp = gp;
    }
}