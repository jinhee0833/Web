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
</style>
</head>
<body>
	<div class="facility">
		
		<%@ include file="sidebar.jsp"%>
		<div id = "f" >
			SAFETY
		</div>
		
		<div id = "m">
		<a href="layout.jsp">Home</a> > <a href="notice.jsp">ABOUT HOTEL</a> > SAFETY

		<h1>SAFETY</h1>

		<table border=0 width=700px;>
		<tr>
		<td colspan=3>
		<font size =4 face=굴림><b>고객안전 관리</b></font><p>
		<font face=굴림 >
		한빛호텔은 고객의 안전을 무엇보다 최우선으로 생각하여 최첨단 시스템 도입 및 운영, 
		자체 교육과 훈련 등을 통해 고객의 안전에 만전을 기하고 있습니다.
		<hr>
		</font>
		</td>
		</tr>
	
		<tr>
		<td valign=top rowspan=2>
		<img src='images/img_safe01.jpg'>
		</td>
		<td valign=top colspan=2>
		<font face=굴림><b>방화설비</b><p>
	
		한빛호텔의 시설을 통제하는 중앙 감시반은 고객의 안전을 위해 최첨단 중앙통제 시
		스템을 도입하여 운영하고 있습니다. 또한, 비상 대기조를 24시간 운영하는 등 완벽한 
		방화 시스템 구축을 통하여 고객의 안전을 위해 항상 노력하고 있습니다.<br>
		</font>
		</td>
		</tr>
		<tr>
	
		<td valign=top>
		<font face=굴림 >
		<br>
			<ul>
				<li>전 객실 방화 마스크</li>
				<li>배연설비&#x2219;방재셔터 &#x2219;스프링쿨러</li>
				<li>자동 화재 탐지 설비</li>
			</ul>
		</font>
		</td>
		<td valign=top width=200px;>
		<font face=굴림 >
		<br>
			<ul>
				<li>비상방송 및 조명장치</li>
				<li>가스누설감지기</li>
			</ul>
		</font>
		</td>
		</tr>
		<tr>
		<td></td>
		<td colspan=2><hr></td>
		</tr>
		
		
		<tr>
		<td valign=top rowspan=2>
		<img src='images/img_safe02.jpg'>
		</td>
		<td valign=top colspan=2>
		<font face=굴림 >
		<b>대피시설</b><p>
	
		한빛호텔에서는 비상사태 발생에 대비하여 고객들이 모두 안전하게 대피 하실 수 있도록 <br>
		대피시설을 확보해서 관리를 하고 있습니다.
		</font>
		</td>
		</tr>
		<tr>
	
		<td valign=top>
		<font face=굴림 >
		<br>
			<ul>
				<li>인명구조용 비상 곤도라</li>
				<li>한빛호텔서울 신관과 본관을 연결하는 비상다리</li>
			</ul>
		</font>
		</td>
		<td valign=top>
		</td>
		</tr>
		<tr>
		<td></td>
		<td colspan=2><hr></td>
		</tr>
		
		<tr>
		<td valign=top rowspan=2>
		<img src='images/img_safe03.jpg'>
		</td>
		<td valign=top colspan=2>
		<font face=굴림 >
		<b>소방 훈련</b><p>
	
		한빛호텔은 특급호텔로서 화재와 재난이 안전이식을 제고하고, 재해 발생 시 피해를 최소화 할 수 있도록
		자율소방대에 의한 소방훈련을 정기적으로 진행하고 있습니다.<br>
		</font> 
		</td>
		</tr>
		<tr>
	
		<td valign=top>
		<font face=굴림 >
		<br>
			<ul>
				<li>소방경진대회</li>
				<li>재난대비 긴급구조 종합훈련</li>
			</ul>
		</font>
		</td>
		<td valign=top>
		</td>
		</tr>
		
		<tr>
		<td colspan=3>
		<hr>
		</td>
		</tr>
		</table>
		
		
		
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>