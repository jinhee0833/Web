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


public class Board_DetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		Board_sql boardsql = new Board_sql();
		int idx = Integer.parseInt(request.getParameter("idx"));
		String flag = request.getParameter("flag");
		String action = request.getParameter("action");
		
		int minIdx = boardsql.dbMinIdx(user_id, flag);
		int maxIdx = boardsql.dbMaxIdx(user_id,flag);
		int pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		
		Board_bean bean = null;
		List c_list = new ArrayList();
		
		if(action.equals("detail")){
			bean = boardsql.dbDetail(idx);
			c_list = boardsql.dbCommentLoad(idx);
		}else if(action.equals("pre")){
			bean = boardsql.dbPrevious(idx, user_id, flag);
		}else if(action.equals("next")){
			bean = boardsql.dbNextview(idx, user_id, flag);
		}
		
		if(flag.equals("true")){
			request.setAttribute("list", bean);
			request.setAttribute("pageNUM", pageNUM);
			request.setAttribute("minIdx", minIdx);
			request.setAttribute("maxIdx", maxIdx);
			
			request.setAttribute("comment_list", c_list);
			RequestDispatcher dis = request.getRequestDispatcher("Story_View1.jsp");
			dis.forward(request, response);
			//dis.include(request, response);
			
		}else{
			request.setAttribute("list", bean);
			request.setAttribute("pageNUM", pageNUM);
			request.setAttribute("minIdx", minIdx);
			request.setAttribute("maxIdx", maxIdx);
			
			request.setAttribute("comment_list", c_list);
			RequestDispatcher dis = request.getRequestDispatcher("Story_View2.jsp");
			dis.forward(request, response);
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
