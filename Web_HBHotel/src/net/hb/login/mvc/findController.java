package net.hb.login.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class findController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}// end

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}// end

	protected void user(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try { 
			String name = request.getParameter("name");
			int call =  Integer.parseInt(request.getParameter("call"));
			String email = request.getParameter("email");

			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;

			bean.setName(name);
			bean.setCall(call);
			bean.setEmail(email);
			dbSql.dbIDFind(bean);
			response.sendRedirect("findLoginok.jsp?id="+bean.getId()+"&pw="+bean.getPw());
		} catch (Exception ex) {System.out.println("InsertController");}
	}// end
}// class
