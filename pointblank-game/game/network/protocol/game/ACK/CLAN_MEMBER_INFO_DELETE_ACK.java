package game.network.protocol.game.ACK;

public class CLAN_MEMBER_INFO_DELETE_ACK extends game.network.protocol.GamePacketACK
{
	protected long pId;
	public CLAN_MEMBER_INFO_DELETE_ACK(long pId)
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