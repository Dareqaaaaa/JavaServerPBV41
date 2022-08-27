package core.utils;

import java.io.*;

public abstract class BinaryEncrypt
{
	protected FileInputStream fs;
	protected BinaryReader br;
	public BinaryEncrypt(String file)
	{
		try
		{
			fs = new FileInputStream(file);
			br = new BinaryReader(fs);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	public void close() throws IOException
	{
		br.close();
		fs.close();
	}
}