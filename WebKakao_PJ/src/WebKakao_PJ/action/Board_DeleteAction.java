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


public class Board_DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		//out.println("<h1>DeleteAction.java</h1> <br>");
		
		HttpSession session = request.getSession();
		int idx = Integer.parseInt(request.getParameter("idx"));
		String user_id = (String) session.getAttribute("user_id");
		Board_sql boardsql = new Board_sql();
		
		//System.out.println("==========Delete.do=========");
		//System.out.println("idx :"+idx+", user_id : "+user_id);
		
		int OK = boardsql.dbDelete(user_id, idx);
		if(OK > 0){
			out.println("<script>");
			out.println("alert('삭제성공');");
			out.println("document.location.href='myList.do'; ");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('삭제 할 수 없습니다.');");
			out.println("document.location.href='myList.do';");
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
