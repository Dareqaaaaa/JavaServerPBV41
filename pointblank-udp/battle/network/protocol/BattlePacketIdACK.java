
package battle.network.protocol;

public enum BattlePacketIdACK
{
	REQUEST_GAME_CONNECTION_ACK(1),
	REQUEST_GAME_SEND_ACK(2),
	REQUEST_BATTLE_PRESTART_ACK(3);
	public int id;
	BattlePacketIdACK(int id)
	{
		this.id = id;
	}
	public static int getOpcode(String packet)
	{
		BattlePacketIdACK p = valueOf(packet);
		return p != null ? p.id : 0;
	}
}