package game.network.protocol.game.ACK;

public class CLAN_REMOVE_INVITES_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public CLAN_REMOVE_INVITES_ACK(int error)
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