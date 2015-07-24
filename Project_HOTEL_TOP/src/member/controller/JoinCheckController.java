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
		//한글 깨짐 방지
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=EUC-KR");
		System.out.println("\nJoingCheckController");
		//join.jsp에서 idcheck()함수에서 "id"값 가져오기
		String id = request.getParameter("id");
		String noti = "";
		//DBSQL idCheck()함수에서 아이디 체크, 체크 후 join.jsp로 값 넘기기
		DBbean bean = new DBbean();
		DBSQL dbsql = new DBSQL();
		bean.setId(id);
		int idcnt = dbsql.dbIdcheck(id);
		if(idcnt > 0){noti = "이미 사용 중인 ID입니다.";}
		else{
			if(id.equals("") || id.equals(null)){noti = "ID를 입력하십시오.";}
			else if(id.length()<4 || id.length()>16){noti = "ID는 4~16자리입니다.";}
			else{
				for(int i=0; i<id.length(); i++){
					char idcheck = id.charAt(i);
					if((idcheck<48 || idcheck>57) && (idcheck<65 || idcheck>90) &&(idcheck<97 || idcheck>122)){
						noti = "영문, 숫자만 사용 가능합니다.";
					}else{
						noti = "사용 가능한 ID입니다.";
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
