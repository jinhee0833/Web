package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import not.hb.common.DBSQL;
import not.hb.common.DBbean;


@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doGet(1,2)");
	}//end

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doPost(1,2)");
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charse=EUC-KR");
		
		PrintWriter out = response.getWriter();
		out.println("<font size=7 color=blue>InsertController.java</font><br>");
		out.println("<img src='images/aaa.gif'>");
		out.println("<img src='images/aaa.gif'>");
		out.println("<img src='images/aaa.gif'>");
		out.println("<img src='images/aaa.gif'>");
		out.println("<img src='images/aaa.gif'><p>");
		
		 int dt1 = Integer.parseInt(request.getParameter("sabun"));
		 String dt2 =  request.getParameter("name");
		 String dt3 =  request.getParameter("title");
		 int dt4 =Integer.parseInt(request.getParameter("pay"));
		 out.println("<b>넘어온사번=" +  dt1 + "</b><br>");
		 out.println("<b>넘어온이름=" +  dt2 + "</b><br>");
		 out.println("<b>넘어온제목=" +  dt3 + "</b><br>");
		 out.println("<b>넘어온급여=" +  dt4 + "</b><p>");
		 
		 DBSQL dbsql = new DBSQL();
		 DBbean bean = new DBbean();
		 
		 bean.setSabun(dt1);
		 bean.setName(dt2);
		 bean.setTitle(dt3);
		 bean.setPay(dt4);
		 
		 dbsql.dbInsert(bean);
		 out.println("<font size=7 color=blue>저장성공성공</font><br>");
		 out.println("<h1><a href='guest.jsp'>[guest.jsp 신규등록]</a></h1>");
		 
		 response.sendRedirect("list.do");
		 
		 
	}//end

}
