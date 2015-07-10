package guest.mvc;

import guest.common.DBSQL_co;
import guest.common.DBSQL_re;
import guest.common.DBbean_co;
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


public class G_coDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_coDeleteController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("co_DeleteController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("co_DeleteController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data=request.getParameter("num");
			String data1=request.getParameter("conum");
			
			DBSQL_co dbsql=new DBSQL_co();
			DBbean_co bean=new DBbean_co();
			
			dbsql.coDelete(data1);
			request.setAttribute("num", data);
			
			RequestDispatcher dis=request.getRequestDispatcher("./G_guestDetail.do");
			dis.forward(request, response);
					
		}catch(Exception ex){  System.out.println("co_Delete ½ÇÆÐ"+ex.toString());  }  
	}//user END
}//class END
