<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="reservation.vo.ReservationVO"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<table class="table table-striped">
	<tr>
		<td>Reservation No</td>
		<td>Member ID</td>
		<td>Reserved Room</td>
		<td>Cost</td>
		<td>Number of Guests</td>
		<td>CheckIn-date</td>
		<td>CheckOut-date</td>
		<td>Term</td>
		<td>regist Date</td>
		<td>comment</td>
		<td>delete</td>
	</td>
	</tr>
	<%
	List list = (List) request.getAttribute("myReservation");
			for (int i = 0; i < list.size(); i++) {
				ReservationVO revo = (ReservationVO) list.get(i);
				//String roomid = revo.getRoomID();
		%>
		<tr>
			<td><%=revo.getRevID() %></td>
			<td><%=revo.getRevMemberID() %></td>
			<td><%=revo.getRevRoomID() %></td>
			<td><%=revo.getRevTotalCost() %></td>
			<td><%=revo.getRevNumberGuest() %></td>
			<td><%=revo.getRevIn() %></td>
			<td><%=revo.getRevOut() %></td>
			<td><%=revo.getRevTerm() %></td>
			<td><%=revo.getRevDate()%></td>
			<td><%=revo.getRevComment() %></td>
			<td><input type="button" value="Delete" onclick="location.href='deleteReservation.do?revId=<%=revo.getRevID()%>'"></td>
		</tr>
		
		<%
			}
		%>
		
	</table>
</body>
</html>