<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<html>
<head>
<title>[로그아웃]</title>
</head>
	<%
		session.invalidate();
		response.sendRedirect("layout.jsp");
	%>
</html>

