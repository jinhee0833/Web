<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>[회원가입]</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
.findok {position: absolute;
		top: 225px;
		width: 1759px;
		text-decoration:none; 
		font-family: 'Nanum Myeongjo';
		color:#81725F;
		height:900px;
		background-color: #ffffff; }
p{margin-top:60px; font-family:'Nanum Myeongjo'; font-size: 30pt; margin-left:200px;}
#j1{width:800px; height:400px;border:1px solid #666; margin-left:400px; margin-top:50px;}
#j2{margin-top:60px;font-family:'Nanum Myeongjo'; font-size: 30pt; margin-left:20px;}
</style>
</head>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	if(id.equals("null")&&pw.equals("0")){
		%>
		<script> 
			alert("입력하신 정보가 올바르지 않습니다. 다시 입력해주십시오."); 
			location="findLogin.jsp";  
		</script>
		<%
	}
%>
<body>
<div class="findok" style="overflow:auto; width:100%;">
<div id = "j1">
	<p>
		Your ID/Password
		<table align=center width=360  class=j2>
			<tr height="80">
				<td  colspan="3" align=center ><b>ID</b></td>
				<td  colspan="3" align=center ><b><%=id%></b></td>
			</tr>
			<tr >
				<td  colspan="3" align=center ><b>PASSWORD</b></td>
				<td  colspan="3" align=center ><b><%=pw%></b></td>
			</tr>
		</table>
</div>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>