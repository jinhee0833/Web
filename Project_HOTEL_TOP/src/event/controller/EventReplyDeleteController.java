package event.controller;

import java.io.*;
import java.util.List; //ArrayList부모가 List입니다

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import event.dao.EventDAO;
import event.dao.EventReplyDAO;


public class EventReplyDeleteController extends HttpServlet {
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
		System.out.println("EventReplyDeleteController.java/////////////////////////////////////");
		
	    EventReplyDAO erdao = new EventReplyDAO ();
	    int num = Integer.parseInt(request.getParameter("idx"));
	    int dnum = Integer.parseInt(request.getParameter("dnum"));
	    System.out.println("num: "+ num);
		erdao.dbDelete(num);
		
		RequestDispatcher dis = request.getRequestDispatcher("/e_list.do?dnum="+dnum);
		dis.forward(request, response);
	}//end


}//class END










