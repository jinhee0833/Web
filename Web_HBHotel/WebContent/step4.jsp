<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		.facility{position: absolute;top: 225px;margin-left: 0px; padding:0px; height:900px;width: 1759px;background-color: #ffffff;}		
		#f{position: absolute;margin-left: 200px;top: 30px;width: 10px;text-decoration:none; 
		   font-family: 'Nanum Myeongjo';color:#81725F;font-size:45px;}		
		#m{position: absolute;margin-left: 480px;top: 40px;width: 900px;text-decoration:none; 
		font-family: 'Nanum Myeongjo';color:#81725F;}		
</style>
</head>
<body>

	<% String code = String.valueOf(request.getAttribute("code3"));
	   String chkIn = request.getParameter("chkIn");
	%>
	<div class="facility">

			<div id = "f" >
			STEP4
		</div>
		<%@ include file="sidebar.jsp"%>

		<div id = "m">
		<a href="layout.jsp">Home</a> > RESERVATION
		<h1>RESERVATION</h1>
		<table border=0 width=900px; >
		<tr>		
		<td align=center width=20%  height=50>
		<font size=5>STEP 01</font><br>
		날짜 & 인원 선택	
		</td>
		<td align=center width=20%>
		<font size=5>STEP 02</font><br>
		객실 선택
		</td>
		<td align=center width=20%  >
		<font size=5>STEP 03</font><br>
		선택 객실 확인
		</td>
		<td align=center width=20% bgcolor=#F4EEE3> 
		<font size=5>STEP 04</font><br>
		완료 & 확인
		</td>
		</tr>
		<tr>
		<td colspan=5>
		<hr>
		</td>
		</tr>		
		</table>
		<table style="margin-left:180px;margin-top:30px;">
		<tr>
			<td><font size = 5>고객님 HANBIT호텔을 이용해주셔서 감사합니다.</font>
			</td>
		</tr>
		<tr height=40>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			HANBIT 호텔에서 즐거운 시간 보내시기 바랍니다.
			</td>
		</tr>
		<tr height=40>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			고객님 예약번호는 <font color = red size = 4><%=code %></font>번입니다.
			</td>
		</tr>
		<tr height=40>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <font color = red ><%=chkIn %> 12시</font> HANBIT 호텔 정문에서 체크인을 해주세요.
			</td>
		</tr>
		</table>
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>