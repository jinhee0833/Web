package WebKakao_PJ.action;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import WebKakao_PJ.db.*;


public class Msg_InsertAction extends HttpServlet {
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		Msg_sql m_sql = new Msg_sql();
		Msg_bean m_bean = new Msg_bean();
		HttpSession session = request.getSession();
		
		String msg_sendID = (String) session.getAttribute("user_id");
		String msg_receiveID = request.getParameter("re");
		String msg_content = request.getParameter("content");
		
		
		m_bean.setMsg_sendID(msg_sendID);
		m_bean.setMsg_receiveID(msg_receiveID);
		m_bean.setMsg_content(msg_content);
	
				
		int OK = m_sql.Msg_InsertAction(m_bean);
		
		if(OK > 0 ){
			out.println("<script> alert('쪽지를 전송하였습니다♥'); window.close(); </script>");
		}else{
			out.println("<script>");
			out.println("alert ('전송실패');");
			out.println("</script>");
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
