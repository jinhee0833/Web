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


public class Msg_DeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Msg_sql msg_sql = new Msg_sql();
		
		String idx = request.getParameter("idx");
		int OK = 0;
		OK = msg_sql.Msg_DeleteAction(idx);
		if ( OK > 0){
			out.print("<script>alert('쪽지가 삭제되었습니다');window.close();</script>");
		}else{
			out.print("<script>alert('오류로 인해 삭제가 실패하였습니다');window.close();</script>");
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doList(request, response);
	}

}
