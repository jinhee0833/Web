
package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.dao.ReservationDAO;
import reservation.vo.ReservationVO;
import room.vo.RoomVO;

@WebServlet("/insertRooms.do")
public class ReservationStep3Controller extends HttpServlet {
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
		ReservationVO revo = new ReservationVO();
		
		
		System.out.println("insert rooms");
		try{
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd"); //String to Date
			String inDate = request.getParameter("from");
			String outDate = request.getParameter("to");
			String roomID = request.getParameter("roomId");
			int nights = Integer.parseInt(request.getParameter("nights"));
			String comment = request.getParameter("comment");
			int cost = Integer.parseInt(request.getParameter("cost"));
			int member = Integer.parseInt(request.getParameter("member"));
			String memberId = "hb";

			revo.setRevIn(inDate);
			revo.setRevOut(outDate);
			revo.setRevRoomID(roomID);
			revo.setRevTerm(nights);
			revo.setRevComment(comment);
			revo.setRevTotalCost(cost);
			revo.setRevNumberGuest(member);
			revo.setRevMemberID(memberId);
			System.out.println("65line//////////////////////////////////////" + revo.toString());
			redao.insertReservation(revo);
			System.out.println("67 --line//////////////////////////////////////");

			request.setAttribute("pageFile", "reservation/step3.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			
			dis.forward(request, response);
		}catch(Exception ex){ ex.toString();}
			
		
		
		

	}// end doPost

}// end class
