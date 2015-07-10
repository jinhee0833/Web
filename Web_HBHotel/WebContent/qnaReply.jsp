<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function qnaClose(num, reref){
		location.href="replay.do?num="+num+"&reref="+reref+"&userId="+reply.value+"&pwd="+reply.pwd+"&reply="+reply;
	}
</script>
</head>
<body>
<form action = reply.do>
<% System.out.println(request.getParameter("reref"));%>
<input type = "hidden" name = "num" value = "<%=request.getParameter("num") %>">
<input type = "hidden" name = "reref" value = "<%=request.getParameter("reref") %>">
아 이 디 : <input type = "text" name = "userId"> 비 번 :<input type = "password" name ="pwd"><br>
글 내 용 : <input type = "text" name = "reply"><input type = "submit" value="댓글달기">
</form>
</body>
</html>