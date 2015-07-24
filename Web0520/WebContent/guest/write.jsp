<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>
<head>

<title>[write.jsp]</title>
	<style type="text/css">
		input,b{font-size:16pt; font-weight:bold; font-family:맑은고딕;}
	</style>
</head>
<body>
<font size=7 color=blue>  [write.jsp=write.do] </font><p>
	<form  method="get" action="insert.do">
		<b>사번:</b> <input type=text name=sabun> <br>
		<b>이름:</b> <input type=text name=name> <br>
		<b>제목:</b> <input type=text name=title> <br>
		<b>급여:</b> <input type=text name=pay> <p>
		<input type="submit"  value=" 스프링저장 ">
		<input type="reset"  value=" 입력취소 ">    
	</form>
	
 <p>
 
</body>
</html>







