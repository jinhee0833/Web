<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>guestInsert.jsp</title>
</head>
<body>
<% String id=(String)session.getAttribute("NowUser"); %>
<div id="guestF">
	<form name=write action="guestInsert.do">
	<div id="guestF2">
	<div id="guest_title2">이용후기</div>
		<table id="guest_tableF2">
		<%	if(id!=null){ %>
			<tr><td colspan=2><input type=hidden name=writer value="<%=id%>"></td></tr>
		<% 	}else{%>
			<tr>
				<td class="guestB" >작성자</td>
				<td><input type=text name=writer class="guestS">(10자 미만)</td>
			</tr>
		<%	} %>
			<tr>
				<td class="guestB" >제목</td>
				<td><input type=text name=title class="guestS">(20자 미만)</td>
			</tr>
			<tr>
				<td class="guestB" style="vertical-align: top;">내용</td>
				<td><textarea name=contents rows=20 cols=60 class="guestS" style="vertical-align: bottom;"></textarea>(3000자 미만)</td>
			</tr>
			<tr>
				<td class="guestB" >비밀번호</td>
				<td><input type=password name=pwd class="guestS">(4자리)</td>
			</tr>
		</table>
		</div>
		<input type=submit value=확인 class="bt">
		<a href='guest.do'><input type='button' value="취소" class="bt"></a>
</form>
</div>	
</body>
</html>