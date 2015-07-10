package reservation.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import reservation.common.revDBsql;
import reservation.common.revDBbean;
import reservation.common.roomDBbean;


@WebServlet("/revStep3Controller")
public class revStep3Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public revStep3Controller() {
		super();      
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String ok ;

		try{
			String revMember = request.getParameter("id") ;			
			System.out.println("�Ѿ�� id :"+revMember);

			revDBsql revSql = new revDBsql() ; 
			List revlist = revSql.revList(revMember) ;			

			if(revlist==null){

				ok = "noData";
				request.setAttribute("ok", ok) ;

				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Check") ;
				dis.forward(request,response) ;		

			}// if end			
			else{
				ok = "ok";
			
				request.setAttribute("revlist", revlist) ;
				request.setAttribute("ok", ok) ;
				
				
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Check") ;
				dis.forward(request,response) ;		
			}//else end
		}catch(Exception ex){System.out.println("revStep1Controller"+ex.toString());}			

	}//end	
}//class
