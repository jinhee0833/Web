<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[guestlist.jsp]</title>
<script>
	function move(){
		var a = document.getElementById("search").value;
		var b = document.getElementById("sel").value;
		location.href="search.do?search="+a+"&sel="+b;
	}//end
</script>
</head>
<body>
	
	<div align="center">
	<table border=1 align="center" width=650 >
		<tr>
			<td colspan="5"> <img src="images/bar.gif"></td>
			<td>카운트: ${cnt}</td>
		</tr>
		<tr bgcolor="yellow">
			<td>사번</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>급여</td>
			<td>비고</td>
		</tr>
		<c:forEach var="bean" items="${list}">
		<tr onmouseover="style.background='yellow'"
			onmouseout="style.background=''">
			<td>${bean.sabun}</td>
			<td>${bean.name}</td>
			<td><a href="detail.do?sabun=${bean.sabun}">${bean.title}</a></td>
			<td><fmt:formatDate value="${bean.nalja }"/></td>
			<td>${bean.pay}</td>
			<td><input type="button" value="&nbsp;&nbsp;삭 제&nbsp;&nbsp;" onclick="location.href='delete.do?sabun='+${bean.sabun}">
			
			<input type="button" value="&nbsp;&nbsp;수 정&nbsp;&nbsp;" onclick="location.href='editpre.do?bean=${bean}'"></td>
		</tr>
		</c:forEach>
		<tr >		
			<td colspan=5>
				<select id="sel">
					<option selected="selected" value="sabun">사번</option>
					<option value="name">이름</option>
					<option value="title">제목</option>
				</select>
				<input type="text" id="search"> 
				<input type="button" value="&nbsp;&nbsp;검 색&nbsp;&nbsp;" onclick="move()">
			</td>		
		</tr>
		
		<tr>
			<td colspan="5">
				<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
					 <c:choose>
					 	<c:when test="${i==pageNUM }">
					 		<font color=red size=7>[${i}]</font>
					 	</c:when>
					 	<c:otherwise>
					 		<a href="list.do?pageNUM=${i}">[${i}]</a>
					 	</c:otherwise>
					 </c:choose>
					
				</c:forEach>
			</td>
		</tr>
	</table>
	<a href="guest.do">처음으로</a>	
	</div>
</body>
</html>