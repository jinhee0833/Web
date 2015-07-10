package guest.mvc;

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


public class G_EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_EditPreController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("G_EditPreController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("G_EditPreController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String nn=request.getParameter("num");
			
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_re pre=dbsql.boardDetail(nn);
			
			request.setAttribute("hey", pre);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=guest/m_guest&list=G_guestEdit");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());  }  
	}//user END
}//class END
