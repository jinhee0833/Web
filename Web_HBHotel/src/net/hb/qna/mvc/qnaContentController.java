package net.hb.qna.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.*;

import java.util.List;

public class qnaContentController extends HttpServlet {
	
	private int pageSize=5;

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}//end
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try{
			DBSQL dbsql = new DBSQL();
			DBqnabean dbbean = new DBqnabean();
			
			String num = request.getParameter("num");
			if (num==null || num.trim().equals("")){
				response.sendRedirect("qnalist.do");
				return;
			}
			dbbean = dbsql.getBoard(num, "content");
			
			int recount = dbsql.getReCount(num);
			
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.trim().equals("") || pageNum.equals("null")){
				pageNum = "1";}
			
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1; 
			int endRow = startRow + (pageSize-1);
			int count = dbsql.getReCount(); 
			int number = count - startRow + 1; 
			if (endRow>=count) endRow = count;	
			List<DBRebean> list = dbsql.listReBoard(num, startRow, endRow);
			
			String pageFile = "board2/content2.jsp";
			
		    request.setAttribute("dbbean", dbbean);
		    request.setAttribute("num", num);
		    request.setAttribute("recount", recount);
		    request.setAttribute("pageFile", pageFile);
		    request.setAttribute("list", list);
		    request.setAttribute("currentPage", currentPage);
		    request.setAttribute("pageSize", pageSize);
		    request.setAttribute("startRow", startRow);
		    request.setAttribute("endRow", endRow);
		    request.setAttribute("count", count);
		    request.setAttribute("number", number);
		    
		    RequestDispatcher dis = request.getRequestDispatcher("/qna.jsp");
		    dis.forward(request, response);
		    
		}catch(Exception ex){  }
	}//end
}//class end