<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="room.vo.RoomVO"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/room/roomlist.css" type="text/css" rel="stylesheet" />
<title>RoomList</title>
<style>
.vertical{
vertical-align: middle;
}
</style>
</head>

<body>
	<%
		List list = (List) request.getAttribute("roomList");
		RoomVO rvo = (RoomVO) list.get(0);
	%>
	<div class="roomlistnav">
		<div class="leftsidenav">
			<div class="side" >
				<h2 class="title">Accommodation</h2>

				<ul>
					<a href="select.do?type=S"><li>type S</li></a>
					<a href="DetailRoom.do?roomID=501"><li>501</li></a>
					<a href="DetailRoom.do?roomID=502"><li>502</li></a>
					<a href="DetailRoom.do?roomID=503"><li>503</li></a>
				</ul>
				<ul>
					<a href="select.do?type=A"><li>type A</li></a>
					<a href="DetailRoom.do?roomID=401"><li>401</li></a>
					<a href="DetailRoom.do?roomID=402"><li>402</li></a>
					<a href="DetailRoom.do?roomID=403"><li>403</li></a>
					<a href="DetailRoom.do?roomID=301"><li>301</li></a>
					<a href="DetailRoom.do?roomID=302"><li>302</li></a>
					<a href="DetailRoom.do?roomID=303"><li>303</li></a>
				</ul>
				<ul>
					<a href="select.do?type=B"><li>type B</li></a>
					<a href="DetailRoom.do?roomID=201"><li>201</li></a>
					<a href="DetailRoom.do?roomID=202"><li>202</li></a>
					<a href="DetailRoom.do?roomID=203"><li>203</li></a>
					<a href="DetailRoom.do?roomID=101"><li>101</li></a>
					<a href="DetailRoom.do?roomID=102"><li>102</li></a>
					<a href="DetailRoom.do?roomID=103"><li>103</li></a>
				</ul>
			</div><!-- <div class="side"> -->
		</div><!-- <div class="leftsidenav"> -->
	</div> <!--<div class="roomlistnave"> -->

	<table class="roomlist table table-striped">
		<%
			for (int i = 0; i < list.size(); i++) {
				rvo = (RoomVO) list.get(i);
				String roomid = rvo.getRoomID();
		%>
		<tr>
			<td>
				<img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%> " width="400" height="300">
			</td>
			<td style="vertical-align:middle;">
				<%=rvo.getRoomInfo1()%>
			</td>

			<td style="vertical-align:middle;">
			<input type="button" value="상세보기" onclick="location.href='DetailRoom.do?roomID=<%=roomid%>'">
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>