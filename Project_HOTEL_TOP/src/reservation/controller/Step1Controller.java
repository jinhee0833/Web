
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

@WebServlet("/step1controller.do")
public class Step1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String roomType;
	private String from;
	private String to;
	private String member;
	private String nights;
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
		
		roomType = request.getParameter("roomtype");
		from = request.getParameter("from");//reservation start date
		 to = request.getParameter("to");//reservation end date
		 member = request.getParameter("numberOfMember");
		 nights = request.getParameter("nights");
		try{
			if(roomType==null||from==null||to==null||member==null||nights==null){
				roomType="";
				from="";
				to="";
				member="";
				nights="";
			}
			System.out.println(roomType);
			System.out.println(from);	
			System.out.println(to);
			System.out.println(member);
			System.out.println(nights);
			
			
			
			request.setAttribute("from", from);
			request.setAttribute("to", to);
			request.setAttribute("roomType", roomType);
			request.setAttribute("numberOfMember", member);
			request.setAttribute("nights",nights);
			
			request.setAttribute("pageFile", "reservation/step1.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			
			
			dis.forward(request, response);
		}catch(Exception ex){
			System.out.println("예외발생:　"+ex);
			
		}
			
		
		
		
		
		
		
		
		

	}// end doPost

}// end class
