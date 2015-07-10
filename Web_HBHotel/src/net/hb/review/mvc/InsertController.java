package net.hb.review.mvc;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;
import net.hb.common.DBListBean;

public class InsertController extends HttpServlet {
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
			String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
			String title = URLDecoder.decode(request.getParameter("title"), "UTF-8") ;
			String content = URLDecoder.decode(request.getParameter("content"), "UTF-8") ;
			DBSQL dbSql = new DBSQL() ;
			DBListBean bean = new DBListBean() ;
			
			bean.setName(name);
			bean.setTitle(title) ;
			bean.setContent(content) ;
		
			int ok = dbSql.dbReviewInsert(bean) ;
			if(ok>0){
				response.sendRedirect("list.do") ;		
			}  //if
			
		}catch(Exception ex){}
		
	}//end
	

}//class
