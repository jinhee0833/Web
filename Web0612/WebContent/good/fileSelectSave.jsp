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
		ServletContext ct =null; 
			ct =this.getServletContext();
		String path = ct.getRealPath("good");
		DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = null;
		//MultipartRequest(1request,2경로,3크기,4인코딩,5중복여부);
		mr = new MultipartRequest(request,path,size,"EUC-KR",drp);
		
		String data1 = mr.getParameter("sabun") ;
		String data2 = mr.getParameter("name");
		String data3 = mr.getFilesystemName("file1");
		
		
		
	%>

<body>
	<font size=6><b> [fileSelectSave.jsp=단독실행X] </b></font><p>
	넘어온사번: <%= data1 %><br>
	넘어온이름: <%= data2 %><br>
	넘어온파일: <%= data3 %><br>
	
	<br>
	<b><%= path %></b><br>
	<!--  
	<img src="<%= path + "/"+ data3%>"><br>
	-->
	
	
	<font size=7>
		<a href="fileSelect.jsp">[파일업로드등록화면fileSelect.jsp]</a>&nbsp;&nbsp;
		<a href="fileDownload.jsp?file_name=<%=data3%>"><img src="<%=request.getContextPath()%>/good/<%=data3%>" border=0 width=200 height=250></a>
	</font>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










