<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>shop.jsp</title>

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
		p {margin-left:500px;margin-top:25px;}
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
</style>
</head>
<body>
	<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f">
			FACLITIES
		</div>
		<div id = "f2">
		<a href="layout.jsp">Home</a> > <a href="facility.jsp">FACLITIES</a> > Wedding Hole
		</div>
		<div id = "f3">
		<b>Wedding Hole</b>
		</div>
		<%@ include file="wedding.html"%>
		<p>
		<b><font size="5pt">Eternity - 인생에서 가장 빛나는 순간</font></b><br><br>
		그 순간을 영원히 기억할 수 있도록 HANBIT호텔 웨딩이 도와드립니다.<br>
		섬세한 배려로 최상의 감동을, 크나큰 정성으로 특별한 가치를 선사합니다.<br>
		<p>
		<b><font size="5pt">신비한 기운으로 부귀를 기약하는 신의정원입니다.</font></b><br><br>
		 고품격 럭셔리 컨셉의 신의 정원은 귀족적이고 우아하면서도 세련된 분위기를  <br>
		 연출하고 있으며 500석이라는 규모만큼이나 웅장함을 느낄 수 있는 볼륨감 있는 인테리어로 <br>
		 디자인 되었습니다. 최첨단 무대설비와 조명장비를 갖추고 있으며 웨딩과 컨퍼런스 등 대규모 연회가 가능합니다.<br>
	</div>
	
</body>
<%@ include file="bottom.jsp"%>
</html>