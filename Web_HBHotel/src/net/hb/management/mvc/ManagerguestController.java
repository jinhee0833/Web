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
import java.util.* ;
import javax.servlet.http.*;

import net.hb.common.DBSQL;
import net.hb.common.DBGuestBean;
import net.hb.common.DBListBean;

public class ManagerguestController extends HttpServlet {
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
		PrintWriter out = response.getWriter();
		try{
			DBSQL dbSql = new DBSQL() ;	
			String MpageNum = request.getParameter("pageNum") ;
			String Mselect = request.getParameter("keyfield") ;
			String Mkeyword = request.getParameter("keyword") ;
			
			if(Mselect==null) Mselect="userid";
			if(Mkeyword==null) Mkeyword="";
			int pn = 1;

			if(MpageNum==null) MpageNum="1";			
			pn=Integer.parseInt(MpageNum);
					
			List ob = dbSql.dbManagementguesetSelect(pn,Mselect,Mkeyword) ; 
			request.setAttribute("pageN", MpageNum) ;
			request.setAttribute("list",ob) ;
			
			request.setAttribute("field",Mselect) ;
			request.setAttribute("word",Mkeyword) ;
				
			RequestDispatcher dis = request.getRequestDispatcher("managermember.jsp") ;
			dis.forward(request,response) ;
			
		}catch(Exception ex){}
		
		
	}//end
	

}//class
