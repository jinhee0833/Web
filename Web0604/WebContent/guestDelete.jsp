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
		<b>�����һ��:</b> 
		<input type="text" name="sabun"> 
		<input type="submit"  value="����Ÿ����"> &nbsp;
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[���ȭ��]</a>
		<a href="list.do">[��ü���]</a>
		<a href="guestDelete.jsp">[����Ÿ����]</a>

	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










