package game.network.protocol.game.ACK;

public class CLAN_DEPORTATION_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public CLAN_DEPORTATION_ACK(int error)
	{
		super(true);
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
	}
}