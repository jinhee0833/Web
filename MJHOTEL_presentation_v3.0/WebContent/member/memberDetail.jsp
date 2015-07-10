<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>​
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.common.DBbean" %>
<html>
<head>
<title>memberDetail</title>
<link rel="stylesheet" type="text/css" href="member/css/member.css">
</head>
<body>
	<div id="member_center">
		<form name=signin method=get onsubmit="return check()" action=memberInsert.do>
		<table id=member_tableF>
			<tr>
				<%
					try{
					DBbean bb=(DBbean)request.getAttribute("detail");
				%>
				<td class="member_tr">
					&nbsp;id <%=bb.getId()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;pw <%=bb.getPw()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;이름 <%=bb.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;성별 <%=bb.getGender()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;생일 <%=bb.getBirth()%>
				<div id=member_hr></div>
				</td>
			</tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;주소  <%=bb.getAddr()%>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr>
				<td class="member_tr">
					&nbsp;이메일  <%=bb.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;연락처 <%=bb.getTel()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;멤버십가입여부 <%=bb.getMem()%>
				</td>
			</tr>
		</table><br>
		<div id=member_bottom>
			<a href="memberEditPre.do?id=<%=bb.getId() %>"><input type=button value="수정하기" class="member_bt2"></a>
		</div>
		</form>
	</div>
<%
	}catch(Exception e){  System.out.println("edit 오류 : "+e.toString());}
%>	
</body>
</html>