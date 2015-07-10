package notice.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.io.*;

import javax.servlet.http.*;

import notice.common.DBbean;
import notice.common.DBsql;

public class EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doGet
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doPost
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			int data = Integer.parseInt(request.getParameter("num"));
			DBsql dbsql = new DBsql();
		
			DBbean bean = dbsql.dbDetail(data);
			
			request.setAttribute("edit", bean);
			RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=admin/m_admin&list=noticeEdit");
			dis.forward(request, response);
		}catch(Exception ex){out.println("저장 실패 :" + ex.toString());}
	}//user
}//class