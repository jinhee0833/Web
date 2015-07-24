package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public QnAFormController() {super();}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request,response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request,response);}

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageFile", "board/qna/qnaform.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
}
