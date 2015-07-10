<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome MJ HOTEL</title>
<!-- 웹표준화 -->
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=IE9">
<script src="css/html5shiv.js"></script>
<meta name="google-site-verification" content="x9qM2ZwCjmW7EgSuF_-wijZ90RX4r5LevWfGGlv43Pg" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- 초기화 -->
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- 메인스타일 -->
<link rel="stylesheet" type="text/css" href="main/css/main.css">
</head>
<%
	String pageFile=request.getParameter("page") ;	
	String data=request.getParameter("keyfield") ;
	if(pageFile == null || pageFile == ""){
		pageFile = "/main/main";
	}
%>
<body>
<!-- top -->	
	<div>
	<jsp:include page="main/top.jsp" flush="false" />	
	</div>
<!-- mainMenu -->	
	<div>
	<jsp:include page="main/mainMenu.jsp" flush="false" />
	</div>
<!-- main  -->	
	<div>
		<% if(data != null){ %>
			<jsp:include page='./admin/m_admin.jsp' />
		<% }else { %>
			<jsp:include page='<%= pageFile+".jsp" %>' />
		<% } %>	
	</div>	
<!-- bottom -->  	
	<div>
		<jsp:include page="main/bottom.jsp" flush="false" />
	</div>
</body>
</html>