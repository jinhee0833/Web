<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
		@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
		td{font-family: 'Nanum Myeongjo'; font-size:15px;}
		a{text-decoration: none;color:#81725F;font-weight:bold; }
		input{font-family: 'Nanum Myeongjo';}
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		
		.facility{ position: absolute; top: 225px; margin-left: 0px; padding:0px; height:900px; width: 1759px; background-color: #ffffff;}
		#f{ position: absolute; margin-left: 200px; top: 30px; width: 10px; text-decoration:none; font-family: 'Nanum Myeongjo'; color:#81725F; font-size:45px; }
		#m{ position: absolute; margin-left: 500px; top: 40px; width: 900px; text-decoration:none; font-family: 'Nanum Myeongjo'; color:#81725F; }
</style>
<%
String id = loginId;
String code = request.getParameter("code");
%>
<script type = "text/javascript">
	function send(a, b, c){
		var msg1 = a + "-" +b+ "-" +c;
		var sday = document.search.chkIn.value;

		var sdate = new Date(sday);
		var edate = new Date(msg1);
		var aa = sdate.getTime();
		var bb = edate.getTime();
		var cc = Math.ceil((bb-aa)/(1000*60*60*24));


		if(document.search.chkIn.value != ""){
			if( aa >= bb) { 
				alert("체크아웃 날짜를 다시 선택해주세요!"); 
				document.search.chkOut.value = "";
			}else{
			document.search.chkOut.value = msg1;
			document.search.day.value = cc;
			}
		}if(document.search.chkIn.value == ""){
			document.search.chkIn.value = msg1;
		}
	}
	
	function cfind(id) {
		var chkIn=document.search.chkIn.value;
		var chkOut=document.search.chkOut.value;
		if(chkIn==""||chkIn==null ||chkOut==""||chkOut==null){ 
			alert("날짜를입력해주세요");
		}else {
			document.search.submit();
		}
	}
	
	function cfind(id) {
		var chkIn=document.search.chkIn.value;
		var chkOut=document.search.chkOut.value;
		if(chkIn==""||chkIn==null ||chkOut==""||chkOut==null){ 
			alert("날짜를입력해주세요");
		}else if(id==null||id=="null"){location="login.jsp"; alert("로그인을 해주셔야 예약이 가능합니다");
		}else {document.search.submit();}
	}
</script>
<%!
	private int j = 0;
	private int k = 0;
	private int currentYear = 0;
	private int currentMonth = 0;
	private int realCurrent = 0;
	private int realYear = 0;
	private int firstDay = 1;
	private int lastDay = 0;
	private int today = 1;
	private int nextMonth = 0;
	private int nextYear = 0;
	private int nextFirstDay = 0;
	private int nextLastDay = 0;
	%>
<%
	Calendar c = Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	Calendar nextCal = Calendar.getInstance();
	realCurrent = c.get(Calendar.MONTH);
	realYear = c.get(Calendar.YEAR);
	if (request.getParameter("action") == null) {
		j = 0;
		k = 0;
		currentMonth = cal.get(Calendar.MONTH);
		currentYear = cal.get(Calendar.YEAR);
		cal.set(currentYear, currentMonth, 1);
		lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);// 매달의 마지막 일자수 구하기
		firstDay = cal.get(Calendar.DAY_OF_WEEK);// 1일의 요일 구하기
		today = 1;
		if(realYear == currentYear && realCurrent == currentMonth){
			today = c.get(Calendar.DATE);
		} else {
			today = 1;
		}
		nextCal.set(currentYear, currentMonth, 1);
		nextCal.add(Calendar.MONTH, 1);
		nextMonth = nextCal.get(Calendar.MONTH);
		nextYear = nextCal.get(Calendar.YEAR);
		nextLastDay = nextCal.getActualMaximum(Calendar.DAY_OF_MONTH);
		nextFirstDay = nextCal.get(Calendar.DAY_OF_WEEK);
	} else {
		if (request.getParameter("action") != null) {
			currentMonth = Integer.parseInt(request
					.getParameter("month"));
			currentYear = Integer
					.parseInt(request.getParameter("year"));

			if (Integer.parseInt(request.getParameter("action")) == 1) {
				j = 0;
				k = 0;
				cal.set(currentYear, currentMonth, 1);
				cal.add(Calendar.MONTH, 1);
				currentMonth = cal.get(Calendar.MONTH);
				currentYear = cal.get(Calendar.YEAR);
				firstDay = cal.get(Calendar.DAY_OF_WEEK);// 1일의 요일 구하기
				lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);// 매달의 마지막 일자수 구하기
				today = cal.get(Calendar.DATE);

				nextCal.set(currentYear, currentMonth, 1);
				nextCal.add(Calendar.MONTH, 1);
				nextMonth = nextCal.get(Calendar.MONTH);
				nextYear = nextCal.get(Calendar.YEAR);
				nextLastDay = nextCal
						.getActualMaximum(Calendar.DAY_OF_MONTH);
				nextFirstDay = nextCal.get(Calendar.DAY_OF_WEEK);
			} else {
				j = 0;
				k = 0;
				cal.set(currentYear, currentMonth, 1);
				cal.add(Calendar.MONTH, -1);
				currentMonth = cal.get(Calendar.MONTH);
				currentYear = cal.get(Calendar.YEAR);
				lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);// 매달의 마지막 일자수 구하기
				firstDay = cal.get(Calendar.DAY_OF_WEEK);// 1일의 요일 구하기
				if(realYear == currentYear && realCurrent == currentMonth){
					today = c.get(Calendar.DATE);
				} else {
					today = 1;
				}

				nextCal.set(currentYear, currentMonth, 1);
				nextCal.add(Calendar.MONTH, 1);
				nextMonth = nextCal.get(Calendar.MONTH);
				nextYear = nextCal.get(Calendar.YEAR);
				nextLastDay = nextCal
						.getActualMaximum(Calendar.DAY_OF_MONTH);
				nextFirstDay = nextCal.get(Calendar.DAY_OF_WEEK);
			}
		}
		
	}
