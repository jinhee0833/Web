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

public class EditController extends HttpServlet {
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
				int data1 = Integer.parseInt(request.getParameter("num"));
				String data3 = request.getParameter("title");
				String data4 = request.getParameter("contents");
				//int data5 = Integer.parseInt(request.getParameter("hit"));
				
				DBsql dbsql = new DBsql();
				DBbean bean = new DBbean();	// bean 파일을 가져 오고
				
				bean.setNum(data1);
				bean.setTitle(data3);
				bean.setContents(data4);
				//bean.setHit(data5);
				
				int ok = dbsql.dbEdit(bean);
					if(ok > 0){
						response.sendRedirect("./notice.do");
					}
			}catch(Exception ex){ ex.toString();}
	}//user()
}
