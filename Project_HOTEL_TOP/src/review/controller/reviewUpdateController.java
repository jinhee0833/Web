package review.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import review.dao.reviewDAO;
import review.vo.reviewVO;

public class reviewUpdateController extends HttpServlet {
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
			reviewDAO rdao = new reviewDAO();
			reviewVO bean = new reviewVO();		
			bean.setNum(Integer.parseInt(request.getParameter("num")));
			bean.setName(request.getParameter("name"));
			bean.setPwd(request.getParameter("pwd"));
			bean.setTitle(request.getParameter("title"));
			bean.setContent(request.getParameter("content"));
			
			rdao.dbUpdate(bean);		
			RequestDispatcher dis = request.getRequestDispatcher("review_list.do");
			dis.forward(request, response);
			
		}catch(Exception e){ }
		//System.out.println("ListController="+total);
	}//end
}

