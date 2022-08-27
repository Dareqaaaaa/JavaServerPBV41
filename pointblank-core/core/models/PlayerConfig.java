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

public class PlayerConfig
{
	public int mira;
    public int audio1;
    public int audio2;
    public int sensibilidade;
    public int visao;
    public int sangue;
    public int mao;
    public int audio_enable;
    public int config;
    public int mouse_invertido;
    public int msgConvite;
    public int chatSusurro;
    public int macro;
    public int unk1;
    public int unk2;
    public int unk3;
    public int unk4;
	public PlayerConfig()
	{
		mira = 1;
		audio1 = 100;
		audio2 = 60;
		sensibilidade = 50;
        visao = 70;
        sangue = 1;
        mao = 0;
        audio_enable = 7;
        config = 55;
        mouse_invertido = 0;
        msgConvite = 0;
        chatSusurro = 0;
        macro = 0;
        unk1 = 0;
        unk2 = 0;
        unk3 = 0;
        unk4 = 0;
	}
}