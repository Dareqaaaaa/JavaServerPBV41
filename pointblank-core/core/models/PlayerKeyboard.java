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

public class PlayerKeyboard
{
    public int k_esquerda;
    public int k_direita;
    public int k_frente;
    public int k_atras;
    public int k_pular;
    public int k_andar;
    public int k_agachar;
    public int k_o_atr;
    public int k_atirar;
    public int k_scope;
    public int k_recarregar;
    public int k_trc_arm;
    public int k_arm_qq;
    public int k_arm_ant;
    public int k_arm_pos;
    public int k_jog_arm;
    public int k_placar;
    public int k_mapa;
    public int k_mapa_pos;
    public int k_mapa_ant;
    public int k_chat;
    public int k_chat_g;
    public int k_chat_t;
    public int k_chat_hz;
    public int k_chat_v;
    public int k_chat_c;
    public int k_rad_t;
    public int k_rad_p;
    public int k_rad_i;
    public int k_bomb_d;
    public int k_sen_pos;
    public int k_sen_ant;
    public int k_print;
    public int k_mira_x;
    public int k_gravar;
    public int k_macro_e;
    public int k_valor1, k_valor2, k_valor3, k_valor4, k_valor5;
    public long k_max_value;
    public int armas1, armas2, armas3, armas4, armas5, armas6;
    public String macro1, macro2, macro3, macro4, macro5;
	public PlayerKeyboard()
	{
        k_max_value = 0xFFFFFFFF;
        k_agachar = 38; //CTRL
        k_andar = 40; //SHIFT
        k_pular = 44; //SPACE
        k_atras = 28; //S
        k_frente = 32; //W
        k_direita = 13; //D
        k_esquerda = 10; //A
        k_o_atr = 15; //F
        k_atirar = 1; //BOTAO ESQUERDO
        k_scope = 2; //BOTAO DIREITO
        k_recarregar = 27; //R
        k_trc_arm = 29; //T
        armas1 = 1; //NÚMEROS
        armas2 = 2; //NÚMEROS
        armas3 = 3; //NÚMEROS
        armas4 = 4; //NÚMEROS
        armas5 = 5; //NÚMEROS
        armas6 = 6; //NÚMEROS
        k_arm_qq = 26; //Q
        k_arm_ant = 16; //ROLAGEM DO MOUSE PRA CIMA
        k_arm_pos = 32; //ROLAGEM DO MOUSE PRA BAIXO
        k_jog_arm = 16; //????
        k_placar = 55; //TAB
        k_mapa = 22; //M
        k_mapa_pos = 92; //=
        k_mapa_ant = 91; //-
        k_chat = 37; //ENTER
        k_chat_g = 64; //F2
        k_chat_t = 65; //F3
        k_chat_hz = 21; //L
        k_chat_v = 31; //?
        k_rad_t = 35; //Z
        k_rad_p = 33; //X
        k_rad_i = 12; //C
        k_bomb_d = 14; //E
        k_sen_pos = 49; //PAGE UP
        k_sen_ant = 50; //PAGE DOWN
        k_print = 70; //F8
        k_chat_c = 66; //F4
        k_mira_x = 11; //B
        k_gravar = 58; //SCROLL LOCK
        k_macro_e = 69; //E?
        k_valor1 = 57;
        k_valor2 = 248;
        k_valor3 = 16;
        k_valor4 = 0;
        k_valor5 = 232;
		macro1 = "";
        macro2 = "";
        macro3 = "";
        macro4 = "";
        macro5 = "";
	}
}