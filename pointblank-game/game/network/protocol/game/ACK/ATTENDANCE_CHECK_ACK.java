package game.network.protocol.game.ACK;

import core.models.*;

public class ATTENDANCE_CHECK_ACK extends game.network.protocol.GamePacketACK
{
	protected EventVerification e;
	protected PlayerEvent ev;
	protected int event_error;
	public ATTENDANCE_CHECK_ACK(EventVerification e, PlayerEvent ev, int event_error)
	{
		super(true);
		this.e = e;
		this.ev = ev;
		this.event_error = event_error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(event_error);
        WriteD(e.id);
        WriteC(ev.last_check1);
        WriteC(ev.last_check2);
        WriteH(0);
        WriteD(e.inicio);
	}
}