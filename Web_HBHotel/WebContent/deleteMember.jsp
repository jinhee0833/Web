<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>[회원정보 삭제]</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<script>
	function load() {
		document.delete.id.value=opener.show.id.value;
	}function login() {
		opener.location="deleteMember.do?id="+document.delete.id.value;
		alert("정상적으로 회원탈퇴가 완료되었습니다");
		self.close();
	}
</script>
<body onload="load()">
		<form action=deleteMember.do name=delete method="post">
			<table align=center width=375>
				<tr height="100">
					<td colspan="3" align="center">
						<font style="font-size:50pt;font-family:AR BERKLEY;" color=#1E0000><b>HaN BiT</b></font>
					</td>
				</tr>
				<tr height="70">
					<td colspan=3 align="center">
						<input type="text" name=id style="height: 30px; width: 100px;" readonly> 님 정말 탈퇴하시겠습니까?
					</td>
				</tr>
				<tr>
					<td align="center" colspan=3>
						<input type="button" onclick="login()" name = "ok" value="회원 탈퇴" style="width: 179px; background-color: #E9DECA; border: 0; height: 50px;'">
						<input type="button" value="탈퇴 취소" onclick="self.close();" style="width: 179px; background-color: #E9DECA; border: 0; height: 50px;'">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>