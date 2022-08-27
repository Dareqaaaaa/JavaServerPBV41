package core.enums;

public enum PacketType
{
	SERVER("S"),
	CLIENT("C");
	public String name;
	private PacketType(String name)
	{
		this.name = name;
	}
}