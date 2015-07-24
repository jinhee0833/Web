package review.controller;

import java.io.*;
import java.util.List;//ArrayList의 부모가 List

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import review.dao.reviewDAO;
import review.vo.reviewVO;

public class reviewInsertController extends HttpServlet {
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
		System.out.println("EventInsertController.java/////////////////////////////");
		PrintWriter out = response.getWriter();
		
		try{
			reviewDAO rdao = new reviewDAO();
			reviewVO bean = new reviewVO();	
			String roomid = request.getParameter("roomID");
			bean.setRoomID(request.getParameter("roomID"));
			bean.setName(request.getParameter("name"));
			bean.setPwd(request.getParameter("pwd"));
			bean.setTitle(request.getParameter("title"));
			bean.setContent(request.getParameter("content"));
			
			System.out.println("1" + request.getParameter("roomID"));
			System.out.println("1" + request.getParameter("name"));
			System.out.println("1" + request.getParameter("pwd"));
			System.out.println("1" + request.getParameter("title"));
			System.out.println("1" + request.getParameter("content"));
			
			rdao.dbInsert(bean);		
			System.out.println("ddddddddddddddddddddddddddddddd");
			RequestDispatcher dis = request.getRequestDispatcher("review_list.do?roomid="+roomid);
			dis.forward(request, response);
			
		}catch(Exception e){ }
		//System.out.println("ListController="+total);
	}//end
}

