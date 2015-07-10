<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>    
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title></title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
	<style type="text/css">
	
	@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
	.join {
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
}

	</style>
	
	<script type="text/javascript">
	

	
	</script>
	
</head>

<body>
<div class="join">
	<form name=myform method="post" action='insert.do' align='center'>
	<input type="hidden" name="name" size="40" value=<%=loginId%>>
	<table width="700" height="500" style="margin-left:500px;">
	<tr >
			<th align=left colspan="2" height=30 style="padding-top:60px;" >
				<font color ="#D45050" size=2px> HANBIT호텔 방문 후기를 남겨주시면,매월 첫째주 월요일 추천을 통하여</font> 레스토랑 식사권
				<font color="#D45050">을 드립니다.</font>
			</th>
		</tr>	
		<tr>
			<th  bgcolor="#F4EEE3" align="center">제 목</th>
			<td><input type="text" name="title" size="40"></td>
		</tr>		
		<tr>
		<th  bgcolor="#F4EEE3" align="center">내 용</th>
			<td><textarea name="content" rows="16" cols="60"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="#F4EEE3" align="center" height=50>
				<input type="submit" value="등록하기">
				<input type="reset" value="취소하기">
				<input type="button" value="목록보기" onClick="window.location='list2.jsp'">
				<input type="button" value="test" onClick="window.location='list2.jsp'">
		</tr>
	</table>		
	</form>
	</div>
	<%@ include file="bottom.jsp"%>
</body>
</html>