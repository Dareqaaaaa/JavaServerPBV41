package core.utils;

import io.netty.buffer.*;

public class BitShift
{
	public BitShift()
	{
	}
	public static void onlyDecrypt(ByteBuf buf, int length)
    {
		decrypt(buf, getShift(length));
    }
	public static void onlyEncrypt(ByteBuf buf, int length)
    {
		shift(buf, getShift(length));
    }
	public static void decrypt(ByteBuf buf, int shift)
	{
		byte[] data = buf.array();
		byte lastElement = data[data.length - 1];
		for (int i = data.length - 1; i > 0; i--)
			data[i] = (byte) (((data[i - 1] & 255) << (8 - shift)) | ((data[i] & 255) >> shift));
		data[0] = (byte) ((lastElement << (8 - shift)) | ((data[0] & 255) >> shift));
	}
	public static void shift(ByteBuf buf, int bits)
	{
		shift(buf.array(), bits);
	}
	public static void unshift(ByteBuf buf, int bits)
	{
		unshift(buf.array(), bits);
	}
	public static void shift(byte[] buffer, int bits)
	{
	    int length = buffer.length;
	    byte first = buffer[0];
	    byte current;
	    for (int i = 0; i < length; i++)
	    {
	        if (i >= (length - 1))
	        	current = first;
	        else
	        	current = buffer[i + 1];
	        buffer[i] = (byte)(current >> (8 - bits) | (buffer[i] << bits));
	    }
	}
	public static void unshift(byte[] buffer, int bits)
	{
	    int length = buffer.length;
	    byte last = buffer[length - 1];
	    byte current;
	    for (int i = length - 1; (i & 0x80000000) == 0; i--)
	    {
	        if (i <= 0)
	        	current = last;
	        else
	        	current = buffer[i - 1];
	        buffer[i] = (byte)(current << (8 - bits) | buffer[i] >> bits);
	    }
	}
    public static int getShift(int length)
    {
        return length % 6 + 1;
    }
}