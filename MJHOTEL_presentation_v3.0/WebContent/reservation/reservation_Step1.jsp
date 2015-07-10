<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="reservation.common.roomDBbean"%>
<%!
private String checkIn;
private String checkOut;
private List revOkRoom;
private List revOkType;
private int revPop;
private int revCap;
private int room;
private String roomType;
%>
<html>
<head>
<title>reservation_Step1</title>
<link rel="stylesheet" type="text/css" href="reservation/css/reservation.css">
<!-- 날짜선택 J Query IMPORT-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- 날짜선택 J Query IMPORT 종료-->

<script type="text/javascript">
	/* 날짜선택 J Query SCRIPT */
	$(function() {
      $('#from').datepicker({
        numberOfMonths: 2, 
        firstDay: 1,
            dateFormat: 'yy/mm/dd', 
            minDate: '0', 
            maxDate: '+2Y',
                  onSelect: function(dateStr) {
                        var min = $(this).datepicker('getDate');
                        $('#to').datepicker('option', 'minDate', min || '0');
                        datepicked();
            }});
      $('#to').datepicker({
        numberOfMonths: 2, 
        firstDay: 1,
            dateFormat: 'yy/mm/dd', 
            minDate: '0', 
            maxDate: '+2Y',
                  onSelect: function(dateStr) {
                        var max = $(this).datepicker('getDate');
                        $('#from').datepicker('option', 'maxDate', max || '+2Y');
                        datepicked();                                                
            }});
});
  
var datepicked = function() {
 var from = $('#from');
    var to = $('#to');
    var nights = $('#nights');
 
     var fromDate = from.datepicker('getDate')
 
        var toDate = to.datepicker('getDate')
 
        if (toDate && fromDate) {
        var difference = 0;
            var oneDay = 1000*60*60*24; 
            var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay); 
            nights.val(difference);
            } 
}

	/* 날짜선택 J Query SCRIPT 종료 */
	
	/* 호텔 선택시 이미지 떨어지는 부분 */
	function selectEvent(select_Hotel) {
		var image = document.getElementById("image");
		if(image)
			document.getElementById('bc').removeChild(image);
	
		img_add = document.createElement("img"); 
		img_add.setAttribute("id", "image");
		
		if(select_Hotel.value=="1"){
			img_add.setAttribute("src", "reservation/images/Seoul1.jpg"); 
		}
		else if(select_Hotel.value=="2"){
			img_add.setAttribute("src", "reservation/images/jeju1.jpg"); 
		}
		document.getElementById('bc').appendChild(img_add);
		
	}
	/* 종료 */
	
</script>

</head>
<body>
<div id="reF">
	<div id="re_title2">예약하기</div>
	<!-- 상단 메뉴 -->
	<table id="re_tableF">
		<tr height=50 align="left">
			<td width="35%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step1" style="color:orange;">Step 1.<br><font size="5">Select Hotel & Detail</font></a></td>
			<td width="25%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step2">Step 2.<br><font size="5">Select Rooms</font></a></td>
			<td width="40%" class="re_tableF_td"><a href="./index.jsp?page=reservation/m_reservation&list=reservation_Step3">Step 3.<br><font size="5">Complete Reservation</font></a></td>
		</tr>
	</table>	
	<!-- SELECT HOTEL & DATE -->
	<form name=R_Select method=get action=revStep1.do>
		<table id="re_tableF2">
		<tr>
			<td width="60%" class="re_tableF2_td">
				<span>1. SELECT CHOICE</span>
				<select id="Select H" name="Select H" onChange="selectEvent(this)" class="ta">
					<option value="1" >SEOUL MJ HOTEL</option>
					<option value="2">JEJU MJ HOTEL</option>
				</select>
				<div id="bc" class="img1"></div>
			</td>
			<td width="40%" class="re_tableF2_td">
				<span>2. SELECT RANGE</span><br>
			  	<ul>
					<li class="re_tableF2_li">Check_IN</li>							
					<li><input type="text" id="from" name="from" value=<%= (String)request.getAttribute("checkIn") %> class="ta2"></li>
					<li class="re_tableF2_li">Check_OUT</li>
					<li><input type="text" id="to" name="to" value=<%= (String)request.getAttribute("checkOut") %> class="ta2"></li>
					<li class="re_tableF2_li">No Of Nights</li>
					<li><input type="text" id="nights" name="nights" value=<%= (Integer)request.getAttribute("revPop") %> readonly="readonly" class="ta2"></li>
					<li class="re_tableF2_li">Number Of Guest</li>
					<li><select name="Guests" class="ta3">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="25">25</option>
							<option value="30">30</option>
						</select>
						<input type="submit" value="Search" class="bt2">
					</li>	
				</ul>	
			</td>
		</tr>
		</table>
	</form>
	<!-- SELECT HOTEL & DATE END-->
