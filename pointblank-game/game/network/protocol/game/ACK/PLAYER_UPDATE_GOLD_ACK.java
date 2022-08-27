package game.network.protocol.game.ACK;

import core.models.*;

public class PLAYER_UPDATE_GOLD_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected int valor;
	public PLAYER_UPDATE_GOLD_ACK(Player p, int valor)
	{
		super(true);
		this.p = p;
		this.valor = valor;
	}
	@Override
	public void writeImpl()
	{
        WriteD(valor);
        WriteD(p.gold);
        WriteD(0);
	}
}