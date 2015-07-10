package net.hb.reservation.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBRoomBean;
import net.hb.common.DBSQL;
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String chkIn;
	private String chkOut;
	private String code;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) {


		try {
			chkIn = request.getParameter("chkIn");
			chkOut = request.getParameter("chkOut");
			code = request.getParameter("code");
		
			DBSQL sql = new DBSQL();
			List<DBRoomBean> room = sql.dbReservationCheck(chkIn, chkOut);
		
			request.setAttribute("chkIn", chkIn);
			request.setAttribute("chkOut", chkOut);
			request.setAttribute("roomInfo", room);
			request.setAttribute("code", code);
			RequestDispatcher dis = request.getRequestDispatcher("step2.jsp");		
			dis.forward(request, response);
		} catch (Exception e) {
		}
	}

}
