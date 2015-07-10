package net.hb.login.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;


import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class deleteMemberController extends HttpServlet {
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
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		try { 
			String id = request.getParameter("id");

			DBSQL dbSql = new DBSQL() ;
			dbSql.dbDeleteMypage(id);
			response.sendRedirect("logout.jsp");
		} catch (Exception ex) {System.out.println("modifyMemberController");}
	}// end

}// class
