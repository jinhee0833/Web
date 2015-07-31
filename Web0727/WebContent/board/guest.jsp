<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[board/guest.jsp]</title>
<style type="text/css">
	
</style>
<script type="text/javascript">
	function move(){
		var a = document.myform.sabun.value;
		alert(a);
		location.href="delete.do?sabun="+a;
	}
</script>
</head>
<body>
	<font size=7><b>[guest.jsp=guest.do]</b></font><p>
	<form action="insert.do" name="myform">
		<b><input type="text" name="title" placeholder="제목"></b>
		<b><input type="text" name="sabun" placeholder="사번" ></b>
		<b><input type="text" name="pay"  placeholder="급여" ></b>
		<b><input type="text" name="name" placeholder="이름" ></b>
		<input type="submit" value=스프링전송>
		<input type="button" value=삭제 onclick="move()">
		<input type="button" value=목록보기 onclick="location.href='select.do'">
	</form>
	<h2><a href="two.do">삭제</a></h2>	
	<img src="images/bar.gif"><p>
</body>
</html>