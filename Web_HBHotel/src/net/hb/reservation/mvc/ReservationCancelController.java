package net.hb.reservation.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;

public class ReservationCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) {

		int code = Integer.parseInt(request.getParameter("code"));
		
		try{
			DBSQL dbsql = new DBSQL();
			dbsql.dbReservationCancel(code);
			RequestDispatcher dis = request.getRequestDispatcher("layout.jsp") ;
			dis.forward(request,response) ;
		}catch(Exception ex){
			
		}
	}

}
