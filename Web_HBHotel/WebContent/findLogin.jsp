<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ include file="header.jsp"%>

<%@ page import="java.sql.*" %>
<html>
<head>
<title>[회원가입]</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	function find(){
		var call=document.form.call.value;
		for(var i=0;i<call.length;i++){
			if(( call.substring(i,i+1)>=0 && call.substring(i,i+1)<=9) !=true) {alert("숫자만 입력하셔야합니다"); return;}
		}if(document.form.name.value==""||document.form.call.value==""||document.form.email.value==""){
			alert("모든 정보를 입력해주세요");
		}else document.form.submit();
	}
	
</script>
<style>
 @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
.join { 	
		position: absolute;
		top: 225px;
		width: 1759px;
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		color:#81725F;
		height:900px;
		background-color: #ffffff; 
 	  }
input { height: 35px; width: 350px; font-size: 11pt; font-weight: bold; font-family: "맑은고딕", "돋움체", "굴림", "굴림체"; }
p{margin-top:100px; 	font-family:'Nanum Myeongjo'; font-size: 30pt; margin-left:430px;}
#j1{width:800px; height:400px;border:1px solid #666; margin-left:430px; padding-top:10px;}
</style>
</head>
<body>
<%@ include file="menu.jsp"%>
	<div class="join" style="overflow:auto; width:100%;">
		<p>
		FIND Your ID
		<div id = "j1">
		<form action="find.do" name=form>
			<table align=center width=360>
				<tr height="80">
					<td align=center style="font-weight:bold;font-family:'Nanum Myeongjo';font-size:15pt;">
					아이디/비밀번호 찾기
				</tr>
				<tr>
					<td align=center style="font-family:'Nanum Myeongjo';font-size:10pt; ">
					아이디와 비밀번호를 잊으신 경우</td>
				</tr>			
				<tr>
					<td align=center style="font-family:'Nanum Myeongjo';font-size:10pt;">
					아래 정보를 입력하여주십시오.</td>	
				</tr>
				<tr>
					<td height=20></td>
				</tr>
				<tr  >
					<td colspan="3" align=center >
						<input type=text name="name" placeholder=이름>
					</td>
				</tr>
				<tr>
					<td colspan="2" align=center >
						<input type=text name="call" placeholder=연락처>
					</td>
				</tr>
				<tr>
					<td colspan="2" align=center >
						<input type=text name = "email" placeholder=이메일>
					</td>
				</tr>
				<tr>
					<td height=20></td>
				</tr>
				<tr>
					<td align="center" colspan=3>
						<input type=button onclick="find()" value=" 아이디 / 비밀번호 찾기 "
						style="width: 400px; background-color: #E9DECA; border: 0; height: 50px;'">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>