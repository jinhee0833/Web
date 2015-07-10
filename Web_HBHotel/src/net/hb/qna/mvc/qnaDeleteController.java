package net.hb.qna.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;
import net.hb.common.DBqnabean;
import com.oreilly.servlet.*;
import java.io.*;
import com.oreilly.servlet.multipart.*;

public class qnaDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			MultipartRequest mr  = null;
			String num = request.getParameter("num");
			String passwd = request.getParameter("passwd");
			if (num==null || num.trim().equals("")){
				response.sendRedirect("qnalist2.jsp");
				return;
			}
			DBSQL dbsql = new DBSQL();
			boolean isCheck = dbsql.checkBoard(num, passwd);
			if (isCheck){
				dbsql.deleteBoard(num); 
			}
			response.sendRedirect("qnalist.do");
			
		}catch(Exception ex){ }
	}//end
}//class end


