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
	<%
		String data1 = request.getParameter("dt1");
		String data2 = request.getParameter("dt2");
		String data3 = request.getParameter("dt3");
		String data4 = request.getParameter("dt4");
		System.out.println("guestEdit.jsp����");
		System.out.println("�Ѿ��Gsabun=" + data1 );
		System.out.println("�Ѿ��Gname=" + data2 );
		System.out.println("�Ѿ��Gtitle=" + data3);
		System.out.println("�Ѿ��Gpay=" + data4 + "\n");
	%>

<body>
	<font size=7><b> [guestEdit.jsp=�ܵ�����X] </b></font><p>
	<form method="get" action="guestEditSave.jsp">
		<b>�������:</b> 	
			<input type="text" name="sabun" readonly  value="<%= data1 %>"> <br>
		<b>�����̸�:</b> 
		    <input type="text" name="name"  value="<%= data2 %>"> <br>
		<b>��������:</b> 
		    <input type="text" name="title" value="<%= data3 %>"> <br>
		<b>�����޿�:</b> 
		    <input type="text" name="pay" value="<%= data4 %>"> <p>
		    <input type="submit"  value="����Ÿ����"> &nbsp;
		    <input type="reset"   value="�������">
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[���ȭ��]</a>
		<a href="guestList.jsp">[��ü���]</a>
		<a href="guestDelete.jsp">[����Ÿ����]</a>
	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