<%
	try{	
		String ok = (String)request.getAttribute("ok");
		if(ok.equals("noData")){
%>
	
	<div align=center style="margin-top:200px;">
		<font size=3 color=orange >
			<b>죄송하지만, 귀하께서 선택하신 날짜에 예약가능한 방이 없습니다.<br>
			날짜를 변경하여 다시 검색해 주시기를 바랍니다.
			저희 MJ 호텔을 이용해 주셔서 대단히 감사합니다.
			</b>
		</font><br>
		<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'><input type=button value="예약 다시하기" class="bt2"></a> 	
	</div>
<%
	}//if
	else {
	revOkRoom = (List)request.getAttribute("revOkRoom");
	revOkType = (List)request.getAttribute("revOkType");
	checkIn = (String)request.getAttribute("checkIn");
	checkOut = (String)request.getAttribute("checkOut");
	revPop = (Integer)request.getAttribute("revPop");
	revCap = (Integer)request.getAttribute("revCap");
%>	
<table id="re_tableF2">
	<tr>
	<td  class="re_tableF2_td"><span>3. SELECT ROOM</span></td>
	</tr>
</table>
<%
	for(int i=0 ; i<revOkType.size() ; i++) {	
		roomDBbean bean = (roomDBbean)revOkType.get(i);
		  String thumb = bean.getRoomThumb();
		  String type = bean.getRoomType() ;
		  int roomId = bean.getRoomID();
		  int Cost = bean.getRoomCost();
		  int Cap = bean.getRoomCap();
		  String info1 = bean.getRoomInfo1().replaceAll("\r\n", "<br>");
		  String info2 = bean.getRoomInfo2().replaceAll("\r\n", "<br>");
		  String info3 = bean.getRoomInfo3().replaceAll("\r\n", "<br>");
%>
	<table id="re_tableF3">
		<tr>
			<td width="50%">
				<img src='<%=request.getContextPath()%>/reservation/images/<%=thumb%>'>
			</td>	
			<td width="50%" class="re_tableF3_td1">
				<ul>
					<li><font color="#6e6464;" size="6"><%=type%></font></li>
					<hr>
					<li>호실 : <%=roomId%></li>
					<li>가격 : <%=Cost%></li>
					<li>수용인원 : <%=Cap%></li>		
					<li><a href='index.jsp?page=reservation/m_reservation&list=reservation_Step2&roomID=<%=bean.getRoomID()%>&in=<%=checkIn%>&out=<%=checkOut%>&revPop=<%=revPop %>&roomCost=<%=Cost %>&revCap=<%=revCap %>' >
					<input type=button value="방 선택" class="bt2"></a></li>			
				</ul>
			</td>
		</tr>
		<tr>	
			<td colspan="2" class="re_tableF3_td2"><p>정보 : <%=info1%><%=info2%><%=info3%></p></td>
		</tr>
	</table>	
	<hr>
<%
		}//for
	}//else
}catch(Exception ex){System.out.println("표현식 오류 : "+ex.toString());}
%>
	
</div>
</body>
</html>

