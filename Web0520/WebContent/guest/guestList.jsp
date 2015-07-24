<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>

<%@ taglib  prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>[guestList.jsp]</title>
	<style type="text/css">
		input, select,option{font-size:16pt; font-weight:bold; font-family:맑은고딕;}
		td{font-size:20pt; font-weight:bold; font-family:맑은고딕;}
		a{text-decoration:none ; font-size:20pt; font-weight:bold; font-family:맑은고딕;}
		a:hover{text-decoration:underline ; color:red; font-size:30pt; font-weight:bold; font-family:맑은고딕;}
	</style>
</head>
<body>
  <font size=7 color=blue><b>  [guestList.jsp=list.do] </b></font><p>
  <table width=800 border=1>
	  	<tr>
	  		<td colspan=5 align="center">
	  			<img src="images/bar.gif">
	  		</td>
	  	</tr>
	  	
		<tr bgcolor="yellow"  height=50>
			<td>사번</td>  <td>이름</td>
			<td>제목</td>  <td>날짜</td>  <td>급여</td>
		</tr>	
		
		<c:forEach var="bean" items="${hb}">
			<tr>
				<td>  ${bean.sabun} </td>
				<td>  ${bean.name} </td>
				<td> <a href="detail.do?idx=${bean.sabun}"> ${bean.title} </a></td>
				<td> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
				<td>  ${bean.pay} </td>
			</tr>
		</c:forEach>
	
  </table>	

  <p>
  <h1>
  	<a href="/Web0520/write.do"> [신규등록]</a> &nbsp;
  	<a href="/Web0520/list.do">[데이타목록]</a> &nbsp;
  	<a href="/Web0520/index.jsp">[index.jsp]</a> &nbsp;
  </h1>
</body>
</html>













