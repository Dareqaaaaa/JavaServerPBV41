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

package core.enums;

public enum BattleErrorMessage
{
	EVENT_ERROR_FIRST_HOLE(0x8000100B), //Não foi possível jogar com o dono da sala
	EVENT_ERROR_FIRST_MAINLOAD(0x8000100A), //Não foi possível participar do jogo
	EVENT_ERROR_EVENT_BATTLE_TIMEOUT_CN(0x80001006),  //O jogo acabou devido a problemas de rede
	EVENT_ERROR_EVENT_BATTLE_TIMEOUT_CS(0x80001007),
	EVENT_ERROR_NO_REAL_IP(0x80001008),
	EVENT_ERROR_PRESTART_BATTLE_ALEADY_END(0x80001015),
	EVENT_ERROR_START_BATTLE_ALEADY_END(0x80001016);
	public int value;
	BattleErrorMessage(int value)
	{
		this.value = value;
	}
}