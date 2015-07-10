<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestSave2복사본]</title>
	<style type="text/css">
		b,input{ font-size:20pt; font-weight:bold; }
		a{ font-size:26pt; font-weight:bold;  text-decoration:none; }
		a:hover{ font-size:32pt; font-weight:bold;  color:blue; }
	</style>
</head>
<%!
private  Connection CN; //DB서버, id, pass / 명령생성할때 참조
private  Statement ST; //delete,select쿼리문 정적명령어
private  PreparedStatement PST; //insert,update컴파일된명령어
private  ResultSet RS; //RS=ST.executeQuery("select쿼리문")
	
private  int Gsabun;
private  String Gname;
private  String sql="insert,update,delete,select";
private  int total=0; //레코드갯수
%>

<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");//오라클서버 드라이브 로드 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN = DriverManager.getConnection(url,"system","oracle");
	out.println("<h1> DB서버연결성공 DB서버연결성공 </h1>");
}catch(Exception ex){
	System.out.println("실패:" + ex.toString());
	out.println("<h1>실패:" + ex.toString() +"</h1>");
}
%>

<body>
	<font size=7><b> [guestSave2.jsp=복사본] </b></font><p>
	<img src="images/bar.gif"><p>
<%
	 int dt1 = Integer.parseInt(request.getParameter("sabun"));
	 String dt2 =  request.getParameter("name");
	 String dt3 =  request.getParameter("title");
	 int dt4 =Integer.parseInt(request.getParameter("pay"));
	 out.println("<b>넘어온사번=" +  dt1 + "</b><br>");
	 out.println("<b>넘어온이름=" +  dt2 + "</b><br>");
	 out.println("<b>넘어온제목=" +  dt3 + "</b><br>");
	 out.println("<b>넘어온급여=" +  dt4 + "</b><p>");
     //SQL언어에서 문자열표시 싱글로 표시 'hong' 
 
 //433페이지 코드처럼 기술해서 저장처리
 sql="insert into guest values(" + dt1 + ", '" + dt2 + "', '" + dt3 + "', sysdate, " +  dt4 +")"  ;   
 out.println("<h2>" + sql + "</h2>"); 
 
 try{
	ST = CN.createStatement();
	int OK = ST.executeUpdate(sql);//진짜실행되는 메소드=함수
	if(OK>0){  
		out.println("<h1>저장성공 저장성공 저장성공 </h1>");
		response.sendRedirect("guestList.jsp");
	}
 }catch(Exception ex){ 
	 out.println("<h2>저장실패: " + ex + "</h2>");  
 }
%>

	<p>
	<h1>
		<a href="guest.jsp">[등록화면]</a>
		<a href="guestList.jsp">[전체출력]</a>
		<a href="guestDelete.jsp">[데이타삭제]</a>
	</h1>
	
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>









