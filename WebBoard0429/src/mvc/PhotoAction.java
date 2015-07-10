package mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;  //PrintWriter
import java.util.*;  //List, ArrayList
import javax.servlet.*; //RequestDispatcher
import javax.servlet.http.*;



public class PhotoAction extends HttpServlet {  
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user( request, response) ;
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user( request, response) ;
	} //end
	
	protected void  user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR") ;
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter  out = response.getWriter() ;
		out.println("<html><head><title> :::: my Photo Show::::</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<center><font size=6 color=green><b>[스키동호회 앨범보기] </b>") ;
		out.println("</font></center><p>") ;
		out.println("<table  align=center border=1  width=530  height=400>");
		out.println("<tr><td colspan=4 height=50 align=center><img src='images/bar.gif'></td></tr>");
		
		HttpSession ses = request.getSession();
		String value = (String)ses.getAttribute("naver");
		
		if(value == null) 		{
			out.println("<tr><td colspan=4>");
			out.println("<font size=7 color=red><b>you can't see your picture");
			out.println("you should connect Login </b>");
			out.println("</td></tr>");
			
			out.println("<tr><td colspan=4><a href='login.jsp'> [로그인화면이동]");
			out.println("&nbsp;"); 
			out.println("<a href='/board2/list2.jsp'> [list2.jsp] </a></td><tr>");
		 }
		else	{ 
			out.println("<tr><td align=center width=150><img src='images/aaa.gif'> </td>");
			out.println("<td align=center width=150><img src='images/aaa.gif'> </td>");
			out.println("<td align=center width=150><img src='images/aaa.gif'> </td>");
			out.println("<td align=center width=150><img src='images/aaa.gif'> </td></tr>");
			
			out.println("<tr><td  align=center width=150><img src='images/bbb.gif'> </td>");
			out.println("<td width=150 align=center><img src='images/bbb.gif'> </td>");
			out.println("<td width=150 align=center><img src='images/bbb.gif'> </td>");
			out.println("<td width=150 align=center><img src='images/bbb.gif'> </td></tr>");
			
			out.println("<tr align='center'><td colspan=4><h1> <a href='login.jsp'>  [login.jsp] ");
			out.println("&nbsp;"); 
			out.println("<a href='./board2/list2.jsp'> [list2.jsp] </a> </h1> </td><tr>");
		}  //else end
		out.println("</table>");
		out.println("</body></html>");		
	} //user(1,2) end

} //class END



