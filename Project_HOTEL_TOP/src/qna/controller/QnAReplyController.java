package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.dao.QnADAO;
import qna.vo.QnAVO;

public class QnAReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public QnAReplyController() {super();}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		String dt1 = request.getParameter("num");
		String dt2 = request.getParameter("reply");
		
		dao.dbReply(dt1, dt2);
		vo = dao.dbDetail(dt1);
		
		request.setAttribute("vo", vo);
		RequestDispatcher dis = request.getRequestDispatcher("qnadetail?num="+dt1);
		dis.forward(request,response);
	}
}
