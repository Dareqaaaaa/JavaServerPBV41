package game.network.protocol.game.ACK;

public class OUTPOST_PLAY_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	protected String winner;
	public OUTPOST_PLAY_ACK(int error, String winner)
	{
		super(true);
		this.error = error;
		this.winner = winner;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		WriteC(1); //a
		WriteC(2); //b
		WriteC(3); //c
		WriteD(0); //item?
		WriteS(winner, 33);
	}
}