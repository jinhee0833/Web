package event.controller;

import java.io.*;
import java.util.List;//ArrayList의 부모가 List

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import review.dao.reviewDAO;
import review.vo.reviewVO;
import event.dao.EventDAO;
import event.dao.EventReplyDAO;
import event.vo.EventReplyVO;
import event.vo.EventVO;

public class EventDetailController extends HttpServlet {
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
		System.out.println("EventListController.java/////////////////////////////");
		
		EventDAO edao = new EventDAO();
		EventVO evo = new EventVO();
		
		String NUM = request.getParameter("dnum");
		System.out.println("evoooooooooooooo="+request.getParameter("dnum"));
		System.out.println("evoooooooooooooo="+NUM);
		evo = edao.dbDetail(NUM);
		System.out.println("evoooooooooooooo="+evo.getNum());
		System.out.println("evoooooooooooooo="+evo.getTitle());
		
		request.setAttribute("naver", evo);
		request.setAttribute("pageFile", "board/event/event7Edit.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);

		//System.out.println("ListController="+total);
	}//end
}

