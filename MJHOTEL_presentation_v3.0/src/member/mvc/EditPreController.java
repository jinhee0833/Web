package member.mvc;

import member.common.DBSQL;
import member.common.DBbean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditPreController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditPreController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditPreController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data= request.getParameter("id");
			
			DBSQL dbsql=new DBSQL();
			DBbean pre=dbsql.memberDetail(data);
			
			request.setAttribute("detail", pre);
			
			RequestDispatcher dis=request.getRequestDispatcher("./index.jsp?page=member/m_member&list=memberEdit");
			dis.forward(request, response);
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());  }  
	}//user END
}//class END
