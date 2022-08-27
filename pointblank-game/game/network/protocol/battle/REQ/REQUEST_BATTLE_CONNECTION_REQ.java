package game.network.protocol.battle.REQ;

import core.utils.*;
import game.manager.*;
import game.network.protocol.*;
import game.network.protocol.battle.ACK.*;

public class REQUEST_BATTLE_CONNECTION_REQ extends BattlePacketREQ
{
	protected String key;
	public REQUEST_BATTLE_CONNECTION_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		key = EncryptSyncer.dec(ReadS(ReadH()));
	}
	@Override
	public void runImpl()
	{
		if (key.equals("Developed By Henrique Rodrigues | fb.com/eoqhenrqu"))
			sendPacket(new REQUEST_BATTLE_CONNECTION_ACK(BattleServerManager.gI().REGISTRAR(client)));
		else
		{
			System.out.println(" BattleServerManager wrong key ");
			System.out.flush();
		}
	}
}