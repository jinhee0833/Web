package net.hb.qna.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;
import net.hb.common.DBqnabean;
import com.oreilly.servlet.*;
import java.io.*;
import com.oreilly.servlet.multipart.*;

public class QnaReWriterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try{
			MultipartRequest mr  = null;
			String upPath = this.getServletContext().getRealPath("/board2/files");
			DBSQL dbsql = new DBSQL();
			try{
				mr = new MultipartRequest(request, upPath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy( ));
			}catch(IOException e){
				e.printStackTrace();
			}
			String ip = request.getRemoteAddr();
			dbsql.insertReBoard(mr, ip);
			String uri = "qnacontcon.do?num="+mr.getParameter("num");
			
			response.sendRedirect(uri);
		}catch(Exception ex){ 		System.out.println(ex.toString());	}
	}//end
}//class end


