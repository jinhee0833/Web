<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="guest.common.DBbean_re" %>
<%@ page import="guest.common.DBbean_co" %>
<%@ page import="guest.common.DBSQL_co" %>
<%!
	private int startPage;
	private int pageCount;
	private int pageSize=5;
	private int pageNUM;
	private int limit=10;
	private String returnPage;
%>
<html>
<head>
<title>guest.jsp</title>
<link rel="stylesheet" type="text/css" href="guest/css/guest.css">
</head>
<body>
	<%
	try{
	int total=(Integer)request.getAttribute("total");
	returnPage=(String)request.getAttribute("returnPage");
	
	String pnum=request.getParameter("pageNUM");
	if(pnum==null) pnum="1";
	pageNUM=Integer.parseInt(pnum);
	
	int temp=(pageNUM-1)%pageSize;;
	startPage=pageNUM-temp;
	
	if(total%limit==0) { pageCount=total/limit; }
	else { pageCount=(total/limit)+1; }
	
	System.out.println("startPage="+startPage+", pageCount="+pageCount);
	
	List data=(List)request.getAttribute("hotel");
	DBSQL_co dbsql=new DBSQL_co();
	%>
<div id="guestF">
	<div id="guestF2">
		<div id="guest_title2">이용후기</div>
		<div id="guest_total">전체글 (<%=total %>)</div>
		<table id="guest_tableF">
			<tr class="guest_tableB">
				<td width=10%>NO</td>
				<td width=30%>TITLE</td>
				<td width=20%>NAME</td>
				<td width=20%>DATE</td>
				<td width=10%>HIT</td>
				<td width=10%>LIKE</td>
			</tr>
		<%
			for(int i=0; i<data.size(); i++){
				DBbean_re bb=(DBbean_re)data.get(i);
				int hh=dbsql.cototal(bb.getNum());
				
		%>
			<tr onMouseOver="style.backgroundColor='#ebe7e7'" onMouseOut="style.backgroundColor=''">
				<td><%= bb.getNum() %></td>
				<td align=left><a href="G_guestDetail.do?num=<%=bb.getNum()%>"><%= bb.getTitle() %> 
				<%	if(hh>=1){	%>
				<font size=2 color=red>[<%=hh %>]</font>
				<%	} %></a></td>
				<td><%= bb.getWriter() %></td>
				<td><%= bb.getWdate() %></td>
				<td style="color:#ff6600"><%= bb.getCount() %></td>
				<td><%= bb.getReco() %></td>
			</tr>
		<%
			}
		}catch(Exception e){   }
		%>
		</table>
		<div id="guest_page">
			<%
			if(startPage>=5){
				out.print("<a href='G_guest.do?pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>["+i+"]</font>&nbsp;"); }
				else{
					out.print("<a href='G_guest.do?pageNUM="+i+"'>"+i+"</a>&nbsp;");
				}
				if(i>=pageCount) break;
			}
			if(startPage+pageSize<=pageCount){
				out.print("<a href='G_guest.do?pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");
			}
			%>
		</div>
	</div>			
	<!-- 버튼 -->
		<a href='./index.jsp?page=guest/m_guest&list=G_guestInsert' class="bt"><input type='button' value="글쓰기" class="bt"></a>
</div>
</body>
</html>