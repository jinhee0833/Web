package net.hb.reservation.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBGuestBean;
import net.hb.common.DBReservationBean;
import net.hb.common.DBSQL;

public class ReservationChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			int code = Integer.parseInt(request.getParameter("code"));
			String loginId = request.getParameter("loginId");
			String chkIn = request.getParameter("chkIn");
			String chkOut = request.getParameter("chkOut");
			int roomPackage = Integer.parseInt(request.getParameter("roomPackage"));
			
			DBSQL dbsql = new DBSQL();
			code = dbsql.dbReservtionChange(code, chkIn, chkOut, loginId, roomPackage);
			request.setAttribute("code", code);
			RequestDispatcher dis = request.getRequestDispatcher("layout.jsp") ;
			dis.forward(request,response) ;
		}catch(Exception e){}
	}

}
