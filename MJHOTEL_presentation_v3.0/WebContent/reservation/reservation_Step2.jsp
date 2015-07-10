<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page session="true"%>
<html>
<head>
<title>reservation_Step2</title>
<%
String Room_ID = request.getParameter("roomID");
String C_IN = request.getParameter("in");
String C_OUT = request.getParameter("out");
String No_Of_Nights = request.getParameter("revPop");
String revCap = request.getParameter("revCap");
String Cost = request.getParameter("roomCost");
%>
<script type="text/javascript">
</script>	
</head>
<div id="reF">
	<div id="re_title2">예약하기</div>
	<!-- 상단 메뉴 -->
	<table id="re_tableF">
		<tr height=50 align="left">
			<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1">Step 1.<br><font size="5">Select Hotel & Detail</font></a></td>
			<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2" style="color:orange;">Step 2.<br><font size="5">Select Rooms</font></a></td>
			<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3">Step 3.<br><font size="5">Complete Reservation</font></a></td>
		</tr>
	</table>
<script type="text/javascript">			
	function info(){	
		alert("로그인 후 이용하시기 바랍니다."); 			
	}
</script>
<%
if(session.getAttribute("NowUser")==null){
%>
</div>
<body onLoad="info()">
<%
  } else { String id=(String)session.getAttribute("NowUser"); 
%>
<br><br>
  	<table id="re_tableF4">
  		<tr>
  			<td colspan="2"><div class="ta4"><%=id %> 님의 예약 정보는 아래와 같습니다.</div></td>
  		</tr>
  		<tr>
  			<td class="re_tableF4_td1">Check-IN</td><td class="re_tableF4_td2"><%= C_IN %></td>
  		</tr>
  		<tr>	
  			<td class="re_tableF4_td1">Check-OUT</td><td class="re_tableF4_td2"><%= C_OUT %></td>
  		</tr>
  		<tr>	
  			<td class="re_tableF4_td1">No.Of.Nights</td><td class="re_tableF4_td2"><%= No_Of_Nights %></td>
  		</tr>
  		<tr>	
  			<td class="re_tableF4_td1">No.Of.Guests</td><td class="re_tableF4_td2"><%= revCap %></td>
  		</tr>
  		<tr>	
  			<td class="re_tableF4_td1">Room No</td><td class="re_tableF4_td2"><%= Room_ID %></td>
  		</tr>
  		<tr>
  			<td class="re_tableF4_td1">Room Cost</td><td class="re_tableF4_td2"><%= Cost %></td>
  		</tr>
  	</table>
  	
	<div align=center style="margin-top:50px;">
	<a href='revStep2.do?revMember=<%=id%>&revRoomID=<%=Room_ID %>&revCost=<%=Cost %>&revCap=<%=revCap %>&in=<%=C_IN%>&out=<%=C_OUT%>&revTerm=<%=No_Of_Nights %>'>
	<input type=button value="최종예약" class="bt2"></a>
	</div>
<%			
  }
%>
</body>
</html>