%>
</head>
<body>
	<div class="facility">
		<div id = "f" >
			STEP1
		</div>
		<%@ include file="sidebar.jsp"%>

		<div id = "m">
		<a href="layout.jsp">Home</a> > RESERVATION
		<h1>RESERVATION</h1>
		<table border=0 width=900px; >
		<tr>		
		<td align=center width=20% bgcolor=#F4EEE3 height=50>
		<a href="#">
		STEP 01<br>
		날짜 & 인원 선택
		</a>	
		</td>
		<td align=center width=20%>
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
		<table border=0 width=900;>
		<tr>
			<td>
				<form name = "search" method = "post" action="reservation.do" >
					<table >			
							<td colspan="2">
								<table>
								<tr height=15></tr>
								<tr>
								<td><font size=6px font color = #685845>날짜&인원 선택</font></td>					
								</tr><tr height=30></tr>
									<tr>
										<td>고객님이 원하시는 날짜를 클릭하면<br> 체크인, 체크아웃 날짜를 자동입력됩니다.
										</td>
									</tr>
									<tr height=30></tr>
									<tr>
										<td>체&nbsp;크&nbsp;인&nbsp;&nbsp;<input type="text" name="chkIn"  readonly >
										<input type = "reset" name = "재설정">
										</td>
									</tr>
									<tr height=5></tr>
									<tr>
										<td>체크아웃&nbsp;<input type="text" name="chkOut" readonly>
										</td>
									</tr>
									<tr height=5></tr>
									<tr>
										<td>숙박일수&nbsp;<input type="text" name="day">
										</td>
									</tr>
									
									<tr>
										<td>
										인&nbsp;&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;
										<select name = "people">
											<option value = 1 >1</option>
											<option value = 2 >2</option>
											<option value = 3 >3</option>
											<option value = 4 >4</option>
										</select>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table   style="margin-top:50px; margin-left:50px;">
									<tr align="left">
										<td align="center" width="20%">
											<%
											int sigan1 = realYear*10;
											int sigan2 = currentYear*10;
											sigan1 = sigan1 + realCurrent;
											sigan2 = sigan2 + currentMonth;
											if (sigan2 > sigan1) {
											%><a
											href="step1.jsp?month=<%=currentMonth-1%>&year=<%=currentYear%>&action=0"> < 
												</a> <%
			 	}
			 %>
										</td>
										<td align="left"><font style="font-family:'Nanum Myeongjo'; font-size:25px;">
										<%=currentYear%>.<%=currentMonth + 1%></font></td>
									</tr>
									<tr>
										<td colspan="2">
											<table  height = "200px">
												<tr>
													<td width="30"><font color=red>Sun</font></td>
													<td width="30">Mon</td>
													<td width="30">Thu</td>
													<td width="30">Wed</td>
													<td width="30">Thr</td>
													<td width="30">Fri</td>
													<td width="30">Sat</td>
												</tr>
												<tr>
													<%
														for (int i = 1; i < firstDay; i++) {
													%><td align="center">
														<%
															j++;
																out.println(" ");
														%>
													</td>
													<%
														}
													%>
													<%
														for (int i = 1; i < today; i++) {
															if (j % 7 == 0) {
																j = 0;
													%>
												</tr>
												<%
													}
														j++;
														out.println("<td align = center >" + i
																+ "</font></td>");
													}
												%>
												<%
													for (int i = today; i <= lastDay; i++) {
														if (j % 7 == 0) {
															j = 0;
												%>
												</tr>
												<%
													}
												%><td align="center " bgcolor=#F4EEE3 >
													<%
														j++;
													%><a href="javascript:send('<%= currentYear%>', '<%= currentMonth+1%>', '<%= i%>')"><%=i%></a><%
			 	
			 %>
												</td>
												<%
													}
												%>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table  style="margin-top:50px; margin-left:50px;">
									<tr align="right">
										<td algin="right"><font style="font-family:'Nanum Myeongjo'; font-size:25px;">
										<%=nextYear%>.<%=nextMonth + 1%></font></td>
										<td width="20%">
										<a href="step1.jsp?month=<%=currentMonth+1%>&year=<%=currentYear%>&action=1">></a>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<table  height = "200px">
												<tr>
													<td width="30"><font color=red>Sun</font></td>
													<td width="30">Mon</td>
													<td width="30">Thu</td>
													<td width="30">Wed</td>
													<td width="30">Thr</td>
													<td width="30">Fri</td>
													<td width="30">Sat</td>
												</tr>
												<tr>
													<%
														for (int i = 1; i < nextFirstDay; i++) {
													%><td align="center"  >
														<%
															k++;
																out.println(" ");
														%>
													</td>
													<%
														}
													%>
													<%
														for (int i = 1; i <= nextLastDay; i++) {
															if (k % 7 == 0) {
													%>
												</tr>
												<%
													}
												%><td align="center" bgcolor = #F4EEE3>
													<%
														k++;
													%>
													<a href="javascript:send('<%= nextYear%>', '<%= nextMonth+1%>', '<%= i%>')"><%=i%></a>
												</td>
												<%
													}
												%>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height=50></tr>
						<tr>
							<td><input type = "hidden" name = "code" value = "<%=code %>"></td>
							<td colspan="4" align="center"><input type="button" onClick = "cfind('<%=loginId%>')" value="검색"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		</table>
			
		
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>