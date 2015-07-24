<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.dao.*, member.vo.*" %>
<%@ page import="java.util.*, java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList</title>
</head>
<body>
<%! int total, pageNUM, pageSize=10, startPage, pageCount;
	String returnPage, pnum;%>
<%
		total = (Integer) request.getAttribute("total");
		returnPage = (String) request.getAttribute("returnPage");
		List list = (List) request.getAttribute("list");
		
		pnum = request.getParameter("pageNUM");
		if(pnum==null){pnum="1";}
		pageNUM = Integer.parseInt(pnum);
		startPage=pageNUM-((pageNUM-1)%pageSize);
		if(total%pageSize==0) { pageCount=total/pageSize; }
		else { pageCount=(total/pageSize)+1; }
%>
<div id="adminF">
	<div id="adminF2">
		<form name="reviewlist">
			<div id="admin_title2">회원목록</div>
			<div id="admin_total">회원 수(<%=total%>)</div>
			<table class="table table-striped" >
				<tr class="admin_tableB">
					<td width=10%>NO</td>
					<td width=10%>ID</td>
					<td width=20%>NAME</td>
					<td width=20%>BIRTH</td>
					<td width=20%>TEL</td>
					<td width=10%>MEMBER</td>
					<td width=10%></td>
				</tr>
				<%
			    for(int i=0; i<list.size(); i++){
				DBbean bean = (DBbean)list.get(i);
				%>
				<tr onMouseOver="style.backgroundColor='#ebe7e7'"
					onMouseOut="style.backgroundColor=''">
					<td><%=i+1%></td>
					<td><%=bean.getId()%></td>
					<td><a href="detail.do?id=<%=bean.getId()%>"><%=bean.getName()%></a></td>
					<td><%=bean.getBirth().substring(0,10)%></td>
					<td><%=bean.getTel()%></td>
					<td><%=bean.getMem()%></td>
					<td><a href="delete.do?id=<%=bean.getId()%>"><input type=button value="삭제" class=bt></a></td>
				</tr>
				<%
			}
		%>
			</table>
		</form>
		<div id="admin_page">
<%
			if(startPage>=5){
				out.print("<a href='list.do?pageNUM="+(startPage-pageSize)+"'>◀ 이전</a>&nbsp;");
			}
			for(int i=startPage; i<(startPage+pageSize); i++){
				if(i==pageNUM){ out.println("<font color=#6e6464>"+i+"</font>&nbsp;"); }
				else{
					out.print("<a href='list.do?pageNUM="+i+returnPage+"'>"+i+"</a>&nbsp;");
				}
				if(i>=pageCount) break;
			}
			if(startPage+pageSize<=pageCount){
				out.print("<a href='list.do?pageNUM="+(startPage+pageSize)+"'>다음 ▶</a>");
			}
%>			
		</div>	
	</div>
	<!-- 검색 -->
	<form action="list.do">
		<select name=keyfield class="ta">
			<option value=name>이 름</option>
			<option value=tel>연락처</option>
		</select>
		<input type=text name=keyword class="ta2">
		<input type=submit value="검색" class="bt">
	</form>
</div>	
</body>
</html>