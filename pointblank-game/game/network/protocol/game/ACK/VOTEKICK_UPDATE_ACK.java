package game.network.protocol.game.ACK;

public class VOTEKICK_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected int kikar;
	protected int deixar;
	public VOTEKICK_UPDATE_ACK(int kikar, int deixar)
	{
		super(true);
		this.kikar = kikar;
		this.deixar = deixar;
	}
	@Override
	public void writeImpl()
	{
		WriteC(kikar + 1);
		WriteC(deixar + 1);
	}
}