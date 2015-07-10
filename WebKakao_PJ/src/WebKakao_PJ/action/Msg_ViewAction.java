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


public class Msg_ViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String idx = request.getParameter("idx");
		String user_id = (String) session.getAttribute("user_id");
		
		Msg_bean mbean = new Msg_bean();
		
		Msg_sql msg_sql = new Msg_sql();
		
		
		mbean = msg_sql.Msg_ViewAction(idx, user_id);
		request.setAttribute("mbean", mbean);

		RequestDispatcher dis = request.getRequestDispatcher("message_view.jsp");
		dis.forward(request, response);

		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

}
