package net.hb.review.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBReplybean;
import net.hb.common.DBSQL;

public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF=8");
		request.setCharacterEncoding("UTF-8");
		
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			String data = request.getParameter("recontent");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			DBSQL dbSql = new DBSQL() ;			
			dbSql.dbReplyDelete(num, data) ;
			response.sendRedirect("detail.do?dt1="+title+"&num="+num+"&content="+content+"&num="+num) ;		
		}catch(Exception ex){}
		
	}//end
	

}//class
