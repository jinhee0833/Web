<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guest]</title>
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
	<font size=7><b> [guest.jsp] </b></font><p>
	<form method="get" action="insert.do">
		<b>���:</b> <input type="text" name="sabun"> <br>
		<b>�̸�:</b> <input type="text" name="name"> <br>
		<b>����:</b> <input type="text" name="title" value="chicken"> <br>
		<b>�޿�:</b> <input type="text" name="pay" value="27"> <p>
		<input type="submit"  value="MVC2����������"> &nbsp;
		<input type="reset"   value="�Էµ���Ÿ���">
	</form>
	
	<p>
	<h1>
	<a href="guest.jsp">[���ȭ��] </a>
	<a href="list.do">[��ü���] </a>
	<a href="guestDelete.jsp">[����ȭ��] </a>

</h1>
	
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>