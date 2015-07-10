<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<title>login.jsp</title>
<style>
	A:link    { font:9pt; text-decoration:none; color:#000000}
	A:active  { text-decoration:none; color:#990099}
	A:visited { text-decoration:none; color:#3A3A3A}
	A:hover   { text-decoration:none; }
	
	.facility{
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
		}
		
		#f{
			position: absolute;
			margin-left: 200px; 
			top: 50px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
		#m{
			position: absolute;
			margin-left: 500px; 
			top: 50px;
			width: 1100px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
			
		}
	.login { margin: 0px; padding: 0px; height: 900px; background-color: #ffffff; }
	text { width: 500; font-family: "굴림"; }
</style>
</head>
<script type="text/javascript">
	function member() {
		login.id.placeholder=" 회원 아이디";
	}function guest() {
		login.id.placeholder=" 예약번호";
	}function check() {
		var checkID=login.id.value;
		var checkPw=login.pw.value;
		for(var i=0;i<checkPw.length;i++){
			if((checkPw.substring(i,i+1)>=0 && checkPw.substring(i,i+1)<=9)!=true){alert("비밀번호는 숫자만 입력하셔야합니다"); return;}
		}if(checkID==""||checkPw==""){
			alert("아이디와 비밀번호를 모두 기입해주세요")
		}else if(checkID.length<4||checkPw.length<4){
			alert("4자리 이상 입력하셔야합니다")
		}else document.login.submit();
	}
</script>
<body>
<div class="facility">
	<%@ include file="sidebar.jsp"%>
	<div id = "f"> LOGIN </div>
	<div id = "m">
		<a href="layout.jsp">Home</a> > LOGIN

		<h1>LOGIN</h1>

		<form name=login action=login.do method="post">
			<table align="center">
				<tr>
					<td>
						<table>
							<tr height=80>
								<td colspan="3">
									<font SIZE=4><b>THE HANBIT 홈페이지에 방문하신 것을 환영합니다</b></font>
								</td>
							</tr>
							<tr>
								<td colspan="3">THE HANBIT 멤버가 되시면 다양한 혜택을 받으실 수 있습니다</td>
							</tr>
							<tr height=100>
								<td colspan="3">
									<hr>
								</td>
							</tr>
							<tr>
								<td><img src=./images/eat.jpg></td>
								<td><img src=./images/hotel.jpg></td>
								<td><img src=./images/sport.jpg></td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr height=20></tr>
							<tr align="right">
								<td colspan="2">
									<input type="radio" name=client value=member onclick="member()" checked="checked"><b>member</b>
									<input type="radio" name=client value=guest onclick="guest()"><b>guest</b>
								</td>
							</tr>
							<tr height=60>
								<td align="center">
									<input type=text name=id placeholder=" id" size=50 style="height: 35px; font-size: 12pt;'">
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="password" name=pw placeholder=" 비밀번호" size=50 style="height: 35px; font-size: 12pt;'">
								</td>
							</tr>
							<tr height=90>
								<td>
									<input type="button" value="로   그   인" onclick="check()" style="width: 445px; font-weight:bold; 
									background-color: #353535; border: 0; height: 50px; color: white; font-size: 13pt;">
								</td>
							</tr>
							<tr>
								<td align=right>
									<a href='join.jsp' style="font-size: 9pt; color: green;"><b>아직 HB호텔회원이 아니신가요?</b></a>
								</td>
							</tr>
							<tr>
								<td align=right>
									<a href='findLogin.jsp' style="font-size: 9pt; color: green;"><b>아이디/비밀번호를 잃어버리셨어요?</b></a>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>