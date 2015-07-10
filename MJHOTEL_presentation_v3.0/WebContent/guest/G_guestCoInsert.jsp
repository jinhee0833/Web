<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_co" %>
<%@ page import="guest.common.DBbean_re" %>
<html>
<head>
<title>guestCoInsert.jsp</title>
</head>
<%
try{
	String id=(String)session.getAttribute("NowUser");
	DBbean_re bb=(DBbean_re)request.getAttribute("detail");
	if(id==null){ id="guest";}
%>
	<form name=cmt action="G_guestCoInsert.do">
	<input type=hidden name=cowriter value=<%=id%>>
	<input type=hidden name=num value=<%=bb.getNum() %>>
	<input type=text name=cmt class="ta">
	<input type=submit value="덧글입력" class="bt">
	</form>
<%	}catch(Exception e){ System.out.println("comment.jsp 예외오류 : "+e.toString()); } %>
</body>
</html>