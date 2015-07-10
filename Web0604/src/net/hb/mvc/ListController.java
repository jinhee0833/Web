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


@WebServlet("/ListController")
public class ListController extends HttpServlet {
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
		
		String pnum = request.getParameter("pageNUM");
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		
		
		 DBSQL dbsql = new DBSQL();
		 List<DBbean> list =dbsql.dbSelect(pnum,keyfield,keyword);
		 int count = dbsql.getGuestCount();
		 String msg = String.valueOf(count);
		 
		 request.setAttribute("count", msg);
		 request.setAttribute("naver", list);
		 //guestList.jsp문서에서 naver개체를 getAttribute("naver");
		 RequestDispatcher dis = request.getRequestDispatcher("guestList.jsp");
		 dis.forward(request, response);
		 
		
	}//end

}
