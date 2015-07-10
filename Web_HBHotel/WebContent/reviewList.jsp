<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.hb.common.DBListBean"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%
String inDate   = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String date = inDate.toString();
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css"
	media="screen">
<style>
A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
}

A:link {
	font: 9pt;
	text-decoration: none;
	color: #000000
}

A:active {
	text-decoration: none;
	color: #990099
}

A:visited {
	text-decoration: none;
	color: #3A3A3A
}

A:hover {
	text-decoration: none;
}

td {
	font-family: Segoe UI Symbol;
	color: black;
}

.facility {
	position: absolute;
	top: 225px;
	margin-left: 0px;
	padding: 0px;
	height: 900px;
	width: 1759px;
	background-color: #ffffff;
}

#f {
	position: absolute;
	margin-left: 230px;
	top: 50px;
	width: 10px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
	font-size: 45px;
}

#m {
	position: absolute;
	margin-left: 500px;
	top: 50px;
	width: 1100px;
	text-decoration: none;
	font-family: 'Nanum Myeongjo';
	color: #81725F;
}
</style>
<script type="text/javascript">
	function search_title(){
		location.href = "delete.do?num="+num;
	}function check(id) {
		if(id==null||id=="null") {alert("로그인 해주세요"); location='login.jsp';}
		else {window.location='reviewWrite.jsp'}
	}
</script>
</head>
<%! private int total;
	private int totalPage;
	private int start;
	private int startPage;
	private int pageSize;
	private int pageNum;
	private int limit;
	private String search;
	private String keyword;
	%>
<body>
	<div class="facility">

		<%@ include file="sidebar.jsp"%>
		<div id="f">Review</div>

		<div id="m">
			<a href="layout.jsp">Home</a> > REVIEW
			<h1>REVIEW</h1>
			<br>

			<table width=700 border=0>
				<%
					try {
						List data = (List) request.getAttribute("list");
						search = String.valueOf(request.getAttribute("search"));
						keyword = String.valueOf(request.getAttribute("keyword"));
						total = Integer.parseInt(String.valueOf(request.getAttribute("total")));
						totalPage = Integer.parseInt(String.valueOf(request.getAttribute("totalPage")));
						start = Integer.parseInt(String.valueOf(request.getAttribute("start")));
						startPage = Integer.parseInt(String.valueOf(request.getAttribute("startPage")));
						limit = Integer.parseInt(String.valueOf(request.getAttribute("limit")));
						pageSize = Integer.parseInt(String.valueOf(request.getAttribute("pageSize")));
				%>
				<tr>
					<td colspan=5 align='right'><font size=3px>총 게시글 수 : <%=total%></font>
					</td>
				</tr>
				<tr bgcolor=#81725F height="35" align="center">
					<td width=10%>번호</td>
					<td width=40%>제목</td>
					<td width=10%>작성자</td>
					<td width=20%>일시</td>
					<td width=10%>조회</td>
				</tr>
				<%
				
				for (int i = start; i < start+limit; i++) {
						if(i == data.size()){
							break;
						}
						DBListBean bean = (DBListBean) data.get(i);
			%>
				<tr height='30'>
					<td align="center" width=50><%=bean.getNum()%></td>
					<td align="center" width=200>
					<a href="detail.do?dt1=<%=bean.getTitle()%>&num=<%=bean.getNum()%>&content=<%=bean.getContent()%>&num=<%=bean.getNum()%>">
						<% 
						String day = bean.getNalja().toString();
						 if(day.equals(date)){ 
							%>
						<img src = "images/new2.gif"/>
						<% } %> 
						<%=bean.getTitle()%>
						</a>&nbsp;
						<%if(bean.getCnt()==0) { %>
							&nbsp;
						<% } else{  %>		
						<a href = "detail.do?dt1=<%=bean.getTitle()%>&num=<%=bean.getNum()%>&content=<%=bean.getContent()%>&num=<%=bean.getNum()%>">
						<font color = red>[<%=bean.getCnt()%>]</font></a>
						<% }%>
					</td>
					<td align="center" width=50><%=bean.getName()%></td>
					<td align="center" width=50><%=bean.getNalja()%></td>
					<td align="center" width=30><%=bean.getReadcount()%></td>
				</tr>
				<%
				}// for	
			%><tr>
				<td colspan=6 align='center'>
					<%
						if (startPage > pageSize) {
							out.println("<a href = list.do?pageNum="
									+ (startPage - pageSize) + "&keyfield=" + search
									+ "&search=" + keyword + ">[이전]" + "</a>");
						}
						for (int i = startPage; i < (startPage + pageSize); i++) {
							if (i == pageNum) {
								out.println("<font color =red> [" + i + "]</font> ");
							} else {
								out.println("<a href = list.do?pageNum=" + i + "&search="
										+ search + "&keyword=" + keyword + ">" + i
										+ "</a>");
							}
							if (i == totalPage) {
								break;
							}
						}
						if (pageSize <= totalPage - startPage) {
							out.println("<a href = list.do?pageNum="
									+ (startPage + pageSize) + "&search=" + search
									+ "&keyword=" + keyword + ">[다음]" + "</a>");
						}
					%>
				</td>
			</tr>
			<% } catch (Exception ex) {
				}%>

				<tr >					
					<td colspan=5 >
					<input type="button" value=글쓰기 style="margin-left: 750px;" onClick="check('<%=loginId%>')">
					<form action = "list.do">
					<select name = "keyword" style="margin-left: 250px;">
						<option value = "title" >제목</option>
						<option value = "user" >작성자</option>
					</select>
					<input type="text" name = "search">
					<input type="submit" value=검색  >
					</form>
					</td>
				</tr>			
			</table>

		</div>
	</div>
<%@ include file="bottom.jsp"%>
</body>
</html>