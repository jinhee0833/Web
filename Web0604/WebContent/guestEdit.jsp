<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guestEdit]</title>
	<style type="text/css">
		a{font-size:12pt; text-decoration:none; }
		a:hover{ 
		 	font-size:14pt; color:blue; 
			font-family:Comic Sans MS;
		}
		b,input,select,td{font-size:12pt; font-weight:bold;  }
	</style>
</head>

<body>
	<font size=7><b> [guestEdit.jsp=단독실행X] </b></font><p>
	<form method="get" action="edit.do">
		<b>수정사번:</b> 	
			<input type="text" name="sabun" value="<%= request.getParameter("idx") %>" readonly="readonly"> <br>
		<b>수정이름:</b> 
		    <input type="text" name="name"   value="<%= request.getParameter("idx2")%>"> <br>
		<b>수정제목:</b> 
		    <input type="text" name="title"  value="<%= request.getParameter("idx3")%>"> <br>
		<b>수정급여:</b> 
		    <input type="text" name="pay"  value="<%= request.getParameter("idx4")%>"> <p>
		    <input type="submit"  value="MVC2데이타수정"> &nbsp;
		    <input type="reset"   value="수정취소">
	</form>
	
	<p>
	<h1>
		<a href="guest.jsp">[등록화면]</a>
		<a href="list.do">[전체출력]</a>
		<a href="guestDelete.jsp">[데이타삭제]</a>

	</h1>
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>










