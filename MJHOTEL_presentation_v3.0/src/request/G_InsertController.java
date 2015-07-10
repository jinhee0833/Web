package request;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import request.DBsql;


@WebServlet("/InsertController")
public class G_InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public G_InsertController() {
    	super() ;
    
    }//con

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		
	}//doPost

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try{
			//int data= Integer.parseInt(request.getParameter("qno"));
			String data1= request.getParameter("qselect");
			String data2= request.getParameter("qtitle");
			String data3= request.getParameter("qname");
			String data4= request.getParameter("qtel");
			String data5= request.getParameter("qemail");
			String data6= request.getParameter("qcontents");
			
			DBsql dbSql = new DBsql() ;	
			DBbean bean = new DBbean();

			//bean.setQno(data);	
			bean.setQselect(data1);	
			bean.setQtitle(data2);	
			bean.setQname(data3);
			bean.setQtel(data4);
			bean.setQemail(data5);
			bean.setQcontents(data6);
			
			int ok = dbSql.dbInsert(bean);
			
			if(ok>0){System.out.println("ok");
			response.sendRedirect("./index.jsp?page=qna/m_qna&list=G_requestInsert");
			}
			else {System.out.println("no");}
		}catch(Exception ex){System.out.println(ex.toString()+"einsert");}
		
	}//end
	
	
}//class
