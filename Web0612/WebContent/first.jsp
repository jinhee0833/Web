<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>[first.jsp]</title>
</head>
<body>

	<%!
		private int sabun;
		private String name;
	%>
	<%
		try{
			sabun=2234;
			name="Gil Dong";
			out.println(sabun+"<br>");
			out.println(name+"<br>");
		}catch(Exception ex){}
	%>
	<br>
	사번 : <%= sabun %><br>
	이름 : <%= name %><br>
	
</body>
</html>