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

public class JoinCheckController extends HttpServlet {
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
		System.out.println("\nJoingCheckController");
		//join.jsp���� idcheck()�Լ����� "id"�� ��������
		String id = request.getParameter("id");
		String noti = "";
		//DBSQL idCheck()�Լ����� ���̵� üũ, üũ �� join.jsp�� �� �ѱ��
		DBbean bean = new DBbean();
		DBSQL dbsql = new DBSQL();
		bean.setId(id);
		int idcnt = dbsql.dbIdcheck(id);
		if(idcnt > 0){noti = "�̹� ��� ���� ID�Դϴ�.";}
		else{
			if(id.equals("") || id.equals(null)){noti = "ID�� �Է��Ͻʽÿ�.";}
			else if(id.length()<4 || id.length()>16){noti = "ID�� 4~16�ڸ��Դϴ�.";}
			else{
				for(int i=0; i<id.length(); i++){
					char idcheck = id.charAt(i);
					if((idcheck<48 || idcheck>57) && (idcheck<65 || idcheck>90) &&(idcheck<97 || idcheck>122)){
						noti = "����, ���ڸ� ��� �����մϴ�.";
					}else{
						noti = "��� ������ ID�Դϴ�.";
						String idval = id;
						request.setAttribute("idcheck", idval);
					}
				}
			}
		}
		request.setAttribute("condition", noti);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=join");
		dis.forward(request, response);
	}//end
}//class END
