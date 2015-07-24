package review.controller;

import java.io.*;
import java.util.List; //ArrayList부모가 List입니다

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import review.dao.reviewDAO;
import review.vo.reviewVO;



public class reviewDetailController extends HttpServlet {
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
		response.setContentType("text/html;charset=EUC-KR");
		
		reviewDAO rdao = new reviewDAO();
	    reviewVO rvo = new reviewVO(); 
		String NUM = request.getParameter("idx");
	    
		rvo = rdao.dbDetail(NUM);
	    System.out.println("DetailController:"+rvo.getNum());
	    System.out.println("DetailController:"+rvo.getNum());
	    System.out.println("DetailController:"+rvo.getNum());
	    System.out.println("DetailController:"+rvo.getNum());
	    System.out.println("DetailController:"+rvo.getNum());
		request.setAttribute("naver", rvo);
		
		RequestDispatcher dis = request.getRequestDispatcher("board/review/reviewUpdate.jsp");
		dis.forward(request, response);
	}//end


}//class END










