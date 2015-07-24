package review.controller;

import java.io.*;
import java.util.List; //ArrayList부모가 List입니다

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import review.dao.reviewDAO;



public class reviewDeleteController extends HttpServlet {
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
	    String NUM = request.getParameter("idx");
	    System.out.println("0000000000num:"+ NUM);
		rdao.dbDelete(NUM);
		
		response.sendRedirect("review_list.do?idx=null");
	}//end


}//class END










