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
public class ReservationCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String chkIn;
	private String chkOut;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) {

		try {
			String chkIn = request.getParameter("chkIn");
			String chkOut = request.getParameter("chkOut");
			String loginId = request.getParameter("loginId");
			int roomPackage = Integer.parseInt(request.getParameter("roomPackage"));
			int price = Integer.parseInt(request.getParameter("price"));
			DBSQL dbsql = new DBSQL();
			int code = dbsql.dbReservationInsert(chkIn, chkOut, roomPackage, loginId, price);
			int code1 = (Integer.parseInt(String.valueOf(code).substring(0,1)));
			int code2 = (Integer.parseInt(String.valueOf(code).substring(1,2)));
			String change1 = null;
			String change2 = null;
			switch(code1){
				case 1 : change1 = "q";break;
				case 2 : change1 = "w";break;
				case 3 : change1 = "e";break;
				case 4 : change1 = "r";break;
				case 5 : change1 = "t";break;
				case 6 : change1 = "y";break;
				case 7 : change1 = "u";break;
				case 8 : change1 = "i";break;
				case 9 : change1 = "o";break;
				case 10 : change1 = "p";break;
				case 11 : change1 = "a";break;
				case 12 : change1 = "s";break;
				case 13 : change1 = "d";break;
				case 14 : change1 = "f";break;
				case 15 : change1 = "g";break;
				case 16 : change1 = "h";break;
				case 17 : change1 = "j";break;
				case 18 : change1 = "k";break;
				case 19 : change1 = "l";break;
				case 20 : change1 = "z";break;
				case 21 : change1 = "x";break;
				case 22 : change1 = "c";break;
				case 23 : change1 = "v";break;
				case 24 : change1 = "b";break;
				case 25 : change1 = "n";break;
				case 26 : change1 = "m";break;
			}
			switch(code2){
			case 1 : change2 = "q";break;
			case 2 : change2 = "w";break;
			case 3 : change2 = "e";break;
			case 4 : change2 = "r";break;
			case 5 : change2 = "t";break;
			case 6 : change2 = "y";break;
			case 7 : change2 = "u";break;
			case 8 : change2 = "i";break;
			case 9 : change2 = "o";break;
			case 10 : change2 = "p";break;
			case 11 : change2 = "a";break;
			case 12 : change2 = "s";break;
			case 13 : change2 = "d";break;
			case 14 : change2 = "f";break;
			case 15 : change2 = "g";break;
			case 16 : change2 = "h";break;
			case 17 : change2 = "j";break;
			case 18 : change2 = "k";break;
			case 19 : change2 = "l";break;
			case 20 : change2 = "z";break;
			case 21 : change2 = "x";break;
			case 22 : change2 = "c";break;
			case 23 : change2 = "v";break;
			case 24 : change2 = "b";break;
			case 25 : change2 = "n";break;
			case 26 : change2 = "m";break;
			}
			String code3 = change1.toUpperCase()+change2.toUpperCase()+String.valueOf(code).substring(2);
			request.setAttribute("code3", code3);
			RequestDispatcher dis = request.getRequestDispatcher("step4.jsp");		
			dis.forward(request, response);
		} catch (Exception e) {
		}
	}

}
