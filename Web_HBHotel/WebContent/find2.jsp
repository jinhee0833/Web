<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  </script>
	<style>
			td{font-family:굴림; font-size:12px;}
			b{font-family:굴림; font-size:15px;}
			#tabs{
			width:720px;
			}
			
	</style>
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">지하철</a></li>
    <li><a href="#tabs-2">버스</a></li>
  </ul>
  <div id="tabs-1">
    <table width=700px;>
    <tr valign=top>
    <td width=33%>
    <b>서울시내 연결 교통편</b><p>
	
	2호선 신촌역 6번출구에서 정문까지 <br>도보로 8분<br>
	6호선 대흥역 1번출구에서 남문까지 <br>도보로 5분<br>
	경의선 서강대역 1번출구에서 정문까지 <br>도보로 3분<p>
	
	<b>서울역(경부선)에서 오는 길</b><p>
	
	1호선 탑승후 시청역에서 2호선으로 환승하여 신촌역 하차<br>
	(환승 포함하여 신촌역까지 약 30분 소요)<p>
	
	<b>용산역(호남선)에서 오는길</b><p>
	
	1호선 탐승후 시청역에서 2호선으로 환승하여 신촌역 하차<br>
	(환승 포함하여 신촌역까지 약 35분 소요)<p>
	
	
	</td>
	<td width=33%>
	
	<b>청량리역(중앙선)에서 오는 길</b><p>
	
	1호선 탑승 후 시청역에서 2호선으로 환승하여 신촌역 하차<br>
	(환승 포함하여 신촌역까지 40분 소요)<p>
	
	<b>강남고속터미널에서 오는길</b><p>
	
	3호선 탑승 후 을지로3가역에서 2호선으로 환승하여 신촌역에서 하차<br>
	(환승 포함하여 신촌역까지 약 40분 소요)<p>
	
	<b>동서울터미널에서 오는 길</b><p>
	
	강변역에서 2호선 탑승 후 신촌역에서 하차<br>
	(환승 포함하여 신촌역까지 약 40분 소요)<p>
	
	</td>
	<td width=33%>
	<b>남부터미널에서 오는 길</b><p>
	
	3호선 탑승후 을지로3가역에서 2호선으로 환승하여 신촌역에서 하차<br>
	(환승 포함하여 신촌역까지 약 50분 소요)<p>
	
	
	<b>김포공항에서 오는 길</b><p>
	
	공항철도 탑승 후 홍대입구역에서 2호선으로환승하여 신촌역에서 하차<br>
	(환승 포함하여 신촌역까지 35분 소요)<p>
	
	<b>인천공항에서 오는 길</b><p>
	
	공항철도 탑승 후 홍대입구역에서 2호선으로 환승하여 신촌역에서 하차<br>
	(환승 포함하여 신촌역까지 약 70분 소요)<p>
	</td>
    </table>
  </div>
  <div id="tabs-2">
   <table width=700px;>
   <tr>
   <td colspan=2><b>서울시내 연결 교통편</b>
   </td>   
   <td><b>인천공항에서 오는 길</b>
   </td>
   </tr>
    <tr valign=top>
    <td width=18%><b>간선/지선버스:</b>
    </td>
    <td width=32%>110A, 110B, 153, 604, 740,753, 921, 5712, 5714, 6712, 7016, 7616, 7613, 8153번
    </td>
    <td width=50%>1번 입국층 5B 또는 12A 승차장에서 6002번을 타고 신촌 현대백화점 앞에서 하차
					(신촌 현대백화점 앞까지 약 80분 소요, 도로사정에 따라 달라질 수 있음.)
    </td>
    </tr>
    
    <tr valign=top>
    <td width=18%><b>마을버스:</b>
    </td>
    <td width=32%>마포07, 마포11, 마포12, 마포14번
    </td>
    </table>
  </div>
</div>
 
 
</body>
</html>