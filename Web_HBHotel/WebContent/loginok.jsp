<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title>[로그인 성공화면]</title>
</head>
<%
	int success=Integer.parseInt(request.getParameter("success"));
	String loginid=request.getParameter("loginid");
	if(success==1){
		session.setAttribute("loginId", loginid);
		response.sendRedirect("layout.jsp");
	}else{%>
		<script> alert("입력하신 정보가 올바르지 않습니다. 다시 입력해주십시오.");	location="login.jsp"; </script>
		<%
	}
%>
<body>
	<div class="facility">
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >LOGIN</div>
		<div id = "m"></div>
	</div>
</body>
</html>

