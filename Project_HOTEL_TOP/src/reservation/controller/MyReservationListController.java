
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
import reservation.vo.ReservationVO;
import room.dao.RoomDAO;
import room.vo.RoomVO;

@WebServlet("/myReservation.do")
public class MyReservationListController extends HttpServlet {
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
		System.out.println("before get my reservation list");
		String revID = request.getParameter("revId");
		List<ReservationVO> myList = redao.getMyReservationList(revID);
		
		request.setAttribute("myReservation", myList);
		request.setAttribute("pageFile", "reservation/MemberReservaionList.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
		

	}// end doPost

}// end class
