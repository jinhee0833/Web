package net.hb.notice.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.hb.common.DBNoticeBean;
import net.hb.common.DBSQL;

public class detailController extends HttpServlet {
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
		request.setCharacterEncoding("UTF-8");

		try {
			int num = Integer.parseInt(request.getParameter("dt1"));
			DBSQL dbsql = new DBSQL();
			DBNoticeBean bean = dbsql.noticeDetail(num);
			request.setAttribute("cont", bean);
			RequestDispatcher disp = request.getRequestDispatcher("noticeDetail.jsp");
			disp.forward(request, response);

		} catch (Exception ex) {
		}

	}
}