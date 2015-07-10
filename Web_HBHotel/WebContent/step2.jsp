<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import ="net.hb.common.DBRoomBean" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
		a{ text-decoration:none;}
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		
		.facility{
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;}
		
		#f{
			position: absolute;
			margin-left: 200px; 
			top: 30px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
		#m{
			position: absolute;
			margin-left: 500px; 
			top: 40px;
			width: 900px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
		}
</style>
</head>
<body>
	<%try{
		int people = Integer.parseInt(request.getParameter("people"));
		int day= Integer.parseInt(String.valueOf(request.getParameter("day")));
		String chkIn = String.valueOf(request.getAttribute("chkIn"));
		String chkOut = String.valueOf(request.getAttribute("chkOut"));
		String code = String.valueOf(request.getAttribute("code"));
		List room = (List)request.getAttribute("roomInfo");
		DBRoomBean standard = (DBRoomBean)room.get(0);
		DBRoomBean sweet = (DBRoomBean)room.get(1);
		DBRoomBean royal = (DBRoomBean)room.get(2);
		%>
		
	<div class="facility">
	<div id = "f" >
			STEP2
		</div>
	<%@ include file="sidebar.jsp"%>
		<div id = "m">
		<a href="layout.jsp">Home</a> > RESERVATION
		<h1>RESERVATION</h1>
		<table border=0 width=900px; >
		<tr>		
		<td align=center width=20% height=50>
		<a href="#">
		STEP 01<br>
		날짜 & 인원 선택
		</a>	
		</td>
		<td align=center width=20% bgcolor=#F4EEE3 >
		STEP 02<br>
		객실 선택
		</td>
		<td align=center width=20% >
		STEP 03<br>
		선택 객실 확인
		</td>
		<td align=center width=20%>
		STEP 04<br>
		완료 & 확인
		</td>
		</tr>
		<tr>
		<td colspan=5>
		</td>
		</tr>		
		</table>
		<table border=0 width=700;>
		<tr>
			<td valign=top>
			 <table border=0 width=900px; align=center class = "step2">
		<tr>
		<td colspan=3><hr></td>
		</tr>
		<tr>
		<td colspan=3 bgcolor=#F4EEE3><font color=#81725F size=5>STANDARD ROOM</font></td>
		</tr>
		<tr>
			<td width=210 rowspan=3>
			<img src="images/sp3.jpg" width=200>
			</td>	
			<td colspan=2>
			객실크기 : 36㎡
			</td>		
		</tr>
		<tr>
			<td>
			360,000~
			</td>
			<td><%=360*day %>,000 원/ <%=day%>박</td>
		</tr>
		
		<tr>
		<% if(standard.getRoomPackageCount() < 3){ %>
		<td><a href="standard.jsp" target="_blank">상세보기</a></td>
		<td><a href='userdetail.do?userid=<%=loginId %>&roomPackage=1&chkIn=<%=chkIn%>&chkOut=<%=chkOut%>&day=<%=day%>&people=<%=people%>&code=<%=code%>&price=<%=360000*day%>'>선 택</a></td>
		<%}else{ %>
		<td><a href="standard.jsp" target="_blank">상세보기</a></td>
		<td><font color=red style="font-weight:bold;">선 택 불 가</font></td>
		<% } %>
		</tr>
		
		<tr>
		<td colspan=3><hr></td>
		</tr>
		
		<tr>
		<td colspan=3 bgcolor=#F4EEE3><font color=#81725F size=5>SUITE ROOM</font></td>
		</tr>
		<tr>	
			<td rowspan=3>
			<img src="images/s5.jpg" width=200>
			</td>
			<td colspan=2>
			객실크기 : 43㎡
			</td>
		</tr>
		<tr>
			<td>
			410,000~
			</td>
			<td><%=410*day %>,000 원/ <%=day%>박</td>
		</tr>
		
		<tr>
		<% if(sweet.getRoomPackageCount() < 3){ %>
		<td><a href="sweet.jsp" target="_blank">상세보기</a></td>
		<td><a href='userdetail.do?userid=<%=loginId %>&roomPackage=2&chkIn=<%=chkIn%>&chkOut=<%=chkOut%>&day=<%=day%>&people=<%=people%>&code=<%=code%>&price=<%=410000*day%>'>선 택</a></td>
		<%}else{ %>
		<td><a href="sweet.jsp" target="_blank">상세보기</a></td>
		<td><font color=red style="font-weight:bold;">선 택 불 가</font></td>
		<% } %>
		</tr>
		
		<tr>
		<td colspan=3><hr></td>
		</tr>
		
		<tr>
		<td colspan=3 bgcolor=#F4EEE3><font color=#81725F size=5>ROYAL ROOM</font></td>
		</tr>
		<tr>			
			<td rowspan=3>
			<img src="images/e2.jpg" width=200>
			</td>
			<td colspan=2>
			객실크기 : 53㎡
			</td>
		</tr>
		<tr>
			<td>
			560,000~
			</td>
			<td><%=560*day %>,000 원/ <%=day%>박</td>
		</tr>	
		
		<tr>
		<% if(royal.getRoomPackageCount() < 3){ %>
		<td><a href="royal.jsp" target="_blank">상세보기</a></td>
		<td><a href='userdetail.do?userid=<%=loginId %>&roomPackage=3&chkIn=<%=chkIn%>&chkOut=<%=chkOut%>&day=<%=day%>&people=<%=people%>&code=<%=code%>&price=<%=560000*day%>' >선 택</a></td>
		<%}else{ %>
		<td><a href="royal.jsp" target="_blank">상세보기</a></td>
		<td><font color=red style="font-weight:bold;">선 택 불 가</font></td>
		<% } %>
		</tr>
		
		<tr>
		<td colspan=3><hr></td>
		</tr>
			
		</table>
			</td>
		</tr>
		</table>
			
		
		</div>
	</div>
	<%}catch(Exception e){}
		%>
</body>
<%@ include file="bottom.jsp"%>
</html>