package game.network.protocol.game.ACK;

public class BASE_XINGCODE_ERROR_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public BASE_XINGCODE_ERROR_ACK(int error)
	{
		super(true);
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error); //0x800010AE - EVENT_ERROR_GAMEGUARD_ERROR | 0x800010AD - EVENT_ERROR_HACKING_EXIT_USER
	}
}
