package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WebKakao_PJ.db.Cmb_bean;
import WebKakao_PJ.db.Cmb_sql;

public class Cmb_DeleteAction extends HttpServlet {
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		HttpSession session = request.getSession();
		//PrintWriter out = response.getWriter();
		Cmb_sql cmbsql = new Cmb_sql(); 

		int g_idx = Integer.parseInt(request.getParameter("g_idx"));
		System.out.println("   g_idx : " + g_idx +"   ");
	
		cmbsql.delete(g_idx);

		//삭제 후 리스트 출력
		RequestDispatcher dispatcher= request.getRequestDispatcher("cmb_list.jsp");
		dispatcher.forward(request, response);
			
	}//doUser end

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
