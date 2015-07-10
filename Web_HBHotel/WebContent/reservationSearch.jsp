<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	    
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			SEARCH
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="step1.jsp">RESERVATION</a> > SEARCH
		<h1>SEARCH</h1><br>
		
		<font size=6>예약하신 방번호를 입력해 주세요. </font><p>
	<form action = "reservationSearch.do" method=post>
	<hr>
		<table border = 0>
			<tr>
				<td><input type = "text" name = "code" size = 50></td>
				<td><input type = "submit" value = "검색"></td>
			</tr>
		</table>

	</form>
	</div>
	</div>
	
</body><%@ include file="bottom.jsp"%><%@ include file="bottom.jsp"%>
</html>