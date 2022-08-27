package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.enums.*;
import core.models.*;

public class ROOM_NEW_HOST_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected List<Player> jogadores;
	public ROOM_NEW_HOST_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		try
		{
			r = client.getRoom();
			if (r != null && r.rstate == RoomState.READY && r.LIDER == client.pId)
			{
				jogadores = r.getPlayers();
				buscar_novo_dono();
			}
		}
		catch (Exception e)
		{
		}
	}
	public void buscar_novo_dono()
    {
		if (jogadores.size() > 1)
		{
			Player p = LIDER();
			if (p != null && p.id != r.LIDER)
			{
				sendPacket(new ROOM_NEW_HOST_ACK(p.slot));
			}
			else
			{
				buscar_novo_dono();
			}
		}
		else
		{
			sendPacket(new ROOM_NEW_HOST_ACK(-1));
		}
    }
	public Player LIDER()
	{
		return jogadores.get(new Random().nextInt(jogadores.size()));
	}
}