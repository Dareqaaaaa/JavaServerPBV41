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

import game.manager.*;
import game.network.protocol.game.ACK.*;
import game.thread.*;

import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.log.*;
import core.pistola.*;
import core.sql.*;
import core.system.*;
import core.tasks.*;
import core.thread.*;
import core.utils.*;
import core.xml.*;

public class Room extends core.sql.InterfaceSQL
{
    public int[] TIMES = new int[] { 3, 5, 7, 5, 10, 15, 20, 25, 30 };
    public int[] KILLS = new int[] { 60, 80, 100, 120, 140, 160 };
    public int[] ROUNDS = new int[] { 0, 3, 5, 7, 9 };
    public int[] RED_TEAM = new int[] { 0, 2, 4, 6, 8, 10, 12, 14 };
    public int[] BLUE_TEAM = new int[] { 1, 3, 5, 7, 9, 11, 13, 15 };
    public int[] ROOM_TEAM = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    public volatile RoomSlot[] SLOT = new RoomSlot[16];
	public volatile ConcurrentHashMap<Integer, Long> prepared1 = new ConcurrentHashMap<Integer, Long>();
	public volatile ConcurrentHashMap<Integer, Long> prepared2 = new ConcurrentHashMap<Integer, Long>();
	public volatile ConcurrentHashMap<Long, Integer> votou = new ConcurrentHashMap<Long, Integer>();
	public volatile ConcurrentHashMap<Long, Integer> listHost = new ConcurrentHashMap<Long, Integer>();
	public String name;
	public String map_name;
	public String passwd;
	public int id;
	public int index;
	public int seed;
	public int map;
	public ModesEnum type;
	public int stage4v4;
	public int allWeapons;
	public int randomMap;
	public int limit;
	public int seeConf;
	public int balanceamento;
	public int special;
	public int killMask;
	public int timeLost;
	public int redKills;
	public int blueKills;
	public int redRounds;
	public int blueRounds;
	public int redDino;
	public int blueDino;
	public int rexDino;
	public int bar1;
	public int bar2;
	public int rodadas;
	public int respawn;
	public int aiCount;
	public int aiLevel;
	public int last_host;
	public int channel_id;
	public int server_id;
	public int namedOpc;
	public int ping;
	public boolean bomba;
	public boolean comand;
	public boolean isPorrada;
	public volatile long LIDER;
	public volatile List<Long> kikados = new ArrayList<Long>();
	public volatile ScheduledFuture<?> threadBOMB = null;
	public volatile ScheduledFuture<?> threadCOUNTDOWN = null;
	public volatile ScheduledFuture<?> threadVOTE = null;
	public volatile ScheduledFuture<?> threadROUND = null;
	public volatile ScheduledFuture<?> threadCROSS = null;
	public volatile RoomState rstate = RoomState.READY;
	public volatile VoteKick votekick = null;
	protected final PlayerSQL db = PlayerSQL.gI();
	protected final DateTimeUtil date = DateTimeUtil.gI();
	protected final Logger logger = new Logger();
	public Room(int id, int channel_id, int server_id, int seed)
	{
		this.id = id;
		this.channel_id = channel_id;
		this.server_id = server_id;
		this.seed = seed;
		index = (server_id & 255) << 20 | (channel_id & 255) << 12 | (id & 4095);
		type = ModesEnum.DEATHMACH;
		rodadas = 1;
		aiCount = 1;
		last_host = -1;
		namedOpc = 4;
		ping = 5;
		map_name = "";
		passwd = "";
		bomba = false;
		comand = false;
		isPorrada = false;
		rstate = RoomState.READY;
		for (int i = 0; i < 16; i++)
			SLOT[i] = new RoomSlot(i, 0, SlotState.EMPTY);
	}
	public Player getLeader()
	{
		if (LIDER <= 0)
			setNewLeader(true);
		return AccountSyncer.gI().get(LIDER);
	}
	public List<Player> getPlayers()
	{
		List<Player> list = new ArrayList<Player>();
		for (int i = 0; i < 16; i++)
		{
			long id = SLOT[i].player_id; 
			if (id > 0)
			{
				Player p = AccountSyncer.gI().get(id);
				if (p != null)
				{
					list.add(p);
					//if (p.room_id == id && p.channel_id == channel_id)
					//{
					//	list.add(p);
					//}
					//else
					//{
					//	REMOVER_JOGADOR(p, false);
					//}
				}
			}
		}
		return list;
	}
	public boolean isGhostMode(int modo_gm)
	{
		return modo_gm == 1 || type == ModesEnum.DESTRUICAO || type == ModesEnum.SUPRESSAO || type == ModesEnum.ESCOLTA;
	}
	public boolean block()
	{
		return name.contains("@Camp") || name.contains("@camp") || name.contains("@CAMP");
	}
	public Channel getChannel()
	{
		return GameServerXML.gI().getChannel(channel_id, server_id);
	}
	public void badName()
	{
		if (name == null || name == "")
			name = named(new Random().nextInt(namedOpc));
	}
	public RoomSlot getSlotLeader()
	{
		return getSlotByPID(LIDER);
	}
	public void badConfig()
	{
		if (stage4v4 > 1) stage4v4 = 1;
		if (type.ordinal() < 1) type = ModesEnum.values()[1];
		if (type.ordinal() > 14) type = ModesEnum.values()[14];
		if (special == 6 || special == 9)
		{
			if (aiCount < 1) aiCount = 1;
			if (aiCount > 8) aiCount = 8;
			if (aiLevel < 1) aiLevel = 1;
			if (aiLevel > 10) aiLevel = 10;
		}
	}
	public String named(int random)
	{
		switch (random)
		{
			case 1: return "Entra aqui noob!";
			case 2: return "Lista de frag inside";
			case 3: return "Go Go Go PB!";
		}
		return "Point Blank";
	}
	public int restrictions()
	{
		int restricoes = 0;
		if (randomMap > 0) restricoes += 2;
		if (passwd.length() > 0) restricoes += 4;
		//if (match)  restricoes += 32;
		//if (special == 6 || special == 9) restricoes += 64;
		if (limit > 0 && rstate.ordinal() > 1) restricoes += 128;
		return restricoes;
	}
	public int dinossaur()
	{
		return rodadas == 2 ? 1 : 0;
	}
	public boolean isDino(int dino)
	{
		if (dino == 2)
			return type == ModesEnum.DINO || type == ModesEnum.CROSSCOUNTER;
		else if (dino == 1)
			return type == ModesEnum.DINO;
		else
			return type == ModesEnum.CROSSCOUNTER;
	}
	public void VERIFICAR_JOGADORES_NA_PARTIDA(int st)
	{
		int red = 0, blue = 0, redNotGhost = 0, blueNotGhost = 0, mortosRed = 0, mortosBlue = 0;
		for (int i = 0; i < 16; i++)
		{
			RoomSlot s = getRoomSlot(i);
			if (s.state.ordinal() > 11)
			{
				if (i % 2 == 0)
				{
					red++;
					if (!s.espectador) redNotGhost++;
					if (s.death) mortosRed++;
				}
				else
				{
					blue++;
					if (!s.espectador) blueNotGhost++;
					if (s.death) mortosBlue++;
				}
			}
		}
		if (special == 6 || special == 9)
		{
			if (st % 2 == 0 && red == 0 || st % 2 == 1 && blue == 0)
			{
				if (_getMaster() == st)
				{
					end(-1);
				}
			}
		}
		else
		{
			if (red > 0 && blue > 0)
			{
				if (isGhostMode(0))
				{
					if (st % 2 == 0)
					{
						if (mortosRed >= getPlayingPlayers(0, true, 0) || redNotGhost == 0)
						{
							if (!bomba)
								round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
							else if (redNotGhost == 0 && blueNotGhost == 0)
								round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
						}
	                    else if (mortosBlue >= getPlayingPlayers(1, true, 0) || blueNotGhost == 0)
	                    {
	                    	round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
	                    }
					}
					else
					{
	                    if (mortosBlue >= getPlayingPlayers(1, true, 0) || blueNotGhost == 0)
	                    {
	                    	round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
	                    }
	                    else if (mortosRed >= getPlayingPlayers(0, true, 0) || redNotGhost == 0)
	                    {
	                    	if (!bomba)
								round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
							else if (redNotGhost == 0 && blueNotGhost == 0)
								round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
	                    }
					}
				}
			}
			else
			{
				end(red == 0 ? 1 : blue == 0 ? 0 : -1);
			}
		}
	}
	public int teamRound(int team)
	{
		if (isRoundMap())
		{
			return team == 0 ? redRounds : blueRounds;
		}
		else if (type == ModesEnum.DINO)
		{
			return team == 0 ? redDino : blueDino;
		}
		else
		{
			return team == 0 ? redKills : blueKills;
		}
	}
	public int timeVencedor()
	{
		if (isRoundMap())
		{
            if (blueRounds == redRounds) return 2;
            else if (blueRounds > redRounds) return 1;
            else if (blueRounds < redRounds) return 0;
		}
		else if (type == ModesEnum.DINO)
		{
            if (blueDino == redDino) return 2;
            else if (blueDino > redDino) return 1;
            else if (blueDino < redDino) return 0;
		}
		else
		{
            if (blueKills == redKills) return 2;
            else if (blueKills > redKills) return 1;
            else if (blueKills < redKills) return 0;
		}
		return 2;
	}
	public synchronized void start_battle()
	{
		for (int i = 0; i < 16; i++)
		{
			Player mM = getPlayerBySlot(i);
			RoomSlot sT = getRoomSlot(i);
			if (mM != null && sT.state == SlotState.BATTLE_READY && sT.battleAccept)
			{
				if (rstate == RoomState.PRE_BATTLE)
				{
					sT.espectador = false;
					sT.death = false;
					changeState(sT, SlotState.BATTLE, true);
					for (int j = 0; j < 16; j++)
					{
						Player pR = getPlayerBySlot(j);
						if (pR != null && getSlotState(j).ordinal() > 8)
							pR.connection.sendPacket(new BATTLE_STARTBATTLE_ACK(this, sT, 0, 1));
					}
					mM.connection.sendPacket(new BATTLE_MISSION_ROUND_PRE_START_ACK(this));
					if (!isDino(2))
						mM.connection.sendPacket(new BATTLE_MISSION_ROUND_START_ACK(this, 0));
				}
				else if (rstate == RoomState.BATTLE)
				{
					boolean ghost = isGhostMode(mM.espectador);
					sT.espectador = ghost;
					sT.death = ghost;
					changeState(sT, SlotState.BATTLE, true);
					for (int j = 0; j < 16; j++)
					{
						Player pR = getPlayerBySlot(j);
						if (pR != null && getSlotState(j).ordinal() > 8)
							pR.connection.sendPacket(new BATTLE_STARTBATTLE_ACK(this, sT, 1, 1));
					}
					if (!ghost)
						mM.connection.sendPacket(new BATTLE_MISSION_ROUND_PRE_START_ACK(this)); 
					mM.connection.sendPacket(new BATTLE_MISSION_ROUND_START_ACK(this, 1));
					mM.connection.sendPacket(new BATTLE_RECORD_ACK(this));
				}
			}
		}
		if (rstate == RoomState.PRE_BATTLE && getSlotState(LIDER) == SlotState.BATTLE)
		{
			rstate = RoomState.BATTLE;
			updateBInfo();
			if (isDino(2))
				crossStart(new CrossCounterTH(), 0, 5350);
		}
	}
	public int slotFix(int time)
	{
		for (int i : time == 0 ? RED_TEAM : BLUE_TEAM)
		{
			RoomSlot slot = getRoomSlot(i);
			if (slot.player_id > 0 && slot.state != SlotState.EMPTY && slot.state.ordinal() < 8)
				return i;
		}
		return -1;
	}
	public int slotVazio(int time)
	{
		for (int i : time == 0 ? RED_TEAM : BLUE_TEAM)
		{
			RoomSlot slot = getRoomSlot(i);
			if (slot.player_id == 0 && slot.state == SlotState.EMPTY)
				return i;
		}
		return -1;
	}
	public SlotState getSlotState(RoomSlot slot)
	{
		if (slot == null)
			return SlotState.EMPTY;
		else
			return slot.state;
	}
	public SlotState getSlotState(Player p)
	{
		return getSlotState(getSlotByPID(p != null ? p.id : 0));
	}
	public SlotState getSlotState(long pId)
	{
		return getSlotState(getSlotByPID(pId));
	}
	public SlotState getSlotState(int slot)
	{
		return getSlotState(getRoomSlot(slot));
	}
	public synchronized void bombMissionStart(PrincipalAbstract event, int currentRound)
	{
		try
		{
			if (threadBOMB == null)
			{
				threadBOMB = ThreadPoolManager.gI().scheduleCOUNTD(new PrincipalRunnable(id, channel_id, server_id, currentRound, event), 42001);
				bomba = true;
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
			stopTask(ThreadState.BOMB);
		}
	}
	public synchronized void countdownStart(PrincipalAbstract event)
	{
		try
		{
			if (threadCOUNTDOWN == null)
			{
				prepared1.clear();
				prepared2.clear();
				threadCOUNTDOWN = ThreadPoolManager.gI().scheduleCOUNTD(new PrincipalRunnable(id, channel_id, server_id, 0, event), 5350);
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
			stopTask(ThreadState.COUNTDOWN);
		}
	}
	public synchronized void votekickStart(PrincipalAbstract event)
	{
		try
		{
			if (threadVOTE == null)
				threadVOTE = ThreadPoolManager.gI().scheduleCOUNTD(new PrincipalRunnable(id, channel_id, server_id, 0, event), 20000);
		}
		catch (Exception e)
		{
			error(getClass(), e);
			stopTask(ThreadState.VOTEKICK);
		}
	}
	public synchronized void roundStart(PrincipalAbstract event)
	{
		try
		{
			if (threadROUND == null)
				threadROUND = ThreadPoolManager.gI().scheduleCOUNTD(new PrincipalRunnable(id, channel_id, server_id, 0, event), 8000);
		}
		catch (Exception e)
		{
			error(getClass(), e);
			stopTask(ThreadState.ROUND);
		}
	}
	public synchronized void crossStart(PrincipalAbstract event, int type, long time)
	{
		try
		{
			if (threadCROSS == null)
				threadCROSS = ThreadPoolManager.gI().scheduleCOUNTD(new PrincipalRunnable(id, channel_id, server_id, type, event), time);
		}
		catch (Exception e)
		{
			error(getClass(), e);
			stopTask(ThreadState.CROSSCOUNTER);
		}
	}
	public synchronized void stopTask(ThreadState idx) 
	{
		if (idx == ThreadState.BOMB)
		{
			if (threadBOMB != null)
				threadBOMB.cancel(false);
			threadBOMB = null;
			return;
		}
		else if (idx == ThreadState.COUNTDOWN)
		{
			if (threadCOUNTDOWN != null)
				threadCOUNTDOWN.cancel(false);
			threadCOUNTDOWN = null;
			return;
		}
		else if (idx == ThreadState.VOTEKICK)
		{
			if (threadVOTE != null)
				threadVOTE.cancel(false);
			threadVOTE = null;
			votou.clear();
			return;
		}
		else if (idx == ThreadState.ROUND)
		{
			if (threadROUND != null)
				threadROUND.cancel(false);
			threadROUND = null;
			return;
		}
		else if (idx == ThreadState.CROSSCOUNTER)
		{
			if (threadCROSS != null)
				threadCROSS.cancel(false);
			threadCROSS = null;
			return;
		}
	}
	public synchronized void stopAllThread() 
	{
		for (ThreadState ts : ThreadState.values())
			stopTask(ts);
	}
	public synchronized boolean KIKAR_JOGADOR(int slot)
	{
		try
		{
			Player f = getPlayerBySlot(slot);
			if (f != null)
			{
				if (!kikados.contains(f.id))
					kikados.add(f.id);
				f.connection.sendPacket(new VOTEKICK_KICK_ACK());
				for (int i = 0; i < 16; i++)
				{
					Player m = getPlayerBySlot(i);
					if (m != null)
						m.connection.sendPacket(new BATTLE_LEAVEP2PSERVER_ACK(f, slot, 2));
				}
				RESETAR_SLOT_PLAYER(getRoomSlot(slot), false, false);
				TROCAR_HOST(0, slot);
				REMOVER_JOGADOR(f, true, true);
				VERIFICAR_JOGADORES_NA_PARTIDA(slot);
				Channel ch = getChannel();
				if (ch != null) ch.ADICIONAR_JOGADOR(f);
				return true;
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
		return false;
	}
	public void checkPlayersInReadyCountdown(boolean upInfo)
	{
		if (isRoundMap() || isDino(2))
		{
			RoomSlot slotLeader = getSlotByPID(LIDER); 
			if (slotLeader != null)
			{
				int time = presPorTime(TimeEnum.values()[slotLeader.id % 2 == 0 ? 1 : 0]);
				if (slotLeader.state == SlotState.READY && time == 0 && rstate == RoomState.COUNTDOWN)
				{
					stopTask(ThreadState.COUNTDOWN);
					rstate = RoomState.READY;
					changeStateInfo(slotLeader, SlotState.NORMAL, !upInfo);
					for (int j = 0; j < 16; j++)
					{
						Player m = getPlayerBySlot(j);
						if (m != null)
						{
							m.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_PREPARANDO));
							m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(this));
						}
					}
					if (upInfo)
						updateInfo();
				}
			}
		}
	}
	public int presPorTime(TimeEnum time)
	{
		int go = 0;
		for (int i : time == TimeEnum.TIME_VERMELHO ? RED_TEAM : BLUE_TEAM)
			if (getSlotState(i) == SlotState.READY && _getMaster() != i)
				go++;
		return go;
	}
	public int contarPeloState(SlotState state)
	{
		int go = 0;
		for (int i = 0; i < 16; i++)
			if (getSlotState(i) == state)
				go++;
		return go;
	}
	public int count4vs4team(TimeEnum time)
	{
		int go = 0;
		for (int i : time == TimeEnum.TIME_VERMELHO ? RED_TEAM : BLUE_TEAM)
			if (getSlotState(i).ordinal() > 7)
				go++;
		return go;
	}
	public void DEFINIR_SLOTS(int slots)
    {
        if (slots == 0)
        	slots++;
        for (int i = 0; i < 16; i++)
            if (i >= slots)
            	changeStateInfo(i, SlotState.CLOSE, false);
    }
    public int slots()
    {
        int value = 0;
        for (int i = 0; i < 16; i++)
            if (getSlotState(i) != SlotState.CLOSE)
            	value++;
        return value;
    }
    public synchronized void TROCAR_HOST(int players, int host)
	{
    	if (host != -1)
    	{
			if (host == _getMaster())
			{
				if (rstate.ordinal() > 1)
				{
					int lider = _getMaster();
					List<Integer> slots = new ArrayList<Integer>();
					for (int i = 13; i > 8; i--)
					{
						for (RoomSlot s : SLOT)
						{
							if (s.state.ordinal() == i)
							{
								slots.add(s.id);
							}
						}
					}
					for (int id : slots)
					{
						if (id != host)
						{
							setNewLeader(lider = id, true);
							break;
						}
					}
					for (int i = 0; i < 16; i++)
					{
						Player m = getPlayerBySlot(i);
						if (m != null && getSlotState(i).ordinal() > 10)
							m.connection.sendPacket(new BATTLE_GIVEUPBATTLE_ACK(this, lider));
					}
					slots = null;
				}
				else
				{
					if (players != 1)
					{
						setNewLeader(true);
					}
				}
			}
    	}
	}
    public Player getPlayerBySlot(int slotId)
    {
    	RoomSlot slot = getRoomSlot(slotId);
    	return AccountSyncer.gI().get(slot != null ? slot.player_id : 0);
    }
    public RoomSlot getSlotByPID(long id)
    {
    	for (int i = 0; i < 16; i++)
    	{
    		RoomSlot slot = getRoomSlot(i);
    		if (slot.player_id == id)
    			return slot;
    	}
    	return null;
    }    
    public void setNewLeader(boolean upInfo)
	{
		for (int i = 0; i < 16; i++)
		{
			int slot = -1;
			Player p = getPlayerBySlot(last_host);
			if (p != null)
			{
				slot = last_host;
			}
			else
			{
				slot = i;
			}
			if (setNewLeader(slot, upInfo))
			{
				break;
			}
		}
	}
	public synchronized boolean setNewLeader(int id, boolean upInfo) 
	{
		RoomSlot slot = getRoomSlot(id);
		if (slot != null)
		{
			Player p = getPlayerBySlot(id);
			if (slot.player_id != LIDER && p != null)
			{
				if (slot.state == SlotState.READY)
					changeStateInfo(slot, SlotState.NORMAL, false);
				if (rstate == RoomState.COUNTDOWN)
				{
					stopTask(ThreadState.COUNTDOWN);
					rstate = RoomState.READY;
					for (int i = 0; i < 16; i++)
					{
						Player m = getPlayerBySlot(i);
						RoomSlot s = getRoomSlot(i);
						if (m != null && s != null)
						{
							if (s.state == SlotState.READY)
								changeStateInfo(s, SlotState.NORMAL, false);
							m.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_PREPARANDO));
							m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(this));
						}
					}
				}
				last_host = -1;
				LIDER = slot.player_id;
				listHost.clear();
				BattleServerManager.gI().CHANGE_HOST(this, id);
				if (rstate.ordinal() > 3) updateBInfo();
				if (upInfo) updateInfo();
				return true;
			}
		}
		return false;
	}
	public boolean REMOVER_JOGADOR(Player p, boolean upFriends, boolean changeHost)
	{
		if (p != null)
		{
			Channel ch = getChannel();
			int oldslot = p.slot;
			if (prepared1.containsKey(oldslot)) prepared1.remove(oldslot);
			if (prepared2.containsKey(oldslot)) prepared2.remove(oldslot);
			if (listHost.containsKey(p.id)) listHost.remove(p.id);
			if (votou.containsKey(p.id)) votou.remove(p.id);
			p.minutosJogados = null;
			p.slot = -1;
			p.room_id = -1;
			for (int i = 0; i < 16; i++)
			{
				RoomSlot s = getRoomSlot(i);
				if (s.player_id == p.id)
				{
					if (last_host == i)
						last_host = -1;
					s.player_id = 0;
					changeState(s, SlotState.EMPTY, true);
					SLOT[i] = (s = new RoomSlot(i, 0, SlotState.EMPTY));
					break;
				}
			}
			if (upFriends)
				EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 80, false);
			if (LIDER == p.id && getPlayers().size() > 0 || getLeader() == null)
			{
				if (changeHost)
					setNewLeader(true);
			}
			if (ch != null)
				ch.REMOVER_SALAS_VAZIAS();
			updateInfo();
			return true;
		}
		return false;
	}
	public int ADICIONAR_JOGADOR(Player p)
	{
		if (p != null && p.status() > 0)
		{
			for (int i = 0; i < 16; i++)
			{
				RoomSlot s = getRoomSlot(i);
				if (s.player_id == 0 && s.state == SlotState.EMPTY)
				{
					SLOT[i] = (s = new RoomSlot(i, p.id, SlotState.NORMAL));
					p.slot = i;
					p.room_id = id;
					Channel ch = getChannel();
					if (ch != null)
						ch.REMOVER_JOGADOR(p.id);
					EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 96, false);
					return i;
				}
			}
		}
		return -1;
	}
	public void zombieSync()
	{
		for (int i : BLUE_TEAM)
			changeStateInfo(i, SlotState.CLOSE, false);
	}
	public void updateInfo()
	{
		for (int i = 0; i < 16; i++)
		{
			Player m = getPlayerBySlot(i);
			if (m != null)
				m.connection.sendPacket(new ROOM_GET_SLOTS_ACK(this));
		}
	}
	public void updateBInfo()
	{
		for (int i = 0; i < 16; i++)
		{
			Player m = getPlayerBySlot(i);
			if (m != null)
				m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(this));
		}
	}
    public int getPlayingPlayers(int time, boolean inBattle, int resp)
    {
        int players = 0;
		for (int i = 0; i < 16; i++)
		{
			RoomSlot s = getRoomSlot(i);
            if (((i % 2 == time || time == 2) && (s.state == SlotState.BATTLE && (resp == -1 ? true : s.respawn > resp) && inBattle && !s.espectador || s.state.ordinal() > 10 && !inBattle)))
                players++;
		}
        return players;
    }
	public RoomSlot getRoomSlot(int slotId)
	{
		if (slotId >= 0 && slotId <= 15)
			return SLOT[slotId];
		return null;
	}
    public int getMaskSlotBattle(boolean spectators, boolean missionSuccess, boolean endBattle)
    {
    	int resultado = 0;
        for (int i = 0; i < 16; i++)
        {
        	RoomSlot slot = getRoomSlot(i);
        	if (slot != null)
        	{
        		Player p = getPlayerBySlot(i);
        		if (p != null)
        		{
		            if (missionSuccess && slot.missionClear && slot.state == SlotState.BATTLE || !missionSuccess && slot.state.ordinal() > (endBattle ? 10 : 12) && (!spectators || (p.espectador == 1 || spectators && !slot.espectador)))
		            	resultado += 1 << i;
        		}
        	}
        }
        return resultado;
    }
	public RoomSlot changeSlot(Player p, RoomSlot o, SlotState state, int team)
	{
		if (team == -1)
			return null;
		for (int i : team == 0 ? RED_TEAM : BLUE_TEAM)
		{
			RoomSlot n = getRoomSlot(i);
			if (n != null && n.player_id == 0 && n.state == SlotState.EMPTY)
			{
				n.player_id = p.id;
				changeStateInfo(n, state, false);
				o.player_id = 0;
				changeStateInfo(o, SlotState.EMPTY, false);
				p.changeSlot = false;
				p.slot = i;
				return n;
			}
		}
		return null;
	}
	public int getKillTime()
	{
		return TIMES[killMask >> 4];
	}
	public int getKillsByMask()
	{
		return isRoundMap() ? ROUNDS[killMask - 1 & 15] : KILLS[killMask & 15];
	}
	public boolean isRoundMap()
	{
		return killMask >> 4 < 3;
	}
	public boolean isRoundMap(int type)
	{
		return killMask >> 4 < 3 && this.type.ordinal() != type;
	}
	public boolean isCaos()
	{
		return type == ModesEnum.CAOS;
	}
	public synchronized void end(int twinner)
	{
		int slot_player = getMaskSlotBattle(false, false, true);
		try
		{
			double expPercent = 0, goldPercent = 0, cashPercent = 0;
			Channel ch = getChannel();
			if (ch != null)
			{
				expPercent = ch.bonusExp;
				goldPercent = ch.bonusGold;
				cashPercent = ch.bonusCash;
			}
			boolean win_cash = ConfigurationLoader.gI().battle_cash;
			rstate = RoomState.BATTLE_END;
			updateBInfo();
			if (rstate == RoomState.BATTLE_END)
			{
				if (bomba)
					bomba = false;
				if (threadBOMB != null)
					stopTask(ThreadState.BOMB);
				if (votekick != null && threadVOTE != null)
				{
					for (int i = 0; i < 16; i++)
					{
						Player m = getPlayerBySlot(i);
						if (m != null && i != votekick.jogador_kikado)
							m.connection.sendPacket(new VOTEKICK_RESULT_ACK(votekick.jogador_kikado, votekick.kikar, votekick.deixar, false, true));
			        }
					stopTask(ThreadState.VOTEKICK);
					threadVOTE = null;
					votekick = null;
				}
				stopAllThread();
				int win = timeVencedor();
				if (twinner == -1)
					twinner = win;
				for (int i = 0; i < 16; i++)
				{
					try
					{
						Player mM = getPlayerBySlot(i);
						RoomSlot sM = getRoomSlot(i);
						if (mM != null && sM != null && sM.state.ordinal() > 8)
						{
							checkVip(mM, false);
							if (sM.state.ordinal() > 11)
							{
								if (!sM.checked)
								{
									PlayerCoupon c = mM.coupon;
									sM.checked = true;
									mM.stats.partidas++;
									if (special == 6 || special == 9)
									{
										sM.exp++;
										sM.gold++;
										if (win_cash)
											sM.cash++;
									}
									else
									{
										mM.stats.matou += sM.allKills;
										mM.stats.morreu += sM.allDeaths;
										mM.stats.headshots += sM.allHeadshots;
										if (win == 2)
										{
											mM.stats.empatou++;
											sM.gold += 50;
											sM.exp += 50;
											if (win_cash) sM.cash += 50;
										}
										else if (win == (i % 2))
										{
											mM.stats.ganhou++;
											sM.gold += 90;
											sM.exp += 90;
											if (win_cash) sM.cash += 90;
										}
										else if (win != (i % 2))
										{
											mM.stats.perdeu++;
											sM.gold += 10;
											sM.exp += 10;
											if (win_cash) sM.cash += 10;
										}
										if (isRoundMap() || isDino(2))
										{
											sM.gold += (sM.allKills + sM.allHeadshots * 32 + sM.allDeaths + (sM.objetivo * 50)) - sM.allDeaths + (sM.score / 3);
											sM.exp += (sM.allKills + sM.allHeadshots * 32 + sM.allDeaths + (sM.objetivo * 50)) - sM.allDeaths + (sM.score / 3);
											if (win_cash)
												sM.cash += (sM.allKills + sM.allHeadshots * 27 + sM.allDeaths + (sM.objetivo * 50)) - sM.allDeaths + (sM.score / 3);
										}
										else
										{
											sM.gold += (sM.allKills + sM.allHeadshots * 24 + (sM.objetivo * 48)) - sM.allDeaths + (sM.score / 3);
											sM.exp += (sM.allKills + sM.allHeadshots * 23 + (sM.objetivo * 48)) - sM.allDeaths + (sM.score / 3);
											if (win_cash)
												sM.cash += (sM.allKills + sM.allHeadshots * 17 + (sM.objetivo * 48)) - sM.allDeaths + (sM.score / 3);
										}
										if (mM.vip.pc_cafe == 1 || mM.vip.pc_cafe == 2)
										{
											sM.exp_bonus += (int)Math.ceil(sM.exp / (mM.vip.pc_cafe == 2 ? 1.65 : 3.3)) + 30;
											sM.gold_bonus += (sM.gold / (mM.vip.pc_cafe == 2 ? 2 : 4)) + 30;
											if (win_cash)
												sM.cash += mM.vip.pc_cafe * 30;
										}
										if (sM.piercing_shot > 0)
										{
											sM.exp += (40 * sM.piercing_shot);
											sM.gold += (43 * sM.piercing_shot);
										}
										if (expPercent > 0) sM.exp_bonus += (int)Math.round(expPercent * sM.exp);
										if (goldPercent > 0) sM.gold_bonus += (int)Math.round(goldPercent * sM.gold);
										if (cashPercent > 0) sM.cash += (int)Math.round(goldPercent * sM.cash);
										sM.exp += (sM.util * 5);
				                        if (c.bonus100 > 0 || c.bonus50 > 0 || c.bonus30 > 0)
				                        {
				                            if (c.bonus100 > 0)
				                            {
				                                if (c.bonus100 == 1 || c.bonus100 == 3) sM.exp_bonus += sM.exp;
				                                if (c.bonus100 == 2 || c.bonus100 == 3) sM.gold_bonus += sM.gold;
				                            }
				                            if (c.bonus50 > 0)
				                            {
				                                if (c.bonus50 == 1 || c.bonus50 == 3) sM.exp_bonus += sM.exp / 2;
				                                if (c.bonus50 == 2 || c.bonus50 == 3) sM.gold_bonus += sM.gold / 2;
				                            }
				                            if (c.bonus30 > 0)
				                            {
				                                if (c.bonus30 == 1 || c.bonus30 == 3) sM.exp_bonus += (int)Math.ceil(sM.exp / 3.3);
				                                if (c.bonus30 == 2 || c.bonus30 == 3) sM.gold_bonus += (int)Math.ceil(sM.gold / 3.3);
				                            }
				                            sM.tag += 4;
				                        }
									}
									mM.gold += sM.gold + sM.gold_bonus;
									mM.exp += sM.exp + sM.exp_bonus;
									if (win_cash) mM.cash += sM.cash;
									sM.tag += (expPercent > 0 || goldPercent > 0) ? 8 : 0;
									sM.tag += mM.vip.pc_cafe;
									if (sM.tag > 14) sM.tag = 14;
									EssencialUtil.gI().MISSION_FINAL(this, sM, mM, win);
									RankInfo rank = RankXML.gI().get(mM.rank);
									if (rank != null)
									{
										int expObtido = rank.onNextLevel + rank.onAllExp;
						                if (mM.exp >= expObtido && mM.rank < 51)
						                {
						                    for (PlayerInventory r : rank.rewards)
						                    	mM.connection.sendPacket(new INVENTORY_ITEM_CREATE_ACK(mM, r.item_id, r.count, 1, -1, true));
						                	int EXP = (mM.exp - expObtido) + RankXML.gI().get(mM.rank + 1).onAllExp;
						                    mM.rank++;
						                    mM.gold += rank.onGPUp;
						                    mM.cash += rank.onCPUP;
						                    mM.exp = EXP;
						                    mM.last_up = date.getDateTime();
						                    mM.connection.sendPacket(new PLAYER_LEVEL_UP_ACK(mM.rank, rank.onNextLevel));
						                    sM.isUp = true;
						                }
									}
								}
							}
							if (sM.state.ordinal() > 8)
								chekarInventario(mM, sM);
						}
					}
					catch (Exception e)
					{
					}
				}
			}
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
		finally
		{
			finalizeEnd(slot_player, getMaskSlotBattle(false, true, true), twinner);
		}
	}
	public synchronized void finalizeEnd(int slot_player, int slot_mission, int winner)
	{
		try
		{
			for (int i = 0; i < 16; i++)
			{
				Player mM = getPlayerBySlot(i);
				if (mM != null)
					mM.connection.sendPacket(new BATTLE_ENDBATTLE_ACK(mM, this, slot_player, slot_mission, winner));
			}
			EventPlaytime e = PlaytimeXML.gI().PLAYTIME_NOW();
			if (e != null)
			{
				for (int i = 0; i < 16; i++)
				{
					Player m = getPlayerBySlot(i);
					if (m != null && getSlotState(i) == SlotState.BATTLE)
					{
						if (m.event.play_day != e.id && m.minutosJogados != null)
						{
							try
							{
								if (special != 6 && special != 9)
								{
									if (m.event.event_playtime != e.id)
										m.event.played = e.minutos; //Resetar minutos para um novo evento que se iniciou
									m.event.event_playtime = e.id;
									Date atual = date.getTimeHasPlay();
									long diferencaMinutos = (atual.getTime() - m.minutosJogados.getTime()) / (1000 * 60);
									int minutosJogados = (m.event.played -= diferencaMinutos);
									if (minutosJogados > 0)
									{
										m.connection.sendPacket(new BATTLE_AWARD_TIME_ACK(e, 1, minutosJogados));
										db.executeQuery("UPDATE jogador_evento SET played='" + minutosJogados + "' WHERE player_id='" + m.id + "'");
									}
									else
									{
										m.connection.sendPacket(new BATTLE_AWARD_TIME_ACK(e, 0, minutosJogados));
										m.event.played = 0;
										m.event.play_day = e.id;
										m.event.event_playtime = -1;
										db.executeQuery("UPDATE jogador_evento SET played='0', play_day='" + e.id + "' WHERE player_id='" + m.id + "'");
									}
								}
								else
								{
									m.connection.sendPacket(new BATTLE_AWARD_TIME_ACK(e, 1, m.event.played));
								}
							}
							catch (Exception ex)
							{
							}
						}
					}
				}
			}
			for (int i = 0; i < 16; i++)
	        {
				RoomSlot slot = getRoomSlot(i);
				Player mM = getPlayerBySlot(i);
				if (mM != null)
				{
					if (slot.state.ordinal() > 8)
						changeStateInfo(slot, SlotState.NORMAL, false);
					db.updateStats(mM);
					db.executeQuery("UPDATE jogador SET gold='" + mM.gold + "', exp='" + mM.exp + "', cash='" + mM.cash + "' WHERE id='" + mM.id + "'");
					if (slot.isUp)
					{
						db.executeQuery("UPDATE jogador SET rank='" + mM.rank + "', last_up='" + mM.last_up + "' WHERE id='" + mM.id + "'");
						EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(mM, false, true, true);
					}
					if (slot.updateBrooch) db.updateBrooch(mM);
					if (slot.updateInsignia) db.updateInsignia(mM);
					if (slot.updateMedal) db.updateMedal(mM);
					if (slot.updateBlueOrder) db.updateBlueOrder(mM);
					mM.coupon.bonus100 = 0;
					mM.coupon.bonus50 = 0;
					mM.coupon.bonus30 = 0;
					mM.coupon.freepass = 0;
					mM.changeSlot = false;
					db.REPLACE_NICK(mM.id, mM.name);
					db.REPLACE_RANK(mM.id, mM.rank);
				}
				int cardId = slot.missionActiveCompleted;
				if (cardId == -1)
				{
					if (slot.missions.size() > 0)
					{
						for (MissionUpdate mU : slot.missions.values())
				           	db.updateMissionSec(slot.player_id, mU.card, mU.value, mU.active);
					}
				}
				else
				{
					if (cardId == 0)
					{
						mM.mission1 = 0;
						mM.missions.card1 = 0;
						mM.missions.mission1 = new int[41];
		    			db.updateMission(mM, 0, 1);
		    			db.updateCard(mM, 1, 0);
		    			db.updateMissions(mM, 1, new int[41]);
					}
					else if (cardId == 1)
					{
						mM.mission2 = 0;
						mM.missions.card2 = 0;
						mM.missions.mission2 = new int[41];
		    			db.updateMission(mM, 0, 2);
		    			db.updateCard(mM, 2, 0);
		    			db.updateMissions(mM, 2, new int[41]);
					}
					else if (cardId == 2)
					{
						mM.mission3 = 0;
						mM.missions.card3 = 0;
						mM.missions.mission3 = new int[41];
		    			db.updateMission(mM, 0, 3);
		    			db.updateCard(mM, 3, 0);
		    			db.updateMissions(mM, 3, new int[41]);
					}
					else if (cardId == 3)
					{
						mM.mission4 = 0;
						mM.missions.card4 = 0;
						mM.missions.mission4 = new int[41];
		    			db.updateMission(mM, 0, 4);
		    			db.updateCard(mM, 4, 0);
		    			db.updateMissions(mM, 4, new int[41]);
					}
				}
				slot.missions.clear();
				SLOT[i] = (slot = new RoomSlot(i, slot.player_id, slot.state));
	        }
			votou.clear();
			prepared1.clear();
			prepared2.clear();
			listHost.clear();
			votekick = null;
			comand = false;
			redRounds = 0;
			blueRounds = 0;
			rodadas = 1;
			timeLost = 0;
			bar1 = 100;
			bar2 = 100;
			redKills = 0;
			blueKills = 0;
			redDino = 0;
			blueDino = 0;
			rexDino = -1;
			respawn = 0;
			last_host = -1;
			rstate = RoomState.READY;
			stopAllThread();
			updateInfo();
			updateBInfo();
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void chekarInventario(Player player, RoomSlot s)
	{
		if (player != null && s != null)
		{
			player.readItemsToDelete(player.inventario.values(), s.armasExcluir, false);
			for (PlayerInventory item : s.armasExcluir)
				player.connection.sendPacket(new INVENTORY_ITEM_DELETE_ACK(item.object, item.item_id, 1, player));
			player.resetEquipment(s.armasExcluir);
			resetCupons(s.armasExcluir, player, true);
			if (s.armasUsadas != null) s.armasUsadas.clear();
			if (s.armasExcluir != null) s.armasExcluir.clear();
			s.armasUsadas = new ConcurrentHashMap<Long, Player>(); 
			s.armasExcluir = new ArrayList<PlayerInventory>();
			if (player.connection != null)
			{
				player.connection.sendPacket(new BASE_GET_EQUIPMENT_INFO_ACK(player));
				player.connection.sendPacket(new SERVER_MESSAGE_CHANGE_INVENTORY_ACK(player, 3));
			}
		}
	}
	public void checkVip(Player player, boolean upInfo)
	{
		if (player != null && player.vip != null)
		{
			if (player.vip.pc_cafe > 0 && player.vip.expire != 0 && player.vip.expire <= date.getDateTime())
			{
				player.vip.expire = 0;
				player.vip.pc_cafe = 0;
				if (upInfo) updateInfo();
				db.executeQuery("UPDATE jogador_vip SET pc_cafe='0', expirate='0' WHERE player_id='" + player.id + "'");
			}
		}
	}
	public void prepareReady(Player player, RoomSlot s)
	{
		if (player != null && s != null)
		{
			player.readItemsToDelete(player.getItemByType(3), s.armasExcluir, true);
			for (PlayerInventory item : s.armasExcluir)
				player.connection.sendPacket(new INVENTORY_ITEM_DELETE_ACK(item.object, item.item_id, 1, player));
			resetCupons(s.armasExcluir, player, false);
			if (s.armasUsadas != null) s.armasUsadas.clear();
			if (s.armasExcluir != null) s.armasExcluir.clear();
			s.armasUsadas = new ConcurrentHashMap<Long, Player>(); 
			s.armasExcluir = new ArrayList<PlayerInventory>();
			player.minutosJogados = null;
			player.coupon.effects1 = CuponsPISTOLA.gI().couponCalcule(player, 1);
			player.coupon.effects2 = CuponsPISTOLA.gI().couponCalcule(player, 2);
			player.coupon.effects3 = CuponsPISTOLA.gI().couponCalcule(player, 3);
			player.coupon.effects4 = CuponsPISTOLA.gI().couponCalcule(player, 4);
			player.coupon.effects5 = CuponsPISTOLA.gI().couponCalcule(player, 5);
			player.coupon.bonus100 = 0;
			player.coupon.bonus50 = 0;
			player.coupon.bonus30 = 0;
			player.coupon.freepass = 0;
			if (player.buscarEquipPeloItemId(1200002000) == 2) player.coupon.bonus30++; //EXP 30%
			if (player.buscarEquipPeloItemId(1200003000) == 2) player.coupon.bonus50++; //EXP 50%
			if (player.buscarEquipPeloItemId(1200037000) == 2) player.coupon.bonus100++; //EXP 100%
			if (player.buscarEquipPeloItemId(1200004000) == 2) player.coupon.bonus30 += 2; //GOLD 30%
			if (player.buscarEquipPeloItemId(1200119000) == 2) player.coupon.bonus50 += 2; //GOLD 50%
			if (player.buscarEquipPeloItemId(1200038000) == 2) player.coupon.bonus100 += 2; //GOLD 100%
			if (player.buscarEquipPeloItemId(1200011000) == 2) player.coupon.freepass++; //FREE PASS 
			SLOT[s.id] = (s = new RoomSlot(s.id, s.player_id, s.state));
		}
	}
	public void resetCupons(List<PlayerInventory> armasExcluir, Player p, boolean upInfo)
	{
		if (p != null)
		{
			for (PlayerInventory item : armasExcluir)
			{
				switch (item.item_id)
				{
					case 1200006000:
					{
						p.color = 0;
						if (p.slot != -1)
						{
							for (int i = 0; i < 16; i++)
			            	{
								Player m = getPlayerBySlot(i);
								if (m != null)
									m.connection.sendPacket(new ROOM_GET_NICKNAME_ACK(p));
			            	}
						}
		            	p.connection.sendPacket(new PLAYER_UPDATE_NICK_ACK(p));
			            db.updateColor(p, 0);
						break;
					}
					case 1200014000:
					{
						p.coupon.cor_mira = 0;
						p.connection.sendPacket(new PLAYER_COUPON_INFO_ACK(p));
						db.updateCorMira(p, 0);
						break;
					}
					case 1200009000:
					{
						p.coupon.false_rank = 55;
						p.connection.sendPacket(new PLAYER_COUPON_INFO_ACK(p));
						db.updateFRank(p, 55);
						if (p.slot != -1 && upInfo)
							updateInfo();
						break;
					}
				}
			}
		}
	}
	public synchronized void round(TimeEnum time, WinnerRound wr)
	{
		if (rstate == RoomState.BATTLE && !isDino(2))
		{
			if (threadROUND == null)
			{
				if (time == TimeEnum.TIME_VERMELHO)
					redRounds++;
				else if (time == TimeEnum.TIME_AZUL)
					blueRounds++;
				bomba = false;
				stopTask(ThreadState.BOMB);
				threadBOMB = null;
				rodadas++;
				for (int i = 0; i < 16; i++)
				{
					Player m = getPlayerBySlot(i);
					RoomSlot s = getRoomSlot(i);
					s.dinoOnLife = 0;
					s.killMessage = FragValues.NONE;
					s.lastKillState = 0;
					s.oneTimeKills = 0;
					s.repeatLastState = false;
					s.espectador = false;
					s.death = false;
					s.bar1 = 0;
					s.bar2 = 0;
					if (m != null)
						m.connection.sendPacket(new BATTLE_MISSION_ROUND_END_ACK(this, time, wr));
				}
				if (redRounds >= getKillsByMask() || blueRounds >= getKillsByMask())
				{
					end(-1);
				}
				else
				{
					redKills = 0;
					blueKills = 0;
					bar1 = 100;
					bar2 = 100;
					roundStart(new RoundRestartTH());
				}
			}
		}
	}
	public void RESETAR_SLOT_PLAYER(RoomSlot sM, boolean remove, boolean escape)
	{
		if (sM != null)
		{
			if (prepared1.containsKey(sM.id)) prepared1.remove(sM.id);
			if (prepared2.containsKey(sM.id)) prepared2.remove(sM.id);
			int state = sM.state.ordinal();
			if (state > 8)
			{
				changeStateInfo(sM, SlotState.NORMAL, false);
				BattleServerManager.gI().REMOVE_PLAYER(this, sM.id);
			}
			Player p = getPlayerBySlot(sM.id);
			if (p != null)
			{
				checkVip(p, true);
				if (votou.containsKey(p.id))
					votou.remove(p.id);
				if (sM.missions.size() > 0)
				{
					for (MissionUpdate mu : sM.missions.values())
					{
						if (p.missions.active == 0) p.missions.mission1[mu.card] -= mu.value;
						else if (p.missions.active == 1) p.missions.mission2[mu.card] -= mu.value;
						else if (p.missions.active == 2) p.missions.mission3[mu.card] -= mu.value;
						else if (p.missions.active == 3) p.missions.mission4[mu.card] -= mu.value;
					}
				}
				if (p.coupon.freepass != 1 || special == 6 || special == 9)
				{
					if (remove && state > 8)
						db.executeQuery("UPDATE jogador_estatisticas SET partidas='" + (p.stats.partidas++) + "', perdeu='" + (p.stats.perdeu++) + "' WHERE player_id='" + p.id + "'");
					if (escape)
					{
						db.executeQuery("UPDATE jogador_estatisticas SET kitou='" + (p.stats.kitou++) + "' WHERE player_id='" + p.id + "'");
						if (state > 11 && special != 6 && special != 9)
						{
							p.gold -= 100;
							if (p.gold < 0)
								p.gold = 0;
							db.updateGold(p);
						}
					}
				}
				chekarInventario(p, sM);
				p.coupon.bonus100 = 0;
				p.coupon.bonus50 = 0;
				p.coupon.bonus30 = 0;
				p.coupon.freepass = 0;
				p.changeSlot = false;
			}
			SLOT[sM.id] = (sM = new RoomSlot(sM.id, sM.player_id, sM.state));
		}
	}
	public void changeState(RoomSlot slot, SlotState state, boolean upInfo)
	{
		if (slot != null)
		{
			SlotState oldState = slot.state;
			slot.state = state;
			SLOT[slot.id].state = state;
			if (rstate == RoomState.COUNTDOWN && oldState == SlotState.READY && state.ordinal() < 8)
			{
				if (slot.id == _getMaster())
				{
					stopTask(ThreadState.COUNTDOWN);
					rstate = RoomState.READY;
					changeStateInfo(slot, state, !upInfo);
					for (int i = 0; i < 16; i++)
					{
						Player m = getPlayerBySlot(i);
						if (m != null)
						{
							m.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_PREPARANDO));
							m.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(this));
						}
					}
				}
				else
				{
					checkPlayersInReadyCountdown(false);
				}
			}
			if (state == SlotState.CLOSE || state == SlotState.EMPTY)
				SLOT[slot.id] = (slot = new RoomSlot(slot.id, 0, state));
			if (upInfo)
				updateInfo();
		}
	}
	public void changeStateInfo(RoomSlot slot, SlotState state, boolean upInfo)
	{
		if (slot != null)
		{
			slot.state = state;
			if (state == SlotState.CLOSE || state == SlotState.EMPTY)
				SLOT[slot.id] = (slot = new RoomSlot(slot.id, 0, state));
			if (upInfo)
				updateInfo();
		}
	}
	public void changeStateInfo(int slot, SlotState state, boolean upInfo)
	{
		changeStateInfo(getRoomSlot(slot), state, upInfo);
	}
	public void changeStateInfo(long pId, SlotState state, boolean upInfo)
	{
		changeStateInfo(getSlotByPID(pId), state, upInfo);
	}
	public void changeStateInfo(Player player, SlotState state, boolean upInfo)
	{
		changeStateInfo(getSlotByPID(player != null ? player.id : 0), state, upInfo);
	}
	public void changeState(int slot, SlotState state, boolean upInfo)
	{
		changeState(getRoomSlot(slot), state, upInfo);
	}
	public void changeState(Player player, SlotState state, boolean upInfo)
	{
		changeState(getSlotByPID(player != null ? player.id : 0), state, upInfo);
	}
	public void changeState(long pId, SlotState state, boolean upInfo)
	{
		changeState(getSlotByPID(pId), state, upInfo);
	}
	public synchronized void prepare_room(int slot)
	{
		listHost.clear();
		votekick = null;
		bomba = false;
		rodadas = 1;
		redKills = 0;
		blueKills = 0;
		redRounds = 0;
		blueRounds = 0;
		redDino = 0;
		blueDino = 0;
		rexDino = -1;
		respawn = 0;
		bar1 = 100;
		bar2 = 100;
		if (special == 9)
			aiLevel = 1;
		votekick = null;
		for (int i = 0; i < 16; i++)
		{
			RoomSlot s = getRoomSlot(i);
			Player p = getPlayerBySlot(i);
			if (p != null) p.minutosJogados = null;
			if (s.checked) s.checked = false;
		}
		BattleServerManager.gI().ADD_ROOM(this, slot);
		stopAllThread();
	}
	public int _getMaster()
	{
		Player p = AccountSyncer.gI().get(LIDER);
		return p != null ? p.slot : 0; //-1
	}
	public int changeSlot(int nId, int oId, boolean checkState)
	{
		RoomSlot o = getRoomSlot(oId);
		RoomSlot n = getRoomSlot(nId);
		if (checkState)
		{
			if (o.state == SlotState.READY) changeStateInfo(o, SlotState.NORMAL, false);
			if (n.state == SlotState.READY) changeStateInfo(n, SlotState.NORMAL, false);
		}
		Player a = getPlayerBySlot(oId);
		Player b = getPlayerBySlot(nId);
		if (a != null) a.slot = getNewSlot(oId);
		if (b != null) b.slot = getNewSlot(nId);
		o.id = getNewSlot(oId);
		n.id = getNewSlot(nId);
		SLOT[oId] = n;
		SLOT[nId] = o;
		return nId;
	}
	public synchronized RoomSlot balanceamentoDeSlot(Player p, RoomSlot o, SlotState state, List<RoomSlot> _slots, boolean position, int haveBalance)
	{
		if (special == 6 || special == 9 || balanceamento == 0)
			return null;
		int time = definirPosicionamento(o.id, position);
		if (time != o.id % 2)
			haveBalance = 1;
		RoomSlot n = corretorDeSlot(p, o, state, time, -1, -1);
		if (n != null)
		{
			_slots.add(new RoomSlot(n.clone(), o.clone()));
			return n;
		}
		/*int pref = -1; //Nenhum time definido
		int slotLivre = slotVazio(time);
		int slotUsado = slotFix(time);
		if (slotLivre != -1)
		{
			if (slotLivre != -1) //Colocar todos os jogadores com Ready no começo
				if (slotUsado < slotLivre)
					pref = slotUsado;
		}*/
		return null;
	}
	public RoomSlot corretorDeSlot(Player p, RoomSlot o, SlotState state, int team, int pref, int oId)
	{
		if (team == -1)
			return null;
		if (pref >= 0)
		{
			RoomSlot n = getRoomSlot(pref);
			n.state = state;
			Player a = getPlayerBySlot(oId);
			Player b = getPlayerBySlot(pref);
			if (a != null) a.slot = pref;
			if (b != null) b.slot = oId;
			o.id = pref;
			n.id = oId;
			SLOT[oId] = n;
			SLOT[pref] = o;
			return n;
		}
		return changeSlot(p, o, state, team);
	}
	public int definirPosicionamento(int id, boolean position)
	{
		int myTeam = id % 2;
		int red = count4vs4team(TimeEnum.TIME_VERMELHO) - (myTeam == 0 ? 1 : 0), blue = count4vs4team(TimeEnum.TIME_AZUL) - (myTeam == 1 ? 1 : 0);
		int slotVazio = slotVazio(myTeam);
		if (position || id == LIDER)
		{
			if (slotVazio >= 0 && id > slotVazio)
				return myTeam;
		}
		else
		{
			if (red == blue)
			{
				if (slotVazio >= 0 && id > slotVazio)
					return myTeam;
			}
			else
			{
				if (myTeam == 0 && red > blue)
					return myTeam + 1; //Azul
				else if (myTeam == 1 && blue > red)
					return myTeam - 1; //Vermelho
				else
				{
					if (slotVazio >= 0 && id > slotVazio)
						return myTeam;
				}
			}
		}
		return -1;
	}
	public int getNewSlot(int slot)
    {
        return slot % 2 == 0 ? slot + 1 : slot - 1;
    }
	public void finalize()
	{
		try
		{
			super.finalize();
		}
		catch (Throwable e)
		{
		}
	}
}