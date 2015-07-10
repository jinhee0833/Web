package request;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import request.DBsql;

public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		try{
			out.println("<h1>DeleteController.java</h1>");
			
			int data= Integer.parseInt(request.getParameter("num"));
			DBsql dbSql = new DBsql();	
			dbSql.dbDelete(data);
			response.sendRedirect("./request.do");	
		}catch(Exception ex){ out.println("���� ����"+ex.toString());}
	} //end
} //class END








