<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<title>[회원가입 성공]</title>
</head>
<style type="text/css">
	.joinok { 
		position: absolute;
		top: 225px;
		width: 1759px;
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		color:#81725F;
		height:900px;
		background-color: #ffffff; 
		    }
   	.joinuser {
   	position: absolute;
		top: 190px;
		width: 600px;
		margin-left: 920px; 
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		color:#81725F;
		height:125px;
		background-color: #ffffff; 
		}
 	  @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	.qna{margin:0px; padding:0px;height:900px;background-color:#ffffff;}
	.j3 {float:right;  margin-right:400px; margin-top:50px; border-top:1px solid #666; border-bottom:1px solid #666; }
	#j1 ul.j1 li {text-decoration:none; font-family: 'Nanum Myeongjo'; color:#000000; font-size:25px; margin-left:400px; padding-top:100px;}
	#j1 ul.j2 li { text-decoration:none; font-family: 'Nanum Myeongjo'; color:#000000; font-size:15px;	margin-left:420px;}
	#j1 ul.j4{ margin-top:30px; }
	#j1 ul.j4 li { text-decoration:none; font-family: 'Nanum Myeongjo'; color:#000000; font-size:15px; margin-left:360px; }
	#j1 img { margin-left:570px; padding-top:30px;}
	#a {background-color:#F6F6F6;}
	input{margin-left:980px; padding-top:0; background-color: #E9DECA; border:1px solid black; height:27px; font-family: 'Nanum Myeongjo'; }
</style>
<%!
	private String id,name,sex,email;
	private int pw,birth,call;

	private int Gsabun;
	private String Gtitle;
	private int total;//레코드 갯수
%>
<body>
<div class="joinok">
<%
	id = request.getParameter("id");	
	call = Integer.parseInt(request.getParameter("call"));
	email = request.getParameter("email");
%>
	<div id = "j1">
		<ul class= "j1">
			<li>THE HANBIT 호텔 프리빌리지 회원 가입을 진심으로 환영합니다.</li>
		</ul>
		<ul class= "j2">
			<li>항상 고객님을 최우선으로 최상의 서비스가 될 수 있도록 최선의 노력을 다하는 HANBIT 호텔이 되겠습니다.</li>
		</ul>
		<img src="images/hblogo.png">
		<div class="joinuser">
		<table class="j3"  >
			<tr >
				<td id="a">ID</td>
				<td><%=id %></td>
			</tr>
			<tr >
				<td id="a">E-mail</td>
				<td><%=email %></td>
			</tr>
			<tr >
				<td id="a">Phone-num</td>
				<td>0<%=call%></td>
			</tr>
		</table>
		</div>
		<input type = "button" value="로그인 페이지로 가기" onclick="location='login.jsp'"> 
		<ul class= "j4">
			<li>＊온라인 가입을 통해 발급된 프리빌리지 멤버쉽 카드는 HANBIT호텔 투숙 이용 후 우편 발송됩니다.</li>
			<li>＊카드 도착 전 HANBIT호텔을 이용하실 경우, 임시카드를 인쇄하여 투숙 시 제출하시면 동일한 포인트 혜택을 적용 받으실 수 있습니다</li>
		</ul>
	</div>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>