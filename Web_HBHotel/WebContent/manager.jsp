<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
		
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
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

</style>
</head>
<body>
	<div class="facility">
		
		<%@ include file="managerbar.jsp"%>
		<div id = "f" >
			MANAGER
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > MANAGER
		<h1>MANAGER</h1><br>

		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>