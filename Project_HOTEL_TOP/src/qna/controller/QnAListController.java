package qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qna.dao.QnADAO;
import qna.vo.QnAVO;

public class QnAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnAListController() { super(); }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {user(request, response);}
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		QnADAO dao = new QnADAO();
		QnAVO vo = new QnAVO();
		String keyType = request.getParameter("keytype")==null ? "" : request.getParameter("keytype"); 
		int pageNum = request.getParameter("pagenum")==null ? 1 : Integer.parseInt(request.getParameter("pagenum")); 
		int totalRecordNum = dao.dbCount(keyType);
		int pageSize = 5;
		int pageRecordNum = 5;
		int totalPage = totalRecordNum%pageRecordNum==0 ? totalRecordNum/pageRecordNum : totalRecordNum/pageRecordNum+1;  
		int startPage = pageNum - ((pageNum-1)%pageSize);
		int start = (pageNum-1)*pageRecordNum+1;
		int end = pageNum*pageRecordNum;
		
		System.out.println("keyType:"+keyType);
		System.out.println("pagenum:"+pageNum);
		
		/* 임시 세션 삭제 */
		HttpSession session = request.getSession();		session.setAttribute("user", "admin");;
		
		List<QnAVO> list = dao.dbList(keyType, pageNum, start, end);
		request.setAttribute("list", list);
		request.setAttribute("keytype", keyType);
		request.setAttribute("pagenum", pageNum);
		request.setAttribute("pagesize", pageSize);
		request.setAttribute("startpage", startPage);
		request.setAttribute("totalpage", totalPage);
		/* 추가 */
		request.setAttribute("pageFile", "board/qna/qnalist.jsp");
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request,response);
	}
}
