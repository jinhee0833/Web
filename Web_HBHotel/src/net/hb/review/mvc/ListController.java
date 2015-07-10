package net.hb.review.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.* ;

import net.hb.common.DBSQL;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String keyword;
	private String search; 
	private int pn;
	private int total;
	private int limit = 5;
	private int totalPage;
	private int start;
	private int temp;
	private int startPage ;
	private int pageSize = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		request.getAttribute("UTF-8");
		try{
			DBSQL dbSql = new DBSQL() ;	
			
			String keyword = request.getParameter("keyword");
			String search = request.getParameter("search");
			String GpageNum = request.getParameter("pageNum") ;
			if(keyword == null){
				keyword = "title";
				search = "";
			}
					
			List ob = new ArrayList();
			ob = dbSql.dbReviewSelect(keyword, search) ; 
			total = ob.size();
			if(total % pageSize == 0){
				totalPage = total / limit;
			}else{
				totalPage = total / limit + 1;
			}
			
			
			if(GpageNum==null){
				GpageNum="1";			
			}
			pn = Integer.parseInt(GpageNum);
			start = (pn - 1) * limit;
			temp = (pn - 1) % pageSize;
			startPage = pn - temp;
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("search", search);
			request.setAttribute("list",ob) ;
			request.setAttribute("total", total);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("start", start);
			request.setAttribute("startPage", startPage);
			request.setAttribute("limit", limit);
			request.setAttribute("pageSize", pageSize);
			RequestDispatcher dis = request.getRequestDispatcher("reviewList.jsp") ;
			dis.forward(request,response) ;
		}catch(Exception ex){}
		
	}//end
	

}//class
