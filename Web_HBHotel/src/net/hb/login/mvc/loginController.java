package net.hb.login.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class loginController extends HttpServlet {
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
			String id = request.getParameter("id");
			int pwd =  Integer.parseInt(request.getParameter("pw"));
			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;

			bean.setId(id);
			bean.setPw(pwd);
			int success=dbSql.dbLogin(bean);
			if(success>0){
				response.sendRedirect("loginok.jsp?loginid="+bean.getId()+"&success=1");
			}else{
				response.sendRedirect("loginok.jsp?success=0");
			}
		} catch (Exception ex) {System.out.println("loginController : "+ex.toString());}
	}// end
}// class
