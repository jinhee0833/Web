package event.mvc;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.io.*;
import java.util.List;

import javax.servlet.http.*;

import event.common.DBSQL;
import event.common.DBbean;


public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GenericServlet config;
	
	public void init(ServletConfig config) throws ServletException {
        super.init(config);
   }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	//	System.out.println("doGet(request, response)호출");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);	
		//	System.out.println("doPost(request, response)호출");
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			DBSQL dbsql = new DBSQL();

			String pnum = request.getParameter("pageNUM");
			String pageType = request.getParameter("pageType");
			String Fnum = request.getParameter("num");
			List ob = null ;
			
			int pageSize=3;
			int limit=3;
			int pageCount = 0;
			int total = 0;
			if(pnum==null){ pnum="1";}
			int pageNUM = Integer.parseInt(pnum);
			int start = (pageNUM-1) * limit+1;
			int end = pageNUM * limit;														
			int temp = (pageNUM - 1) % pageSize;		
			int startPage = pageNUM - temp;
			
			if(Fnum==null){Fnum="0";}
			else{
				int num = Integer.parseInt(Fnum);
				List detail = dbsql.dbDetail(num);
				request.setAttribute("detail", detail);
			}
			request.setAttribute("num", Fnum);
																			
			if(pageType==null){pageType="now";}			
			if(pageType.equals("now")) {
				total = dbsql.dbTotalNow();
				ob = dbsql.dbSelectNow(start, end);
			}						
			else if(pageType.equals("past")) {
				total = dbsql.dbTotalPast();
				ob = dbsql.dbSelectPast(start, end);				 
			}

			if(total%limit==0){pageCount = total/limit;}
			else if(total%limit!=0){pageCount = (total/limit) + 1;}
						
			request.setAttribute("pageNUM", pageNUM );
			request.setAttribute("startPage", startPage);
			request.setAttribute("total", total);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("list", ob);
			request.setAttribute("pageType", pageType) ;

			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=event");
			dis.forward(request, response);	

		}catch(Exception ex){ }
	}//end

}//class END
