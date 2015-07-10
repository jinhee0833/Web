package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.common.DBSQL;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response); 
	} //end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();   
		
		try {
			response.setCharacterEncoding("EUC-KR");
			response.setContentType("text/xml;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			
			String data1 = request.getParameter("loginID") ;
			String data2 = request.getParameter("loginPW") ;
			
			System.out.println("넘어온 ID: "+data1+"  넘어온 PW: "+data2);
		
			DBSQL dbsql = new DBSQL();
			int dd = dbsql.dbSearch(data1,data2);
			if(dd==1) {	
				HttpSession session = request.getSession();
				session.setAttribute("NowUser", data1); 
				System.out.println(session);// 세션관련
								
				sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				sb.append("<item><login>true</login><name>"+data1+"</name></item>");
								
			} else {
			}//else end
			out.print(sb.toString());
			
		} catch (Exception ex) {ex.toString();}
		
	} //end
} //class END