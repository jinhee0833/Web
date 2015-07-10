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


public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditController() { super();  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditController, mothod=GET");
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
			
			String data1= request.getParameter("addr");
			String data2= request.getParameter("email");
			String data3= request.getParameter("tel");
			String data4= request.getParameter("mem"); 
			String data5= request.getParameter("id");
			//String data6= request.getParameter("pw"); 
			
			System.out.println(data1+"\t"+data2+"\t"+data3+"\t"+data4+"\t"+data5);
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			bean.setAddr(data1);
			bean.setEmail(data2);
			bean.setTel(data3);
			bean.setMem(data4);
			//bean.setId(data5);
			//bean.setPw(data6);
			
			int ok=dbsql.memberEdit(bean, data5);
			if(ok>0){ System.out.println("수정 성공"); }
			DBbean aa=dbsql.memberDetail(request.getParameter("id"));
			request.setAttribute("detail", aa);
			
			RequestDispatcher dis=request.getRequestDispatcher("./memberDetail.do");
			dis.forward(request, response);
					
		}catch(Exception ex){  System.out.println("수정페이지 실패"+ex.toString());  }  
	}//user END
}//class END
