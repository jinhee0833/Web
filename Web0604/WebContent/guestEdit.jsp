<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestEdit]</title>
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
	<font size=7><b> [guestEdit.jsp=�ܵ�����X] </b></font><p>
	<form method="get" action="edit.do">
		<b>�������:</b> 	
			<input type="text" name="sabun" value="<%= request.getParameter("idx") %>" readonly="readonly"> <br>
		<b>�����̸�:</b> 
		    <input type="text" name="name"   value="<%= request.getParameter("idx2")%>"> <br>
		<b>��������:</b> 
		    <input type="text" name="title"  value="<%= request.getParameter("idx3")%>"> <br>
		<b>�����޿�:</b> 
		    <input type="text" name="pay"  value="<%= request.getParameter("idx4")%>"> <p>
		    <input type="submit"  value="MVC2����Ÿ����"> &nbsp;
		    <input type="reset"   value="�������">
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










