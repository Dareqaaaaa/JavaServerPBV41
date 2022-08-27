package game.network.protocol.game.ACK;

public class CLAN_ROOM_INVITED_RESULT_ACK extends game.network.protocol.GamePacketACK
{
	protected long pId;
	public CLAN_ROOM_INVITED_RESULT_ACK(long pId)
	{
		super(true);
		this.pId = pId;
	}
	@Override
	public void writeImpl()
	{
		WriteQ(pId);
	}
}