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


public class Board_EditAction extends HttpServlet {
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		Board_sql boardsql = new Board_sql();
		Board_bean bean = new Board_bean();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		//저장처리
		String savePath = request.getRealPath("imgUpload");
		// 파일 크기 
		int fileSize = 1024*1024*10; 
   		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request,
				savePath,
				fileSize,
				"euc-kr",
				new DefaultFileRenamePolicy());
		int idx = Integer.parseInt(multi.getParameter("idx"));	
		String brd_content = multi.getParameter("content");
		String brd_file = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		if(brd_file==null){
			brd_file = multi.getParameter("file");
		}
		String brd_public = multi.getParameter("public");
		//String brd_fileFullPath = savePath + "/" + brd_file;
		
		bean.setBrd_content(brd_content);
		bean.setBrd_file(brd_file);
		bean.setBrd_public(brd_public);
		
		int OK = boardsql.dbEdit(idx, bean);
		
		if(OK > 0 ){
			out.println("<script language='javascript'> alert('수정되었습니다.'); document.location.href='myList.do'; </script>");
		}else{
			out.println("실패");
			out.println("<script>");
			out.println("alert ('수정실패');");
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
