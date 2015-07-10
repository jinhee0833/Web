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


public class G_DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_DetailController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DetailController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data=request.getParameter("num");
			String reco=request.getParameter("reco");

			DBSQL_re dbsql=new DBSQL_re();
			DBbean_re aa=dbsql.boardDetail(data, reco);

			DBSQL_co dbsql2=new DBSQL_co();
			List bb=dbsql2.coSelect(data);	
						
			request.setAttribute("detail", aa);
			request.setAttribute("colist", bb);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=guest/m_guest&list=G_guestDetail");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("목록보기실패"+ex.toString());  }  
	}//user END
}//class END
