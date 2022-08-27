package game.network.protocol.game.ACK;

public class CLAN_PLAYER_LEAVE_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public CLAN_PLAYER_LEAVE_ACK(int error)
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