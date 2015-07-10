package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import WebKakao_PJ.db.Join_sql;


public class Join_userid_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doUserIDCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String user_id = request.getParameter("user_id");

		String result = "";
		
		Join_sql js = new Join_sql();
		
		result = js.JoinUserIDCheck(user_id);
		result = "{ result : " + result + " ";
		out.print(result);
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUserIDCheck(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doUserIDCheck(request, response);
	}

}
