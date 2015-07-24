package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.DBSQL;
import member.vo.DBbean;
import member.vo.ZIPbean;

public class ZipcodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println("\nZipcodeController");
		//zipcheck.jsp에서 addr값을 받고 dbGetaddr()함수에서 실행
		try{
			String search = request.getParameter("addrs");
			DBSQL dbsql = new DBSQL();
			List<ZIPbean> list = dbsql.dbGetaddr(search);
			RequestDispatcher dis = request.getRequestDispatcher("member/zipcheck.jsp");
			dis.forward(request, response);
		}catch(Exception ex){}
	}//end
}//class END
