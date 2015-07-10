<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<title>[회원가입]</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#radio").buttonset();
	});
	function check() {
		alert("중복체크");
	}
</script>
<style>
.join {position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
}

td {
	font-size: 13pt;
	font-weight: bold;
	height: 50;
	font-family: "맑은고딕", "돋움체", "굴림", "굴림체";
}

input {
	height: 35;
	width: 350;
	font-size: 11pt;
	font-weight: bold;
	font-family: "맑은고딕", "돋움체", "굴림", "굴림체";
}
</style>
</head>
<body>
	<div class="join" style="overflow:auto; width:100%;">
		<form action="joinok.jsp">
			<table align=center width=360>
				<tr height="150"><td></td></tr>
				<tr>
					<td colspan="3" align=center><input type=text name="id" placeholder=아이디
						style="width: 240;'"> <input type=button value=중복체크
						onclick="check()" style="width: 100;"></td>
				</tr>
				<tr>
					<td colspan="3" align=center><input type="password" name="pwd"
						placeholder=비밀번호 style="width: 166;">&nbsp; <input
						type="password" name="pwd" placeholder="비밀번호 확인" style="width: 166;">
					</td>
				</tr>
				<tr>
					<td colspan="3" align=center><input type=text name="name" placeholder=이름>
					</td>
				</tr>
				<tr>
					<td align=center width=400>성별</td>
					<td align="left">
						<div id="radio">
							<input type="radio" id="male" name="sex">
								<label for="male" style="width: 133;">
									<font size=2 color=#3355cc><b>남성</b></font>
								</label>
							<input type="radio" id="female" name="sex">
								<label for="female" style="width: 133;">
									<font size=2 color=#bb2525><b>여성</b></font>
								</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type=text name = "birth" style="width: 275;'" placeholder='ex)1985/12/4 => 851204'></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=text name="num" placeholder=연락처>
					</td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type=text name = "email" placeholder=이메일>
					</td>
				</tr>
				<tr>
					<td height=200></td>
				</tr>
				<tr>
					<td align="center" colspan=3><input type="submit" value="회원 가입"
						style="width: 170; background-color: #E9DECA; border: 0; height: 50;'">
						<input type="reset" value="다시 작성"
						style="width: 170; background-color: #E9DECA; border: 0; height: 50;'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>