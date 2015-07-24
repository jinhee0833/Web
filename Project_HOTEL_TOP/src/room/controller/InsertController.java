
package room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import room.dao.RoomDAO;
import room.vo.RoomVO;

@WebServlet("/insert.do")
public class InsertController extends HttpServlet {
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
		out.println("<font size=7 color=blue> InsertController.java</font><br>");
		System.out.println("insert controller.java");
		
		
		String data1 = request.getParameter("roomID");
		String data2 = request.getParameter("roomType");
		int data3 = Integer.parseInt(request.getParameter("roomCost"));
		int data4 = Integer.parseInt(request.getParameter("roomCap"));
		String data5 = request.getParameter("room1");
		String data6 = request.getParameter("room2");
		String data7 = request.getParameter("room3");
		String data8 = request.getParameter("room4");
		String data9 = request.getParameter("roomInfo1");
		String data10 = request.getParameter("roomInfo2");
		String data11 = request.getParameter("roomInfo3");
		System.out.println("member dao");
		RoomDAO rdao = new RoomDAO();
		System.out.println("member bean");
		
		RoomVO rvo = new RoomVO();
		rvo.setRoomID(data1);
		System.out.println("data1");
		rvo.setRoomType(data2);
		System.out.println("data2");
		rvo.setRoomCost(data3);
		System.out.println("data3");
		rvo.setRoomCap(data4);
		System.out.println("data4");
		rvo.setRoom1(data5);
		rvo.setRoom2(data6);
		rvo.setRoom3(data7);
		rvo.setRoom4(data8);
		rvo.setRoomInfo1(data9);
		rvo.setRoomInfo2(data10);
		rvo.setRoomInfo3(data11);
		System.out.println("===========bean ============== " + rvo.toString());
		System.out.println("before dbinsert");
		rdao.createRoom(rvo); //������ ó���ϴ� �޼ҵ�
		out.println("<font size=7 color=blue>save successful</font><br>");
		out.println("<a href = 'guest.jsp'>[guest.jsp�űԵ��]</a>");
		//after saving, move to guestlist.jsp to show list
		response.sendRedirect("updateselect.do");
	}// end doPost

}// end class
