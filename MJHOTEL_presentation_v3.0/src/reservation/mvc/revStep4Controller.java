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


@WebServlet("/revStep4Controller")
public class revStep4Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public revStep4Controller() {
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
			String revID = request.getParameter("revID") ;	
			String id2= request.getParameter("id2");
			revDBsql revSql = new revDBsql() ;
			int revDel = revSql.revDelete(revID);
			System.out.println("�Ƶڰ� �Ѿ��?"+id2);
			if(revDel==1){
				System.out.println("��������");
				ok = "Good";
				request.setAttribute("ok", ok) ;
				RequestDispatcher dis = request.getRequestDispatcher("./revStep3.do?id="+id2) ;
				dis.forward(request,response) ;	
				
			}else{
				System.out.println("��������");
				ok = "Bad";
				request.setAttribute("ok", ok) ;
				
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Step1") ;
				dis.forward(request,response) ;	
			}
		
				
			
		}catch(Exception ex){System.out.println("revStep1Controller"+ex.toString());}			

	}//end	
}//class
