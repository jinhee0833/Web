package net.hb.qna.mvc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;

public class QnaReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		user(request, response);
	}
	
	private void user(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try{
			String userId = request.getParameter("userId");
			System.out.println(userId);
			String pwd = request.getParameter("pwd");
			String reply = request.getParameter("reply");
			int num = Integer.parseInt(request.getParameter("num"));
			int reref = Integer.parseInt(request.getParameter("reref"));
			DBSQL dbsql = new DBSQL();
			dbsql.dbQnaReply(userId, pwd, reply, num, reref);
			
			String uri = "qnacontcon.do?num="+num;
			response.sendRedirect(uri);
		}catch(Exception ex){
			
		}
	}

}
