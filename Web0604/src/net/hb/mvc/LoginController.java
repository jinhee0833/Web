package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import not.hb.common.DBSQL;
import not.hb.common.DBbean;
 

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doGet(1,2)");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doPost(1,2)");
	}
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charse=EUC-KR");
		
		PrintWriter out = response.getWriter();
		String data1 = request.getParameter("dt1");
		
		String data2 = request.getParameter("dt2"); 
		 DBSQL dbsql = new DBSQL();
		out.println(data1); 
		
		String data = dbsql.loginCheck(data1, data2);
		System.out.println("3");
		 
		 
		 if(data == null || data==""){
			 out.println("<font size=7><b><a href='login.jsp' style='text-decoration:none'>로그인화면</a></b></font>");
		 }else{
			 out.println("<font size=7 color=red><b>"+data+"님의 로그인성공</b></font>" );
		 }
		 
		 System.out.println("4");
//		HttpSession ses = request.getSession();
//		
//	
//		
//			ses.setAttribute("daum", data);
//			 
//			out.println("<a href = 'photo.do'>view album </a><br>");
//			out.println("<a href = 'login.do'>login page </a><br>");
//			out.println("<a href = 'list.do'>view list </a>");
//		
		
	}//end

}
