<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestEditSave]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<%!
private  Connection CN; //DB서버, id, pass / 명령생성할때 참조
private  Statement ST; //select쿼리문 정적명령어
private  PreparedStatement PST; //insert,update, delete컴파일된명령어
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
	<font size=7><b> [guestEditSave.jsp=단독실행금지] </b></font><p>
<%
	 int dt1 = Integer.parseInt(request.getParameter("sabun"));
	 String dt2 =  request.getParameter("name");
	 String dt3 =  request.getParameter("title");
	 int dt4 =Integer.parseInt(request.getParameter("pay"));
	 out.println("<b>수정될사번=" +  dt1 + "</b><br>");
	 out.println("<b>수정될이름=" +  dt2 + "</b><br>");
	 out.println("<b>수정될제목=" +  dt3 + "</b><br>");
	 out.println("<b>수정될급여=" +  dt4 + "</b><p>");
  
 try{
  sql="update guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?" ;
  //sql="~~?, title=?, nalja=sysdate, pay=? where sabun=?" ;
  PST = CN.prepareStatement(sql);
  	PST.setString(1, dt2);
  	PST.setString(2, dt3);
  	PST.setInt(3, dt4);
  	PST.setInt(4, dt1);
  PST.executeUpdate();//진짜 수정처리
  response.sendRedirect("guestList.jsp");
 }catch(Exception ex){ 
	 System.out.println("<h1>PST수정실패: " + ex + "</h1>");  
 }
%>

	<p><h1>
		<a href="guest.jsp">[등록화면]</a>
		<a href="guestList.jsp">[전체출력]</a>
		<a href="guestDelete.jsp">[데이타삭제]</a>
	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>









