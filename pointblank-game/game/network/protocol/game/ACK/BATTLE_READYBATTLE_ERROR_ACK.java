package game.network.protocol.game.ACK;

public class BATTLE_READYBATTLE_ERROR_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public BATTLE_READYBATTLE_ERROR_ACK(int error)
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