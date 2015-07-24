<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>

<%@ taglib  prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>[guestDetail.jsp]</title>
	<style type="text/css">
		td{font-size:14pt; font-weight:bold; font-family:맑은고딕;}
		a{text-decoration:none ; font-size:20pt; font-weight:bold; font-family:맑은고딕;}
		a:hover{text-decoration:underline ; color:red; font-size:28pt; font-weight:bold; font-family:맑은고딕;}
	</style>
</head>
<body>
  <font size=7 color=blue><b>  [guestDetail.jsp] </b></font><p>
  <table width=700 border=1>
	  	<tr>
	  		<td colspan=6>
	  			<img src="images/bar.gif">
	  		</td>
	  	</tr>
	  	
	  	<tr>
	  		<td colspan=6  align="center">
	  			<font size=7><b> ${bean.name}님의 상세데이타 </b></font>
	  		</td>
	  	</tr>
		
		<tr bgcolor="yellow"  height=60>
			<td>사번</td>  <td>이름</td>	<td>제목</td>  
			<td>날짜</td>  <td>급여</td>  <td>  </td>
		</tr>
	 
	  	<tr>
	  		<td width=90>${bean.sabun} </td>
	  		<td width=70>${bean.name} </td>
	  		<td widht=70>${bean.title} </td>
	  		<td width=100><fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd" /> </td>
	  		<td width=90>${bean.pay} </td>
	  		<td align="center"  width=120> 
	  			<input type="button" 
	  			onClick="javascript:location.href='delete.do?idx=${bean.sabun}'" 
	  			value=" 삭제처리 " style="font-size:20pt; font-weight:bold;"	>
	  		</td>
	  	</tr>
  </table>	

  <p>
  <h1>
    <a href="/Web0520/editPre.do?idx=${bean.sabun}"> [데이타수정]</a> &nbsp;
  	<a href="/Web0520/write.do"> [신규등록]</a> &nbsp;
  	<a href="/Web0520/list.do">[데이타목록]</a> &nbsp;
  	<a href="/Web0520/index.jsp">[index.jsp]</a> &nbsp;
  </h1>
</body>
</html>








