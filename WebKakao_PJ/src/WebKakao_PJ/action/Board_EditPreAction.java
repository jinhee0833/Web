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


public class Board_EditPreAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		Board_sql boardsql = new Board_sql();
		int idx = Integer.parseInt(request.getParameter("idx"));
		Board_bean bean = boardsql.dbDetail(idx);
		
		request.setAttribute("list", bean);
		RequestDispatcher dis = request.getRequestDispatcher("Story_Edit1.jsp");
		dis.forward(request, response);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
