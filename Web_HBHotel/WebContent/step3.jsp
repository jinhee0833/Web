<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="net.hb.common.DBGuestBean" %>

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
		.facility{position: absolute;top: 225px;margin-left: 0px; padding:0px; height:900px;width: 1759px;background-color: #ffffff;}		
		#f{position: absolute;margin-left: 200px;top: 30px;width: 10px;text-decoration:none; 
		   font-family: 'Nanum Myeongjo';color:#81725F;font-size:45px;}		
		#m{position: absolute;margin-left: 480px;top: 40px;width: 900px;text-decoration:none; 
		font-family: 'Nanum Myeongjo';color:#81725F;}		
</style>
</head>
<body>
	<div class="facility">

			<div id = "f" >
			STEP3
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
		<td align=center width=20% bgcolor=#F4EEE3 >
		<font size=5>STEP 03</font><br>
		선택 객실 확인
		</td>
		<td align=center width=20%>
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
		<form action="reservationComplete.do" method="post">
		<table  width=800px; cellspacing=20 style= "margin-left:20px;" >
		<tr bgcolor=#F4EEE3 >
			<td width = 400 align = "center">
			<font color=#81725F size=6>USER Info</font></td>
			<td width = 400 align = "center" style= "margin-left:500px;">
			<table >
				<tr><td>
			<font color=#81725F size=6>Room Info</font></td></tr>
			</table></td>
		</tr>
	</table>
		<%
		DBGuestBean bean = (DBGuestBean)request.getAttribute("detail");
		String chkIn = request.getParameter("chkIn");
		String chkOut = request.getParameter("chkOut");
		String price = request.getParameter("price");
		String day = request.getParameter("day");
		String people = request.getParameter("people");
		int roomPackage =Integer.parseInt(request.getParameter("roomPackage")) ;
		System.out.println(roomPackage);
		String code = request.getParameter("code");
		try{
		%><table  width=800 cellspacing=10 style= "margin-left:30px;"  >
			<tr >			
				<td height=30 width=70 align = "center"><b>USER</b></td>
				<td align="left" width=50%><%=loginId%></td>
				<td height=30 width=70 align = "left"><b>Room</b></td>
				<td align="left" width =50%>
				<%if(roomPackage==1){ %>
				STANDARD ROOM 
				<% } 
				else if(roomPackage==2) {
					%> Sweet ROOM <% }
				else { %> Royal ROOM  <% } %>
				</td>
			</tr>
			<tr>
				<td height=30 align="center"><b>Name</b></td>
				<td align="left"><%=bean.getName()%></td>
				<td height=30 width=10% align = "left"><b>Check in</b></td>
				<td align="left" width =50%><%=chkIn %></td>
			</tr>
			<tr>
				<td height=30 align="center"><b>Birth</b></td>
				<td align="left"><%=bean.getBirth()%></td>
				<td height=30 width=10% align = "left"><b>Check out</b></td>
				<td align="left" width =50%><%=chkOut %></td>
			</tr>
			<tr>
				<td height=30 align="center"><b>Phone</b></td>
				<td align="left"><%=bean.getCall()%></td>
				<td height=30 width=10% align = "left"><b>Day's</b></td>
				<td align="left" width =50%><%=day%>일</td>
			</tr>
			<tr>
				<td height=30 align="center" ><b>Email</b></td>
				<td align="left"><%=bean.getEmail()%></td>
				<td height=30 width=10% align = "left"><b>Person's</b></td>
				<td align="left" width =50%><%=people%>명</td>
			</tr>
		</table>
		<table style= "margin-left:300px;" >
			<tr height =30></tr>
			<tr>
				<td height =30 width =40%><font color = brown>고객님이 예약하신 정보가 맞습니까?</font>
				</td>
			</tr>
		</table>
		<table style= "margin-left:250px;" >
		<tr>
			<td><input type = "hidden" name ="loginId" value = "<%=loginId %>"></td>
			<td><input type="hidden" name="chkIn" value="<%=chkIn%>"></td>
			<td><input type="hidden" name="chkOut" value="<%=chkOut%>"></td>
			<td><input type="hidden" name="roomPackage" value="<%=roomPackage%>"></td>
			<td><input type = "hidden" name = "price" value = "<%=price %>"></td>
			<% if(code.equals("null")){ %>
			<td><input type="submit" value="예약확인" style="width:130px; background-color: #E9DECA; border: 0; height: 30px;font-family: 'Nanum Myeongjo';'"></td>
			<td width = 50></td>
			<td><input type="reset" value="예약취소" style="width: 130px; background-color: #E9DECA; border: 0; height: 30px;font-family: 'Nanum Myeongjo';'"></td>
			<%}else{  %>
			<td>
			<input type="button" value="예약변경" onClick = "location.href='reservationChange.do?code=<%=code%>&loginId=<%=loginId%>&chkIn=<%=chkIn%>&roomPackage=<%=roomPackage %>&chkOut=<%=chkOut %>'" style="width:130px; background-color: #E9DECA; border: 0; height: 30px;font-family: 'Nanum Myeongjo';'"></td>
			<% } %>
			</tr>
		</table>
		<% 
		}catch(Exception ex){ }
		%>
		
		</form>
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>