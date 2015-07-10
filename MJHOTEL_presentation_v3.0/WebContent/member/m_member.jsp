<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.common.DBbean" %>
<html>
<head>
<title>m_member</title>
<link rel="stylesheet" type="text/css" href="reservation/css/reservation.css">
</head>
<body id="re_center">
	<div id="re_title"> 
		<div class="re_titleB">
			<span style="font-size:1.5em; padding-right:10px;">MEMBERSHIP</span>
			<span>회원정보 페이지입니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="re_left">
			<ul>
	<%
	try {
		String id = (String)session.getAttribute("NowUser");
	%>	
				<li><a href="memberDetail.do?id=<%=id %>">나의 정보</a></li>
	<%		
		} catch (Exception ex) { }
	%>			
			</ul>
		</div>
		<div id="re_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;

			if(listFile.equals("memberDetail")){
				pageFile="memberDetail";
			}else if(listFile.equals("memberInfo")){
				pageFile="memberInfo";
			}if(listFile.equals("memberEdit")){
				pageFile="memberEdit";
			}
			
			if(listFile.equals("memberDetail")){ %>			
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("memberInfo")){ %>			
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("memberEdit")){ %>			
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% } %>
		</div>
	</div>
</body>
</html>