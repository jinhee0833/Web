<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Stylesheet" type="text/css" href="css/menu.css" media="screen">
<style>
.menu{
		position: absolute;
		top: 150px;
		height:78px;
		width: 1759px;
		background-color:#252220;
		
		}
</style>
</head>
<body bgcolor="#252220">
<div class = "menu">
	<div id="m1">
		<ul>
			<li><a href="notice.jsp">ABOUT HOTEL</a>
				<ul>
					<li><a href="noticeList.do">NOTICE</a></li>
					<li><a href="notice.jsp">PROFILE</a></li>
					<li><a href="ceogreeting.jsp">CEO Greeting</a></li>
					<li><a href="history.jsp">HISTORY</a></li>
					<li><a href="visionphilosophy.jsp">Vision & Philosophy</a></li>
					<li><a href="safety.jsp">SAFETY</a></li>					
					<li><a href="find.jsp">FIND A HOTEL</a></li>
					
				</ul>
			</li>
			<li><a href="facility.jsp">FACILITIES</a>
				<ul class="f">
					<li><a href="facility.jsp">MEETING ROOM</a></li>
					<li><a href="dining.jsp">DINING ROOM</a></li>
					<li><a href="shop.jsp">
					WEDDING HOLE</a></li>									
				</ul>
			</li>			
			<li><a href="step1.jsp">RESERVATION</a>
				<ul class="q">
					<li><a href = "step1.jsp">RESERVATION</a>
					<li><a href = "reservationSearch.jsp">SEARCH</a></li>
				</ul>
			<li><a href="standard.jsp">ACCOMODATION</a>
				<ul class="A">
					<li><a href="standard.jsp">STANDARD</a></li>
					<li><a href="sweet.jsp">SWEET ROOM</a></li>
					<li><a href="royal.jsp">
					ROYAL</a></li>									
				</ul>
			</li>
			<li><a href="list.do">MEMBERS</a>
			<ul class="m">
					<li><a href="list.do">REVIEW</a></li>
					<li><a href="qnalist.do">Q&A</a></li>									
				</ul>
			</li>
		</ul>
	</div>
	</div> 
	
</body>
</html>