<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
 <%
 	String age=request.getParameter("age");
 	String name=(String)request.getAttribute("name");
 %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>[05_forwardResult.jsp]</title>
</head>

<body bgcolor=pink>
	forward ������� �̵��� ������ <br>
	���� : <%=age %>
	�̸� : <%=name %>

</body>
</html>