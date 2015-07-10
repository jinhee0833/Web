package admin.mvc;

import guest.common.DBSQL_co;
import guest.common.DBSQL_re;
import guest.common.DBbean_re;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.common.DBSQL;



public class re_ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql3;
	private String returnPage;
       
    public re_ListController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ListController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String pnum=request.getParameter("pageNUM");
			
			DBSQL_re dbsql=new DBSQL_re();
			int bb=dbsql.total();
			List ob=dbsql.boardSelect(pnum);
						
			request.setAttribute("hotel", ob);
			request.setAttribute("total", bb);
			
			RequestDispatcher dis=request.getRequestDispatcher("/ad/ad_main.jsp?page=admin_review");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
