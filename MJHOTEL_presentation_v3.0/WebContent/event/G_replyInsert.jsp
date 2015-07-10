<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@ page import="event.common.DBbean2" %>
    <%@ page import="event.common.DBSQL2" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>replyInsert.jsp</title>
</head>

<body>

<%
try{
	response.setContentType("text/html; charset=utf-8");
	request.setCharacterEncoding("utf-8");
	
	DBbean2 bean2 = new DBbean2();
	DBSQL2 dbsql = new DBSQL2();
	
	bean2.setNum(Integer.parseInt(request.getParameter("num")));
	bean2.setR_name(request.getParameter("r_name"));
	bean2.setR_content(request.getParameter("r_content"));
	bean2.setR_passwd(request.getParameter("r_passwd"));
	
	int result = dbsql.insert(bean2);

	response.sendRedirect("../G_event.do?num="+Integer.parseInt(request.getParameter("num")));
}catch(Exception ex){}
%>

</body>
</html>