<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<style>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
		
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol; color:black;}
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
			width: 100px;
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

</style>

</head>
<body>
	<div class="facility">
		<%@ include file="sidebar.jsp"%>
		<div id="f">Q&A</div>
	<div id="m">
			<a href="layout.jsp">Home</a> > Q&A
			<h1>Q&A</h1>
			<br>
	
<%
	try{
		String pageFile = String.valueOf(request.getAttribute("pageFile"));
		String pageFile2 = String.valueOf(request.getParameter("page"));
		if(!pageFile.equals("null")){
%>
		<jsp:include page = "<%= pageFile%>" flush="false" />
<%		}
		if(!pageFile2.equals("null")){
			%>
			<jsp:include page = "<%= pageFile2%>" flush="false" />
		<%
		}
	}catch(Exception e){System.out.println("qna.jsp의 try문 에러날때///");}%>
	</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>