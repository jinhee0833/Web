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


public class Board_RecommendAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		Board_sql boardsql = new Board_sql();
		
		int idx = Integer.parseInt( request.getParameter("idx"));
		int OK = boardsql.dbRecommend(idx);
		if(OK > 0){
			out.println("<script>");
			out.println("alert('추천하셨습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
