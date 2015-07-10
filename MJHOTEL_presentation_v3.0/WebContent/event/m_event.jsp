<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>m_event.jsp</title>
<link rel="stylesheet" type="text/css" href="event/css/event.css">
</head>
<body id="event_center">
<div id="event_title"> 
	<div class="event_titleB">
		<span style="font-size:1.5em; padding-right:10px;">EVENT</span>
		<span>다양한 이벤트를 즐기세요.</span>
	</div>
</div>
<div id="wrap">
<div id="event_left">
	<ul>
		<li><a href="G_event.do?&pageType=now">Now event</a></li>
		<li><a href="G_event.do?&pageType=past">Past event</a></li>
	</ul>
</div>
<div id="event_section">
	<% 
	String pageFile=request.getParameter("page") ;
	String listFile=request.getParameter("list") ;
	if(listFile.equals("G_event")){
		pageFile="/event/G_event";
	}else if(listFile.equals("G_reply")){
		pageFile="/event/G_reply";
	}else if(listFile.equals("G_replyDelete")){
		pageFile="/event/G_replyDelete";
	}else if(listFile.equals("G_replyInsert")){
		pageFile="/event/G_replyInsert";
	}

	if(listFile.equals("G_event") ){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_reply")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_replyDelete")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% }else if(listFile.equals("G_replyInsert")){ %>
	<jsp:include page='<%= pageFile+".jsp" %>' />
	<% } %>
</div>
</div>
</body>
</html>