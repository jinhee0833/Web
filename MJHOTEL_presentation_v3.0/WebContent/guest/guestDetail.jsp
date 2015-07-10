<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_re" %>
<%@ page import="guest.common.DBbean_co" %>
<html>
<head>
<title>guestDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
<body>
<%
try{
	String id=(String)session.getAttribute("NowUser");
	DBbean_re bb=(DBbean_re)request.getAttribute("detail");
	List data=(List)request.getAttribute("colist");
%>
<div id="adminF">
	<div id="adminF2">
		<div id="admin_title2">이용후기</div>
		<table id="admin_tableF">
			<tr class="admin_tableB">
				<td width=10%>NO</td>
				<td width=30%>TITLE</td>
				<td width=20%>NAME</td>
				<td width=20%>DATE</td>
				<td width=10%>HIT</td>
				<td width=10%>LIKE</td>
			</tr>
			<tr>
				<td><%= bb.getNum() %></td>
				<td><%= bb.getTitle() %></td>
				<td><%= bb.getWriter() %></td>
				<td><%= bb.getWdate() %></td>
				<td style="color:#ff6600"><%=bb.getCount() %></td>
				<td><%=bb.getReco() %>
					<a href="guestDetail.do?num=<%=bb.getNum() %>&reco=<%=bb.getReco()%>">
					<img src="guest/images/like.jpg" width=30px height=24px style="vertical-align: middle;"></a>
				</td>
			</tr>
		</table>	
		<div id="admin_contents"><%=bb.getContents( ).replaceAll("\r\n", "<br>")%></div>
		
		<!-- 버튼 -->	
		<div id="admin_bottom">
			<a href='guest.do'><input type='button' value="목록" class="bt"></a>
			<a href="guestDelete.do?num=<%=bb.getNum()%>"><input type="button" value="삭제" class="bt"></a>
		</div>
<%
}catch(Exception ex){   }
%>
</div>	
</body>
</html>