<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:굴림; font-size:13;}
		b{color:#81725F;}
		
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
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			HISTORY
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a> > HISTORY

		<h1>HISTORY</h1>
		<table border=0 width=700px;>
		<tr height=50px;>
			<td width=70px;><font size=5><u><b>2013.</b></u></font>
			</td>
			<td width=100 align=center>January
			</td>
			<td>Travel + Leisure, 세계 최고 500대 호텔 중 서울지역 최고 호텔
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		<tr height=50px;>
			<td><font size=5><u><b>2012.</b></u></font>
			</td>
			<td align=center>August
			</td>
			<td>Travel + Leisure, 아이사 지역 호텔 16위
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		<tr height=50px;>
			<td><font size=5><u><b>2008.</b></u></font>
			</td>
			<td align=center>April
			</td>
			<td>ZAGAT, 국네 호텔 중 최고 점수 획득
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		
			
		<tr height=50px;>
			<td><font size=5><u><b>2010.</b></u></font>
			</td>
			<td align=center>October
			</td>
			<td>6성급 호텔로 승급
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		
		<tr height=50px;>
			<td><font size=5><u><b>1973.</b></u></font>
			</td>
			<td align=center>November
			</td>
			<td>반도호텔로부터 한빛호텔로 개명
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		
		<tr height=50px;>
			<td><font size=5><u><b>1938.</b></u></font>
			</td>
			<td align=center>August
			</td>
			<td>한국 최초의 민간호텔인 반도호텔 개관
			</td>
		</tr>
		<tr>
			<td colspan=3>
			<hr>
			</td>
		</tr>
		</table>
		</div>
	</div>
</body>
		
<%@ include file="bottom.jsp"%>
</html>