package game.network.protocol.game.ACK;

import core.enums.*;

public class BATTLE_COUNTDOWN_ACK extends game.network.protocol.GamePacketACK
{
	protected RoomError tempo;
	public BATTLE_COUNTDOWN_ACK(RoomError tempo)
	{
		super(true);
		this.tempo = tempo;
	}
	@Override
	public void writeImpl()
	{
		WriteD(tempo.value);
	}
}