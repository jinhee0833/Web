<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>KakaoStory Web Ver1.0</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="Jquery/jquery.js"></script>
<script language="javascript">
	function login(){
		if ( loginfo.userID.value == ""){
			alert('ID를 입력하세요');
			return false;
		}
		if ( loginfo.userPwd.value == ""){
			alert('Password를 입력하세요');
			return false;
		}
		loginfo.submit();
	}
	window.onload = function(){
		loginfo.userID.focus();
	}
</script>

</head>
<body leftmargin=0 topmargin=0>
<table width="1000" alien="center">
	<tr>
		<td><img src="images/img_login.jpg" width="480" height="800"></td>
	</tr>
</table>

<div id="divLayer" class="clsLayer" style=
     'position : absolute;
     left:100px;
     top:500px;
     width:300px;
     height:80px;
     background-color: #FFFFDD;
     font-size: 11px;
     color: white;
     overflow:no;
     padding:20 10 5 5;
     filter:Alpha(opacity=70);
     border-radius: 10px;
     visibility: visible;
     z-index:1'>
<form name="loginfo" method="post" action="Login.do">
	<table width="300">
		<tr>
			<td height="8"></td>
		</tr>
		<tr>
			<td>
				<table width="300" alien="center">
					<tr>
						<td><font color="black"> ID </font></td>
						<td><input type="text" name="userID" size=16> </td>
						<td rowspan=2>
							<a href="javascript:login()"><img src="images/btn_login.jpg" border=0 width="55" height="45" style="cursor:hand"></a>
						</td>
					</tr>
					<tr>
						<td><font color="black"> Password </font></td>
						<td><input type="password" name="userPwd" size=16></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		
	</table>
</form>
</div>
<div id="divLayer" class="clsLayer" style=
     'position : absolute;
     left:100px;
     top:580px;
     width:300px;
     height:30px;
     background-color: #ffffff;
     font-size: 11px;
     color: white;
     overflow:no;
     padding:20 10 5 5;
     filter:Alpha(opacity=50);
     border-radius: 10px;
     visibility: visible;
     z-index:1'>
     <table width="300">
     	<tr>
	     	<td align="center"><a href="user_join.jsp">회원 가입</a></td>
     	</tr>
     </table>
</div>
</body>
</html>