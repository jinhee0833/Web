<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="room.vo.RoomVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/room/roomDetail.css" type="text/css" media="all" rel="stylesheet" />

<link href="room/css/skitter.styles.css" type="text/css" media="all" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="room/js/jquery.skitter.min.js"></script>
<script src="room/js/jquery.easing.1.3.js"></script>
<script src="room/js/jquery.animate-colors-min.js"></script>

<title>detail room</title>
<script>
$(function() {
		$(".thumbs a").click(function(){	
			var path = $(this).attr("href");
			$(this).parent().prev().find("img").attr({ src: path });
			$(this).parent().prev().find("img").css("opacity","0.5").stop().animate({opacity:2},4000);
			return false;
		});		
	});	
  	
  	$(document).ready(function($){
  		
  		$('.box_skitter_large').skitter({ preview: true });
  		
  	});
</script>
<link href="css/room/roomlist.css" type="text/css" media="all" rel="stylesheet" />
</head>
<body>

<%
	  RoomVO rvo = (RoomVO)request.getAttribute("rvo");
%>
	<div class="roomlistnav">
		<div class="leftsidenav">
			<div class="side" >
				<h2 class="title">Accommodation</h2>

				<ul>
					<a href="select.do?type=S"><li>type S</li></a>
					<a href="DetailRoom.do?roomID=501"><li>501</li></a>
					<a href="DetailRoom.do?roomID=502"><li>502</li></a>
					<a href="DetailRoom.do?roomID=503"><li>503</li></a>
				</ul>
				<ul>
					<a href="select.do?type=A"><li>type A</li></a>
					<a href="DetailRoom.do?roomID=401"><li>401</li></a>
					<a href="DetailRoom.do?roomID=402"><li>402</li></a>
					<a href="DetailRoom.do?roomID=403"><li>403</li></a>
					<a href="DetailRoom.do?roomID=301"><li>301</li></a>
					<a href="DetailRoom.do?roomID=302"><li>302</li></a>
					<a href="DetailRoom.do?roomID=303"><li>303</li></a>
				</ul>
				<ul>
					<a href="select.do?type=B"><li>type B</li></a>
					<a href="DetailRoom.do?roomID=201"><li>201</li></a>
					<a href="DetailRoom.do?roomID=202"><li>202</li></a>
					<a href="DetailRoom.do?roomID=203"><li>203</li></a>
					<a href="DetailRoom.do?roomID=101"><li>101</li></a>
					<a href="DetailRoom.do?roomID=102"><li>102</li></a>
					<a href="DetailRoom.do?roomID=103"><li>103</li></a>
				</ul>
			</div><!-- <div class="side"> -->
		</div><!-- <div class="leftsidenav"> -->
	</div> <!--<div class="roomlistnave"> -->
	
	<div class="roomDetail">
		<div class="box_skitter box_skitter_large">
			<ul>
				<li>
					<a href="#">
					<img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" class="random"  />
					</a>
				</li>	
				<li>
					<a href="#">
					<img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom2()%>"  class="random" />
					</a>
				</li>
				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom3()%>" class="random"/>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom4()%>" class="random"/>
					</a>
				</li>
			</ul>
		</div><!-- <div class="box_skitter box_skitter_large roomlist"> -->
		
	    <div class="thumbs">
	        <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" title="image1"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom1()%>" /></a>
	        <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom2()%>" title="image2"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom2()%>" /></a>
	        <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom3()%>" title="image3"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom3()%>" /></a>
	        <a href="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom4()%>" title="image4"><img src="<%=request.getContextPath()%>/images/room/<%=rvo.getRoom4()%>" /></a>
		</div><!--  <div class="thumbs"> -->
		<ul>
			 <li>
			 		<%=rvo.getRoomInfo1()%>
			 </li>
			 <li>
			 		<%=rvo.getRoomInfo2()%>
			 </li>
			 <li>
			 		<%=rvo.getRoomInfo3()%>
			 </li>
		</ul>
	</div><!-- <div class="roomlistnav"> -->
</body>
</html>