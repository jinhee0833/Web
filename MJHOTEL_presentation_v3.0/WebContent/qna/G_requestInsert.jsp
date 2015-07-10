<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>request</title>
</head>
<body>
<form method='get' action='G_requestInsert.do' name='request' >
<div id="qnaF">
	<div id="qnaF2">
	<div id="qna_title2">문의사항</div>
	<table id="qna_tableF2">
		<tr>
			<td class="qnaB">문의구분</td>
			<td>
			<select name="qselect" class="qnaS">
				<option >Reservation</option>
				<option >Room</option>
				<option >Facilities</option>
				<option >ETC</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="qnaB">제목</td>
			<td><input type='text' name='qtitle' class="qnaS">(20자 미만)</td>
		</tr>
		<tr>
			<td class="qnaB">이름</td>
			<td><input type='text' name='qname' class="qnaS">(10자 미만)</td>
		</tr>
		<tr>
			<td class="qnaB">연락처</td>
			<td><input type='text' name='qtel' class="qnaS">(숫자만 입력)</td>
		</tr>
		<tr>
			<td class="qnaB">이메일</td>
			<td><input type='text' name='qemail' class="qnaS"></td>
		</tr>
		<tr>
			<td class="qnaB" style="vertical-align: top;">문의 내용</td>
			<td><textarea name='qcontents' rows=5 cols=50 class="qnaS" style="vertical-align: bottom;"></textarea>(400자 미만)</td>
		</tr>
	</table>
	</div>
	<!-- 버튼 -->
	<input type='submit' value="확인" class="bt">
</div>
</form>
</body>
</html>