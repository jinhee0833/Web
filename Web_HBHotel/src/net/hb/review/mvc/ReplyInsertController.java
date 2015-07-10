package net.hb.review.mvc;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBReplybean;
import net.hb.common.DBSQL;

public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try{
			int num = Integer.parseInt(request.getParameter("num"));
			String r_name = request.getParameter("name");
			String r_content = URLDecoder.decode(request.getParameter("r_content"),"UTF-8");

			DBSQL rdbSql = new DBSQL() ;
			DBReplybean rbean = new DBReplybean() ;
		
			rbean.setNum(num);
			rbean.setR_name(r_name);
			rbean.setR_content(r_content);
			rdbSql.rdbInsert(rbean);	
			String url = "detail.do?num="+num;
			response.sendRedirect(url) ;		
		}catch(Exception ex){}
		
	}//end
	

}//class
