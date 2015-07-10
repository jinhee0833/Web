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
import javax.servlet.http.HttpSession;

import net.hb.common.DBbean;

//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import reservation.common.revDBbean;
import reservation.common.revDBsql;
import reservation.common.roomDBbean;

@WebServlet("/revStep2Controller")
public class revStep2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public revStep2Controller() {
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
		
		try{
			String revMember = request.getParameter("revMember") ;			
			int revRoomID = Integer.parseInt(request.getParameter("revRoomID")) ;
			int revCost = Integer.parseInt(request.getParameter("revCost") ) ;
			int revCap = Integer.parseInt(request.getParameter("revCap") ) ;
			String revIn = request.getParameter("in") ;
			String revOut = request.getParameter("out") ;
			int revTerm = Integer.parseInt(request.getParameter("revTerm") ) ;
						
			System.out.println(revMember+"\t"+revRoomID+"\t"+revCost+"\t"+revCap+"\t"+revIn+"\t"+revOut+"\t"+revTerm);
			
			revDBsql revdbsql = new revDBsql();
			revDBbean revdbbean=new revDBbean();
						
			revdbbean.setRevMember(revMember);
			revdbbean.setRevRoomID(revRoomID);
			revdbbean.setRevCost(revCost);
			revdbbean.setRevCap(revCap);
			revdbbean.setRevIn(revIn);
			revdbbean.setRevOut(revOut);
			revdbbean.setRevTerm(revTerm);
					
			int revOK = revdbsql.revInsert(revdbbean) ; 
			
			if(revOK==1){
				
				System.out.println("���� ���� �Ͽ����ϴ�.");
			
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Step3") ;
				dis.forward(request,response) ;		
			
			}else{
				
				System.out.println("���� ���� �Ͽ����ϴ�.");
				
				RequestDispatcher dis = request.getRequestDispatcher("./index.jsp?page=reservation/m_reservation&list=reservation_Step3") ;
				dis.forward(request,response) ;		
			}
			
			}catch(Exception ex){System.out.println("revStep1Controller"+ex.toString());}			
				
	}//end	
}//class
