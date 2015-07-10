<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<title>m_room</title>
<link rel="stylesheet" type="text/css" href="room/css/room.css">
</head>
<body id="room_center">
<div id="room_title"> 
	<div class="room_titleB">
		<span style="font-size:1.5em; padding-right:10px;">ROOM</span>
		<span>고품격 휴식을 경험하세요.</span>
	</div>
</div>
<div id="wrap">
<div id="room_left">
	<ul>
		<li><a href="./index.jsp?page=room/m_room&list=superior">Superior</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=premier">Premier</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=florence">Florence</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=royal">Royal</a></li>
		<li><a href="./index.jsp?page=room/m_room&list=presidential">Presidential</a></li>
	</ul>
</div>
<div id="room_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("superior")){
		pageFile="superior";
	}else if(listFile.equals("premier")){
		pageFile="premier";
	}else if(listFile.equals("florence")){
		pageFile="florence";
	}else if(listFile.equals("royal")){
		pageFile="royal";
	}else if(listFile.equals("presidential")){
		pageFile="presidential";
	}

	if(listFile.equals("superior") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("premier")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("florence")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("royal")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("presidential")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</html>