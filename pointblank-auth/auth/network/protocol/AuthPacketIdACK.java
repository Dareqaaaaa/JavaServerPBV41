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

package auth.network.protocol;

public enum AuthPacketIdACK
{
	BASE_GET_MYBOX_ACK(421),
	BASE_GET_USER_GIFTLIST_ACK(529),
	BASE_GET_MYCASH_ACK(545),
	BASE_GET_SCHANNEL_LIST_ACK(2049),
	BASE_GET_LOGIN_ERROR_ACK(2062),
	BASE_GET_LOGIN_ACK(2564),
	BASE_GET_MYINFO_ACK(2566),
	BASE_GET_CONFIG_ACK(2568),
	BASE_GET_ENTER_SERVER_ACK(2578),
	BASE_GET_USER_ENTER_ACK(2580),
	BASE_GET_PBLACKOUT_ACK(2662),
	BASE_UPDATE_SCHANNEL_LIST_ACK(2643),
	BASE_EXIT_GAME_ACK(2655),
	BASE_GET_RANKINFO_ACK(2669),
	BASE_GET_SOURCE_ACK(2679),
	BASE_PUSH_PRESENT_ITEM_ACK(2692),
	BASE_GET_URL_LIST_ACK(2695),
	BASE_GET_INVENTORY_ACK(2699),
	BASE_GET_INSERT_ITEM_ACK(3588),
	BASE_GET_MACHINE_ACK(31777);
	public int id;
	AuthPacketIdACK(int id)
	{
		this.id = id;
	}
	public static int getOpcode(String packet)
	{
		AuthPacketIdACK p = valueOf(packet);
		return p != null ? p.id : 0;
	}
}