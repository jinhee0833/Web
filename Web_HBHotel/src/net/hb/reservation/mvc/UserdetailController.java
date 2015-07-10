package net.hb.reservation.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;
import java.io.*;
import java.util.* ;
import javax.servlet.http.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;

public class UserdetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		try{
			
			String data = request.getParameter("userid") ;	
			DBSQL dbSql = new DBSQL() ;
			DBGuestBean bean = new DBGuestBean() ;
			bean = dbSql.dbReservationUserDetail(data) ; 
		
			request.setAttribute("detail",bean) ;
			RequestDispatcher dis = request.getRequestDispatcher("step3.jsp") ;
			dis.forward(request,response) ;

		}catch(Exception ex){}
	}//end
	

}//class
