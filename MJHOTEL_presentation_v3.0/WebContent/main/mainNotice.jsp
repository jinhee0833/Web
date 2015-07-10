<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="notice.common.DBbean" %>
<%@ page import="notice.common.DBsql" %>
<html>
<head>
<title>mainNotice</title>
</head>
<body>
<div class="maintap">
	<div class="tabtable">
	<%
	try{	
		
		DBbean bean=new DBbean();
		DBsql dbsql=new DBsql();
		
		String pnum = request.getParameter("pageNUM");				
		
		List ob = dbsql.dbSelect(pnum);
		request.setAttribute("list", ob);
		
		System.out.println(ob);
		
		int total = dbsql.dbCount();
		request.setAttribute("total",total);
		
		List data = (List)request.getAttribute("list");
		for(int i = 0; i < data.size() ; i++ ){
			bean = (DBbean)data.get(i); 
	%>
		<div class="tabttd1"><%=bean.getSdate() %></div>
		<div class="tabttd2"><a href="G_noticeDetail.do?num=<%=bean.getNum()%>"><%=bean.getTitle() %></a></div>
	<%
		}
	}catch(Exception ex){ ex.toString(); }
	%>
	</div>
</div>			
</body>
</html>