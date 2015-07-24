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

public class QnADetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public QnADetailController() { super(); }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		String url, dt1;
		if(request.getParameter("num")!=null){
			url = "board/qna/qnadetail.jsp";
			dt1 = request.getParameter("num");
		}else{
			url = "board/qna/qnaedit.jsp";
			dt1 = request.getParameter("editnum");
		}
		vo = dao.dbDetail(dt1);
		
		request.setAttribute("vo", vo);
		request.setAttribute("pageFile", url);
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request,response);
	}
}
