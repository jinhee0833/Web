package WebKakao_PJ.action;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import WebKakao_PJ.db.*;

public class Cmb_InsertAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Cmb_sql cmbsql = new Cmb_sql(); 
		Cmb_bean bean = new Cmb_bean();
		String userid = (String)session.getAttribute("user_id");
		String cmt = (String)request.getParameter("cmt");
		int result;
		
		String pub = request.getParameter("public");
		System.out.println(pub);
		bean.setG_name(cmbsql.getUser_Name(userid)); 
		bean.setG_userId(userid);					 
		bean.setG_content(cmt);
		bean.setG_public(pub);
		//bean.setG_ref(); //ref
	//"ÇÑ±Û"
		result = cmbsql.Insert(bean);
		//
		if(result>0){
			//RequestDispatcher dispatcher= request.getRequestDispatcher("cmb_list.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("cmb_list.jsp");
		}
	}//end

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end
}
