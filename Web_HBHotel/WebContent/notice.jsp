<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login.jsp</title>
<link rel="Stylesheet" type="text/css" href="css/facility.css" media="screen">
<style>

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
			NOTICE
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a> > PROFILE
		<h1>NOTICE</h1><br>
<img src = "images/main.jpg" style="width:700px; height:300px;">
	<table border=0 bgcolor='#EBEAE9' width=700px>
	<tr>
	<td width='20px'>
	</td>
	<td>
	
	<h1>Touching your Heart</h1>
	<font face=굴림>
		한빛호텔(Hanbit Hotels & Resorts)은 대한민국 호텔입니다.<br>
	한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 러브마크를 지향하고 있습니다.<p>
	
	균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해<br>
	세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다.<br>
	또한 한빛호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다.<p>
	
	<b>한빛호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다.</b>
	</font> 
	<p>
	<br>
	</td>
	<td width='20px'>
	</td>
	</tr>

	</table>

		</div>
		
	</div>
	
</body>

</html>
<%@ include file="bottom.jsp"%>