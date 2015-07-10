package guest.mvc;

import guest.common.DBSQL_co;
import guest.common.DBSQL_re;
import guest.common.DBbean_re;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class G_InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public G_InsertController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController, mothod=GET");
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewController, mothod=POST");
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		try{
			String data1=request.getParameter("title");
			String data2=request.getParameter("contents");
			String data3=request.getParameter("pwd");
			String data4=request.getParameter("writer");
			System.out.println(data1+", "+data2+", "+data3+", "+data4);
			
			DBSQL_re dbsql=new DBSQL_re();
			DBbean_re bean=new DBbean_re();
			
			bean.setTitle(data1);
			bean.setContents(data2);
			bean.setPwd(data3);
			bean.setWriter(data4);
			
			int ok=dbsql.boardInsert(bean);
			if(ok>0){
				out.println("글 등록완료");
				//String juso1="reviewList";
				//request.setAttribute("list", juso1);
				response.sendRedirect("./G_guest.do");
			}//if END
			
		}catch(Exception ex){  System.out.println("글 등록실패");  }  
	}//user END
}//class END
