
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
import room.dao.RoomDAO;
import room.vo.RoomVO;

@WebServlet("/reservationStep2.do")
public class ReservationStep2Controller extends HttpServlet {
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
		
		PrintWriter out = response.getWriter();
		out.println("<font size=7 color=blue>reservationStep2.java</font><br>");
		
		// moving step2
		RoomDAO rdao = new RoomDAO(); 
		System.out.println("before get detail rooms");
		String roomid = request.getParameter("roomid");
		String from = request.getParameter("from");//reservation start date
		String to = request.getParameter("to");//reservation end date
		String nights = request.getParameter("nights");
		String member = request.getParameter("numberOfMember");
		//String roomid = "102";
		System.out.println("roomid : " + roomid );
		RoomVO detailRoom = rdao.detailRoom(roomid); 
		
		request.setAttribute("nights", nights);
		request.setAttribute("detailRoom", detailRoom);
		request.setAttribute("from", from);
		request.setAttribute("to", to);
		request.setAttribute("member", member);
		request.setAttribute("pageFile", "reservation/step2detail.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		
		
		dis.forward(request, response);
		

	}// end doPost

}// end class
