<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[fileSelectSave]</title>
	<style type="text/css">
		a{font-size:22pt; text-decoration:none; }
		a:hover{ 
		 	font-size:24pt; color:blue; 
			font-family:Comic Sans MS;
		}
		input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>
	<%
		int  data1 = 1234 ;
		String data2 = "abc";
		String data3 = "aaa.gif";
	%>

<body>
	<font size=6><b> [fileSelectSave.jsp=�ܵ�����X] </b></font><p>
	�Ѿ�»��: <%= data1 %><br>
	�Ѿ���̸�: <%= data2 %><br>
	�Ѿ������: <%= data3 %><br>
	
	<br>
	<font size=7>
		<a href="fileSelect.jsp">[���Ͼ��ε���ȭ��fileSelect.jsp]</a>
	</font>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










