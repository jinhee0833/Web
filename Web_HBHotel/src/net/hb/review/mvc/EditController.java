package net.hb.review.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import net.hb.common.DBSQL;
import net.hb.common.DBListBean;

public class EditController extends HttpServlet {
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
		request.getParameter("UTF-8");
		try{
			DBSQL dbSql = new DBSQL() ;
			DBListBean bean = new DBListBean() ;
						
			String name = request.getParameter("name") ;
			String title = request.getParameter("title") ;
			String content = request.getParameter("content") ;
			int num = Integer.parseInt(request.getParameter("num")) ;
			
			
			bean.setNum(num);
			bean.setName(name) ;
			bean.setTitle(title) ;
			bean.setContent(content) ;
			
			
			dbSql.dbReviewEdit(bean) ;
			
			response.sendRedirect("list.do") ;
			
		}catch(Exception ex){}
		
	}//end
	

}//class
