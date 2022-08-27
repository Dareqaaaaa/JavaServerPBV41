package game.network.protocol.game.ACK;

public class BATTLE_CHANGE_DIFFICULTY_LEVEL_ACK extends game.network.protocol.GamePacketACK
{
	protected int level;
	public BATTLE_CHANGE_DIFFICULTY_LEVEL_ACK(int level)
	{
		super(true);
		this.level = level;
	}
	@Override
	public void writeImpl()
	{
		WriteC(level);
		for (int i = 0; i < 16; i++)
			WriteD(1);
	}
}