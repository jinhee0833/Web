package net.hb.notice.mvc;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.hb.common.DBNoticeBean;
import net.hb.common.DBSQL;

public class listController extends HttpServlet {
	
	private int pagenum ; 
	private String pnum ; 
	private int startpage; 
	private int end; 
	private int start;
	private int pagecnt; 
	private int limit=5; 
	private int pagesize=3; 
	private int temp; 
	
	private String filed; 
	private String word; 
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
	}

	protected void  user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
		
			DBSQL dbsql = new DBSQL();
			DBNoticeBean Bean = new DBNoticeBean();
		
			filed = request.getParameter("filed");
			word = request.getParameter("word");
			
			if(filed==null || word==null ||filed.equals("null")||word.equals("null")){
				filed="writer"; word="";
			}
			
			pnum= request.getParameter("pagenum"); 
				if(pnum==null){pnum="1";} 
				
			pagenum = Integer.parseInt(pnum);
			
			int total = dbsql.noticecnt(Bean, filed, word);
			if(total%limit==0){ pagecnt = total/limit; }
 			 else{pagecnt = total/limit +1 ;} 
			
			end = total-(pagenum-1)*limit;
			start = total-(pagenum*limit)+1; 
			
			temp =(pagenum-1)%pagesize; 
			startpage = pagenum-temp; 
			
			List list = dbsql.noticeList(start, end, filed, word); 
			
			request.setAttribute("pagenum", pagenum);
			request.setAttribute("startpage", startpage);
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("pagecnt", pagecnt);
			request.setAttribute("select", list); 
			RequestDispatcher disp = request.getRequestDispatcher("noticeList.jsp"); 
			disp.forward(request, response);
		}catch(Exception ex){	}
	}
}
