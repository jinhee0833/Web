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

public class ListEditController extends HttpServlet {
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
		System.out.println("\nListEditController.java");
		try{
			String id = request.getParameter("id");
			System.out.println("id = " + id);
			DBSQL dbsql = new DBSQL();
			DBbean bean = new DBbean();
			String pw = request.getParameter("pwd1");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String mem = request.getParameter("mem");
			System.out.println(pw + " " + name + " " + addr + " " + email + " " + tel + " " + mem);
			bean.setPw(pw);
			bean.setName(name);
			bean.setAddr(addr);
			bean.setEmail(email);
			bean.setTel(tel);
			bean.setMem(mem);
			int edit = dbsql.dbEdit(bean, id);
			System.out.println("edit = " + edit);
			
			bean = dbsql.dbDetail(id);		
			request.setAttribute("detail", bean);
			
			
			request.setAttribute("pageFile", "member/memberDetailAction.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
//			if(edit > -1){
//				System.out.println("\nȸ�� ���� ���� �Ϸ�!");
//				DBbean detail = dbsql.dbDetail(request.getParameter("id"));
//				request.setAttribute("detail", detail);
//				RequestDispatcher dis=request.getRequestDispatcher("detail.do");
//				dis.forward(request, response);
//			}else{System.out.println("\nȸ�� ���� ���� ����!");}
		}catch(Exception ex){} 
	}//end
}//Class END

