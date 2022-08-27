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

package auth.network.protocol.auth.REQ;

import core.log.*;
import core.models.*;
import core.utils.*;

public class BASE_GET_CONFIG_UPDATE_REQ extends auth.network.protocol.AuthPacketREQ
{
	protected Player player;
	protected int type;
	public BASE_GET_CONFIG_UPDATE_REQ(int opcode) 
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		player = client.player;
		if (player != null)
		{
			if (buf.readableBytes() >= 4)
			{
				type = ReadC();
				ReadB(3);
				switch (type)
				{
					case 1:
					{
						CONFIG(buf.readableBytes()); //28
						break;
					}
					case 2:
					{
						KEYBOARD(buf.readableBytes()); //220
						break;
					}
					case 3:
					{
						CONFIG(buf.readableBytes()); //248
				        KEYBOARD(buf.readableBytes()); //220
						break;
					}
					case 5:
					{
						CONFIG(buf.readableBytes()); //33
				        MACRO(buf.readableBytes()); //5
						break;
					}
					case 7:
					{
						CONFIG(buf.readableBytes()); //253
				        KEYBOARD(buf.readableBytes()); //225
						MACRO(buf.readableBytes()); //5
						break;
					}
					default:
					{
						Logger.gI().info("error", null, NetworkUtil.printData(String.format(" Config Type not founded: " + type + " : 0x%02X [int: %d]", opcode, opcode), buf), getClass());
						break;
					}
				}
			}
		}
	}
	public void CONFIG(int length)
	{
		if (buf.readableBytes() == length)
		{
			player.config.sangue = ReadH();
			player.config.mira = ReadC();
			player.config.mao = ReadC();
			player.config.config = ReadD();
			player.config.audio_enable = ReadD();
	        player.config.unk1 = ReadH();
	        player.config.audio1 = ReadC();
	        player.config.audio2 = ReadC();
	        player.config.visao = ReadH();
	        player.config.sensibilidade = ReadC();
	        player.config.mouse_invertido = ReadC();
	        player.config.unk2 = ReadH();
	        player.config.msgConvite = ReadC();
	        player.config.chatSusurro = ReadC();
	        player.config.macro = ReadC();
	        player.config.unk3 = ReadH();
	        player.config.unk4 = ReadC();
			db.updateConfig(player, player.config);
		}
	}
	public void KEYBOARD(int length)
	{
		if (buf.readableBytes() == length)
		{
	        player.keyboard.k_valor5 = ReadC();
	        player.keyboard.k_valor1 = ReadC();
			player.keyboard.k_valor2 = ReadC();
			player.keyboard.k_valor3 = ReadC();
			player.keyboard.k_valor4 = ReadC();
			player.mouse.k_type[1] = ReadC();
			player.keyboard.k_esquerda = ReadD();
			player.mouse.k_type[2] = ReadC();
			player.keyboard.k_direita = ReadD();
			player.mouse.k_type[3] = ReadC();
			player.keyboard.k_frente = ReadD();
			player.mouse.k_type[4] = ReadC();
			player.keyboard.k_atras = ReadD();
			player.mouse.k_type[5] = ReadC();
			player.keyboard.k_pular = ReadD();
			player.mouse.k_type[6] = ReadC();
			player.keyboard.k_andar = ReadD();
			player.mouse.k_type[7] = ReadC();
			player.keyboard.k_agachar = ReadD();
			player.mouse.k_type[8] = ReadC();
			player.keyboard.k_o_atr = ReadD();
			player.mouse.k_type[9] = ReadC();
			player.keyboard.k_atirar = ReadD();
			player.mouse.k_type[10] = ReadC();
			player.keyboard.k_scope = ReadD();
			player.mouse.k_type[11] = ReadC();
			player.keyboard.k_recarregar = ReadD();
			player.mouse.k_type[12] = ReadC();
			player.keyboard.k_trc_arm = ReadD();
			player.mouse.k_type[13] = ReadC();		
			player.keyboard.armas1 = ReadD();
			player.mouse.k_type[14] = ReadC();
			player.keyboard.armas2 = ReadD();
			player.mouse.k_type[15] = ReadC();
			player.keyboard.armas3 = ReadD();
			player.mouse.k_type[16] = ReadC();
			player.keyboard.armas4 = ReadD();
			player.mouse.k_type[17] = ReadC();
			player.keyboard.armas5 = ReadD();
			player.mouse.k_type[18] = ReadC();
			player.keyboard.armas6 = ReadD();	
			player.mouse.k_type[19] = ReadC();
			player.keyboard.k_arm_qq = ReadD();
			player.mouse.k_type[20] = ReadD();
			player.keyboard.k_arm_ant = ReadC();
			player.mouse.k_type[21] = ReadD();
			player.keyboard.k_arm_pos = ReadC();			
			player.mouse.k_type[22] = ReadC();
			player.keyboard.k_jog_arm = ReadD();
			player.mouse.k_type[23] = ReadC();
			player.keyboard.k_placar = ReadD();
			player.mouse.k_type[24] = ReadC();
			player.keyboard.k_mapa = ReadD();
			player.mouse.k_type[25] = ReadC();
			player.keyboard.k_mapa_pos = ReadD();
			player.mouse.k_type[26] = ReadC();
			player.keyboard.k_mapa_ant = ReadD();
			player.mouse.k_type[27] = ReadC();
			player.keyboard.k_chat = ReadD();
			player.mouse.k_type[28] = ReadC();
			player.keyboard.k_chat_g = ReadD();
			player.mouse.k_type[29] = ReadC();
			player.keyboard.k_chat_t = ReadD();
			player.mouse.k_type[30] = ReadC();
			player.keyboard.k_chat_hz = ReadD();
			player.mouse.k_type[31] = ReadC();
			player.keyboard.k_chat_v = ReadD();
			player.mouse.k_type[32] = ReadC();
			player.keyboard.k_rad_t = ReadD();
			player.mouse.k_type[33] = ReadC();
			player.keyboard.k_rad_p = ReadD();
			player.mouse.k_type[34] = ReadC();
			player.keyboard.k_rad_i = ReadD();
			player.mouse.k_type[35] = ReadC();
			player.keyboard.k_bomb_d = ReadD();
			player.mouse.k_type[36] = ReadC();
			player.keyboard.k_sen_pos = ReadD();
			player.mouse.k_type[37] = ReadC();
			player.keyboard.k_sen_ant = ReadD();
			player.mouse.k_type[38] = ReadC();
			player.keyboard.k_print = ReadD();
			player.mouse.k_type[39] = ReadC();
			player.keyboard.k_chat_c = ReadD();
			player.mouse.k_type[40] = ReadC();
			player.keyboard.k_mira_x = ReadD();
			player.mouse.k_type[41] = ReadC();
			player.keyboard.k_gravar = ReadD();
			player.mouse.k_type[42] = ReadC();
			player.keyboard.k_max_value = ReadD();
			player.mouse.k_type[43] = ReadC();
			player.keyboard.k_macro_e = ReadD();
			player.keyboard.k_max_value = 4294967295L;
			db.updateKeyboards(player);
			db.updateKeyboards2(player);
			db.executeQuery("UPDATE jogador_teclado SET k_valor5='" + player.keyboard.k_valor5 + "' WHERE player_id='" + player.id + "'");
		}
	}
	public void MACRO(int length)
	{
		if (buf.readableBytes() == length)
		{
			player.keyboard.macro1 = ReadT(ReadC()).trim();
			player.keyboard.macro2 = ReadT(ReadC()).trim();
			player.keyboard.macro3 = ReadT(ReadC()).trim();
			player.keyboard.macro4 = ReadT(ReadC()).trim();
			player.keyboard.macro5 = ReadT(ReadC()).trim();
			db.updateKeyMacro(player);
		}
	}
	@Override
	public void runImpl()
	{
	}
}