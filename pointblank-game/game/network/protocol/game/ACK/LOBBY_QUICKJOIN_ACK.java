package game.network.protocol.game.ACK;

public class LOBBY_QUICKJOIN_ACK extends game.network.protocol.GamePacketACK
{
	public int error;
	public LOBBY_QUICKJOIN_ACK(int error)
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