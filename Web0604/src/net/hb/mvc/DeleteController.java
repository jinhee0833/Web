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

import not.hb.common.DBSQL;
import not.hb.common.DBbean;


@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
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
		out.println("<font size=7 color=blue>ListController.java</font><br>");
		out.println("<img src='images/aaa.gif'><p>");
		
		 
		 DBSQL dbsql = new DBSQL();	  
		 String dt1 = request.getParameter("sabun");
		 dbsql.Delete(dt1);
		 
		 response.sendRedirect("list.do");
		  
		
	}//end

}
