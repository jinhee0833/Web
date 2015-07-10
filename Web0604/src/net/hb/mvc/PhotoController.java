package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

@WebServlet("/photo.do")
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("PhotoController");
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charse=EUC-KR");
		
		PrintWriter out = response.getWriter();
		//out.println("<font size=7><b>PhotoController.java</b></font><br>");
		
		HttpSession ses = request.getSession();
		String id = (String) ses.getAttribute("daum");
			out.println("인증된 userid = "+id);
		if(id==null || id==""){
			out.println("<font size=7><b>[로그인후 그림보기가 가능합니다]</b></font></p>");
			out.println("<a href = login.jsp>login page</a>");
		}else{
			out.println("<img src='images/aaa.gif'>");
			out.println("<img src='images/aaa.gif'>");
			out.println("<img src='images/aaa.gif'>");
			out.println("<img src='images/aaa.gif'><p>");
		}
	}
}
