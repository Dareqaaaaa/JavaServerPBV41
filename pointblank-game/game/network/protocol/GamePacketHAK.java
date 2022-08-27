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

package game.network.protocol;

import core.models.*;
import core.network.*;
import game.network.client.*;
import game.network.protocol.game.REQ.*;
import io.netty.buffer.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class GamePacketHAK extends ProtocolExecutor
{
	protected static final GamePacketHAK INSTANCE = new GamePacketHAK();
	public GamePacketHAK()
	{
		put(new FRIEND_ROOM_INVITE_REQ(275));
		put(new FRIEND_ACCEPT_REQ(280));
		put(new FRIEND_INVITE_REQ(282));
		put(new FRIEND_REMOVE_REQ(284));
		put(new AUTH_SEND_WHISPER_REQ(290));
		put(new AUTH_SEND_WHISPER_REQ(292));
    	put(new BASE_FIND_PLAYER_REQ(297));

		put(new MESSENGER_NOTE_SEND_REQ(417));
		put(new MESSENGER_NOTE_RESPONDE_REQ(419));
		put(new MESSENGER_NOTE_CHECK_READED_REQ(422));
		put(new MESSENGER_NOTE_DELETE_REQ(424));

		put(new BASE_USER_GIFTLIST_REQ(528));
		put(new AUTH_SHOP_GOODS_BUY_REQ(530));
    	put(new INVENTORY_ITEM_EQUIP_REQ(534));
    	put(new INVENTORY_ITEM_EQUIP_REQ(536));
    	put(new INVENTORY_ITEM_DELETE_REQ(542));
    	put(new AUTH_GET_REMAIN_MONEY_REQ(544));
    	put(new INVENTORY_NICK_CHECK_REQ(548));

		put(new CLAN_DETAIL_INFO_REQ(1304));
		put(new CLAN_MEMBER_CONTEXT_REQ(1306));
		put(new CLAN_MEMBER_LIST_REQ(1308));
		put(new CLAN_CREATE_REQ(1310));
		put(new CLAN_CLOSE_CLAN_REQ(1312));
		put(new CLAN_CREATE_PLAYER_INVITE_REQ(1314));
		put(new CLAN_CREATE_INVITE_REQ(1316));
		put(new CLAN_REMOVE_INVITES_REQ(1318));
		put(new CLAN_REQUEST_CONTEXT_REQ(1320));
		put(new CLAN_REQUEST_LIST_REQ(1322));
		put(new CLAN_REQUEST_INFO_REQ(1324));
		put(new CLAN_ACCEPT_REQUEST_REQ(1326));
		put(new CLAN_DENIAL_REQUEST_REQ(1329));
		put(new CLAN_PLAYER_LEAVE_REQ(1332));
		put(new CLAN_DEMOTE_KICK_REQ(1334));
    	put(new CLAN_PROMOTE_MASTER_REQ(1337));
    	put(new CLAN_COMMISSION_STAFF_REQ(1340));
		put(new CLAN_COMMISSION_REGULAR_REQ(1343));
		put(new CLAN_CHATTING_REQ(1358));
		put(new CLAN_CHECK_LOGO_REQ(1360));
		put(new CLAN_REPLACE_NOTICE_REQ(1362));
		put(new CLAN_REPLACE_INTRO_REQ(1364));
		put(new CLAN_SAVE_ACCESS_REQ(1372));
		put(new CLAN_ROOM_INVITED_REQ(1381));
		put(new LOBBY_CHATTING_REQ(1390)); //chat na tela de clan
		put(new CLAN_MESSAGE_INVITE_REQ(1392));
    	put(new CLAN_MESSAGE_INVITE_RESP_REQ(1394));
		put(new CLAN_MSG_FOR_PLAYERS_REQ(1396));

		put(new CLAN_CREATE_REQUESITES_REQ(1416));
		put(new CLAN_ENTER_REQ(1441));
		put(new CLAN_LEAVE_REQ(1443));
		put(new CLAN_CLIENT_LIST_REQ(1445));
		put(new CLAN_CHECK_NAME_REQ(1447));
		put(new CLAN_IN_CS_LIST_REQ(1451));

		put(new CLAN_MATCH_CLAN_PART2_REQ(1538));
		put(new CLAN_MATCH_CLAN_PART_REQ(1540));
		put(new CLAN_WAR_MATCH_TEAM_COUNT_REQ(1542));
		put(new CLAN_WAR_MATCH_TEAM_LIST_REQ(1544));
		put(new CLAN_WAR_CREATE_TEAM_REQ(1546));
		put(new CLAN_MATCH_REMOVE_CLAN_REQ(1550));
		put(new CLAN_MATCH_ACCEPTED_BATTLE_REQ(1558));
		put(new CLAN_MATCH_UPTIME_REQ(1571));
		put(new CLAN_WAR_TEAM_CHATTING_REQ(1576));

		put(new BASE_CHANNEL_LIST_REQ(2571));
		put(new BASE_CHANNEL_ANNOUNCE_REQ(2573));
		put(new BASE_USER_LEAVE_REQ(2577));
		put(new BASE_USER_ENTER_REQ(2579));
    	put(new PLAYER_CONFIG_UPDATE_REQ(2581));
		put(new BASE_XINGCODE_REQ(2584)); //2582
		put(new BASE_GET_RECORD_INFO_DB_REQ(2591));

    	put(new MISSION_QUEST_UPDATE_CARD_REQ(2601));
    	put(new MISSION_QUEST_BUY_CARD_REQ(2605));
		put(new MISSION_QUEST_DELETE_CARD_REQ(2607));
		put(new TITLE_GET_REQ(2619));
		put(new TITLE_USE_REQ(2621));
		put(new TITLE_DETACH_REQ(2623));
		put(new LOBBY_CHATTING_REQ(2627));
     	put(new MISSION_QUEST_COMPLETE_REQ(2635));
    	put(new LOBBY_PLAYER_INFO_REQ(2639));
    	put(new BASE_SCHANNEL_UPDATE_REQ(2642));
		put(new BASE_CHANNEL_PASSWD_REQ(2644));
		put(new PLAYER_EXIT_GAME_REQ(2654));
		put(new ATTENDANCE_CHECK_REQ(2661));
		put(new ATTENDANCE_REWARD_REQ(2663));

		put(new SHOP_LEAVE_REQ(2817));
		put(new SHOP_ENTER_REQ(2819));
		put(new LOBBY_SHOP_LIST_REQ(2821));
		put(new OUTPOST_ENTER_REQ(2897));
		put(new OUTPOST_LEAVE_REQ(2899));
		put(new OUTPOST_AWARD_REQ(2901));

		put(new LOBBY_GET_ROOMLIST_REQ(3073));
		put(new LOBBY_ENTER_REQ(3079));
		put(new LOBBY_LEAVE_REQ(3083));

        put(new LOBBY_QUICKJOIN_ROOM_REQ(3077));
		put(new ROOM_JOIN_REQ(3081));
		put(new LOBBY_GET_ROOMINFOADD_REQ(3087));
		put(new ROOM_CREATE_REQ(3089));
		put(new LOBBY_ANTIGAME_REQ(3096));
    	put(new LOBBY_PLAYER_INFO2_REQ(3099));

    	put(new LOBBY_CREATE_NICK_NAME_REQ(3101));

		put(new BATTLE_HOLE_CHECK_REQ(3329));
		put(new BATTLE_READYBATTLE_REQ(3331));
		put(new BATTLE_STARTBATTLE_REQ(3333));
		put(new BATTLE_RESPAWN_REQ(3337));
		put(new BATTLE_NETWORK_ERROR_REQ(3343));
		put(new BATTLE_SENDPING_REQ(3344));
		put(new BATTLE_PRESTARTBATTLE_REQ(3348));
		put(new BATTLE_DEATH_REQ(3354));
		put(new BATTLE_MISSION_BOMB_INSTALL_REQ(3356)); 
		put(new BATTLE_MISSION_BOMB_UNINSTALL_REQ(3358)); 
		put(new BATTLE_MISSION_GENERATOR_INFO_REQ(3368));
		put(new BATTLE_TIMERSYNC_REQ(3372));
		put(new BATTLE_CHANGE_DIFFICULTY_LEVEL_REQ(3376));
		put(new BATTLE_RESPAWN_FOR_AI_REQ(3378));
		put(new BATTLE_DINO_ESCAPE_REQ(3382));	
		put(new BATTLE_LEAVEP2PSERVER_REQ(3384)); 
		put(new BATTLE_MISSION_DEFENCE_INFO_REQ(3386));
     	put(new BATTLE_DINO_DEATHBLOW_REQ(3390));
     	put(new BATTLE_TUTORIAL_END_REQ(3394));
		put(new VOTEKICK_START_REQ(3396));

		put(new VOTEKICK_UPDATE_REQ(3400));
		put(new BATTLE_TIMER_INFO_REQ(3428));

		put(new INVENTORY_ENTER_REQ(3585));
		put(new INVENTORY_LEAVE_REQ(3589));

    	put(new ROOM_GET_PLAYERINFO_REQ(3841));
		put(new ROOM_CHANGE_SLOT_REQ(3845));
		put(new ROOM_CHANGE_ROOMINFO_REQ(3847));
		put(new ROOM_CLOSE_SLOT_REQ(3849));
        put(new ROOM_GET_LOBBY_USER_LIST_REQ(3854));
		put(new ROOM_CHANGE_OPTIONINFO_REQ(3858));
		put(new PROFILE_ENTER_REQ(3862));
		put(new PROFILE_LEAVE_REQ(3864));
	   	put(new ROOM_GET_HOST_REQ(3866));
	   	put(new ROOM_GET_HOST2_REQ(3868));
		put(new ROOM_CHANGE_HOST_REQ(3870));
     	put(new ROOM_NEW_HOST_REQ(3872));
		put(new ROOM_CHANGE_SLOTS_REQ(3874));
        put(new ROOM_INVITES_PLAYERS_REQ(3884));
		put(new ROOM_CHANGE_INFO_REQ(3886));

		put(new BATTLE_LOADING_REQ(3904));
		put(new ROOM_CHANGE_PASSWD_REQ(3906));
		put(new BATTLE_AWARD_TIME_REQ(3910));

		put(new PACKET_NULL_REQ(2575));
		put(new PACKET_NULL_REQ(2694)); //byte
    	put(new PACKET_NULL_REQ(2818));
    	put(new PACKET_NULL_REQ(2820));
	}
	public static GamePacketHAK gI()
	{
		return INSTANCE;
	}
	public synchronized GamePacketREQ MONTAR_PACOTE(ByteBuf buffer, GameClient client) throws Exception
	{
		int opcode = buffer.readUnsignedShort();
		if (buffer.readableBytes() > 0)
		{
			Player p = client.getPlayer();
			if (p == null)
			{
				if (opcode != 2577 && opcode != 2579 && opcode != 2644 && opcode != 2654 && opcode != 2654)
				{
					client.close(null);
					return null;
				}
			}
			else
			{
				if (p.status() == 0 && p.firstEnter)
				{
					if (opcode != 2575 && opcode != 3101 && opcode != 3073 && opcode != 3079 && opcode != 2821 && opcode != 2571 && opcode != 2573 && opcode != 2579 && opcode != 2584 && opcode != 2654)
					{
						client.close(null);
						return null;
					}
				}
			}
			return (GamePacketREQ) getPacket(opcode, buffer, client, false);
		}
		return null;
	}
}