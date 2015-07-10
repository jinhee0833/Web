<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestDelete]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
<body>
	<font size=6 color=red> [guestDelete.jsp] </font><p>
	<form method="get" action="delete.do">
		<b>삭제할사번:</b> 
		<input type="text" name="sabun"> 
		<input type="submit"  value="데이타삭제"> &nbsp;
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[등록화면]</a>
		<a href="list.do">[전체출력]</a>
		<a href="guestDelete.jsp">[데이타삭제]</a>

	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










