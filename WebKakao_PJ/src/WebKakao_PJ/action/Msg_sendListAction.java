package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;


import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WebKakao_PJ.db.*;


public class Msg_sendListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Msg_bean mbean = new Msg_bean();
		List list = new ArrayList();
		
		String user_name = (String)session.getAttribute("user_name");
		String user_id = (String)session.getAttribute("user_id");
		
		Msg_sql msg_sql = new Msg_sql();
		
		list = msg_sql.Msg_sendListAction(user_id);
		
		request.setAttribute("mlist", list);

		RequestDispatcher dis = request.getRequestDispatcher("message_sendlist.jsp");
		dis.forward(request, response);

		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

}
