<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="reservation.common.revDBbean" %>
<%@ page import="reservation.common.revDBsql" %>
<%@ page import="reservation.common.roomDBbean" %>
<html>
<head><title>reservation_Check</title>
<link rel="stylesheet" type="text/css" href="reservation/css/reservation.css">
</head>
<body>
<div id="reF">
	<div id="re_title2">예약확인</div>
<%
String id = (String)session.getAttribute("NowUser");
if(id==null){
%>	
	<div align=center style="margin-top:200px;">
		<font size=3 color=orange ><b>로그인을 하셔야 방검색이 가능합니다.</b></font><br>
	</div>
<%	
}else{

try{	
	String ok = (String)request.getAttribute("ok");
	if(ok.equals("noData")){
%>
	<div align=center style="margin-top:200px;">
		<font size=3 color=red ><b> 예약하신 방이 없습니다. </b></font><br>
		<a href='./index.jsp?page=reservation/m_reservation&list=reservation_Step1'><input type=button value="확인" class="bt2"></a> 
	</div>	
<%	
	}// if end
	else if(ok.equals("ok")){
		List revlist = (List)request.getAttribute("revlist");
		String type="";
		/* =(String)request.getAttribute("TYPE"); */
%>

	<div align=center style="margin-top:30px;"></div>
	<table id="re_tableF5">
	<tr class="re_tableB">
		<td>예약날짜</td>
		<td>체크인</td>
		<td>체크아웃</td>
		<td>숙박일수</td>
		<td>가격</td>
		<td>방종류</td>
		<td>호실</td>
		<td>삭제</td>
	</tr>
<%
		for(int i=0 ; i<revlist.size() ; i++) {	
			revDBbean bean = (revDBbean)revlist.get(i);
			 
			 bean.getRevId();
			 bean.getRevCap();
			 bean.getRevCost();
			 bean.getRevDate();
			 bean.getRevIn();
			 bean.getRevMember();
			 bean.getRevOut();
			 bean.getRevRoomID();
			 bean.getRevTerm();
			 
		 	if(bean.getRevCost()==100000){type="Superior";}
			else if(bean.getRevCost()==200000){type="Premier";}
			else if(bean.getRevCost()==500000){type="Florence";}
			else if(bean.getRevCost()==1000000){type="Royal";}
			else if(bean.getRevCost()==3000000){type="Presidential";}
			 
%>
	<tr>
		<td><%=bean.getRevDate() %></td>
		<td><%=bean.getRevIn() %></td>
		<td><%=bean.getRevOut() %></td>
		<td><%=bean.getRevTerm() %></td>
		<td><%=bean.getRevCost()*bean.getRevTerm() %></td>
		<td><%=type %></td>
		<td><%=bean.getRevRoomID() %></td>
		<td><a href="index.jsp?page=reservation/m_reservation&list=reservation_Delete&revID=<%= bean.getRevId()%>&RevCap=<%= bean.getRevCap()%>&revCost=<%=bean.getRevCost()*bean.getRevTerm() %>&revDate=<%=bean.getRevDate() %>&revIn=<%=bean.getRevIn() %>&revOut=<%=bean.getRevOut() %>&revRoomID=<%=bean.getRevRoomID() %>&revTerm=<%=bean.getRevTerm() %>&type=<%= type%>&id=<%=id %>"><input type="button" value="예약취소" class="bt"></a></td>
	</tr>
<%			
		}// for end
%>
</table>
<%
		}// else end
	}catch(Exception ex){}
}
%>
</div>
</body>
</html>