<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.ta2 {
	width: 200px;
	padding: 5px;
	margin: 3px;
}

#rooms{
	min-height: 200px;
}
</style>

<script type="text/javascript">
	
	$(function() {
		$('#from').datepicker({
			numberOfMonths : 2,
			firstDay : 1,
			dateFormat : 'yy/mm/dd',
			minDate : '0',
			maxDate : '+2Y',
			onSelect : function(dateStr) {
				var min = $(this).datepicker('getDate');
				$('#to').datepicker('option', 'minDate', min || '0');
				datepicked();
			}
		});
		$('#to').datepicker({
			numberOfMonths : 2,
			firstDay : 1,
			dateFormat : 'yy/mm/dd',
			minDate : '0',
			maxDate : '+2Y',
			onSelect : function(dateStr) {
				var max = $(this).datepicker('getDate');
				$('#from').datepicker('option', 'maxDate', max || '+2Y');
				datepicked();
			}
		});
	});

	
	
	function datepicked(){
		var from = $('#from');
		var to = $('#to');
		var nights = $('#nights');
		var fromDate = from.datepicker('getDate')
		var toDate = to.datepicker('getDate')
		if (toDate && fromDate) {
			var difference = 0;
			var oneDay = 1000 * 60 * 60 * 24;
			var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay);
			nights.val(difference);
		}
	}
	
	var xhr = null;
	function move() {
		var indate = document.getElementById("from").value;
		var enddate = document.getElementById("to").value;
		var e = document.getElementById("roomtype");
		var op = e.options[e.selectedIndex].value;
		var numberOfMember = document.getElementById("numberOfMember").value;
		xhr = new XMLHttpRequest();
		var url = "searchRooms.do?inDate=" + indate + "&outDate=" + enddate + "&type=" + op + "&numberOfMember=" + numberOfMember;
		xhr.open("get", url, true);
		xhr.send(null);
		xhr.onreadystatechange = showForm;
	}
	function showForm() {
		if ((xhr.readyState == 4) && (xhr.status == 200)) {
			var ret = xhr.responseText;
			console.log(ret);
			document.getElementById("rooms").innerHTML = ret;
		}
	}
</script>

<script type="text/javascript">
	function toStep2(roomid) {
		var from = document.getElementById("from").value;
		var to = document.getElementById("to").value;
		var nights = document.getElementById("nights").value;
		var numberOfMember = document.getElementById("numberOfMember").value;
		location.href = "reservationStep2.do?roomid=" + roomid+"&from="+from+"&to="+to+"&nights="+nights+ "&numberOfMember=" + numberOfMember;

	}
	
</script>
</head>

<%
		String roomType = (String)request.getAttribute("roomType");
		String from = (String)request.getAttribute("from");
		String to = (String)request.getAttribute("to");
		String numberOfMember = (String)request.getAttribute("numberOfMember");
		String nights = (String)request.getAttribute("nights");
		
		String user = (String)session.getAttribute("user");
		if(user==null||user==""){
			System.out.println("usernull"+user);
			System.out.println("aaaaaa");
			%>
			<script type="text/javascript">
			alert("로그인 해야 애약가능 합니다");
			document.location = "index.jsp";
			</script>
			
			<%
		}
%>
<body>
	<div class="row">
			<div class="col-xs-4" style="color: orange; text-decoration: underline;">Step 1.<br>
				<font size="5">Select Rooms</font>
			</div>
			<div class="col-xs-4">Step 2.<br>
				<font size="5">Detail Room & Reservation</font>
			</div>
			<div class="col-xs-4">Step 3.<br>
				<font size="5">Complete Reservation</font>
			</div>
	</div>
	
	<div class="row">
			<div class="col-xs-2" >
				RoomType<br>
				Select Rooms
			</div>
			<div class="col-xs-2">
				Check_IN<br>
				Detail Room & Reservation
			</div>
			<div class="col-xs-2">
				Check_OUT<br>
				Complete Reservation
			</div>
			<div class="col-xs-2">
				Nights<br>
				Detail Room & Reservation
			</div>
			<div class="col-xs-2">
				number of member<br>
				Complete Reservation
			</div>
			<div class="col-xs-2">
			</div>
	</div>	
	<!--  
	RoomType
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Check_IN
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Check_OUT
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Nights
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	number of member
	<p>
	-->
	<p>
	<form name="form">
		<select id="roomtype">
		<% 
			if(roomType.equals("S")){			
		%>
			<option value="" >All</option>
					<option value="S"  selected="selected">S</option>
					<option value="A" >A</option>
					<option value="B" >B</option>
		<%		
			}
			else if(roomType.equals("A")){			
			%>
				<option value="" >All</option>
						<option value="S" >S</option>
						<option value="A" selected="selected">A</option>
						<option value="B" >B</option>
			<%		
				}
			else if(roomType.equals("B")){			
			%>
				<option value="" >All</option>
						<option value="S" >S</option>
						<option value="A" >A</option>
						<option value="B" selected="selected">B</option>
			<%		
				}
			else{
				
				%>
					<option value="" selected="selected" >All</option>
					<option value="S" >S</option>
					<option value="A" >A</option>
					<option value="B" >B</option>
				<%
				}
				%>	
		</select> 
	</form>
		<input type="text" id="from" name="from" class="ta2" value=<%=from %>> 
		<input type="text" id="to" name="to" class="ta2" value=<%=to %>>
		<input type="text" id="nights" name="nights" class="ta2" value=<%=nights%> >
		<input type="text" id="numberOfMember" name="numberOfMember" class="ta2" value=<%=numberOfMember %>> 
		<a onclick="move()"><input type="button" value="search"></a>
		
	<div id="rooms" ></div>
</body>
</html>