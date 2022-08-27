 package game.network.protocol.game.REQ;

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class INVENTORY_NICK_CHECK_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected String nome;
	protected int error;
    public INVENTORY_NICK_CHECK_REQ(int opcode)
    {
        super(opcode);
    }
	@Override
    public void readImpl()
    {
    	try
    	{
			nome = ReadS(33).replace(" ", "").trim();
		}
    	catch (Exception e)
    	{
    		error = 0x80000113;
    	}
    }
	@Override
    public void runImpl()
    {
		p = client.getPlayer();
    	try
    	{
    		if (p != null)
    			error = p.buscarPeloItemId(1301047000) == null || EssencialUtil.gI().VERIFICAR_APELIDO_NA_DATABASE(nome) || EssencialUtil.gI().PS_CHECKED_NAME(p.id, nome) ? 0x80000113 : 0;
    		else
    			error = 0x80000113;
    	}
    	catch (Exception e)
    	{
    		error = 0x80000113;
    	}
    	sendPacket(new INVENTORY_NICK_CHECK_ACK(error));
    	if (p != null && error == 0)
    		p.novo_nome = nome;
    }
}