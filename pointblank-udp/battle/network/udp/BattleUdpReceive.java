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

package battle.network.udp;

import io.netty.buffer.*;
import io.netty.channel.*;
import io.netty.channel.socket.*;
import io.netty.util.*;

import java.awt.Color;
import java.io.*;
import java.nio.*;

import core.enums.*;
import core.info.Software;
import core.log.*;
import core.system.*;
import core.udp.*;
import core.utils.*;
import core.xml.MapsLocalXML;
import battle.controllers.*;
import battle.models.*;
import battle.network.protocol.ACK.*;

public class BattleUdpReceive extends SimpleChannelInboundHandler<DatagramPacket>
{
	@Override
	public void channelRead0(ChannelHandlerContext ctx, DatagramPacket msg) throws IOException, Exception
	{
		ByteBuf receive = msg.content().order(ByteOrder.LITTLE_ENDIAN);
		UDP_Model udp = new UDP_Model(receive);
		BattleUdpBuffer send = new BattleUdpBuffer();
	    try
	    {
		    switch ((int)udp.opcode)
			{
				case 65:
				case 67:
				{
	            	Room r = getRoom(udp, true);
	                if (r != null)
	                {
		                Player p = r.getPlayer(udp.slot);
		                if (p != null)
		                {
		                	if (udp.opcode == 65)
		                	{
		                		if (p.sender == null)
		                		{
				                	send.buffer.writeByte(66);
				                	send.buffer.writeByte(0);
				                	send.buffer.writeFloat(0);
				                	send.buffer.writeByte(0);
				                	send.buffer.writeShort(13);
				                	send.buffer.writeInt(0);

				                    ctx.writeAndFlush(new DatagramPacket(Unpooled.copiedBuffer(send.buffer), (p.sender = msg.sender())));

				                    RoomController.gI().sendPacket(new REQUEST_BATTLE_PRESTART_ACK(r.roomId, r.serverId, r.channelId, p.slot, udp.session, udp.event));
				                    
				                    if (ConnectionLoader.gI().udp == UDP_Type.SERVER_UDP_STATE_RELAY)
				                    {
					                    Software.setColor(Color.YELLOW, Color.BLACK);
				                    	logging(" Connection established. [" + p.sender.toString() + "]", true);
					                    Software.setColor(Color.WHITE, Color.BLACK);
				                    }
		                		}
		                	}
		                	else
		                	{
		                		r.removePlayer(udp.slot);
		                		if (ConnectionLoader.gI().udp == UDP_Type.SERVER_UDP_STATE_RELAY)
		                		{
			                		Software.setColor(Color.YELLOW, Color.BLACK);
		                			logging(" Player desconected. [" + p.sender.toString() + "]", true);
			                	    Software.setColor(Color.WHITE, Color.BLACK);
		                		}
		                	}
		                }
	                }
	                break;
				}
				case 97:
				{
					if (ConnectionLoader.gI().udp == UDP_Type.SERVER_UDP_STATE_RELAY)
					{
						Room r = getRoom(udp, false);
		                if (r != null)
		                {
		                	Player p = r.getPlayer(udp.slot);
		                	if (p != null)
		                	{
		                		send.buffer.writeBytes(udp.allBytes.clone());
	               				ctx.writeAndFlush(new DatagramPacket(Unpooled.copiedBuffer(send.buffer), p.sender));
		                	}
		                }
						break;
					}
				}
		        case 131:
		        case 132:
				case 84:
				{
					if (ConnectionLoader.gI().udp == UDP_Type.SERVER_UDP_STATE_RELAY)
					{
						break;
					}
				}
				case 4:
		        case 3:
				{
					Room r = getRoom(udp, false);
	                if (r != null)
	                {
	                	Player p = r.getPlayer(udp.slot);
	                	if (p != null)
	                	{
	                		if (ConnectionLoader.gI().udp == UDP_Type.SERVER_UDP_STATE_CLIENT)
	                			send.buffer.writeBytes(udp.allBytes.clone());
	                		else
	                		{
		    	                send.buffer.writeByte(4);
		    	                send.buffer.writeByte(255);
		    	                send.buffer.writeFloat(udp.time);
		    	                send.buffer.writeByte(udp.session);
		    	                send.buffer.writeShort(udp.length);
		        				send.buffer.writeInt(0);
		        				//send.buffer.writeBytes(udp.bytes3.clone());
		        				try
		        				{
		        					asyncEvent(udp.read, r, p, udp, send.buffer);
		        				}
		        				catch (Throwable e)
		        				{
		        				}
	                		}
	                		for (Player c : r.players.values())
	                		{
	                			if (c.state == SlotState.BATTLE && c.sender != null && r.isUDP(c.slot, p.slot == r.leader))
	                				ctx.writeAndFlush(new DatagramPacket(Unpooled.copiedBuffer(send.buffer), c.sender));
	                		}
	                	}
	                }
					break;
				}
			}
		    send.close();
	    }
	    catch (Throwable e)
	    {
			Logger.gI().info("errorUDP", e, "", getClass());
	    }
	    finally
	    {
	    	if (receive.refCnt() != 0) receive.release();
	    	if (udp.read.refCnt() != 0) udp.read.release();
	    	if (send.buffer.refCnt() != 0) send.buffer.release();
	        ReferenceCountUtil.release(msg);
	    }
	    udp = null;
	}
	public void asyncEvent(ByteBuf read, Room r, Player p, UDP_Model udp, ByteBuf sender) throws Throwable
	{
		byte opc = read.readByte();

		UDP_P2P subHead = UDP_SubHead.getSubHead(opc);
		subHead.slot = read.readShort();
		subHead.length = read.readShort();
		subHead.flag = read.readInt();

		BattleUdpBuffer ss = new BattleUdpBuffer();

		ss.buffer.writeByte(opc);
		ss.buffer.writeShort(subHead.slot);
		ss.buffer.writeShort(subHead.length);
		ss.buffer.writeInt(subHead.flag);
		
		if ((subHead.flag & 0x04) > 0) //Pos Rotate
		{
			UDP_PosRotation half = new UDP_PosRotation(read.readUnsignedShort(), read.readUnsignedShort(), read.readUnsignedShort(), read.readUnsignedShort(), read.readUnsignedShort(), read.readUnsignedShort());
			p.pos = half;
			ss.buffer.writeShort(half.posX);
			ss.buffer.writeShort(half.posY);
			ss.buffer.writeShort(half.posZ);
			ss.buffer.writeShort(half.camX);
			ss.buffer.writeShort(half.camY);
			ss.buffer.writeShort(half.area);

			Software.setColor(Color.GREEN, Color.BLACK);
			core.models.MapLocation map = MapsLocalXML.gI().get(r.map, half.area);
			if (map != null)
			{
				RoomController.gI().sendPacket(new REQUEST_GAME_SEND_ACK(r.roomId, r.serverId, r.channelId, p.slot, String.valueOf(map.local)));
				System.out.println(" [" + map.index + "] " + map.local);
				System.out.flush();
			}
			else
			{
				//RoomController.gI().sendPacket(new REQUEST_GAME_SEND_ACK(r.roomId, r.serverId, r.channelId, p.slot, String.valueOf(half.area)));
			}
			Software.setColor(Color.WHITE, Color.BLACK);
            /*Software.setColor(Color.CYAN, Color.BLACK);
			//logging("[Burning Hall] Slot " + udp.slot + "; " + local, true);
            Software.setColor(Color.WHITE, Color.BLACK);*/
			subHead.flag ^= 0x04;
		}
		ss.buffer.writeBytes(Unpooled.copiedBuffer(read));
		BitShift.onlyEncrypt(ss.buffer, udp.length);
		sender.writeBytes(Unpooled.copiedBuffer(ss.buffer));
		ss.close();
		
		int k = 0;
		if (k == 0)
			return;
		
		if ((subHead.flag & 0x01) > 0) //ActionState
		{
			int acao = read.readInt();
			UDP_Action action = UDP_Action.valueOf(acao);
			if (action.value > 0)
				RoomController.gI().sendPacket(new REQUEST_GAME_SEND_ACK(r.roomId, r.serverId, r.channelId, p.slot, String.valueOf(action)));
			ss.buffer.writeInt(acao);
			subHead.flag ^= 0x01;
		}
		if ((subHead.flag & 0x02) > 0) //Animation
		{
			short value = read.readShort();
			ss.buffer.writeShort(value);
			subHead.flag ^= 0x02;
		}
		if ((subHead.flag & 0x08) > 0) //Use Object
		{
			short value = read.readShort();
			ss.buffer.writeShort(value);
			subHead.flag ^= 0x08;
		}
		if ((subHead.flag & 0x20) > 0) //Radio Chat
		{
			UDP_Chat radio = UDP_Chat.valueOf(read.readByte());
			byte area = read.readByte();
            Software.setColor(Color.YELLOW, Color.BLACK);
            logging(" Slot " + udp.slot + " is release a radio chat: radId, localId [" + radio.value + ";" + area + "]", true);
            Software.setColor(Color.WHITE, Color.BLACK);
			ss.buffer.writeByte(radio.value);
			ss.buffer.writeByte(area);
			subHead.flag ^= 0x20;
		}
		if ((subHead.flag & 0x40) > 0) //HP Sync
		{
			UDP_HPSync hp = new UDP_HPSync(read.readShort(), false);
			if (hp.life < 1)
				hp.death = true;
			logging(" HP Sync slot " + p.slot + " >> hp " + hp + " death: " + hp.death, true);
			RoomController.gI().sendPacket(new REQUEST_GAME_SEND_ACK(r.roomId, r.serverId, r.channelId, p.slot, String.valueOf("[HP] Life " + hp + " death: " + hp.death)));
			ss.buffer.writeShort(hp.life);
			subHead.flag ^= 0x40;
		}
		if ((subHead.flag & 0x100) > 0) //Object Status
		{
			/*ss.buffer.writeShort(read.readShort()); //unk
	        while (read.isReadable())
	        {
	           int type = read.readByte();
	           if (type == 8) //Jogador
               {
                   int objid = read.readShort();
                   int unk1 = read.readShort();
                   byte byte1 = read.readByte();
                   int unk2 = read.readShort();
                   byte byte2 = read.readByte();
                   int hp = read.readShort();
                   ss.buffer.writeByte(type);
                   ss.buffer.writeShort(objid);
                   ss.buffer.writeShort(unk1);
                   ss.buffer.writeByte(byte1);
                   ss.buffer.writeShort(unk2);
                   ss.buffer.writeByte(byte2);
                   ss.buffer.writeShort(hp);
                   Software.setColor(Color.GREEN, Color.BLACK);
                   logging("hitPlayer: objIdx: " + objid + "; unk1: " + unk1 + "; unk2: " + unk2 + "; hp: " + hp, true);
                   Software.setColor(Color.WHITE, Color.BLACK);
               }
               else if (type == 3)
               {
                   int objId = read.readShort();
                   int unk1 = read.readShort();
                   int partIdx = read.readShort();
                   boolean destroyed = read.readBoolean();
                   Software.setColor(Color.YELLOW, Color.BLACK);
                   logging("hitObject: objIdx: " + objId + "; partIdx: " + partIdx + "; unk: " + unk1 + "; destroyed: " + destroyed, true);
                   Software.setColor(Color.WHITE, Color.BLACK);
                   ss.buffer.writeByte(type);
                   ss.buffer.writeShort(objId);
                   ss.buffer.writeShort(unk1);
                   ss.buffer.writeShort(partIdx);
                   ss.buffer.writeBoolean(destroyed);
               }
               read.discardReadBytes(); 
	        }*/
			subHead.flag ^= 0x100;
		}
		ss.close();
	}
	public static boolean teste = false;
	@SuppressWarnings("unused")
	public Room getRoom(UDP_Model udp, boolean firstSend)
	{
		ByteBuf info = null;
		try
		{
			info = Unpooled.copiedBuffer(udp.read).order(ByteOrder.LITTLE_ENDIAN);
			int restantes = info.readableBytes() - 9;
			if (restantes > 0) info.readBytes(restantes); //descartar
	        int id = 0;
	        int seed = 0;
	        byte dedication_slot = 0;
	        if (firstSend)
	        {
	        	id = info.readInt();
	        	seed = info.readInt();
	        	dedication_slot = info.readByte(); //0xff
	        }
	        else
	        {
	        	id = info.readInt();
	        	dedication_slot = info.readByte(); //0xff
	        	seed = info.readInt();
	        }
	        info.discardReadBytes();
            if (info != null && info.refCnt() != 0)
            	info.release();
            return RoomController.gI().getRoom(id);
		}
		catch (Exception e)
		{
		}
		return null;
	}
	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception 
	{
		ctx.flush();
	}
	@Override
	public void channelUnregistered(ChannelHandlerContext ctx) throws Exception
	{
		super.channelUnregistered(ctx);
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception 
	{
		if (cause instanceof IllegalReferenceCountException)
			return;
		Logger.gI().info("error", cause, "", getClass());
	}
	public void logging(String info, boolean newLine)
	{
		Logger.gI().info("UDP3", null, info, getClass());
		if (newLine)
			System.out.println(info);
		else
			System.out.print(info);
		System.out.flush();
	}
	public void log()
	{
		 //if (udp.buffer.isReadable() && udp.opcode > 0)
	    //{
		//	BitShift.onlyDecrypt(udp.buffer, udp.length);
		//	int remainValue = udp.sub_event;
		//	String barraInicio = "========================================================" + NetworkUtil.NEWLINE;
		//	String opcode = "Opcode: " + udp.opcode + NetworkUtil.NEWLINE;
		//	String slot = "Slot: " + udp.slot + NetworkUtil.NEWLINE;
		//	String time = "Time: " + udp.time + NetworkUtil.NEWLINE;
		//	String session = "Session: " + udp.session + NetworkUtil.NEWLINE;
		//	String length = "Length: " + udp.length + NetworkUtil.NEWLINE;
		//	String event = "Event: " + udp.event + NetworkUtil.NEWLINE;
		//	String subOpcode = "SubOpcode: " + udp.sub_opcode + NetworkUtil.NEWLINE;
		//	String subSlot = "SubSlot: " + udp.subHead.slot + NetworkUtil.NEWLINE;
		//	String subLength = "SubLength: " + udp.sub_length + NetworkUtil.NEWLINE;
		//	String subEvent = "SubEvent: " + udp.sub_event + NetworkUtil.NEWLINE;
		//	String flag = "Flag: " + udp.flag.toString() + NetworkUtil.NEWLINE;
		//	String roomId = "RoomID: " + udp.roomId + NetworkUtil.NEWLINE;
		//	String team = "TEAM: " + udp.team + NetworkUtil.NEWLINE;
		//	String roomSeed = "RoomSeed: " + udp.roomSeed + NetworkUtil.NEWLINE;
		//	String mask = "RemainMask: " + (udp.sub_event - remainValue) + NetworkUtil.NEWLINE;
		//	String reads = "Restates: " + udp.read.readableBytes() + NetworkUtil.NEWLINE;
		//	String barraFim = barraInicio;
		//	String more = "";
		//	if (udp.flag == UdpEvent.MissionDataForHost)
		//		more = "BOMB INSTALL";
		//	String dain = barraInicio + opcode + slot + team + time + session + length + event + subOpcode + subSlot + subLength + subEvent + flag + roomId + roomSeed + mask + reads + barraFim + more;
		//	
		//	String data = NetworkUtil.printData(dain, udp.buffer);
	    //
		//	Logger.gI().info("eventUDP", data, "-BattleUdpReceive");
	    //
		//	if (udp.opcode != 4)
		//	{
		//		logging(data);
		//		System.out.flush();
		//	}
	    //}
	}
}