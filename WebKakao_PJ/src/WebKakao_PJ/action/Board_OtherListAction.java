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


public class Board_OtherListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		Boolean bool = false;

		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");

		Board_sql boardsql = new Board_sql();
		String pnum = request.getParameter("pageNUM");
		if(pnum == null) { pnum ="1"; }
		int pageNUM = Integer.parseInt(pnum);
		int limit=12;
		int cnt = boardsql.dbCount(user_id, bool);
		int pagecount;
		int pageSize = 5;
		if(cnt%limit ==0) { pagecount = cnt/limit;}
		else{ pagecount = (cnt/limit)+1; }
		if(cnt ==0) pagecount = 1;
		int maxRnum = boardsql.dbMaxrnum(user_id, bool);
		int start = maxRnum - (pageNUM-1)*limit;
		int end = start-limit+1;
		if(end <= 0) end=1;
		int temp = (pageNUM -1)% pageSize;
		int startPage = pageNUM-temp;
		List list = boardsql.dbSelect(user_id, start, end, bool); // id 값 넘기기


		request.setAttribute("list", list); 
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("pageCount", pagecount);
		
		int Msg_YN = boardsql.Msg_YN(user_id);
		request.setAttribute("Msg_YN", Msg_YN);
		
		RequestDispatcher dis = request.getRequestDispatcher("Story_List2.jsp");
		dis.forward(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
