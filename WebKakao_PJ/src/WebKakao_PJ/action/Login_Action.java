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

public class Login_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String User_ID = request.getParameter("userID");
		String User_Pass = request.getParameter("userPwd");
		
		String user_name = "";
		
		LoginBean login_bean = new LoginBean();
		Login_sql login_sql = new Login_sql();
		
		user_name = login_sql.Login_process(User_ID, User_Pass);
		System.out.println(User_ID);
		System.out.println(User_Pass);	
		System.out.println(user_name);	
		
		if ( user_name != ""){

			HttpSession session = request.getSession();
			
			session.setAttribute("user_id", User_ID);
			//session.setAttribute("user_pw", User_Pass);
			session.setAttribute("user_name", user_name);
			//out.print("<script>alert('LOGIN성공')</script>");
			//response.sendRedirect(list.do);
			//response.sendRedirect("Story_List1.jsp");
			//out.print("<script>");
			//out.print("window.onload = function(){");
			//out.print("window.open('myList.do','','width=1080,height=1000');");
			//out.print("window.open('about:blank','_self').close();");
			//out.print("}");
			//out.print("</script>");
			response.sendRedirect("myList.do");
			
		}else{
			out.print("<script>alert('ID 혹은 비밀번호가 일치하지 않습니다');history.back();</script>");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

}
