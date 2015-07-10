package WebKakao_PJ.db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinBean{

	private String user_id;
	private String user_pw;
	private String user_name;
	
	public String getUser_id() {		return user_id;	}
	public void setUser_id(String user_id) {		this.user_id = user_id;	}
	
	public String getUser_pw() {		return user_pw;	}
	public void setUser_pw(String user_pw) {		this.user_pw = user_pw;	}
	
	public String getUser_name() {		return user_name;	}
	public void setUser_name(String user_name) {		this.user_name = user_name;	}
	
}
