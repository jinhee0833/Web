<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestSelect]</title>
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
	<font size=7><b> [fileSelect.jsp] </b></font><p>
	<form method="post" action="fileSelectSave.jsp" enctype="multipart/form-data">
		���:<input type="text" name="sabun" value="2234"> <br>
		�̸�:<input type="text" name="name"  value="snow"> <br>
		����:<input type="file" name="file1"  > <p>
		    <input type="submit"  value="���Ͼ��ε�ǽ�"> &nbsp;
		    <input type="reset"   value="���ε����">
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










