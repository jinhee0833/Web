package net.hb.notice.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.common.DBSQL;

public class deleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void user(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {

			int del = Integer.parseInt(request.getParameter("del"));

			DBSQL dbsql = new DBSQL();
			dbsql.noticeDelete(del);
			response.sendRedirect("noticeList.do");

		} catch (Exception ex) {
			System.out.println("deleteContoller===" + ex.toString());
		}

	}

}
