<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@  page import="java.sql.*"  %>
<%@  page import="java.util.*"  %>

<html>
<head><title>[guest]</title>
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
	<font size=7><b> [guest.jsp] </b></font><p>
	<form method="get" action="insert.do">
		<b>사번:</b> <input type="text" name="sabun"> <br>
		<b>이름:</b> <input type="text" name="name"> <br>
		<b>제목:</b> <input type="text" name="title" value="chicken"> <br>
		<b>급여:</b> <input type="text" name="pay" value="27"> <p>
		<input type="submit"  value="MVC2데이터저장"> &nbsp;
		<input type="reset"   value="입력데이타취소">
	</form>
	
	<p>
	<h1>
	<a href="guest.jsp">[등록화면] </a>
	<a href="list.do">[전체출력] </a>
	<a href="guestDelete.jsp">[삭제화면] </a>

</h1>
	
	<p><br><br><br><br><br><br><br><br><br><br>
</body>
</html>