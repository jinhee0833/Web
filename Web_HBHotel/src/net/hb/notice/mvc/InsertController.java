package net.hb.notice.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.hb.common.DBNoticeBean;
import net.hb.common.DBSQL;

@WebServlet("/InsertController")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String path = "";

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
	}

	private void user(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		try {
			MultipartRequest mr = null;
			path = this.getServletContext().getRealPath("rain");
			mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());

			String filename = mr.getFilesystemName("filename");
			String writer = mr.getParameter("writer");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");

			content = content.replaceAll("\n", "<br>");

			DBSQL dbsql = new DBSQL();
			DBNoticeBean bean = new DBNoticeBean();

			bean.setFilename(filename);
			bean.setContent(content);
			bean.setTitle(title);
			bean.setWriter(writer);

			dbsql.noticeInsert(bean);
			response.sendRedirect("noticeList.do");
		} catch (Exception ex) {
			System.out.println("InsertController===" + ex.toString());
		}
	}

}
