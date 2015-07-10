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

public class qnaUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			String filename2 , filename;
			MultipartRequest mr  = null;
			String upPath = this.getServletContext().getRealPath("/board2/files");
			DBSQL dbsql = new DBSQL();
			
			try{
				mr = new MultipartRequest(request, upPath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy( ));
			}catch(IOException e){
				e.printStackTrace();
			}
			
			filename = mr.getFilesystemName("filename");
			filename2 = mr.getParameter("filename2");
			File file = new File(upPath,filename2);
			
			boolean isCheck = dbsql.checkBoard(mr.getParameter("num"), mr.getParameter("passwd"));
			
			String msg = null;
			if (isCheck==true){ 
				int res = dbsql.updateBoard(mr);   
				if (res>0){
					if(filename!=null)file.delete();
				}
			}
			
			response.sendRedirect("qnalist.do");
		}catch(Exception ex){ }
	}//end
}//class end


