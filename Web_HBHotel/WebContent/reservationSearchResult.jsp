<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.hb.common.*" %>
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
<script type="text/javascript">
	function reservationCancle(){
		
		
	}
</script>
</head>
<%!
	private DBReservationBean reservationInfo;
%>
<body>

<% 
	reservationInfo = (DBReservationBean)request.getAttribute("reservationInfo");
%>

<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			SEARCH
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="step1.jsp">RESERVATION</a> > SEARCH
		<h1>SEARCH</h1><br>
		

<table border = "0" width= 700>
	<tr>
		<td colspan = "2"><h2><%= reservationInfo.getUserId() %>님의 예약</h4></td>
	</tr>
	<tr>
	<td colspan=2><hr></td>
	</tr>
	<tr>
		<td>CheckIn</td><td align=right><%= reservationInfo.getChkIn()%></td>
	</tr>
		<tr>
	<td colspan=2><hr></td>
	</tr>
	<tr>
		<td>CheckOut</td><td align=right><%= reservationInfo.getChkOut() %></td>
	</tr>
		<tr>
	<td colspan=2><hr></td>
	</tr>
	<tr>
		<td>룸정보</td><% if(reservationInfo.getRoomPackage() == 1){ %><td align=right>STANDARD ROOM</td>
		<% }else if(reservationInfo.getRoomPackage() == 2){ %><td align=right>SWEET ROOM</td>
		<%}else { %><td align=right>ROYAL ROOM</td><%} %>
			<tr>
	<td colspan=2><hr></td>
	</tr>
	<tr>
		<td align=right>
			<input type = "button" value = "예약변경" onClick = "location.href='step1.jsp?code=<%=reservationInfo.getCode()%>'">
		</td>
		<td>
			<input type = "button" value = "예약취소" onClick = "location.href='reservationCancel.do?code=<%=reservationInfo.getCode()%>'">
		</td>
	</tr>
</table>
</div>
</div>

<%@ include file="bottom.jsp"%>
</body>
</html>