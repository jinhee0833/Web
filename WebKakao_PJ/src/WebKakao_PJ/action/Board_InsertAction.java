package WebKakao_PJ.action;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import WebKakao_PJ.db.*;


public class Board_InsertAction extends HttpServlet {
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		Board_sql boardsql = new Board_sql();
		Board_bean bean = new Board_bean();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		//历厘贸府
		String savePath = request.getRealPath("imgUpload");
		// 颇老 农扁 
		int fileSize = 1024*1024*10;
		File tempDir = new File(savePath);
		if(!tempDir.exists()) tempDir.mkdir();
   		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,
				savePath,
				fileSize,
				"euc-kr",
				new DefaultFileRenamePolicy());
			
		String brd_name = multi.getParameter("writer");
		String brd_id = multi.getParameter("id");
		String brd_content = multi.getParameter("content");
		String brd_file = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		String brd_public = multi.getParameter("public");

		System.out.println("brd_"+brd_file);
		
		if(brd_file==null){
			brd_file = "noimage.jpg";
		}
		
		bean.setBrd_id(brd_id);
		bean.setBrd_name(brd_name);
		bean.setBrd_content(brd_content);
		bean.setBrd_file(brd_file);
		bean.setBrd_public(brd_public);
				
		int OK = boardsql.dbInsert(bean, user_id);
		
		if(OK > 0 ){
			out.println("<script language='javascript'> alert('历厘己傍'); document.location.href='myList.do'; </script>");
		}else{
			out.println("<script>");
			out.println("alert ('历厘角菩');");
			out.println("</script>");
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
