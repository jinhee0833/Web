<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.vo.*, member.dao.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberDetail</title>
<link rel="stylesheet" type="text/css" href="member/css/member.css">

</head>
<body>
<%
	try{
	DBbean bean = (DBbean) request.getAttribute("detail");
%>
	<div id="member_center">
		<form name="detail" method="get" action="toEditController.do?id=<%=bean.getId()%>">

		<input type="hidden" name="id" value="<%=bean.getId()%>"> 
		<table id=member_tableF>
			<tr>
				<td class="member_tr">
					&nbsp;id <%=bean.getId()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;이름 <%=bean.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;생일 <%=bean.getBirth().substring(0,10)%>
				<div id=member_hr></div>
				</td>
			</tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;주소  <%=bean.getAddr()%>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr>
				<td class="member_tr">
					&nbsp;이메일  <%=bean.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;연락처 <%=bean.getTel()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;멤버십가입희망여부 <%=bean.getMem()%>
				</td>
			</tr>
		</table><br>
		<div id=member_bottom>
			<a href="index.jsp"><input type="button" value="메인화면" class="member_bt2"></a>
		</div>
		</form>
	</div>
<%
	}catch(Exception e){}
%>	
</body>
</html>