package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_REPLACE_INTRO_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error = 1;
	public CLAN_REPLACE_INTRO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			try
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null && p.rolePermisse())
				{
			        c.info = ReadT(ReadC());
			        ck.ATUALIZAR_INFO(c);
			        db.updateClanInfo(c);
				}
				else
				{
					error = 0x80001074;
				}
			}
			catch (Exception e)
			{
				error = 0x80001074;
			}
		}
		else
		{
			error = 0x80001074;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_REPLACE_INTRO_ACK(error));
	}
}