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
					&nbsp;�̸� <%=bean.getName()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;���� <%=bean.getBirth().substring(0,10)%>
				<div id=member_hr></div>
				</td>
			</tr>
			<tr>
			    <td class="member_tr">
				    &nbsp;�ּ�  <%=bean.getAddr()%>
			    	<div id=member_hr></div>
			    </td>
	 		</tr>
			<tr>
				<td class="member_tr">
					&nbsp;�̸���  <%=bean.getEmail()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;����ó <%=bean.getTel()%>
					<div id=member_hr></div>
				</td>
			</tr>
			<tr>
				<td class="member_tr">
					&nbsp;����ʰ���������� <%=bean.getMem()%>
				</td>
			</tr>
		</table><br>
		<div id=member_bottom>
			<a href="index.jsp"><input type="button" value="����ȭ��" class="member_bt2"></a>
		</div>
		</form>
	</div>
<%
	}catch(Exception e){}
%>	
</body>
</html>