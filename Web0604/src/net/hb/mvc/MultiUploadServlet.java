package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import not.hb.common.DBSQL;
import not.hb.common.DBbean;


//@WebServlet("/upload2.do")
public class MultiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doGet(1,2)");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doPost(1,2)");
	}
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charse=EUC-KR");
		PrintWriter out = response.getWriter();
		String savePath = "upload";
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println(uploadFilePath);
		
		
		
		try{
			MultipartRequest multi = new MultipartRequest(request, 
					uploadFilePath , 
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy());
			String data = multi.getParameter("a");
				System.out.println(data);
			System.out.println("///////////////////////////////////////////");
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()){
				String file = (String) files.nextElement();
				String file_name = multi.getFilesystemName(file);
				String ori_file_name = multi.getOriginalFileName(file);
				out.print("<br> 업로드된 파일명 : " + file_name);
				out.print("<br> 원본 파일명 : " + ori_file_name);
				out.println("<hr>");
				System.out.println("end");
			}
		}catch(Exception ex){
			System.out.println("예외발생"+ex);
		}
		
		
	}//end

}
