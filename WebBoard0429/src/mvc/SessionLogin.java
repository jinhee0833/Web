package mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;  //PrintWriter
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;  //List, ArrayList
import javax.servlet.http.*; //HttpSession

public class SessionLogin extends HttpServlet {  
	private static final long serialVersionUID = 1L;
	private  Connection CN = null ; //DB����������� , ��ɾ�����Ҷ� ����
	private  Statement  ST = null ; //������ ��ɾ� select , insert
	private  PreparedStatement  PST = null ; //�̸��������ϴ� ��ɾ� insert,update
	private  ResultSet  RS = null ; //select��ȸ�Ѱ���� ���
	private String sql = null ; //���������
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user( request, response) ;
	} //end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user( request, response) ;
	} //end
	
protected void  user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setCharacterEncoding("EUC-KR") ;
	response.setContentType("text/html;charset=EUC-KR");
	PrintWriter  out = response.getWriter() ;
	out.println("<h1><center><font size=7 color=green>[SessionLogin.java����]</font></h1>") ;
	out.println("<img src='./images/bbb.gif'>") ; 	out.println("<img src='./images/bbb.gif'>") ; 
	out.println("<img src='./images/bbb.gif'>") ;	  out.println("<img src='./images/bbb.gif'><br><p>") ; 
	
	int data1 = Integer.parseInt(request.getParameter("sabun")) ;
	String data2 = request.getParameter("name") ;
	boolean flag=false;
 try{
		 if(data1==1200){
			 if(data2.equals("blue")) {
				 flag=true;
				 HttpSession  ses = request.getSession() ;
				 String send = String.valueOf(data1) ;
				 ses.setAttribute("naver", send); //���Ǽ��� 
				 out.println("<font size=7><b> <a href='photo.do'> [Photo Show] </a></b></font>") ;
				 out.println("<br><p><img src='./images/bar.gif'><br>") ;
			 } 
		}

	 
	 if(!flag) {
		out.println("<font size=7><b> ���ǰ��� ���� �����Դϴ� </b></font><br>") ;
	  out.println("<a href='login.jsp'> <font size=7><b> [login.jsp] </b></font></a>") ;
	  out.println("<a href='template.jsp'> <font size=7><b> [template.jsp] </b></font> </center></a>") ;
	 }
 }catch(Exception ex) { }
} //user(1,2) end

} //class END



