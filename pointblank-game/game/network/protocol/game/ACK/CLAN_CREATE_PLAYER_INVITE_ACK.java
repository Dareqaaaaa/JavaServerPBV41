package game.network.protocol.game.ACK;

public class CLAN_CREATE_PLAYER_INVITE_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	protected int clan_id;
	public CLAN_CREATE_PLAYER_INVITE_ACK(int error, int clan_id)
	{
		super(true);
		this.error = error;
		this.clan_id = clan_id;
	}
	@Override
	public void writeImpl()
	{
        WriteD(error);
        if (error == 0)
        {
	        WriteD(clan_id);
	        WriteH(3); //CLAN_MEMBER_LEVEL_REGULAR
        }
	}
}