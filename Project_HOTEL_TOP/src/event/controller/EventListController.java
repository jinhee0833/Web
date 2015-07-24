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



public class EventListController extends HttpServlet {
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
		
		String pnum = request.getParameter("pageNUM");
		String dnum = request.getParameter("dnum");
		if(dnum==""||dnum==null){ }
		else{
			int d = Integer.parseInt(dnum);
			if(d>0){
				edao.dbUpdateHit(d);
			}
		}
		
		List<EventVO> list = edao.dbSelect(pnum);
		int count = edao.dbCount();
		String total = String.valueOf(count);
		
		/* 임시 세션 삭제 */
		HttpSession session = request.getSession();		session.setAttribute("user", "admin");;

		request.setAttribute("naver", list);
		request.setAttribute("count", total);
		request.setAttribute("pageFile", "board/event/event7List.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);

		//System.out.println("ListController="+total);
	}//end
}

