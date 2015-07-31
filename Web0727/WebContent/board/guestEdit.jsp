<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="net.hb.dto.GuestDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[board/guest.jsp]</title>
<style type="text/css">	
</style>

</head>
<body>
	<font size=7><b>[guestEdit.jsp=edit.do]</b></font><p>
	<%
		String[] ob = request.getParameter("bean").split(",");
		System.out.println("bean//////"+ob.toString());
		
	%>
	<form action="edit.do" >
		<b><input type="text" name="title" placeholder="제목"  ></b>
		<b><input type="text" name="sabun" placeholder="사번"  readonly="readonly"></b>
		<b><input type="text" name="pay"  placeholder="급여" ></b>
		<b><input type="text" name="name" placeholder="이름" ></b>
		<input type="submit" value=스프링수정>		
		<input type="button" value=목록보기 onclick="location.href='select.do'">
	</form>
</body>
</html>