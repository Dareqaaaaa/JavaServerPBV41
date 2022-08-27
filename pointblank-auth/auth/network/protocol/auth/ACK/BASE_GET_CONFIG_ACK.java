/*
 * Point Blank Emulador
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2016-2018
 */

package auth.network.protocol.auth.ACK;

import core.models.*;

public class BASE_GET_CONFIG_ACK extends auth.network.protocol.AuthPacketACK
{
	protected Player p;
	protected int error;
	public BASE_GET_CONFIG_ACK(Player p, int error)
	{
		super(true);
		this.p = p;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0)
		{
			WriteC(p.name.isEmpty() ? 1 : 0);
	        WriteH(p.config.sangue);
	        WriteC(p.config.mira);
	        WriteC(p.config.mao);
	        WriteD(p.config.config); 
	        WriteD(p.config.audio_enable);
	        WriteH(p.config.unk1);
	        WriteC(p.config.audio1);
	        WriteC(p.config.audio2);
	        WriteH(p.config.visao);       
	        WriteC(p.config.sensibilidade);
	        WriteC(p.config.mouse_invertido);
	        WriteH(p.config.unk2);
	        WriteC(p.config.msgConvite);
	        WriteC(p.config.chatSusurro);        
	        WriteC(p.config.macro);
	        WriteH(p.config.unk3);
	        WriteC(p.config.unk4);
	        WriteC(p.keyboard.k_valor5);
	        WriteC(p.keyboard.k_valor1);
	        WriteC(p.keyboard.k_valor2);
	        WriteC(p.keyboard.k_valor3);
	        WriteC(p.keyboard.k_valor4);
	        WriteC(p.mouse.k_type[1]);
	        WriteD(p.keyboard.k_esquerda);
	        WriteC(p.mouse.k_type[2]);
	        WriteD(p.keyboard.k_direita);
	        WriteC(p.mouse.k_type[3]);
	        WriteD(p.keyboard.k_frente);
	        WriteC(p.mouse.k_type[4]);
	        WriteD(p.keyboard.k_atras);
	        WriteC(p.mouse.k_type[5]);
	        WriteD(p.keyboard.k_pular);
	        WriteC(p.mouse.k_type[6]);
	        WriteD(p.keyboard.k_andar);
	        WriteC(p.mouse.k_type[7]);
	        WriteD(p.keyboard.k_agachar);
	        WriteC(p.mouse.k_type[8]);
	        WriteD(p.keyboard.k_o_atr);	        
	        WriteC(p.mouse.k_type[9]);
	        WriteD(p.keyboard.k_atirar);
	        WriteC(p.mouse.k_type[10]);
	        WriteD(p.keyboard.k_scope);	        
	        WriteC(p.mouse.k_type[11]);
	        WriteD(p.keyboard.k_recarregar);
	        WriteC(p.mouse.k_type[12]);
	        WriteD(p.keyboard.k_trc_arm);
	        WriteC(p.mouse.k_type[13]);
	        WriteD(p.keyboard.armas1);
	        WriteC(p.mouse.k_type[14]);
	        WriteD(p.keyboard.armas2);
	        WriteC(p.mouse.k_type[15]);
	        WriteD(p.keyboard.armas3);
	        WriteC(p.mouse.k_type[16]);
	        WriteD(p.keyboard.armas4);
	        WriteC(p.mouse.k_type[17]);
	        WriteD(p.keyboard.armas5);
	        WriteC(p.mouse.k_type[18]);
	        WriteD(p.keyboard.armas6);
	        WriteC(p.mouse.k_type[19]);
	        WriteD(p.keyboard.k_arm_qq);        
	        WriteD(p.mouse.k_type[20]);
	        WriteC(p.keyboard.k_arm_ant);
	        WriteD(p.mouse.k_type[21]);
	        WriteC(p.keyboard.k_arm_pos);	        
	        WriteC(p.mouse.k_type[22]);
	        WriteD(p.keyboard.k_jog_arm);
	        WriteC(p.mouse.k_type[23]);
	        WriteD(p.keyboard.k_placar);
	        WriteC(p.mouse.k_type[24]);
	        WriteD(p.keyboard.k_mapa);
	        WriteC(p.mouse.k_type[25]);
	        WriteD(p.keyboard.k_mapa_pos);
	        WriteC(p.mouse.k_type[26]);
	        WriteD(p.keyboard.k_mapa_ant);
	        WriteC(p.mouse.k_type[27]);
	        WriteD(p.keyboard.k_chat);
	        WriteC(p.mouse.k_type[28]);
	        WriteD(p.keyboard.k_chat_g);
	        WriteC(p.mouse.k_type[29]);
	        WriteD(p.keyboard.k_chat_t);
	        WriteC(p.mouse.k_type[30]);
	        WriteD(p.keyboard.k_chat_hz);
	        WriteC(p.mouse.k_type[31]);
	        WriteD(p.keyboard.k_chat_v);
	        WriteC(p.mouse.k_type[32]);
	        WriteD(p.keyboard.k_rad_t);
	        WriteC(p.mouse.k_type[33]);
	        WriteD(p.keyboard.k_rad_p);
	        WriteC(p.mouse.k_type[34]);
	        WriteD(p.keyboard.k_rad_i);
	        WriteC(p.mouse.k_type[35]);
	        WriteD(p.keyboard.k_bomb_d);
	        WriteC(p.mouse.k_type[36]);
	        WriteD(p.keyboard.k_sen_pos);
	        WriteC(p.mouse.k_type[37]);
	        WriteD(p.keyboard.k_sen_ant);
	        WriteC(p.mouse.k_type[38]);
	        WriteD(p.keyboard.k_print);
	        WriteC(p.mouse.k_type[39]);
	        WriteD(p.keyboard.k_chat_c);
	        WriteC(p.mouse.k_type[40]);
	        WriteD(p.keyboard.k_mira_x);
	        WriteC(p.mouse.k_type[41]);
	        WriteD(p.keyboard.k_gravar);
	        WriteC(p.mouse.k_type[42]);
	        WriteD((int)p.keyboard.k_max_value);
	        WriteC(p.mouse.k_type[43]);
	        WriteD(p.keyboard.k_macro_e);	        
	        WriteC(p.keyboard.macro1.length() + 1);
	        WriteT(p.keyboard.macro1, p.keyboard.macro1.length() + 1);
	        WriteC(p.keyboard.macro2.length() + 1);
	        WriteT(p.keyboard.macro2, p.keyboard.macro2.length() + 1);
	        WriteC(p.keyboard.macro3.length() + 1);
	        WriteT(p.keyboard.macro3, p.keyboard.macro3.length() + 1);
	        WriteC(p.keyboard.macro4.length() + 1);
	        WriteT(p.keyboard.macro4, p.keyboard.macro4.length() + 1);
	        WriteC(p.keyboard.macro5.length() + 1);
	        WriteT(p.keyboard.macro5, p.keyboard.macro5.length() + 1);
		}
	}
}