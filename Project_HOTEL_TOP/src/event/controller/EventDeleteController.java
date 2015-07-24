package event.controller;

import java.io.*;
import java.util.List; //ArrayList부모가 List입니다

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import event.dao.EventDAO;


public class EventDeleteController extends HttpServlet {
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
		
	    EventDAO edao = new EventDAO();
	    int num = Integer.parseInt(request.getParameter("idx"));
	    System.out.println("0000000000num:"+ num);
		edao.dbDelete(num);
		
		response.sendRedirect("e_list.do?idx=null");
	}//end


}//class END










