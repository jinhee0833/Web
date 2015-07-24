package event.controller;

import java.io.*;
import java.util.List;//ArrayList의 부모가 List

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import event.dao.EventDAO;

public class EventInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(1,2)");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(1,2)");
	}//end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		System.out.println("EventInsertController.java/////////////////////////////");
		PrintWriter out = response.getWriter();
		
		try{
			EventDAO edao = new EventDAO();
			String upPath = getServletContext().getRealPath("board/event/images");
			System.out.print(upPath);
			MultipartRequest mr = new MultipartRequest(request, upPath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy( )) ;
				
			edao.dbInsert(mr);			
			
				RequestDispatcher dis = request.getRequestDispatcher("e_list.do");
				dis.forward(request, response);
			
		}catch(Exception e){ }
		//System.out.println("ListController="+total);
	}//end
}

