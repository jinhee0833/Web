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
import javax.servlet.http.HttpSession;

import member.vo.DBbean;
import member.dao.DBSQL;

public class ListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ� ���� ����
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/xml;charset=EUC-KR");
		System.out.println("\nListDetailController.java");
		try{
			String id = request.getParameter("id");
			System.out.println("id = " + id);
			DBSQL dbsql = new DBSQL();
			DBbean bean = dbsql.dbDetail(id);		
			request.setAttribute("detail", bean);
			
			request.setAttribute("pageFile", "member/memberDetail.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){} 
	
		
	}//end
}//Class END
