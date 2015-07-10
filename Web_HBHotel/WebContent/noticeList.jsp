<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<%@ page import="java.util.*" %>
<%@ page import="net.hb.common.DBNoticeBean" %>
<html>
<head>


<title>리스트화면</title>
<%!private int startpage; 
	private int pagesize; 
	private int pagecnt; 
	private int pagenum; %>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">

<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol; color:black;}
		.facility{
		position: absolute;
		top: 230px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
		}
		
		#f{
			position: absolute;
			margin-left: 200px; 
			top: 50px;
			width: 10px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
		#m{
			position: absolute;
			margin-left: 500px; 
			top: 50px;
			width: 1100px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
			
		}

</style>
</head>

<body>
	<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			NOTICE
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a> > NOTICE
		<h1>NOTICE</h1>
	<table width="700" >
	<tr height="40" bgcolor="#81725F">
		<td align="center" width="10%" >순서</td>
		<td align="center" width="50%" >제목</td>
		<td align="center" width="20%" >작성자</td>
		<td align="center" width="20%" >작성일</td>
	</tr>
	<%
		try{
			List list = (List)request.getAttribute("select");
			for(int i = 0 ; i<list.size(); i++){
				DBNoticeBean bean = (DBNoticeBean)list.get(i);
	%>
	
	<tr>
	    <td><%=bean.getRn() %>
		<td><a href='noticeDetail.do?dt1=<%=bean.getNum()%>'><%=bean.getTitle()%></a></td>
		<td><%=bean.getWriter() %></td>
		<td><%=bean.getNalja() %></td>
	</tr>
	
	<%
			}
	}catch(Exception ex){}
	%>

	<tr>
	<td colspan="3"  align="center">
	<%
		String filed =request.getParameter("filed");
		String word = request.getParameter("word");
		pagecnt = Integer.parseInt(String.valueOf(request.getAttribute("pagecnt")));
		pagesize= Integer.parseInt(String.valueOf(request.getAttribute("pagesize")));
		startpage = Integer.parseInt(String.valueOf(request.getAttribute("startpage")));
		pagenum = Integer.parseInt(String.valueOf(request.getAttribute("pagenum")));
	   	
		String num = "&filed="+filed+"&word="+word;
		
		if(startpage>pagesize){
			out.println("<a href='list.do?pagenum="+(startpage-pagesize)+num+"'>[이전]</a>");
		}
	
		for(int i = startpage; i<(startpage+pagesize); i++){ 
			if(i>pagecnt){
				break;
			}
			if(i==pagenum){
				out.println("["+i+"]");
			} else{
				out.println("<a href='list.do?pagenum="+i+num+"'>["+i+"]</a>");
			}
		}	
		
		if(pagecnt>startpage+(pagesize-1)){
			out.println("<a href='list.do?pagenum="+(startpage+pagesize)+num+"'>[다음]</a>");
		}
	%>
	</td>
	<td>
	<%
		String master = "master";
	if(master.equals(loginId)){ %>
		<a href="noticeWrite.jsp">글쓰기</a>
	<%}%>
	</td>
	</tr>
	</table>
	<p>
		<table width="600">
			<tr>
				<td align="center">
				<form action="list.do">
					<select name="filed" >
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					</select>
					<input type="text" name="word">
					<input type="submit" value="검색">
				</form>
				</td> 
			</tr>
		</table>
		</div>
	</div>
<%@ include file="bottom.jsp"%>
</body>
</html>