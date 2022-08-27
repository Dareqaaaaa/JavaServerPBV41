package game.network.protocol.game.ACK;

public class VOTEKICK_UPDATE_FINAL_ACK extends game.network.protocol.GamePacketACK
{
	public VOTEKICK_UPDATE_FINAL_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0); //kikar
		WriteD(0); //deixar
	}
}