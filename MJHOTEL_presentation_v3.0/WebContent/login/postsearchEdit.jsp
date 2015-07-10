<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*" %>
    <%@page import="net.hb.common.DBSQL" %>
    <%@page import="net.hb.common.DBbean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String search = request.getParameter("addrs");
	DBSQL dbsql = new DBSQL();
	ArrayList<DBbean> list = dbsql.getAddrs(search);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>postsearch</title>
	<script type="text/javascript">
		function getcheck(zipcode, addr){
			opener.signin.zipcode.value = zipcode; //없어도 됨
			opener.signin.addr.value = addr;
			self.close();
		}	

		function sendcheck( ){
			subform.addrs.value=opener.signin.zipcode.value;
		}

	</script>
</head>
<body onLoad="sendcheck( )">

	<form method=get action=postsearchEdit.jsp name=subform >
		<b>주소검색: </b>&nbsp;&nbsp;&nbsp;<input type=text name=addrs /><input type=submit value=검색><p>
		<table border=1>
		<tr>
			<td width=100 align=center>우편번호</td>
			<td width=500 align=center>주소</td>
		</tr>
		<% for(int i=0; i<list.size(); i++){ %>
		<tr>
			<td><%= list.get(i).getZip_code() %></td>
			<td><a href="javascript:getcheck('<%= list.get(i).getZip_code() %>','<%= list.get(i).getAddrs() %>')"><%= list.get(i).getAddrs() %></a></td>
		</tr>	
		<% } %>
		</table>
	</form>

</body>
</html>