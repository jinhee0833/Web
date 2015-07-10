package net.hb.management.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.hb.common.DBSQL;

public class UserdeleteController extends HttpServlet {
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
		try{
			String data = request.getParameter("userid") ;	
			//System.out.println(data);
			DBSQL dbSql = new DBSQL() ;								
			dbSql.dbManagementDelete(data) ; 
			response.sendRedirect("managerguset.do") ;
		}catch(Exception ex){}
		
	}//end
	

}//class
