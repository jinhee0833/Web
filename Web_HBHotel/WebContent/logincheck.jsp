<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title>[로그인 체크화면]</title>
</head>
<style type="text/css">
			
	.facility{margin:0px; padding:0px; height:900px;
		background-color:#ffffff;}
	
	#f{
			position: absolute;
			margin-left: 200px; 
			top: 230px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
	#m{
		position: absolute;
		margin-left: 500px; 
		top: 230px;
		width: 900px;
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		color:#81725F;
		}
</style>
<%!
	private Connection CN;//DB서버정보 기억, 명령어 생성
	private Statement ST;//정적인 명령어 ST=CN.createStatement()
	private PreparedStatement PST;//insert,update
	private ResultSet RS; //RS=ST.executeQuery(sql);
	private String sql;//쿼리문 기억
	
	
%>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system","oracle");
}catch(Exception e){System.out.println(e.toString());}
%>
<%
try{
	sql="select * from member where userid=? and pwd=?";
	PST=CN.prepareStatement(sql);
	 PST.setString(1, request.getParameter("id"));
	 PST.setString(2, request.getParameter("pw"));
	 
	int ok=PST.executeUpdate();
	if(ok>0){
	session.setAttribute("loginId", request.getParameter("id"));%>
	<script>
	location="loginok.jsp";
	</script>
	<%}else{%>
	
	<script>
		alert("로그인 실패");
		location="login.jsp";
	</script>
	
	<%
	}
}catch(Exception e){System.out.println(e.toString());}
%>
	
</html>

