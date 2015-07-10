<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String user_id = (String) session.getAttribute("user_id");
	String user_name = (String) session.getAttribute("user_name");
	
	if ( user_id == null || user_id.equals(null) || user_id == ""){
		out.print("<script>alert('Login이 필요합니다.');location.href='Login.jsp';</script>");
	}
	//out.print(user_id);
	//out.print(user_name);
%>

