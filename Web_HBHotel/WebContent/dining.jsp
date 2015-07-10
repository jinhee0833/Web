<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>dining.jsp</title>

<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
 	  @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
      @import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);


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
			top: 50px;
			width: 700px;
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
		<a href="layout.jsp">Home</a> > <a href="facility.jsp">FACLITIES</a> > Dining Room
		</div>
		<div id = "f3">
		<b>Dining Room</b>
		</div>
		<%@ include file="dining.html"%>
		
		<p>
		<b><font size="5pt">창 밖으로 도심속의 휴식공간인 신촌을 느낄수 있는 HB호텔.</font></b><br><br>
		신관 35층에 위치한 피에르 가니에르 서울은 차별화된 감각의 인테리어와 북한산과 서울 시내가 한눈에 들어오는<br>
		환상적인 조망을 자랑합니다. 혁신적이고 다양한 조리법과 독특하고 예술적인 감각이 돋보이는 프렌치 퀴진(FRENCH CUISINE)은<br>
		물론 지금까지 국내에서 접할 수 없었던 130여 종의 와인을 포함한 270여 종의 와인 컬렉션, 각 분야 전문가들의 세심한 서비스를<br>
		즐길 수 있는 국내 유일의 프렌치 레스토랑입니다<br>
		<p>
		<b><font size="5pt">DETAILS</font></b><br><br>
		* 국내 호텔 최초로 HACCP 인증 획득<br>
		* 국내 호텔 최초로 국내식약청(KFDA)의 HACCP (식품 위해 요소 중점관리기준) 인증 획득을 통해 완벽한 식품 안전과<br>
		  위생관리 상태를 인정받아 최고의 맛과 서비스뿐 아닌 위생적으로도 안전한 최상의 맛을 전해드리고 있음을 증명하였습니다.<br>

	</div>
	
</body>
<%@ include file="bottom.jsp"%>
</html>