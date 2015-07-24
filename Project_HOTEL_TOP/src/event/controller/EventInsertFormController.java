package event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/e_insertform")
public class EventInsertFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EventInsertFormController() {super();}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pageFile", "board/event/event7Insert.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
}
