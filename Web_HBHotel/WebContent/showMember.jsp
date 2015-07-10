<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="net.hb.common.DBGuestBean"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head><title>[회원정보 수정]</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
	.join {	position: absolute; top: 225px; margin-left: 0px; padding:0px; height:900px; width: 1759px; background-color: #ffffff;}
	td {font-size: 13pt; font-weight: bold; font-family: "맑은고딕", "굴림", "굴림체"; height:53px;}
	input {height: 35px; width: 275px; font-size: 11pt; font-weight: bold; font-family: "맑은고딕", "굴림", "굴림체"; text-align:center;}
	span {font-size: 10pt; color:red;}
</style>
</head>
<%
	DBGuestBean bean=(DBGuestBean)request.getAttribute("member");
	if(bean.getSex().equals("male")){
		%><script>$(function(){$("#male").click(); show.sex[1].disabled=true;})</script><%
	}else %><script>$(function(){$("#female").click(); show.sex[0].disabled=true;})</script><%
	String birth=String.valueOf(bean.getBirth());
	int birthL=birth.length();
	if(birthL!=6){
		for(int i=0;i<(6-birthL);i++){birth=0+birth;}
	}
%>
<script>
	$(function() {$("#radio").buttonset();	});
	function deleteopen(id) {
		open("deleteMember.jsp?id="+id, "삭제", "width=400, height=250, top=300, left=550",opener);
	}
</script>
<body>
	<div class="join" style="overflow:auto; width:100%;">
		<form action=modifyMember.jsp name=show method="post">
			<table align=center width=375>
				<tr height="200">
					<td colspan="3" align="center">
						<font style="font-size:50pt;font-family:AR BERKLEY;" color=#1E0000><b>HaN BiT</b></font>
					</td>
				</tr>
				<tr>
					<td align=center height=40>ID</td>
					<td>
						<input type=text name=id value=<%=bean.getId()%> readonly>
					</td>
				</tr>
				<tr>
					<td align=center>이름</td>
					<td>
						<input type=text name=name value=<%=bean.getName()%> readonly>
					</td>
				</tr>
				<tr>
					<td align=center width=400>성별</td>
					<td align="left">
						<div id="radio">
							<input type="radio" id="male" name="sex" value=male>
								<label for="male" style="width: 133px;">
									<font size=2 color=#3355cc><b>남성</b></font>
								</label>
							<input type="radio" id="female" name="sex" value=female>
								<label for="female" style="width: 133px;">
									<font size=2 color=#bb2525><b>여성</b></font>
								</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type=text name=birth style="width: 275px;'" value=<%=birth%> readonly></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type=text name=call value='0<%=bean.getCall()%>' readonly>
					</td>
				</tr>
				<tr>
					<td align=center>이메일</td>
					<td>
						<input type=text name=email value=<%=bean.getEmail()%> readonly>
					</td>
				</tr>
				<tr>
					<td height=200></td>
				</tr>
				<tr>
					<td align="center" colspan=3>
						<input type="submit" value="정보 수정" style="width: 179px; background-color: #E9DECA; border: 0; height: 50px;'">
						<input type="button" value="회원 탈퇴" onclick="deleteopen('<%=loginId%>')" style="width: 179px; background-color: #E9DECA; border: 0; height: 50px;'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>