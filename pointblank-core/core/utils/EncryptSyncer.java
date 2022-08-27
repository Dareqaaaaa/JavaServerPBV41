package core.utils;

import java.io.*;
import java.math.*;
import java.security.*;
import java.util.*;

import javax.crypto.*;
import javax.crypto.spec.*;

public class EncryptSyncer
{
	protected static final String encryptionKey           = "ABCDEFGHIJKLMNOP";
	protected static final String characterEncoding       = "UTF-8";
    protected static final String cipherTransformation    = "AES/CBC/PKCS5PADDING";
    protected static final String aesEncryptionAlgorithem = "AES";
	public EncryptSyncer()
	{
	}
	public static String enc(String plainText)
	{
		String encryptedText = "";
		try
		{
			Cipher cipher = Cipher.getInstance(cipherTransformation);
            byte[] key = encryptionKey.getBytes(characterEncoding);
            SecretKeySpec secretKey = new SecretKeySpec(key, aesEncryptionAlgorithem);
            IvParameterSpec ivparameterspec = new IvParameterSpec(key);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivparameterspec);
            byte[] cipherText = cipher.doFinal(plainText.getBytes("UTF8"));
            Base64.Encoder encoder = Base64.getEncoder();
            encryptedText = encoder.encodeToString(cipherText);
		}
		catch (Exception e)
		{
		}
	    return encryptedText;
	}
	public static String dec(String encryptedText)
	{
		String decryptedText = "";
		try
		{
            Cipher cipher = Cipher.getInstance(cipherTransformation);
            byte[] key = encryptionKey.getBytes(characterEncoding);
            SecretKeySpec secretKey = new SecretKeySpec(key, aesEncryptionAlgorithem);
            IvParameterSpec ivparameterspec = new IvParameterSpec(key);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivparameterspec);
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] cipherText = decoder.decode(encryptedText.getBytes("UTF8"));
            decryptedText = new String(cipher.doFinal(cipherText), "UTF-8");
		}
		catch (Exception e)
		{
		}
	    return decryptedText;
	}
	public static void MD5file(String dist) 
	{
		try
		{
			MessageDigest digest = MessageDigest.getInstance("MD5");
			File f = new File(dist);
			InputStream is = new FileInputStream(f);				
			byte[] buffer = new byte[8192];
			int read = 0;
			try
			{
				while ((read = is.read(buffer)) > 0)
					digest.update(buffer, 0, read);
				BigInteger bigInt = new BigInteger(1, digest.digest());
				String output = bigInt.toString();
				System.out.println("MD5: " + output);
			}
			catch (IOException e)
			{
				throw new RuntimeException("Unable to process file for MD5", e);
			}
			finally
			{
				try
				{
					is.close();
				}
				catch (IOException e)
				{
					throw new RuntimeException("Unable to close input stream for MD5 calculation", e);
				}
			}
		}
		catch (NoSuchAlgorithmException | FileNotFoundException e)
		{
		}
	}
	public static char[] hexCodes(byte[] text)
	{
        char[] hexOutput = new char[text.length * 2];
        String hexString;
        for (int i = 0; i < text.length; i++)
        {
            hexString = "00" + Integer.toHexString(text[i]);
            hexString.toUpperCase().getChars(hexString.length() - 2,
                                    hexString.length(), hexOutput, i * 2);
        }
        return hexOutput;
	}
	public static String SHA1(String msg)
	{
		String encrypted = "";
		try
		{
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(msg.getBytes());
			StringBuffer result = new StringBuffer();
			for (byte byt : md.digest())
				result.append(Integer.toString((byt & 0xff) + 0x100, 16).substring(1));
			encrypted = result.toString();
		}
		catch (NoSuchAlgorithmException e)
		{
		}
		return encrypted;
	}
	public static int SHA1_int32(String msg)
	{
		int result = 0;
		try
		{
			result = Integer.parseInt(SHA1(msg));
		}
		catch (NumberFormatException e)
		{
		}
		return result;
	}
    public static String getHWID()
    {
        String s = "";
        try
        {
	        final String main = System.getenv("PROCESSOR_IDENTIFIER") + System.getenv("COMPUTERNAME") + System.getProperty("user.name").trim();
	        final byte[] bytes = main.getBytes("UTF-8");
	        final MessageDigest messageDigest = MessageDigest.getInstance("MD5");
	        final byte[] md5 = messageDigest.digest(bytes);
	        for (int i = 0; i < md5.length; i++)
	        {
	            s += Integer.toHexString((md5[i] & 0xFF) | 0x300).substring(0, 3);
	            if (i != md5.length - 1)
	            {
	                s += "-";
	            }
	        }
        }
        catch (NoSuchAlgorithmException | UnsupportedEncodingException e)
        {
        }
        return s;
    }
}