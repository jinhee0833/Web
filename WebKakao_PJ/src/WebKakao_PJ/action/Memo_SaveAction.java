package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WebKakao_PJ.db.*;

public class Memo_SaveAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String memo_user_id = (String)session.getAttribute("user_id");
		String memo_content = request.getParameter("memo_content");

		MemoBean mb = new MemoBean();
		Memo_sql memosql = new Memo_sql();
		
		mb.setUser_id(memo_user_id);
		mb.setContent(memo_content);
		memosql.Savememo(mb);
		
		out.print("<script> alert('메모가 성공적으로 저장되었습니다'); </script>");
		out.print("<script> document.location.href='Story_List1.jsp'; </script>");
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLogin(request, response);
	}

}
