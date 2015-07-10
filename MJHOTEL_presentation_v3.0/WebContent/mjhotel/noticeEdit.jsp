<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="notice.common.DBbean" %>
<html>
<head>
<title>noticeEdit</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
	<%
	try{
		DBbean bean = (DBbean)request.getAttribute("edit");
	%>
<div id="adminF">
	<form method=get name=myform action="noticeEdit.do">
	<div id="adminF2">
		<div id="admin_title2">공지사항 수정</div>
		<table id="admin_tableF2">
			<tr>
				<td class="adminB" >제목</td>
				<td><input type=text name=title class="adminS" value="<%=bean.getTitle() %>">(20자 미만)</td>
			</tr>
			<tr>
				<td class="adminB" style="vertical-align: top;">내용</td>
				<td><textarea name='contents' rows=10 cols=100 class="adminS" style="vertical-align: bottom;"><%=bean.getContents() %></textarea>(3000자 미만)</td>
			</tr>
		</table>
	</div>	
	<!-- 버튼 -->
		<input type=hidden name="num" value=<%=bean.getNum() %> readonly>		
		<input type=submit value="수정" class="bt">
	</form>	
		<a href='notice.do'><input type='button' value="취소" class="bt"></a>	
		<%
		}catch(Exception ex){ ex.toString(); }
		%>
</div>
</body>
</html>