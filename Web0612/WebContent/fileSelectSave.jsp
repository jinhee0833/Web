<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

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
		
		int size = 5*1024*1024;
		//String path = application.getRealPath("good");
		ServletContext ct = this.getServletContext();
		String path = ct.getRealPath("");
		DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = null;
		mr = new MultipartRequest(request,path,size,"EUC-KR",drp);
		
		String data1 = mr.getParameter("sabun") ;
		String data2 = mr.getParameter("name");
		String data3 = mr.getFilesystemName("file1");

	%>

<body>
	<font size=6><b> [fileSelectSave.jsp=�ܵ�����X] </b></font><p>
	�Ѿ�»��: <%= data1 %><br>
	�Ѿ���̸�: <%= data2 %><br>
	�Ѿ������: <%= data3 %><br>
	
	<br>
	<b><%= path %></b><br>
	<font size=7>
		<a href="fileSelect.jsp">[���Ͼ��ε���ȭ��fileSelect.jsp]</a>
	</font>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










