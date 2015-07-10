<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.hb.common.DBRoomBean"%>
<%!
	private int total;
	private int totalPage;
	private int start;
	private int startPage;
	private int pageSize;
	private int pageNum;
	private int limit;
	private String month;
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css"
	media="screen">
<style>
A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
}

A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
	color: black;
}

.facility {
	position: absolute;
	top: 225px;
	margin-left: 0px;
	padding: 0px;
	height: 900px;
	width: 1759px;
	background-color: #ffffff;
}

#f {
	position: absolute;
	margin-left: 200px;
	top: 50px;
	width: 10px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
	font-size: 45px;
}

#m {
	position: absolute;
	margin-left: 500px;
	top: 50px;
	width: 1100px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
}
</style>
</head>
<body>
	<div class="facility">

		<%@ include file="managerbar.jsp"%>
		<div id="f">MANAGER</div>

		<div id="m">
			<a href="layout.jsp">Home</a> > MANAGER
			<h1>MANAGER</h1>
			
			<%
				try {
					List data = (List) request.getAttribute("list");
					total = Integer.parseInt(String.valueOf(request.getAttribute("total")));
					totalPage = Integer.parseInt(String.valueOf(request.getAttribute("totalPage")));
					start = Integer.parseInt(String.valueOf(request.getAttribute("start")));
					startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
					limit = Integer.parseInt(String.valueOf(request.getAttribute("limit")));
					pageSize = Integer.parseInt(String.valueOf(request.getAttribute("pageSize")));
					month = String.valueOf(request.getAttribute("month"));
			%>

			<table width=700 border=0>
				<tr>
					<td align="left">
					<form action="manager.do">				
							<b>예약 현황</b>
							<select name='month'>
								<option value=""> 전 체 </option>
								<option value="01"> 1 월 </option>
								<option value="02"> 2 월 </option>
								<option value="03"> 3 월 </option>
								<option value="04"> 4 월 </option>
								<option value="05"> 5 월 </option>
								<option value="06"> 6 월 </option>
								<option value="07"> 7 월 </option>
								<option value="08"> 8 월 </option>
								<option value="09"> 9 월 </option>
								<option value="10"> 10 월 </option>
								<option value="11"> 11 월 </option>
								<option value="12"> 12 월 </option>
							</select>
						<input type='submit' value='검색'>							
					</form>
					
					</td>
				</tr>
			</table>
			<table width=700 border=0>
				<tr>
					<td colspan=6 align='right'><%=month %>월 총 예약 : <%=total%>
					</td>
				</tr>

				<tr height="35" align="center" bgcolor=#81725F>
					<td width=10%>Room</td>
					<td width=35%>Check-in</td>
					<td width=35%>Check-out</td>
					<td width=20%>Code</td>
				</tr>
			</table>

			<table width=700 border=0>
				<%
				
					if(total != 0){
						for (int i = start; i < start+limit; i++) {
							if(i == data.size()){
								break;
							}
							DBRoomBean bean = (DBRoomBean) data.get(i);
					%>
					<tr height='30'>
						<td align="center" width=10%><%=bean.getMroom()%></td>
						<td align="center" width=35%><%=bean.getMin()%></a></td>
						<td align="center" width=35%><%=bean.getMout()%></td>
						<td align="center" width=20%><%=bean.getMcode()%></td>

					</tr>
					<%
						}// for	
					} else {
				%>
				<tr height='30'>
					<td align="center" colspan=4>예약없음</td>
				</tr>
				<%}%>
				<tr height='50'>
					<td colspan=6 align='center'>
					<%
						if (startPage > pageSize) {
							out.println("<a href = manager.do?pageNum="
									+ (startPage - pageSize) + "&month="+month+">[이전]" + "</a>");
						}
						for (int i = startPage; i < (startPage + pageSize); i++) {
							if (i == pageNum) {
								out.println("<font color =red> [" + i + "]</font> ");
							} else {
								out.println("<a href = manager.do?pageNum=" + i +  "&month="+month+">" + i
										+ "</a>");
							}
							if (i == totalPage) {
								break;
							}
						}
						if (pageSize <= totalPage - startPage) {
							out.println("<a href = manager.do?pageNum="
									+ (startPage + pageSize) + "&month="+month+">[다음]" + "</a>");
						}
					%>
				</td>
				</tr>
			
			</table>
			<%
			} catch (Exception ex) {
				System.out.println(ex.toString());
			}
				%>
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>