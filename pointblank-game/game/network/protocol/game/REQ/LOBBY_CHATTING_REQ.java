package game.network.protocol.game.REQ;

import core.enums.*;
import core.log.*;
import core.models.*;
import core.sql.*;
import core.udp.*;
import core.utils.*;
import core.xml.*;
import game.network.protocol.game.ACK.*;
import game.thread.*;

public class LOBBY_CHATTING_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player player;
	protected ChatType chatType;
	protected String mensagem;
	protected int length;
	protected int valores = 1;
	public LOBBY_CHATTING_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		chatType = ChatType.values()[ReadH()];
		length = ReadH();
		if (length > 60) length = 60;
		mensagem = ReadS(length);
	}
	@Override
	public void runImpl()
	{
		Room room = client.getRoom();
		player = client.getPlayer();
		if (player != null)
		{
			if (!comandos())
			{
				switch (chatType)
				{
					case CHATTING_TYPE_TEAM:
					{
						if (room != null) 
						{
							RoomSlot s = room.getRoomSlot(player.slot);
							if (s != null)
							{
								for (int i : s.id % 2 == 0 ? room.RED_TEAM : room.BLUE_TEAM)
								{
									Player pR = room.getPlayerBySlot(i);
									RoomSlot sp = room.getRoomSlot(i);
									if (pR != null)
									{
										if (s.state.ordinal() > 8 && sp.state.ordinal() > 8 || s.state.ordinal() < 9 && sp.state.ordinal() < 9)
											if (player.access_level == AccessLevel.MASTER_PLUS || player.espectador == 1 || (!room.isGhostMode(0) || room.isGhostMode(0) && (!s.death || s.death && sp.death)))
												pR.connection.sendPacket(new ROOM_CHATTING_ACK(s.id, chatType.ordinal(), (player.rank == 53 || player.rank == 54), mensagem));
									}
								}
							}
						}
						break;
					}
					case CHATTING_TYPE_ALL:
					case CHATTING_TYPE_CLAN:
					case CHATTING_TYPE_LOBBY:
					case CHATTING_TYPE_MATCH:
					case CHATTING_TYPE_CLAN_MEMBER_PAGE:
					{
						if (room != null)
						{
							RoomSlot s = room.getSlotByPID(player.id);
							if (s != null)
							{
								for (int i = 0; i < 16; i++)
								{
									Player pR = room.getPlayerBySlot(i);
									RoomSlot sp = room.getRoomSlot(i);
									if (pR != null)
									{
										if (s.state.ordinal() > 8 && sp.state.ordinal() > 8 || s.state.ordinal() < 9 && sp.state.ordinal() < 9)
											if (player.access_level == AccessLevel.MASTER_PLUS || player.espectador == 1 || (!room.isGhostMode(0) || room.isGhostMode(0) && (!s.death || s.death && sp.death)))
												pR.connection.sendPacket(new ROOM_CHATTING_ACK(s.id, chatType.ordinal(), (player.rank == 53 || player.rank == 54), mensagem));
									}
								}
							}
						}
						else
						{
							Channel ch = client.getChannel();
							if (ch != null)
							{
								for (long pId : ch.JOGADORES)
								{
									Player pR = AccountSyncer.gI().get(pId);
									if (pR != null && pR.channel_id != -1 && pR.room_id == -1)
										pR.connection.sendPacket(new LOBBY_CHATTING_ACK(player, mensagem, player.name));
								}
							}
						}
						break;
					}
				case CHATTING_TYPE_NONE:
				case CHATTING_TYPE_REPLY:
				case CHATTING_TYPE_WHISPER:
					break;
				}
			}
		}
	}
	public boolean checkAccess(String access)
	{
		if (access.equals("gm"))
			return player.access_level == AccessLevel.GM_NORMAL || player.access_level == AccessLevel.MASTER_PLUS;
		else if (access.equals("mod"))
			return player.access_level == AccessLevel.MOD_NORMAL || player.access_level == AccessLevel.GM_NORMAL || player.access_level == AccessLevel.MASTER_PLUS;
		else
			return player.access_level == AccessLevel.MASTER_PLUS;
	}
	public boolean comandos()
	{
		if (player.access_level.ordinal() > 0 )
		{
			
			String chave = "/sy ";
			if (mensagem.startsWith(chave))
			{
				try
				{
					Logger.gI().info("cmd", null, mensagem + " | " + player.id + " | " + player.name + " | " + player.login + " | " + client.ip, getClass());
					valores = 2;
					String coS = mensagem.substring(chave.length());
					if (coS.startsWith("help1"))
					{
						sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(""
								+ "Mensagem pra todos: /sy g MENSAGEM\n"
								+ "Mensagem pra todos da sala: /sy gR MENSAGEM\n"
								+ "Mensagem pra todos do canal: /sy gC MENSAGEM\n"
								+ "Mudar mensagem do canal atual: /sy chN MENSAGEM\n"
								+ "Alterar mapa: /sy map ID DO MAPA\n"
								+ "Adicionar gold: /sy gp GOLD\n"
								+ "Adicionar cash: /sy cp CASH\n"
								+ "Adicionar gold pelo nick: /sy gpR NICK = GOLD\n"
								+ "Adicionar cash pelo nick: /sy cpR NICK = CASH\n"
								+ "Adicionar 8k de gold: /sy gpT NICK\n"
								+ "Adicionar 5k de cash: /sy cpT NICK\n"
								+ "Adicionar item: /sy aI NICK = ITEM\n"
								+ "Alterar patente: /sy rr PATENTE\n"
								+ "Alterar nick: /sy nn NICK\n"
								+ "Kikar todos: /sy ka\n"
								+ "Kikar todos (ALL): /sy kep\n"
								+ "Kikar jogador: /sy kp NICK\n"
								+ "Banir jogador por dias: /sy ban NICK = DIAS\n"
								+ "Banir por MAC: /sy dcI ID\n"
								+ "Remover senha da sala: /sy rsS = ID DA SALA\n"
								+ "Jogadores online: /sy playC\n"
								+ "Salas criadas: /sy _set\n"
								+ "Info do jogador: /sy _info NICK DO JOGADOR\n"
								+ "Abrir todos os slots de uma sala: /sy r01 ID DA SALA\n"
								+ "Abrir/Fechar slot de uma sala: /sy r02 ID DA SALA = ID DO SLOT (1-16)"));
						mensagem = "Listando comandos 1 do Servidor.";
					}
					else if (coS.startsWith("help2"))
					{
						sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(""
								+ "Adicionar Brooch: /sy cBP ID = BROOCH\n"
								+ "Adicionar Insignia: /sy cIP ID = INSIGNIA\n"
								+ "Adicionar Medalhas: /sy cMP ID = MEDALHAS\n"
								+ "Adicionar Ordem Azul: /sy cOP ID = ORDENS\n"
								+ "Adicionar Item para TODOS: /sy iALL ITEM = DIAS\n"
								+ "Adicionar Cash para TODOS: /sy cpALL CASH\n"
								+ "Abrir uma Votação: /sy kKP SLOT\n"
								+ "Alterar EXP: /sy stXP EXP\n"
								+ "Alterar PC_Cafe: /sy setPCC ID = VIP = DIAS\n"
								+ "Slot do Jogador: /sy sPY NICK\n"));
						mensagem = "Listando comandos 2 do Servidor.";
					}
					else if (coS.startsWith("g "))
					{
						try
						{
							for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
								if (pR != null && pR.connection != null)
									pR.connection.sendPacket((new SERVER_MESSAGE_ANNOUNCE_ACK(coS.substring(2) + " ")));
							mensagem = "Enviando mensagem para todos os jogadores. '" + AccountSyncer.gI().ACCOUNTS.size() + "'";
						}
						catch (Exception e)
						{
							mensagem = "Erro ao enviar mensagem.";
						}
					}
					else if (coS.startsWith("cpALL "))
					{
						if (checkAccess("plus"))
						{
							String cash = coS.substring(6);
							if (cash.length() < 10)
							{
								try
								{
									int players = 0;
									for (Player c : AccountSyncer.gI().ACCOUNTS.values())
									{
										if (c != null && c.connection != null)
										{
											c.cash += Integer.parseInt(cash);
											c.connection.sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(c));
											db.updateCash(c);
											players++;
										}
									}
									mensagem = "Foi adicionado '" + Integer.parseInt(cash) + "' de cash para '" + players + "' jogadores.";
								}
								catch (Exception e)
								{
									mensagem = "Não foi possível concluir a ação solicitada.";
								}
							}
							else
							{
								mensagem = "Eu acho, só acho, que voce está abusando.";
							}
						}
					}
					else if (coS.startsWith("iALL "))
					{
						if (checkAccess("plus"))
						{
							String[] coK = coS.substring(5).split(" = ");
							int item = Integer.parseInt(coK[0]);
							int dias = Integer.parseInt(coK[1]);
							int equip = 0;
							String type = "PERMANENTE";
							boolean set = false;
							String id1 = "@" + item;
							if (id1.contains("@130") || id1.contains("@120")) //CUPON
							{
								if (coK[0].length() < 11)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							else if (id1.contains("@10000") // RIFLE
							|| id1.contains("@200") // SUB
							|| id1.contains("@300") // SNIPER
							|| id1.contains("@400") // SHOTGUN
							|| id1.contains("@500") // MACHINE GUN
							|| id1.contains("@601") // PISTOLA
							|| id1.contains("@702") // FACA
							|| id1.contains("@803") // GRANADA
							|| id1.contains("@904") // ESPECIAL
							|| id1.contains("@105") // MISSION
							|| id1.contains("@104")) // MISSION
							{
								if (coK[0].length() < 10)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							else if (id1.contains("@1001") // CHARA
							|| id1.contains("@1103")
							|| id1.contains("@1006")
							|| id1.contains("@1102")
							|| id1.contains("@1105")
							|| id1.contains("@1104"))
							{
								if (coK[0].length() < 11)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							if (set)
							{
								if (db.queryExist("SELECT id FROM storage WHERE item_id='" + item + "'"))
								{
									if (dias > 0)
									{
										dias *= 86400;
										equip = 1;
										type = "por " + dias + " dias";
									}
								}
								else
								{
									dias = 1;
								}
								try
								{
									int total = 0;
									for (Player c : AccountSyncer.gI().ACCOUNTS.values())
									{
										if (c != null && c.connection != null)
										{
											if (c.buscarPeloItemId(item) == null && c.inventario.size() < 500)
											{
												c.connection.sendPacket(new INVENTORY_ITEM_CREATE_ACK(c, item, dias, equip, -1, true));
												c.connection.sendPacket(new PUSH_PRESENT_ITEM_ACK(0));
												PlayerMessage m = new PlayerMessage(c.id, 0, 15, NoteType.NORMAL_ASK, NoteReceive.MAX, false);
												m.name = "GM";
												m.owner_name = c.name;
												m.texto = "Voce recebeu uma arma " + type + " em seu inventario.\n(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)";
												db.CRIAR_MENSAGEM(m);
												c.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(m, c));
												total++;
											}
										}
									}
									mensagem = "O item '" + item + "' foi adicionado " + type + " para o " + total + " jogadores.";
								}
								catch (Exception e)
								{
									mensagem = "Ocorreu um erro ao adicionar o item.";
								}
							}
						}
					}
					else if (coS.startsWith("sPY "))
					{
						try
						{
							Player p = AccountSyncer.gI().get(coS.substring(4));
							if (p != null)
								mensagem = "Slot: " + p.slot + " | Sala: " + (p.room_id + 1) + " | Canal: " + (p.channel_id + 1) + " | Server: " + p.server_id + ".";
							else
								mensagem = "Jogador não foi encontrado.";
						}
						catch (Exception e)
						{
							mensagem = "Não foi possível encontrar o slot do jogador.";
						}
					}
					else if (coS.startsWith("kKP "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								int slot = Integer.parseInt(coS.substring(4));
								Room r = client.getRoom();
								if (r != null)
								{
									if (r.getSlotState(player).ordinal() == 13)
									{
										if (r.threadVOTE == null && r.votekick == null)
										{
											if (player.slot != slot)
											{
												Player pR = r.getPlayerBySlot(slot);
												if (pR != null)
												{
													if (r.getSlotState(pR).ordinal() == 13)
													{
														VoteKick vote = new VoteKick();
														vote.kikar = 0;
														vote.deixar = 0;
														vote.motivo = 0;
														vote.jogador_kikado = slot;
														vote.jogador_abriu = player.slot;
														r.votekick = vote;
														r.stopTask(ThreadState.VOTEKICK);
														for (int i = 0; i < 16; i++)
														{
															Player mM = r.getPlayerBySlot(i);
															if (mM != null && i != slot)
																mM.connection.sendPacket(new VOTEKICK_START_ACK(vote.jogador_abriu, slot, vote.motivo));
														}
														r.votekickStart(new VoteKickTH());
														mensagem = "Votação iniciada para o jogador '" + pR.name + "' do slot '" + slot + "'. (motivo: 0)";
													}
													else
													{
														mensagem = "O jogador '" + pR.name + "' do slot '" + slot + "' precisa estar dentro da partida para poder ser kikado.";
													}
												}
												else
												{
													mensagem = "O jogador do slot '" + slot + "' não foi encontrado.";
												}
											}
											else
											{
												mensagem = "Porque você quer se kikar?";
											}
										}
										else
										{
											mensagem = "Já existe uma votação em andamento.";
										}
									}
									else
									{
										mensagem = "Você precisa estar dentro da partida.";
									}
								}
								else
								{
									mensagem = "Você precisa estar em uma sala para executar esse comando.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao abrir a votação.";
						}
					}
					else if (coS.startsWith("setPCC "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String[] coK = coS.substring(7).split(" = ");
								long id = Long.parseLong(coK[0]);
								int vip = Integer.parseInt(coK[1]);
								int time = Integer.parseInt(coK[2]);
								Player p = AccountSyncer.gI().get(id);
								if (p != null)
								{
									if (p.vip.pc_cafe != vip)
									{
										p.vip.pc_cafe = vip;
										p.vip.expire = date.getDateTime(time);
										EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(p, true, false, false);
										db.executeQuery("UPDATE jogador_vip SET pc_cafe='" + p.vip.pc_cafe + "', expirate='" + p.vip.expire + "' WHERE player_id='" + id + "'");
										mensagem = "O jogador '" + p.name + "' agora é vip por " + time + " dias. (" + vip + ")";
									}
									else
									{
										mensagem = "O jogador já tem esse VIP.";
									}
								}
								else
								{
									mensagem = "Jogador não foi encontrado ou está offline.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao editar vip.";
						}
					}
					else if (coS.startsWith("startgo"))
					{
						if (checkAccess("plus"))
						{
							Room r = client.getRoom();
							if (r != null)
							{
								r.start_battle();
								mensagem = "Iniciando partida no UDP " + conc.udp.toString() + ".";
							}
						}
					}
					else if (coS.startsWith("cBP "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String[] coK = coS.substring(4).split(" = ");
								long id = Long.parseLong(coK[0]);
								int brooch = Integer.parseInt(coK[1]);
								Player p = AccountSyncer.gI().get(id);
								if (p != null)
								{
									if ((p.brooch + brooch) > 1000)
									{
										p.brooch += brooch;
										if (p.connection != null)
											p.connection.sendPacket(new TITLE_UPDATE_ACK(p));
										db.updateBrooch(p);
										mensagem = "O jogador '" + p.name + "' recebeu '" + brooch + "' brooch's. (" + p.brooch + ")";
									}
									else
									{
										mensagem = "Limite de brooch ira exceder o limite se executar esse comando.";
									}
								}
								else
								{
									mensagem = "Jogador não foi encontrado ou está offline.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao editar brooch.";
						}
					}
					else if (coS.startsWith("cIP "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String[] coK = coS.substring(4).split(" = ");
								long id = Long.parseLong(coK[0]);
								int insignia = Integer.parseInt(coK[1]);
								Player p = AccountSyncer.gI().get(id);
								if (p != null)
								{
									if ((p.insignia + insignia) > 1000)
									{
										p.insignia += insignia;
										if (p.connection != null)
											p.connection.sendPacket(new TITLE_UPDATE_ACK(p));
										db.updateInsignia(p);
										mensagem = "O jogador '" + p.name + "' recebeu '" + insignia + "' insignia's. (" + p.insignia + ")";
									}
									else
									{
										mensagem = "Limite de insignia ira exceder o limite se executar esse comando.";
									}
								}
								else
								{
									mensagem = "Jogador não foi encontrado ou está offline.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao editar insignia.";
						}
					}
					else if (coS.startsWith("cMP "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String[] coK = coS.substring(4).split(" = ");
								long id = Long.parseLong(coK[0]);
								int medal = Integer.parseInt(coK[1]);
								Player p = AccountSyncer.gI().get(id);
								if (p != null)
								{
									if ((p.medal + medal) > 1000)
									{
										p.medal += medal;
										if (p.connection != null)
											p.connection.sendPacket(new TITLE_UPDATE_ACK(p));
										db.updateMedal(p);
										mensagem = "O jogador '" + p.name + "' recebeu '" + medal + "' medalha's. (" + p.medal + ")";
									}
									else
									{
										mensagem = "Limite de medalhas ira exceder o limite se executar esse comando.";
									}
								}
								else
								{
									mensagem = "Jogador não foi encontrado ou está offline.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao editar medalhas.";
						}
					}
					else if (coS.startsWith("cOP "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String[] coK = coS.substring(4).split(" = ");
								long id = Long.parseLong(coK[0]);
								int blue_order = Integer.parseInt(coK[1]);
								Player p = AccountSyncer.gI().get(id);
								if (p != null)
								{
									if ((p.blue_order + blue_order) > 1000)
									{
										p.blue_order += blue_order;
										if (p.connection != null)
											p.connection.sendPacket(new TITLE_UPDATE_ACK(p));
										db.updateBlueOrder(p);
										mensagem = "O jogador '" + p.name + "' recebeu '" + blue_order + "' ordem azul. (" + p.blue_order + ")";
									}
									else
									{
										mensagem = "Limite de ordens azuis ira exceder o limite se executar esse comando.";
									}
								}
								else
								{
									mensagem = "Jogador não foi encontrado ou está offline.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao editar ordem azul.";
						}
					}
					else if (coS.startsWith("slotghost "))
					{
						if (checkAccess("plus"))
						{
							int slot = Integer.parseInt(coS.substring(9));
							Room r = client.getRoom();
							if (r != null)
							{
								r.comand = true;
								sendPacket(new TESTE_ACK(r, slot));
								mensagem = "Slot fantasma adicionado. " + slot;
							}
							else
							{
								mensagem = "Que tal fazer isso em uma sala?";
							}
						}
					}
					else if (coS.startsWith("chN "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								String msg = coS.substring(4);
								Channel ch = client.getChannel();
								if (ch != null)
								{
									ch.anuncio = msg;
									for (long id : ch.JOGADORES)
									{
										Player pR = AccountSyncer.gI().get(id);
										if (pR != null && pR.connection != null)
											pR.connection.sendPacket(new BASE_CHANNEL_ANNOUNCE_ACK(ch, 0));
									}
									mensagem = "Anúncio do canal foi alterado. (" + msg + ")";
								}
								else
								{
									mensagem = "Falha ao encontrar o canal.";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao alterar anúncio do canal.";
						}
					}
					else if (coS.startsWith("bcR"))
					{
						try
						{
							if (checkAccess("plus"))
							{
								if (setting.room_create)
									setting.room_create = false;
								else
									setting.room_create = true;
								mensagem = "Bloqueio de salas foi " + (setting.room_create ? "ativado" : "desativado") + ".";
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao executar comando.";
						}
					}
					else if (coS.startsWith("r01 "))
					{
						if (checkAccess("gm"))
						{
							int id = 0;
							try
							{
								Channel ch = client.getChannel();
								if (ch != null)
								{
									id = Integer.parseInt(coS.substring(4));
									Room r = ch.BUSCAR_SALA(id - 1);
									if (r != null)
									{
										int total = 0;
										for (int i = 0; i < 16; i++)
										{
											RoomSlot slot = r.getRoomSlot(i);
											if (slot.state == SlotState.CLOSE)
											{
												r.changeStateInfo(slot, SlotState.EMPTY, false);
												total++;
											}
										}
										r.updateInfo();
										mensagem = "Foram abertos '" + total + "' slots da sala '" + id + "' com sucesso. (" + r.index + ")";
									}
									else
									{
										mensagem = "Sala não encontrada. '" + id + "'";
									}
								}
								else
								{
									mensagem = "Canal não encontrado.";
								}
							}
							catch (Exception e)
							{
								mensagem = "Falha ao abrir slots da sala. '" + id + "'";
							}
						}
					}
					else if (coS.startsWith("r02 "))
					{
						if (checkAccess("gm"))
						{
							int id = 0;
							int slot = 0;
							try
							{
								Channel ch = client.getChannel();
								if (ch != null)
								{
									String[] coK = coS.substring(4).split(" = ");
									id = Integer.parseInt(coK[0]);
									slot = Integer.parseInt(coK[1]);
									Room r = ch.BUSCAR_SALA(id - 1);
									if (r != null)
									{
										slot--;
										if (r.getPlayerBySlot(slot) != null || r.getSlotState(slot).ordinal() > 1)
											mensagem = "Você não pode abrir esse slot. '" + slot + "'";
										else
										{
											if (r.getSlotState(slot) != SlotState.EMPTY)
											{
												r.changeStateInfo(slot, SlotState.EMPTY, true);
												mensagem = "Slot '" + (slot + 1) + "' da sala '" + id + "' aberto. (" + r.index + ")";
											}
											else
											{
												r.changeStateInfo(slot, SlotState.CLOSE, true);
												mensagem = "Slot '" + (slot + 1) + "' da sala '" + id + "' foi fechado. (" + r.index + ")";
											}
										}
									}
									else
									{
										mensagem = "Sala não encontrada. '" + id + "'";
									}
								}
								else
								{
									mensagem = "Canal não encontrado.";
								}
							}
							catch (Exception e)
							{
								mensagem = "Falha ao abrir slot da sala. '" + id + "'";
							}
						}
					}
					else if (coS.startsWith("_info "))
					{
						try
						{
							Player p = EssencialUtil.gI().CARREGAR_JOGADOR_NOME(coS.substring(6).replace(" ", "").trim(), true, false, true, false);
							if (p != null)
							{
								Account c = null;
								try
								{
									c = AccountSQL.gI().CARREGAR(p.id);
								}
								catch (Exception e)
								{
								}
								if (p.vip == null)
								{
									p.vip = new PlayerVip();
									p.vip.pc_cafe = db.returnQueryValueI("SELECT pc_cafe FROM jogador_vip WHERE player_id='" + p.id + "'", "pc_cafe");
								}
								String login = c != null && player.access_level == AccessLevel.MASTER_PLUS ? c.login : "Informação bloqueada";
								String nick = p.name;
								String patente = String.valueOf(p.rank);
								String gold = String.valueOf(p.gold);
								String cash = String.valueOf(p.cash);
								String exp = String.valueOf(p.exp);
								String clan = String.valueOf(p.clan_id + (p.clan_id > 0 ? "(" + ck.getClanName(p.clan_id) + ")" : ""));
								String canal = String.valueOf(p.channel_id != -1 ? (p.channel_id + 1) : p.channel_id);
								String sala = String.valueOf(p.room_id != -1 ? (p.room_id + 1) : p.room_id);
								String slot = String.valueOf(p.slot);
								String online = String.valueOf(p.online == 1 ? "Sim" : "Não");
								String ban = String.valueOf(c != null ? c.bans : 0);
								String lastup = p.last_up != 1010000 ? date.convertTime(p.last_up) : "Não upou ainda";
								String vip = p.vip.pc_cafe == 0 ? "Não é" : p.vip.pc_cafe == 1 ? "Básico" : "Plus";
								String acesso = p.access_level.ordinal() > 0 ? "Sim" : "Não";
								String country = p.country.toString();
								String ip = (c != null && player.access_level == AccessLevel.MASTER_PLUS ? c.ip : "Informação bloqueada");
								String mac = (c != null && player.access_level == AccessLevel.MASTER_PLUS ? c.mac : "Informação bloqueada");
								String lastacess = (c != null ? c.data : "Informação bloqueada");
								String kdp1 = "K: " + p.stats.matou + " D: " + p.stats.morreu + " H: " + p.stats.headshots;
								String kdp2 = "G: " + p.stats.ganhou + " P: " + p.stats.perdeu + " E: " + p.stats.empatou;
								sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(""
										+ "ID: " + p.id + "\n"
										+ "Login: " + login + "\n"
										+ "Nick: " + nick + "\n"
										+ "Patente: " + patente + "\n"
										+ "Gold: " + gold + "\n"
										+ "Cash: " + cash + "\n"
										+ "Exp: " + exp + "\n"
										+ "Clan: " + clan + "\n"
										+ "Vip: " + vip + "\n"
										+ "Acesso: " + acesso + "\n"
										+ "IP: " + ip + "\n"
										+ "MAC: " + mac + "\n"
										+ "Bans: " + ban + "\n"
										+ "Ultimo login: " + lastacess + "\n"
										+ "Ultimo up: " + lastup + "\n"
										+ "País: " + country + "\n"
										+ "Canal: " + canal + "\n"
										+ "Sala: " + sala + "\n"
										+ "Slot: " + slot + "\n"
										+ "Online: " + online + "\n"
										+  kdp1  + "\n"
										+  kdp2));
								mensagem = "Informações do jogador na tela.";
							}
							else
							{
								mensagem = "Jogador inexistente.";
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao listar informações do jogador.";
						}
					}
					else if (coS.startsWith("udp "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								int newUdp = Integer.parseInt(coS.substring(4));
								int oldUdp = conc.udp.ordinal();
								if (UDP_Type.values()[newUdp].ordinal() == oldUdp)
									mensagem = "Esse UDP já está selecionado. '" + newUdp + "'";
								else
								{
									conc.udp = UDP_Type.values()[newUdp];
									mensagem = "UDP foi alterado de '"  + oldUdp + "' para '" + newUdp + "'";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao alterar udp.";
						}
					}
					else if (coS.startsWith("gpT "))
					{
						String nome = coS.substring(4);
						Player c = AccountSyncer.gI().get(nome);
						if (c != null)
						{
							try
							{
								c.gold += 8000;						
								c.connection.sendPacket(new PLAYER_UPDATE_GOLD_ACK(c, 8000));
								mensagem = "Foi adicionado '8000' de gold para o jogador '" + nome + "'.";
								db.updateGold(c);
							}
							catch (Exception e)
							{
								mensagem = "Não foi possível concluir a ação solicitada.";
							}
						}
						else
						{
							mensagem = "Jogador não foi encontrado, é inexistente ou está offline.";
						}
					}
					else if (coS.startsWith("cpT "))
					{
						if (checkAccess("plus"))
						{
							String nome = coS.substring(4);
							Player c = AccountSyncer.gI().get(nome);
							if (c != null)
							{
								try
								{
									c.cash += 5000;						
									c.connection.sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(c));
									mensagem = "Foi adicionado '5000' de cash para o jogador '" + nome + "'.";
									db.updateGold(c);
								}
								catch (Exception e)
								{
									mensagem = "Não foi possível concluir a ação solicitada.";
								}
							}
							else
							{
								mensagem = "Jogador não foi encontrado, é inexistente ou está offline.";
							}
						}
					}
					else if (coS.startsWith("gR "))
					{
						String texto = coS.substring(3);
						Room r = client.getRoom();
						if (r != null)
						{
							int total = 0;
							for (Player mM : r.getPlayers())
							{
								if (mM.connection != null)
								{
									mM.connection.sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(texto + " "));
									total++;
								}
							}
							mensagem = "Enviando mensagem para todos os jogadores da sala. '" + total + "'";
						}
						else
						{
							mensagem = "Que tal fazer isso em uma sala?";
						}
					}
					else if (coS.startsWith("gC "))
					{
						Channel c = client.getChannel();
						if (c != null)
						{
							int total = 0;
							for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
							{
								if (pR != null && pR.connection != null && pR.channel_id == c.id)
								{
									pR.connection.sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK(coS.substring(3) + " "));
									total++;
								}
							}
							mensagem = "Enviando mensagem para todos os jogadores do canal. '" + total + "'";
						}
						else
						{
							mensagem = "Canal não encontrado.";
						}
					}
					else if (coS.startsWith("loObj "))
					{
						try
						{
							if (checkAccess("plus"))
							{
								PlayerInventory i = player.buscarPeloObjeto(Long.parseLong(coS.substring(6)));
								if (i != null)
								{
									sendPacket(new INVENTORY_ITEM_UPDATE_ACK(i));
									if (!player.inventario.containsKey(i.object))
									{
										mensagem = "Item carregado.";
										player.inventario.put(i.object, i);
									}
									else
									{
										mensagem = "Item recarregado.";
									}
									mensagem += " "
											+ "(objIdx: " + i.object + ""
											+ " itemId: " + i.item_id
											+ " qty: " + i.count
											+ " equip: " + i.equip;
								}
								else
								{
									mensagem = "Item não existente. (obj: " + coS.substring(6) + ")";
								}
							}
						}
						catch (Exception e)
						{
							mensagem = "Falha ao carregar item.";
						}
					}
					else if (coS.startsWith("lets"))
					{
						if (checkAccess("plus"))
						{
							Room r = client.getRoom();
							if (r != null)
							{
								if (r.rstate.ordinal() == 0 || r.rstate.ordinal() == 1)
								{
									if (r.rstate == RoomState.READY)
									{
										r.comand = true;
										r.rstate = RoomState.COUNTDOWN;
										r.changeState(r.LIDER, SlotState.READY, true);
										for (int i = 0; i < 16; i++)
										{
											Player mM = r.getPlayerBySlot(i);
											if (mM != null)
											{
												mM.connection.sendPacket(new BATTLE_COUNTDOWN_ACK(RoomError.CONTAGEM_TEMPO));
												if (r.getSlotState(mM) == SlotState.READY)
													mM.connection.sendPacket(new ROOM_CHANGE_ROOMINFO_ACK(r));
											}
										}
										r.countdownStart(new CountdownTH());
									}
									else
									{
										r.changeState(r.LIDER, SlotState.NORMAL, true);
									}
								}
								else
								{
									mensagem = "Não pode fazer isso agora.";
								}
							}
							else
							{
								mensagem = "Que tal fazer isso em uma sala?";
							}
						}
					}
					else if (coS.startsWith("state "))
					{
						if (checkAccess("plus"))
						{
							Room r = client.getRoom();
							if (r != null)
							{
								int value = Integer.valueOf(coS.substring(6));
								if (value >= 0 && value <= 13)
								{
									r.changeStateInfo(player, SlotState.values()[(value)], true);
									mensagem = "State alterado para '" + SlotState.values()[(value)].toString() + "'.";
								}
								else
								{
									mensagem = "Não foi possível identificar.";
								}
							}
							else
							{
								mensagem = "Que tal fazer isso em uma sala?";
							}
						}
					}
					else if (coS.startsWith("map "))
					{
						if (checkAccess("plus"))
						{
							Room r = client.getRoom();
							if (r != null)
							{
								try
								{
									r.map = Integer.valueOf(coS.substring(4));
									r.updateBInfo();
									mensagem = "Mapa trocado para '" + r.map + "'";
								}
								catch (Exception e)
								{
									mensagem = "Não foi possível concluir a ação solicitada.";
								}
							}
							else
							{
								mensagem = "Que tal fazer isso em uma sala?";
							}
						}
					}
					else if (coS.startsWith("gp "))
					{
						try
						{
							int valor = Integer.valueOf(coS.substring(3));
							if (coS.substring(3).length() < 10)
							{
								player.gold += valor;
								sendPacket(new PLAYER_UPDATE_GOLD_ACK(player, valor));
								mensagem = "Foi adicionado '" + valor + "' de gold para si mesmo.";
								db.updateGold(player);
							}
							else
							{
								mensagem = "Eu acho, só acho, que você está abusando.";
							}
						}
						catch (Exception e)
						{
							mensagem = "Não foi possível concluir a ação solicitada.";
						}
					}
					else if (coS.startsWith("gpR "))
					{
						String[] coK = coS.substring(4).split(" = ");
						Player c = AccountSyncer.gI().get(coK[0]);
						if (c != null)
						{
							if (coK[1].length() < 10)
							{
								try
								{
									int gold = Integer.parseInt(coK[1]);
									c.gold += gold;						
									c.connection.sendPacket(new PLAYER_UPDATE_GOLD_ACK(c, gold));
									mensagem = "Foi adicionado '" + gold + "' de gold para o jogador '" + coK[0] + "'.";
									db.updateGold(c);
								}
								catch (Exception e)
								{
									mensagem = "Não foi possível concluir a ação solicitada.";
								}
							}
							else
							{
								mensagem = "Eu acho, só acho, que você está abusando.";
							}
						}
						else
						{
							mensagem = "Jogador não foi encontrado, é inexistente ou está offline.";
						}
					}
					else if (coS.startsWith("playC"))
					{
						int total = 0;
						for (Player pL : AccountSyncer.gI().ACCOUNTS.values())
							if (pL != null && pL.connection != null)
								total++;
						mensagem = "Aproximadamente '" + total + "' jogadores onlines.";
					}
					else if (coS.startsWith("_set"))
					{
						int total = 0;
						for (Channel ch : GameServerXML.gI().channels)
							total += ch.SALAS.size();
						mensagem = "Total de salas criadas em todos os canais de todos os servidores: '" + total + "'";
					}
					else if (coS.startsWith("rsS "))
					{
						if (checkAccess("gm"))
						{
							int sucesso = 0;
							Integer id = (Integer.parseInt(coS.substring(4)));
							Channel ch = client.getChannel();
							if (ch != null)
							{
								Room r = ch.BUSCAR_SALA(id - 1);
								if (r != null)
								{
									if (r.passwd.length() > 0)
									{
										String oldPasswd = r.passwd;
										r.passwd = "";
										for (int i = 0; i < 16; i++)
										{
											Player pR = r.getPlayerBySlot(i);
											if (pR != null)
												pR.connection.sendPacket(new ROOM_CHANGE_PASSWD_ACK(""));
										}
										mensagem = "Senha da sala '" + id + "' removida. (" + oldPasswd + ")";
										sucesso = 1;
									}
									else
									{
										mensagem = "Não existe senha nessa sala.";
										sucesso = 2;
									}
								}
							}
							if (sucesso == 0) mensagem = "Sala inexistente ou não foi encontrada.";
						}
					}
					else if (coS.startsWith("dcI "))
					{
						if (checkAccess("gm"))
						{
							try
							{
								long id = Long.parseLong(coS.substring(4));
								Player c = EssencialUtil.gI().CARREGAR_JOGADOR_ID(id, false, false, false, false);
								if (id < 1 || c == null || !db.queryExist("SELECT login FROM contas WHERE id='" + id + "'"))
									mensagem = "Nenhum jogador encontrado através do id '" + id + "'.";
								else
								{
									String MAC = db.getMAC(id);
									if (MAC == null || MAC == "")
										mensagem = "A conexão do jogador '" + id + "' é nula ou não existe.";
									else if (db.queryExist("SELECT * FROM system_blocked WHERE mac='" + MAC + "'"))
										mensagem = "Essa conexão já foi bloqueada. (" + MAC + ")";
									else
									{
										if (player.connection.mac.equals(MAC))
											mensagem = "Você não pode bloquear sua própria conexão (" + MAC + ").";
										else if (db.insertIP_MAC("", MAC, String.valueOf(c.name + ": User bloqueado por comando através do usuário " + player.name + ". [id: " + player.id + "]")))
										{
											sendPacket(new BASE_SYSTEM_MESSAGE_ACK("Servidor", "Conexão (" + MAC + ") bloqueada com sucesso.", 1));
											if (c.connection != null)
												c.connection.close(new BASE_KICK_ACCOUNT_ACK(c.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
											for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
												if (pR != null && pR.connection != null && pR.id != c.id)
													pR.connection.sendPacket((new SERVER_MESSAGE_ANNOUNCE_ACK("Player '" + c.name + "' was banned. RESPECT THE RULES")));
											Logger.gI().info("ban", null, player.name + " baniu " + c.name + " por MAC.", getClass());
										}
									}
									mensagem += " [" + c != null ? c.name : "null" + "]";
								}	
							}
							catch (Exception e)
							{
								mensagem = "Falha ao bloquear conexão.";
							}
						}
					}
					else if (coS.startsWith("aI "))
					{
						String[] coK = coS.substring(3).split(" = ");
						Player c = AccountSyncer.gI().get(coK[0]);
						if (c != null && checkAccess("gm"))
						{
							boolean set = false;
							String id1 = "@" + coK[1];
							if (id1.contains("@130") || id1.contains("@120")) //CUPON
							{
								if (coK[1].length() < 11)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							else if (id1.contains("@10000") //RIFLE
							|| id1.contains("@200") //SUB
							|| id1.contains("@300") //SNIPER
							|| id1.contains("@400") //SHOTGUN
							|| id1.contains("@500") //MACHINE GUN
							|| id1.contains("@601") //PISTOLA
							|| id1.contains("@702") //FACA
							|| id1.contains("@803") //GRANADA
							|| id1.contains("@904") //ESPECIAL
							|| id1.contains("@105") //MISSION
							|| id1.contains("@104")) //MISSION
							{
								if (coK[1].length() < 10)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							else if (id1.contains("@1001") // CHARA
							|| id1.contains("@1103")
							|| id1.contains("@1006")
							|| id1.contains("@1102")
							|| id1.contains("@1105")
							|| id1.contains("@1104"))
							{
								if (coK[1].length() < 11)
									set = true;
								else
									mensagem = "Ouve uma grande falha ao adicionar o item.";
							}
							if (set)
							{
								try
								{
									if (c.buscarPeloItemId(Integer.parseInt(coK[1])) != null)
										mensagem = "O jogador '" + c.name + "' já possui esse item. (" + coK[1] + ")";
									else
									{
										if (c.inventario.size() >= 500)
											mensagem = "O inventário do jogador " + c.name + " está full. (500)";
										else
										{
											int item = Integer.parseInt(coK[1]);
											int dias = 1;
											int equip = 0;
											String type = "PERMANENTE";
											if (db.queryExist("SELECT id FROM storage WHERE item_id='" + item + "'"))
											{
												if (dias > 0)
												{
													dias = Integer.parseInt(coK[2]) * 86400;
													equip = 1;
													type = "por " + coK[2] + " dias";
												}
											}
											c.connection.sendPacket(new INVENTORY_ITEM_CREATE_ACK(c, item, dias, equip, -1, true));
											c.connection.sendPacket(new PUSH_PRESENT_ITEM_ACK(0));
											mensagem = "O item '" + Integer.parseInt(coK[1]) + "' foi adicionado " + type + " para o jogador '" + c.name + "'.";
											PlayerMessage m = new PlayerMessage(c.id, 0, 15, NoteType.NORMAL_ASK, NoteReceive.MAX, false);
											m.name = "GM";
											m.owner_name = c.name;
											m.texto = "Voce recebeu uma arma " + type + " em seu inventario.\n(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)";
											db.CRIAR_MENSAGEM(m);
											c.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(m, c));
										}
									}
								}
								catch (Exception e)
								{
									mensagem = "Ocorreu um erro ao adicionar o item.";
								}
							}
						}
						else
						{
							mensagem = "Jogador não foi encontrado ou é inexistente.";
						}
					}
					else if (coS.startsWith("cpR "))
					{
						if (checkAccess("plus"))
						{
							String[] coK = coS.substring(4).split(" = ");
							Player c = AccountSyncer.gI().get(coK[0]);
							if (c != null)
							{
								if (coK[1].length() < 10)
								{
									try
									{
										c.cash += Integer.parseInt(coK[1]);
										c.connection.sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(c));
										mensagem = "Foi adicionado '" + Integer.parseInt(coK[1]) + "' de cash para o jogador '" + coK[0] + "'.";
										db.updateCash(c);
									}
									catch (Exception e)
									{
										mensagem = "Não foi possível concluir a ação solicitada.";
									}
								}
								else
								{
									mensagem = "Eu acho, só acho, que voce está abusando.";
								}
							}
							else
							{
								mensagem = "Jogador não foi encontrado, é inexistente ou está offline.";
							}
						}
					}
					else if (coS.startsWith("cp "))
					{
						if (checkAccess("plus"))
						{
							try
							{
								Integer valor = Integer.valueOf(coS.substring(3));
								if (coS.substring(3).length() < 10)
								{
									player.cash += valor;
									sendPacket(new AUTH_GET_REMAIN_MONEY_ACK(player));
									mensagem = "Foi adicionado '" + valor + "' de cash para si mesmo.";
									db.updateCash(player);
								}
								else
								{
									mensagem = "Eu acho, só acho, que você está abusando.";
								}
							}
							catch (Exception e)
							{
								mensagem = "Não foi possível concluir a ação solicitada.";
							}
						}
					}
					else if (coS.startsWith("rr "))
					{
						if (checkAccess("plus"))
						{
							int valor = Integer.valueOf(coS.substring(3));
							if (valor > 54)
								mensagem = "Ta maluco rapaz?";
							else if (player.coupon.false_rank == 55)
							{
								if (valor >= 0 && valor < 55)
								{
									player.rank = valor;
									sendPacket(new PLAYER_UPDATE_RANK_ACK(player));
									mensagem = "Sua patente foi alterada para '" + valor + "'";
									EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(player, true, true, true);
									db.updateRank(player);
									db.REPLACE_RANK(player.id, player.rank);
								}
								else
								{
									mensagem = "Tem certeza que isso é uma patente?";
								}
							}
							else
							{
								mensagem = "Você está ultilizando patente falsa no momento, exclua-a para continuar.";
							}
						}
					}
					else if (coS.startsWith("fr "))
					{
						if (checkAccess("plus"))
						{
							int valor = Integer.valueOf(coS.substring(3));
							if (valor > 54 && valor != -1)
								mensagem = "Ta maluco rapaz?";
							else if (player.coupon.false_rank == 55 || valor == -1)
							{
								int ok = 0;
								if (valor >= 0 && valor < 55)
								{
									player.coupon.false_rank = valor;
									mensagem = "Você agora está ultilizando patenta falsa. '" + valor + "'";
									ok = 1;
								}
								else if (valor == -1)
								{
									if (player.coupon.false_rank == 55)
										mensagem = "Você não possuí mais a patente falsa.";
									else
									{
										int oldfake = player.coupon.false_rank;
										player.coupon.false_rank = 55;
										mensagem = "Você removeu sua patente falsa. (" + oldfake + ")";
										ok = 1;
									}
								}
								else
								{
									mensagem = "Tem certeza que isso é uma patente real?";
								}
								if (ok == 1)
								{
									sendPacket(new PLAYER_COUPON_INFO_ACK(player));
									EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(player, true, false, false);
									db.updateFRank(player, player.coupon.false_rank);
								}
							}
							else
							{
								mensagem = "Você já está ultilizando patente falsa no momento, exclua-a para continuar.";
							}
						}
					}
					else if (coS.startsWith("nn "))
					{
						if (checkAccess("gm"))
						{
							String nome = coS.substring(3);
							if (nome.length() > 33)
								mensagem = "Por favor, digite um apelido menor. (min: 3 - max: 33)";
							else
							{
								if (nome.length() > 2)
								{
									boolean godzin = !AuthenticationAddress.gI().addr.containsKey(client.mac);
									if (EssencialUtil.gI().containsString(nome, conc.bad_string, false) && godzin)
										mensagem = "Esse apelido está fora dos padrões do jogo.";
									else
									{
										if (godzin)
											nome.replace(" ", "").trim();
										if (db.playerExist(nome) != 0)
											mensagem = "Esse apelido já existe. (" + nome + ")";
										else
										{
											String oldname = player.name;
											player.name = nome;
											EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(player, false, true, true);
											Room r = client.getRoom();
							    			if (r != null)
				    		                {
							    				for (int i = 0; i < 16; i++)
							    				{
							    					Player m = r.getPlayerBySlot(i);
							    					if (m != null)
							    						m.connection.sendPacket(new ROOM_GET_NICKNAME_ACK(player));
				    		                	}
				    		                }
											sendPacket(new PLAYER_UPDATE_NICK_ACK(player));
											mensagem = "Seu nick foi alterado de ('" + oldname + "') para ('" + nome + "').";
											db.updateNick(player, player.name);
											db.REPLACE_NICK(player.id, player.name);
											Logger.gI().info("nicks", null, "Conta '" + oldname + "' trocou o apelido para '" + player.name + "' [" + player.id + "]", getClass());
											player.novo_nome = "";
										}
									}
								}
								else
								{
									mensagem = "Por favor, digite um apelido maior. (min: 3 - max: 33)";
								}
							}
						}
					}
					else if (coS.startsWith("ka"))
					{
						if (checkAccess("plus"))
						{
							int total = 0;
							for (Player mM : AccountSyncer.gI().ACCOUNTS.values())
							{
								if (mM != null && mM.connection != null && mM.id != player.id && mM.rank != 53 && mM.rank != 54 && mM.access_level == AccessLevel.OFF)
								{
									mM.connection.close(new BASE_KICK_ACCOUNT_ACK(mM.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
									total++;
								}
							}
							mensagem = "Desconectando todos os jogadores: '" + total + "'.";
							total = 0;
						}
					}
					else if (coS.startsWith("kep"))
					{
						if (checkAccess("plus"))
						{
							int total = 0;
							for (Player mM : AccountSyncer.gI().ACCOUNTS.values())
							{
								if (mM != null && mM.connection != null && mM.id != player.id)
								{
									mM.connection.close(new BASE_KICK_ACCOUNT_ACK(mM.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
									total++;
								}
							}
							mensagem = "Desconectando todos os jogadores a força: '" + total + "'.";
							total = 0;
						}
					}
					else if (coS.startsWith("ban "))
					{
						if (checkAccess("gm"))
						{
							String[] coK = coS.substring(4).split(" = ");
							String nome = "";
							try
							{
								nome = coK[0];
								Player jogador = EssencialUtil.gI().CARREGAR_JOGADOR_NOME(nome.trim(), false, false, false, false);
								if (jogador != null)
								{
									if (jogador.id == player.id)
										mensagem = "Porquê você quer se banir?";
									else
									{
										if (jogador.access_level.ordinal() > 0)
											mensagem = "Você não pode banir esse jogador. (" + nome.trim() + ")";
										else
										{
											int expires = db.returnQueryValueI("SELECT ban_expires FROM contas WHERE id='" + jogador.id + "'", "ban_expires");
											if (expires > 0)
												mensagem = "Jogador '" + nome + "' já foi/está banido '" + expires + "'.";
											else
											{
												int dias = 0;
												int tempo = 0;
												boolean continuar = true;
												try
												{
													dias = Integer.parseInt(coK[1]);
													tempo = date.getDateTime(dias);
												}
												catch (Exception e)
												{
													continuar = false;
												}
												if (continuar)
												{
													int diasLimite = 366;
													if (dias > 0 && dias < diasLimite)
													{
														if (jogador.connection != null)
															jogador.connection.close(new BASE_KICK_ACCOUNT_ACK(jogador.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
														for (Player pR : AccountSyncer.gI().ACCOUNTS.values())
															if (pR != null && pR.connection != null && pR.id != jogador.id)
																pR.connection.sendPacket((new SERVER_MESSAGE_ANNOUNCE_ACK("Player '" + nome + "' was banned for " + coK[1] + " days. RESPECT THE RULES")));
														db.updateAccountStatusAndBanExpirates(jogador.id, false, tempo);
														mensagem = "Jogador '" + nome + "' foi banido por '" + coK[1] + "' dias.";
														Logger.gI().info("ban", null, player.name + " baniu " + jogador.name + " por " + coK[1] + " dias.", getClass());
													}
													else
													{
														mensagem = "Você não pode banir esse jogador por " + dias + ". (" + nome.trim() + ").";
													}
												}
												else
												{
													mensagem = "Falha ao calcular os dias para bloquear a conta do jogador. (" + nome.trim() + ").";
												}
											}
										}
									}
								}
								else
								{
									mensagem =  "Jogador '" + nome.trim() + "' não foi encontrado ou é inexistente.";
								}
							}
							catch (Exception e)
							{
								mensagem = "Falha ao banir o jogador. (" + nome.trim() + ")";
							}
						}
					}
					else if (coS.startsWith("kp "))
					{
						if (checkAccess("mod"))
						{
							String nome = coS.substring(3);
							Player jogador = AccountSyncer.gI().get(nome.trim());
							if (jogador != null && jogador.connection != null)
							{
								if (jogador.id == player.id)
									mensagem = "Porquê você quer se kikar?";
								else
								{
									boolean b = jogador.rank == 53 || jogador.rank == 54;
									if (player.access_level.ordinal() > 0 && jogador.access_level  == AccessLevel.OFF)
										b = false;
									if (b)
										mensagem = "Você não pode desconectar esse jogador.";
									else
									{
										jogador.connection.close(new BASE_KICK_ACCOUNT_ACK(jogador.connection, KickType.O_JOGO_SERA_FINALIZADO_EM_INSTANTES_GM));
										mensagem = "Jogador '" + nome + "' foi desconectado.";
									}
								}
							}
							else
							{
								mensagem = "Jogador '" + nome.trim() + "' não foi encontrado, é inexistente ou está offline.";
							}
						}
					}
					else
					{
						mensagem = "Comando não foi encontrado, tente novamente.";
					}
				}
				catch (Exception e)
				{
					valores = 2;
					mensagem = "Falha ao executar o comando.";
				}
			}
			if (valores == 2)
				sendPacket(new LOBBY_CHATTING_ACK(player, mensagem, "Servidor"));
		}
		return valores == 2;
	}
}