<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="room.vo.RoomVO"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>step 2 detail</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="../js/reservation/jquery.skitter.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
   		$(".thumbs a").click(function(){	
   			console.log("in skitter function");
   			var path = $(this).attr("href");
   			console.log("path:"+path);
   			$(this).parent().prev().find("img").attr({ src: path });
   			$(this).parent().prev().find("img").css("opacity","0.5").stop().animate({opacity:2},4000);
   			return false;
   		});		
  	});	
</script>
	<style>
	#largeImg {
		width: 740px;
		border: solid 5px #ccc;
	}
	#largeImg img{
		width:740px;
		height:490px;
	}
	.thumbs {
		margin-top:20px;
	}
	.thumbs a{
		margin-right: 20px;
	}
	.thumbs img {
		border: solid 5px #ccc;
		margin-top:3px;
		margin-bottom:3px;
		width:140px;
		height:80px;
	}
	.thumbs img:hover {
		border-color: #0099FF ;
	}
	</style>
</head>
<body>
	<table id="re_tableF">
		<tr height=50 align="left">
			<td width="35%" class="re_tableF_td"><a>Step 1.<br><font size="5">Select Rooms</font></a></td>
			<td width="25%" class="re_tableF_td"><a style="color:orange; text-decoration: underline;">Step 2.<br><font size="5">Detail Room & Reservation</font></a></td>
			<td width="40%" class="re_tableF_td"><a >Step 3.<br><font size="5">Complete Reservation</font></a></td>
		</tr>
	</table>

		<%
			RoomVO rvo = (RoomVO)request.getAttribute("detailRoom");
			String from = (String) request.getAttribute("from");
			String to = (String) request.getAttribute("to");
			String nights = (String) request.getAttribute("nights");
			String member = (String) request.getAttribute("member");
			String RoomID = rvo.getRoomID();
			int Cap = rvo.getRoomCap();
			int Cost = rvo.getRoomCost();
			
		%>
		
		<form action="insertRooms.do">
			<input type="hidden" name="member" value="<%=member%>">
			<input type="hidden" name="cap" value="<%=Cap%>">
			<input type="hidden" name="cost" value="<%=Cost%>">
			<input type="hidden" name="roomId" value="<%=RoomID%>">
			<input type="hidden" name="nights" value="<%=nights%>">
			<input type="hidden" name="to" value="<%=to%>">
			<input type="hidden" name="from" value="<%=from%>">
		
			<div id="largeImg"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" alt="image1"></div>
			
			
			
				
					<div class="thumbs">
        				<a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" title="image1"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" /></a>
       					 <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom2()%>" title="image2"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom2()%>" /></a>
       					 <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom3()%>" title="image3"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom3()%>" /></a>
       					 <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom4()%>" title="image4"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom4()%>" /></a>
    </div>
		
		<table>
			
			
					
				
		
			<tr>
				<td>Number</td>
				<td>CheckIn</td>
				<td>CheckOut</td>
				<td>Term</td>
				<td>Capacity</td>
				<td>Cost</td>
			</tr>
			<tr>
				<td><%=RoomID%></td>
				<td><%=from %></td>
				<td><%=to %></td>
				<td><%=nights %></td>
				<td><%=Cap%></td>
				<td><%=Cost%></td>
			</tr>
			<tr>
				<td  colspan="5">
					<%=rvo.getRoomInfo1() %>
				</td>
			</tr>
			<tr>
				<td  colspan="5">
				<%=rvo.getRoomInfo2() %>
				</td>
			</tr>
			<tr>
				<td  colspan="5">
				<%=rvo.getRoomInfo3() %>
				</td>
			</tr>
			<tr>
				<td  colspan="5">
				<textarea rows="5" cols="20" name="comment"></textarea>
				</td>
			</tr>
			
			<td><input type="submit" value="예약하기" ></td>
		
	</table>
	</form>

</body>
</html>