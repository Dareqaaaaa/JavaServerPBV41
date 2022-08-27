package game.network.protocol.game.ACK;

public class PLAYER_LEVEL_UP_ACK extends game.network.protocol.GamePacketACK
{
	protected int rank;
	protected int exp;
	public PLAYER_LEVEL_UP_ACK(int rank, int exp)
	{
		super(true);
		this.rank = rank;
		this.exp = exp;
	}
	@Override
	public void writeImpl()
	{
		WriteD(rank);
		WriteD(rank);
		WriteD(exp);
	}
}