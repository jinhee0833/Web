package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.DBSQL;
import member.vo.DBbean;

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�ѱ� ���� ����
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=EUC-KR");
		//join.jsp���� �� input���� value�� ��������
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String birth_yy = request.getParameter("year");
		String birth_mm = request.getParameter("month");
		String birth_dd = request.getParameter("day");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String mem = request.getParameter("mem");
		String birth = birth_yy.substring(2) + "-" + birth_mm + "-" + birth_dd;
		//DBSQL idCheck()�Լ����� ���̵� üũ, üũ �� member/join.jsp�� �� �ѱ��
		DBbean bean = new DBbean();
		DBSQL dbsql = new DBSQL();
		bean.setId(id);
		bean.setPw(pw);
		bean.setName(name);
		bean.setBirth(birth);
		bean.setAddr(addr);
		bean.setEmail(email);
		bean.setTel(tel);
		bean.setMem(mem);
		int join_ch = dbsql.dbInsert(bean);
		if(join_ch > 0){
			System.out.println("\n�ű�ȸ�� DB���� �Ϸ�");
			response.sendRedirect("member/join_success.jsp");
		}
	}
}//class END
