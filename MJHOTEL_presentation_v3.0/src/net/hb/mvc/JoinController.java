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

public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinController() {super();}

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
			String data2= request.getParameter("password1");
			String data3= request.getParameter("name");
			String data4= request.getParameter("gender");
			String data_yy= request.getParameter("year");
			String data_mm= request.getParameter("month");
			String data_dd= request.getParameter("day");
			String data5= request.getParameter("email");
			String data6= request.getParameter("tel");
			String data7= request.getParameter("mem"); //1�̸� ����YES
			String data8= request.getParameter("addr");
			
			String birth=data_yy.substring(2)+"/"+data_mm+"/"+data_dd;
			
			//out.println("<font size=6><b>�Ѿ�� ���̵� = " + data1+"</b></font><p>");
			//out.println("<font size=6><b>�Ѿ�� ���= " + data2+"</b></font><p>");
			//out.println("<font size=6><b>�Ѿ�� ����= " + data4+"</b></font><p>");
			
			DBSQL dbsql=new DBSQL();
			DBbean bean=new DBbean();
			bean.setId(data1);
			bean.setPw(data2);
			bean.setName(data3);
			bean.setGender(data4);
			bean.setBirth(birth);
			bean.setEmail(data5);
			bean.setTel(data6);
			bean.setMem(data7);
			bean.setAddr(data8);
			
			int ok=dbsql.dbInsert(bean);
			if(ok>0){
				System.out.println("DB�� ȸ������Ϸ�");
				response.sendRedirect("success_join.jsp");
			}
	
		}catch(Exception ex){	System.out.println("���Խ���");	}
	} //end
} //class end
