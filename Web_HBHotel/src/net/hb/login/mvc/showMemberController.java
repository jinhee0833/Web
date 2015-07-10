package net.hb.login.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;
import java.io.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class showMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}// end

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}// end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try { 
			String data1 = request.getParameter("loginId");
			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;
			bean.setId(data1) ;
			
			bean=dbSql.dbMypageShow(bean);
			request.setAttribute("member", bean);
			RequestDispatcher dis=request.getRequestDispatcher("showMember.jsp");
			dis.forward(request, response);
		} catch (Exception ex) {}
	}// end

}// class
