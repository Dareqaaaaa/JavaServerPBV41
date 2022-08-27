package game.network.protocol.game.ACK;

public class CLAN_COMMISSION_MASTER_ACK extends game.network.protocol.GamePacketACK
{
	public int error;
	public CLAN_COMMISSION_MASTER_ACK(int error)
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