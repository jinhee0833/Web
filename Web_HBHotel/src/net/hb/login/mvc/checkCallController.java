package net.hb.login.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class checkCallController extends HttpServlet {
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
		try {
			int call = Integer.parseInt(request.getParameter("call"));
			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;
			
			bean.setCall(call);
			int success=dbSql.dbJoinCheckCall(bean);
			response.sendRedirect("checkCall.jsp?&success="+success);
		} catch (Exception ex) {System.out.println("checkCallController : "+ex.toString());}
	}// end
}// class
