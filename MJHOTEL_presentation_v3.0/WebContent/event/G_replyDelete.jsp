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
<title>G_replydelete</title>
</head>

<body>

<%
try{
	response.setContentType("text/html; charset=utf-8");
	request.setCharacterEncoding("utf-8");
	
	DBbean2 bean2 = new DBbean2();
	DBSQL2 dbsql = new DBSQL2();
	
	bean2.setR_num(Integer.parseInt(request.getParameter("r_num")));
	
	if(request.getParameter("r_passwd") != null){
		bean2.setR_passwd(request.getParameter("r_passwd"));
		dbsql.delete(bean2);
	}//end if
%>
	<form method=post action=G_replyDelete.jsp>
		<input type=hidden name=r_num value="<%= bean2.getR_num() %>">
		<b>비밀번호 :</b>
		<input type=text name=r_passwd><input type=submit value=입력 onclick="window.opener.location.reload(true); self.close(); ">
	</form>
<%
}catch(Exception ex){}
%>
</body>
</html>