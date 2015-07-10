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
	private  Connection CN = null ; //DB서버정보기억 , 명령어생성할때 참조
	private  Statement  ST = null ; //정적인 명령어 select , insert
	private  PreparedStatement  PST = null ; //미리컴파일하는 명령어 insert,update
	private  ResultSet  RS = null ; //select조회한결과값 기억
	private String sql = null ; //쿼리문기억
	
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
	out.println("<h1><center><font size=7 color=green>[SessionLogin.java문서]</font></h1>") ;
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
				 ses.setAttribute("naver", send); //세션설정 
				 out.println("<font size=7><b> <a href='photo.do'> [Photo Show] </a></b></font>") ;
				 out.println("<br><p><img src='./images/bar.gif'><br>") ;
			 } 
		}

	 
	 if(!flag) {
		out.println("<font size=7><b> 세션값이 없는 유저입니다 </b></font><br>") ;
	  out.println("<a href='login.jsp'> <font size=7><b> [login.jsp] </b></font></a>") ;
	  out.println("<a href='template.jsp'> <font size=7><b> [template.jsp] </b></font> </center></a>") ;
	 }
 }catch(Exception ex) { }
} //user(1,2) end

} //class END



