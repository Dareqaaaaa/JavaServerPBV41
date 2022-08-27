package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_AWARD_TIME_ACK extends game.network.protocol.GamePacketACK
{
	protected EventPlaytime ev;
	protected int type;
	protected int tempo;
	public BATTLE_AWARD_TIME_ACK(EventPlaytime ev, int type, int tempo)
	{
		super(true);
		this.ev = ev;
		this.type = type;
		this.tempo = tempo;
	}
	@Override
	public void writeImpl()
	{
		WriteC(type);
		WriteT(type == 0 && ev != null ? ev.titulo : "", 30);
		WriteD(type == 0 && ev != null ? ev.gift1 : 0);
		WriteD(type == 0 && ev != null ? ev.gift2 : 0);
		WriteQ(type == 0 && ev != null ? ev.minutos * 60 : tempo * 60);
	}
}