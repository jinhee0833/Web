package notice.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.io.*;
import java.util.List;

import javax.servlet.http.*;

import notice.common.DBbean;
import notice.common.DBsql;

public class G_ListController extends HttpServlet {
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
				DBsql dbsql = new DBsql();
				String pnum = request.getParameter("pageNUM");				
				
				List ob = dbsql.dbSelect(pnum);
				request.setAttribute("list", ob);
				
				System.out.println(ob);
				
				int total = dbsql.dbCount();
				request.setAttribute("total",total);

				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=mjhotel/m_mjhotel&list=G_notice");
				dis.forward(request, response);
			}catch(Exception ex){ System.out.println("¿À·ù: "+ex.toString());}
	}//user()
}
