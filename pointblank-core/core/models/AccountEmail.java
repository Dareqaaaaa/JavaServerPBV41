package core.models;

import javax.mail.*;

public class AccountEmail extends Authenticator
{
	public String email;
	public String senha;
	public AccountEmail(String email, String senha)
	{
		this.email = email;
		this.senha = senha;
	}
	protected PasswordAuthentication getPasswordAuthentication()
	{
        return new PasswordAuthentication(email, senha);
	}
}