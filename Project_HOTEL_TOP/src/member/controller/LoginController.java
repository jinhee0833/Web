package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.DBSQL;

public class LoginController extends HttpServlet {
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
		//login.jsp���� �Ѿ�� id.value���� pw.value�� ��������
		String id = request.getParameter("loginID");
		String pw = request.getParameter("loginPW");
		System.out.println("\nLoginController\nid: " + id + "\tpw: " + pw);
		//DBSQL�� �����Ͽ� ID�� PASSWORD���� ��ġ�ϴ��� Ȯ��(loginCheck(String, String)) �� ���ǿ� �� �����ϱ�
		try{
			DBSQL dbsql = new DBSQL();
			String logincheck = dbsql.loginCheck(id, pw);
			if(logincheck.equals("OK")){
				HttpSession session = request.getSession();
				session.setAttribute("user", id);
				System.out.println(session);
			}
		}catch(Exception ex){ex.toString();}
	}//end
}//Class END
