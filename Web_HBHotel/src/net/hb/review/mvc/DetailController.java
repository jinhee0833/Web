package net.hb.review.mvc;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;
import java.util.* ;


import net.hb.common.DBReplybean;
import net.hb.common.DBSQL;
import net.hb.common.DBListBean;

public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int pn;
	private int total;
	private int limit = 3;
	private int totalPage;
	private int start;
	private int temp;
	private int startPage ;
	private int pageSize = 3;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try{
			
			String num = request.getParameter("num");
			String GpageNum = request.getParameter("pageNum") ;
			if(GpageNum==null){
				GpageNum="1";			
			}
			pn = Integer.parseInt(GpageNum);
			
			DBSQL dbSql = new DBSQL() ;
			DBListBean bean1 = new DBListBean() ;
			
			int number = Integer.parseInt(num);
			DBSQL sql = new DBSQL();
			bean1 = dbSql.dbReviewDetail(num) ;
			ArrayList<DBReplybean> bean2 = new ArrayList<DBReplybean>();
			bean2=sql.RedbSelect(number);
			total = bean2.size();
			
			if(total % pageSize == 0){
				totalPage = total / limit;
			}else{
				totalPage = total / limit + 1;
			}
			
			start = (pn - 1) * limit;
			temp = (pn - 1) % pageSize;
			startPage = pn - temp;
			request.setAttribute("num", num);
			request.setAttribute("total", total);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("start", start);
			request.setAttribute("startPage", startPage);
			request.setAttribute("limit", limit);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("detail",bean1) ;
			request.setAttribute("comment",bean2) ;
			RequestDispatcher dis = request.getRequestDispatcher("reviewDetail.jsp") ;
			dis.forward(request,response) ;
		
		}catch(Exception ex){}
		
	}//end
	

}//class
