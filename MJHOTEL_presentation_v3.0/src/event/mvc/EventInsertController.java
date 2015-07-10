package event.mvc;

import java.io.*;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import event.common.DBSQL;

public class EventInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public EventInsertController() {
        super();
    }//end
	
	public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)호출");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)호출");
	}//end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			DBSQL dbsql = new DBSQL();
			String upPath = getServletContext().getRealPath("/event/files");
			System.out.print(upPath);
			MultipartRequest mr = new MultipartRequest(request, upPath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy( )) ;
			int ok = dbsql.dbInsert(mr);			
			if(ok > 0){
				//response.sendRedirect("./event.do");
				RequestDispatcher dis=request.getRequestDispatcher("./event.do");
				dis.forward(request, response);
			}
			
		}catch(Exception ex){ }
	}//end

}//class END
