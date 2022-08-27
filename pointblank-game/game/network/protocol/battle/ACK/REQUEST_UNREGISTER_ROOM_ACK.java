package game.network.protocol.battle.ACK;

public class REQUEST_UNREGISTER_ROOM_ACK extends game.network.protocol.BattlePacketACK
{
	protected int roomIdx;
	public REQUEST_UNREGISTER_ROOM_ACK(int roomIdx)
	{
		super(true);
		this.roomIdx = roomIdx;
	}
	@Override
	public void writeImpl()
	{
		WriteD(roomIdx);
	}
}