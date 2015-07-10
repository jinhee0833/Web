package event.mvc;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.io.*;
import java.util.List;

import javax.servlet.http.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import event.common.DBSQL;
import event.common.DBbean;


public class EventDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GenericServlet config;
	
	public EventDeleteController() {
        super();
    }//end
	
	public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)호출");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)호출");
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			String num = request.getParameter("num");
			DBSQL dbsql = new DBSQL();
			dbsql.dbDelete(num);
			//response.sendRedirect("./event.do");
			RequestDispatcher dis=request.getRequestDispatcher("./event.do");
			dis.forward(request, response);
		}catch(Exception ex){ }
	}//end

}//class END
