package net.hb.login.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;


import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class modifyMemberController extends HttpServlet {
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
			String id = request.getParameter("id");
			int pwd = Integer.parseInt(request.getParameter("pw"));
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			int birth = Integer.parseInt(request.getParameter("birth"));
			int call =  Integer.parseInt(request.getParameter("call"));
			String email = request.getParameter("email");

			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;

			bean.setId(id) ;
			bean.setPw(pwd) ;
			bean.setName(name) ;
			bean.setSex(sex) ;
			bean.setBirth(birth);
			bean.setCall(call);
			bean.setEmail(email);
			
			dbSql.dbModify(bean);
			response.sendRedirect("layout.jsp");
		} catch (Exception ex) {System.out.println("modifyMemberController");}
	}// end

}// class
