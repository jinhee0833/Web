package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.DBSQL;

public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql;
	private String returnPage;

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
		System.out.println("\nListController.java");
		//memberList.jsp���� �Ѿ�� pageNUM��, keyfield��, keyword�� ��������
		String pnum = request.getParameter("pageNUM");
		String skey = request.getParameter("keyfield");
		String sval = request.getParameter("keyword");
		System.out.println("pageNUM: " + pnum + "keyfield: " + skey + "keyword: " + sval);
		if(sval==null || skey==null){
			sql = "where name like '%%'";
			returnPage = "";
		}else{
			sql = "where " + skey + " like '%" + sval + "%'";
			returnPage = "&keyfield=" + skey + "&keyword=" + sval;
		}
		//DBSQL�� �����Ͽ� ȸ�� ��� �������� �� �� �����ϰ� ������
		try{
			DBSQL dbsql = new DBSQL();
			List list = dbsql.dbSelect(pnum, sql);
			int total = dbsql.dbCount(sql);
			request.setAttribute("list", list);
			request.setAttribute("total", total);
			request.setAttribute("returnPage", returnPage);
			request.setAttribute("pageFile", "member/memberList.jsp");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}catch(Exception ex){ex.toString();}
	}//end
}//Class END
