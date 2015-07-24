<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="room.vo.RoomVO"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>

	
</head>
<body>
	<%
		List list = (List)request.getAttribute("usableRooms");
	%>
	<table>
		<%
			for(int i=0;i<list.size();i++){
					RoomVO rvo=(RoomVO)list.get(i);			
				%>
		<tr>
					<td><%=rvo.getRoomID() %></td>
					<td><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>"></td>
					<td><%=rvo.getRoomInfo1() %></td>
					<td><input type="button" value="상세보기" onclick="toStep2(<%=rvo.getRoomID() %> )"></td>
		</tr>
		<%
			}
			if(list.size()==0){
		%>
			<div align="center">적합한 방이 없습니다.</div>
		<%		
				
			}
		
		%>
		
	</table>
	

</body>
</html>