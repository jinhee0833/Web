<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>noticeInsert</title>
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
</head>
<body>
<div id="adminF">
	<form name=myform action="noticeInsert.do" enctype="multipart/form-data">
	<div id="adminF2">
		<div id="admin_title2">공지사항 글쓰기</div>
		<table id="admin_tableF2">
			<tr>
				<td class="adminB" >제목</td>
				<td><input type=text name=title class="adminS">(20자 미만)</td>
			</tr>
			<tr>
				<td class="adminB" style="vertical-align: top;">내용</td>
				<td><textarea name='contents' rows=10 cols=90 class="adminS" style="vertical-align: bottom;"></textarea>(3000자 미만)</td>
			</tr>
		</table>
	</div>
	<!-- 버튼 -->
		<input type=submit value="확인" class="bt">
	</form>	
		<a href='notice.do'><input type='button' value="취소" class="bt"></a>	
</div>	
</body>
</html>