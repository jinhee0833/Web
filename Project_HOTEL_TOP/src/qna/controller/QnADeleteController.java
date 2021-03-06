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

public class QnADeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnADeleteController() { super(); }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request,response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request,response);}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		String dt1 = request.getParameter("num");

		dao.dbDelete(dt1);
		
		request.setAttribute("vo", vo);
		RequestDispatcher dis = request.getRequestDispatcher("qnalist");
		dis.forward(request,response);
	}
}
