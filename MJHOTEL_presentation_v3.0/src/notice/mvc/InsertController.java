package notice.mvc;

import java.io.IOException;
import java.io.PrintWriter;

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

public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
				String data3 = request.getParameter("title");
				String data4 = request.getParameter("contents");
				
				DBsql dbsql = new DBsql();
				DBbean bean = new DBbean();	// bean 파일을 가져 오고
				
				System.out.println(data3+data4);
				bean.setTitle(data3);
				bean.setContents(data4);
				
				int ok = dbsql.dbInsert(bean);
					if(ok > 0){
						response.sendRedirect("./notice.do");
					}
			}catch(Exception ex){ ex.toString();}
	}//user()
}
