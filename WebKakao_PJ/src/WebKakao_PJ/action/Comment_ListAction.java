package WebKakao_PJ.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WebKakao_PJ.db.*;



public class Comment_ListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr") ;
		response.setContentType("text/html;charset=euc-kr") ;
		
		HttpSession session = request.getSession();
	
		Comment_SQL  comsql =  new Comment_SQL( ) ;
		Comment_Bean combean = new Comment_Bean();
		List c_list = comsql.getCommentList( );
	
		request.setAttribute("comment_list" ,c_list) ;  //396페이지 90라인 
		RequestDispatcher  dis =request.getRequestDispatcher("kakao_board_comment.jsp") ; 
		dis.forward(request,response) ; 

   
       
	} //end
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response) ;
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response) ;
	} //end
} //class END
