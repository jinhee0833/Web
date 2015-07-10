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

public class ReservationSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) {
		
		try{
			
			String code = request.getParameter("code");
			String firstCode = code.substring(0, 1).toLowerCase();
			String twoCode = code.substring(1,2).toLowerCase();
			String change1 = null;
			String change2 = null;
			switch(firstCode){
			case "q" : change1 = "1";break;
			case "w" : change1 = "2";break;
			case "e" : change1 = "3";break;
			case "r" : change1 = "4";break;
			case "t" : change1 = "5";break;
			case "y" : change1 = "6";break;
			case "u" : change1 = "7";break;
			case "i" : change1 = "8";break;
			case "o" : change1 = "9";break;
			case "p" : change1 = "10";break;
			case "a" : change1 = "11";break;
			case "s" : change1 = "12";break;
			case "d" : change1 = "13";break;
			case "f" : change1 = "14";break;
			case "g" : change1 = "15";break;
			case "h" : change1 = "16";break;
			case "j" : change1 = "17";break;
			case "k" : change1 = "18";break;
			case "l" : change1 = "19";break;
			case "z" : change1 = "20";break;
			case "x" : change1 = "21";break;
			case "c" : change1 = "22";break;
			case "v" : change1 = "23";break;
			case "b" : change1 = "24";break;
			case "n" : change1 = "25";break;
			case "m" : change1 = "26";break;
			}
			switch(twoCode){
			case "q" : change2 = "1";break;
			case "w" : change2 = "2";break;
			case "e" : change2 = "3";break;
			case "r" : change2 = "4";break;
			case "t" : change2 = "5";break;
			case "y" : change2 = "6";break;
			case "u" : change2 = "7";break;
			case "i" : change2 = "8";break;
			case "o" : change2 = "9";break;
			case "p" : change2 = "10";break;
			case "a" : change2 = "11";break;
			case "s" : change2 = "12";break;
			case "d" : change2 = "13";break;
			case "f" : change2 = "14";break;
			case "g" : change2 = "15";break;
			case "h" : change2 = "16";break;
			case "j" : change2 = "17";break;
			case "k" : change2 = "18";break;
			case "l" : change2 = "19";break;
			case "z" : change2 = "20";break;
			case "x" : change2 = "21";break;
			case "c" : change2 = "22";break;
			case "v" : change2 = "23";break;
			case "b" : change2 = "24";break;
			case "n" : change2 = "25";break;
			case "m" : change2 = "26";break;
			}
			String changeCode = change1 + change2 + code.substring(2);
			
			DBSQL dbsql = new DBSQL();
			DBReservationBean reservationInfo = new DBReservationBean();
			
			reservationInfo = dbsql.reservationSearch(Integer.parseInt(changeCode));
			
			request.setAttribute("reservationInfo", reservationInfo);
			RequestDispatcher dis = request.getRequestDispatcher("reservationSearchResult.jsp") ;
			dis.forward(request,response) ;
			
		}catch(Exception e){}
	}

}
