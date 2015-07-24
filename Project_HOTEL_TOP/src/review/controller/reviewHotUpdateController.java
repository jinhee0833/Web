package review.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import review.dao.reviewDAO;
import review.vo.reviewVO;

public class reviewHotUpdateController extends HttpServlet {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		try{
			System.out.println("dasg" +request.getParameter("hot"));
			System.out.println("num" +request.getParameter("num"));
			reviewDAO rdao = new reviewDAO();
			reviewVO bean = new reviewVO();		
			bean.setNum(Integer.parseInt(request.getParameter("num")));
			bean.setHot(Integer.parseInt(request.getParameter("hot")));
			
			rdao.dbHotUpdate(bean);		
			RequestDispatcher dis = request.getRequestDispatcher("review_list.do?dnum="+request.getParameter("num"));
			dis.forward(request, response);
			
		}catch(Exception e){ }
		//System.out.println("ListController="+total);
	}//end
}

