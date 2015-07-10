package net.hb.qna.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;
import net.hb.common.DBqnabean;

import java.util.ArrayList;
import java.util.List;

public class qnaListController extends HttpServlet {
	
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
		PrintWriter out = response.getWriter();
		try{
			DBSQL dbsql = new DBSQL();
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.trim().equals("") || pageNum.equals("null")){
				pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + 4;
			int count = dbsql.getCount(); 
			int number = count - startRow + 1; 
			if (endRow>=count) endRow = count;	
			
			List<DBqnabean> list = dbsql.listBoard(startRow, endRow);
			String pageFile = "/board2/testList.jsp";
		    request.setAttribute("list", list);
		    request.setAttribute("currentPage", currentPage);
		    request.setAttribute("pageSize", pageSize);
		    request.setAttribute("startRow", startRow);
		    request.setAttribute("endRow", endRow);
		    request.setAttribute("count", count);
		    request.setAttribute("number", number);
		    request.setAttribute("pageFile", pageFile);
		    
		    RequestDispatcher dis = request.getRequestDispatcher("/qna.jsp");
		    dis.forward(request, response); 
		}catch(Exception ex){  }
	}//end
}//class end