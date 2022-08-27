package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.enums.ClanRole;
import core.log.*;
import core.models.*;
import core.pistola.*;
import core.utils.*;

public class INVENTORY_ITEM_EQUIP_REQ extends game.network.protocol.GamePacketREQ
{
	protected PlayerInventory invent;	
	protected Player player;
	protected Room room;
	protected RandomBox box;
	protected Coupon cup;
	protected int dias;
    public INVENTORY_ITEM_EQUIP_REQ(int opcode)
    {
        super(opcode);
    }
    public void readImpl()
    {
    	player = client.getPlayer();
    	room = client.getRoom();
    	if (player != null)
    	{
    		invent = player.buscarPeloObjeto(ReadQ());
    		if (invent != null)
    		{
    			if (invent.slot == 11)
				{
					dias = Integer.parseInt(String.valueOf(invent.item_id).substring(7, 10));
	    			invent.cupon_id = (invent.item_id - (100000000 + dias));
				}
    			if (opcode == 536)
    			{
					ReadC(); //type
	    			invent.effect = ReadC();
    			}
    			cup = CuponsPISTOLA.gI().get(invent.cupon_id);
    			BoxPISTOLA rb = BoxPISTOLA.gI();
    			if (rb.randomBox.containsKey(invent.item_id))
    				box = rb.randomBox.get(invent.item_id);
    		}
    	}
    }
    public void runImpl()
    {
    	try
    	{
	    	if (invent == null)
	    	{
	    		sendPacket(new INVENTORY_ITEM_EQUIP_ACK(null, null, 0x80000000, false));
	    		return;
	    	}
	    	if (box != null)
	    	{
    			randomBox();
	    	}
    		else if (cup != null)
    		{
    			if (invent.cupon_id == 1200009000 && invent.effect > 50 && cup.value == 0)
    			{
    				sendPacket(new INVENTORY_ITEM_EQUIP_ACK(null, null, 0x80000000, false));
    				return;
    			}
    			sendPacket(new INVENTORY_ITEM_EQUIP_ACK(invent, player, 1, true));
    			sendPacket(new INVENTORY_ITEM_CREATE_ACK(player, invent.cupon_id, date.getDateTime(dias), 2, dias, true));
    			switch (invent.cupon_id)
    			{
    				case 1200006000: //APELIDO COLORIDO
    				{
    					player.color = invent.effect;
		    			if (room != null)
		                {
		    				for (int i = 0; i < 16; i++)
		    				{
		    					Player m = room.getPlayerBySlot(i);
		    					if (m != null)
		    						m.connection.sendPacket(new ROOM_GET_NICKNAME_ACK(player));
		    				}
		                }
		                sendPacket(new PLAYER_UPDATE_NICK_ACK(player));
		                db.updateColor(player, player.color);
    					break;
    				}
    				case 1200009000: //PATENTE FALSA
    				{
    					player.coupon.false_rank = invent.effect;
		                sendPacket(new PLAYER_COUPON_INFO_ACK(player));
		                db.updateFRank(player, player.coupon.false_rank);
		                if (room != null)
		                	room.updateInfo();
    					break;
    				}
    				case 1200014000: //COR DA MIRA
    				{
    					player.coupon.cor_mira = invent.effect;
		                sendPacket(new PLAYER_COUPON_INFO_ACK(player));
		                db.updateCorMira(player, player.coupon.cor_mira);
    					break;
    				}
    			}
                if (cup.value > 0)
                {
	             	player.coupon.effects1 = CuponsPISTOLA.gI().couponCalcule(player, 1);
                	player.coupon.effects2 = CuponsPISTOLA.gI().couponCalcule(player, 2);
                	player.coupon.effects3 = CuponsPISTOLA.gI().couponCalcule(player, 3);
                	player.coupon.effects4 = CuponsPISTOLA.gI().couponCalcule(player, 4);
                	player.coupon.effects5 = CuponsPISTOLA.gI().couponCalcule(player, 5);
                }
    		}
	    	else
	    	{
	    		if (invent.slot == 11)
    			{
	    			int error = 1;
	    			try
	    			{
	    				switch (invent.item_id)
			    		{
				    		case 1301047000: //ALTERAR NICK
				    		{
				    			try
				    			{
				    				if (player.novo_nome.length() >= 2)
				    				{
					    				String oldname = player.name;
						    			player.name = player.novo_nome;
						    			if (room != null)
						                {
						    				for (int i = 0; i < 16; i++)
						    				{
						    					Player m = room.getPlayerBySlot(i);
						    					if (m != null)
						    						m.connection.sendPacket(new ROOM_GET_NICKNAME_ACK(player));
						    				}
						                }
						                sendPacket(new PLAYER_UPDATE_NICK_ACK(player));
						    			db.updateNick(player, player.name);
						    			db.REPLACE_NICK(player.id, player.name);
						    			EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(player, false, true, true);
						    			Logger.gI().info("nicks", null, "Conta '" + oldname + "' trocou o apelido para '" + player.name + "' [" + player.id + "]", getClass());
						    			player.novo_nome = "";
				    				}
				    				else
				    				{
				    					error = 0x80000000;
				    				}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301048000: //RESETAR P/V/D
				    		{
				    			player.stats.partidas = 0;
				    			player.stats.ganhou = 0;
				    			player.stats.perdeu = 0;
				    			sendPacket(new PLAYER_UPDATE_STATS_ACK(player.stats));
				    			db.executeQuery("UPDATE jogador_estatisticas SET partidas='0', ganhou='0', perdeu='0' WHERE player_id='" + player.id + "'");
				    			break;
				    		}
				    		case 1301049000: //RESETAR K/D
				    		{
				    			player.stats.matou = 0;
				    			player.stats.morreu = 0;
				    			player.stats.headshots = 0;
				    			sendPacket(new PLAYER_UPDATE_STATS_ACK(player.stats));
				    			db.executeQuery("UPDATE jogador_estatisticas SET matou='0', morreu='0', headshots='0' WHERE player_id='" + player.id + "'");
				    			break;
				    		}
				    		case 1301050000: //RESETAR D
				    		{
				    			player.stats.kitou = 0;
				    			sendPacket(new PLAYER_UPDATE_STATS_ACK(player.stats));
				    			db.executeQuery("UPDATE jogador_estatisticas SET kitou='0' WHERE player_id='" + player.id + "'");
				    			break;
				    		}
				    		case 1301114000: //500 DE GOLD
				    		{
				    			try
				    			{
					    			player.gold += 500;
					    			sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, 500));
					    			db.updateGold(player);
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301115000: //1K DE GOLD
				    		{
				    			try
				    			{
					    			player.gold += 1000;
					    			sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, 1000));
					    			db.updateGold(player);
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301116000: //5K DE GOLD
				    		{
				    			try
				    			{
					    			player.gold += 5000;
					    			sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, 5000));
					    			db.updateGold(player);
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301117000: //10K DE GOLD
				    		{
				    			try
				    			{
					    			player.gold += 10000;
					    			sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, 10000));
					    			db.updateGold(player);
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301118000: //30K DE GOLD
				    		{
				    			try
				    			{
					    			player.gold += 30000;
					    			sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, 30000));
					    			db.updateGold(player);
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1200005000: //COR DO NOME DO CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					                if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
				    				{
			    						c.color = invent.effect;
			    						ck.ATUALIZAR_INFO(c);
			    						db.updateClanColor(c.id, c.color);
				    				}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301052000: //EMBLEMA DO CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					                if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
						    		{
						    			c.logo = player.clan_logo;
						    			for (Player j : ck.getPlayers(c))
						    			{
						    				if (j != null && j.connection != null)
						    				{
						    					j.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, j.gold));
						    					Room r = EssencialUtil.gI().BUSCAR_SALA_JOGADOR(j.id);
						    					if (r != null)
						    						r.updateInfo();
						    				}
						    			}
						    			db.updateClanLogo(c);
						    		}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301056000: //REINICIAR PONTOS DO CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					                if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
						    		{
						    			c.pontos = 1000;
			    						ck.ATUALIZAR_INFO(c);
						    			db.updateClanPontos(c);
						    		}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301051000: //ALTERAR NOME DO CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					                if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
					    			{
					    				if (!EssencialUtil.gI().VERIFICAR_APELIDO_DO_CLAN(player, player.clan_nome) && !EssencialUtil.gI().CS_CHECKED_NAME(player.id, player.clan_nome))
					    				{
						    				String oldname = c.name;
							    			c.name = player.clan_nome;
							    			for (Player j : ck.getPlayers(c))
							    			{
							    				if (j != null && j.connection != null)
							    				{
							    					j.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, j.gold));
							    					Room r = EssencialUtil.gI().BUSCAR_SALA_JOGADOR(j.id);
							    					if (r != null)
							    						r.updateInfo();
							    				}
							    			}
							    			db.updateClanName(c);
							    			Logger.gI().info("clans", null, "Clan '" + oldname + "' trocou o nome para '" + c.name + "' [" + c.id + "]", getClass());
					    				}
					    				else
					    				{
					    					error = 0x80000000;
					    				}
					    			}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301053000: //RESETAR V/D CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					    			if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
					    			{
						    			c.vitorias = 0;
						    			c.derrotas = 0;
			    						ck.ATUALIZAR_INFO(c);
						    			db.updateVDclan(c);
					    			}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301055000: //+50 MEMBROS NO CLAN
				    		{
				    			try
				    			{
					                Clan c = ck.getClanId(player.clan_id);
					                if (c != null && player.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
					    			{
					    				if ((c.vagas + 50) <= 250)
					    				{
							    			c.vagas += 50;
							    			sendPacket(new CLAN_ITEM_MAX_PLAYERS_ACK(c.vagas));
				    						ck.ATUALIZAR_INFO(c);
							    			db.updateVagasClan(c);
					    				}
					    			}
					    			else
					    			{
					    				error = 0x80000000;
					    			}
				    			}
				    			catch (Exception e)
				    			{
				    				failedEquip(e, error);
				    			}
				    			break;
				    		}
				    		case 1301085000: //INSPECIONAR USUARIO
				    		{
					    		if (room != null)
					    		{
						    		Player pR = room.getPlayerBySlot(invent.effect);
						    		if (pR != null)
						    			sendPacket(new ROOM_INSPECT_PLAYER_ACK(pR));
					    		}
				    			break;
				    		}
				    		default:
				    		{
				    			error = 0x80000000;
				    			break;
				    		}
			    		}
	    			}
	    			catch (Exception e)
	    			{
	    			}
	                sendPacket(new INVENTORY_ITEM_EQUIP_ACK(invent, player, error, true));
	                if (opcode == 536 && error == 1)
	                	sendPacket(new INVENTORY_ITEM_EQUIP2_ACK(invent.object, error));
    			}
    			else
    			{
    				invent.count = date.getDateTime(invent.count / 86400);
    				invent.equip = 2;
	        		sendPacket(new INVENTORY_ITEM_EQUIP_ACK(invent, player, 1, false));
	        		player.updateCountAndEquip(invent);
    			}
	    	}
    	}
    	catch (Exception e)
    	{
    		excp(e);
    		sendPacket(new INVENTORY_ITEM_EQUIP_ACK(null, null, 0x80000000, false));
    	}
    }
    public void failedEquip(Exception e, int error)
    {
    	if (e != null)
    		excp(e);
    	error = 0x80000000;
    }
    public void randomBox() throws Exception
    {
    	if (invent != null)
    	{
    		boolean jackpot = false;
	    	Random random = new Random();
	    	if (box != null)
	    	{
		    	int resultado = random.nextInt(box.total + 1);
	        	if (randomizar(box, resultado)) resultado = random.nextInt(box.total - 1);
	        	if (randomizar(box, resultado)) resultado = random.nextInt(box.total + 2);
	        	if (randomizar(box, resultado)) resultado = random.nextInt(box.total - 1);
	        	if (randomizar(box, resultado)) resultado = random.nextInt(box.total);
	        	if (resultado > box.total) resultado = box.total;
				sendPacket(new INVENTORY_RANDOMBOX_ACK(invent.item_id, resultado));
				sendPacket(new INVENTORY_ITEM_EQUIP_ACK(invent, player, 1, true));
		    	for (RandomBoxReward r : box.items)
		    	{
					if (r.random == resultado)
					{
						if (r.equip == 1 && r.item_id > 0)
							sendPacket(new INVENTORY_ITEM_CREATE_ACK(player, r.item_id, r.count, 1, -1, true));
						else if (r.equip == 21 && r.count > 0)
						{
							player.gold += r.count;
							sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(player));
							db.updateGold(player);
						}
						if (r.jackpot)
							jackpot = true;
					}
		    	}
		    	if (jackpot)
		    		for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
						if (pR != null && pR.connection != null)
							pR.connection.sendPacket((new INVENTORY_ITEM_JACKPOT_ACK(player.name, box.id, resultado)));
				random = null;
	    	}
	    	else
	    	{
	    		throw new Exception("Randombox nao sincronizada.");
	    	}
    	}
    }
    public boolean randomizar(RandomBox box, int valor)
    {
    	for (RandomBoxReward r : box.items)
    	{
			if (r.random == valor)
			{
				if (r.equip == 1 && r.item_id > 0)
					if (r.count >= 2592000)
						return true;
				else if (r.equip == 21 && r.count > 0)
					if (r.count >= 50000)
						return true;
			}
		}
    	return false;
    }
}