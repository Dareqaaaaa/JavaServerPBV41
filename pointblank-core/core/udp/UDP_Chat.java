package core.udp;

public enum UDP_Chat
{
	VOZ(0),

	Z1(1),
	Z2(2),
	Z3(3),
	Z4(4),
	Z5(5),
	Z6(6),
	Z7(7),
	Z8(8),

	X1(11),
	X2(12),
	X3(13),
	X4(14),
	X5(15),
	X6(16),
	X7(17),
	X8(18),

	C1(21),
	C2(22),
	C3(23),
	C4(24),
	C5(25),
	C6(26),
	C7(27),
	C8(28);
	public int value;
	UDP_Chat(int value)
	{
		this.value = value;
	}
	public static UDP_Chat valueOf(int value)
	{
		for (UDP_Chat r : values())
			if (r.value == value)
				return r;
		return VOZ;
	}
}