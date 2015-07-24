<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="room.vo.RoomVO"%>
<html>
<head>
	<meta  charset="UTF-8">
	<title>Insert title here</title>
</head>

<script type="text/javascript" src="js/room/formpop.js"></script>

	<script type="text/javascript">
			var xhr= null;	
		
			function send(num){
				xhr = new XMLHttpRequest();	
				var url ="UpdateController.do?roomId="+num+"&dt=1";
				xhr.open("get", url, true);
				xhr.send(null);
			
				xhr.onreadystatechange = showForm;
				alert("1");
			}// send end
			
			function showForm(){
				if((xhr.readyState == 4) && (xhr.status == 200)){
					var ret = xhr.responseText;
					console.log(ret);
					document.getElementById("for").innerHTML = ret;
					//document.getElementByClassName("form").innerHTML = ret;
					
					
				}
			}// end showForm
	</script>
	<style>
	td{
	text-align: center;
	}
	</style>

<body>

	<table class="table table-striped">
	
		<tr>
			<td>RoomID</td>
			<td></td>
			<td>Type</td>
			<td>Cost</td>
			<td>Capacity</td>
			
			<td>Update</td>
		</tr>
		
		<%
			List list = (List)request.getAttribute("roomList");
			
			for(int i=0;i<list.size();i++){
				RoomVO rvo = (RoomVO)list.get(i);
		%>		
			<tr>
				<td><div id="roomID" ><%=rvo.getRoomID() %></div></td>
				<td><img src="<%=request.getContextPath() %>/images/room/<%= rvo.getRoom1() %>" width="200" height="150"></td>
				<td><%=rvo.getRoomType() %></td>
				<td><%=rvo.getRoomCost() %> 원</td>
				<td><%=rvo.getRoomCap() %></td>
				<td><a href="#bottom" id="top" onclick ="send(<%=rvo.getRoomID() %>)" ><input type="button" value="수정"></a></td>
				
			</tr>
		<%		
			}
		%>
		
	</table>

	<div id= "for" class="popup">

		
	</div>

</body>
</html>