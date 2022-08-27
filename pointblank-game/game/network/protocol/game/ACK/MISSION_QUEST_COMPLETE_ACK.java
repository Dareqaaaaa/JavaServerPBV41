package game.network.protocol.game.ACK;

public class MISSION_QUEST_COMPLETE_ACK extends game.network.protocol.GamePacketACK
{
	protected int mission_id;
	protected int value;
	protected int task;
    public MISSION_QUEST_COMPLETE_ACK(int mission_id, int value, int task)
    {
        super(true);
        this.mission_id = mission_id;
        this.value = value;
        this.task = task;
    }
    @Override
    public void writeImpl()
    {
        WriteC(mission_id + task); //255
        WriteC(value);
    }
}