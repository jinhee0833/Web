<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>header.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/header2.css" media="screen">
<style>
body{ margin:0px; padding:0px; background-color:#252220;}
.header{
position: absolute;
	margin:0px; 
	padding:0px;
	height:130px;
	 position:relative;
	 }
 
#hh{
			position: absolute;
			margin-left: 700px; 
			top: 10px;
			width: 350px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;		
}

#hh1{
			position: absolute;
			margin-left: 800px; 
			top: 50px;
			width: 160px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;			
}
#h1{
	
			position: absolute;
			margin-left: 1200px; 
			top: 10px;
			width: 300px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
}


</style>
</head>
<body >

	<%
	String loginId = (String)session.getAttribute("loginId");
	%>
	<div class = "header">	
	<div id="hh">
		<h2>
			<a href="layout.jsp" >T H E H A N B I T</a><br>
		</h2>
	</div>
	<div id="hh1">
		<h2>
			<a href="layout.jsp">HOTELS & PARADISE</a><br>
		</h2>
	</div>
	<div id="h1">
	<% 

	if(loginId == null){ 
	%>
		<ul>	
			<li><a href="join.jsp">JOIN</a></li>
			<li><a href="login.jsp">LOGIN</a></li>	
		</ul>
	<%
	}else if(loginId.equals("master")){
	%>
		<ul>	
			<li><a href="logout.jsp">LOGOUT</a></li>
			<li><a href="manager.jsp">관리자 접속</a></li>
	 	</ul>	
			
	<%
	}else{
	%>
		<ul>	
			<li><a href="logout.jsp">LOGOUT</a></li>
			<li><a href="showMember.do?loginId=<%=loginId %>"><%=loginId %>님 안녕하세요.</a></li>
	 	</ul>
	<%
	}
	%>
	</div>
	</div>
</body>
</html>