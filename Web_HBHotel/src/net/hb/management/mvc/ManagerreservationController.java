package net.hb.management.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*;
import java.io.*;
import java.sql.Date;
import java.util.* ;

import javax.servlet.http.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;
import net.hb.common.DBListBean;

public class ManagerreservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int pn;
	private int total;
	private int limit = 3;
	private int totalPage;
	private int start;
	private int temp;
	private int startPage ;
	private int pageSize = 3;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			DBSQL dbSql = new DBSQL() ;	
			
			Calendar now = Calendar.getInstance();
			int yy =now.get(now.YEAR);
			String thisyear =String.valueOf(yy).substring(2);
			
			String month = request.getParameter("month") ;
			if(month==null){
				month="";			
			}
			String GpageNum = request.getParameter("pageNum") ;
			if(GpageNum==null){
				GpageNum="1";			
			}
			pn = Integer.parseInt(GpageNum);
					
			List ob = new ArrayList();
			ob = dbSql.dbManagementSelect(pn,thisyear,month); 
			total = ob.size();
			
			if(total % pageSize == 0){
				totalPage = total / limit;
			}else{
				totalPage = total / limit + 1;
			}
			
			start = (pn - 1) * limit;
			temp = (pn - 1) % pageSize;
			startPage = pn - temp;
			request.setAttribute("list",ob) ;
			request.setAttribute("total", total);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("start", start);
			request.setAttribute("startPage", startPage);
			request.setAttribute("limit", limit);
			request.setAttribute("pageSize", pageSize);
			
			request.setAttribute("month",month) ;
			
			RequestDispatcher dis = request.getRequestDispatcher("managerreservation.jsp") ;
			dis.forward(request,response) ;
			
		}catch(Exception ex){}
		
		
	}//end
	

}//class
