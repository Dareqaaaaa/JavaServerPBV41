package core.utils;

import java.awt.*;
import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.apache.commons.mail.*;

public class EmailFactory
{
	public EmailFactory()
	{
	}
	public static void sendEmail() throws EmailException
	{
		Email email = new SimpleEmail();
		email.setDebug(true);
		email.setHostName("smtp.googlemail.com");
		email.setSmtpPort(465);
		email.setAuthentication("jurandir281470@gmail.com", "AREHE2206012204");
		email.setFrom("testeads@gmail.com");
		email.addTo("PCtechnic2015@gmail.com");
		email.setSubject("Point Blank Emulador");
		email.setMsg("KEY DO CONSOLE");
		email.setSSLOnConnect(true); //setSSL
		System.out.println("enviando...");
		email.send();
		System.out.println("Email enviado!");
	}
	public static void sendEMAIL(String key)
	{
		/*try
		{
			SimpleEmail email = new SimpleEmail();
			email.setSSLOnConnect(true);
			email.setHostName("smtp.gmail.com");
			email.setSslSmtpPort("465");
			email.setAuthenticator(new DefaultAuthenticator("jurandir281470@gmail.com", "AREHE2206012204"));
			email.setFrom("jurandir281470@gmail.com");
			     
			email.setDebug(true); 
			     
			email.setSubject("Assunto do E-mail");
			email.setMsg("Texto sem formatação");
			email.addTo("PCtechnic2015@gmail.com");//por favor trocar antes de testar!!!!
			     
			email.send();
			return;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		int i = 1;
		if (i != 0)
			return;*/
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465"); //587
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getDefaultInstance(props, new Authenticator()
        {
        	protected PasswordAuthentication getPasswordAuthentication() 
            {
        		return new PasswordAuthentication("jurandir281470@gmail.com", "AREHE_2206012204");
            }
        });
        session.setDebug(true);
        try
        {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("jurandir281470@gmail.com")); //Remetente
            Address[] toUser = InternetAddress.parse("PCtechnic2015@gmail.com"); //Destinatário(s)
            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("Point Blank: Key to execute");
            message.setText(key);
            Transport.send(message);
            System.out.println("Feito!!!");
       }
       catch (MessagingException e)
       {
    	   e.printStackTrace();
       }
	}
	public static void openWebpage(boolean active, String url)
	{
		try
		{
			if (!active)
				return;
		    Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
		    if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE))
		    	desktop.browse(new URI(url));
		}
	    catch (URISyntaxException | IOException e)
	    {
	    }
	}
	public static String generateCode()
	{
		return EncryptSyncer.enc(String.valueOf(DateTimeUtil.gI().getDateTime()));
	}
}