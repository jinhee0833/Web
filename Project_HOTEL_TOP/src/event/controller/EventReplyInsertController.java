package event.controller;

import java.awt.Window;
import java.io.*;
import java.util.List;//ArrayList의 부모가 List

import javafx.scene.control.Alert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;






import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import event.dao.EventDAO;
import event.dao.EventReplyDAO;
import event.vo.EventReplyVO;

public class EventReplyInsertController extends HttpServlet {
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
	System.out.println("\nEventReplyInsertController.java/////////////////////////////");
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		//PrintWriter out = response.getWriter();
		
		int dt1 = Integer.parseInt(request.getParameter("dnum"));
		String dt2 = request.getParameter("id");
		String dt3 = request.getParameter("pwd");
		String dt4 = request.getParameter("cont");
		System.out.println("\ngetid= "+dt2);
		
		EventReplyDAO dbsql = new EventReplyDAO();
		EventReplyVO bean = new EventReplyVO();
			bean.setNum(dt1);
			bean.setR_name(dt2);
			bean.setR_passwd(dt3);
			bean.setR_content(dt4);
			
		dbsql.dbInsert(bean);//real save

		//out.println("<font size=7 color=blue>저장성공</font><br>");
		
		/*RequestDispatcher dis = request.getRequestDispatcher("/e_list.do?dnum="+dt1);*/
		
		RequestDispatcher dis = request.getRequestDispatcher("/e_list.do?dnum="+dt1);
		dis.forward(request, response);
		
		
		//response.sendRedirect("list.do");
		//System.out.println("ListController="+total);
	}//end
}

