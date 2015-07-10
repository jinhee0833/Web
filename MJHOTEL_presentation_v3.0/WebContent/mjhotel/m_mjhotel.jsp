<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>m_mjhotel</title>
<link rel="stylesheet" type="text/css" href="mjhotel/css/mjhotel.css">
</head>
<body id="mjhotel_center">
	<div id="mjhotel_title"> 
		<div class="mjhotel_titleB">
			<span style="font-size:1.5em; padding-right:10px;">MJHOTLE</span>
			<span>MJ HOTEL을 소개합니다.</span>
		</div>
	</div>
	<div id="wrap">
		<div id="mjhotle_left">
			<ul>
				<li><a href="./index.jsp?page=mjhotel/m_mjhotel&list=about">About MJ</a></li>
				<li><a href="./index.jsp?page=mjhotel/m_mjhotel&list=award">Awards</a></li>
				<li><a href="./index.jsp?page=mjhotel/m_mjhotel&list=findhotel">Find a Hotel</a></li>
				<li><a href="G_notice.do">Notice</a></li>
				<li><a href="./index.jsp?page=mjhotel/m_mjhotel&list=organization">Organization</a></li>
			</ul>
		</div>
		<div id="mjhotel_section">
			<% 
			String pageFile=request.getParameter("page") ;
			String listFile=request.getParameter("list") ;
			if(listFile.equals("about")){
				pageFile="about";
			}else if(listFile.equals("award")){
				pageFile="award";
			}else if(listFile.equals("findhotel")){
				pageFile="findhotel";
			}else if(listFile.equals("G_notice")){
				pageFile="G_notice";
			}else if(listFile.equals("G_noticeDetail")){
				pageFile="G_noticeDetail";
			}else if(listFile.equals("organization")){
				pageFile="organization";
			}
		
			if(listFile.equals("about") ){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("award")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("findhotel")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("G_notice")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("G_noticeDetail")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% }else if(listFile.equals("organization")){ %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
			<% } %>
		</div>
	</div>
</body>
</html>