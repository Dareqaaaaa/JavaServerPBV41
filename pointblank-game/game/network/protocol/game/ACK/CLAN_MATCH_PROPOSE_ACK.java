package game.network.protocol.game.ACK;

public class CLAN_MATCH_PROPOSE_ACK extends game.network.protocol.GamePacketACK
{
	public CLAN_MATCH_PROPOSE_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}