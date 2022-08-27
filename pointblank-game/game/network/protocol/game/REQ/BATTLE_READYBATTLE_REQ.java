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

package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;
import game.thread.*;

import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.models.*;
import core.xml.*;

public class BATTLE_READYBATTLE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected Player p;
	protected int players;
	protected int haveBalance;
	protected List<RoomSlot> _slots = new ArrayList<RoomSlot>();
	public BATTLE_READYBATTLE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		p = client.getPlayer();
		if (p != null)
		{
			p.espectador = ReadD();
			if (p.espectador == 1)
			{
				if (p.observing() == 0)
					p.espectador = 0;
			}
		}
		_slots.clear();
	}
	@Override
	public void runImpl()
	{
		if (p != null && r != null)
		{
			if (checkCHARA())
				return;
			if (r.LIDER == p.id)
			{
				r.comand = false;
				players = r.presPorTime(TimeEnum.values()[p.slot % 2 == 0 ? 1 : 0]);
				if ((r.isRoundMap() || r.isDino(2)) && players > 0 || r.comand)
				{
					if (checkClanFronto())
					{
						RoomSlot slotPlayer = r.getSlotByPID(p.id);
						if (slotPlayer != null)
						{
							if (slotPlayer.state == SlotState.READY)
							{
								r.stopTask(ThreadState.COUNTDOWN);
								r.rstate = RoomState.READY;
								r.changeState(slotPlayer, SlotState.NORMAL, true);
								for (int i = 0; i < 16; i++)
								{
									Player m = r.getPlayerBySlot(i);
									if (m != null)
									{
										m.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_CANCELADA));
										m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(r));
									}
								}
							} 
							else if (slotPlayer.state == SlotState.NORMAL)
							{
								r.rstate = RoomState.COUNTDOWN;
								r.changeState(slotPlayer, SlotState.READY, true);
								for (int i = 0; i < 16; i++)
								{
									Player m = r.getPlayerBySlot(i);
									RoomSlot s = r.getRoomSlot(i);
									if (m != null && s != null)
									{
										m.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_TEMPO));
										if (s.state == SlotState.READY)
										{
											m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(r));
										}
									}
								}
								for (int i = 0; i < 2; i++)
								{
									for (Player m : r.getPlayers())
									{
										RoomSlot s = r.getSlotByPID(m.id);
										if (s.state == SlotState.READY)
										{
											r.balanceamentoDeSlot(m, s, SlotState.READY, _slots, i == 1, haveBalance);
										}
									}
									BALANCESLOTS(haveBalance);
								}
								r.countdownStart(new CountdownTH());
							}
						}
					}
				}
				else if (r.special == 6 || r.special == 9 || players > 0)
				{
					if (checkClanFronto())
					{
						r.changeState(p, SlotState.READY, true);
						r.rstate = RoomState.LOADING;
						for (int i = 0; i < 2; i++) //balancear e posicionar
						{
							for (Player m : r.getPlayers())
							{
								RoomSlot s = r.getSlotByPID(m.id);
								if (s.state == SlotState.READY)
								{
									r.balanceamentoDeSlot(m, s, SlotState.READY, _slots, i == 1, haveBalance);
								}
							}
							BALANCESLOTS(haveBalance);
						}
						for (int i = 0; i < 16; i++)
						{
							Player m = r.getPlayerBySlot(i);
							RoomSlot s = r.getRoomSlot(i);
							if (m != null && s.state == SlotState.READY)
							{
								r.changeState(s, SlotState.LOAD, false);
								r.prepareReady(m, s);
							}
						}
						for (int i = 0; i < 16; i++)
						{
							Player m = r.getPlayerBySlot(i);
							RoomSlot s = r.getRoomSlot(i);
							if (s.state == SlotState.LOAD)
							{
								m.connection.sendPacket(new BATTLE_READYBATTLE_ACK(r));
							}
						}
						r.updateBInfo();
						r.updateInfo();
					}
				}
				else
				{
					sendPacket(new BATTLE_READYBATTLE_ERROR_ACK(0x80001009));
				}
			}
			else if (r.rstate.ordinal() > 1)
			{
				if (check4vs4())
					return;
				if (r.rstate != RoomState.BATTLE_END)
				{
					RoomSlot slotPlayer = r.getSlotByPID(p.id);
					if (slotPlayer != null)
					{
						r.changeState(slotPlayer, SlotState.READY, false);
						RoomSlot newSlot = r.balanceamentoDeSlot(p, slotPlayer, SlotState.READY, _slots, false, haveBalance);
						if (newSlot != null)
							slotPlayer = newSlot;
						BALANCESLOTS(haveBalance);
						sendPacket(new BATTLE_READYBATTLE_ACK(r));
						sendPacket(new BATTLE_READYBATTLE_ERROR_ACK(8));
						for (int i = 0; i < 16; i++)
						{
							Player m = r.getPlayerBySlot(i);
							if (m != null && r.getSlotState(i).ordinal() > 7 && i != slotPlayer.id)
								m.connection.sendPacket(new BATTLE_READYBATTLE2_ACK(p, slotPlayer.id));
						}
						r.changeState(slotPlayer, SlotState.LOAD, false);
						r.prepareReady(p, slotPlayer);
						slotPlayer.espectador = r.isGhostMode(p.espectador);
						slotPlayer.death = r.isGhostMode(p.espectador);
						r.updateInfo();
					}
				}
			}
			else
			{
				RoomSlot slotPlayer = r.getSlotByPID(p.id);
				if (slotPlayer != null)
				{
					if (slotPlayer.state == SlotState.READY)
					{
						r.changeState(slotPlayer, SlotState.NORMAL, true);
						if (r.rstate == RoomState.COUNTDOWN)
							sendPacket(new ROOM_CHANGE_STATE_ACK(r, RoomState.READY));
					} 
					else if (slotPlayer.state == SlotState.NORMAL)
					{
						if (check4vs4())
							return;
						r.changeState(slotPlayer, SlotState.READY, true);
						if (r.rstate == RoomState.COUNTDOWN)
						{
							sendPacket(new ROOM_CHANGE_STATE_ACK(r, RoomState.COUNTDOWN));
							RoomSlot newSlot = r.balanceamentoDeSlot(p, slotPlayer, SlotState.READY, _slots, true, haveBalance);
							if (newSlot != null)
								slotPlayer = newSlot;
							BALANCESLOTS(haveBalance);
						}
					}
				}
				r.checkPlayersInReadyCountdown(true);
			}
		}
	}
	public boolean checkCHARA()
	{
		p.quarent.clear();
		if (r.special == 6 || r.special == 9)
			return false;
		if (r.block() && r.getSlotState(p) == SlotState.NORMAL && p.access_level.ordinal() < 3)
		{
			String cupon = "";
			String available = "";
			int helmet = p.equipment.char_head;
			if (helmet != 1102003001)
				available = "Helmet or Mask"; //Helmet ou Máscara
			for (RoomCamp rc : CampXML.gI().forType(1))
			{
				if (cupon.length() == 0)
					cupon = "Your coupon had the effect desatived.\n"; //O Efeito do item foi desativado
				cupon += rc.name + " ";
				p.quarent.put(rc.id, rc.type);
			}
			ConcurrentHashMap<Integer, RoomCamp> equips = CampXML.gI().equips;
			int itemId = 0;
			if (p.slot % 2 == 0 && equips.containsKey(itemId = p.equipment.char_red)) available = equips.get(itemId).name;
			if (p.slot % 2 == 1 && equips.containsKey(itemId = p.equipment.char_blue)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.weapon_primary)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.weapon_secundary)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.weapon_melee)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.weapon_grenade)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.weapon_special)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.char_head)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.char_beret)) available = equips.get(itemId).name;
			if (equips.containsKey(itemId = p.equipment.char_dino)) available = equips.get(itemId).name;
			if (available.length() > 0)
				sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK("Your equipment does not comply with the rules for rooms @Camp.\nCheck you equipment.\n[" + available + "]")); //Seu equipamento não está de acordo com as regras para salas @Camp
			if (cupon.length() > 0 && available.length() == 0)
				sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(cupon));
			return available.length() > 0;
		}
		return false;
	}
	public boolean checkClanFronto()
	{
		Channel ch = client.getChannel();
		if (ch != null)
		{
			if (ch.type == ChannelServerEnum.CHANNEL_TYPE_CLAN && r.special != 6 && r.special != 9)
			{
				int time = r._getMaster() % 2;
				if ((r.count4vs4team(TimeEnum.values()[time]) + 1) >= 4 && r.count4vs4team(TimeEnum.values()[time == 0 ? 1 : 0]) >= 4)
					return true;
				return false;
			}
		}
		return true;
	}
	public boolean check4vs4()
	{
		if (r.stage4v4 != 0)
		{
			int lider = r._getMaster();
			int slot = p.slot;
			int liderLimit = 3;
			if (r.getSlotState(lider).ordinal() > 7)
				liderLimit++;
			if (lider % 2 == slot % 2) //Time do lider tem que deixar 1 vaga pra ele setar o PRONTO
			{
				if (lider != slot && r.count4vs4team(TimeEnum.values()[slot % 2]) >= liderLimit)
				{
					sendPacket(new ROOM_UNREADY_4VS4_ACK(r.stage4v4));
					return true;
				}
			}
			else
			{
				if (r.count4vs4team(TimeEnum.values()[slot % 2]) >= 4)
				{
					sendPacket(new ROOM_UNREADY_4VS4_ACK(r.stage4v4));
					return true;
				}
			}
		}
		return false;
	}
	public void BALANCESLOTS(int type)
	{
		if (_slots.size() > 0)
		{
			int master = r._getMaster();
			for (int i = 0; i < 16; i++)
			{
				Player m = r.getPlayerBySlot(i);
				if (m != null)
					m.connection.sendPacket(new ROOM_BALANCE_TEAM_ACK(master, type, _slots));
			}
			r.updateInfo();
		}
		_slots.clear();
	}
}