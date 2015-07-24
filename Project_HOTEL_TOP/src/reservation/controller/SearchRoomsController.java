
package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.dao.ReservationDAO;
import room.vo.RoomVO;

//@WebServlet("/searchRooms.do")
public class SearchRoomsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)");
	}// end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)");
	}// end doPost
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=EUC-KR");
		
		ReservationDAO redao = new ReservationDAO();
		System.out.println("before get usable rooms");
		String inDate = request.getParameter("inDate");
		String outDate = request.getParameter("outDate");
		String roomType = request.getParameter("type");
		int numberOfMember = Integer.parseInt(request.getParameter("numberOfMember"));
		
		System.out.println("inDate outDate : " + inDate + ":"+ outDate);
		List<RoomVO> usableRooms = redao.getUsableRooms(inDate, outDate, roomType, numberOfMember); 
		
		request.setAttribute("usableRooms", usableRooms);
		RequestDispatcher dis = request.getRequestDispatcher("reservation/step1List.jsp");
		dis.forward(request, response);
		

	}// end doPost

}// end class
