<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>
<style>

		A:link    { font:9pt; text-decoration:none; color:#000000}
		A:active  { text-decoration:none; color:#990099}
		A:visited { text-decoration:none; color:#3A3A3A}
		A:hover   { text-decoration:none; }
		td{font-family:Segoe UI Symbol;}
		.facility{
		position: absolute;
		top: 230px;
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
			width: 10px;
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

</style>
</head>
<body>
	<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			CEO
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a> > CEO Greeting
		<h1>CEO Greeting</h1>
		<table border=0 width=700px'>
	<tr>
	<td rowspan=2 width='250px'>
	<img src='images/img_CEO.jpg'>
	</td>
	<td valign=top>
	<font size =5><B>
	고객만족을 위해<br>
	따스하고 진실한 “情”을 담겠습니다.</B>
	</font><P>
	고객님 안녕하십니까? <br>
	한빛호텔 홈페이지에 오신 것을 진심으로 환영합니다.<br>
	1938년 개관한 한국 최초의 민간호텔인 ‘반도호텔’로부터 탄생한 한빛호텔은
	1973년 창립이래 고객님의 사랑과 성원에 힘입어 세계적 수준의 경쟁력을 갖춘
	국내 최고의 호텔 & 리조트 그룹으로 성장, 발전해 왔습니다. 그리고 2010년 
	러시아 모스크바에 6성급 호텔 오픈을 시작으로 베트남, 우즈베키스탄, 미국에 해외
	호텔을 운영하며 글로벌 호텔 & 리조트 그룹으로 도약하고 있습니다.<p>
	</td>
	</tr>
	
	<tr>
	<td>
	<P>
	<font size =5><B>
	한빛호텔의 정신은 바로<br>
	고객 사랑의 마음 입니다.
	</B></font><P>
	저희 한빛호텔은 세계 최고 수준의 시설과 서비스를 바탕으로 사랑과 자유, 그리고 
	풍요의 꿈을 실현하는 호텔이 될 것이며,
	‘언제나 그 이상의 고객만족’을 위해 저희 전 임직원은 진심 어린 마음을 모아 고객님 
	한 분 한 분을 모시겠습니다. <br>
	감사합니다.<p>
	
	</td>
	</tr>
	</table>
		</div>
	</div>
</body>
		
<%@ include file="bottom.jsp"%>
</html>