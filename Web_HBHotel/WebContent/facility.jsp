<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>

<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
      @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
		a{text-decoration:none; }
		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
		.facility{
		position: absolute;
		top: 225px;
		margin-left: 0px; 
		padding:0px; 
		height:900px;
		width: 1759px;
		background-color: #ffffff;
		}
		
		#f{
			position: absolute;
			margin-left: 200px; 
			top: 40px;
			width: 700px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:45px;
		}
		
		#m{
			position: absolute;
			margin-left: 700px; 
			top: 50px;
			width: 1100px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			
		}
		#f2{
			position: absolute;
			margin-left: 500px; 
			top: 45px;
			width: 700px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:18px;
			
		}
		#f3{
			position: absolute;
			margin-left: 500px; 
			top: 80px;
			width: 700px;
			text-decoration:none; 
			font-family: 'Nanum Myeongjo';
			color:#81725F;
			font-size:25px;
			
		}
		p{margin-left:500px;margin-top:25px;}
</style>
</head>
<body>
	<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f">
			FACLITIES 
		</div>
		<div id = "f2">
		<a href="layout.jsp">Home</a> > <a href="facility.jsp">FACLITIES</a> > Metting Room
		</div>
		<div id = "f3">
		<b>Metting Room</b>
		</div>
		<%@ include file="hb30.html"%>
		<p>
		<b><font size="5pt">당신의 소중한 만남, HB호텔이 책임지겠습니다.</font></b><br><br>
		품격 있는 가족모임과 대규모 국제회의 등 당신의 성공적인 비즈니스 행사를 위한 최상의 서비스를 준비해 드립니다. 동시통역, <br>
		화상회의 시스템과 대형 스크린 프로젝터 등의 시설을 갖추고 있어 국제회의 등의 행사를 개최할 수 있는 완벽한 공간을 제공합니다.<br>	
		<p>
		<b><font size="5pt">古한 터가 福을 더해드립니다.</font></b><br><br>
		 1층의 대연회장(그랜드볼룸)과 2층의 중, 소연회장이 있습니다. <br>
		 형태에 따라 500명까지 수용할 수 있는 대연회장은 필요에 따라 2개의 방으로 나뉘어져 사용되며<br>
		 환구단의 아름다움을 만끽할 수 있는 2층 연회장은 최대 250명의 연회가 가능한 오키드룸과<br>
		 각종 모임 및 회의에 편리한 4개의 별실로 이루어져 있습니다.
	</div>
	
</body>
<%@ include file="bottom.jsp"%>
</html>