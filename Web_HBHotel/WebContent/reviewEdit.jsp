<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="net.hb.common.DBListBean" %>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>수정하는 창입니다.</title>

<style type="text/css">

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		
		.review{position: absolute;top: 225px;margin-left: 0px; padding:0px; height:900px;width: 1759px;background-color: #ffffff;}		
		#f{position: absolute;margin-left: 200px;top: 30px;width: 10px;text-decoration:none; 
		   font-family: 'Nanum Myeongjo';color:#81725F;font-size:45px;}		
		#m{position: absolute;margin-left: 480px;top: 40px;width: 900px;text-decoration:none; 
		font-family: 'Nanum Myeongjo';color:#81725F;}
	

</style>
</head>

<body>
<div class="review">

			<div id = "f" >
			REVIEW
			</div>
	<%@ include file="sidebar.jsp"%>
	<div id = "m">
				<a href="layout.jsp">Home</a> > REVIEW
			<h1>REVIEW</h1>
			<br>
	<form name=review  method="post" action="edit.do?num=<%=request.getParameter("num")%>"> 		
		<table width="700" height="500">
			<tr>
				<th align=left colspan="2" height=30>
					<font color ="#D45050" size=2px> HANBIT호텔 방문 후기를 남겨주시면,매월 첫째주 월요일 추천을 통하여</font> 레스토랑 식사권
					<font color="#D45050">을 드립니다.</font>
				</th>
			</tr>	
			<tr>
				<th bgcolor="#F4EEE3" align="center">작성자</th>
				<td><input type="text" name="name" id="name" size="40" value =<%=request.getParameter("name") %> readOnly>
				<input type=hidden value=<%=loginId%> id="sname" name="sname" >
				</td>
			</tr>	
			<tr>
				<th  bgcolor="#F4EEE3" align="center">제 목</th>
				<td><input type="text" name="title" size="40" value =<%=request.getParameter("title") %>></td>
			</tr>		
			<tr>
			<th  bgcolor="#F4EEE3" align="center">내 용</th>
				<td><textarea name="content" rows="16" cols="60" ><%=request.getParameter("content") %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#F4EEE3" align="center" height=50>
					<input type="reset" value="취소하기">
					<input type="button" value="목록보기" onClick="window.location='list.do'">
					<input type=submit value=완료 style="width: 100;">
			</tr>
			<% System.out.println("num : " + request.getParameter("num"));
			%>
		</table>	
	</form>
</div>
</div>
</body>
</html>