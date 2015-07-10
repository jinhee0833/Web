package net.hb.notice.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.hb.common.DBNoticeBean;
import net.hb.common.DBSQL;


public class editController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	String path="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			
			MultipartRequest mrp = null;
			 path = this.getServletContext().getRealPath("rain"); 
			 
			 mrp = new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy( ));
			
			String filename = mrp.getFilesystemName("filename");
			
			int num= Integer.parseInt(mrp.getParameter("edt"));
			String writer= mrp.getParameter("writer");
			String title = mrp.getParameter("title");
			String content = mrp.getParameter("content");
			content = content.replaceAll("\n", "<br>");
			
			DBSQL dbsql = new DBSQL();
			DBNoticeBean bean = new DBNoticeBean();
			
			bean.setNum(num);
			bean.setWriter(writer);
			bean.setTitle(title);
			bean.setContent(content);
			bean.setFilename(filename);
			
			dbsql.noticeEdit(bean);
			response.sendRedirect("noticeList.do");
		}catch(Exception ex){}
		
	}
	
}
