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

public class QnAInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnAInsertController() { super(); }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		
		String dt1 = request.getParameter("type");
		String dt2 = request.getParameter("title");
		String dt3 = request.getParameter("name");
		String dt4 = request.getParameter("content");
		int dt5 = 1;
		try{
			Integer.parseInt(request.getParameter("secret"));
		}catch(Exception e){e.toString(); dt5=0;}
				
		System.out.println(dt1 + ", " + dt2 + ", " + dt3 + ", " + dt4 + ", " + dt5);
		vo.setType(dt1);
		vo.setTitle(dt2);
		vo.setName(dt3);
		vo.setContent(dt4);
		vo.setSecret(dt5);
		
		dao.dbInsert(vo);
		RequestDispatcher rd = request.getRequestDispatcher("qnalist");
		rd.forward(request, response);
	}
}
