package review.controller;

import java.io.*;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import review.dao.reviewDAO;
import review.vo.reviewVO;


public class reviewListController extends HttpServlet {
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
		System.out.println("reviewListController.java/////////////////////////////");
		
		
		HttpSession session = request.getSession();  session.setAttribute("user", "aaa");
		
		String pnum = request.getParameter("pageNUM");
		String dnum = request.getParameter("dNUM");
		String roomid = request.getParameter("roomid");
		
		reviewDAO edao = new reviewDAO();
		List<reviewVO> list = edao.dbSelect(pnum,roomid);
		int count = edao.dbCount(roomid);
		String total = String.valueOf(count);

		request.setAttribute("naver", list);
		request.setAttribute("count", total);
		
		RequestDispatcher dis = request.getRequestDispatcher("board/review/reviewList.jsp");
		dis.forward(request, response);

	}//end
}

