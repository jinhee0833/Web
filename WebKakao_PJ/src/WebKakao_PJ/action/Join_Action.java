package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WebKakao_PJ.db.*;

public class Join_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		
		JoinBean login_bean = new JoinBean();
		Join_sql login_sql = new Join_sql();
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(user_name);
		
		login_bean.setUser_id(user_id);
		login_bean.setUser_pw(user_pw);
		login_bean.setUser_name(user_name);
		login_sql.JoinInsertAction(login_bean);
		
		out.print("<script>alert('가입을 환영합니다.'); location.href='Login.jsp';</script>");
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

}
