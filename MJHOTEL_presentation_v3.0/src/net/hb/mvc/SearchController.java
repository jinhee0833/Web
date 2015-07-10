package net.hb.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.hb.common.DB;
import net.hb.common.DBSQL;
import net.hb.common.DBbean;

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchController() {super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doGet(request, response)ȣ��");	
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request, response);
		System.out.println("doPost(request, response)ȣ��");
	} //end
	
	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		try{
			String data1= request.getParameter("id");
			String cc = "";
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			bean.setId(data1);
				
				int ok=dbsql.checkID(data1);
				if(ok>0){cc="���̵� �ߺ��Դϴ�";}
				else{	
					if(data1.equals("")){
						cc="�����Դϴ�.";
					}
					else if( data1.length()<4 || data1.length()>12){
						cc="���̵�� 4~12�ڸ��Դϴ�";
					}else if(data1.length()>=4 || data1.length()<=12){
						for(int i = 0; i<data1.length(); i++){
							char check = data1.charAt(i);
							if((check< 48 || check > 57) && (check< 97 || check > 112) && (check< 65 || check > 90)){
								cc="����, ���ڸ� �Է°����մϴ�.";
							}else{
								cc="��밡���� ���̵��Դϴ�";	String dd=data1;  request.setAttribute("gg", dd);
							}
						}
					}
				
				}
			
			request.setAttribute("idid", cc);
			RequestDispatcher dis=request.getRequestDispatcher("join.jsp");
			dis.forward(request, response);
			
		}catch(Exception ex){	System.out.println("���Խ���");	}
	} //end
} //class end
