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

public class Cmb_UpdateAction extends HttpServlet {
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Cmb_sql cmbsql = new Cmb_sql(); 
		Cmb_bean bean = new Cmb_bean();
		
		String m_content = (String)request.getParameter("m_content");
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));

		int result;
		
		System.out.println(" m_content: "+ m_content);
		System.out.println(" m_idx: "+ m_idx);
		
		bean.setG_idx(m_idx);
		bean.setG_content(m_content);
		//bean.setG_ref(); //ref
	
		result = cmbsql.update(bean);
		System.out.println("result :" +result);
		//
		if(result>0){
			RequestDispatcher dispatcher= request.getRequestDispatcher("cmb_list.jsp");
			dispatcher.forward(request, response);
		}
	}//end

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

}
