package game.network.protocol.game.ACK;

public class ROOM_CHANGE_PASSWD_ACK extends game.network.protocol.GamePacketACK
{
	protected String passwd;
	public ROOM_CHANGE_PASSWD_ACK(String passwd)
	{
		super(true);
		this.passwd = passwd;
	}
	@Override
	public void writeImpl()
	{
		WriteS(passwd, 4);
	}
}