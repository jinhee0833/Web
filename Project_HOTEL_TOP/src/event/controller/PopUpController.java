package event.controller;

import java.io.*;
import java.util.List;//ArrayList의 부모가 List

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import event.dao.EventDAO;
import event.dao.EventReplyDAO;
import event.vo.EventReplyVO;
import event.vo.EventVO;


@WebServlet("/PopUpController.do")
public class PopUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(1,2)");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(1,2)");
	}//end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		System.out.println("PopUpController.java/////////////////////////////");
		
		
		EventDAO edao = new EventDAO();
		
		List<EventVO> list = edao.PopUp();
		

		request.setAttribute("popup", list);
		RequestDispatcher dis = request.getRequestDispatcher("popup/popup.jsp");

		dis.forward(request, response);

	}//end
}

