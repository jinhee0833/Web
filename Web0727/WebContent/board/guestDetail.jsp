<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table border=1 align="center" width=650 >
		<tr>
			<td colspan="5"> <img src="images/bar.gif"></td>
		</tr>
		<tr bgcolor="yellow">
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
		</tr>
		<tr>	
			<td>${bean.sabun}</td>
			<td>${bean.name}</td>
			<td>${bean.title}</a></td>
	
			<td width=100><fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/></td>
			<td>${bean.pay}</td>	
			
		</tr>
		</table>
	<a href="guest.do">처음으로</a>
	
	</div>
</body>
</html>