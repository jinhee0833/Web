<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.common.DBbean" %>
<html>
<head>
<title>memberInfo</title>
<link rel="stylesheet" type="text/css" href="member/css/member.css">
</head>
<body>
<%
	try {
		String id = (String)session.getAttribute("NowUser");
%>
<div id="member_center2">

	<a href="memberDetail.do?id=<%=id %>"><input type=button value="내정보 확인하기" class=member_bt3></a>
</div>
<%		
	} catch (Exception ex) { }
%>
</body>
</html>